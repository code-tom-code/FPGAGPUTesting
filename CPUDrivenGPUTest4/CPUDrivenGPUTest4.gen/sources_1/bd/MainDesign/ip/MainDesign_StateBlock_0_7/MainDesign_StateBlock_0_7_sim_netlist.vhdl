-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:49:30 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StateBlock_0_7/MainDesign_StateBlock_0_7_sim_netlist.vhdl
-- Design      : MainDesign_StateBlock_0_7
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StateBlock_0_7_StateBlock is
  port (
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \slotsData_reg[2][SlotIsValid]_0\ : out STD_LOGIC;
    \slotsData_reg[1][SlotIsValid]_0\ : out STD_LOGIC;
    \slotsData_reg[3][SlotIsValid]_0\ : out STD_LOGIC;
    \slotsData_reg[0][SlotIsValid]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \currentWriteSlot_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 100 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    clk : in STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 100 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StateBlock_0_7_StateBlock : entity is "StateBlock";
end MainDesign_StateBlock_0_7_StateBlock;

architecture STRUCTURE of MainDesign_StateBlock_0_7_StateBlock is
  signal \^dbg_slot0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot1\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot2\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^dbg_slot3\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \currentReadSlot[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentReadSlot[1]_i_1_n_0\ : STD_LOGIC;
  signal \^currentwriteslot_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \slotsData[0][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[0][SlotDrawEventID_n_0_]\ : STD_LOGIC;
  signal \slotsData[0][SlotIsValid]1_out\ : STD_LOGIC;
  signal \slotsData[0][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotDrawEventID_n_0_]\ : STD_LOGIC;
  signal \slotsData[1][SlotIsValid]3_out\ : STD_LOGIC;
  signal \slotsData[1][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[1][SlotIsValid]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotDrawEventID_n_0_]\ : STD_LOGIC;
  signal \slotsData[2][SlotIsValid]5_out\ : STD_LOGIC;
  signal \slotsData[2][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[2][SlotIsValid]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][0]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][10]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][11]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][12]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][13]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][14]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][15]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][1]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][2]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][3]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][4]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][5]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][6]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][7]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][8]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID][9]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotDrawEventID_n_0_]\ : STD_LOGIC;
  signal \slotsData[3][SlotIsValid]7_out\ : STD_LOGIC;
  signal \slotsData[3][SlotIsValid]_i_1_n_0\ : STD_LOGIC;
  signal \slotsData[3][SlotIsValid]_i_2_n_0\ : STD_LOGIC;
  signal \slotsData_reg[0][SlotData]\ : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal \^slotsdata_reg[0][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[1][SlotData]\ : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal \^slotsdata_reg[1][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[2][SlotData]\ : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal \^slotsdata_reg[2][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[3][SlotData]\ : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal \^slotsdata_reg[3][slotisvalid]_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[0]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentReadSlot[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \currentReadSlot[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \currentWriteSlot[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \currentWriteSlot[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[0][SlotIsValid]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[1][SlotIsValid]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[2][SlotIsValid]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[3][SlotIsValid]_i_2\ : label is "soft_lutpair0";
begin
  DBG_Slot0(15 downto 0) <= \^dbg_slot0\(15 downto 0);
  DBG_Slot1(15 downto 0) <= \^dbg_slot1\(15 downto 0);
  DBG_Slot2(15 downto 0) <= \^dbg_slot2\(15 downto 0);
  DBG_Slot3(15 downto 0) <= \^dbg_slot3\(15 downto 0);
  Q(1 downto 0) <= \^q\(1 downto 0);
  \currentWriteSlot_reg[1]_0\(1 downto 0) <= \^currentwriteslot_reg[1]_0\(1 downto 0);
  \slotsData_reg[0][SlotIsValid]_0\ <= \^slotsdata_reg[0][slotisvalid]_0\;
  \slotsData_reg[1][SlotIsValid]_0\ <= \^slotsdata_reg[1][slotisvalid]_0\;
  \slotsData_reg[2][SlotIsValid]_0\ <= \^slotsdata_reg[2][slotisvalid]_0\;
  \slotsData_reg[3][SlotIsValid]_0\ <= \^slotsdata_reg[3][slotisvalid]_0\;
\CMD_NumFreeSlots[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \^slotsdata_reg[2][slotisvalid]_0\,
      I1 => \^slotsdata_reg[1][slotisvalid]_0\,
      I2 => \^slotsdata_reg[3][slotisvalid]_0\,
      I3 => \^slotsdata_reg[0][slotisvalid]_0\,
      O => CMD_NumFreeSlots(0)
    );
\CMD_NumFreeSlots[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"177E"
    )
        port map (
      I0 => \^slotsdata_reg[0][slotisvalid]_0\,
      I1 => \^slotsdata_reg[3][slotisvalid]_0\,
      I2 => \^slotsdata_reg[2][slotisvalid]_0\,
      I3 => \^slotsdata_reg[1][slotisvalid]_0\,
      O => CMD_NumFreeSlots(1)
    );
\CMD_NumFreeSlots[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^slotsdata_reg[0][slotisvalid]_0\,
      I1 => \^slotsdata_reg[3][slotisvalid]_0\,
      I2 => \^slotsdata_reg[1][slotisvalid]_0\,
      I3 => \^slotsdata_reg[2][slotisvalid]_0\,
      O => CMD_NumFreeSlots(2)
    );
\STAGE_NextDrawID[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(0),
      I1 => \^dbg_slot0\(0),
      I2 => \^dbg_slot3\(0),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(0),
      O => STAGE_NextDrawID(0)
    );
\STAGE_NextDrawID[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(10),
      I1 => \^dbg_slot0\(10),
      I2 => \^dbg_slot3\(10),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(10),
      O => STAGE_NextDrawID(10)
    );
\STAGE_NextDrawID[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(11),
      I1 => \^dbg_slot0\(11),
      I2 => \^dbg_slot3\(11),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(11),
      O => STAGE_NextDrawID(11)
    );
\STAGE_NextDrawID[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(12),
      I1 => \^dbg_slot0\(12),
      I2 => \^dbg_slot3\(12),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(12),
      O => STAGE_NextDrawID(12)
    );
\STAGE_NextDrawID[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(13),
      I1 => \^dbg_slot0\(13),
      I2 => \^dbg_slot3\(13),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(13),
      O => STAGE_NextDrawID(13)
    );
\STAGE_NextDrawID[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(14),
      I1 => \^dbg_slot0\(14),
      I2 => \^dbg_slot3\(14),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(14),
      O => STAGE_NextDrawID(14)
    );
\STAGE_NextDrawID[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(15),
      I1 => \^dbg_slot0\(15),
      I2 => \^dbg_slot3\(15),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(15),
      O => STAGE_NextDrawID(15)
    );
\STAGE_NextDrawID[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(1),
      I1 => \^dbg_slot0\(1),
      I2 => \^dbg_slot3\(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(1),
      O => STAGE_NextDrawID(1)
    );
\STAGE_NextDrawID[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(2),
      I1 => \^dbg_slot0\(2),
      I2 => \^dbg_slot3\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(2),
      O => STAGE_NextDrawID(2)
    );
\STAGE_NextDrawID[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(3),
      I1 => \^dbg_slot0\(3),
      I2 => \^dbg_slot3\(3),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(3),
      O => STAGE_NextDrawID(3)
    );
\STAGE_NextDrawID[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(4),
      I1 => \^dbg_slot0\(4),
      I2 => \^dbg_slot3\(4),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(4),
      O => STAGE_NextDrawID(4)
    );
\STAGE_NextDrawID[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(5),
      I1 => \^dbg_slot0\(5),
      I2 => \^dbg_slot3\(5),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(5),
      O => STAGE_NextDrawID(5)
    );
\STAGE_NextDrawID[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(6),
      I1 => \^dbg_slot0\(6),
      I2 => \^dbg_slot3\(6),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(6),
      O => STAGE_NextDrawID(6)
    );
\STAGE_NextDrawID[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(7),
      I1 => \^dbg_slot0\(7),
      I2 => \^dbg_slot3\(7),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(7),
      O => STAGE_NextDrawID(7)
    );
\STAGE_NextDrawID[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(8),
      I1 => \^dbg_slot0\(8),
      I2 => \^dbg_slot3\(8),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(8),
      O => STAGE_NextDrawID(8)
    );
\STAGE_NextDrawID[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^dbg_slot1\(9),
      I1 => \^dbg_slot0\(9),
      I2 => \^dbg_slot3\(9),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^dbg_slot2\(9),
      O => STAGE_NextDrawID(9)
    );
\STAGE_StateBitsAtDrawID[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(0),
      I1 => \slotsData_reg[0][SlotData]\(0),
      I2 => \slotsData_reg[3][SlotData]\(0),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(0),
      O => STAGE_StateBitsAtDrawID(0)
    );
\STAGE_StateBitsAtDrawID[100]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(100),
      I1 => \slotsData_reg[0][SlotData]\(100),
      I2 => \slotsData_reg[3][SlotData]\(100),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(100),
      O => STAGE_StateBitsAtDrawID(100)
    );
\STAGE_StateBitsAtDrawID[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(10),
      I1 => \slotsData_reg[0][SlotData]\(10),
      I2 => \slotsData_reg[3][SlotData]\(10),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(10),
      O => STAGE_StateBitsAtDrawID(10)
    );
\STAGE_StateBitsAtDrawID[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(11),
      I1 => \slotsData_reg[0][SlotData]\(11),
      I2 => \slotsData_reg[3][SlotData]\(11),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(11),
      O => STAGE_StateBitsAtDrawID(11)
    );
\STAGE_StateBitsAtDrawID[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(12),
      I1 => \slotsData_reg[0][SlotData]\(12),
      I2 => \slotsData_reg[3][SlotData]\(12),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(12),
      O => STAGE_StateBitsAtDrawID(12)
    );
\STAGE_StateBitsAtDrawID[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(13),
      I1 => \slotsData_reg[0][SlotData]\(13),
      I2 => \slotsData_reg[3][SlotData]\(13),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(13),
      O => STAGE_StateBitsAtDrawID(13)
    );
\STAGE_StateBitsAtDrawID[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(14),
      I1 => \slotsData_reg[0][SlotData]\(14),
      I2 => \slotsData_reg[3][SlotData]\(14),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(14),
      O => STAGE_StateBitsAtDrawID(14)
    );
\STAGE_StateBitsAtDrawID[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(15),
      I1 => \slotsData_reg[0][SlotData]\(15),
      I2 => \slotsData_reg[3][SlotData]\(15),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(15),
      O => STAGE_StateBitsAtDrawID(15)
    );
\STAGE_StateBitsAtDrawID[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(16),
      I1 => \slotsData_reg[0][SlotData]\(16),
      I2 => \slotsData_reg[3][SlotData]\(16),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(16),
      O => STAGE_StateBitsAtDrawID(16)
    );
\STAGE_StateBitsAtDrawID[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(17),
      I1 => \slotsData_reg[0][SlotData]\(17),
      I2 => \slotsData_reg[3][SlotData]\(17),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(17),
      O => STAGE_StateBitsAtDrawID(17)
    );
\STAGE_StateBitsAtDrawID[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(18),
      I1 => \slotsData_reg[0][SlotData]\(18),
      I2 => \slotsData_reg[3][SlotData]\(18),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(18),
      O => STAGE_StateBitsAtDrawID(18)
    );
\STAGE_StateBitsAtDrawID[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(19),
      I1 => \slotsData_reg[0][SlotData]\(19),
      I2 => \slotsData_reg[3][SlotData]\(19),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(19),
      O => STAGE_StateBitsAtDrawID(19)
    );
\STAGE_StateBitsAtDrawID[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(1),
      I1 => \slotsData_reg[0][SlotData]\(1),
      I2 => \slotsData_reg[3][SlotData]\(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(1),
      O => STAGE_StateBitsAtDrawID(1)
    );
\STAGE_StateBitsAtDrawID[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(20),
      I1 => \slotsData_reg[0][SlotData]\(20),
      I2 => \slotsData_reg[3][SlotData]\(20),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(20),
      O => STAGE_StateBitsAtDrawID(20)
    );
\STAGE_StateBitsAtDrawID[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(21),
      I1 => \slotsData_reg[0][SlotData]\(21),
      I2 => \slotsData_reg[3][SlotData]\(21),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(21),
      O => STAGE_StateBitsAtDrawID(21)
    );
\STAGE_StateBitsAtDrawID[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(22),
      I1 => \slotsData_reg[0][SlotData]\(22),
      I2 => \slotsData_reg[3][SlotData]\(22),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(22),
      O => STAGE_StateBitsAtDrawID(22)
    );
\STAGE_StateBitsAtDrawID[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(23),
      I1 => \slotsData_reg[0][SlotData]\(23),
      I2 => \slotsData_reg[3][SlotData]\(23),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(23),
      O => STAGE_StateBitsAtDrawID(23)
    );
\STAGE_StateBitsAtDrawID[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(24),
      I1 => \slotsData_reg[0][SlotData]\(24),
      I2 => \slotsData_reg[3][SlotData]\(24),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(24),
      O => STAGE_StateBitsAtDrawID(24)
    );
\STAGE_StateBitsAtDrawID[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(25),
      I1 => \slotsData_reg[0][SlotData]\(25),
      I2 => \slotsData_reg[3][SlotData]\(25),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(25),
      O => STAGE_StateBitsAtDrawID(25)
    );
\STAGE_StateBitsAtDrawID[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(26),
      I1 => \slotsData_reg[0][SlotData]\(26),
      I2 => \slotsData_reg[3][SlotData]\(26),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(26),
      O => STAGE_StateBitsAtDrawID(26)
    );
\STAGE_StateBitsAtDrawID[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(27),
      I1 => \slotsData_reg[0][SlotData]\(27),
      I2 => \slotsData_reg[3][SlotData]\(27),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(27),
      O => STAGE_StateBitsAtDrawID(27)
    );
\STAGE_StateBitsAtDrawID[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(28),
      I1 => \slotsData_reg[0][SlotData]\(28),
      I2 => \slotsData_reg[3][SlotData]\(28),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(28),
      O => STAGE_StateBitsAtDrawID(28)
    );
\STAGE_StateBitsAtDrawID[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(29),
      I1 => \slotsData_reg[0][SlotData]\(29),
      I2 => \slotsData_reg[3][SlotData]\(29),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(29),
      O => STAGE_StateBitsAtDrawID(29)
    );
\STAGE_StateBitsAtDrawID[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(2),
      I1 => \slotsData_reg[0][SlotData]\(2),
      I2 => \slotsData_reg[3][SlotData]\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(2),
      O => STAGE_StateBitsAtDrawID(2)
    );
\STAGE_StateBitsAtDrawID[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(30),
      I1 => \slotsData_reg[0][SlotData]\(30),
      I2 => \slotsData_reg[3][SlotData]\(30),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(30),
      O => STAGE_StateBitsAtDrawID(30)
    );
\STAGE_StateBitsAtDrawID[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(31),
      I1 => \slotsData_reg[0][SlotData]\(31),
      I2 => \slotsData_reg[3][SlotData]\(31),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(31),
      O => STAGE_StateBitsAtDrawID(31)
    );
\STAGE_StateBitsAtDrawID[32]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(32),
      I1 => \slotsData_reg[0][SlotData]\(32),
      I2 => \slotsData_reg[3][SlotData]\(32),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(32),
      O => STAGE_StateBitsAtDrawID(32)
    );
\STAGE_StateBitsAtDrawID[33]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(33),
      I1 => \slotsData_reg[0][SlotData]\(33),
      I2 => \slotsData_reg[3][SlotData]\(33),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(33),
      O => STAGE_StateBitsAtDrawID(33)
    );
\STAGE_StateBitsAtDrawID[34]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(34),
      I1 => \slotsData_reg[0][SlotData]\(34),
      I2 => \slotsData_reg[3][SlotData]\(34),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(34),
      O => STAGE_StateBitsAtDrawID(34)
    );
\STAGE_StateBitsAtDrawID[35]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(35),
      I1 => \slotsData_reg[0][SlotData]\(35),
      I2 => \slotsData_reg[3][SlotData]\(35),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(35),
      O => STAGE_StateBitsAtDrawID(35)
    );
\STAGE_StateBitsAtDrawID[36]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(36),
      I1 => \slotsData_reg[0][SlotData]\(36),
      I2 => \slotsData_reg[3][SlotData]\(36),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(36),
      O => STAGE_StateBitsAtDrawID(36)
    );
\STAGE_StateBitsAtDrawID[37]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(37),
      I1 => \slotsData_reg[0][SlotData]\(37),
      I2 => \slotsData_reg[3][SlotData]\(37),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(37),
      O => STAGE_StateBitsAtDrawID(37)
    );
\STAGE_StateBitsAtDrawID[38]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(38),
      I1 => \slotsData_reg[0][SlotData]\(38),
      I2 => \slotsData_reg[3][SlotData]\(38),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(38),
      O => STAGE_StateBitsAtDrawID(38)
    );
\STAGE_StateBitsAtDrawID[39]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(39),
      I1 => \slotsData_reg[0][SlotData]\(39),
      I2 => \slotsData_reg[3][SlotData]\(39),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(39),
      O => STAGE_StateBitsAtDrawID(39)
    );
