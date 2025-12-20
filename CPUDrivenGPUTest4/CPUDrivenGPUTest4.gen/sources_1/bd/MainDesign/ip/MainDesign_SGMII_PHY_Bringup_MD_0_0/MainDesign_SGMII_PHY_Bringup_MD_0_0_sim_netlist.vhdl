-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:50:40 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_SGMII_PHY_Bringup_MD_0_0/MainDesign_SGMII_PHY_Bringup_MD_0_0_sim_netlist.vhdl
-- Design      : MainDesign_SGMII_PHY_Bringup_MD_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_RegReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestPHYAddress : out STD_LOGIC_VECTOR ( 1 downto 0 );
    newRequestDevTypeRegister : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestData : out STD_LOGIC_VECTOR ( 13 downto 0 );
    DBG_RegReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : out STD_LOGIC;
    newRequestStart : out STD_LOGIC;
    phyBringupComplete : out STD_LOGIC;
    registerReadReady : in STD_LOGIC;
    dbgRst : in STD_LOGIC;
    registerReadData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clkin25 : in STD_LOGIC;
    registerWriteComplete : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO : entity is "SGMII_PHY_Bringup_MDIO";
end MainDesign_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO;

architecture STRUCTURE of MainDesign_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO is
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \^dbg_regreadindex\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal currentReadRegister : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal currentReadRegister_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \currentState[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[2]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[3]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[3]_i_2_n_0\ : STD_LOGIC;
  signal \currentState[3]_i_3_n_0\ : STD_LOGIC;
  signal \currentState[3]_i_4_n_0\ : STD_LOGIC;
  signal debugReadRegister : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \debugReadRegister[2]_i_1_n_0\ : STD_LOGIC;
  signal \debugReadRegister[3]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[0]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[14]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[1]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[2]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[4]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[7]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[8]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[9]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestData[9]_i_2_n_0\ : STD_LOGIC;
  signal newRequestData_29 : STD_LOGIC_VECTOR ( 14 downto 3 );
  signal \newRequestDevTypeRegister[1]_i_2_n_0\ : STD_LOGIC;
  signal \newRequestDevTypeRegister[2]_i_2_n_0\ : STD_LOGIC;
  signal \newRequestDevTypeRegister[3]_i_2_n_0\ : STD_LOGIC;
  signal \newRequestDevTypeRegister[4]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestDevTypeRegister[4]_i_3_n_0\ : STD_LOGIC;
  signal \newRequestDevTypeRegister[4]_i_4_n_0\ : STD_LOGIC;
  signal \^newrequestiswrite\ : STD_LOGIC;
  signal newRequestIsWrite_i_1_n_0 : STD_LOGIC;
  signal \newRequestPHYAddress[1]_i_1_n_0\ : STD_LOGIC;
  signal \newRequestPHYAddress[1]_i_2_n_0\ : STD_LOGIC;
  signal \^newrequeststart\ : STD_LOGIC;
  signal newRequestStart_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_0_in4_in : STD_LOGIC;
  signal \^phybringupcomplete\ : STD_LOGIC;
  signal phyBringupComplete_i_1_n_0 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \specRegisters[0][15]_i_1_n_0\ : STD_LOGIC;
  signal \specRegisters[0][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[10][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[10]_20\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[11][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[11]_18\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[12]_21\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[13]_1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[14]_10\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[15]_9\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[16]_7\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[17][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[17]_4\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[18][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[18]_13\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[19]_8\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[1]_2\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[20]_11\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[21][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[21]_12\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[22][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[22]_28\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[23][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[23]_6\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[24][15]_i_1_n_0\ : STD_LOGIC;
  signal \specRegisters[25]_5\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[26]_22\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[27]_23\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[28]_24\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[29]_25\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[2]_16\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[30][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[30]_26\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[31][15]_i_1_n_0\ : STD_LOGIC;
  signal \specRegisters[31][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[3]_15\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[4]_14\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[5][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[5][15]_i_3_n_0\ : STD_LOGIC;
  signal \specRegisters[5]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[6]_27\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[7][15]_i_2_n_0\ : STD_LOGIC;
  signal \specRegisters[7]_17\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[8]_19\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters[9]_3\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \specRegisters_reg[0]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[10]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[11]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[12]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[13]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[14]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[15]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[16]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[17]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[18]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[19]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[1]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[20]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[21]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[22]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[23]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[24]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[25]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[26]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[27]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[28]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[29]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[2]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[30]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[31]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[3]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[4]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[6]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[7]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[8]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg[9]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \specRegisters_reg_n_0_[5][0]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][10]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][11]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][12]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][13]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][15]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][1]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][2]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][3]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][4]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][5]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][6]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][7]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][8]\ : STD_LOGIC;
  signal \specRegisters_reg_n_0_[5][9]\ : STD_LOGIC;
  signal waitFinishNextState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \waitFinishNextState[1]_i_1_n_0\ : STD_LOGIC;
  signal \waitFinishNextState[3]_i_1_n_0\ : STD_LOGIC;
  signal \waitFinishNextState_reg_n_0_[0]\ : STD_LOGIC;
  signal \waitFinishNextState_reg_n_0_[1]\ : STD_LOGIC;
  signal \waitFinishNextState_reg_n_0_[2]\ : STD_LOGIC;
  signal \waitFinishNextState_reg_n_0_[3]\ : STD_LOGIC;
  signal writeExtendedRegisterAddr : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal writeExtendedRegisterAddr_30 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \writeExtendedRegisterAddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \writeExtendedRegisterAddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \writeExtendedRegisterAddr_reg_n_0_[4]\ : STD_LOGIC;
  signal writeExtendedRegisterData : STD_LOGIC_VECTOR ( 14 downto 5 );
  signal \writeExtendedRegisterData[14]_i_1_n_0\ : STD_LOGIC;
  signal \writeExtendedRegisterNextState_reg_n_0_[3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \currentReadRegister[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \currentReadRegister[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \currentReadRegister[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \currentReadRegister[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \currentState[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \currentState[3]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \currentState[3]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \debugReadRegister[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \debugReadRegister[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \debugReadRegister[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \debugReadRegister[4]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \newRequestData[11]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \newRequestData[12]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \newRequestData[13]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \newRequestData[14]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \newRequestData[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \newRequestData[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \newRequestData[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \newRequestData[9]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \newRequestDevTypeRegister[1]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \newRequestDevTypeRegister[2]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \newRequestDevTypeRegister[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \newRequestDevTypeRegister[4]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \newRequestDevTypeRegister[4]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \newRequestPHYAddress[1]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \specRegisters[0][15]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \specRegisters[10][15]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \specRegisters[11][15]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \specRegisters[17][15]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \specRegisters[18][15]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \specRegisters[21][15]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \specRegisters[23][15]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \specRegisters[30][15]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \specRegisters[31][15]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \specRegisters[5][15]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \specRegisters[5][15]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \specRegisters[7][15]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \waitFinishNextState[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \waitFinishNextState[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \waitFinishNextState[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \waitFinishNextState[3]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \writeExtendedRegisterAddr[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \writeExtendedRegisterAddr[4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \writeExtendedRegisterData[14]_i_1\ : label is "soft_lutpair17";
begin
  DBG_RegReadIndex(4 downto 0) <= \^dbg_regreadindex\(4 downto 0);
  Q(3 downto 0) <= \^q\(3 downto 0);
  newRequestIsWrite <= \^newrequestiswrite\;
  newRequestStart <= \^newrequeststart\;
  phyBringupComplete <= \^phybringupcomplete\;
\DBG_RegPCSPMAReadData[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(0)
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(0),
      I1 => \specRegisters_reg[14]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(0),
      I1 => \specRegisters_reg[2]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(0),
      I1 => \specRegisters_reg[6]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][0]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(0),
      I1 => \specRegisters_reg[26]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(0),
      I1 => \specRegisters_reg[30]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(0),
      I1 => \specRegisters_reg[18]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(0),
      I1 => \specRegisters_reg[22]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[0]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(0),
      I1 => \specRegisters_reg[10]\(0),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(0),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(0),
      O => \DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(10)
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(10),
      I1 => \specRegisters_reg[14]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(10),
      I1 => \specRegisters_reg[2]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(10),
      I1 => \specRegisters_reg[6]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][10]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(10),
      I1 => \specRegisters_reg[26]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(10),
      I1 => \specRegisters_reg[30]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(10),
      I1 => \specRegisters_reg[18]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(10),
      I1 => \specRegisters_reg[22]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[10]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(10),
      I1 => \specRegisters_reg[10]\(10),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(10),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(10),
      O => \DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(11)
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(11),
      I1 => \specRegisters_reg[14]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(11),
      I1 => \specRegisters_reg[2]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(11),
      I1 => \specRegisters_reg[6]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][11]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(11),
      I1 => \specRegisters_reg[26]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(11),
      I1 => \specRegisters_reg[30]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(11),
      I1 => \specRegisters_reg[18]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(11),
      I1 => \specRegisters_reg[22]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[11]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(11),
      I1 => \specRegisters_reg[10]\(11),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(11),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(11),
      O => \DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(12)
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(12),
      I1 => \specRegisters_reg[14]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(12),
      I1 => \specRegisters_reg[2]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(12),
      I1 => \specRegisters_reg[6]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][12]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(12),
      I1 => \specRegisters_reg[26]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(12),
      I1 => \specRegisters_reg[30]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(12),
      I1 => \specRegisters_reg[18]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(12),
      I1 => \specRegisters_reg[22]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[12]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(12),
      I1 => \specRegisters_reg[10]\(12),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(12),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(12),
      O => \DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(13)
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(13),
      I1 => \specRegisters_reg[14]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(13),
      I1 => \specRegisters_reg[2]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(13),
      I1 => \specRegisters_reg[6]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][13]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(13),
      I1 => \specRegisters_reg[26]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(13),
      I1 => \specRegisters_reg[30]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(13),
      I1 => \specRegisters_reg[18]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(13),
      I1 => \specRegisters_reg[22]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[13]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(13),
      I1 => \specRegisters_reg[10]\(13),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(13),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(13),
      O => \DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(14)
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(14),
      I1 => \specRegisters_reg[14]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(14),
      I1 => \specRegisters_reg[2]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(14),
      I1 => \specRegisters_reg[6]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => p_0_in4_in,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(14),
      I1 => \specRegisters_reg[26]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(14),
      I1 => \specRegisters_reg[30]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(14),
      I1 => \specRegisters_reg[18]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(14),
      I1 => \specRegisters_reg[22]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[14]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(14),
      I1 => \specRegisters_reg[10]\(14),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(14),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(14),
      O => \DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(15)
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(15),
      I1 => \specRegisters_reg[14]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(15),
      I1 => \specRegisters_reg[2]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(15),
      I1 => \specRegisters_reg[6]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][15]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(15),
      I1 => \specRegisters_reg[26]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(15),
      I1 => \specRegisters_reg[30]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(15),
      I1 => \specRegisters_reg[18]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(15),
      I1 => \specRegisters_reg[22]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[15]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(15),
      I1 => \specRegisters_reg[10]\(15),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(15),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(15),
      O => \DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(1)
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(1),
      I1 => \specRegisters_reg[14]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(1),
      I1 => \specRegisters_reg[2]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(1),
      I1 => \specRegisters_reg[6]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][1]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(1),
      I1 => \specRegisters_reg[26]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(1),
      I1 => \specRegisters_reg[30]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(1),
      I1 => \specRegisters_reg[18]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(1),
      I1 => \specRegisters_reg[22]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[1]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(1),
      I1 => \specRegisters_reg[10]\(1),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(1),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(1),
      O => \DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(2)
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(2),
      I1 => \specRegisters_reg[14]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(2),
      I1 => \specRegisters_reg[2]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(2),
      I1 => \specRegisters_reg[6]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][2]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(2),
      I1 => \specRegisters_reg[26]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(2),
      I1 => \specRegisters_reg[30]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(2),
      I1 => \specRegisters_reg[18]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(2),
      I1 => \specRegisters_reg[22]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[2]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(2),
      I1 => \specRegisters_reg[10]\(2),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(2),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(2),
      O => \DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(3)
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(3),
      I1 => \specRegisters_reg[14]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(3),
      I1 => \specRegisters_reg[2]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(3),
      I1 => \specRegisters_reg[6]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][3]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(3),
      I1 => \specRegisters_reg[26]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(3),
      I1 => \specRegisters_reg[30]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(3),
      I1 => \specRegisters_reg[18]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(3),
      I1 => \specRegisters_reg[22]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[3]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(3),
      I1 => \specRegisters_reg[10]\(3),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(3),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(3),
      O => \DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(4)
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(4),
      I1 => \specRegisters_reg[14]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(4),
      I1 => \specRegisters_reg[2]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(4),
      I1 => \specRegisters_reg[6]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][4]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(4),
      I1 => \specRegisters_reg[26]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(4),
      I1 => \specRegisters_reg[30]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(4),
      I1 => \specRegisters_reg[18]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(4),
      I1 => \specRegisters_reg[22]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[4]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(4),
      I1 => \specRegisters_reg[10]\(4),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(4),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(4),
      O => \DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(5)
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(5),
      I1 => \specRegisters_reg[14]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(5),
      I1 => \specRegisters_reg[2]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(5),
      I1 => \specRegisters_reg[6]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][5]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(5),
      I1 => \specRegisters_reg[26]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(5),
      I1 => \specRegisters_reg[30]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(5),
      I1 => \specRegisters_reg[18]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(5),
      I1 => \specRegisters_reg[22]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[5]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(5),
      I1 => \specRegisters_reg[10]\(5),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(5),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(5),
      O => \DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(6)
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(6),
      I1 => \specRegisters_reg[14]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(6),
      I1 => \specRegisters_reg[2]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(6),
      I1 => \specRegisters_reg[6]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][6]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(6),
      I1 => \specRegisters_reg[26]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(6),
      I1 => \specRegisters_reg[30]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(6),
      I1 => \specRegisters_reg[18]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(6),
      I1 => \specRegisters_reg[22]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[6]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(6),
      I1 => \specRegisters_reg[10]\(6),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(6),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(6),
      O => \DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(7)
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(7),
      I1 => \specRegisters_reg[14]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(7),
      I1 => \specRegisters_reg[2]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(7),
      I1 => \specRegisters_reg[6]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][7]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(7),
      I1 => \specRegisters_reg[26]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(7),
      I1 => \specRegisters_reg[30]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(7),
      I1 => \specRegisters_reg[18]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(7),
      I1 => \specRegisters_reg[22]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[7]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(7),
      I1 => \specRegisters_reg[10]\(7),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(7),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(7),
      O => \DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(8)
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(8),
      I1 => \specRegisters_reg[14]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(8),
      I1 => \specRegisters_reg[2]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(8),
      I1 => \specRegisters_reg[6]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][8]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(8),
      I1 => \specRegisters_reg[26]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(8),
      I1 => \specRegisters_reg[30]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(8),
      I1 => \specRegisters_reg[18]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(8),
      I1 => \specRegisters_reg[22]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[8]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(8),
      I1 => \specRegisters_reg[10]\(8),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(8),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(8),
      O => \DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0\,
      I1 => \DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0\,
      I2 => \^dbg_regreadindex\(4),
      I3 => \DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0\,
      I4 => \^dbg_regreadindex\(3),
      I5 => \DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0\,
      O => DBG_RegReadData(9)
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0\,
      I1 => \DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0\,
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[15]\(9),
      I1 => \specRegisters_reg[14]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[13]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[12]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[3]\(9),
      I1 => \specRegisters_reg[2]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[1]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[0]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[7]\(9),
      I1 => \specRegisters_reg[6]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg_n_0_[5][9]\,
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[4]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0\,
      I1 => \DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0\,
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0\,
      I1 => \DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0\,
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0\,
      I1 => \DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0\,
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0\,
      S => \^dbg_regreadindex\(2)
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[27]\(9),
      I1 => \specRegisters_reg[26]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[25]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[24]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[31]\(9),
      I1 => \specRegisters_reg[30]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[29]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[28]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[19]\(9),
      I1 => \specRegisters_reg[18]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[17]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[16]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[23]\(9),
      I1 => \specRegisters_reg[22]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[21]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[20]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0\
    );
\DBG_RegPCSPMAReadData[9]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \specRegisters_reg[11]\(9),
      I1 => \specRegisters_reg[10]\(9),
      I2 => \^dbg_regreadindex\(1),
      I3 => \specRegisters_reg[9]\(9),
      I4 => \^dbg_regreadindex\(0),
      I5 => \specRegisters_reg[8]\(9),
      O => \DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0\
    );
\currentReadRegister[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => registerReadReady,
      I1 => currentReadRegister_reg(0),
      O => currentReadRegister(0)
    );
\currentReadRegister[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => registerReadReady,
      I2 => currentReadRegister_reg(1),
      O => currentReadRegister(1)
    );
\currentReadRegister[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => registerReadReady,
      I3 => currentReadRegister_reg(2),
      O => currentReadRegister(2)
    );
\currentReadRegister[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => currentReadRegister_reg(2),
      I3 => registerReadReady,
      I4 => currentReadRegister_reg(3),
      O => currentReadRegister(3)
    );
\currentReadRegister[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => currentReadRegister_reg(2),
      I2 => currentReadRegister_reg(1),
      I3 => currentReadRegister_reg(0),
      I4 => registerReadReady,
      I5 => currentReadRegister_reg(4),
      O => currentReadRegister(4)
    );
\currentReadRegister_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => currentReadRegister(0),
      Q => currentReadRegister_reg(0),
      R => '0'
    );
\currentReadRegister_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => currentReadRegister(1),
      Q => currentReadRegister_reg(1),
      R => '0'
    );
\currentReadRegister_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => currentReadRegister(2),
      Q => currentReadRegister_reg(2),
      R => '0'
    );
