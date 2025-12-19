-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:58:55 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StateBlock_0_4/design_1_StateBlock_0_4_sim_netlist.vhdl
-- Design      : design_1_StateBlock_0_4
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_StateBlock_0_4_StateBlock is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \DBG_CurrentReadSlotIndex[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 0 to 0 );
    \DBG_SlotsValid[0]\ : out STD_LOGIC;
    \DBG_SlotsValid[1]\ : out STD_LOGIC;
    \DBG_SlotsValid[2]\ : out STD_LOGIC;
    \DBG_SlotsValid[3]\ : out STD_LOGIC;
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 191 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    clk : in STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 191 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_StateBlock_0_4_StateBlock : entity is "StateBlock";
end design_1_StateBlock_0_4_StateBlock;

architecture STRUCTURE of design_1_StateBlock_0_4_StateBlock is
  signal \^dbg_currentreadslotindex\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dbg_currentreadslotindex[1]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dbg_slot0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot1\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot2\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot3\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slotsvalid[0]\ : STD_LOGIC;
  signal \^dbg_slotsvalid[1]\ : STD_LOGIC;
  signal \^dbg_slotsvalid[2]\ : STD_LOGIC;
  signal \^dbg_slotsvalid[3]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \currentReadSlot[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentReadSlot[0]_rep_i_1_n_0\ : STD_LOGIC;
  signal \currentReadSlot[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentReadSlot[1]_rep_i_1_n_0\ : STD_LOGIC;
  signal \currentReadSlot_reg[1]_rep_n_0\ : STD_LOGIC;
  signal \currentReadSlot_reg_n_0_[0]\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \slotsData[0][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][15]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotIsValid]1_out\ : STD_LOGIC;
  signal \slotsData[0][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][15]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotIsValid]3_out\ : STD_LOGIC;
  signal \slotsData[1][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][15]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotIsValid]5_out\ : STD_LOGIC;
  signal \slotsData[2][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][15]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotIsValid]7_out\ : STD_LOGIC;
  signal \slotsData[3][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData_reg[0][SlotData]\ : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal \slotsData_reg[1][SlotData]\ : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal \slotsData_reg[2][SlotData]\ : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal \slotsData_reg[3][SlotData]\ : STD_LOGIC_VECTOR ( 191 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[2]_INST_0\ : label is "soft_lutpair0";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \currentReadSlot_reg[0]\ : label is "currentReadSlot_reg[0]";
  attribute ORIG_CELL_NAME of \currentReadSlot_reg[0]_rep\ : label is "currentReadSlot_reg[0]";
  attribute ORIG_CELL_NAME of \currentReadSlot_reg[1]\ : label is "currentReadSlot_reg[1]";
  attribute ORIG_CELL_NAME of \currentReadSlot_reg[1]_rep\ : label is "currentReadSlot_reg[1]";
  attribute SOFT_HLUTNM of \currentWriteSlot[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \currentWriteSlot[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][15]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][15]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][15]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][15]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair15";
begin
  DBG_CurrentReadSlotIndex(0) <= \^dbg_currentreadslotindex\(0);
  \DBG_CurrentReadSlotIndex[1]\(0) <= \^dbg_currentreadslotindex[1]\(0);
  DBG_Slot0(15 downto 0) <= \^dbg_slot0\(15 downto 0);
  DBG_Slot1(15 downto 0) <= \^dbg_slot1\(15 downto 0);
  DBG_Slot2(15 downto 0) <= \^dbg_slot2\(15 downto 0);
  DBG_Slot3(15 downto 0) <= \^dbg_slot3\(15 downto 0);
  \DBG_SlotsValid[0]\ <= \^dbg_slotsvalid[0]\;
  \DBG_SlotsValid[1]\ <= \^dbg_slotsvalid[1]\;
  \DBG_SlotsValid[2]\ <= \^dbg_slotsvalid[2]\;
  \DBG_SlotsValid[3]\ <= \^dbg_slotsvalid[3]\;
  Q(1 downto 0) <= \^q\(1 downto 0);
\CMD_NumFreeSlots[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \^dbg_slotsvalid[0]\,
      I1 => \^dbg_slotsvalid[2]\,
      I2 => \^dbg_slotsvalid[3]\,
      I3 => \^dbg_slotsvalid[1]\,
      O => CMD_NumFreeSlots(0)
    );
\CMD_NumFreeSlots[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"177E"
    )
        port map (
      I0 => \^dbg_slotsvalid[0]\,
      I1 => \^dbg_slotsvalid[2]\,
      I2 => \^dbg_slotsvalid[3]\,
      I3 => \^dbg_slotsvalid[1]\,
      O => CMD_NumFreeSlots(1)
    );
\CMD_NumFreeSlots[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^dbg_slotsvalid[2]\,
      I1 => \^dbg_slotsvalid[1]\,
      I2 => \^dbg_slotsvalid[3]\,
      I3 => \^dbg_slotsvalid[0]\,
      O => CMD_NumFreeSlots(2)
    );
\STAGE_NextDrawID[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(0),
      I1 => \^dbg_slot2\(0),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(0),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(0),
      O => STAGE_NextDrawID(0)
    );
\STAGE_NextDrawID[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(10),
      I1 => \^dbg_slot2\(10),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(10),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(10),
      O => STAGE_NextDrawID(10)
    );
\STAGE_NextDrawID[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(11),
      I1 => \^dbg_slot2\(11),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(11),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(11),
      O => STAGE_NextDrawID(11)
    );
\STAGE_NextDrawID[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(12),
      I1 => \^dbg_slot2\(12),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(12),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(12),
      O => STAGE_NextDrawID(12)
    );
\STAGE_NextDrawID[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(13),
      I1 => \^dbg_slot2\(13),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(13),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(13),
      O => STAGE_NextDrawID(13)
    );
\STAGE_NextDrawID[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(14),
      I1 => \^dbg_slot2\(14),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(14),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(14),
      O => STAGE_NextDrawID(14)
    );
\STAGE_NextDrawID[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(15),
      I1 => \^dbg_slot2\(15),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(15),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(15),
      O => STAGE_NextDrawID(15)
    );
\STAGE_NextDrawID[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(1),
      I1 => \^dbg_slot2\(1),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(1),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(1),
      O => STAGE_NextDrawID(1)
    );
\STAGE_NextDrawID[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(2),
      I1 => \^dbg_slot2\(2),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(2),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(2),
      O => STAGE_NextDrawID(2)
    );
\STAGE_NextDrawID[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(3),
      I1 => \^dbg_slot2\(3),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(3),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(3),
      O => STAGE_NextDrawID(3)
    );
\STAGE_NextDrawID[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(4),
      I1 => \^dbg_slot2\(4),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(4),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(4),
      O => STAGE_NextDrawID(4)
    );
\STAGE_NextDrawID[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(5),
      I1 => \^dbg_slot2\(5),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(5),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(5),
      O => STAGE_NextDrawID(5)
    );
\STAGE_NextDrawID[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(6),
      I1 => \^dbg_slot2\(6),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(6),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(6),
      O => STAGE_NextDrawID(6)
    );
\STAGE_NextDrawID[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(7),
      I1 => \^dbg_slot2\(7),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(7),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(7),
      O => STAGE_NextDrawID(7)
    );
\STAGE_NextDrawID[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(8),
      I1 => \^dbg_slot2\(8),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(8),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(8),
      O => STAGE_NextDrawID(8)
    );
\STAGE_NextDrawID[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slot3\(9),
      I1 => \^dbg_slot2\(9),
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slot1\(9),
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slot0\(9),
      O => STAGE_NextDrawID(9)
    );
\STAGE_StateBitsAtDrawID[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(0),
      I1 => \slotsData_reg[2][SlotData]\(0),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(0),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(0),
      O => STAGE_StateBitsAtDrawID(0)
    );
\STAGE_StateBitsAtDrawID[100]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(100),
      I1 => \slotsData_reg[2][SlotData]\(100),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(100),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(100),
      O => STAGE_StateBitsAtDrawID(100)
    );
\STAGE_StateBitsAtDrawID[101]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(101),
      I1 => \slotsData_reg[2][SlotData]\(101),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(101),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(101),
      O => STAGE_StateBitsAtDrawID(101)
    );
\STAGE_StateBitsAtDrawID[102]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(102),
      I1 => \slotsData_reg[2][SlotData]\(102),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(102),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(102),
      O => STAGE_StateBitsAtDrawID(102)
    );
\STAGE_StateBitsAtDrawID[103]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(103),
      I1 => \slotsData_reg[2][SlotData]\(103),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(103),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(103),
      O => STAGE_StateBitsAtDrawID(103)
    );
\STAGE_StateBitsAtDrawID[104]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(104),
      I1 => \slotsData_reg[2][SlotData]\(104),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(104),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(104),
      O => STAGE_StateBitsAtDrawID(104)
    );
\STAGE_StateBitsAtDrawID[105]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(105),
      I1 => \slotsData_reg[2][SlotData]\(105),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(105),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(105),
      O => STAGE_StateBitsAtDrawID(105)
    );
\STAGE_StateBitsAtDrawID[106]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(106),
      I1 => \slotsData_reg[2][SlotData]\(106),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(106),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(106),
      O => STAGE_StateBitsAtDrawID(106)
    );
\STAGE_StateBitsAtDrawID[107]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(107),
      I1 => \slotsData_reg[2][SlotData]\(107),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(107),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(107),
      O => STAGE_StateBitsAtDrawID(107)
    );
\STAGE_StateBitsAtDrawID[108]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(108),
      I1 => \slotsData_reg[2][SlotData]\(108),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(108),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(108),
      O => STAGE_StateBitsAtDrawID(108)
    );
\STAGE_StateBitsAtDrawID[109]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(109),
      I1 => \slotsData_reg[2][SlotData]\(109),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(109),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(109),
      O => STAGE_StateBitsAtDrawID(109)
    );
\STAGE_StateBitsAtDrawID[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(10),
      I1 => \slotsData_reg[2][SlotData]\(10),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(10),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(10),
      O => STAGE_StateBitsAtDrawID(10)
    );
\STAGE_StateBitsAtDrawID[110]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(110),
      I1 => \slotsData_reg[2][SlotData]\(110),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(110),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(110),
      O => STAGE_StateBitsAtDrawID(110)
    );
\STAGE_StateBitsAtDrawID[111]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(111),
      I1 => \slotsData_reg[2][SlotData]\(111),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(111),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(111),
      O => STAGE_StateBitsAtDrawID(111)
    );
\STAGE_StateBitsAtDrawID[112]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(112),
      I1 => \slotsData_reg[2][SlotData]\(112),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(112),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(112),
      O => STAGE_StateBitsAtDrawID(112)
    );
\STAGE_StateBitsAtDrawID[113]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(113),
      I1 => \slotsData_reg[2][SlotData]\(113),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(113),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(113),
      O => STAGE_StateBitsAtDrawID(113)
    );
\STAGE_StateBitsAtDrawID[114]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(114),
      I1 => \slotsData_reg[2][SlotData]\(114),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(114),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(114),
      O => STAGE_StateBitsAtDrawID(114)
    );
\STAGE_StateBitsAtDrawID[115]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(115),
      I1 => \slotsData_reg[2][SlotData]\(115),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(115),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(115),
      O => STAGE_StateBitsAtDrawID(115)
    );
\STAGE_StateBitsAtDrawID[116]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(116),
      I1 => \slotsData_reg[2][SlotData]\(116),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(116),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(116),
      O => STAGE_StateBitsAtDrawID(116)
    );
\STAGE_StateBitsAtDrawID[117]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(117),
      I1 => \slotsData_reg[2][SlotData]\(117),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(117),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(117),
      O => STAGE_StateBitsAtDrawID(117)
    );
\STAGE_StateBitsAtDrawID[118]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(118),
      I1 => \slotsData_reg[2][SlotData]\(118),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(118),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(118),
      O => STAGE_StateBitsAtDrawID(118)
    );
\STAGE_StateBitsAtDrawID[119]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(119),
      I1 => \slotsData_reg[2][SlotData]\(119),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(119),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(119),
      O => STAGE_StateBitsAtDrawID(119)
    );
\STAGE_StateBitsAtDrawID[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(11),
      I1 => \slotsData_reg[2][SlotData]\(11),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(11),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(11),
      O => STAGE_StateBitsAtDrawID(11)
    );
\STAGE_StateBitsAtDrawID[120]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(120),
      I1 => \slotsData_reg[2][SlotData]\(120),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(120),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(120),
      O => STAGE_StateBitsAtDrawID(120)
    );
\STAGE_StateBitsAtDrawID[121]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(121),
      I1 => \slotsData_reg[2][SlotData]\(121),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(121),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(121),
      O => STAGE_StateBitsAtDrawID(121)
    );
\STAGE_StateBitsAtDrawID[122]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(122),
      I1 => \slotsData_reg[2][SlotData]\(122),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(122),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(122),
      O => STAGE_StateBitsAtDrawID(122)
    );
\STAGE_StateBitsAtDrawID[123]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(123),
      I1 => \slotsData_reg[2][SlotData]\(123),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(123),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(123),
      O => STAGE_StateBitsAtDrawID(123)
    );
\STAGE_StateBitsAtDrawID[124]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(124),
      I1 => \slotsData_reg[2][SlotData]\(124),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(124),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(124),
      O => STAGE_StateBitsAtDrawID(124)
    );
\STAGE_StateBitsAtDrawID[125]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(125),
      I1 => \slotsData_reg[2][SlotData]\(125),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(125),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(125),
      O => STAGE_StateBitsAtDrawID(125)
    );
\STAGE_StateBitsAtDrawID[126]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(126),
      I1 => \slotsData_reg[2][SlotData]\(126),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(126),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(126),
      O => STAGE_StateBitsAtDrawID(126)
    );
\STAGE_StateBitsAtDrawID[127]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(127),
      I1 => \slotsData_reg[2][SlotData]\(127),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(127),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(127),
      O => STAGE_StateBitsAtDrawID(127)
    );
\STAGE_StateBitsAtDrawID[128]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(128),
      I1 => \slotsData_reg[2][SlotData]\(128),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(128),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(128),
      O => STAGE_StateBitsAtDrawID(128)
    );
\STAGE_StateBitsAtDrawID[129]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(129),
      I1 => \slotsData_reg[2][SlotData]\(129),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(129),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(129),
      O => STAGE_StateBitsAtDrawID(129)
    );
\STAGE_StateBitsAtDrawID[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(12),
      I1 => \slotsData_reg[2][SlotData]\(12),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(12),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(12),
      O => STAGE_StateBitsAtDrawID(12)
    );
\STAGE_StateBitsAtDrawID[130]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(130),
      I1 => \slotsData_reg[2][SlotData]\(130),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(130),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(130),
      O => STAGE_StateBitsAtDrawID(130)
    );
