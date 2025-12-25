-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:01:44 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DbgPixelMessages_0_2/MainDesign_DbgPixelMessages_0_2_sim_netlist.vhdl
-- Design      : MainDesign_DbgPixelMessages_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_DbgPixelMessages_0_2_DbgPixelMessages is
  port (
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \currentReadElementIndex_reg[5]_0\ : out STD_LOGIC;
    \currentReadElementIndex_reg[4]_0\ : out STD_LOGIC;
    \currentReadElementIndex_reg[3]_0\ : out STD_LOGIC;
    \currentReadElementIndex_reg[2]_0\ : out STD_LOGIC;
    \currentReadElementIndex_reg[1]_0\ : out STD_LOGIC;
    \currentReadElementIndex_reg[0]_0\ : out STD_LOGIC;
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    STAGE_Message : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_MessageData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_EndFrameReset : in STD_LOGIC;
    DBG_BeginDump : in STD_LOGIC;
    STAGE_NewMessage : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_DbgPixelMessages_0_2_DbgPixelMessages : entity is "DbgPixelMessages";
end MainDesign_DbgPixelMessages_0_2_DbgPixelMessages;

architecture STRUCTURE of MainDesign_DbgPixelMessages_0_2_DbgPixelMessages is
  signal \^dbg_messageindex\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal currentIsDumping : STD_LOGIC;
  signal currentIsDumping_i_1_n_0 : STD_LOGIC;
  signal currentIsDumping_i_2_n_0 : STD_LOGIC;
  signal currentIsDumping_i_3_n_0 : STD_LOGIC;
  signal currentIsDumping_i_4_n_0 : STD_LOGIC;
  signal \currentReadElementIndex[7]_i_1_n_0\ : STD_LOGIC;
  signal \currentReadElementIndex[7]_i_3_n_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[0]_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[1]_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[2]_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[3]_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[4]_0\ : STD_LOGIC;
  signal \^currentreadelementindex_reg[5]_0\ : STD_LOGIC;
  signal \currentWriteElementIndex[7]_i_2_n_0\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[0]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[1]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[2]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[3]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[4]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[5]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[6]\ : STD_LOGIC;
  signal \currentWriteElementIndex_reg_n_0_[7]\ : STD_LOGIC;
  signal endDumpingDebounce : STD_LOGIC;
  signal endDumpingDebounce_i_1_n_0 : STD_LOGIC;
  signal p_0_in10_out : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal plusOp_0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal NLW_elementsData_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_elementsData_reg_0_63_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_14_15_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_14_15_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_14_15_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_14_15_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_elements_reg_0_63_7_13_DOH_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of currentIsDumping_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \currentReadElementIndex[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \currentReadElementIndex[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \currentReadElementIndex[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentReadElementIndex[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentReadElementIndex[7]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \currentWriteElementIndex[7]_i_1\ : label is "soft_lutpair3";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of elementsData_reg_0_63_0_6 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of elementsData_reg_0_63_0_6 : label is 1024;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of elementsData_reg_0_63_0_6 : label is "MainDesign_DbgPixelMessages_0_2/U0/elementsData_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of elementsData_reg_0_63_0_6 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of elementsData_reg_0_63_0_6 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of elementsData_reg_0_63_0_6 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of elementsData_reg_0_63_0_6 : label is 63;
  attribute ram_offset : integer;
  attribute ram_offset of elementsData_reg_0_63_0_6 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of elementsData_reg_0_63_0_6 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of elementsData_reg_0_63_0_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of elementsData_reg_0_63_7_13 : label is "";
  attribute RTL_RAM_BITS of elementsData_reg_0_63_7_13 : label is 1024;
  attribute RTL_RAM_NAME of elementsData_reg_0_63_7_13 : label is "MainDesign_DbgPixelMessages_0_2/U0/elementsData_reg";
  attribute RTL_RAM_STYLE of elementsData_reg_0_63_7_13 : label is "auto";
  attribute RTL_RAM_TYPE of elementsData_reg_0_63_7_13 : label is "RAM_SDP";
  attribute ram_addr_begin of elementsData_reg_0_63_7_13 : label is 0;
  attribute ram_addr_end of elementsData_reg_0_63_7_13 : label is 63;
  attribute ram_offset of elementsData_reg_0_63_7_13 : label is 0;
  attribute ram_slice_begin of elementsData_reg_0_63_7_13 : label is 7;
  attribute ram_slice_end of elementsData_reg_0_63_7_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of elements_reg_0_63_0_6 : label is "";
  attribute RTL_RAM_BITS of elements_reg_0_63_0_6 : label is 1024;
  attribute RTL_RAM_NAME of elements_reg_0_63_0_6 : label is "MainDesign_DbgPixelMessages_0_2/U0/elements_reg";
  attribute RTL_RAM_STYLE of elements_reg_0_63_0_6 : label is "auto";
  attribute RTL_RAM_TYPE of elements_reg_0_63_0_6 : label is "RAM_SDP";
  attribute ram_addr_begin of elements_reg_0_63_0_6 : label is 0;
  attribute ram_addr_end of elements_reg_0_63_0_6 : label is 63;
  attribute ram_offset of elements_reg_0_63_0_6 : label is 0;
  attribute ram_slice_begin of elements_reg_0_63_0_6 : label is 0;
  attribute ram_slice_end of elements_reg_0_63_0_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of elements_reg_0_63_14_15 : label is "";
  attribute RTL_RAM_BITS of elements_reg_0_63_14_15 : label is 1024;
  attribute RTL_RAM_NAME of elements_reg_0_63_14_15 : label is "MainDesign_DbgPixelMessages_0_2/U0/elements_reg";
  attribute RTL_RAM_STYLE of elements_reg_0_63_14_15 : label is "auto";
  attribute RTL_RAM_TYPE of elements_reg_0_63_14_15 : label is "RAM_SDP";
  attribute ram_addr_begin of elements_reg_0_63_14_15 : label is 0;
  attribute ram_addr_end of elements_reg_0_63_14_15 : label is 63;
  attribute ram_offset of elements_reg_0_63_14_15 : label is 0;
  attribute ram_slice_begin of elements_reg_0_63_14_15 : label is 14;
  attribute ram_slice_end of elements_reg_0_63_14_15 : label is 15;
  attribute METHODOLOGY_DRC_VIOS of elements_reg_0_63_7_13 : label is "";
  attribute RTL_RAM_BITS of elements_reg_0_63_7_13 : label is 1024;
  attribute RTL_RAM_NAME of elements_reg_0_63_7_13 : label is "MainDesign_DbgPixelMessages_0_2/U0/elements_reg";
  attribute RTL_RAM_STYLE of elements_reg_0_63_7_13 : label is "auto";
  attribute RTL_RAM_TYPE of elements_reg_0_63_7_13 : label is "RAM_SDP";
  attribute ram_addr_begin of elements_reg_0_63_7_13 : label is 0;
  attribute ram_addr_end of elements_reg_0_63_7_13 : label is 63;
  attribute ram_offset of elements_reg_0_63_7_13 : label is 0;
  attribute ram_slice_begin of elements_reg_0_63_7_13 : label is 7;
  attribute ram_slice_end of elements_reg_0_63_7_13 : label is 13;
begin
  DBG_MessageIndex(1 downto 0) <= \^dbg_messageindex\(1 downto 0);
  \currentReadElementIndex_reg[0]_0\ <= \^currentreadelementindex_reg[0]_0\;
  \currentReadElementIndex_reg[1]_0\ <= \^currentreadelementindex_reg[1]_0\;
  \currentReadElementIndex_reg[2]_0\ <= \^currentreadelementindex_reg[2]_0\;
  \currentReadElementIndex_reg[3]_0\ <= \^currentreadelementindex_reg[3]_0\;
  \currentReadElementIndex_reg[4]_0\ <= \^currentreadelementindex_reg[4]_0\;
  \currentReadElementIndex_reg[5]_0\ <= \^currentreadelementindex_reg[5]_0\;
currentIsDumping_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F700F7FFF700F700"
    )
        port map (
      I0 => currentIsDumping_i_2_n_0,
      I1 => currentIsDumping_i_3_n_0,
      I2 => currentIsDumping_i_4_n_0,
      I3 => currentIsDumping,
      I4 => endDumpingDebounce,
      I5 => DBG_BeginDump,
      O => currentIsDumping_i_1_n_0
    );
currentIsDumping_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^currentreadelementindex_reg[0]_0\,
      I1 => \currentWriteElementIndex_reg_n_0_[0]\,
      I2 => \currentWriteElementIndex_reg_n_0_[2]\,
      I3 => \^currentreadelementindex_reg[2]_0\,
      I4 => \currentWriteElementIndex_reg_n_0_[1]\,
      I5 => \^currentreadelementindex_reg[1]_0\,
      O => currentIsDumping_i_2_n_0
    );
currentIsDumping_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^currentreadelementindex_reg[3]_0\,
      I1 => \currentWriteElementIndex_reg_n_0_[3]\,
      I2 => \currentWriteElementIndex_reg_n_0_[5]\,
      I3 => \^currentreadelementindex_reg[5]_0\,
      I4 => \currentWriteElementIndex_reg_n_0_[4]\,
      I5 => \^currentreadelementindex_reg[4]_0\,
      O => currentIsDumping_i_3_n_0
    );
currentIsDumping_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^dbg_messageindex\(0),
      I1 => \currentWriteElementIndex_reg_n_0_[6]\,
      I2 => \^dbg_messageindex\(1),
      I3 => \currentWriteElementIndex_reg_n_0_[7]\,
      O => currentIsDumping_i_4_n_0
    );
currentIsDumping_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => currentIsDumping_i_1_n_0,
      Q => currentIsDumping,
      R => '0'
    );