\currentReadRegister_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => currentReadRegister(3),
      Q => currentReadRegister_reg(3),
      R => '0'
    );
\currentReadRegister_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => currentReadRegister(4),
      Q => currentReadRegister_reg(4),
      R => '0'
    );
\currentState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45004005"
    )
        port map (
      I0 => \^q\(0),
      I1 => \waitFinishNextState_reg_n_0_[0]\,
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => \currentState[0]_i_1_n_0\
    );
\currentState[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CEFFCFFC"
    )
        port map (
      I0 => \waitFinishNextState_reg_n_0_[1]\,
      I1 => \^q\(0),
      I2 => \^q\(3),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => \currentState[1]_i_1_n_0\
    );
\currentState[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D7D3C6C6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \waitFinishNextState_reg_n_0_[2]\,
      I4 => \^q\(2),
      O => \currentState[2]_i_1_n_0\
    );
\currentState[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAEAAAA"
    )
        port map (
      I0 => \currentState[3]_i_3_n_0\,
      I1 => p_0_in4_in,
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \currentState[3]_i_4_n_0\,
      O => \currentState[3]_i_1_n_0\
    );
\currentState[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \waitFinishNextState_reg_n_0_[3]\,
      I4 => \^q\(3),
      O => \currentState[3]_i_2_n_0\
    );
\currentState[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FFFBFF"
    )
        port map (
      I0 => registerWriteComplete,
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => \currentState[3]_i_3_n_0\
    );
\currentState[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => currentReadRegister_reg(4),
      I1 => registerReadReady,
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(2),
      I5 => currentReadRegister_reg(3),
      O => \currentState[3]_i_4_n_0\
    );
\currentState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \currentState[3]_i_1_n_0\,
      D => \currentState[0]_i_1_n_0\,
      Q => \^q\(0),
      R => dbgRst
    );
\currentState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \currentState[3]_i_1_n_0\,
      D => \currentState[1]_i_1_n_0\,
      Q => \^q\(1),
      R => dbgRst
    );
\currentState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \currentState[3]_i_1_n_0\,
      D => \currentState[2]_i_1_n_0\,
      Q => \^q\(2),
      R => dbgRst
    );
\currentState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \currentState[3]_i_1_n_0\,
      D => \currentState[3]_i_2_n_0\,
      Q => \^q\(3),
      R => dbgRst
    );
\debugReadRegister[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^dbg_regreadindex\(0),
      O => plusOp(0)
    );
\debugReadRegister[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^dbg_regreadindex\(0),
      I1 => \^dbg_regreadindex\(1),
      O => plusOp(1)
    );
\debugReadRegister[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^dbg_regreadindex\(2),
      I1 => \^dbg_regreadindex\(1),
      I2 => \^dbg_regreadindex\(0),
      O => \debugReadRegister[2]_i_1_n_0\
    );
\debugReadRegister[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^dbg_regreadindex\(3),
      I1 => \^dbg_regreadindex\(2),
      I2 => \^dbg_regreadindex\(0),
      I3 => \^dbg_regreadindex\(1),
      O => \debugReadRegister[3]_i_1_n_0\
    );
\debugReadRegister[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => dbgRst,
      O => debugReadRegister(0)
    );
\debugReadRegister[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^dbg_regreadindex\(4),
      I1 => \^dbg_regreadindex\(1),
      I2 => \^dbg_regreadindex\(0),
      I3 => \^dbg_regreadindex\(2),
      I4 => \^dbg_regreadindex\(3),
      O => plusOp(4)
    );
\debugReadRegister_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => plusOp(0),
      Q => \^dbg_regreadindex\(0),
      R => '0'
    );
\debugReadRegister_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => plusOp(1),
      Q => \^dbg_regreadindex\(1),
      R => '0'
    );
\debugReadRegister_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => \debugReadRegister[2]_i_1_n_0\,
      Q => \^dbg_regreadindex\(2),
      R => '0'
    );
\debugReadRegister_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => \debugReadRegister[3]_i_1_n_0\,
      Q => \^dbg_regreadindex\(3),
      R => '0'
    );
\debugReadRegister_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => debugReadRegister(0),
      D => plusOp(4),
      Q => \^dbg_regreadindex\(4),
      R => '0'
    );
\newRequestData[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00032300"
    )
        port map (
      I0 => \writeExtendedRegisterAddr_reg_n_0_[0]\,
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      O => \newRequestData[0]_i_1_n_0\
    );
\newRequestData[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      O => newRequestData_29(11)
    );
\newRequestData[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(3),
      O => newRequestData_29(12)
    );
\newRequestData[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      O => newRequestData_29(13)
    );