\STAGE_StateBitsAtDrawID[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(3),
      I1 => \slotsData_reg[0][SlotData]\(3),
      I2 => \slotsData_reg[3][SlotData]\(3),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(3),
      O => STAGE_StateBitsAtDrawID(3)
    );
\STAGE_StateBitsAtDrawID[40]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(40),
      I1 => \slotsData_reg[0][SlotData]\(40),
      I2 => \slotsData_reg[3][SlotData]\(40),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(40),
      O => STAGE_StateBitsAtDrawID(40)
    );
\STAGE_StateBitsAtDrawID[41]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(41),
      I1 => \slotsData_reg[0][SlotData]\(41),
      I2 => \slotsData_reg[3][SlotData]\(41),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(41),
      O => STAGE_StateBitsAtDrawID(41)
    );
\STAGE_StateBitsAtDrawID[42]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(42),
      I1 => \slotsData_reg[0][SlotData]\(42),
      I2 => \slotsData_reg[3][SlotData]\(42),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(42),
      O => STAGE_StateBitsAtDrawID(42)
    );
\STAGE_StateBitsAtDrawID[43]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(43),
      I1 => \slotsData_reg[0][SlotData]\(43),
      I2 => \slotsData_reg[3][SlotData]\(43),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(43),
      O => STAGE_StateBitsAtDrawID(43)
    );