\currentReadElementIndex[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^currentreadelementindex_reg[0]_0\,
      O => plusOp_0(0)
    );
\currentReadElementIndex[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^currentreadelementindex_reg[0]_0\,
      I1 => \^currentreadelementindex_reg[1]_0\,
      O => plusOp_0(1)
    );
\currentReadElementIndex[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^currentreadelementindex_reg[0]_0\,
      I1 => \^currentreadelementindex_reg[1]_0\,
      I2 => \^currentreadelementindex_reg[2]_0\,
      O => plusOp_0(2)
    );
\currentReadElementIndex[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^currentreadelementindex_reg[1]_0\,
      I1 => \^currentreadelementindex_reg[0]_0\,
      I2 => \^currentreadelementindex_reg[2]_0\,
      I3 => \^currentreadelementindex_reg[3]_0\,
      O => plusOp_0(3)
    );
\currentReadElementIndex[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^currentreadelementindex_reg[2]_0\,
      I1 => \^currentreadelementindex_reg[0]_0\,
      I2 => \^currentreadelementindex_reg[1]_0\,
      I3 => \^currentreadelementindex_reg[3]_0\,
      I4 => \^currentreadelementindex_reg[4]_0\,
      O => plusOp_0(4)
    );
\currentReadElementIndex[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^currentreadelementindex_reg[3]_0\,
      I1 => \^currentreadelementindex_reg[1]_0\,
      I2 => \^currentreadelementindex_reg[0]_0\,
      I3 => \^currentreadelementindex_reg[2]_0\,
      I4 => \^currentreadelementindex_reg[4]_0\,
      I5 => \^currentreadelementindex_reg[5]_0\,
      O => plusOp_0(5)
    );