\newRequestData[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"41454151"
    )
        port map (
      I0 => dbgRst,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(2),
      O => \newRequestData[14]_i_1_n_0\
    );
\newRequestData[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"18081818"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => writeExtendedRegisterData(14),
      I4 => \^q\(0),
      O => newRequestData_29(14)
    );
\newRequestData[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002606"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \writeExtendedRegisterAddr_reg_n_0_[1]\,
      I4 => \^q\(3),
      O => \newRequestData[1]_i_1_n_0\
    );
\newRequestData[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0014"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \newRequestData[2]_i_1_n_0\
    );
\newRequestData[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2034"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      O => newRequestData_29(3)
    );
\newRequestData[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055510000115100"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \writeExtendedRegisterAddr_reg_n_0_[4]\,
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \writeExtendedRegisterNextState_reg_n_0_[3]\,
      O => \newRequestData[4]_i_1_n_0\
    );
\newRequestData[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002C002000"
    )
        port map (
      I0 => \writeExtendedRegisterNextState_reg_n_0_[3]\,
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => writeExtendedRegisterData(5),
      I5 => \^q\(3),
      O => newRequestData_29(5)
    );
\newRequestData[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54FA50AA54AA50AA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \writeExtendedRegisterNextState_reg_n_0_[3]\,
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(0),
      I5 => writeExtendedRegisterData(14),
      O => newRequestData_29(6)
    );
\newRequestData[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => writeExtendedRegisterData(14),
      I4 => \^q\(3),
      O => \newRequestData[7]_i_1_n_0\
    );
\newRequestData[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30302000"
    )
        port map (
      I0 => writeExtendedRegisterData(5),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \newRequestData[8]_i_1_n_0\
    );
\newRequestData[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => dbgRst,
      O => \newRequestData[9]_i_1_n_0\
    );
\newRequestData[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => \newRequestData[9]_i_2_n_0\
    );
\newRequestData_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[0]_i_1_n_0\,
      Q => newRequestData(0),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestData_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(11),
      Q => newRequestData(10),
      R => '0'
    );
\newRequestData_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(12),
      Q => newRequestData(11),
      R => '0'
    );
\newRequestData_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(13),
      Q => newRequestData(12),
      R => '0'
    );
\newRequestData_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(14),
      Q => newRequestData(13),
      R => '0'
    );
\newRequestData_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[1]_i_1_n_0\,
      Q => newRequestData(1),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestData_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[2]_i_1_n_0\,
      Q => newRequestData(2),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestData_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(3),
      Q => newRequestData(3),
      R => '0'
    );
\newRequestData_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[4]_i_1_n_0\,
      Q => newRequestData(4),
      R => '0'
    );
\newRequestData_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(5),
      Q => newRequestData(5),
      R => '0'
    );
\newRequestData_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => newRequestData_29(6),
      Q => newRequestData(6),
      R => '0'
    );
\newRequestData_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[7]_i_1_n_0\,
      Q => newRequestData(7),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestData_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[8]_i_1_n_0\,
      Q => newRequestData(8),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestData_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestData[14]_i_1_n_0\,
      D => \newRequestData[9]_i_2_n_0\,
      Q => newRequestData(9),
      S => \newRequestData[9]_i_1_n_0\
    );
\newRequestDevTypeRegister[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0054DC8854545454"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => registerReadReady,
      I4 => currentReadRegister_reg(0),
      I5 => \^q\(3),
      O => p_0_in(0)
    );
\newRequestDevTypeRegister[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22F03F0022003F00"
    )
        port map (
      I0 => \newRequestDevTypeRegister[1]_i_2_n_0\,
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => currentReadRegister(1),
      O => p_0_in(1)
    );
\newRequestDevTypeRegister[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => currentReadRegister_reg(0),
      O => \newRequestDevTypeRegister[1]_i_2_n_0\
    );
\newRequestDevTypeRegister[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333C233C033C233C"
    )
        port map (
      I0 => currentReadRegister(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      I3 => \^q\(2),
      I4 => \^q\(0),
      I5 => \newRequestDevTypeRegister[2]_i_2_n_0\,
      O => p_0_in(2)
    );
\newRequestDevTypeRegister[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(0),
      I2 => currentReadRegister_reg(1),
      O => \newRequestDevTypeRegister[2]_i_2_n_0\
    );
\newRequestDevTypeRegister[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E000200FF00FF0"
    )
        port map (
      I0 => currentReadRegister(3),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \newRequestDevTypeRegister[3]_i_2_n_0\,
      I5 => \^q\(3),
      O => p_0_in(3)
    );
\newRequestDevTypeRegister[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => currentReadRegister_reg(0),
      I2 => currentReadRegister_reg(1),
      I3 => currentReadRegister_reg(2),
      O => \newRequestDevTypeRegister[3]_i_2_n_0\
    );
\newRequestDevTypeRegister[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333010122023333"
    )
        port map (
      I0 => \^q\(2),
      I1 => dbgRst,
      I2 => \^q\(3),
      I3 => registerReadReady,
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \newRequestDevTypeRegister[4]_i_1_n_0\
    );
\newRequestDevTypeRegister[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C00CCCCCC408CCCC"
    )
        port map (
      I0 => registerReadReady,
      I1 => \^q\(3),
      I2 => \newRequestDevTypeRegister[4]_i_3_n_0\,
      I3 => currentReadRegister_reg(4),
      I4 => \newRequestDevTypeRegister[4]_i_4_n_0\,
      I5 => \^q\(0),
      O => p_0_in(4)
    );
\newRequestDevTypeRegister[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => currentReadRegister_reg(2),
      I3 => currentReadRegister_reg(3),
      O => \newRequestDevTypeRegister[4]_i_3_n_0\
    );
\newRequestDevTypeRegister[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      O => \newRequestDevTypeRegister[4]_i_4_n_0\
    );
\newRequestDevTypeRegister_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestDevTypeRegister[4]_i_1_n_0\,
      D => p_0_in(0),
      Q => newRequestDevTypeRegister(0),
      R => '0'
    );
\newRequestDevTypeRegister_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestDevTypeRegister[4]_i_1_n_0\,
      D => p_0_in(1),
      Q => newRequestDevTypeRegister(1),
      R => '0'
    );
\newRequestDevTypeRegister_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestDevTypeRegister[4]_i_1_n_0\,
      D => p_0_in(2),
      Q => newRequestDevTypeRegister(2),
      R => '0'
    );
\newRequestDevTypeRegister_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestDevTypeRegister[4]_i_1_n_0\,
      D => p_0_in(3),
      Q => newRequestDevTypeRegister(3),
      R => '0'
    );
\newRequestDevTypeRegister_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestDevTypeRegister[4]_i_1_n_0\,
      D => p_0_in(4),
      Q => newRequestDevTypeRegister(4),
      R => '0'
    );
newRequestIsWrite_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFBFE50540114"
    )
        port map (
      I0 => dbgRst,
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(0),
      I5 => \^newrequestiswrite\,
      O => newRequestIsWrite_i_1_n_0
    );
newRequestIsWrite_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => newRequestIsWrite_i_1_n_0,
      Q => \^newrequestiswrite\,
      R => '0'
    );
\newRequestPHYAddress[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000001"
    )
        port map (
      I0 => \^q\(1),
      I1 => dbgRst,
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \newRequestPHYAddress[1]_i_1_n_0\
    );
\newRequestPHYAddress[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(3),
      O => \newRequestPHYAddress[1]_i_2_n_0\
    );
\newRequestPHYAddress_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestPHYAddress[1]_i_1_n_0\,
      D => '1',
      Q => newRequestPHYAddress(0),
      R => '0'
    );
\newRequestPHYAddress_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \newRequestPHYAddress[1]_i_1_n_0\,
      D => \newRequestPHYAddress[1]_i_2_n_0\,
      Q => newRequestPHYAddress(1),
      R => '0'
    );
newRequestStart_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFBBFE55040154"
    )
        port map (
      I0 => dbgRst,
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^newrequeststart\,
      O => newRequestStart_i_1_n_0
    );
newRequestStart_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => newRequestStart_i_1_n_0,
      Q => \^newrequeststart\,
      R => '0'
    );
phyBringupComplete_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE10000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => dbgRst,
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^phybringupcomplete\,
      O => phyBringupComplete_i_1_n_0
    );
phyBringupComplete_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => phyBringupComplete_i_1_n_0,
      Q => \^phybringupcomplete\,
      R => '0'
    );
\specRegisters[0][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => currentReadRegister_reg(4),
      I4 => \specRegisters[5][15]_i_3_n_0\,
      I5 => \specRegisters[0][15]_i_2_n_0\,
      O => \specRegisters[0][15]_i_1_n_0\
    );
\specRegisters[0][15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(2),
      I2 => currentReadRegister_reg(1),
      O => \specRegisters[0][15]_i_2_n_0\
    );
\specRegisters[10][15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \specRegisters[5][15]_i_3_n_0\,
      I1 => currentReadRegister_reg(3),
      I2 => currentReadRegister_reg(1),
      I3 => currentReadRegister_reg(0),
      I4 => \specRegisters[10][15]_i_2_n_0\,
      O => \specRegisters[10]_20\(0)
    );
\specRegisters[10][15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFB"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => currentReadRegister_reg(4),
      O => \specRegisters[10][15]_i_2_n_0\
    );
\specRegisters[11][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => \specRegisters[5][15]_i_3_n_0\,
      I1 => currentReadRegister_reg(3),
      I2 => \specRegisters[11][15]_i_2_n_0\,
      I3 => currentReadRegister_reg(4),
      I4 => \^q\(0),
      I5 => \^q\(3),
      O => \specRegisters[11]_18\(0)
    );
\specRegisters[11][15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(0),
      I2 => currentReadRegister_reg(1),
      O => \specRegisters[11][15]_i_2_n_0\
    );