\STAGE_StateBitsAtDrawID[44]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(44),
      I1 => \slotsData_reg[0][SlotData]\(44),
      I2 => \slotsData_reg[3][SlotData]\(44),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(44),
      O => STAGE_StateBitsAtDrawID(44)
    );
\STAGE_StateBitsAtDrawID[45]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(45),
      I1 => \slotsData_reg[0][SlotData]\(45),
      I2 => \slotsData_reg[3][SlotData]\(45),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(45),
      O => STAGE_StateBitsAtDrawID(45)
    );
\STAGE_StateBitsAtDrawID[46]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(46),
      I1 => \slotsData_reg[0][SlotData]\(46),
      I2 => \slotsData_reg[3][SlotData]\(46),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(46),
      O => STAGE_StateBitsAtDrawID(46)
    );
\STAGE_StateBitsAtDrawID[47]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(47),
      I1 => \slotsData_reg[0][SlotData]\(47),
      I2 => \slotsData_reg[3][SlotData]\(47),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(47),
      O => STAGE_StateBitsAtDrawID(47)
    );
\STAGE_StateBitsAtDrawID[48]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(48),
      I1 => \slotsData_reg[0][SlotData]\(48),
      I2 => \slotsData_reg[3][SlotData]\(48),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(48),
      O => STAGE_StateBitsAtDrawID(48)
    );