\currentReadElementIndex[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \currentReadElementIndex[7]_i_3_n_0\,
      I1 => \^dbg_messageindex\(0),
      O => \plusOp__0\(6)
    );
\currentReadElementIndex[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => currentIsDumping,
      O => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \currentReadElementIndex[7]_i_3_n_0\,
      I1 => \^dbg_messageindex\(0),
      I2 => \^dbg_messageindex\(1),
      O => \plusOp__0\(7)
    );
\currentReadElementIndex[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^currentreadelementindex_reg[5]_0\,
      I1 => \^currentreadelementindex_reg[3]_0\,
      I2 => \^currentreadelementindex_reg[1]_0\,
      I3 => \^currentreadelementindex_reg[0]_0\,
      I4 => \^currentreadelementindex_reg[2]_0\,
      I5 => \^currentreadelementindex_reg[4]_0\,
      O => \currentReadElementIndex[7]_i_3_n_0\
    );
\currentReadElementIndex_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(0),
      Q => \^currentreadelementindex_reg[0]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(1),
      Q => \^currentreadelementindex_reg[1]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(2),
      Q => \^currentreadelementindex_reg[2]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(3),
      Q => \^currentreadelementindex_reg[3]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(4),
      Q => \^currentreadelementindex_reg[4]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => plusOp_0(5),
      Q => \^currentreadelementindex_reg[5]_0\,
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \plusOp__0\(6),
      Q => \^dbg_messageindex\(0),
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentReadElementIndex_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \plusOp__0\(7),
      Q => \^dbg_messageindex\(1),
      R => \currentReadElementIndex[7]_i_1_n_0\
    );