\specRegisters[12][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \specRegisters[30][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(1),
      I5 => \specRegisters[5][15]_i_3_n_0\,
      O => \specRegisters[12]_21\(0)
    );
\specRegisters[13][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => \specRegisters[30][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(2),
      I5 => \specRegisters[5][15]_i_3_n_0\,
      O => \specRegisters[13]_1\(0)
    );
\specRegisters[14][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => \specRegisters[23][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(2),
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(0),
      I5 => currentReadRegister_reg(3),
      O => \specRegisters[14]_10\(0)
    );
\specRegisters[15][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \specRegisters[23][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(0),
      I2 => currentReadRegister_reg(1),
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(4),
      O => \specRegisters[15]_9\(0)
    );
\specRegisters[16][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => currentReadRegister_reg(2),
      I2 => currentReadRegister_reg(0),
      I3 => \specRegisters[23][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(4),
      O => \specRegisters[16]_7\(0)
    );
\specRegisters[17][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => \specRegisters[17][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(3),
      I3 => \specRegisters[31][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(2),
      I5 => \specRegisters[5][15]_i_3_n_0\,
      O => \specRegisters[17]_4\(0)
    );
\specRegisters[17][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => currentReadRegister_reg(0),
      O => \specRegisters[17][15]_i_2_n_0\
    );
\specRegisters[18][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => currentReadRegister_reg(4),
      I1 => \specRegisters[18][15]_i_2_n_0\,
      I2 => currentReadRegister_reg(3),
      I3 => \specRegisters[31][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(2),
      I5 => \specRegisters[5][15]_i_3_n_0\,
      O => \specRegisters[18]_13\(0)
    );
\specRegisters[18][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => currentReadRegister_reg(0),
      O => \specRegisters[18][15]_i_2_n_0\
    );
\specRegisters[19][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080000000000"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => currentReadRegister_reg(0),
      I2 => currentReadRegister_reg(2),
      I3 => \specRegisters[23][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(4),
      O => \specRegisters[19]_8\(0)
    );
\specRegisters[1][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => \specRegisters[5][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(2),
      O => \specRegisters[1]_2\(0)
    );
\specRegisters[20][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(3),
      I4 => \specRegisters[31][15]_i_2_n_0\,
      I5 => \specRegisters[21][15]_i_2_n_0\,
      O => \specRegisters[20]_11\(0)
    );
\specRegisters[21][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000800000"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(3),
      I4 => \specRegisters[31][15]_i_2_n_0\,
      I5 => \specRegisters[21][15]_i_2_n_0\,
      O => \specRegisters[21]_12\(0)
    );
\specRegisters[21][15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => registerReadReady,
      I2 => dbgRst,
      I3 => \^q\(2),
      O => \specRegisters[21][15]_i_2_n_0\
    );
\specRegisters[22][15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \specRegisters[22][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(3),
      I2 => currentReadRegister_reg(4),
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(2),
      O => \specRegisters[22]_28\(0)
    );
\specRegisters[22][15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => dbgRst,
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => registerReadReady,
      I5 => currentReadRegister_reg(0),
      O => \specRegisters[22][15]_i_2_n_0\
    );
\specRegisters[23][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => \specRegisters[23][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(3),
      I2 => currentReadRegister_reg(4),
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(1),
      I5 => currentReadRegister_reg(0),
      O => \specRegisters[23]_6\(0)
    );
\specRegisters[23][15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => registerReadReady,
      I3 => dbgRst,
      I4 => \^q\(2),
      O => \specRegisters[23][15]_i_2_n_0\
    );
\specRegisters[24][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \specRegisters[30][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(2),
      I5 => currentReadRegister_reg(0),
      O => \specRegisters[24][15]_i_1_n_0\
    );
\specRegisters[25][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => \specRegisters[5][15]_i_3_n_0\,
      I2 => \specRegisters[30][15]_i_2_n_0\,
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(0),
      I5 => currentReadRegister_reg(4),
      O => \specRegisters[25]_5\(0)
    );
\specRegisters[26][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => currentReadRegister_reg(4),
      I1 => currentReadRegister_reg(1),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(2),
      I4 => \specRegisters[5][15]_i_3_n_0\,
      I5 => \specRegisters[30][15]_i_2_n_0\,
      O => \specRegisters[26]_22\(0)
    );
\specRegisters[27][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => \specRegisters[30][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(0),
      I5 => currentReadRegister_reg(2),
      O => \specRegisters[27]_23\(0)
    );
\specRegisters[28][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => currentReadRegister_reg(1),
      I1 => \specRegisters[5][15]_i_3_n_0\,
      I2 => \specRegisters[30][15]_i_2_n_0\,
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(4),
      I5 => currentReadRegister_reg(0),
      O => \specRegisters[28]_24\(0)
    );
\specRegisters[29][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(1),
      I4 => \specRegisters[5][15]_i_3_n_0\,
      I5 => \specRegisters[30][15]_i_2_n_0\,
      O => \specRegisters[29]_25\(0)
    );
\specRegisters[2][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => \specRegisters[5][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(2),
      O => \specRegisters[2]_16\(0)
    );
\specRegisters[30][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => \specRegisters[5][15]_i_3_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(0),
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(1),
      I5 => \specRegisters[30][15]_i_2_n_0\,
      O => \specRegisters[30]_26\(0)
    );
\specRegisters[30][15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => \^q\(0),
      I2 => \^q\(3),
      O => \specRegisters[30][15]_i_2_n_0\
    );
\specRegisters[31][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => \newRequestDevTypeRegister[4]_i_3_n_0\,
      I1 => registerReadReady,
      I2 => currentReadRegister_reg(4),
      I3 => dbgRst,
      I4 => \^q\(2),
      I5 => \specRegisters[31][15]_i_2_n_0\,
      O => \specRegisters[31][15]_i_1_n_0\
    );
\specRegisters[31][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      O => \specRegisters[31][15]_i_2_n_0\
    );
\specRegisters[3][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => currentReadRegister_reg(0),
      I1 => currentReadRegister_reg(1),
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => \specRegisters[5][15]_i_2_n_0\,
      I4 => currentReadRegister_reg(3),
      I5 => currentReadRegister_reg(2),
      O => \specRegisters[3]_15\(0)
    );
\specRegisters[4][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => currentReadRegister_reg(4),
      I1 => \specRegisters[31][15]_i_2_n_0\,
      I2 => currentReadRegister_reg(3),
      I3 => currentReadRegister_reg(0),
      I4 => currentReadRegister_reg(2),
      I5 => \specRegisters[21][15]_i_2_n_0\,
      O => \specRegisters[4]_14\(0)
    );
\specRegisters[5][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => \specRegisters[5][15]_i_2_n_0\,
      I2 => \specRegisters[5][15]_i_3_n_0\,
      I3 => currentReadRegister_reg(2),
      I4 => currentReadRegister_reg(1),
      I5 => currentReadRegister_reg(0),
      O => \specRegisters[5]_0\(0)
    );
\specRegisters[5][15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => currentReadRegister_reg(4),
      I1 => \^q\(0),
      I2 => \^q\(3),
      O => \specRegisters[5][15]_i_2_n_0\
    );
\specRegisters[5][15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^q\(2),
      I1 => dbgRst,
      I2 => registerReadReady,
      O => \specRegisters[5][15]_i_3_n_0\
    );
\specRegisters[6][15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \specRegisters[22][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(4),
      I2 => currentReadRegister_reg(2),
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(3),
      O => \specRegisters[6]_27\(0)
    );
\specRegisters[7][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => currentReadRegister_reg(3),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => currentReadRegister_reg(4),
      I4 => \specRegisters[5][15]_i_3_n_0\,
      I5 => \specRegisters[7][15]_i_2_n_0\,
      O => \specRegisters[7]_17\(0)
    );
\specRegisters[7][15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => currentReadRegister_reg(2),
      I1 => currentReadRegister_reg(1),
      I2 => currentReadRegister_reg(0),
      O => \specRegisters[7][15]_i_2_n_0\
    );
\specRegisters[8][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \specRegisters[21][15]_i_2_n_0\,
      I1 => currentReadRegister_reg(2),
      I2 => \specRegisters[31][15]_i_2_n_0\,
      I3 => currentReadRegister_reg(4),
      I4 => currentReadRegister_reg(0),
      I5 => currentReadRegister_reg(3),
      O => \specRegisters[8]_19\(0)
    );
\specRegisters[9][15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \specRegisters[5][15]_i_3_n_0\,
      I1 => currentReadRegister_reg(3),
      I2 => \specRegisters[10][15]_i_2_n_0\,
      I3 => currentReadRegister_reg(1),
      I4 => currentReadRegister_reg(0),
      O => \specRegisters[9]_3\(0)
    );
\specRegisters_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(0),
      Q => \specRegisters_reg[0]\(0),
      R => '0'
    );
\specRegisters_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(10),
      Q => \specRegisters_reg[0]\(10),
      R => '0'
    );
\specRegisters_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(11),
      Q => \specRegisters_reg[0]\(11),
      R => '0'
    );
\specRegisters_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(12),
      Q => \specRegisters_reg[0]\(12),
      R => '0'
    );
\specRegisters_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(13),
      Q => \specRegisters_reg[0]\(13),
      R => '0'
    );
\specRegisters_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(14),
      Q => \specRegisters_reg[0]\(14),
      R => '0'
    );
\specRegisters_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(15),
      Q => \specRegisters_reg[0]\(15),
      R => '0'
    );
\specRegisters_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(1),
      Q => \specRegisters_reg[0]\(1),
      R => '0'
    );
\specRegisters_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(2),
      Q => \specRegisters_reg[0]\(2),
      R => '0'
    );
\specRegisters_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(3),
      Q => \specRegisters_reg[0]\(3),
      R => '0'
    );
\specRegisters_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(4),
      Q => \specRegisters_reg[0]\(4),
      R => '0'
    );
\specRegisters_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(5),
      Q => \specRegisters_reg[0]\(5),
      R => '0'
    );
\specRegisters_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(6),
      Q => \specRegisters_reg[0]\(6),
      R => '0'
    );
\specRegisters_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(7),
      Q => \specRegisters_reg[0]\(7),
      R => '0'
    );
\specRegisters_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(8),
      Q => \specRegisters_reg[0]\(8),
      R => '0'
    );
\specRegisters_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[0][15]_i_1_n_0\,
      D => registerReadData(9),
      Q => \specRegisters_reg[0]\(9),
      R => '0'
    );
\specRegisters_reg[10][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[10]\(0),
      R => '0'
    );
\specRegisters_reg[10][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[10]\(10),
      R => '0'
    );
\specRegisters_reg[10][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[10]\(11),
      R => '0'
    );
\specRegisters_reg[10][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[10]\(12),
      R => '0'
    );
\specRegisters_reg[10][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[10]\(13),
      R => '0'
    );
\specRegisters_reg[10][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[10]\(14),
      R => '0'
    );
\specRegisters_reg[10][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[10]\(15),
      R => '0'
    );
\specRegisters_reg[10][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[10]\(1),
      R => '0'
    );
\specRegisters_reg[10][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[10]\(2),
      R => '0'
    );
\specRegisters_reg[10][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[10]\(3),
      R => '0'
    );
\specRegisters_reg[10][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[10]\(4),
      R => '0'
    );
\specRegisters_reg[10][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[10]\(5),
      R => '0'
    );
\specRegisters_reg[10][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[10]\(6),
      R => '0'
    );
\specRegisters_reg[10][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[10]\(7),
      R => '0'
    );
\specRegisters_reg[10][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[10]\(8),
      R => '0'
    );
\specRegisters_reg[10][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[10]_20\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[10]\(9),
      R => '0'
    );
\specRegisters_reg[11][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[11]\(0),
      R => '0'
    );
\specRegisters_reg[11][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[11]\(10),
      R => '0'
    );
\specRegisters_reg[11][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[11]\(11),
      R => '0'
    );
\specRegisters_reg[11][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[11]\(12),
      R => '0'
    );
\specRegisters_reg[11][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[11]\(13),
      R => '0'
    );
\specRegisters_reg[11][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[11]\(14),
      R => '0'
    );
\specRegisters_reg[11][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[11]\(15),
      R => '0'
    );
\specRegisters_reg[11][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[11]\(1),
      R => '0'
    );
\specRegisters_reg[11][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[11]\(2),
      R => '0'
    );
\specRegisters_reg[11][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[11]\(3),
      R => '0'
    );
\specRegisters_reg[11][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[11]\(4),
      R => '0'
    );
\specRegisters_reg[11][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[11]\(5),
      R => '0'
    );
\specRegisters_reg[11][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[11]\(6),
      R => '0'
    );
\specRegisters_reg[11][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[11]\(7),
      R => '0'
    );