\STAGE_StateBitsAtDrawID[49]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(49),
      I1 => \slotsData_reg[0][SlotData]\(49),
      I2 => \slotsData_reg[3][SlotData]\(49),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(49),
      O => STAGE_StateBitsAtDrawID(49)
    );
\STAGE_StateBitsAtDrawID[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(4),
      I1 => \slotsData_reg[0][SlotData]\(4),
      I2 => \slotsData_reg[3][SlotData]\(4),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(4),
      O => STAGE_StateBitsAtDrawID(4)
    );
\STAGE_StateBitsAtDrawID[50]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(50),
      I1 => \slotsData_reg[0][SlotData]\(50),
      I2 => \slotsData_reg[3][SlotData]\(50),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(50),
      O => STAGE_StateBitsAtDrawID(50)
    );
\STAGE_StateBitsAtDrawID[51]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(51),
      I1 => \slotsData_reg[0][SlotData]\(51),
      I2 => \slotsData_reg[3][SlotData]\(51),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(51),
      O => STAGE_StateBitsAtDrawID(51)
    );
\STAGE_StateBitsAtDrawID[52]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(52),
      I1 => \slotsData_reg[0][SlotData]\(52),
      I2 => \slotsData_reg[3][SlotData]\(52),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(52),
      O => STAGE_StateBitsAtDrawID(52)
    );
\STAGE_StateBitsAtDrawID[53]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(53),
      I1 => \slotsData_reg[0][SlotData]\(53),
      I2 => \slotsData_reg[3][SlotData]\(53),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(53),
      O => STAGE_StateBitsAtDrawID(53)
    );
\STAGE_StateBitsAtDrawID[54]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(54),
      I1 => \slotsData_reg[0][SlotData]\(54),
      I2 => \slotsData_reg[3][SlotData]\(54),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(54),
      O => STAGE_StateBitsAtDrawID(54)
    );
\STAGE_StateBitsAtDrawID[55]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(55),
      I1 => \slotsData_reg[0][SlotData]\(55),
      I2 => \slotsData_reg[3][SlotData]\(55),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(55),
      O => STAGE_StateBitsAtDrawID(55)
    );
\STAGE_StateBitsAtDrawID[56]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(56),
      I1 => \slotsData_reg[0][SlotData]\(56),
      I2 => \slotsData_reg[3][SlotData]\(56),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(56),
      O => STAGE_StateBitsAtDrawID(56)
    );