\currentWriteElementIndex[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[0]\,
      O => plusOp(0)
    );
\currentWriteElementIndex[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[0]\,
      I1 => \currentWriteElementIndex_reg_n_0_[1]\,
      O => plusOp(1)
    );
\currentWriteElementIndex[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[0]\,
      I1 => \currentWriteElementIndex_reg_n_0_[1]\,
      I2 => \currentWriteElementIndex_reg_n_0_[2]\,
      O => plusOp(2)
    );
\currentWriteElementIndex[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[1]\,
      I1 => \currentWriteElementIndex_reg_n_0_[0]\,
      I2 => \currentWriteElementIndex_reg_n_0_[2]\,
      I3 => \currentWriteElementIndex_reg_n_0_[3]\,
      O => plusOp(3)
    );
\currentWriteElementIndex[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[2]\,
      I1 => \currentWriteElementIndex_reg_n_0_[0]\,
      I2 => \currentWriteElementIndex_reg_n_0_[1]\,
      I3 => \currentWriteElementIndex_reg_n_0_[3]\,
      I4 => \currentWriteElementIndex_reg_n_0_[4]\,
      O => plusOp(4)
    );
\currentWriteElementIndex[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[3]\,
      I1 => \currentWriteElementIndex_reg_n_0_[1]\,
      I2 => \currentWriteElementIndex_reg_n_0_[0]\,
      I3 => \currentWriteElementIndex_reg_n_0_[2]\,
      I4 => \currentWriteElementIndex_reg_n_0_[4]\,
      I5 => \currentWriteElementIndex_reg_n_0_[5]\,
      O => plusOp(5)
    );
\currentWriteElementIndex[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \currentWriteElementIndex[7]_i_2_n_0\,
      I1 => \currentWriteElementIndex_reg_n_0_[6]\,
      O => plusOp(6)
    );
\currentWriteElementIndex[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \currentWriteElementIndex[7]_i_2_n_0\,
      I1 => \currentWriteElementIndex_reg_n_0_[6]\,
      I2 => \currentWriteElementIndex_reg_n_0_[7]\,
      O => plusOp(7)
    );
\currentWriteElementIndex[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \currentWriteElementIndex_reg_n_0_[5]\,
      I1 => \currentWriteElementIndex_reg_n_0_[3]\,
      I2 => \currentWriteElementIndex_reg_n_0_[1]\,
      I3 => \currentWriteElementIndex_reg_n_0_[0]\,
      I4 => \currentWriteElementIndex_reg_n_0_[2]\,
      I5 => \currentWriteElementIndex_reg_n_0_[4]\,
      O => \currentWriteElementIndex[7]_i_2_n_0\
    );
\currentWriteElementIndex_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(0),
      Q => \currentWriteElementIndex_reg_n_0_[0]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(1),
      Q => \currentWriteElementIndex_reg_n_0_[1]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(2),
      Q => \currentWriteElementIndex_reg_n_0_[2]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(3),
      Q => \currentWriteElementIndex_reg_n_0_[3]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(4),
      Q => \currentWriteElementIndex_reg_n_0_[4]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(5),
      Q => \currentWriteElementIndex_reg_n_0_[5]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(6),
      Q => \currentWriteElementIndex_reg_n_0_[6]\,
      R => CMD_EndFrameReset
    );