\specRegisters_reg[11][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[11]\(8),
      R => '0'
    );
\specRegisters_reg[11][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[11]_18\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[11]\(9),
      R => '0'
    );
\specRegisters_reg[12][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[12]\(0),
      R => '0'
    );
\specRegisters_reg[12][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[12]\(10),
      R => '0'
    );
\specRegisters_reg[12][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[12]\(11),
      R => '0'
    );
\specRegisters_reg[12][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[12]\(12),
      R => '0'
    );
\specRegisters_reg[12][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[12]\(13),
      R => '0'
    );
\specRegisters_reg[12][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[12]\(14),
      R => '0'
    );
\specRegisters_reg[12][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[12]\(15),
      R => '0'
    );
\specRegisters_reg[12][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[12]\(1),
      R => '0'
    );
\specRegisters_reg[12][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[12]\(2),
      R => '0'
    );
\specRegisters_reg[12][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[12]\(3),
      R => '0'
    );
\specRegisters_reg[12][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[12]\(4),
      R => '0'
    );
\specRegisters_reg[12][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[12]\(5),
      R => '0'
    );
\specRegisters_reg[12][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[12]\(6),
      R => '0'
    );
\specRegisters_reg[12][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[12]\(7),
      R => '0'
    );
\specRegisters_reg[12][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[12]\(8),
      R => '0'
    );
\specRegisters_reg[12][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[12]_21\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[12]\(9),
      R => '0'
    );
\specRegisters_reg[13][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[13]\(0),
      R => '0'
    );
\specRegisters_reg[13][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[13]\(10),
      R => '0'
    );
\specRegisters_reg[13][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[13]\(11),
      R => '0'
    );
\specRegisters_reg[13][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[13]\(12),
      R => '0'
    );
\specRegisters_reg[13][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[13]\(13),
      R => '0'
    );
\specRegisters_reg[13][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[13]\(14),
      R => '0'
    );
\specRegisters_reg[13][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[13]\(15),
      R => '0'
    );
\specRegisters_reg[13][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[13]\(1),
      R => '0'
    );
\specRegisters_reg[13][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[13]\(2),
      R => '0'
    );
\specRegisters_reg[13][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[13]\(3),
      R => '0'
    );
\specRegisters_reg[13][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[13]\(4),
      R => '0'
    );
\specRegisters_reg[13][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[13]\(5),
      R => '0'
    );
\specRegisters_reg[13][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[13]\(6),
      R => '0'
    );
\specRegisters_reg[13][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[13]\(7),
      R => '0'
    );
\specRegisters_reg[13][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[13]\(8),
      R => '0'
    );
\specRegisters_reg[13][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[13]_1\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[13]\(9),
      R => '0'
    );
\specRegisters_reg[14][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[14]\(0),
      R => '0'
    );
\specRegisters_reg[14][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[14]\(10),
      R => '0'
    );
\specRegisters_reg[14][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[14]\(11),
      R => '0'
    );
\specRegisters_reg[14][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[14]\(12),
      R => '0'
    );
\specRegisters_reg[14][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[14]\(13),
      R => '0'
    );
\specRegisters_reg[14][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[14]\(14),
      R => '0'
    );
\specRegisters_reg[14][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[14]\(15),
      R => '0'
    );
\specRegisters_reg[14][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[14]\(1),
      R => '0'
    );
\specRegisters_reg[14][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[14]\(2),
      R => '0'
    );
\specRegisters_reg[14][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[14]\(3),
      R => '0'
    );
\specRegisters_reg[14][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[14]\(4),
      R => '0'
    );
\specRegisters_reg[14][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[14]\(5),
      R => '0'
    );
\specRegisters_reg[14][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[14]\(6),
      R => '0'
    );
\specRegisters_reg[14][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[14]\(7),
      R => '0'
    );
\specRegisters_reg[14][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[14]\(8),
      R => '0'
    );
\specRegisters_reg[14][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[14]_10\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[14]\(9),
      R => '0'
    );
\specRegisters_reg[15][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[15]\(0),
      R => '0'
    );
\specRegisters_reg[15][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[15]\(10),
      R => '0'
    );
\specRegisters_reg[15][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[15]\(11),
      R => '0'
    );
\specRegisters_reg[15][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[15]\(12),
      R => '0'
    );
\specRegisters_reg[15][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[15]\(13),
      R => '0'
    );
\specRegisters_reg[15][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[15]\(14),
      R => '0'
    );
\specRegisters_reg[15][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[15]\(15),
      R => '0'
    );
\specRegisters_reg[15][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[15]\(1),
      R => '0'
    );
\specRegisters_reg[15][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[15]\(2),
      R => '0'
    );
\specRegisters_reg[15][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[15]\(3),
      R => '0'
    );
\specRegisters_reg[15][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[15]\(4),
      R => '0'
    );
\specRegisters_reg[15][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[15]\(5),
      R => '0'
    );
\specRegisters_reg[15][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[15]\(6),
      R => '0'
    );
\specRegisters_reg[15][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[15]\(7),
      R => '0'
    );
\specRegisters_reg[15][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[15]\(8),
      R => '0'
    );
\specRegisters_reg[15][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[15]_9\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[15]\(9),
      R => '0'
    );
\specRegisters_reg[16][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[16]\(0),
      R => '0'
    );
\specRegisters_reg[16][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[16]\(10),
      R => '0'
    );
\specRegisters_reg[16][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[16]\(11),
      R => '0'
    );
\specRegisters_reg[16][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[16]\(12),
      R => '0'
    );
\specRegisters_reg[16][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[16]\(13),
      R => '0'
    );
\specRegisters_reg[16][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[16]\(14),
      R => '0'
    );
\specRegisters_reg[16][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[16]\(15),
      R => '0'
    );
\specRegisters_reg[16][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[16]\(1),
      R => '0'
    );
\specRegisters_reg[16][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[16]\(2),
      R => '0'
    );
\specRegisters_reg[16][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[16]\(3),
      R => '0'
    );
\specRegisters_reg[16][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[16]\(4),
      R => '0'
    );
\specRegisters_reg[16][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[16]\(5),
      R => '0'
    );
\specRegisters_reg[16][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[16]\(6),
      R => '0'
    );
\specRegisters_reg[16][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[16]\(7),
      R => '0'
    );
\specRegisters_reg[16][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[16]\(8),
      R => '0'
    );
\specRegisters_reg[16][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[16]_7\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[16]\(9),
      R => '0'
    );
\specRegisters_reg[17][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[17]\(0),
      R => '0'
    );
\specRegisters_reg[17][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[17]\(10),
      R => '0'
    );
\specRegisters_reg[17][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[17]\(11),
      R => '0'
    );
\specRegisters_reg[17][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[17]\(12),
      R => '0'
    );
\specRegisters_reg[17][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[17]\(13),
      R => '0'
    );
\specRegisters_reg[17][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[17]\(14),
      R => '0'
    );
\specRegisters_reg[17][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[17]\(15),
      R => '0'
    );
\specRegisters_reg[17][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[17]\(1),
      R => '0'
    );
\specRegisters_reg[17][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[17]\(2),
      R => '0'
    );
\specRegisters_reg[17][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[17]\(3),
      R => '0'
    );
\specRegisters_reg[17][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[17]\(4),
      R => '0'
    );
\specRegisters_reg[17][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[17]\(5),
      R => '0'
    );
\specRegisters_reg[17][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[17]\(6),
      R => '0'
    );
\specRegisters_reg[17][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[17]\(7),
      R => '0'
    );
\specRegisters_reg[17][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[17]\(8),
      R => '0'
    );
\specRegisters_reg[17][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[17]_4\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[17]\(9),
      R => '0'
    );
\specRegisters_reg[18][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[18]\(0),
      R => '0'
    );
\specRegisters_reg[18][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[18]\(10),
      R => '0'
    );
\specRegisters_reg[18][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[18]\(11),
      R => '0'
    );
\specRegisters_reg[18][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[18]\(12),
      R => '0'
    );
\specRegisters_reg[18][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[18]\(13),
      R => '0'
    );
\specRegisters_reg[18][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[18]\(14),
      R => '0'
    );
\specRegisters_reg[18][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[18]\(15),
      R => '0'
    );
\specRegisters_reg[18][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[18]\(1),
      R => '0'
    );
\specRegisters_reg[18][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[18]\(2),
      R => '0'
    );
\specRegisters_reg[18][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[18]\(3),
      R => '0'
    );
\specRegisters_reg[18][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[18]\(4),
      R => '0'
    );
\specRegisters_reg[18][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[18]\(5),
      R => '0'
    );
\specRegisters_reg[18][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[18]\(6),
      R => '0'
    );
\specRegisters_reg[18][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[18]\(7),
      R => '0'
    );
\specRegisters_reg[18][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[18]\(8),
      R => '0'
    );
\specRegisters_reg[18][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[18]_13\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[18]\(9),
      R => '0'
    );
\specRegisters_reg[19][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[19]\(0),
      R => '0'
    );
\specRegisters_reg[19][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[19]\(10),
      R => '0'
    );
\specRegisters_reg[19][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[19]\(11),
      R => '0'
    );
\specRegisters_reg[19][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[19]\(12),
      R => '0'
    );
\specRegisters_reg[19][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[19]\(13),
      R => '0'
    );
\specRegisters_reg[19][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[19]\(14),
      R => '0'
    );
\specRegisters_reg[19][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[19]\(15),
      R => '0'
    );
\specRegisters_reg[19][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[19]\(1),
      R => '0'
    );
\specRegisters_reg[19][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[19]\(2),
      R => '0'
    );
\specRegisters_reg[19][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[19]\(3),
      R => '0'
    );
\specRegisters_reg[19][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[19]\(4),
      R => '0'
    );
\specRegisters_reg[19][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[19]\(5),
      R => '0'
    );
\specRegisters_reg[19][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[19]\(6),
      R => '0'
    );
\specRegisters_reg[19][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[19]\(7),
      R => '0'
    );
\specRegisters_reg[19][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[19]\(8),
      R => '0'
    );
\specRegisters_reg[19][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[19]_8\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[19]\(9),
      R => '0'
    );
\specRegisters_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[1]\(0),
      R => '0'
    );
\specRegisters_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[1]\(10),
      R => '0'
    );
\specRegisters_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[1]\(11),
      R => '0'
    );
\specRegisters_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[1]\(12),
      R => '0'
    );
\specRegisters_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[1]\(13),
      R => '0'
    );
\specRegisters_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[1]\(14),
      R => '0'
    );
\specRegisters_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[1]\(15),
      R => '0'
    );
\specRegisters_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[1]\(1),
      R => '0'
    );
\specRegisters_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[1]\(2),
      R => '0'
    );
\specRegisters_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[1]\(3),
      R => '0'
    );
\specRegisters_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[1]\(4),
      R => '0'
    );
\specRegisters_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[1]\(5),
      R => '0'
    );
\specRegisters_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[1]\(6),
      R => '0'
    );
\specRegisters_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[1]\(7),
      R => '0'
    );
\specRegisters_reg[1][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[1]\(8),
      R => '0'
    );
\specRegisters_reg[1][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[1]_2\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[1]\(9),
      R => '0'
    );
\specRegisters_reg[20][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[20]\(0),
      R => '0'
    );