\STAGE_StateBitsAtDrawID[57]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(57),
      I1 => \slotsData_reg[0][SlotData]\(57),
      I2 => \slotsData_reg[3][SlotData]\(57),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(57),
      O => STAGE_StateBitsAtDrawID(57)
    );
\STAGE_StateBitsAtDrawID[58]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(58),
      I1 => \slotsData_reg[0][SlotData]\(58),
      I2 => \slotsData_reg[3][SlotData]\(58),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(58),
      O => STAGE_StateBitsAtDrawID(58)
    );
\STAGE_StateBitsAtDrawID[59]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(59),
      I1 => \slotsData_reg[0][SlotData]\(59),
      I2 => \slotsData_reg[3][SlotData]\(59),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(59),
      O => STAGE_StateBitsAtDrawID(59)
    );
\STAGE_StateBitsAtDrawID[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(5),
      I1 => \slotsData_reg[0][SlotData]\(5),
      I2 => \slotsData_reg[3][SlotData]\(5),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(5),
      O => STAGE_StateBitsAtDrawID(5)
    );
\STAGE_StateBitsAtDrawID[60]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(60),
      I1 => \slotsData_reg[0][SlotData]\(60),
      I2 => \slotsData_reg[3][SlotData]\(60),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(60),
      O => STAGE_StateBitsAtDrawID(60)
    );
\STAGE_StateBitsAtDrawID[61]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(61),
      I1 => \slotsData_reg[0][SlotData]\(61),
      I2 => \slotsData_reg[3][SlotData]\(61),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(61),
      O => STAGE_StateBitsAtDrawID(61)
    );
\STAGE_StateBitsAtDrawID[62]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(62),
      I1 => \slotsData_reg[0][SlotData]\(62),
      I2 => \slotsData_reg[3][SlotData]\(62),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(62),
      O => STAGE_StateBitsAtDrawID(62)
    );
\STAGE_StateBitsAtDrawID[63]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(63),
      I1 => \slotsData_reg[0][SlotData]\(63),
      I2 => \slotsData_reg[3][SlotData]\(63),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(63),
      O => STAGE_StateBitsAtDrawID(63)
    );
\STAGE_StateBitsAtDrawID[64]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(64),
      I1 => \slotsData_reg[0][SlotData]\(64),
      I2 => \slotsData_reg[3][SlotData]\(64),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(64),
      O => STAGE_StateBitsAtDrawID(64)
    );
\STAGE_StateBitsAtDrawID[65]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(65),
      I1 => \slotsData_reg[0][SlotData]\(65),
      I2 => \slotsData_reg[3][SlotData]\(65),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(65),
      O => STAGE_StateBitsAtDrawID(65)
    );
\STAGE_StateBitsAtDrawID[66]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(66),
      I1 => \slotsData_reg[0][SlotData]\(66),
      I2 => \slotsData_reg[3][SlotData]\(66),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(66),
      O => STAGE_StateBitsAtDrawID(66)
    );
\STAGE_StateBitsAtDrawID[67]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(67),
      I1 => \slotsData_reg[0][SlotData]\(67),
      I2 => \slotsData_reg[3][SlotData]\(67),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(67),
      O => STAGE_StateBitsAtDrawID(67)
    );
\STAGE_StateBitsAtDrawID[68]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(68),
      I1 => \slotsData_reg[0][SlotData]\(68),
      I2 => \slotsData_reg[3][SlotData]\(68),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(68),
      O => STAGE_StateBitsAtDrawID(68)
    );
\STAGE_StateBitsAtDrawID[69]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(69),
      I1 => \slotsData_reg[0][SlotData]\(69),
      I2 => \slotsData_reg[3][SlotData]\(69),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(69),
      O => STAGE_StateBitsAtDrawID(69)
    );
\STAGE_StateBitsAtDrawID[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(6),
      I1 => \slotsData_reg[0][SlotData]\(6),
      I2 => \slotsData_reg[3][SlotData]\(6),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(6),
      O => STAGE_StateBitsAtDrawID(6)
    );
\STAGE_StateBitsAtDrawID[70]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(70),
      I1 => \slotsData_reg[0][SlotData]\(70),
      I2 => \slotsData_reg[3][SlotData]\(70),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(70),
      O => STAGE_StateBitsAtDrawID(70)
    );
\STAGE_StateBitsAtDrawID[71]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(71),
      I1 => \slotsData_reg[0][SlotData]\(71),
      I2 => \slotsData_reg[3][SlotData]\(71),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(71),
      O => STAGE_StateBitsAtDrawID(71)
    );
\STAGE_StateBitsAtDrawID[72]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(72),
      I1 => \slotsData_reg[0][SlotData]\(72),
      I2 => \slotsData_reg[3][SlotData]\(72),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(72),
      O => STAGE_StateBitsAtDrawID(72)
    );
\STAGE_StateBitsAtDrawID[73]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(73),
      I1 => \slotsData_reg[0][SlotData]\(73),
      I2 => \slotsData_reg[3][SlotData]\(73),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(73),
      O => STAGE_StateBitsAtDrawID(73)
    );
\STAGE_StateBitsAtDrawID[74]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(74),
      I1 => \slotsData_reg[0][SlotData]\(74),
      I2 => \slotsData_reg[3][SlotData]\(74),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(74),
      O => STAGE_StateBitsAtDrawID(74)
    );
\STAGE_StateBitsAtDrawID[75]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(75),
      I1 => \slotsData_reg[0][SlotData]\(75),
      I2 => \slotsData_reg[3][SlotData]\(75),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(75),
      O => STAGE_StateBitsAtDrawID(75)
    );