\currentWriteElementIndex_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in10_out,
      D => plusOp(7),
      Q => \currentWriteElementIndex_reg_n_0_[7]\,
      R => CMD_EndFrameReset
    );
elementsData_reg_0_63_0_6: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRA(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRA(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRA(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRA(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRA(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRB(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRB(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRB(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRB(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRB(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRB(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRC(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRC(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRC(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRC(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRC(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRC(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRD(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRD(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRD(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRD(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRD(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRD(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRE(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRE(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRE(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRE(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRE(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRE(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRF(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRF(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRF(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRF(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRF(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRF(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRG(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRG(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRG(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRG(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRG(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRG(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRH(5) => \currentWriteElementIndex_reg_n_0_[5]\,
      ADDRH(4) => \currentWriteElementIndex_reg_n_0_[4]\,
      ADDRH(3) => \currentWriteElementIndex_reg_n_0_[3]\,
      ADDRH(2) => \currentWriteElementIndex_reg_n_0_[2]\,
      ADDRH(1) => \currentWriteElementIndex_reg_n_0_[1]\,
      ADDRH(0) => \currentWriteElementIndex_reg_n_0_[0]\,
      DIA => STAGE_MessageData(0),
      DIB => STAGE_MessageData(1),
      DIC => STAGE_MessageData(2),
      DID => STAGE_MessageData(3),
      DIE => STAGE_MessageData(4),
      DIF => STAGE_MessageData(5),
      DIG => STAGE_MessageData(6),
      DIH => '0',
      DOA => DBG_MessageData(0),
      DOB => DBG_MessageData(1),
      DOC => DBG_MessageData(2),
      DOD => DBG_MessageData(3),
      DOE => DBG_MessageData(4),
      DOF => DBG_MessageData(5),
      DOG => DBG_MessageData(6),
      DOH => NLW_elementsData_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => p_0_in10_out
    );
elementsData_reg_0_63_7_13: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRA(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRA(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRA(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRA(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRA(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRB(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRB(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRB(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRB(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRB(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRB(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRC(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRC(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRC(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRC(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRC(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRC(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRD(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRD(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRD(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRD(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRD(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRD(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRE(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRE(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRE(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRE(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRE(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRE(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRF(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRF(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRF(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRF(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRF(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRF(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRG(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRG(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRG(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRG(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRG(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRG(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRH(5) => \currentWriteElementIndex_reg_n_0_[5]\,
      ADDRH(4) => \currentWriteElementIndex_reg_n_0_[4]\,
      ADDRH(3) => \currentWriteElementIndex_reg_n_0_[3]\,
      ADDRH(2) => \currentWriteElementIndex_reg_n_0_[2]\,
      ADDRH(1) => \currentWriteElementIndex_reg_n_0_[1]\,
      ADDRH(0) => \currentWriteElementIndex_reg_n_0_[0]\,
      DIA => STAGE_MessageData(7),
      DIB => STAGE_MessageData(8),
      DIC => STAGE_MessageData(9),
      DID => STAGE_MessageData(10),
      DIE => STAGE_MessageData(11),
      DIF => STAGE_MessageData(12),
      DIG => STAGE_MessageData(13),
      DIH => '0',
      DOA => DBG_MessageData(7),
      DOB => DBG_MessageData(8),
      DOC => DBG_MessageData(9),
      DOD => DBG_MessageData(10),
      DOE => DBG_MessageData(11),
      DOF => DBG_MessageData(12),
      DOG => DBG_MessageData(13),
      DOH => NLW_elementsData_reg_0_63_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => p_0_in10_out
    );
elements_reg_0_63_0_6: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRA(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRA(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRA(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRA(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRA(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRB(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRB(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRB(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRB(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRB(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRB(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRC(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRC(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRC(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRC(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRC(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRC(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRD(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRD(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRD(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRD(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRD(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRD(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRE(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRE(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRE(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRE(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRE(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRE(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRF(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRF(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRF(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRF(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRF(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRF(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRG(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRG(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRG(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRG(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRG(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRG(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRH(5) => \currentWriteElementIndex_reg_n_0_[5]\,
      ADDRH(4) => \currentWriteElementIndex_reg_n_0_[4]\,
      ADDRH(3) => \currentWriteElementIndex_reg_n_0_[3]\,
      ADDRH(2) => \currentWriteElementIndex_reg_n_0_[2]\,
      ADDRH(1) => \currentWriteElementIndex_reg_n_0_[1]\,
      ADDRH(0) => \currentWriteElementIndex_reg_n_0_[0]\,
      DIA => STAGE_Message(0),
      DIB => STAGE_Message(1),
      DIC => STAGE_Message(2),
      DID => STAGE_Message(3),
      DIE => STAGE_Message(4),
      DIF => STAGE_Message(5),
      DIG => STAGE_Message(6),
      DIH => '0',
      DOA => DBG_Message(0),
      DOB => DBG_Message(1),
      DOC => DBG_Message(2),
      DOD => DBG_Message(3),
      DOE => DBG_Message(4),
      DOF => DBG_Message(5),
      DOG => DBG_Message(6),
      DOH => NLW_elements_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => p_0_in10_out
    );
elements_reg_0_63_14_15: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRA(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRA(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRA(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRA(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRA(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRB(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRB(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRB(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRB(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRB(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRB(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRC(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRC(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRC(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRC(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRC(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRC(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRD(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRD(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRD(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRD(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRD(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRD(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRE(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRE(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRE(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRE(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRE(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRE(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRF(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRF(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRF(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRF(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRF(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRF(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRG(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRG(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRG(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRG(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRG(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRG(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRH(5) => \currentWriteElementIndex_reg_n_0_[5]\,
      ADDRH(4) => \currentWriteElementIndex_reg_n_0_[4]\,
      ADDRH(3) => \currentWriteElementIndex_reg_n_0_[3]\,
      ADDRH(2) => \currentWriteElementIndex_reg_n_0_[2]\,
      ADDRH(1) => \currentWriteElementIndex_reg_n_0_[1]\,
      ADDRH(0) => \currentWriteElementIndex_reg_n_0_[0]\,
      DIA => STAGE_Message(14),
      DIB => STAGE_Message(15),
      DIC => STAGE_MessageData(14),
      DID => STAGE_MessageData(15),
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => DBG_Message(14),
      DOB => DBG_Message(15),
      DOC => DBG_MessageData(14),
      DOD => DBG_MessageData(15),
      DOE => NLW_elements_reg_0_63_14_15_DOE_UNCONNECTED,
      DOF => NLW_elements_reg_0_63_14_15_DOF_UNCONNECTED,
      DOG => NLW_elements_reg_0_63_14_15_DOG_UNCONNECTED,
      DOH => NLW_elements_reg_0_63_14_15_DOH_UNCONNECTED,
      WCLK => clk,
      WE => p_0_in10_out
    );
elements_reg_0_63_14_15_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => STAGE_NewMessage,
      I1 => STAGE_Message(15),
      O => p_0_in10_out
    );
elements_reg_0_63_7_13: unisim.vcomponents.RAM64M8
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000",
      INIT_E => X"0000000000000000",
      INIT_F => X"0000000000000000",
      INIT_G => X"0000000000000000",
      INIT_H => X"0000000000000000"
    )
        port map (
      ADDRA(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRA(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRA(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRA(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRA(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRA(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRB(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRB(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRB(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRB(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRB(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRB(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRC(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRC(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRC(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRC(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRC(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRC(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRD(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRD(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRD(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRD(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRD(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRD(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRE(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRE(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRE(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRE(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRE(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRE(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRF(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRF(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRF(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRF(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRF(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRF(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRG(5) => \^currentreadelementindex_reg[5]_0\,
      ADDRG(4) => \^currentreadelementindex_reg[4]_0\,
      ADDRG(3) => \^currentreadelementindex_reg[3]_0\,
      ADDRG(2) => \^currentreadelementindex_reg[2]_0\,
      ADDRG(1) => \^currentreadelementindex_reg[1]_0\,
      ADDRG(0) => \^currentreadelementindex_reg[0]_0\,
      ADDRH(5) => \currentWriteElementIndex_reg_n_0_[5]\,
      ADDRH(4) => \currentWriteElementIndex_reg_n_0_[4]\,
      ADDRH(3) => \currentWriteElementIndex_reg_n_0_[3]\,
      ADDRH(2) => \currentWriteElementIndex_reg_n_0_[2]\,
      ADDRH(1) => \currentWriteElementIndex_reg_n_0_[1]\,
      ADDRH(0) => \currentWriteElementIndex_reg_n_0_[0]\,
      DIA => STAGE_Message(7),
      DIB => STAGE_Message(8),
      DIC => STAGE_Message(9),
      DID => STAGE_Message(10),
      DIE => STAGE_Message(11),
      DIF => STAGE_Message(12),
      DIG => STAGE_Message(13),
      DIH => '0',
      DOA => DBG_Message(7),
      DOB => DBG_Message(8),
      DOC => DBG_Message(9),
      DOD => DBG_Message(10),
      DOE => DBG_Message(11),
      DOF => DBG_Message(12),
      DOG => DBG_Message(13),
      DOH => NLW_elements_reg_0_63_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => p_0_in10_out
    );
endDumpingDebounce_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C8F8C8C8C8C8C8C8"
    )
        port map (
      I0 => DBG_BeginDump,
      I1 => endDumpingDebounce,
      I2 => currentIsDumping,
      I3 => currentIsDumping_i_4_n_0,
      I4 => currentIsDumping_i_3_n_0,
      I5 => currentIsDumping_i_2_n_0,
      O => endDumpingDebounce_i_1_n_0
    );
endDumpingDebounce_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => endDumpingDebounce_i_1_n_0,
      Q => endDumpingDebounce,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_DbgPixelMessages_0_2 is
  port (
    clk : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    DBG_BeginDump : in STD_LOGIC;
    STAGE_Message : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_MessageData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_NewMessage : in STD_LOGIC;
    DBG_IsDumping : out STD_LOGIC;
    DBG_MessageIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_DbgPixelMessages_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_DbgPixelMessages_0_2 : entity is "MainDesign_DbgPixelMessages_0_2,DbgPixelMessages,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_DbgPixelMessages_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_DbgPixelMessages_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_DbgPixelMessages_0_2 : entity is "DbgPixelMessages,Vivado 2025.2";
end MainDesign_DbgPixelMessages_0_2;

architecture STRUCTURE of MainDesign_DbgPixelMessages_0_2 is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
  DBG_IsDumping <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.MainDesign_DbgPixelMessages_0_2_DbgPixelMessages
     port map (
      CMD_EndFrameReset => CMD_EndFrameReset,
      DBG_BeginDump => DBG_BeginDump,
      DBG_Message(15 downto 0) => DBG_Message(15 downto 0),
      DBG_MessageData(15 downto 0) => DBG_MessageData(15 downto 0),
      DBG_MessageIndex(1 downto 0) => DBG_MessageIndex(7 downto 6),
      STAGE_Message(15 downto 0) => STAGE_Message(15 downto 0),
      STAGE_MessageData(15 downto 0) => STAGE_MessageData(15 downto 0),
      STAGE_NewMessage => STAGE_NewMessage,
      clk => clk,
      \currentReadElementIndex_reg[0]_0\ => DBG_MessageIndex(0),
      \currentReadElementIndex_reg[1]_0\ => DBG_MessageIndex(1),
      \currentReadElementIndex_reg[2]_0\ => DBG_MessageIndex(2),
      \currentReadElementIndex_reg[3]_0\ => DBG_MessageIndex(3),
      \currentReadElementIndex_reg[4]_0\ => DBG_MessageIndex(4),
      \currentReadElementIndex_reg[5]_0\ => DBG_MessageIndex(5)
    );
end STRUCTURE;