\specRegisters_reg[20][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[20]\(10),
      R => '0'
    );
\specRegisters_reg[20][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[20]\(11),
      R => '0'
    );
\specRegisters_reg[20][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[20]\(12),
      R => '0'
    );
\specRegisters_reg[20][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[20]\(13),
      R => '0'
    );
\specRegisters_reg[20][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[20]\(14),
      R => '0'
    );
\specRegisters_reg[20][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[20]\(15),
      R => '0'
    );
\specRegisters_reg[20][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[20]\(1),
      R => '0'
    );
\specRegisters_reg[20][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[20]\(2),
      R => '0'
    );
\specRegisters_reg[20][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[20]\(3),
      R => '0'
    );
\specRegisters_reg[20][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[20]\(4),
      R => '0'
    );
\specRegisters_reg[20][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[20]\(5),
      R => '0'
    );
\specRegisters_reg[20][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[20]\(6),
      R => '0'
    );
\specRegisters_reg[20][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[20]\(7),
      R => '0'
    );
\specRegisters_reg[20][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[20]\(8),
      R => '0'
    );
\specRegisters_reg[20][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[20]_11\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[20]\(9),
      R => '0'
    );
\specRegisters_reg[21][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[21]\(0),
      R => '0'
    );
\specRegisters_reg[21][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[21]\(10),
      R => '0'
    );
\specRegisters_reg[21][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[21]\(11),
      R => '0'
    );
\specRegisters_reg[21][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[21]\(12),
      R => '0'
    );
\specRegisters_reg[21][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[21]\(13),
      R => '0'
    );
\specRegisters_reg[21][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[21]\(14),
      R => '0'
    );
\specRegisters_reg[21][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[21]\(15),
      R => '0'
    );
\specRegisters_reg[21][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[21]\(1),
      R => '0'
    );
\specRegisters_reg[21][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[21]\(2),
      R => '0'
    );
\specRegisters_reg[21][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[21]\(3),
      R => '0'
    );
\specRegisters_reg[21][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[21]\(4),
      R => '0'
    );
\specRegisters_reg[21][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[21]\(5),
      R => '0'
    );
\specRegisters_reg[21][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[21]\(6),
      R => '0'
    );
\specRegisters_reg[21][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[21]\(7),
      R => '0'
    );
\specRegisters_reg[21][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[21]\(8),
      R => '0'
    );
\specRegisters_reg[21][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[21]_12\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[21]\(9),
      R => '0'
    );
\specRegisters_reg[22][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[22]\(0),
      R => '0'
    );
\specRegisters_reg[22][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[22]\(10),
      R => '0'
    );
\specRegisters_reg[22][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[22]\(11),
      R => '0'
    );
\specRegisters_reg[22][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[22]\(12),
      R => '0'
    );
\specRegisters_reg[22][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[22]\(13),
      R => '0'
    );
\specRegisters_reg[22][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[22]\(14),
      R => '0'
    );
\specRegisters_reg[22][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[22]\(15),
      R => '0'
    );
\specRegisters_reg[22][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[22]\(1),
      R => '0'
    );
\specRegisters_reg[22][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[22]\(2),
      R => '0'
    );
\specRegisters_reg[22][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[22]\(3),
      R => '0'
    );
\specRegisters_reg[22][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[22]\(4),
      R => '0'
    );
\specRegisters_reg[22][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[22]\(5),
      R => '0'
    );
\specRegisters_reg[22][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[22]\(6),
      R => '0'
    );
\specRegisters_reg[22][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[22]\(7),
      R => '0'
    );
\specRegisters_reg[22][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[22]\(8),
      R => '0'
    );
\specRegisters_reg[22][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[22]_28\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[22]\(9),
      R => '0'
    );
\specRegisters_reg[23][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[23]\(0),
      R => '0'
    );
\specRegisters_reg[23][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[23]\(10),
      R => '0'
    );
\specRegisters_reg[23][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[23]\(11),
      R => '0'
    );
\specRegisters_reg[23][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[23]\(12),
      R => '0'
    );
\specRegisters_reg[23][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[23]\(13),
      R => '0'
    );
\specRegisters_reg[23][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[23]\(14),
      R => '0'
    );
\specRegisters_reg[23][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[23]\(15),
      R => '0'
    );
\specRegisters_reg[23][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[23]\(1),
      R => '0'
    );
\specRegisters_reg[23][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[23]\(2),
      R => '0'
    );
\specRegisters_reg[23][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[23]\(3),
      R => '0'
    );
\specRegisters_reg[23][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[23]\(4),
      R => '0'
    );
\specRegisters_reg[23][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[23]\(5),
      R => '0'
    );
\specRegisters_reg[23][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[23]\(6),
      R => '0'
    );
\specRegisters_reg[23][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[23]\(7),
      R => '0'
    );
\specRegisters_reg[23][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[23]\(8),
      R => '0'
    );
\specRegisters_reg[23][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[23]_6\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[23]\(9),
      R => '0'
    );
\specRegisters_reg[24][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(0),
      Q => \specRegisters_reg[24]\(0),
      R => '0'
    );
\specRegisters_reg[24][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(10),
      Q => \specRegisters_reg[24]\(10),
      R => '0'
    );
\specRegisters_reg[24][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(11),
      Q => \specRegisters_reg[24]\(11),
      R => '0'
    );
\specRegisters_reg[24][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(12),
      Q => \specRegisters_reg[24]\(12),
      R => '0'
    );
\specRegisters_reg[24][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(13),
      Q => \specRegisters_reg[24]\(13),
      R => '0'
    );
\specRegisters_reg[24][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(14),
      Q => \specRegisters_reg[24]\(14),
      R => '0'
    );
\specRegisters_reg[24][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(15),
      Q => \specRegisters_reg[24]\(15),
      R => '0'
    );
\specRegisters_reg[24][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(1),
      Q => \specRegisters_reg[24]\(1),
      R => '0'
    );
\specRegisters_reg[24][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(2),
      Q => \specRegisters_reg[24]\(2),
      R => '0'
    );
\specRegisters_reg[24][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(3),
      Q => \specRegisters_reg[24]\(3),
      R => '0'
    );
\specRegisters_reg[24][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(4),
      Q => \specRegisters_reg[24]\(4),
      R => '0'
    );
\specRegisters_reg[24][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(5),
      Q => \specRegisters_reg[24]\(5),
      R => '0'
    );
\specRegisters_reg[24][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(6),
      Q => \specRegisters_reg[24]\(6),
      R => '0'
    );
\specRegisters_reg[24][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(7),
      Q => \specRegisters_reg[24]\(7),
      R => '0'
    );
\specRegisters_reg[24][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(8),
      Q => \specRegisters_reg[24]\(8),
      R => '0'
    );
\specRegisters_reg[24][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[24][15]_i_1_n_0\,
      D => registerReadData(9),
      Q => \specRegisters_reg[24]\(9),
      R => '0'
    );
\specRegisters_reg[25][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[25]\(0),
      R => '0'
    );
\specRegisters_reg[25][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[25]\(10),
      R => '0'
    );
\specRegisters_reg[25][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[25]\(11),
      R => '0'
    );
\specRegisters_reg[25][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[25]\(12),
      R => '0'
    );
\specRegisters_reg[25][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[25]\(13),
      R => '0'
    );
\specRegisters_reg[25][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[25]\(14),
      R => '0'
    );
\specRegisters_reg[25][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[25]\(15),
      R => '0'
    );
\specRegisters_reg[25][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[25]\(1),
      R => '0'
    );
\specRegisters_reg[25][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[25]\(2),
      R => '0'
    );
\specRegisters_reg[25][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[25]\(3),
      R => '0'
    );
\specRegisters_reg[25][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[25]\(4),
      R => '0'
    );
\specRegisters_reg[25][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[25]\(5),
      R => '0'
    );
\specRegisters_reg[25][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[25]\(6),
      R => '0'
    );
\specRegisters_reg[25][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[25]\(7),
      R => '0'
    );
\specRegisters_reg[25][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[25]\(8),
      R => '0'
    );
\specRegisters_reg[25][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[25]_5\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[25]\(9),
      R => '0'
    );
\specRegisters_reg[26][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[26]\(0),
      R => '0'
    );
\specRegisters_reg[26][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[26]\(10),
      R => '0'
    );
\specRegisters_reg[26][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[26]\(11),
      R => '0'
    );
\specRegisters_reg[26][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[26]\(12),
      R => '0'
    );
\specRegisters_reg[26][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[26]\(13),
      R => '0'
    );
\specRegisters_reg[26][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[26]\(14),
      R => '0'
    );
\specRegisters_reg[26][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[26]\(15),
      R => '0'
    );
\specRegisters_reg[26][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[26]\(1),
      R => '0'
    );
\specRegisters_reg[26][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[26]\(2),
      R => '0'
    );
\specRegisters_reg[26][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[26]\(3),
      R => '0'
    );
\specRegisters_reg[26][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[26]\(4),
      R => '0'
    );
\specRegisters_reg[26][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[26]\(5),
      R => '0'
    );
\specRegisters_reg[26][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[26]\(6),
      R => '0'
    );
\specRegisters_reg[26][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[26]\(7),
      R => '0'
    );
\specRegisters_reg[26][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[26]\(8),
      R => '0'
    );
\specRegisters_reg[26][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[26]_22\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[26]\(9),
      R => '0'
    );
\specRegisters_reg[27][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[27]\(0),
      R => '0'
    );
\specRegisters_reg[27][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[27]\(10),
      R => '0'
    );
\specRegisters_reg[27][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[27]\(11),
      R => '0'
    );
\specRegisters_reg[27][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[27]\(12),
      R => '0'
    );
\specRegisters_reg[27][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[27]\(13),
      R => '0'
    );
\specRegisters_reg[27][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[27]\(14),
      R => '0'
    );
\specRegisters_reg[27][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[27]\(15),
      R => '0'
    );
\specRegisters_reg[27][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[27]\(1),
      R => '0'
    );
\specRegisters_reg[27][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[27]\(2),
      R => '0'
    );
\specRegisters_reg[27][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[27]\(3),
      R => '0'
    );
\specRegisters_reg[27][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[27]\(4),
      R => '0'
    );
\specRegisters_reg[27][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[27]\(5),
      R => '0'
    );
\specRegisters_reg[27][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[27]\(6),
      R => '0'
    );
\specRegisters_reg[27][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[27]\(7),
      R => '0'
    );
\specRegisters_reg[27][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[27]\(8),
      R => '0'
    );
\specRegisters_reg[27][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[27]_23\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[27]\(9),
      R => '0'
    );
\specRegisters_reg[28][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[28]\(0),
      R => '0'
    );
\specRegisters_reg[28][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[28]\(10),
      R => '0'
    );
\specRegisters_reg[28][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[28]\(11),
      R => '0'
    );
\specRegisters_reg[28][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[28]\(12),
      R => '0'
    );
\specRegisters_reg[28][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[28]\(13),
      R => '0'
    );
\specRegisters_reg[28][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[28]\(14),
      R => '0'
    );
\specRegisters_reg[28][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[28]\(15),
      R => '0'
    );
\specRegisters_reg[28][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[28]\(1),
      R => '0'
    );
\specRegisters_reg[28][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[28]\(2),
      R => '0'
    );
\specRegisters_reg[28][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[28]\(3),
      R => '0'
    );