\STAGE_StateBitsAtDrawID[76]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(76),
      I1 => \slotsData_reg[0][SlotData]\(76),
      I2 => \slotsData_reg[3][SlotData]\(76),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(76),
      O => STAGE_StateBitsAtDrawID(76)
    );
\STAGE_StateBitsAtDrawID[77]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(77),
      I1 => \slotsData_reg[0][SlotData]\(77),
      I2 => \slotsData_reg[3][SlotData]\(77),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(77),
      O => STAGE_StateBitsAtDrawID(77)
    );
\STAGE_StateBitsAtDrawID[78]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(78),
      I1 => \slotsData_reg[0][SlotData]\(78),
      I2 => \slotsData_reg[3][SlotData]\(78),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(78),
      O => STAGE_StateBitsAtDrawID(78)
    );
\STAGE_StateBitsAtDrawID[79]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(79),
      I1 => \slotsData_reg[0][SlotData]\(79),
      I2 => \slotsData_reg[3][SlotData]\(79),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(79),
      O => STAGE_StateBitsAtDrawID(79)
    );
\STAGE_StateBitsAtDrawID[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(7),
      I1 => \slotsData_reg[0][SlotData]\(7),
      I2 => \slotsData_reg[3][SlotData]\(7),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(7),
      O => STAGE_StateBitsAtDrawID(7)
    );
\STAGE_StateBitsAtDrawID[80]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(80),
      I1 => \slotsData_reg[0][SlotData]\(80),
      I2 => \slotsData_reg[3][SlotData]\(80),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(80),
      O => STAGE_StateBitsAtDrawID(80)
    );
\STAGE_StateBitsAtDrawID[81]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(81),
      I1 => \slotsData_reg[0][SlotData]\(81),
      I2 => \slotsData_reg[3][SlotData]\(81),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(81),
      O => STAGE_StateBitsAtDrawID(81)
    );
\STAGE_StateBitsAtDrawID[82]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(82),
      I1 => \slotsData_reg[0][SlotData]\(82),
      I2 => \slotsData_reg[3][SlotData]\(82),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(82),
      O => STAGE_StateBitsAtDrawID(82)
    );
\STAGE_StateBitsAtDrawID[83]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(83),
      I1 => \slotsData_reg[0][SlotData]\(83),
      I2 => \slotsData_reg[3][SlotData]\(83),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(83),
      O => STAGE_StateBitsAtDrawID(83)
    );
\STAGE_StateBitsAtDrawID[84]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(84),
      I1 => \slotsData_reg[0][SlotData]\(84),
      I2 => \slotsData_reg[3][SlotData]\(84),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(84),
      O => STAGE_StateBitsAtDrawID(84)
    );
\STAGE_StateBitsAtDrawID[85]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(85),
      I1 => \slotsData_reg[0][SlotData]\(85),
      I2 => \slotsData_reg[3][SlotData]\(85),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(85),
      O => STAGE_StateBitsAtDrawID(85)
    );
\STAGE_StateBitsAtDrawID[86]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(86),
      I1 => \slotsData_reg[0][SlotData]\(86),
      I2 => \slotsData_reg[3][SlotData]\(86),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(86),
      O => STAGE_StateBitsAtDrawID(86)
    );
\STAGE_StateBitsAtDrawID[87]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(87),
      I1 => \slotsData_reg[0][SlotData]\(87),
      I2 => \slotsData_reg[3][SlotData]\(87),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(87),
      O => STAGE_StateBitsAtDrawID(87)
    );
\STAGE_StateBitsAtDrawID[88]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(88),
      I1 => \slotsData_reg[0][SlotData]\(88),
      I2 => \slotsData_reg[3][SlotData]\(88),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(88),
      O => STAGE_StateBitsAtDrawID(88)
    );
\STAGE_StateBitsAtDrawID[89]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(89),
      I1 => \slotsData_reg[0][SlotData]\(89),
      I2 => \slotsData_reg[3][SlotData]\(89),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(89),
      O => STAGE_StateBitsAtDrawID(89)
    );
\STAGE_StateBitsAtDrawID[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(8),
      I1 => \slotsData_reg[0][SlotData]\(8),
      I2 => \slotsData_reg[3][SlotData]\(8),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(8),
      O => STAGE_StateBitsAtDrawID(8)
    );
\STAGE_StateBitsAtDrawID[90]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(90),
      I1 => \slotsData_reg[0][SlotData]\(90),
      I2 => \slotsData_reg[3][SlotData]\(90),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(90),
      O => STAGE_StateBitsAtDrawID(90)
    );
\STAGE_StateBitsAtDrawID[91]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(91),
      I1 => \slotsData_reg[0][SlotData]\(91),
      I2 => \slotsData_reg[3][SlotData]\(91),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(91),
      O => STAGE_StateBitsAtDrawID(91)
    );
\STAGE_StateBitsAtDrawID[92]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(92),
      I1 => \slotsData_reg[0][SlotData]\(92),
      I2 => \slotsData_reg[3][SlotData]\(92),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(92),
      O => STAGE_StateBitsAtDrawID(92)
    );
\STAGE_StateBitsAtDrawID[93]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(93),
      I1 => \slotsData_reg[0][SlotData]\(93),
      I2 => \slotsData_reg[3][SlotData]\(93),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(93),
      O => STAGE_StateBitsAtDrawID(93)
    );
\STAGE_StateBitsAtDrawID[94]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(94),
      I1 => \slotsData_reg[0][SlotData]\(94),
      I2 => \slotsData_reg[3][SlotData]\(94),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(94),
      O => STAGE_StateBitsAtDrawID(94)
    );
\STAGE_StateBitsAtDrawID[95]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(95),
      I1 => \slotsData_reg[0][SlotData]\(95),
      I2 => \slotsData_reg[3][SlotData]\(95),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(95),
      O => STAGE_StateBitsAtDrawID(95)
    );