\STAGE_StateBitsAtDrawID[131]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(131),
      I1 => \slotsData_reg[2][SlotData]\(131),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(131),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(131),
      O => STAGE_StateBitsAtDrawID(131)
    );
\STAGE_StateBitsAtDrawID[132]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(132),
      I1 => \slotsData_reg[2][SlotData]\(132),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(132),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(132),
      O => STAGE_StateBitsAtDrawID(132)
    );
\STAGE_StateBitsAtDrawID[133]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(133),
      I1 => \slotsData_reg[2][SlotData]\(133),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(133),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(133),
      O => STAGE_StateBitsAtDrawID(133)
    );
\STAGE_StateBitsAtDrawID[134]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(134),
      I1 => \slotsData_reg[2][SlotData]\(134),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(134),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(134),
      O => STAGE_StateBitsAtDrawID(134)
    );
\STAGE_StateBitsAtDrawID[135]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(135),
      I1 => \slotsData_reg[2][SlotData]\(135),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(135),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(135),
      O => STAGE_StateBitsAtDrawID(135)
    );
\STAGE_StateBitsAtDrawID[136]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(136),
      I1 => \slotsData_reg[2][SlotData]\(136),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(136),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(136),
      O => STAGE_StateBitsAtDrawID(136)
    );
\STAGE_StateBitsAtDrawID[137]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(137),
      I1 => \slotsData_reg[2][SlotData]\(137),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(137),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(137),
      O => STAGE_StateBitsAtDrawID(137)
    );
\STAGE_StateBitsAtDrawID[138]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(138),
      I1 => \slotsData_reg[2][SlotData]\(138),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(138),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(138),
      O => STAGE_StateBitsAtDrawID(138)
    );
\STAGE_StateBitsAtDrawID[139]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(139),
      I1 => \slotsData_reg[2][SlotData]\(139),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(139),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(139),
      O => STAGE_StateBitsAtDrawID(139)
    );
\STAGE_StateBitsAtDrawID[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(13),
      I1 => \slotsData_reg[2][SlotData]\(13),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(13),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(13),
      O => STAGE_StateBitsAtDrawID(13)
    );
\STAGE_StateBitsAtDrawID[140]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(140),
      I1 => \slotsData_reg[2][SlotData]\(140),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(140),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(140),
      O => STAGE_StateBitsAtDrawID(140)
    );
\STAGE_StateBitsAtDrawID[141]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(141),
      I1 => \slotsData_reg[2][SlotData]\(141),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(141),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(141),
      O => STAGE_StateBitsAtDrawID(141)
    );
\STAGE_StateBitsAtDrawID[142]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(142),
      I1 => \slotsData_reg[2][SlotData]\(142),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(142),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(142),
      O => STAGE_StateBitsAtDrawID(142)
    );
\STAGE_StateBitsAtDrawID[143]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(143),
      I1 => \slotsData_reg[2][SlotData]\(143),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(143),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(143),
      O => STAGE_StateBitsAtDrawID(143)
    );
\STAGE_StateBitsAtDrawID[144]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(144),
      I1 => \slotsData_reg[2][SlotData]\(144),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(144),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(144),
      O => STAGE_StateBitsAtDrawID(144)
    );
\STAGE_StateBitsAtDrawID[145]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(145),
      I1 => \slotsData_reg[2][SlotData]\(145),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(145),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(145),
      O => STAGE_StateBitsAtDrawID(145)
    );
\STAGE_StateBitsAtDrawID[146]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(146),
      I1 => \slotsData_reg[2][SlotData]\(146),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(146),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(146),
      O => STAGE_StateBitsAtDrawID(146)
    );
\STAGE_StateBitsAtDrawID[147]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(147),
      I1 => \slotsData_reg[2][SlotData]\(147),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(147),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(147),
      O => STAGE_StateBitsAtDrawID(147)
    );
\STAGE_StateBitsAtDrawID[148]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(148),
      I1 => \slotsData_reg[2][SlotData]\(148),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(148),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(148),
      O => STAGE_StateBitsAtDrawID(148)
    );
\STAGE_StateBitsAtDrawID[149]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(149),
      I1 => \slotsData_reg[2][SlotData]\(149),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(149),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(149),
      O => STAGE_StateBitsAtDrawID(149)
    );
\STAGE_StateBitsAtDrawID[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(14),
      I1 => \slotsData_reg[2][SlotData]\(14),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(14),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(14),
      O => STAGE_StateBitsAtDrawID(14)
    );
\STAGE_StateBitsAtDrawID[150]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(150),
      I1 => \slotsData_reg[2][SlotData]\(150),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(150),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(150),
      O => STAGE_StateBitsAtDrawID(150)
    );
\STAGE_StateBitsAtDrawID[151]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(151),
      I1 => \slotsData_reg[2][SlotData]\(151),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(151),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(151),
      O => STAGE_StateBitsAtDrawID(151)
    );
\STAGE_StateBitsAtDrawID[152]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(152),
      I1 => \slotsData_reg[2][SlotData]\(152),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(152),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(152),
      O => STAGE_StateBitsAtDrawID(152)
    );
\STAGE_StateBitsAtDrawID[153]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(153),
      I1 => \slotsData_reg[2][SlotData]\(153),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(153),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(153),
      O => STAGE_StateBitsAtDrawID(153)
    );
\STAGE_StateBitsAtDrawID[154]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(154),
      I1 => \slotsData_reg[2][SlotData]\(154),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(154),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(154),
      O => STAGE_StateBitsAtDrawID(154)
    );
\STAGE_StateBitsAtDrawID[155]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(155),
      I1 => \slotsData_reg[2][SlotData]\(155),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(155),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(155),
      O => STAGE_StateBitsAtDrawID(155)
    );
\STAGE_StateBitsAtDrawID[156]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(156),
      I1 => \slotsData_reg[2][SlotData]\(156),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(156),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(156),
      O => STAGE_StateBitsAtDrawID(156)
    );
\STAGE_StateBitsAtDrawID[157]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(157),
      I1 => \slotsData_reg[2][SlotData]\(157),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(157),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(157),
      O => STAGE_StateBitsAtDrawID(157)
    );
\STAGE_StateBitsAtDrawID[158]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(158),
      I1 => \slotsData_reg[2][SlotData]\(158),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(158),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(158),
      O => STAGE_StateBitsAtDrawID(158)
    );
\STAGE_StateBitsAtDrawID[159]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(159),
      I1 => \slotsData_reg[2][SlotData]\(159),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(159),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(159),
      O => STAGE_StateBitsAtDrawID(159)
    );
\STAGE_StateBitsAtDrawID[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(15),
      I1 => \slotsData_reg[2][SlotData]\(15),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(15),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(15),
      O => STAGE_StateBitsAtDrawID(15)
    );
\STAGE_StateBitsAtDrawID[160]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(160),
      I1 => \slotsData_reg[2][SlotData]\(160),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(160),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(160),
      O => STAGE_StateBitsAtDrawID(160)
    );
\STAGE_StateBitsAtDrawID[161]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(161),
      I1 => \slotsData_reg[2][SlotData]\(161),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(161),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(161),
      O => STAGE_StateBitsAtDrawID(161)
    );
\STAGE_StateBitsAtDrawID[162]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(162),
      I1 => \slotsData_reg[2][SlotData]\(162),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(162),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(162),
      O => STAGE_StateBitsAtDrawID(162)
    );
\STAGE_StateBitsAtDrawID[163]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(163),
      I1 => \slotsData_reg[2][SlotData]\(163),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(163),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(163),
      O => STAGE_StateBitsAtDrawID(163)
    );
\STAGE_StateBitsAtDrawID[164]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(164),
      I1 => \slotsData_reg[2][SlotData]\(164),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(164),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(164),
      O => STAGE_StateBitsAtDrawID(164)
    );
\STAGE_StateBitsAtDrawID[165]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(165),
      I1 => \slotsData_reg[2][SlotData]\(165),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(165),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(165),
      O => STAGE_StateBitsAtDrawID(165)
    );
\STAGE_StateBitsAtDrawID[166]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(166),
      I1 => \slotsData_reg[2][SlotData]\(166),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(166),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(166),
      O => STAGE_StateBitsAtDrawID(166)
    );
\STAGE_StateBitsAtDrawID[167]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(167),
      I1 => \slotsData_reg[2][SlotData]\(167),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(167),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(167),
      O => STAGE_StateBitsAtDrawID(167)
    );
\STAGE_StateBitsAtDrawID[168]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(168),
      I1 => \slotsData_reg[2][SlotData]\(168),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(168),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(168),
      O => STAGE_StateBitsAtDrawID(168)
    );
\STAGE_StateBitsAtDrawID[169]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(169),
      I1 => \slotsData_reg[2][SlotData]\(169),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(169),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(169),
      O => STAGE_StateBitsAtDrawID(169)
    );
\STAGE_StateBitsAtDrawID[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(16),
      I1 => \slotsData_reg[2][SlotData]\(16),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(16),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(16),
      O => STAGE_StateBitsAtDrawID(16)
    );
\STAGE_StateBitsAtDrawID[170]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(170),
      I1 => \slotsData_reg[2][SlotData]\(170),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(170),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(170),
      O => STAGE_StateBitsAtDrawID(170)
    );
\STAGE_StateBitsAtDrawID[171]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(171),
      I1 => \slotsData_reg[2][SlotData]\(171),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(171),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(171),
      O => STAGE_StateBitsAtDrawID(171)
    );
\STAGE_StateBitsAtDrawID[172]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(172),
      I1 => \slotsData_reg[2][SlotData]\(172),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(172),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(172),
      O => STAGE_StateBitsAtDrawID(172)
    );
\STAGE_StateBitsAtDrawID[173]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(173),
      I1 => \slotsData_reg[2][SlotData]\(173),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(173),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(173),
      O => STAGE_StateBitsAtDrawID(173)
    );
\STAGE_StateBitsAtDrawID[174]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(174),
      I1 => \slotsData_reg[2][SlotData]\(174),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(174),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(174),
      O => STAGE_StateBitsAtDrawID(174)
    );
\STAGE_StateBitsAtDrawID[175]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(175),
      I1 => \slotsData_reg[2][SlotData]\(175),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(175),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(175),
      O => STAGE_StateBitsAtDrawID(175)
    );
\STAGE_StateBitsAtDrawID[176]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(176),
      I1 => \slotsData_reg[2][SlotData]\(176),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(176),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(176),
      O => STAGE_StateBitsAtDrawID(176)
    );
\STAGE_StateBitsAtDrawID[177]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(177),
      I1 => \slotsData_reg[2][SlotData]\(177),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(177),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(177),
      O => STAGE_StateBitsAtDrawID(177)
    );
\STAGE_StateBitsAtDrawID[178]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(178),
      I1 => \slotsData_reg[2][SlotData]\(178),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(178),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(178),
      O => STAGE_StateBitsAtDrawID(178)
    );
\STAGE_StateBitsAtDrawID[179]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(179),
      I1 => \slotsData_reg[2][SlotData]\(179),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(179),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(179),
      O => STAGE_StateBitsAtDrawID(179)
    );
\STAGE_StateBitsAtDrawID[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(17),
      I1 => \slotsData_reg[2][SlotData]\(17),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(17),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(17),
      O => STAGE_StateBitsAtDrawID(17)
    );
\STAGE_StateBitsAtDrawID[180]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(180),
      I1 => \slotsData_reg[2][SlotData]\(180),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(180),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(180),
      O => STAGE_StateBitsAtDrawID(180)
    );
\STAGE_StateBitsAtDrawID[181]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(181),
      I1 => \slotsData_reg[2][SlotData]\(181),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(181),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(181),
      O => STAGE_StateBitsAtDrawID(181)
    );
\STAGE_StateBitsAtDrawID[182]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(182),
      I1 => \slotsData_reg[2][SlotData]\(182),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(182),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(182),
      O => STAGE_StateBitsAtDrawID(182)
    );
\STAGE_StateBitsAtDrawID[183]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(183),
      I1 => \slotsData_reg[2][SlotData]\(183),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(183),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(183),
      O => STAGE_StateBitsAtDrawID(183)
    );
\STAGE_StateBitsAtDrawID[184]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(184),
      I1 => \slotsData_reg[2][SlotData]\(184),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(184),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(184),
      O => STAGE_StateBitsAtDrawID(184)
    );
\STAGE_StateBitsAtDrawID[185]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(185),
      I1 => \slotsData_reg[2][SlotData]\(185),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(185),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(185),
      O => STAGE_StateBitsAtDrawID(185)
    );
\STAGE_StateBitsAtDrawID[186]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(186),
      I1 => \slotsData_reg[2][SlotData]\(186),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(186),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(186),
      O => STAGE_StateBitsAtDrawID(186)
    );
\STAGE_StateBitsAtDrawID[187]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(187),
      I1 => \slotsData_reg[2][SlotData]\(187),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(187),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(187),
      O => STAGE_StateBitsAtDrawID(187)
    );
\STAGE_StateBitsAtDrawID[188]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(188),
      I1 => \slotsData_reg[2][SlotData]\(188),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(188),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(188),
      O => STAGE_StateBitsAtDrawID(188)
    );
\STAGE_StateBitsAtDrawID[189]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(189),
      I1 => \slotsData_reg[2][SlotData]\(189),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(189),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(189),
      O => STAGE_StateBitsAtDrawID(189)
    );
\STAGE_StateBitsAtDrawID[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(18),
      I1 => \slotsData_reg[2][SlotData]\(18),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(18),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(18),
      O => STAGE_StateBitsAtDrawID(18)
    );
\STAGE_StateBitsAtDrawID[190]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(190),
      I1 => \slotsData_reg[2][SlotData]\(190),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(190),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(190),
      O => STAGE_StateBitsAtDrawID(190)
    );
\STAGE_StateBitsAtDrawID[191]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(191),
      I1 => \slotsData_reg[2][SlotData]\(191),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(191),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(191),
      O => STAGE_StateBitsAtDrawID(191)
    );
\STAGE_StateBitsAtDrawID[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(19),
      I1 => \slotsData_reg[2][SlotData]\(19),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(19),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(19),
      O => STAGE_StateBitsAtDrawID(19)
    );
\STAGE_StateBitsAtDrawID[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(1),
      I1 => \slotsData_reg[2][SlotData]\(1),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(1),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(1),
      O => STAGE_StateBitsAtDrawID(1)
    );
\STAGE_StateBitsAtDrawID[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(20),
      I1 => \slotsData_reg[2][SlotData]\(20),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(20),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(20),
      O => STAGE_StateBitsAtDrawID(20)
    );
\STAGE_StateBitsAtDrawID[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(21),
      I1 => \slotsData_reg[2][SlotData]\(21),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(21),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(21),
      O => STAGE_StateBitsAtDrawID(21)
    );