\specRegisters_reg[28][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[28]\(4),
      R => '0'
    );
\specRegisters_reg[28][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[28]\(5),
      R => '0'
    );
\specRegisters_reg[28][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[28]\(6),
      R => '0'
    );
\specRegisters_reg[28][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[28]\(7),
      R => '0'
    );
\specRegisters_reg[28][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[28]\(8),
      R => '0'
    );
\specRegisters_reg[28][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[28]_24\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[28]\(9),
      R => '0'
    );
\specRegisters_reg[29][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[29]\(0),
      R => '0'
    );
\specRegisters_reg[29][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[29]\(10),
      R => '0'
    );
\specRegisters_reg[29][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[29]\(11),
      R => '0'
    );
\specRegisters_reg[29][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[29]\(12),
      R => '0'
    );
\specRegisters_reg[29][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[29]\(13),
      R => '0'
    );
\specRegisters_reg[29][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[29]\(14),
      R => '0'
    );
\specRegisters_reg[29][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[29]\(15),
      R => '0'
    );
\specRegisters_reg[29][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[29]\(1),
      R => '0'
    );
\specRegisters_reg[29][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[29]\(2),
      R => '0'
    );
\specRegisters_reg[29][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[29]\(3),
      R => '0'
    );
\specRegisters_reg[29][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[29]\(4),
      R => '0'
    );
\specRegisters_reg[29][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[29]\(5),
      R => '0'
    );
\specRegisters_reg[29][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[29]\(6),
      R => '0'
    );
\specRegisters_reg[29][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[29]\(7),
      R => '0'
    );
\specRegisters_reg[29][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[29]\(8),
      R => '0'
    );
\specRegisters_reg[29][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[29]_25\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[29]\(9),
      R => '0'
    );
\specRegisters_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[2]\(0),
      R => '0'
    );
\specRegisters_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[2]\(10),
      R => '0'
    );
\specRegisters_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[2]\(11),
      R => '0'
    );
\specRegisters_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[2]\(12),
      R => '0'
    );
\specRegisters_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[2]\(13),
      R => '0'
    );
\specRegisters_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[2]\(14),
      R => '0'
    );
\specRegisters_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[2]\(15),
      R => '0'
    );
\specRegisters_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[2]\(1),
      R => '0'
    );
\specRegisters_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[2]\(2),
      R => '0'
    );
\specRegisters_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[2]\(3),
      R => '0'
    );
\specRegisters_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[2]\(4),
      R => '0'
    );
\specRegisters_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[2]\(5),
      R => '0'
    );
\specRegisters_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[2]\(6),
      R => '0'
    );
\specRegisters_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[2]\(7),
      R => '0'
    );
\specRegisters_reg[2][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[2]\(8),
      R => '0'
    );
\specRegisters_reg[2][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[2]_16\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[2]\(9),
      R => '0'
    );
\specRegisters_reg[30][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[30]\(0),
      R => '0'
    );
\specRegisters_reg[30][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[30]\(10),
      R => '0'
    );
\specRegisters_reg[30][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[30]\(11),
      R => '0'
    );
\specRegisters_reg[30][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[30]\(12),
      R => '0'
    );
\specRegisters_reg[30][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[30]\(13),
      R => '0'
    );
\specRegisters_reg[30][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[30]\(14),
      R => '0'
    );
\specRegisters_reg[30][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[30]\(15),
      R => '0'
    );
\specRegisters_reg[30][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[30]\(1),
      R => '0'
    );
\specRegisters_reg[30][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[30]\(2),
      R => '0'
    );
\specRegisters_reg[30][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[30]\(3),
      R => '0'
    );
\specRegisters_reg[30][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[30]\(4),
      R => '0'
    );
\specRegisters_reg[30][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[30]\(5),
      R => '0'
    );
\specRegisters_reg[30][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[30]\(6),
      R => '0'
    );
\specRegisters_reg[30][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[30]\(7),
      R => '0'
    );
\specRegisters_reg[30][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[30]\(8),
      R => '0'
    );
\specRegisters_reg[30][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[30]_26\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[30]\(9),
      R => '0'
    );
\specRegisters_reg[31][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(0),
      Q => \specRegisters_reg[31]\(0),
      R => '0'
    );
\specRegisters_reg[31][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(10),
      Q => \specRegisters_reg[31]\(10),
      R => '0'
    );
\specRegisters_reg[31][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(11),
      Q => \specRegisters_reg[31]\(11),
      R => '0'
    );
\specRegisters_reg[31][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(12),
      Q => \specRegisters_reg[31]\(12),
      R => '0'
    );
\specRegisters_reg[31][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(13),
      Q => \specRegisters_reg[31]\(13),
      R => '0'
    );
\specRegisters_reg[31][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(14),
      Q => \specRegisters_reg[31]\(14),
      R => '0'
    );
\specRegisters_reg[31][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(15),
      Q => \specRegisters_reg[31]\(15),
      R => '0'
    );
\specRegisters_reg[31][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(1),
      Q => \specRegisters_reg[31]\(1),
      R => '0'
    );
\specRegisters_reg[31][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(2),
      Q => \specRegisters_reg[31]\(2),
      R => '0'
    );
\specRegisters_reg[31][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(3),
      Q => \specRegisters_reg[31]\(3),
      R => '0'
    );
\specRegisters_reg[31][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(4),
      Q => \specRegisters_reg[31]\(4),
      R => '0'
    );
\specRegisters_reg[31][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(5),
      Q => \specRegisters_reg[31]\(5),
      R => '0'
    );
\specRegisters_reg[31][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(6),
      Q => \specRegisters_reg[31]\(6),
      R => '0'
    );
\specRegisters_reg[31][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(7),
      Q => \specRegisters_reg[31]\(7),
      R => '0'
    );
\specRegisters_reg[31][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(8),
      Q => \specRegisters_reg[31]\(8),
      R => '0'
    );
\specRegisters_reg[31][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[31][15]_i_1_n_0\,
      D => registerReadData(9),
      Q => \specRegisters_reg[31]\(9),
      R => '0'
    );
\specRegisters_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[3]\(0),
      R => '0'
    );
\specRegisters_reg[3][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[3]\(10),
      R => '0'
    );
\specRegisters_reg[3][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[3]\(11),
      R => '0'
    );
\specRegisters_reg[3][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[3]\(12),
      R => '0'
    );
\specRegisters_reg[3][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[3]\(13),
      R => '0'
    );
\specRegisters_reg[3][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[3]\(14),
      R => '0'
    );
\specRegisters_reg[3][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[3]\(15),
      R => '0'
    );
\specRegisters_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[3]\(1),
      R => '0'
    );
\specRegisters_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[3]\(2),
      R => '0'
    );
\specRegisters_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[3]\(3),
      R => '0'
    );
\specRegisters_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[3]\(4),
      R => '0'
    );
\specRegisters_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[3]\(5),
      R => '0'
    );
\specRegisters_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[3]\(6),
      R => '0'
    );
\specRegisters_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[3]\(7),
      R => '0'
    );
\specRegisters_reg[3][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[3]\(8),
      R => '0'
    );
\specRegisters_reg[3][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[3]_15\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[3]\(9),
      R => '0'
    );
\specRegisters_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[4]\(0),
      R => '0'
    );
\specRegisters_reg[4][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[4]\(10),
      R => '0'
    );
\specRegisters_reg[4][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[4]\(11),
      R => '0'
    );
\specRegisters_reg[4][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[4]\(12),
      R => '0'
    );
\specRegisters_reg[4][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[4]\(13),
      R => '0'
    );
\specRegisters_reg[4][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[4]\(14),
      R => '0'
    );
\specRegisters_reg[4][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[4]\(15),
      R => '0'
    );
\specRegisters_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[4]\(1),
      R => '0'
    );
\specRegisters_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[4]\(2),
      R => '0'
    );
\specRegisters_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[4]\(3),
      R => '0'
    );
\specRegisters_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[4]\(4),
      R => '0'
    );
\specRegisters_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[4]\(5),
      R => '0'
    );
\specRegisters_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[4]\(6),
      R => '0'
    );
\specRegisters_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[4]\(7),
      R => '0'
    );
\specRegisters_reg[4][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[4]\(8),
      R => '0'
    );
\specRegisters_reg[4][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[4]_14\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[4]\(9),
      R => '0'
    );
\specRegisters_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg_n_0_[5][0]\,
      R => '0'
    );
\specRegisters_reg[5][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg_n_0_[5][10]\,
      R => '0'
    );
\specRegisters_reg[5][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg_n_0_[5][11]\,
      R => '0'
    );
\specRegisters_reg[5][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg_n_0_[5][12]\,
      R => '0'
    );
\specRegisters_reg[5][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg_n_0_[5][13]\,
      R => '0'
    );
\specRegisters_reg[5][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(14),
      Q => p_0_in4_in,
      R => '0'
    );
\specRegisters_reg[5][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg_n_0_[5][15]\,
      R => '0'
    );
\specRegisters_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg_n_0_[5][1]\,
      R => '0'
    );
\specRegisters_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg_n_0_[5][2]\,
      R => '0'
    );
\specRegisters_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg_n_0_[5][3]\,
      R => '0'
    );
\specRegisters_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg_n_0_[5][4]\,
      R => '0'
    );
\specRegisters_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg_n_0_[5][5]\,
      R => '0'
    );
\specRegisters_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg_n_0_[5][6]\,
      R => '0'
    );
\specRegisters_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg_n_0_[5][7]\,
      R => '0'
    );
\specRegisters_reg[5][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg_n_0_[5][8]\,
      R => '0'
    );
\specRegisters_reg[5][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[5]_0\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg_n_0_[5][9]\,
      R => '0'
    );
\specRegisters_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[6]\(0),
      R => '0'
    );
\specRegisters_reg[6][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[6]\(10),
      R => '0'
    );
\specRegisters_reg[6][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[6]\(11),
      R => '0'
    );
\specRegisters_reg[6][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[6]\(12),
      R => '0'
    );
\specRegisters_reg[6][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[6]\(13),
      R => '0'
    );
\specRegisters_reg[6][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[6]\(14),
      R => '0'
    );
\specRegisters_reg[6][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[6]\(15),
      R => '0'
    );
\specRegisters_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[6]\(1),
      R => '0'
    );
\specRegisters_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[6]\(2),
      R => '0'
    );
\specRegisters_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[6]\(3),
      R => '0'
    );
\specRegisters_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[6]\(4),
      R => '0'
    );
\specRegisters_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[6]\(5),
      R => '0'
    );
\specRegisters_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[6]\(6),
      R => '0'
    );
\specRegisters_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[6]\(7),
      R => '0'
    );
\specRegisters_reg[6][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[6]\(8),
      R => '0'
    );
\specRegisters_reg[6][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[6]_27\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[6]\(9),
      R => '0'
    );
\specRegisters_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[7]\(0),
      R => '0'
    );
\specRegisters_reg[7][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[7]\(10),
      R => '0'
    );
\specRegisters_reg[7][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[7]\(11),
      R => '0'
    );
\specRegisters_reg[7][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[7]\(12),
      R => '0'
    );
\specRegisters_reg[7][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[7]\(13),
      R => '0'
    );
\specRegisters_reg[7][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[7]\(14),
      R => '0'
    );
\specRegisters_reg[7][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[7]\(15),
      R => '0'
    );