\STAGE_StateBitsAtDrawID[96]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(96),
      I1 => \slotsData_reg[0][SlotData]\(96),
      I2 => \slotsData_reg[3][SlotData]\(96),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(96),
      O => STAGE_StateBitsAtDrawID(96)
    );
\STAGE_StateBitsAtDrawID[97]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(97),
      I1 => \slotsData_reg[0][SlotData]\(97),
      I2 => \slotsData_reg[3][SlotData]\(97),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(97),
      O => STAGE_StateBitsAtDrawID(97)
    );
\STAGE_StateBitsAtDrawID[98]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(98),
      I1 => \slotsData_reg[0][SlotData]\(98),
      I2 => \slotsData_reg[3][SlotData]\(98),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(98),
      O => STAGE_StateBitsAtDrawID(98)
    );
\STAGE_StateBitsAtDrawID[99]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(99),
      I1 => \slotsData_reg[0][SlotData]\(99),
      I2 => \slotsData_reg[3][SlotData]\(99),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(99),
      O => STAGE_StateBitsAtDrawID(99)
    );
\STAGE_StateBitsAtDrawID[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \slotsData_reg[1][SlotData]\(9),
      I1 => \slotsData_reg[0][SlotData]\(9),
      I2 => \slotsData_reg[3][SlotData]\(9),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \slotsData_reg[2][SlotData]\(9),
      O => STAGE_StateBitsAtDrawID(9)
    );
\currentReadSlot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \currentReadSlot[0]_i_1_n_0\
    );
\currentReadSlot[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \currentReadSlot[1]_i_1_n_0\
    );
\currentReadSlot_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAGE_ConsumeStateSlot,
      D => \currentReadSlot[0]_i_1_n_0\,
      Q => \^q\(0),
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
      Q => \^q\(1),
      R => CMD_EndFrameReset
    );
\currentWriteSlot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(0),
      O => plusOp(0)
    );
\currentWriteSlot[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(0),
      I1 => \^currentwriteslot_reg[1]_0\(1),
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
      Q => \^currentwriteslot_reg[1]_0\(0),
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
      Q => \^currentwriteslot_reg[1]_0\(1),
      R => CMD_EndFrameReset
    );
\slotsData[0][SlotData][100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(0),
      I2 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[0][SlotIsValid]1_out\
    );
\slotsData[0][SlotDrawEventID]\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"101010101010FF10"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(1),
      I1 => \^currentwriteslot_reg[1]_0\(0),
      I2 => CMD_SetNewState,
      I3 => STAGE_ConsumeStateSlot,
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \slotsData[0][SlotDrawEventID_n_0_]\
    );
\slotsData[0][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(0),
      O => \slotsData[0][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(10),
      O => \slotsData[0][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(11),
      O => \slotsData[0][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(12),
      O => \slotsData[0][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(13),
      O => \slotsData[0][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(14),
      O => \slotsData[0][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(15),
      O => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(1),
      O => \slotsData[0][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(2),
      O => \slotsData[0][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(3),
      O => \slotsData[0][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(4),
      O => \slotsData[0][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(5),
      O => \slotsData[0][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(6),
      O => \slotsData[0][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(7),
      O => \slotsData[0][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(8),
      O => \slotsData[0][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[0][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => CMD_NewStateDrawEventID(9),
      O => \slotsData[0][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[0][SlotIsValid]\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \^slotsdata_reg[1][slotisvalid]_0\,
      I1 => \^slotsdata_reg[0][slotisvalid]_0\,
      I2 => \^slotsdata_reg[3][slotisvalid]_0\,
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^slotsdata_reg[2][slotisvalid]_0\,
      O => STAGE_StateIsValid
    );
\slotsData[0][SlotIsValid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFFF00"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => STAGE_ConsumeStateSlot,
      I3 => \slotsData[0][SlotIsValid]1_out\,
      I4 => \^slotsdata_reg[0][slotisvalid]_0\,
      O => \slotsData[0][SlotIsValid]_i_1_n_0\
    );
\slotsData[1][SlotData][100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotIsValid]3_out\
    );
\slotsData[1][SlotDrawEventID]\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040FF4040404040"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(1),
      I1 => \^currentwriteslot_reg[1]_0\(0),
      I2 => CMD_SetNewState,
      I3 => STAGE_ConsumeStateSlot,
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => \slotsData[1][SlotDrawEventID_n_0_]\
    );
\slotsData[1][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(0),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(10),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(11),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(12),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(13),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(14),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(15),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(1),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(2),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(3),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(4),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(5),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(6),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(7),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(8),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[1][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(9),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[1][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[1][SlotIsValid]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77F7777700F00000"
    )
        port map (
      I0 => \slotsData[1][SlotIsValid]_i_2_n_0\,
      I1 => STAGE_ConsumeStateSlot,
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      I4 => CMD_SetNewState,
      I5 => \^slotsdata_reg[1][slotisvalid]_0\,
      O => \slotsData[1][SlotIsValid]_i_1_n_0\
    );
\slotsData[1][SlotIsValid]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \slotsData[1][SlotIsValid]_i_2_n_0\
    );
\slotsData[2][SlotData][100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(0),
      I2 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[2][SlotIsValid]5_out\
    );
\slotsData[2][SlotDrawEventID]\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040FF4040404040"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(0),
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_SetNewState,
      I3 => STAGE_ConsumeStateSlot,
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \slotsData[2][SlotDrawEventID_n_0_]\
    );
\slotsData[2][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(0),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(10),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(11),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(12),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(13),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(14),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(15),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(1),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(2),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(3),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(4),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(5),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(6),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(7),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(8),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[2][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => CMD_NewStateDrawEventID(9),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[2][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[2][SlotIsValid]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77F7777700F00000"
    )
        port map (
      I0 => \slotsData[2][SlotIsValid]_i_2_n_0\,
      I1 => STAGE_ConsumeStateSlot,
      I2 => \^currentwriteslot_reg[1]_0\(1),
      I3 => \^currentwriteslot_reg[1]_0\(0),
      I4 => CMD_SetNewState,
      I5 => \^slotsdata_reg[2][slotisvalid]_0\,
      O => \slotsData[2][SlotIsValid]_i_1_n_0\
    );
\slotsData[2][SlotIsValid]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \slotsData[2][SlotIsValid]_i_2_n_0\
    );
\slotsData[3][SlotData][100]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => \^currentwriteslot_reg[1]_0\(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData[3][SlotIsValid]7_out\
    );
\slotsData[3][SlotDrawEventID]\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80808080808080"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(1),
      I1 => \^currentwriteslot_reg[1]_0\(0),
      I2 => CMD_SetNewState,
      I3 => STAGE_ConsumeStateSlot,
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => \slotsData[3][SlotDrawEventID_n_0_]\
    );
\slotsData[3][SlotDrawEventID][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(0),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][0]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(10),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][10]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(11),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][11]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(12),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][12]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(13),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][13]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(14),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][14]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(15),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(1),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][1]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(2),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][2]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(3),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][3]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(4),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][4]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(5),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][5]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(6),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][6]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(7),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][7]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(8),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][8]_i_1_n_0\
    );