\STAGE_StateBitsAtDrawID[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(22),
      I1 => \slotsData_reg[2][SlotData]\(22),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(22),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(22),
      O => STAGE_StateBitsAtDrawID(22)
    );
\STAGE_StateBitsAtDrawID[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(23),
      I1 => \slotsData_reg[2][SlotData]\(23),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(23),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(23),
      O => STAGE_StateBitsAtDrawID(23)
    );
\STAGE_StateBitsAtDrawID[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(24),
      I1 => \slotsData_reg[2][SlotData]\(24),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(24),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(24),
      O => STAGE_StateBitsAtDrawID(24)
    );
\STAGE_StateBitsAtDrawID[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(25),
      I1 => \slotsData_reg[2][SlotData]\(25),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(25),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(25),
      O => STAGE_StateBitsAtDrawID(25)
    );
\STAGE_StateBitsAtDrawID[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(26),
      I1 => \slotsData_reg[2][SlotData]\(26),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(26),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(26),
      O => STAGE_StateBitsAtDrawID(26)
    );
\STAGE_StateBitsAtDrawID[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(27),
      I1 => \slotsData_reg[2][SlotData]\(27),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(27),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(27),
      O => STAGE_StateBitsAtDrawID(27)
    );
\STAGE_StateBitsAtDrawID[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(28),
      I1 => \slotsData_reg[2][SlotData]\(28),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(28),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(28),
      O => STAGE_StateBitsAtDrawID(28)
    );
\STAGE_StateBitsAtDrawID[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(29),
      I1 => \slotsData_reg[2][SlotData]\(29),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(29),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(29),
      O => STAGE_StateBitsAtDrawID(29)
    );
\STAGE_StateBitsAtDrawID[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(2),
      I1 => \slotsData_reg[2][SlotData]\(2),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(2),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(2),
      O => STAGE_StateBitsAtDrawID(2)
    );
\STAGE_StateBitsAtDrawID[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(30),
      I1 => \slotsData_reg[2][SlotData]\(30),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(30),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(30),
      O => STAGE_StateBitsAtDrawID(30)
    );
\STAGE_StateBitsAtDrawID[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(31),
      I1 => \slotsData_reg[2][SlotData]\(31),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(31),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(31),
      O => STAGE_StateBitsAtDrawID(31)
    );
\STAGE_StateBitsAtDrawID[32]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(32),
      I1 => \slotsData_reg[2][SlotData]\(32),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(32),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(32),
      O => STAGE_StateBitsAtDrawID(32)
    );
\STAGE_StateBitsAtDrawID[33]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(33),
      I1 => \slotsData_reg[2][SlotData]\(33),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(33),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(33),
      O => STAGE_StateBitsAtDrawID(33)
    );
\STAGE_StateBitsAtDrawID[34]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(34),
      I1 => \slotsData_reg[2][SlotData]\(34),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(34),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(34),
      O => STAGE_StateBitsAtDrawID(34)
    );
\STAGE_StateBitsAtDrawID[35]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(35),
      I1 => \slotsData_reg[2][SlotData]\(35),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(35),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(35),
      O => STAGE_StateBitsAtDrawID(35)
    );
\STAGE_StateBitsAtDrawID[36]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(36),
      I1 => \slotsData_reg[2][SlotData]\(36),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(36),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(36),
      O => STAGE_StateBitsAtDrawID(36)
    );
\STAGE_StateBitsAtDrawID[37]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(37),
      I1 => \slotsData_reg[2][SlotData]\(37),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(37),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(37),
      O => STAGE_StateBitsAtDrawID(37)
    );
\STAGE_StateBitsAtDrawID[38]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(38),
      I1 => \slotsData_reg[2][SlotData]\(38),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(38),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(38),
      O => STAGE_StateBitsAtDrawID(38)
    );
\STAGE_StateBitsAtDrawID[39]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(39),
      I1 => \slotsData_reg[2][SlotData]\(39),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(39),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(39),
      O => STAGE_StateBitsAtDrawID(39)
    );
\STAGE_StateBitsAtDrawID[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(3),
      I1 => \slotsData_reg[2][SlotData]\(3),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(3),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(3),
      O => STAGE_StateBitsAtDrawID(3)
    );
\STAGE_StateBitsAtDrawID[40]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(40),
      I1 => \slotsData_reg[2][SlotData]\(40),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(40),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(40),
      O => STAGE_StateBitsAtDrawID(40)
    );
\STAGE_StateBitsAtDrawID[41]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(41),
      I1 => \slotsData_reg[2][SlotData]\(41),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(41),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(41),
      O => STAGE_StateBitsAtDrawID(41)
    );
\STAGE_StateBitsAtDrawID[42]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(42),
      I1 => \slotsData_reg[2][SlotData]\(42),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(42),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(42),
      O => STAGE_StateBitsAtDrawID(42)
    );
\STAGE_StateBitsAtDrawID[43]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(43),
      I1 => \slotsData_reg[2][SlotData]\(43),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(43),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(43),
      O => STAGE_StateBitsAtDrawID(43)
    );
\STAGE_StateBitsAtDrawID[44]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(44),
      I1 => \slotsData_reg[2][SlotData]\(44),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(44),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(44),
      O => STAGE_StateBitsAtDrawID(44)
    );
\STAGE_StateBitsAtDrawID[45]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(45),
      I1 => \slotsData_reg[2][SlotData]\(45),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(45),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(45),
      O => STAGE_StateBitsAtDrawID(45)
    );
\STAGE_StateBitsAtDrawID[46]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(46),
      I1 => \slotsData_reg[2][SlotData]\(46),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(46),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(46),
      O => STAGE_StateBitsAtDrawID(46)
    );
\STAGE_StateBitsAtDrawID[47]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(47),
      I1 => \slotsData_reg[2][SlotData]\(47),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(47),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(47),
      O => STAGE_StateBitsAtDrawID(47)
    );
\STAGE_StateBitsAtDrawID[48]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(48),
      I1 => \slotsData_reg[2][SlotData]\(48),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(48),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(48),
      O => STAGE_StateBitsAtDrawID(48)
    );
\STAGE_StateBitsAtDrawID[49]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(49),
      I1 => \slotsData_reg[2][SlotData]\(49),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(49),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(49),
      O => STAGE_StateBitsAtDrawID(49)
    );
\STAGE_StateBitsAtDrawID[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(4),
      I1 => \slotsData_reg[2][SlotData]\(4),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(4),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(4),
      O => STAGE_StateBitsAtDrawID(4)
    );
\STAGE_StateBitsAtDrawID[50]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(50),
      I1 => \slotsData_reg[2][SlotData]\(50),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(50),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(50),
      O => STAGE_StateBitsAtDrawID(50)
    );
\STAGE_StateBitsAtDrawID[51]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(51),
      I1 => \slotsData_reg[2][SlotData]\(51),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(51),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(51),
      O => STAGE_StateBitsAtDrawID(51)
    );
\STAGE_StateBitsAtDrawID[52]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(52),
      I1 => \slotsData_reg[2][SlotData]\(52),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(52),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(52),
      O => STAGE_StateBitsAtDrawID(52)
    );
\STAGE_StateBitsAtDrawID[53]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(53),
      I1 => \slotsData_reg[2][SlotData]\(53),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(53),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(53),
      O => STAGE_StateBitsAtDrawID(53)
    );
\STAGE_StateBitsAtDrawID[54]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(54),
      I1 => \slotsData_reg[2][SlotData]\(54),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(54),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(54),
      O => STAGE_StateBitsAtDrawID(54)
    );
\STAGE_StateBitsAtDrawID[55]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(55),
      I1 => \slotsData_reg[2][SlotData]\(55),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(55),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(55),
      O => STAGE_StateBitsAtDrawID(55)
    );
\STAGE_StateBitsAtDrawID[56]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(56),
      I1 => \slotsData_reg[2][SlotData]\(56),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(56),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(56),
      O => STAGE_StateBitsAtDrawID(56)
    );
\STAGE_StateBitsAtDrawID[57]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(57),
      I1 => \slotsData_reg[2][SlotData]\(57),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(57),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(57),
      O => STAGE_StateBitsAtDrawID(57)
    );
\STAGE_StateBitsAtDrawID[58]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(58),
      I1 => \slotsData_reg[2][SlotData]\(58),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(58),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(58),
      O => STAGE_StateBitsAtDrawID(58)
    );
\STAGE_StateBitsAtDrawID[59]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(59),
      I1 => \slotsData_reg[2][SlotData]\(59),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(59),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(59),
      O => STAGE_StateBitsAtDrawID(59)
    );
\STAGE_StateBitsAtDrawID[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(5),
      I1 => \slotsData_reg[2][SlotData]\(5),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(5),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(5),
      O => STAGE_StateBitsAtDrawID(5)
    );
\STAGE_StateBitsAtDrawID[60]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(60),
      I1 => \slotsData_reg[2][SlotData]\(60),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(60),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(60),
      O => STAGE_StateBitsAtDrawID(60)
    );
\STAGE_StateBitsAtDrawID[61]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(61),
      I1 => \slotsData_reg[2][SlotData]\(61),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(61),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(61),
      O => STAGE_StateBitsAtDrawID(61)
    );
\STAGE_StateBitsAtDrawID[62]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(62),
      I1 => \slotsData_reg[2][SlotData]\(62),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(62),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(62),
      O => STAGE_StateBitsAtDrawID(62)
    );
\STAGE_StateBitsAtDrawID[63]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(63),
      I1 => \slotsData_reg[2][SlotData]\(63),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(63),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(63),
      O => STAGE_StateBitsAtDrawID(63)
    );
\STAGE_StateBitsAtDrawID[64]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(64),
      I1 => \slotsData_reg[2][SlotData]\(64),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(64),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(64),
      O => STAGE_StateBitsAtDrawID(64)
    );
\STAGE_StateBitsAtDrawID[65]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(65),
      I1 => \slotsData_reg[2][SlotData]\(65),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(65),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(65),
      O => STAGE_StateBitsAtDrawID(65)
    );
\STAGE_StateBitsAtDrawID[66]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(66),
      I1 => \slotsData_reg[2][SlotData]\(66),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(66),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(66),
      O => STAGE_StateBitsAtDrawID(66)
    );
\STAGE_StateBitsAtDrawID[67]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(67),
      I1 => \slotsData_reg[2][SlotData]\(67),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(67),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(67),
      O => STAGE_StateBitsAtDrawID(67)
    );
\STAGE_StateBitsAtDrawID[68]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(68),
      I1 => \slotsData_reg[2][SlotData]\(68),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(68),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(68),
      O => STAGE_StateBitsAtDrawID(68)
    );
\STAGE_StateBitsAtDrawID[69]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(69),
      I1 => \slotsData_reg[2][SlotData]\(69),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(69),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(69),
      O => STAGE_StateBitsAtDrawID(69)
    );
\STAGE_StateBitsAtDrawID[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(6),
      I1 => \slotsData_reg[2][SlotData]\(6),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(6),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(6),
      O => STAGE_StateBitsAtDrawID(6)
    );
\STAGE_StateBitsAtDrawID[70]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(70),
      I1 => \slotsData_reg[2][SlotData]\(70),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(70),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(70),
      O => STAGE_StateBitsAtDrawID(70)
    );
\STAGE_StateBitsAtDrawID[71]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(71),
      I1 => \slotsData_reg[2][SlotData]\(71),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(71),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(71),
      O => STAGE_StateBitsAtDrawID(71)
    );
\STAGE_StateBitsAtDrawID[72]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(72),
      I1 => \slotsData_reg[2][SlotData]\(72),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(72),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(72),
      O => STAGE_StateBitsAtDrawID(72)
    );
\STAGE_StateBitsAtDrawID[73]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(73),
      I1 => \slotsData_reg[2][SlotData]\(73),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(73),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(73),
      O => STAGE_StateBitsAtDrawID(73)
    );
\STAGE_StateBitsAtDrawID[74]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(74),
      I1 => \slotsData_reg[2][SlotData]\(74),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(74),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(74),
      O => STAGE_StateBitsAtDrawID(74)
    );
\STAGE_StateBitsAtDrawID[75]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(75),
      I1 => \slotsData_reg[2][SlotData]\(75),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(75),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(75),
      O => STAGE_StateBitsAtDrawID(75)
    );
\STAGE_StateBitsAtDrawID[76]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(76),
      I1 => \slotsData_reg[2][SlotData]\(76),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(76),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(76),
      O => STAGE_StateBitsAtDrawID(76)
    );
\STAGE_StateBitsAtDrawID[77]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(77),
      I1 => \slotsData_reg[2][SlotData]\(77),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(77),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(77),
      O => STAGE_StateBitsAtDrawID(77)
    );
\STAGE_StateBitsAtDrawID[78]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(78),
      I1 => \slotsData_reg[2][SlotData]\(78),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(78),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(78),
      O => STAGE_StateBitsAtDrawID(78)
    );
\STAGE_StateBitsAtDrawID[79]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(79),
      I1 => \slotsData_reg[2][SlotData]\(79),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(79),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(79),
      O => STAGE_StateBitsAtDrawID(79)
    );
\STAGE_StateBitsAtDrawID[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(7),
      I1 => \slotsData_reg[2][SlotData]\(7),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(7),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(7),
      O => STAGE_StateBitsAtDrawID(7)
    );
\STAGE_StateBitsAtDrawID[80]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(80),
      I1 => \slotsData_reg[2][SlotData]\(80),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(80),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(80),
      O => STAGE_StateBitsAtDrawID(80)
    );
\STAGE_StateBitsAtDrawID[81]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(81),
      I1 => \slotsData_reg[2][SlotData]\(81),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(81),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(81),
      O => STAGE_StateBitsAtDrawID(81)
    );
\STAGE_StateBitsAtDrawID[82]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(82),
      I1 => \slotsData_reg[2][SlotData]\(82),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(82),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(82),
      O => STAGE_StateBitsAtDrawID(82)
    );
\STAGE_StateBitsAtDrawID[83]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(83),
      I1 => \slotsData_reg[2][SlotData]\(83),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(83),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(83),
      O => STAGE_StateBitsAtDrawID(83)
    );
\STAGE_StateBitsAtDrawID[84]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(84),
      I1 => \slotsData_reg[2][SlotData]\(84),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(84),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(84),
      O => STAGE_StateBitsAtDrawID(84)
    );
\STAGE_StateBitsAtDrawID[85]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(85),
      I1 => \slotsData_reg[2][SlotData]\(85),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(85),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(85),
      O => STAGE_StateBitsAtDrawID(85)
    );
\STAGE_StateBitsAtDrawID[86]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(86),
      I1 => \slotsData_reg[2][SlotData]\(86),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(86),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(86),
      O => STAGE_StateBitsAtDrawID(86)
    );