\specRegisters_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[7]\(1),
      R => '0'
    );
\specRegisters_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[7]\(2),
      R => '0'
    );
\specRegisters_reg[7][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[7]\(3),
      R => '0'
    );
\specRegisters_reg[7][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[7]\(4),
      R => '0'
    );
\specRegisters_reg[7][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[7]\(5),
      R => '0'
    );
\specRegisters_reg[7][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[7]\(6),
      R => '0'
    );
\specRegisters_reg[7][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[7]\(7),
      R => '0'
    );
\specRegisters_reg[7][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[7]\(8),
      R => '0'
    );
\specRegisters_reg[7][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[7]_17\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[7]\(9),
      R => '0'
    );
\specRegisters_reg[8][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[8]\(0),
      R => '0'
    );
\specRegisters_reg[8][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[8]\(10),
      R => '0'
    );
\specRegisters_reg[8][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[8]\(11),
      R => '0'
    );
\specRegisters_reg[8][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[8]\(12),
      R => '0'
    );
\specRegisters_reg[8][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[8]\(13),
      R => '0'
    );
\specRegisters_reg[8][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[8]\(14),
      R => '0'
    );
\specRegisters_reg[8][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[8]\(15),
      R => '0'
    );
\specRegisters_reg[8][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[8]\(1),
      R => '0'
    );
\specRegisters_reg[8][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[8]\(2),
      R => '0'
    );
\specRegisters_reg[8][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[8]\(3),
      R => '0'
    );
\specRegisters_reg[8][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[8]\(4),
      R => '0'
    );
\specRegisters_reg[8][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[8]\(5),
      R => '0'
    );
\specRegisters_reg[8][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[8]\(6),
      R => '0'
    );
\specRegisters_reg[8][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[8]\(7),
      R => '0'
    );
\specRegisters_reg[8][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[8]\(8),
      R => '0'
    );
\specRegisters_reg[8][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[8]_19\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[8]\(9),
      R => '0'
    );
\specRegisters_reg[9][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(0),
      Q => \specRegisters_reg[9]\(0),
      R => '0'
    );
\specRegisters_reg[9][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(10),
      Q => \specRegisters_reg[9]\(10),
      R => '0'
    );
\specRegisters_reg[9][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(11),
      Q => \specRegisters_reg[9]\(11),
      R => '0'
    );
\specRegisters_reg[9][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(12),
      Q => \specRegisters_reg[9]\(12),
      R => '0'
    );
\specRegisters_reg[9][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(13),
      Q => \specRegisters_reg[9]\(13),
      R => '0'
    );
\specRegisters_reg[9][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(14),
      Q => \specRegisters_reg[9]\(14),
      R => '0'
    );
\specRegisters_reg[9][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(15),
      Q => \specRegisters_reg[9]\(15),
      R => '0'
    );
\specRegisters_reg[9][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(1),
      Q => \specRegisters_reg[9]\(1),
      R => '0'
    );
\specRegisters_reg[9][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(2),
      Q => \specRegisters_reg[9]\(2),
      R => '0'
    );
\specRegisters_reg[9][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(3),
      Q => \specRegisters_reg[9]\(3),
      R => '0'
    );
\specRegisters_reg[9][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(4),
      Q => \specRegisters_reg[9]\(4),
      R => '0'
    );
\specRegisters_reg[9][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(5),
      Q => \specRegisters_reg[9]\(5),
      R => '0'
    );
\specRegisters_reg[9][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(6),
      Q => \specRegisters_reg[9]\(6),
      R => '0'
    );
\specRegisters_reg[9][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(7),
      Q => \specRegisters_reg[9]\(7),
      R => '0'
    );
\specRegisters_reg[9][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(8),
      Q => \specRegisters_reg[9]\(8),
      R => '0'
    );
\specRegisters_reg[9][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \specRegisters[9]_3\(0),
      D => registerReadData(9),
      Q => \specRegisters_reg[9]\(9),
      R => '0'
    );
\waitFinishNextState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33263306"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      I4 => \writeExtendedRegisterAddr_reg_n_0_[0]\,
      O => waitFinishNextState(0)
    );
\waitFinishNextState[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04100010"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \writeExtendedRegisterAddr_reg_n_0_[4]\,
      O => \waitFinishNextState[1]_i_1_n_0\
    );
\waitFinishNextState[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAFA4500"
    )
        port map (
      I0 => \^q\(3),
      I1 => writeExtendedRegisterData(14),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => waitFinishNextState(2)
    );
\waitFinishNextState[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40414551"
    )
        port map (
      I0 => dbgRst,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => \waitFinishNextState[3]_i_1_n_0\
    );
\waitFinishNextState[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFAAEAAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \writeExtendedRegisterNextState_reg_n_0_[3]\,
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(1),
      O => waitFinishNextState(3)
    );
\waitFinishNextState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \waitFinishNextState[3]_i_1_n_0\,
      D => waitFinishNextState(0),
      Q => \waitFinishNextState_reg_n_0_[0]\,
      R => '0'
    );
\waitFinishNextState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \waitFinishNextState[3]_i_1_n_0\,
      D => \waitFinishNextState[1]_i_1_n_0\,
      Q => \waitFinishNextState_reg_n_0_[1]\,
      R => '0'
    );
\waitFinishNextState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \waitFinishNextState[3]_i_1_n_0\,
      D => waitFinishNextState(2),
      Q => \waitFinishNextState_reg_n_0_[2]\,
      R => '0'
    );
\waitFinishNextState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \waitFinishNextState[3]_i_1_n_0\,
      D => waitFinishNextState(3),
      Q => \waitFinishNextState_reg_n_0_[3]\,
      R => '0'
    );
\writeExtendedRegisterAddr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      O => writeExtendedRegisterAddr(0)
    );
\writeExtendedRegisterAddr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01011001"
    )
        port map (
      I0 => \^q\(2),
      I1 => dbgRst,
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(0),
      O => writeExtendedRegisterAddr_30(0)
    );
\writeExtendedRegisterAddr[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      O => writeExtendedRegisterAddr(4)
    );
\writeExtendedRegisterAddr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => writeExtendedRegisterAddr(0),
      Q => \writeExtendedRegisterAddr_reg_n_0_[0]\,
      R => '0'
    );
\writeExtendedRegisterAddr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => \^q\(0),
      Q => \writeExtendedRegisterAddr_reg_n_0_[1]\,
      R => '0'
    );
\writeExtendedRegisterAddr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => writeExtendedRegisterAddr(4),
      Q => \writeExtendedRegisterAddr_reg_n_0_[4]\,
      R => '0'
    );
\writeExtendedRegisterData[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      O => \writeExtendedRegisterData[14]_i_1_n_0\
    );
\writeExtendedRegisterData_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => \writeExtendedRegisterData[14]_i_1_n_0\,
      Q => writeExtendedRegisterData(14),
      R => '0'
    );
\writeExtendedRegisterData_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => \^q\(1),
      Q => writeExtendedRegisterData(5),
      R => '0'
    );
\writeExtendedRegisterNextState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => writeExtendedRegisterAddr_30(0),
      D => \^q\(3),
      Q => \writeExtendedRegisterNextState_reg_n_0_[3]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_SGMII_PHY_Bringup_MD_0_0 is
  port (
    clkin25 : in STD_LOGIC;
    dbgRst : in STD_LOGIC;
    registerReadData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : in STD_LOGIC;
    registerWriteComplete : in STD_LOGIC;
    newRequestPHYAddress : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : out STD_LOGIC;
    newRequestStart : out STD_LOGIC;
    phyBringupComplete : out STD_LOGIC;
    DBG_RegReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_RegPCSPMAReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegPCSPMAReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Bringup_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "SGMII_PHY_Bringup_MDIO,Vivado 2025.2";
end MainDesign_SGMII_PHY_Bringup_MD_0_0;

architecture STRUCTURE of MainDesign_SGMII_PHY_Bringup_MD_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^dbg_bringup_state\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^dbg_regpcspmareadindex\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^dbg_regreaddata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^newrequestdata\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \^newrequestphyaddress\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clkin25 : signal is "xilinx.com:signal:clock:1.0 clkin25 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clkin25 : signal is "slave clkin25";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin25 : signal is "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
begin
  DBG_Bringup_State(4) <= \<const0>\;
  DBG_Bringup_State(3 downto 0) <= \^dbg_bringup_state\(3 downto 0);
  DBG_RegPCSPMAReadData(15 downto 0) <= \^dbg_regreaddata\(15 downto 0);
  DBG_RegPCSPMAReadIndex(4 downto 0) <= \^dbg_regpcspmareadindex\(4 downto 0);
  DBG_RegReadData(15 downto 0) <= \^dbg_regreaddata\(15 downto 0);
  DBG_RegReadIndex(4 downto 0) <= \^dbg_regpcspmareadindex\(4 downto 0);
  newRequestData(15) <= \<const0>\;
  newRequestData(14 downto 11) <= \^newrequestdata\(14 downto 11);
  newRequestData(10) <= \<const0>\;
  newRequestData(9 downto 0) <= \^newrequestdata\(9 downto 0);
  newRequestPHYAddress(4) <= \<const0>\;
  newRequestPHYAddress(3) <= \<const0>\;
  newRequestPHYAddress(2) <= \<const0>\;
  newRequestPHYAddress(1 downto 0) <= \^newrequestphyaddress\(1 downto 0);
  newRequestRegister(15) <= \<const0>\;
  newRequestRegister(14) <= \<const0>\;
  newRequestRegister(13) <= \<const0>\;
  newRequestRegister(12) <= \<const0>\;
  newRequestRegister(11) <= \<const0>\;
  newRequestRegister(10) <= \<const0>\;
  newRequestRegister(9) <= \<const0>\;
  newRequestRegister(8) <= \<const0>\;
  newRequestRegister(7) <= \<const0>\;
  newRequestRegister(6) <= \<const0>\;
  newRequestRegister(5) <= \<const0>\;
  newRequestRegister(4) <= \<const0>\;
  newRequestRegister(3) <= \<const0>\;
  newRequestRegister(2) <= \<const0>\;
  newRequestRegister(1) <= \<const0>\;
  newRequestRegister(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.MainDesign_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO
     port map (
      DBG_RegReadData(15 downto 0) => \^dbg_regreaddata\(15 downto 0),
      DBG_RegReadIndex(4 downto 0) => \^dbg_regpcspmareadindex\(4 downto 0),
      Q(3 downto 0) => \^dbg_bringup_state\(3 downto 0),
      clkin25 => clkin25,
      dbgRst => dbgRst,
      newRequestData(13 downto 10) => \^newrequestdata\(14 downto 11),
      newRequestData(9 downto 0) => \^newrequestdata\(9 downto 0),
      newRequestDevTypeRegister(4 downto 0) => newRequestDevTypeRegister(4 downto 0),
      newRequestIsWrite => newRequestIsWrite,
      newRequestPHYAddress(1 downto 0) => \^newrequestphyaddress\(1 downto 0),
      newRequestStart => newRequestStart,
      phyBringupComplete => phyBringupComplete,
      registerReadData(15 downto 0) => registerReadData(15 downto 0),
      registerReadReady => registerReadReady,
      registerWriteComplete => registerWriteComplete
    );
end STRUCTURE;