\slotsData[3][SlotDrawEventID][9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => CMD_SetNewState,
      I1 => CMD_NewStateDrawEventID(9),
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      O => \slotsData[3][SlotDrawEventID][9]_i_1_n_0\
    );
\slotsData[3][SlotIsValid]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7777777F0000000"
    )
        port map (
      I0 => \slotsData[3][SlotIsValid]_i_2_n_0\,
      I1 => STAGE_ConsumeStateSlot,
      I2 => \^currentwriteslot_reg[1]_0\(0),
      I3 => \^currentwriteslot_reg[1]_0\(1),
      I4 => CMD_SetNewState,
      I5 => \^slotsdata_reg[3][slotisvalid]_0\,
      O => \slotsData[3][SlotIsValid]_i_1_n_0\
    );
\slotsData[3][SlotIsValid]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \slotsData[3][SlotIsValid]_i_2_n_0\
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
      D => \slotsData[0][SlotDrawEventID][15]_i_1_n_0\,
      Q => \^dbg_slot0\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[0][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[0][SlotDrawEventID_n_0_]\,
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
      Q => \^slotsdata_reg[0][slotisvalid]_0\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
      D => \slotsData[1][SlotDrawEventID][15]_i_1_n_0\,
      Q => \^dbg_slot1\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[1][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[1][SlotDrawEventID_n_0_]\,
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
      Q => \^slotsdata_reg[1][slotisvalid]_0\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
      D => \slotsData[2][SlotDrawEventID][15]_i_1_n_0\,
      Q => \^dbg_slot2\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[2][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[2][SlotDrawEventID_n_0_]\,
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
      Q => \^slotsdata_reg[2][slotisvalid]_0\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
      D => \slotsData[3][SlotDrawEventID][15]_i_1_n_0\,
      Q => \^dbg_slot3\(15),
      R => CMD_EndFrameReset
    );
\slotsData_reg[3][SlotDrawEventID][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      CE => \slotsData[3][SlotDrawEventID_n_0_]\,
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
      Q => \^slotsdata_reg[3][slotisvalid]_0\,
      R => CMD_EndFrameReset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StateBlock_0_7 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 100 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 100 downto 0 );
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
  attribute NotValidForBitStream of MainDesign_StateBlock_0_7 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StateBlock_0_7 : entity is "MainDesign_StateBlock_0_7,StateBlock,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StateBlock_0_7 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StateBlock_0_7 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StateBlock_0_7 : entity is "StateBlock,Vivado 2025.2";
end MainDesign_StateBlock_0_7;

architecture STRUCTURE of MainDesign_StateBlock_0_7 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_StateBlock_0_7_StateBlock
     port map (
      CMD_EndFrameReset => CMD_EndFrameReset,
      CMD_NewStateBits(100 downto 0) => CMD_NewStateBits(100 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CMD_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CMD_SetNewState,
      DBG_Slot0(15 downto 0) => DBG_Slot0(15 downto 0),
      DBG_Slot1(15 downto 0) => DBG_Slot1(15 downto 0),
      DBG_Slot2(15 downto 0) => DBG_Slot2(15 downto 0),
      DBG_Slot3(15 downto 0) => DBG_Slot3(15 downto 0),
      Q(1 downto 0) => DBG_CurrentReadSlotIndex(1 downto 0),
      STAGE_ConsumeStateSlot => STAGE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(100 downto 0) => STAGE_StateBitsAtDrawID(100 downto 0),
      STAGE_StateIsValid => STAGE_StateIsValid,
      clk => clk,
      \currentWriteSlot_reg[1]_0\(1 downto 0) => DBG_CurrentWriteSlotIndex(1 downto 0),
      \slotsData_reg[0][SlotIsValid]_0\ => DBG_SlotsValid(0),
      \slotsData_reg[1][SlotIsValid]_0\ => DBG_SlotsValid(1),
      \slotsData_reg[2][SlotIsValid]_0\ => DBG_SlotsValid(2),
      \slotsData_reg[3][SlotIsValid]_0\ => DBG_SlotsValid(3)
    );
end STRUCTURE;