\STAGE_StateBitsAtDrawID[87]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(87),
      I1 => \slotsData_reg[2][SlotData]\(87),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(87),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(87),
      O => STAGE_StateBitsAtDrawID(87)
    );
\STAGE_StateBitsAtDrawID[88]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(88),
      I1 => \slotsData_reg[2][SlotData]\(88),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(88),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(88),
      O => STAGE_StateBitsAtDrawID(88)
    );
\STAGE_StateBitsAtDrawID[89]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(89),
      I1 => \slotsData_reg[2][SlotData]\(89),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(89),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(89),
      O => STAGE_StateBitsAtDrawID(89)
    );
\STAGE_StateBitsAtDrawID[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(8),
      I1 => \slotsData_reg[2][SlotData]\(8),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(8),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(8),
      O => STAGE_StateBitsAtDrawID(8)
    );
\STAGE_StateBitsAtDrawID[90]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(90),
      I1 => \slotsData_reg[2][SlotData]\(90),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(90),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(90),
      O => STAGE_StateBitsAtDrawID(90)
    );
\STAGE_StateBitsAtDrawID[91]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(91),
      I1 => \slotsData_reg[2][SlotData]\(91),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(91),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(91),
      O => STAGE_StateBitsAtDrawID(91)
    );
\STAGE_StateBitsAtDrawID[92]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(92),
      I1 => \slotsData_reg[2][SlotData]\(92),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(92),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(92),
      O => STAGE_StateBitsAtDrawID(92)
    );
\STAGE_StateBitsAtDrawID[93]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(93),
      I1 => \slotsData_reg[2][SlotData]\(93),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(93),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(93),
      O => STAGE_StateBitsAtDrawID(93)
    );
\STAGE_StateBitsAtDrawID[94]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(94),
      I1 => \slotsData_reg[2][SlotData]\(94),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(94),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(94),
      O => STAGE_StateBitsAtDrawID(94)
    );
\STAGE_StateBitsAtDrawID[95]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(95),
      I1 => \slotsData_reg[2][SlotData]\(95),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(95),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(95),
      O => STAGE_StateBitsAtDrawID(95)
    );
\STAGE_StateBitsAtDrawID[96]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(96),
      I1 => \slotsData_reg[2][SlotData]\(96),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(96),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(96),
      O => STAGE_StateBitsAtDrawID(96)
    );
\STAGE_StateBitsAtDrawID[97]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(97),
      I1 => \slotsData_reg[2][SlotData]\(97),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(97),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(97),
      O => STAGE_StateBitsAtDrawID(97)
    );
\STAGE_StateBitsAtDrawID[98]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(98),
      I1 => \slotsData_reg[2][SlotData]\(98),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(98),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(98),
      O => STAGE_StateBitsAtDrawID(98)
    );
\STAGE_StateBitsAtDrawID[99]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(99),
      I1 => \slotsData_reg[2][SlotData]\(99),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(99),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(99),
      O => STAGE_StateBitsAtDrawID(99)
    );
\STAGE_StateBitsAtDrawID[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slotsData_reg[3][SlotData]\(9),
      I1 => \slotsData_reg[2][SlotData]\(9),
      I2 => \^dbg_currentreadslotindex[1]\(0),
      I3 => \slotsData_reg[1][SlotData]\(9),
      I4 => \^dbg_currentreadslotindex\(0),
      I5 => \slotsData_reg[0][SlotData]\(9),
      O => STAGE_StateBitsAtDrawID(9)
    );
STAGE_StateIsValid_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dbg_slotsvalid[3]\,
      I1 => \^dbg_slotsvalid[2]\,
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \^dbg_slotsvalid[1]\,
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => \^dbg_slotsvalid[0]\,
      O => STAGE_StateIsValid
    );
\currentReadSlot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \currentReadSlot_reg_n_0_[0]\,
      O => \currentReadSlot[0]_i_1_n_0\
    );
\currentReadSlot[0]_rep_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \currentReadSlot_reg_n_0_[0]\,
      O => \currentReadSlot[0]_rep_i_1_n_0\
    );
\currentReadSlot[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^dbg_currentreadslotindex[1]\(0),
      I1 => \^dbg_currentreadslotindex\(0),
      O => \currentReadSlot[1]_i_1_n_0\
    );
\currentReadSlot[1]_rep_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^dbg_currentreadslotindex[1]\(0),
      I1 => \currentReadSlot_reg_n_0_[0]\,
      O => \currentReadSlot[1]_rep_i_1_n_0\
    );
\currentReadSlot_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAGE_ConsumeStateSlot,
      D => \currentReadSlot[0]_i_1_n_0\,
      Q => \currentReadSlot_reg_n_0_[0]\,
      R => CMD_EndFrameReset
    );
\currentReadSlot_reg[0]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAGE_ConsumeStateSlot,
      D => \currentReadSlot[0]_rep_i_1_n_0\,
      Q => \^dbg_currentreadslotindex\(0),
      R => CMD_EndFrameReset
    );
\currentReadSlot_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAGE_ConsumeStateSlot,
      D => \currentReadSlot[1]_i_1_n_0\,
      Q => \^dbg_currentreadslotindex[1]\(0),
      R => CMD_EndFrameReset
    );
\currentReadSlot_reg[1]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAGE_ConsumeStateSlot,
      D => \currentReadSlot[1]_rep_i_1_n_0\,
      Q => \currentReadSlot_reg[1]_rep_n_0\,
      R => CMD_EndFrameReset
    );
\currentWriteSlot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\currentWriteSlot[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => plusOp(1)
    );
\currentWriteSlot_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => CMD_SetNewState,
      D => plusOp(0),
      Q => \^q\(0),
      R => CMD_EndFrameReset
    );
\currentWriteSlot_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => CMD_SetNewState,
      D => plusOp(1),
      Q => \^q\(1),
      R => CMD_EndFrameReset
    );
\slotsData[0][SlotData][191]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => CMD_SetNewState,
      O => \slotsData[0][SlotIsValid]1_out\
    );
\slotsData[0][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(0),
      O => \slotsData[0][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(10),
      O => \slotsData[0][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(11),
      O => \slotsData[0][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(12),
      O => \slotsData[0][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(13),
      O => \slotsData[0][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(14),
      O => \slotsData[0][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"101010FF10101010"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => CMD_SetNewState,
      I3 => \currentReadSlot_reg[1]_rep_n_0\,
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => STAGE_ConsumeStateSlot,
      O => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(15),
      O => \slotsData[0][SlotDrawEventID][15]_i_2_n_0\
    );
\slotsData[0][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(1),
      O => \slotsData[0][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(2),
      O => \slotsData[0][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(3),
      O => \slotsData[0][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(4),
      O => \slotsData[0][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(5),
      O => \slotsData[0][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(6),
      O => \slotsData[0][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(7),
      O => \slotsData[0][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(8),
      O => \slotsData[0][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[0][SlotIsValid]1_out\,
      I1 => CMD_NewStateDrawEventID(9),
      O => \slotsData[0][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[0][SlotIsValid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFF00"
    )
        port map (
      I0 => STAGE_ConsumeStateSlot,
      I1 => \currentReadSlot_reg_n_0_[0]\,
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \slotsData[0][SlotIsValid]1_out\,
      I4 => \^dbg_slotsvalid[0]\,
      O => \slotsData[0][SlotIsValid]_i_1_n_0\
    );
\slotsData[1][SlotData][191]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => CMD_SetNewState,
      O => \slotsData[1][SlotIsValid]3_out\
    );
\slotsData[1][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(0),
      O => \slotsData[1][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(10),
      O => \slotsData[1][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(11),
      O => \slotsData[1][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(12),
      O => \slotsData[1][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(13),
      O => \slotsData[1][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(14),
      O => \slotsData[1][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40FF404040404040"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => CMD_SetNewState,
      I3 => \currentReadSlot_reg[1]_rep_n_0\,
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => STAGE_ConsumeStateSlot,
      O => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(15),
      O => \slotsData[1][SlotDrawEventID][15]_i_2_n_0\
    );
\slotsData[1][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(1),
      O => \slotsData[1][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(2),
      O => \slotsData[1][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(3),
      O => \slotsData[1][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(4),
      O => \slotsData[1][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(5),
      O => \slotsData[1][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(6),
      O => \slotsData[1][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(7),
      O => \slotsData[1][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(8),
      O => \slotsData[1][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]3_out\,
      I1 => CMD_NewStateDrawEventID(9),
      O => \slotsData[1][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[1][SlotIsValid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF7FF00"
    )
        port map (
      I0 => STAGE_ConsumeStateSlot,
      I1 => \currentReadSlot_reg_n_0_[0]\,
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \slotsData[1][SlotIsValid]3_out\,
      I4 => \^dbg_slotsvalid[1]\,
      O => \slotsData[1][SlotIsValid]_i_1_n_0\
    );
\slotsData[2][SlotData][191]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => CMD_SetNewState,
      O => \slotsData[2][SlotIsValid]5_out\
    );
\slotsData[2][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(0),
      O => \slotsData[2][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(10),
      O => \slotsData[2][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(11),
      O => \slotsData[2][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(12),
      O => \slotsData[2][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(13),
      O => \slotsData[2][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(14),
      O => \slotsData[2][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40FF404040404040"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => CMD_SetNewState,
      I3 => \currentReadSlot_reg_n_0_[0]\,
      I4 => \currentReadSlot_reg[1]_rep_n_0\,
      I5 => STAGE_ConsumeStateSlot,
      O => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(15),
      O => \slotsData[2][SlotDrawEventID][15]_i_2_n_0\
    );
\slotsData[2][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(1),
      O => \slotsData[2][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(2),
      O => \slotsData[2][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(3),
      O => \slotsData[2][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(4),
      O => \slotsData[2][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(5),
      O => \slotsData[2][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(6),
      O => \slotsData[2][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(7),
      O => \slotsData[2][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(8),
      O => \slotsData[2][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]5_out\,
      I1 => CMD_NewStateDrawEventID(9),
      O => \slotsData[2][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[2][SlotIsValid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF7FF00"
    )
        port map (
      I0 => STAGE_ConsumeStateSlot,
      I1 => \currentReadSlot_reg[1]_rep_n_0\,
      I2 => \currentReadSlot_reg_n_0_[0]\,
      I3 => \slotsData[2][SlotIsValid]5_out\,
      I4 => \^dbg_slotsvalid[2]\,
      O => \slotsData[2][SlotIsValid]_i_1_n_0\
    );
\slotsData[3][SlotData][191]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => CMD_SetNewState,
      O => \slotsData[3][SlotIsValid]7_out\
    );
\slotsData[3][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(0),
      O => \slotsData[3][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(10),
      O => \slotsData[3][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(11),
      O => \slotsData[3][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(12),
      O => \slotsData[3][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(13),
      O => \slotsData[3][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(14),
      O => \slotsData[3][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80808080808080"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => CMD_SetNewState,
      I3 => \currentReadSlot_reg[1]_rep_n_0\,
      I4 => \currentReadSlot_reg_n_0_[0]\,
      I5 => STAGE_ConsumeStateSlot,
      O => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(15),
      O => \slotsData[3][SlotDrawEventID][15]_i_2_n_0\
    );
\slotsData[3][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(1),
      O => \slotsData[3][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(2),
      O => \slotsData[3][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(3),
      O => \slotsData[3][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(4),
      O => \slotsData[3][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(5),
      O => \slotsData[3][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(6),
      O => \slotsData[3][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(7),
      O => \slotsData[3][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(8),
      O => \slotsData[3][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]7_out\,
      I1 => CMD_NewStateDrawEventID(9),
      O => \slotsData[3][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[3][SlotIsValid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7FFF00"
    )
        port map (
      I0 => STAGE_ConsumeStateSlot,
      I1 => \currentReadSlot_reg_n_0_[0]\,
      I2 => \currentReadSlot_reg[1]_rep_n_0\,
      I3 => \slotsData[3][SlotIsValid]7_out\,
      I4 => \^dbg_slotsvalid[3]\,
      O => \slotsData[3][SlotIsValid]_i_1_n_0\
    );
\slotsData_reg[0][SlotData][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(0),
      Q => \slotsData_reg[0][SlotData]\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(100),
      Q => \slotsData_reg[0][SlotData]\(100),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(101),
      Q => \slotsData_reg[0][SlotData]\(101),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(102),
      Q => \slotsData_reg[0][SlotData]\(102),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(103),
      Q => \slotsData_reg[0][SlotData]\(103),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(104),
      Q => \slotsData_reg[0][SlotData]\(104),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(105),
      Q => \slotsData_reg[0][SlotData]\(105),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(106),
      Q => \slotsData_reg[0][SlotData]\(106),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(107),
      Q => \slotsData_reg[0][SlotData]\(107),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(108),
      Q => \slotsData_reg[0][SlotData]\(108),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(109),
      Q => \slotsData_reg[0][SlotData]\(109),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(10),
      Q => \slotsData_reg[0][SlotData]\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(110),
      Q => \slotsData_reg[0][SlotData]\(110),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(111),
      Q => \slotsData_reg[0][SlotData]\(111),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(112),
      Q => \slotsData_reg[0][SlotData]\(112),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(113),
      Q => \slotsData_reg[0][SlotData]\(113),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(114),
      Q => \slotsData_reg[0][SlotData]\(114),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(115),
      Q => \slotsData_reg[0][SlotData]\(115),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(116),
      Q => \slotsData_reg[0][SlotData]\(116),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(117),
      Q => \slotsData_reg[0][SlotData]\(117),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(118),
      Q => \slotsData_reg[0][SlotData]\(118),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(119),
      Q => \slotsData_reg[0][SlotData]\(119),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(11),
      Q => \slotsData_reg[0][SlotData]\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(120),
      Q => \slotsData_reg[0][SlotData]\(120),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(121),
      Q => \slotsData_reg[0][SlotData]\(121),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(122),
      Q => \slotsData_reg[0][SlotData]\(122),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(123),
      Q => \slotsData_reg[0][SlotData]\(123),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(124),
      Q => \slotsData_reg[0][SlotData]\(124),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(125),
      Q => \slotsData_reg[0][SlotData]\(125),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(126),
      Q => \slotsData_reg[0][SlotData]\(126),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(127),
      Q => \slotsData_reg[0][SlotData]\(127),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(128),
      Q => \slotsData_reg[0][SlotData]\(128),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(129),
      Q => \slotsData_reg[0][SlotData]\(129),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(12),
      Q => \slotsData_reg[0][SlotData]\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(130),
      Q => \slotsData_reg[0][SlotData]\(130),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(131),
      Q => \slotsData_reg[0][SlotData]\(131),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(132),
      Q => \slotsData_reg[0][SlotData]\(132),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(133),
      Q => \slotsData_reg[0][SlotData]\(133),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(134),
      Q => \slotsData_reg[0][SlotData]\(134),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(135),
      Q => \slotsData_reg[0][SlotData]\(135),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(136),
      Q => \slotsData_reg[0][SlotData]\(136),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(137),
      Q => \slotsData_reg[0][SlotData]\(137),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(138),
      Q => \slotsData_reg[0][SlotData]\(138),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(139),
      Q => \slotsData_reg[0][SlotData]\(139),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(13),
      Q => \slotsData_reg[0][SlotData]\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(140),
      Q => \slotsData_reg[0][SlotData]\(140),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(141),
      Q => \slotsData_reg[0][SlotData]\(141),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(142),
      Q => \slotsData_reg[0][SlotData]\(142),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(143),
      Q => \slotsData_reg[0][SlotData]\(143),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(144),
      Q => \slotsData_reg[0][SlotData]\(144),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(145),
      Q => \slotsData_reg[0][SlotData]\(145),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(146),
      Q => \slotsData_reg[0][SlotData]\(146),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(147),
      Q => \slotsData_reg[0][SlotData]\(147),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(148),
      Q => \slotsData_reg[0][SlotData]\(148),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(149),
      Q => \slotsData_reg[0][SlotData]\(149),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(14),
      Q => \slotsData_reg[0][SlotData]\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(150),
      Q => \slotsData_reg[0][SlotData]\(150),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(151),
      Q => \slotsData_reg[0][SlotData]\(151),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(152),
      Q => \slotsData_reg[0][SlotData]\(152),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(153),
      Q => \slotsData_reg[0][SlotData]\(153),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(154),
      Q => \slotsData_reg[0][SlotData]\(154),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(155),
      Q => \slotsData_reg[0][SlotData]\(155),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(156),
      Q => \slotsData_reg[0][SlotData]\(156),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(157),
      Q => \slotsData_reg[0][SlotData]\(157),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(158),
      Q => \slotsData_reg[0][SlotData]\(158),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(159),
      Q => \slotsData_reg[0][SlotData]\(159),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(15),
      Q => \slotsData_reg[0][SlotData]\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(160),
      Q => \slotsData_reg[0][SlotData]\(160),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(161),
      Q => \slotsData_reg[0][SlotData]\(161),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(162),
      Q => \slotsData_reg[0][SlotData]\(162),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(163),
      Q => \slotsData_reg[0][SlotData]\(163),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(164),
      Q => \slotsData_reg[0][SlotData]\(164),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(165),
      Q => \slotsData_reg[0][SlotData]\(165),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(166),
      Q => \slotsData_reg[0][SlotData]\(166),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(167),
      Q => \slotsData_reg[0][SlotData]\(167),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(168),
      Q => \slotsData_reg[0][SlotData]\(168),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(169),
      Q => \slotsData_reg[0][SlotData]\(169),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(16),
      Q => \slotsData_reg[0][SlotData]\(16),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(170),
      Q => \slotsData_reg[0][SlotData]\(170),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(171),
      Q => \slotsData_reg[0][SlotData]\(171),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(172),
      Q => \slotsData_reg[0][SlotData]\(172),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(173),
      Q => \slotsData_reg[0][SlotData]\(173),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(174),
      Q => \slotsData_reg[0][SlotData]\(174),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(175),
      Q => \slotsData_reg[0][SlotData]\(175),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(176),
      Q => \slotsData_reg[0][SlotData]\(176),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(177),
      Q => \slotsData_reg[0][SlotData]\(177),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(178),
      Q => \slotsData_reg[0][SlotData]\(178),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(179),
      Q => \slotsData_reg[0][SlotData]\(179),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(17),
      Q => \slotsData_reg[0][SlotData]\(17),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(180),
      Q => \slotsData_reg[0][SlotData]\(180),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(181),
      Q => \slotsData_reg[0][SlotData]\(181),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(182),
      Q => \slotsData_reg[0][SlotData]\(182),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(183),
      Q => \slotsData_reg[0][SlotData]\(183),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(184),
      Q => \slotsData_reg[0][SlotData]\(184),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(185),
      Q => \slotsData_reg[0][SlotData]\(185),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(186),
      Q => \slotsData_reg[0][SlotData]\(186),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(187),
      Q => \slotsData_reg[0][SlotData]\(187),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(188),
      Q => \slotsData_reg[0][SlotData]\(188),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(189),
      Q => \slotsData_reg[0][SlotData]\(189),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(18),
      Q => \slotsData_reg[0][SlotData]\(18),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(190),
      Q => \slotsData_reg[0][SlotData]\(190),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(191),
      Q => \slotsData_reg[0][SlotData]\(191),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(19),
      Q => \slotsData_reg[0][SlotData]\(19),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(1),
      Q => \slotsData_reg[0][SlotData]\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(20),
      Q => \slotsData_reg[0][SlotData]\(20),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(21),
      Q => \slotsData_reg[0][SlotData]\(21),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(22),
      Q => \slotsData_reg[0][SlotData]\(22),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(23),
      Q => \slotsData_reg[0][SlotData]\(23),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(24),
      Q => \slotsData_reg[0][SlotData]\(24),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(25),
      Q => \slotsData_reg[0][SlotData]\(25),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(26),
      Q => \slotsData_reg[0][SlotData]\(26),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(27),
      Q => \slotsData_reg[0][SlotData]\(27),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(28),
      Q => \slotsData_reg[0][SlotData]\(28),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(29),
      Q => \slotsData_reg[0][SlotData]\(29),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(2),
      Q => \slotsData_reg[0][SlotData]\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(30),
      Q => \slotsData_reg[0][SlotData]\(30),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(31),
      Q => \slotsData_reg[0][SlotData]\(31),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(32),
      Q => \slotsData_reg[0][SlotData]\(32),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(33),
      Q => \slotsData_reg[0][SlotData]\(33),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(34),
      Q => \slotsData_reg[0][SlotData]\(34),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(35),
      Q => \slotsData_reg[0][SlotData]\(35),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(36),
      Q => \slotsData_reg[0][SlotData]\(36),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(37),
      Q => \slotsData_reg[0][SlotData]\(37),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(38),
      Q => \slotsData_reg[0][SlotData]\(38),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(39),
      Q => \slotsData_reg[0][SlotData]\(39),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(3),
      Q => \slotsData_reg[0][SlotData]\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(40),
      Q => \slotsData_reg[0][SlotData]\(40),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(41),
      Q => \slotsData_reg[0][SlotData]\(41),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(42),
      Q => \slotsData_reg[0][SlotData]\(42),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(43),
      Q => \slotsData_reg[0][SlotData]\(43),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(44),
      Q => \slotsData_reg[0][SlotData]\(44),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(45),
      Q => \slotsData_reg[0][SlotData]\(45),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(46),
      Q => \slotsData_reg[0][SlotData]\(46),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(47),
      Q => \slotsData_reg[0][SlotData]\(47),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(48),
      Q => \slotsData_reg[0][SlotData]\(48),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(49),
      Q => \slotsData_reg[0][SlotData]\(49),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(4),
      Q => \slotsData_reg[0][SlotData]\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(50),
      Q => \slotsData_reg[0][SlotData]\(50),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(51),
      Q => \slotsData_reg[0][SlotData]\(51),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(52),
      Q => \slotsData_reg[0][SlotData]\(52),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(53),
      Q => \slotsData_reg[0][SlotData]\(53),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(54),
      Q => \slotsData_reg[0][SlotData]\(54),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(55),
      Q => \slotsData_reg[0][SlotData]\(55),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(56),
      Q => \slotsData_reg[0][SlotData]\(56),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(57),
      Q => \slotsData_reg[0][SlotData]\(57),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(58),
      Q => \slotsData_reg[0][SlotData]\(58),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(59),
      Q => \slotsData_reg[0][SlotData]\(59),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(5),
      Q => \slotsData_reg[0][SlotData]\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(60),
      Q => \slotsData_reg[0][SlotData]\(60),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(61),
      Q => \slotsData_reg[0][SlotData]\(61),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(62),
      Q => \slotsData_reg[0][SlotData]\(62),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(63),
      Q => \slotsData_reg[0][SlotData]\(63),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(64),
      Q => \slotsData_reg[0][SlotData]\(64),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(65),
      Q => \slotsData_reg[0][SlotData]\(65),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(66),
      Q => \slotsData_reg[0][SlotData]\(66),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(67),
      Q => \slotsData_reg[0][SlotData]\(67),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(68),
      Q => \slotsData_reg[0][SlotData]\(68),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(69),
      Q => \slotsData_reg[0][SlotData]\(69),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(6),
      Q => \slotsData_reg[0][SlotData]\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(70),
      Q => \slotsData_reg[0][SlotData]\(70),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(71),
      Q => \slotsData_reg[0][SlotData]\(71),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(72),
      Q => \slotsData_reg[0][SlotData]\(72),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(73),
      Q => \slotsData_reg[0][SlotData]\(73),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(74),
      Q => \slotsData_reg[0][SlotData]\(74),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(75),
      Q => \slotsData_reg[0][SlotData]\(75),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(76),
      Q => \slotsData_reg[0][SlotData]\(76),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(77),
      Q => \slotsData_reg[0][SlotData]\(77),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(78),
      Q => \slotsData_reg[0][SlotData]\(78),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(79),
      Q => \slotsData_reg[0][SlotData]\(79),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(7),
      Q => \slotsData_reg[0][SlotData]\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(80),
      Q => \slotsData_reg[0][SlotData]\(80),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(81),
      Q => \slotsData_reg[0][SlotData]\(81),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(82),
      Q => \slotsData_reg[0][SlotData]\(82),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(83),
      Q => \slotsData_reg[0][SlotData]\(83),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(84),
      Q => \slotsData_reg[0][SlotData]\(84),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(85),
      Q => \slotsData_reg[0][SlotData]\(85),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(86),
      Q => \slotsData_reg[0][SlotData]\(86),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(87),
      Q => \slotsData_reg[0][SlotData]\(87),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(88),
      Q => \slotsData_reg[0][SlotData]\(88),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(89),
      Q => \slotsData_reg[0][SlotData]\(89),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(8),
      Q => \slotsData_reg[0][SlotData]\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(90),
      Q => \slotsData_reg[0][SlotData]\(90),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(91),
      Q => \slotsData_reg[0][SlotData]\(91),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(92),
      Q => \slotsData_reg[0][SlotData]\(92),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(93),
      Q => \slotsData_reg[0][SlotData]\(93),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(94),
      Q => \slotsData_reg[0][SlotData]\(94),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(95),
      Q => \slotsData_reg[0][SlotData]\(95),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(96),
      Q => \slotsData_reg[0][SlotData]\(96),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(97),
      Q => \slotsData_reg[0][SlotData]\(97),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(98),
      Q => \slotsData_reg[0][SlotData]\(98),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(99),
      Q => \slotsData_reg[0][SlotData]\(99),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotData][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotIsValid]1_out\,
      D => CMD_NewStateBits(9),
      Q => \slotsData_reg[0][SlotData]\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][0]_i_1_n_0\,
      Q => \^dbg_slot0\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][10]_i_1_n_0\,
      Q => \^dbg_slot0\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][11]_i_1_n_0\,
      Q => \^dbg_slot0\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][12]_i_1_n_0\,
      Q => \^dbg_slot0\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][13]_i_1_n_0\,
      Q => \^dbg_slot0\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][14]_i_1_n_0\,
      Q => \^dbg_slot0\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][15]_i_2_n_0\,
      Q => \^dbg_slot0\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][1]_i_1_n_0\,
      Q => \^dbg_slot0\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][2]_i_1_n_0\,
      Q => \^dbg_slot0\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][3]_i_1_n_0\,
      Q => \^dbg_slot0\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][4]_i_1_n_0\,
      Q => \^dbg_slot0\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][5]_i_1_n_0\,
      Q => \^dbg_slot0\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][6]_i_1_n_0\,
      Q => \^dbg_slot0\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][7]_i_1_n_0\,
      Q => \^dbg_slot0\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][8]_i_1_n_0\,
      Q => \^dbg_slot0\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[0][SlotDrawEventID][9]_i_1_n_0\,
      Q => \^dbg_slot0\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotIsValid]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \slotsData[0][SlotIsValid]_i_1_n_0\,
      Q => \^dbg_slotsvalid[0]\,
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(0),
      Q => \slotsData_reg[1][SlotData]\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(100),
      Q => \slotsData_reg[1][SlotData]\(100),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(101),
      Q => \slotsData_reg[1][SlotData]\(101),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(102),
      Q => \slotsData_reg[1][SlotData]\(102),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(103),
      Q => \slotsData_reg[1][SlotData]\(103),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(104),
      Q => \slotsData_reg[1][SlotData]\(104),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(105),
      Q => \slotsData_reg[1][SlotData]\(105),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(106),
      Q => \slotsData_reg[1][SlotData]\(106),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(107),
      Q => \slotsData_reg[1][SlotData]\(107),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(108),
      Q => \slotsData_reg[1][SlotData]\(108),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(109),
      Q => \slotsData_reg[1][SlotData]\(109),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(10),
      Q => \slotsData_reg[1][SlotData]\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(110),
      Q => \slotsData_reg[1][SlotData]\(110),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(111),
      Q => \slotsData_reg[1][SlotData]\(111),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(112),
      Q => \slotsData_reg[1][SlotData]\(112),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(113),
      Q => \slotsData_reg[1][SlotData]\(113),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(114),
      Q => \slotsData_reg[1][SlotData]\(114),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(115),
      Q => \slotsData_reg[1][SlotData]\(115),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(116),
      Q => \slotsData_reg[1][SlotData]\(116),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(117),
      Q => \slotsData_reg[1][SlotData]\(117),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(118),
      Q => \slotsData_reg[1][SlotData]\(118),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(119),
      Q => \slotsData_reg[1][SlotData]\(119),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(11),
      Q => \slotsData_reg[1][SlotData]\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(120),
      Q => \slotsData_reg[1][SlotData]\(120),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(121),
      Q => \slotsData_reg[1][SlotData]\(121),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(122),
      Q => \slotsData_reg[1][SlotData]\(122),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(123),
      Q => \slotsData_reg[1][SlotData]\(123),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(124),
      Q => \slotsData_reg[1][SlotData]\(124),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(125),
      Q => \slotsData_reg[1][SlotData]\(125),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(126),
      Q => \slotsData_reg[1][SlotData]\(126),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(127),
      Q => \slotsData_reg[1][SlotData]\(127),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(128),
      Q => \slotsData_reg[1][SlotData]\(128),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(129),
      Q => \slotsData_reg[1][SlotData]\(129),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(12),
      Q => \slotsData_reg[1][SlotData]\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(130),
      Q => \slotsData_reg[1][SlotData]\(130),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(131),
      Q => \slotsData_reg[1][SlotData]\(131),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(132),
      Q => \slotsData_reg[1][SlotData]\(132),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(133),
      Q => \slotsData_reg[1][SlotData]\(133),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(134),
      Q => \slotsData_reg[1][SlotData]\(134),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(135),
      Q => \slotsData_reg[1][SlotData]\(135),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(136),
      Q => \slotsData_reg[1][SlotData]\(136),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(137),
      Q => \slotsData_reg[1][SlotData]\(137),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(138),
      Q => \slotsData_reg[1][SlotData]\(138),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(139),
      Q => \slotsData_reg[1][SlotData]\(139),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(13),
      Q => \slotsData_reg[1][SlotData]\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(140),
      Q => \slotsData_reg[1][SlotData]\(140),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(141),
      Q => \slotsData_reg[1][SlotData]\(141),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(142),
      Q => \slotsData_reg[1][SlotData]\(142),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(143),
      Q => \slotsData_reg[1][SlotData]\(143),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(144),
      Q => \slotsData_reg[1][SlotData]\(144),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(145),
      Q => \slotsData_reg[1][SlotData]\(145),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(146),
      Q => \slotsData_reg[1][SlotData]\(146),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(147),
      Q => \slotsData_reg[1][SlotData]\(147),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(148),
      Q => \slotsData_reg[1][SlotData]\(148),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(149),
      Q => \slotsData_reg[1][SlotData]\(149),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(14),
      Q => \slotsData_reg[1][SlotData]\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(150),
      Q => \slotsData_reg[1][SlotData]\(150),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(151),
      Q => \slotsData_reg[1][SlotData]\(151),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(152),
      Q => \slotsData_reg[1][SlotData]\(152),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(153),
      Q => \slotsData_reg[1][SlotData]\(153),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(154),
      Q => \slotsData_reg[1][SlotData]\(154),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(155),
      Q => \slotsData_reg[1][SlotData]\(155),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(156),
      Q => \slotsData_reg[1][SlotData]\(156),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(157),
      Q => \slotsData_reg[1][SlotData]\(157),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(158),
      Q => \slotsData_reg[1][SlotData]\(158),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(159),
      Q => \slotsData_reg[1][SlotData]\(159),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(15),
      Q => \slotsData_reg[1][SlotData]\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(160),
      Q => \slotsData_reg[1][SlotData]\(160),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(161),
      Q => \slotsData_reg[1][SlotData]\(161),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(162),
      Q => \slotsData_reg[1][SlotData]\(162),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(163),
      Q => \slotsData_reg[1][SlotData]\(163),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(164),
      Q => \slotsData_reg[1][SlotData]\(164),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(165),
      Q => \slotsData_reg[1][SlotData]\(165),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(166),
      Q => \slotsData_reg[1][SlotData]\(166),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(167),
      Q => \slotsData_reg[1][SlotData]\(167),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(168),
      Q => \slotsData_reg[1][SlotData]\(168),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(169),
      Q => \slotsData_reg[1][SlotData]\(169),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(16),
      Q => \slotsData_reg[1][SlotData]\(16),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(170),
      Q => \slotsData_reg[1][SlotData]\(170),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(171),
      Q => \slotsData_reg[1][SlotData]\(171),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(172),
      Q => \slotsData_reg[1][SlotData]\(172),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(173),
      Q => \slotsData_reg[1][SlotData]\(173),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(174),
      Q => \slotsData_reg[1][SlotData]\(174),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(175),
      Q => \slotsData_reg[1][SlotData]\(175),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(176),
      Q => \slotsData_reg[1][SlotData]\(176),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(177),
      Q => \slotsData_reg[1][SlotData]\(177),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(178),
      Q => \slotsData_reg[1][SlotData]\(178),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(179),
      Q => \slotsData_reg[1][SlotData]\(179),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(17),
      Q => \slotsData_reg[1][SlotData]\(17),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(180),
      Q => \slotsData_reg[1][SlotData]\(180),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(181),
      Q => \slotsData_reg[1][SlotData]\(181),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(182),
      Q => \slotsData_reg[1][SlotData]\(182),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(183),
      Q => \slotsData_reg[1][SlotData]\(183),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(184),
      Q => \slotsData_reg[1][SlotData]\(184),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(185),
      Q => \slotsData_reg[1][SlotData]\(185),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(186),
      Q => \slotsData_reg[1][SlotData]\(186),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(187),
      Q => \slotsData_reg[1][SlotData]\(187),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(188),
      Q => \slotsData_reg[1][SlotData]\(188),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(189),
      Q => \slotsData_reg[1][SlotData]\(189),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(18),
      Q => \slotsData_reg[1][SlotData]\(18),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(190),
      Q => \slotsData_reg[1][SlotData]\(190),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(191),
      Q => \slotsData_reg[1][SlotData]\(191),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(19),
      Q => \slotsData_reg[1][SlotData]\(19),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(1),
      Q => \slotsData_reg[1][SlotData]\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(20),
      Q => \slotsData_reg[1][SlotData]\(20),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(21),
      Q => \slotsData_reg[1][SlotData]\(21),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(22),
      Q => \slotsData_reg[1][SlotData]\(22),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(23),
      Q => \slotsData_reg[1][SlotData]\(23),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(24),
      Q => \slotsData_reg[1][SlotData]\(24),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(25),
      Q => \slotsData_reg[1][SlotData]\(25),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(26),
      Q => \slotsData_reg[1][SlotData]\(26),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(27),
      Q => \slotsData_reg[1][SlotData]\(27),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(28),
      Q => \slotsData_reg[1][SlotData]\(28),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(29),
      Q => \slotsData_reg[1][SlotData]\(29),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(2),
      Q => \slotsData_reg[1][SlotData]\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(30),
      Q => \slotsData_reg[1][SlotData]\(30),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(31),
      Q => \slotsData_reg[1][SlotData]\(31),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(32),
      Q => \slotsData_reg[1][SlotData]\(32),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(33),
      Q => \slotsData_reg[1][SlotData]\(33),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(34),
      Q => \slotsData_reg[1][SlotData]\(34),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(35),
      Q => \slotsData_reg[1][SlotData]\(35),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(36),
      Q => \slotsData_reg[1][SlotData]\(36),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(37),
      Q => \slotsData_reg[1][SlotData]\(37),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(38),
      Q => \slotsData_reg[1][SlotData]\(38),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(39),
      Q => \slotsData_reg[1][SlotData]\(39),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(3),
      Q => \slotsData_reg[1][SlotData]\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(40),
      Q => \slotsData_reg[1][SlotData]\(40),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(41),
      Q => \slotsData_reg[1][SlotData]\(41),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(42),
      Q => \slotsData_reg[1][SlotData]\(42),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(43),
      Q => \slotsData_reg[1][SlotData]\(43),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(44),
      Q => \slotsData_reg[1][SlotData]\(44),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(45),
      Q => \slotsData_reg[1][SlotData]\(45),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(46),
      Q => \slotsData_reg[1][SlotData]\(46),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(47),
      Q => \slotsData_reg[1][SlotData]\(47),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(48),
      Q => \slotsData_reg[1][SlotData]\(48),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(49),
      Q => \slotsData_reg[1][SlotData]\(49),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(4),
      Q => \slotsData_reg[1][SlotData]\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(50),
      Q => \slotsData_reg[1][SlotData]\(50),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(51),
      Q => \slotsData_reg[1][SlotData]\(51),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(52),
      Q => \slotsData_reg[1][SlotData]\(52),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(53),
      Q => \slotsData_reg[1][SlotData]\(53),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(54),
      Q => \slotsData_reg[1][SlotData]\(54),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(55),
      Q => \slotsData_reg[1][SlotData]\(55),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(56),
      Q => \slotsData_reg[1][SlotData]\(56),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(57),
      Q => \slotsData_reg[1][SlotData]\(57),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(58),
      Q => \slotsData_reg[1][SlotData]\(58),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(59),
      Q => \slotsData_reg[1][SlotData]\(59),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(5),
      Q => \slotsData_reg[1][SlotData]\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(60),
      Q => \slotsData_reg[1][SlotData]\(60),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(61),
      Q => \slotsData_reg[1][SlotData]\(61),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(62),
      Q => \slotsData_reg[1][SlotData]\(62),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(63),
      Q => \slotsData_reg[1][SlotData]\(63),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(64),
      Q => \slotsData_reg[1][SlotData]\(64),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(65),
      Q => \slotsData_reg[1][SlotData]\(65),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(66),
      Q => \slotsData_reg[1][SlotData]\(66),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(67),
      Q => \slotsData_reg[1][SlotData]\(67),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(68),
      Q => \slotsData_reg[1][SlotData]\(68),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(69),
      Q => \slotsData_reg[1][SlotData]\(69),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(6),
      Q => \slotsData_reg[1][SlotData]\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(70),
      Q => \slotsData_reg[1][SlotData]\(70),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(71),
      Q => \slotsData_reg[1][SlotData]\(71),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(72),
      Q => \slotsData_reg[1][SlotData]\(72),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(73),
      Q => \slotsData_reg[1][SlotData]\(73),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(74),
      Q => \slotsData_reg[1][SlotData]\(74),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(75),
      Q => \slotsData_reg[1][SlotData]\(75),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(76),
      Q => \slotsData_reg[1][SlotData]\(76),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(77),
      Q => \slotsData_reg[1][SlotData]\(77),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(78),
      Q => \slotsData_reg[1][SlotData]\(78),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(79),
      Q => \slotsData_reg[1][SlotData]\(79),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(7),
      Q => \slotsData_reg[1][SlotData]\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(80),
      Q => \slotsData_reg[1][SlotData]\(80),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(81),
      Q => \slotsData_reg[1][SlotData]\(81),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(82),
      Q => \slotsData_reg[1][SlotData]\(82),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(83),
      Q => \slotsData_reg[1][SlotData]\(83),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(84),
      Q => \slotsData_reg[1][SlotData]\(84),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(85),
      Q => \slotsData_reg[1][SlotData]\(85),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(86),
      Q => \slotsData_reg[1][SlotData]\(86),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(87),
      Q => \slotsData_reg[1][SlotData]\(87),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(88),
      Q => \slotsData_reg[1][SlotData]\(88),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(89),
      Q => \slotsData_reg[1][SlotData]\(89),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(8),
      Q => \slotsData_reg[1][SlotData]\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(90),
      Q => \slotsData_reg[1][SlotData]\(90),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(91),
      Q => \slotsData_reg[1][SlotData]\(91),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(92),
      Q => \slotsData_reg[1][SlotData]\(92),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(93),
      Q => \slotsData_reg[1][SlotData]\(93),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(94),
      Q => \slotsData_reg[1][SlotData]\(94),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(95),
      Q => \slotsData_reg[1][SlotData]\(95),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(96),
      Q => \slotsData_reg[1][SlotData]\(96),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(97),
      Q => \slotsData_reg[1][SlotData]\(97),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(98),
      Q => \slotsData_reg[1][SlotData]\(98),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(99),
      Q => \slotsData_reg[1][SlotData]\(99),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotData][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotIsValid]3_out\,
      D => CMD_NewStateBits(9),
      Q => \slotsData_reg[1][SlotData]\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][0]_i_1_n_0\,
      Q => \^dbg_slot1\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][10]_i_1_n_0\,
      Q => \^dbg_slot1\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][11]_i_1_n_0\,
      Q => \^dbg_slot1\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][12]_i_1_n_0\,
      Q => \^dbg_slot1\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][13]_i_1_n_0\,
      Q => \^dbg_slot1\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][14]_i_1_n_0\,
      Q => \^dbg_slot1\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][15]_i_2_n_0\,
      Q => \^dbg_slot1\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][1]_i_1_n_0\,
      Q => \^dbg_slot1\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][2]_i_1_n_0\,
      Q => \^dbg_slot1\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][3]_i_1_n_0\,
      Q => \^dbg_slot1\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][4]_i_1_n_0\,
      Q => \^dbg_slot1\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][5]_i_1_n_0\,
      Q => \^dbg_slot1\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][6]_i_1_n_0\,
      Q => \^dbg_slot1\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][7]_i_1_n_0\,
      Q => \^dbg_slot1\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][8]_i_1_n_0\,
      Q => \^dbg_slot1\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[1][SlotDrawEventID][9]_i_1_n_0\,
      Q => \^dbg_slot1\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotIsValid]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \slotsData[1][SlotIsValid]_i_1_n_0\,
      Q => \^dbg_slotsvalid[1]\,
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(0),
      Q => \slotsData_reg[2][SlotData]\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(100),
      Q => \slotsData_reg[2][SlotData]\(100),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(101),
      Q => \slotsData_reg[2][SlotData]\(101),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(102),
      Q => \slotsData_reg[2][SlotData]\(102),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(103),
      Q => \slotsData_reg[2][SlotData]\(103),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(104),
      Q => \slotsData_reg[2][SlotData]\(104),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(105),
      Q => \slotsData_reg[2][SlotData]\(105),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(106),
      Q => \slotsData_reg[2][SlotData]\(106),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(107),
      Q => \slotsData_reg[2][SlotData]\(107),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(108),
      Q => \slotsData_reg[2][SlotData]\(108),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(109),
      Q => \slotsData_reg[2][SlotData]\(109),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(10),
      Q => \slotsData_reg[2][SlotData]\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(110),
      Q => \slotsData_reg[2][SlotData]\(110),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(111),
      Q => \slotsData_reg[2][SlotData]\(111),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(112),
      Q => \slotsData_reg[2][SlotData]\(112),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(113),
      Q => \slotsData_reg[2][SlotData]\(113),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(114),
      Q => \slotsData_reg[2][SlotData]\(114),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(115),
      Q => \slotsData_reg[2][SlotData]\(115),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(116),
      Q => \slotsData_reg[2][SlotData]\(116),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(117),
      Q => \slotsData_reg[2][SlotData]\(117),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(118),
      Q => \slotsData_reg[2][SlotData]\(118),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(119),
      Q => \slotsData_reg[2][SlotData]\(119),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(11),
      Q => \slotsData_reg[2][SlotData]\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(120),
      Q => \slotsData_reg[2][SlotData]\(120),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(121),
      Q => \slotsData_reg[2][SlotData]\(121),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(122),
      Q => \slotsData_reg[2][SlotData]\(122),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(123),
      Q => \slotsData_reg[2][SlotData]\(123),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(124),
      Q => \slotsData_reg[2][SlotData]\(124),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(125),
      Q => \slotsData_reg[2][SlotData]\(125),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(126),
      Q => \slotsData_reg[2][SlotData]\(126),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(127),
      Q => \slotsData_reg[2][SlotData]\(127),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(128),
      Q => \slotsData_reg[2][SlotData]\(128),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(129),
      Q => \slotsData_reg[2][SlotData]\(129),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(12),
      Q => \slotsData_reg[2][SlotData]\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(130),
      Q => \slotsData_reg[2][SlotData]\(130),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(131),
      Q => \slotsData_reg[2][SlotData]\(131),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(132),
      Q => \slotsData_reg[2][SlotData]\(132),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(133),
      Q => \slotsData_reg[2][SlotData]\(133),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(134),
      Q => \slotsData_reg[2][SlotData]\(134),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(135),
      Q => \slotsData_reg[2][SlotData]\(135),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(136),
      Q => \slotsData_reg[2][SlotData]\(136),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(137),
      Q => \slotsData_reg[2][SlotData]\(137),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(138),
      Q => \slotsData_reg[2][SlotData]\(138),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(139),
      Q => \slotsData_reg[2][SlotData]\(139),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(13),
      Q => \slotsData_reg[2][SlotData]\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(140),
      Q => \slotsData_reg[2][SlotData]\(140),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(141),
      Q => \slotsData_reg[2][SlotData]\(141),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(142),
      Q => \slotsData_reg[2][SlotData]\(142),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(143),
      Q => \slotsData_reg[2][SlotData]\(143),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(144),
      Q => \slotsData_reg[2][SlotData]\(144),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(145),
      Q => \slotsData_reg[2][SlotData]\(145),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(146),
      Q => \slotsData_reg[2][SlotData]\(146),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(147),
      Q => \slotsData_reg[2][SlotData]\(147),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(148),
      Q => \slotsData_reg[2][SlotData]\(148),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(149),
      Q => \slotsData_reg[2][SlotData]\(149),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(14),
      Q => \slotsData_reg[2][SlotData]\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(150),
      Q => \slotsData_reg[2][SlotData]\(150),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(151),
      Q => \slotsData_reg[2][SlotData]\(151),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(152),
      Q => \slotsData_reg[2][SlotData]\(152),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(153),
      Q => \slotsData_reg[2][SlotData]\(153),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(154),
      Q => \slotsData_reg[2][SlotData]\(154),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(155),
      Q => \slotsData_reg[2][SlotData]\(155),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(156),
      Q => \slotsData_reg[2][SlotData]\(156),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(157),
      Q => \slotsData_reg[2][SlotData]\(157),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(158),
      Q => \slotsData_reg[2][SlotData]\(158),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(159),
      Q => \slotsData_reg[2][SlotData]\(159),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(15),
      Q => \slotsData_reg[2][SlotData]\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(160),
      Q => \slotsData_reg[2][SlotData]\(160),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(161),
      Q => \slotsData_reg[2][SlotData]\(161),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(162),
      Q => \slotsData_reg[2][SlotData]\(162),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(163),
      Q => \slotsData_reg[2][SlotData]\(163),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(164),
      Q => \slotsData_reg[2][SlotData]\(164),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(165),
      Q => \slotsData_reg[2][SlotData]\(165),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(166),
      Q => \slotsData_reg[2][SlotData]\(166),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(167),
      Q => \slotsData_reg[2][SlotData]\(167),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(168),
      Q => \slotsData_reg[2][SlotData]\(168),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(169),
      Q => \slotsData_reg[2][SlotData]\(169),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(16),
      Q => \slotsData_reg[2][SlotData]\(16),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(170),
      Q => \slotsData_reg[2][SlotData]\(170),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(171),
      Q => \slotsData_reg[2][SlotData]\(171),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(172),
      Q => \slotsData_reg[2][SlotData]\(172),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(173),
      Q => \slotsData_reg[2][SlotData]\(173),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(174),
      Q => \slotsData_reg[2][SlotData]\(174),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(175),
      Q => \slotsData_reg[2][SlotData]\(175),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(176),
      Q => \slotsData_reg[2][SlotData]\(176),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(177),
      Q => \slotsData_reg[2][SlotData]\(177),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(178),
      Q => \slotsData_reg[2][SlotData]\(178),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(179),
      Q => \slotsData_reg[2][SlotData]\(179),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(17),
      Q => \slotsData_reg[2][SlotData]\(17),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(180),
      Q => \slotsData_reg[2][SlotData]\(180),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(181),
      Q => \slotsData_reg[2][SlotData]\(181),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(182),
      Q => \slotsData_reg[2][SlotData]\(182),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(183),
      Q => \slotsData_reg[2][SlotData]\(183),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(184),
      Q => \slotsData_reg[2][SlotData]\(184),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(185),
      Q => \slotsData_reg[2][SlotData]\(185),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(186),
      Q => \slotsData_reg[2][SlotData]\(186),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(187),
      Q => \slotsData_reg[2][SlotData]\(187),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(188),
      Q => \slotsData_reg[2][SlotData]\(188),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(189),
      Q => \slotsData_reg[2][SlotData]\(189),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(18),
      Q => \slotsData_reg[2][SlotData]\(18),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(190),
      Q => \slotsData_reg[2][SlotData]\(190),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(191),
      Q => \slotsData_reg[2][SlotData]\(191),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(19),
      Q => \slotsData_reg[2][SlotData]\(19),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(1),
      Q => \slotsData_reg[2][SlotData]\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(20),
      Q => \slotsData_reg[2][SlotData]\(20),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(21),
      Q => \slotsData_reg[2][SlotData]\(21),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(22),
      Q => \slotsData_reg[2][SlotData]\(22),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(23),
      Q => \slotsData_reg[2][SlotData]\(23),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(24),
      Q => \slotsData_reg[2][SlotData]\(24),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(25),
      Q => \slotsData_reg[2][SlotData]\(25),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(26),
      Q => \slotsData_reg[2][SlotData]\(26),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(27),
      Q => \slotsData_reg[2][SlotData]\(27),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(28),
      Q => \slotsData_reg[2][SlotData]\(28),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(29),
      Q => \slotsData_reg[2][SlotData]\(29),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(2),
      Q => \slotsData_reg[2][SlotData]\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(30),
      Q => \slotsData_reg[2][SlotData]\(30),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(31),
      Q => \slotsData_reg[2][SlotData]\(31),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(32),
      Q => \slotsData_reg[2][SlotData]\(32),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(33),
      Q => \slotsData_reg[2][SlotData]\(33),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(34),
      Q => \slotsData_reg[2][SlotData]\(34),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(35),
      Q => \slotsData_reg[2][SlotData]\(35),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(36),
      Q => \slotsData_reg[2][SlotData]\(36),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(37),
      Q => \slotsData_reg[2][SlotData]\(37),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(38),
      Q => \slotsData_reg[2][SlotData]\(38),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(39),
      Q => \slotsData_reg[2][SlotData]\(39),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(3),
      Q => \slotsData_reg[2][SlotData]\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(40),
      Q => \slotsData_reg[2][SlotData]\(40),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(41),
      Q => \slotsData_reg[2][SlotData]\(41),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(42),
      Q => \slotsData_reg[2][SlotData]\(42),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(43),
      Q => \slotsData_reg[2][SlotData]\(43),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(44),
      Q => \slotsData_reg[2][SlotData]\(44),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(45),
      Q => \slotsData_reg[2][SlotData]\(45),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(46),
      Q => \slotsData_reg[2][SlotData]\(46),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(47),
      Q => \slotsData_reg[2][SlotData]\(47),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(48),
      Q => \slotsData_reg[2][SlotData]\(48),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(49),
      Q => \slotsData_reg[2][SlotData]\(49),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(4),
      Q => \slotsData_reg[2][SlotData]\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(50),
      Q => \slotsData_reg[2][SlotData]\(50),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(51),
      Q => \slotsData_reg[2][SlotData]\(51),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(52),
      Q => \slotsData_reg[2][SlotData]\(52),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(53),
      Q => \slotsData_reg[2][SlotData]\(53),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(54),
      Q => \slotsData_reg[2][SlotData]\(54),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(55),
      Q => \slotsData_reg[2][SlotData]\(55),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(56),
      Q => \slotsData_reg[2][SlotData]\(56),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(57),
      Q => \slotsData_reg[2][SlotData]\(57),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(58),
      Q => \slotsData_reg[2][SlotData]\(58),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(59),
      Q => \slotsData_reg[2][SlotData]\(59),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(5),
      Q => \slotsData_reg[2][SlotData]\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(60),
      Q => \slotsData_reg[2][SlotData]\(60),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(61),
      Q => \slotsData_reg[2][SlotData]\(61),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(62),
      Q => \slotsData_reg[2][SlotData]\(62),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(63),
      Q => \slotsData_reg[2][SlotData]\(63),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(64),
      Q => \slotsData_reg[2][SlotData]\(64),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(65),
      Q => \slotsData_reg[2][SlotData]\(65),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(66),
      Q => \slotsData_reg[2][SlotData]\(66),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(67),
      Q => \slotsData_reg[2][SlotData]\(67),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(68),
      Q => \slotsData_reg[2][SlotData]\(68),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(69),
      Q => \slotsData_reg[2][SlotData]\(69),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(6),
      Q => \slotsData_reg[2][SlotData]\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(70),
      Q => \slotsData_reg[2][SlotData]\(70),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(71),
      Q => \slotsData_reg[2][SlotData]\(71),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(72),
      Q => \slotsData_reg[2][SlotData]\(72),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(73),
      Q => \slotsData_reg[2][SlotData]\(73),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(74),
      Q => \slotsData_reg[2][SlotData]\(74),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(75),
      Q => \slotsData_reg[2][SlotData]\(75),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(76),
      Q => \slotsData_reg[2][SlotData]\(76),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(77),
      Q => \slotsData_reg[2][SlotData]\(77),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(78),
      Q => \slotsData_reg[2][SlotData]\(78),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(79),
      Q => \slotsData_reg[2][SlotData]\(79),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(7),
      Q => \slotsData_reg[2][SlotData]\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(80),
      Q => \slotsData_reg[2][SlotData]\(80),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(81),
      Q => \slotsData_reg[2][SlotData]\(81),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(82),
      Q => \slotsData_reg[2][SlotData]\(82),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(83),
      Q => \slotsData_reg[2][SlotData]\(83),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(84),
      Q => \slotsData_reg[2][SlotData]\(84),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(85),
      Q => \slotsData_reg[2][SlotData]\(85),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(86),
      Q => \slotsData_reg[2][SlotData]\(86),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(87),
      Q => \slotsData_reg[2][SlotData]\(87),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(88),
      Q => \slotsData_reg[2][SlotData]\(88),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(89),
      Q => \slotsData_reg[2][SlotData]\(89),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(8),
      Q => \slotsData_reg[2][SlotData]\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(90),
      Q => \slotsData_reg[2][SlotData]\(90),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(91),
      Q => \slotsData_reg[2][SlotData]\(91),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(92),
      Q => \slotsData_reg[2][SlotData]\(92),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(93),
      Q => \slotsData_reg[2][SlotData]\(93),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(94),
      Q => \slotsData_reg[2][SlotData]\(94),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(95),
      Q => \slotsData_reg[2][SlotData]\(95),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(96),
      Q => \slotsData_reg[2][SlotData]\(96),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(97),
      Q => \slotsData_reg[2][SlotData]\(97),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(98),
      Q => \slotsData_reg[2][SlotData]\(98),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(99),
      Q => \slotsData_reg[2][SlotData]\(99),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotData][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotIsValid]5_out\,
      D => CMD_NewStateBits(9),
      Q => \slotsData_reg[2][SlotData]\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][0]_i_1_n_0\,
      Q => \^dbg_slot2\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][10]_i_1_n_0\,
      Q => \^dbg_slot2\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][11]_i_1_n_0\,
      Q => \^dbg_slot2\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][12]_i_1_n_0\,
      Q => \^dbg_slot2\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][13]_i_1_n_0\,
      Q => \^dbg_slot2\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][14]_i_1_n_0\,
      Q => \^dbg_slot2\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][15]_i_2_n_0\,
      Q => \^dbg_slot2\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][1]_i_1_n_0\,
      Q => \^dbg_slot2\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][2]_i_1_n_0\,
      Q => \^dbg_slot2\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][3]_i_1_n_0\,
      Q => \^dbg_slot2\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][4]_i_1_n_0\,
      Q => \^dbg_slot2\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][5]_i_1_n_0\,
      Q => \^dbg_slot2\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][6]_i_1_n_0\,
      Q => \^dbg_slot2\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][7]_i_1_n_0\,
      Q => \^dbg_slot2\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][8]_i_1_n_0\,
      Q => \^dbg_slot2\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[2][SlotDrawEventID][9]_i_1_n_0\,
      Q => \^dbg_slot2\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotIsValid]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \slotsData[2][SlotIsValid]_i_1_n_0\,
      Q => \^dbg_slotsvalid[2]\,
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(0),
      Q => \slotsData_reg[3][SlotData]\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(100),
      Q => \slotsData_reg[3][SlotData]\(100),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(101),
      Q => \slotsData_reg[3][SlotData]\(101),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(102),
      Q => \slotsData_reg[3][SlotData]\(102),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(103),
      Q => \slotsData_reg[3][SlotData]\(103),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(104),
      Q => \slotsData_reg[3][SlotData]\(104),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(105),
      Q => \slotsData_reg[3][SlotData]\(105),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(106),
      Q => \slotsData_reg[3][SlotData]\(106),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(107),
      Q => \slotsData_reg[3][SlotData]\(107),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(108),
      Q => \slotsData_reg[3][SlotData]\(108),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(109),
      Q => \slotsData_reg[3][SlotData]\(109),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(10),
      Q => \slotsData_reg[3][SlotData]\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(110),
      Q => \slotsData_reg[3][SlotData]\(110),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(111),
      Q => \slotsData_reg[3][SlotData]\(111),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(112),
      Q => \slotsData_reg[3][SlotData]\(112),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(113),
      Q => \slotsData_reg[3][SlotData]\(113),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(114),
      Q => \slotsData_reg[3][SlotData]\(114),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(115),
      Q => \slotsData_reg[3][SlotData]\(115),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(116),
      Q => \slotsData_reg[3][SlotData]\(116),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(117),
      Q => \slotsData_reg[3][SlotData]\(117),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(118),
      Q => \slotsData_reg[3][SlotData]\(118),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(119),
      Q => \slotsData_reg[3][SlotData]\(119),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(11),
      Q => \slotsData_reg[3][SlotData]\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(120),
      Q => \slotsData_reg[3][SlotData]\(120),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(121),
      Q => \slotsData_reg[3][SlotData]\(121),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(122),
      Q => \slotsData_reg[3][SlotData]\(122),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(123),
      Q => \slotsData_reg[3][SlotData]\(123),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(124),
      Q => \slotsData_reg[3][SlotData]\(124),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(125),
      Q => \slotsData_reg[3][SlotData]\(125),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(126),
      Q => \slotsData_reg[3][SlotData]\(126),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(127),
      Q => \slotsData_reg[3][SlotData]\(127),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(128),
      Q => \slotsData_reg[3][SlotData]\(128),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(129),
      Q => \slotsData_reg[3][SlotData]\(129),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(12),
      Q => \slotsData_reg[3][SlotData]\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(130),
      Q => \slotsData_reg[3][SlotData]\(130),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(131),
      Q => \slotsData_reg[3][SlotData]\(131),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(132),
      Q => \slotsData_reg[3][SlotData]\(132),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(133),
      Q => \slotsData_reg[3][SlotData]\(133),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(134),
      Q => \slotsData_reg[3][SlotData]\(134),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(135),
      Q => \slotsData_reg[3][SlotData]\(135),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(136),
      Q => \slotsData_reg[3][SlotData]\(136),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(137),
      Q => \slotsData_reg[3][SlotData]\(137),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(138),
      Q => \slotsData_reg[3][SlotData]\(138),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(139),
      Q => \slotsData_reg[3][SlotData]\(139),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(13),
      Q => \slotsData_reg[3][SlotData]\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(140),
      Q => \slotsData_reg[3][SlotData]\(140),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(141),
      Q => \slotsData_reg[3][SlotData]\(141),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(142),
      Q => \slotsData_reg[3][SlotData]\(142),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(143),
      Q => \slotsData_reg[3][SlotData]\(143),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(144),
      Q => \slotsData_reg[3][SlotData]\(144),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(145),
      Q => \slotsData_reg[3][SlotData]\(145),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(146),
      Q => \slotsData_reg[3][SlotData]\(146),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(147),
      Q => \slotsData_reg[3][SlotData]\(147),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(148),
      Q => \slotsData_reg[3][SlotData]\(148),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(149),
      Q => \slotsData_reg[3][SlotData]\(149),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(14),
      Q => \slotsData_reg[3][SlotData]\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(150),
      Q => \slotsData_reg[3][SlotData]\(150),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(151),
      Q => \slotsData_reg[3][SlotData]\(151),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(152),
      Q => \slotsData_reg[3][SlotData]\(152),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(153),
      Q => \slotsData_reg[3][SlotData]\(153),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(154),
      Q => \slotsData_reg[3][SlotData]\(154),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(155),
      Q => \slotsData_reg[3][SlotData]\(155),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(156),
      Q => \slotsData_reg[3][SlotData]\(156),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(157),
      Q => \slotsData_reg[3][SlotData]\(157),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(158),
      Q => \slotsData_reg[3][SlotData]\(158),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(159),
      Q => \slotsData_reg[3][SlotData]\(159),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(15),
      Q => \slotsData_reg[3][SlotData]\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(160),
      Q => \slotsData_reg[3][SlotData]\(160),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(161),
      Q => \slotsData_reg[3][SlotData]\(161),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(162),
      Q => \slotsData_reg[3][SlotData]\(162),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(163),
      Q => \slotsData_reg[3][SlotData]\(163),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(164),
      Q => \slotsData_reg[3][SlotData]\(164),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(165),
      Q => \slotsData_reg[3][SlotData]\(165),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(166),
      Q => \slotsData_reg[3][SlotData]\(166),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(167),
      Q => \slotsData_reg[3][SlotData]\(167),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(168),
      Q => \slotsData_reg[3][SlotData]\(168),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(169),
      Q => \slotsData_reg[3][SlotData]\(169),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(16),
      Q => \slotsData_reg[3][SlotData]\(16),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(170),
      Q => \slotsData_reg[3][SlotData]\(170),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(171),
      Q => \slotsData_reg[3][SlotData]\(171),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(172),
      Q => \slotsData_reg[3][SlotData]\(172),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(173),
      Q => \slotsData_reg[3][SlotData]\(173),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(174),
      Q => \slotsData_reg[3][SlotData]\(174),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(175),
      Q => \slotsData_reg[3][SlotData]\(175),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(176),
      Q => \slotsData_reg[3][SlotData]\(176),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(177),
      Q => \slotsData_reg[3][SlotData]\(177),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(178),
      Q => \slotsData_reg[3][SlotData]\(178),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(179),
      Q => \slotsData_reg[3][SlotData]\(179),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(17),
      Q => \slotsData_reg[3][SlotData]\(17),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(180),
      Q => \slotsData_reg[3][SlotData]\(180),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(181),
      Q => \slotsData_reg[3][SlotData]\(181),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(182),
      Q => \slotsData_reg[3][SlotData]\(182),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(183),
      Q => \slotsData_reg[3][SlotData]\(183),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(184),
      Q => \slotsData_reg[3][SlotData]\(184),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(185),
      Q => \slotsData_reg[3][SlotData]\(185),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(186),
      Q => \slotsData_reg[3][SlotData]\(186),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(187),
      Q => \slotsData_reg[3][SlotData]\(187),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(188),
      Q => \slotsData_reg[3][SlotData]\(188),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(189),
      Q => \slotsData_reg[3][SlotData]\(189),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(18),
      Q => \slotsData_reg[3][SlotData]\(18),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(190),
      Q => \slotsData_reg[3][SlotData]\(190),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(191),
      Q => \slotsData_reg[3][SlotData]\(191),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(19),
      Q => \slotsData_reg[3][SlotData]\(19),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(1),
      Q => \slotsData_reg[3][SlotData]\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(20),
      Q => \slotsData_reg[3][SlotData]\(20),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(21),
      Q => \slotsData_reg[3][SlotData]\(21),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(22),
      Q => \slotsData_reg[3][SlotData]\(22),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(23),
      Q => \slotsData_reg[3][SlotData]\(23),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(24),
      Q => \slotsData_reg[3][SlotData]\(24),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(25),
      Q => \slotsData_reg[3][SlotData]\(25),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(26),
      Q => \slotsData_reg[3][SlotData]\(26),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(27),
      Q => \slotsData_reg[3][SlotData]\(27),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(28),
      Q => \slotsData_reg[3][SlotData]\(28),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(29),
      Q => \slotsData_reg[3][SlotData]\(29),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(2),
      Q => \slotsData_reg[3][SlotData]\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(30),
      Q => \slotsData_reg[3][SlotData]\(30),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(31),
      Q => \slotsData_reg[3][SlotData]\(31),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(32),
      Q => \slotsData_reg[3][SlotData]\(32),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(33),
      Q => \slotsData_reg[3][SlotData]\(33),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(34),
      Q => \slotsData_reg[3][SlotData]\(34),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(35),
      Q => \slotsData_reg[3][SlotData]\(35),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(36),
      Q => \slotsData_reg[3][SlotData]\(36),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(37),
      Q => \slotsData_reg[3][SlotData]\(37),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(38),
      Q => \slotsData_reg[3][SlotData]\(38),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(39),
      Q => \slotsData_reg[3][SlotData]\(39),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(3),
      Q => \slotsData_reg[3][SlotData]\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(40),
      Q => \slotsData_reg[3][SlotData]\(40),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(41),
      Q => \slotsData_reg[3][SlotData]\(41),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(42),
      Q => \slotsData_reg[3][SlotData]\(42),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(43),
      Q => \slotsData_reg[3][SlotData]\(43),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(44),
      Q => \slotsData_reg[3][SlotData]\(44),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(45),
      Q => \slotsData_reg[3][SlotData]\(45),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(46),
      Q => \slotsData_reg[3][SlotData]\(46),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(47),
      Q => \slotsData_reg[3][SlotData]\(47),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(48),
      Q => \slotsData_reg[3][SlotData]\(48),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(49),
      Q => \slotsData_reg[3][SlotData]\(49),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(4),
      Q => \slotsData_reg[3][SlotData]\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(50),
      Q => \slotsData_reg[3][SlotData]\(50),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(51),
      Q => \slotsData_reg[3][SlotData]\(51),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(52),
      Q => \slotsData_reg[3][SlotData]\(52),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(53),
      Q => \slotsData_reg[3][SlotData]\(53),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(54),
      Q => \slotsData_reg[3][SlotData]\(54),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(55),
      Q => \slotsData_reg[3][SlotData]\(55),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(56),
      Q => \slotsData_reg[3][SlotData]\(56),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(57),
      Q => \slotsData_reg[3][SlotData]\(57),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(58),
      Q => \slotsData_reg[3][SlotData]\(58),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(59),
      Q => \slotsData_reg[3][SlotData]\(59),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(5),
      Q => \slotsData_reg[3][SlotData]\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(60),
      Q => \slotsData_reg[3][SlotData]\(60),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(61),
      Q => \slotsData_reg[3][SlotData]\(61),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(62),
      Q => \slotsData_reg[3][SlotData]\(62),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(63),
      Q => \slotsData_reg[3][SlotData]\(63),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(64),
      Q => \slotsData_reg[3][SlotData]\(64),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(65),
      Q => \slotsData_reg[3][SlotData]\(65),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(66),
      Q => \slotsData_reg[3][SlotData]\(66),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(67),
      Q => \slotsData_reg[3][SlotData]\(67),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(68),
      Q => \slotsData_reg[3][SlotData]\(68),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(69),
      Q => \slotsData_reg[3][SlotData]\(69),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(6),
      Q => \slotsData_reg[3][SlotData]\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(70),
      Q => \slotsData_reg[3][SlotData]\(70),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(71),
      Q => \slotsData_reg[3][SlotData]\(71),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(72),
      Q => \slotsData_reg[3][SlotData]\(72),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(73),
      Q => \slotsData_reg[3][SlotData]\(73),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(74),
      Q => \slotsData_reg[3][SlotData]\(74),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(75),
      Q => \slotsData_reg[3][SlotData]\(75),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(76),
      Q => \slotsData_reg[3][SlotData]\(76),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(77),
      Q => \slotsData_reg[3][SlotData]\(77),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(78),
      Q => \slotsData_reg[3][SlotData]\(78),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(79),
      Q => \slotsData_reg[3][SlotData]\(79),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(7),
      Q => \slotsData_reg[3][SlotData]\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(80),
      Q => \slotsData_reg[3][SlotData]\(80),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(81),
      Q => \slotsData_reg[3][SlotData]\(81),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(82),
      Q => \slotsData_reg[3][SlotData]\(82),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(83),
      Q => \slotsData_reg[3][SlotData]\(83),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(84),
      Q => \slotsData_reg[3][SlotData]\(84),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(85),
      Q => \slotsData_reg[3][SlotData]\(85),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(86),
      Q => \slotsData_reg[3][SlotData]\(86),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(87),
      Q => \slotsData_reg[3][SlotData]\(87),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(88),
      Q => \slotsData_reg[3][SlotData]\(88),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(89),
      Q => \slotsData_reg[3][SlotData]\(89),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(8),
      Q => \slotsData_reg[3][SlotData]\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(90),
      Q => \slotsData_reg[3][SlotData]\(90),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(91),
      Q => \slotsData_reg[3][SlotData]\(91),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(92),
      Q => \slotsData_reg[3][SlotData]\(92),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(93),
      Q => \slotsData_reg[3][SlotData]\(93),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(94),
      Q => \slotsData_reg[3][SlotData]\(94),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(95),
      Q => \slotsData_reg[3][SlotData]\(95),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(96),
      Q => \slotsData_reg[3][SlotData]\(96),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(97),
      Q => \slotsData_reg[3][SlotData]\(97),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(98),
      Q => \slotsData_reg[3][SlotData]\(98),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(99),
      Q => \slotsData_reg[3][SlotData]\(99),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotData][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotIsValid]7_out\,
      D => CMD_NewStateBits(9),
      Q => \slotsData_reg[3][SlotData]\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][0]_i_1_n_0\,
      Q => \^dbg_slot3\(0),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][10]_i_1_n_0\,
      Q => \^dbg_slot3\(10),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][11]_i_1_n_0\,
      Q => \^dbg_slot3\(11),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][12]_i_1_n_0\,
      Q => \^dbg_slot3\(12),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][13]_i_1_n_0\,
      Q => \^dbg_slot3\(13),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][14]_i_1_n_0\,
      Q => \^dbg_slot3\(14),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][15]_i_2_n_0\,
      Q => \^dbg_slot3\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][1]_i_1_n_0\,
      Q => \^dbg_slot3\(1),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][2]_i_1_n_0\,
      Q => \^dbg_slot3\(2),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][3]_i_1_n_0\,
      Q => \^dbg_slot3\(3),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][4]_i_1_n_0\,
      Q => \^dbg_slot3\(4),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][5]_i_1_n_0\,
      Q => \^dbg_slot3\(5),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][6]_i_1_n_0\,
      Q => \^dbg_slot3\(6),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][7]_i_1_n_0\,
      Q => \^dbg_slot3\(7),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][8]_i_1_n_0\,
      Q => \^dbg_slot3\(8),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      D => \slotsData[3][SlotDrawEventID][9]_i_1_n_0\,
      Q => \^dbg_slot3\(9),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotIsValid]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \slotsData[3][SlotIsValid]_i_1_n_0\,
      Q => \^dbg_slotsvalid[3]\,
      R => CMD_EndFrameReset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_StateBlock_0_4 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 191 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 191 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_StateBlock_0_4 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_StateBlock_0_4 : entity is "design_1_StateBlock_0_4,StateBlock,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_StateBlock_0_4 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_StateBlock_0_4 : entity is "StateBlock,Vivado 2018.1_AR73068";
end design_1_StateBlock_0_4;

architecture STRUCTURE of design_1_StateBlock_0_4 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
begin
U0: entity work.design_1_StateBlock_0_4_StateBlock
     port map (
      CMD_EndFrameReset => CMD_EndFrameReset,
      CMD_NewStateBits(191 downto 0) => CMD_NewStateBits(191 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CMD_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CMD_SetNewState,
      DBG_CurrentReadSlotIndex(0) => DBG_CurrentReadSlotIndex(0),
      \DBG_CurrentReadSlotIndex[1]\(0) => DBG_CurrentReadSlotIndex(1),
      DBG_Slot0(15 downto 0) => DBG_Slot0(15 downto 0),
      DBG_Slot1(15 downto 0) => DBG_Slot1(15 downto 0),
      DBG_Slot2(15 downto 0) => DBG_Slot2(15 downto 0),
      DBG_Slot3(15 downto 0) => DBG_Slot3(15 downto 0),
      \DBG_SlotsValid[0]\ => DBG_SlotsValid(0),
      \DBG_SlotsValid[1]\ => DBG_SlotsValid(1),
      \DBG_SlotsValid[2]\ => DBG_SlotsValid(2),
      \DBG_SlotsValid[3]\ => DBG_SlotsValid(3),
      Q(1 downto 0) => DBG_CurrentWriteSlotIndex(1 downto 0),
      STAGE_ConsumeStateSlot => STAGE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(191 downto 0) => STAGE_StateBitsAtDrawID(191 downto 0),
      STAGE_StateIsValid => STAGE_StateIsValid,
      clk => clk
    );
end STRUCTURE;
