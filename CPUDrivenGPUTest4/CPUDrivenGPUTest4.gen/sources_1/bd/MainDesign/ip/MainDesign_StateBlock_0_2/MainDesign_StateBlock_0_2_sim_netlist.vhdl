-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:01:38 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StateBlock_0_2/MainDesign_StateBlock_0_2_sim_netlist.vhdl
-- Design      : MainDesign_StateBlock_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StateBlock_0_2_StateBlock is
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
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 10 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    clk : in STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 10 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StateBlock_0_2_StateBlock : entity is "StateBlock";
end MainDesign_StateBlock_0_2_StateBlock;

architecture STRUCTURE of MainDesign_StateBlock_0_2_StateBlock is
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
  signal \slotsData_reg[0][SlotData]\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \slotsData_reg[0][SlotIsValid]0_in\ : STD_LOGIC;
  signal \^slotsdata_reg[0][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[1][SlotData]\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \^slotsdata_reg[1][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[2][SlotData]\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \^slotsdata_reg[2][slotisvalid]_0\ : STD_LOGIC;
  signal \slotsData_reg[3][SlotData]\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \^slotsdata_reg[3][slotisvalid]_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CMD_NumFreeSlots[2]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \currentReadSlot[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \currentWriteSlot[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[0][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[0][SlotIsValid]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \slotsData[1][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \slotsData[1][SlotIsValid]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[2][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[2][SlotIsValid]_i_2\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][13]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][14]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][15]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][5]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \slotsData[3][SlotDrawEventID][9]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \slotsData[3][SlotIsValid]_i_2\ : label is "soft_lutpair33";
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
\slotsData[0][SlotData][10]_i_1\: unisim.vcomponents.LUT3
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
\slotsData[0][SlotIsValid]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEFEFFF000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => STAGE_ConsumeStateSlot,
      I3 => \slotsData_reg[0][SlotIsValid]0_in\,
      I4 => CMD_SetNewState,
      I5 => \^slotsdata_reg[0][slotisvalid]_0\,
      O => \slotsData[0][SlotIsValid]_i_1_n_0\
    );
\slotsData[0][SlotIsValid]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^currentwriteslot_reg[1]_0\(1),
      I1 => \^currentwriteslot_reg[1]_0\(0),
      O => \slotsData_reg[0][SlotIsValid]0_in\
    );
\slotsData[1][SlotData][10]_i_1\: unisim.vcomponents.LUT3
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
\slotsData[2][SlotData][10]_i_1\: unisim.vcomponents.LUT3
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
\slotsData[3][SlotData][10]_i_1\: unisim.vcomponents.LUT3
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
entity MainDesign_StateBlock_0_2 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 10 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 10 downto 0 );
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
  attribute NotValidForBitStream of MainDesign_StateBlock_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StateBlock_0_2 : entity is "MainDesign_StateBlock_0_2,StateBlock,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StateBlock_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StateBlock_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StateBlock_0_2 : entity is "StateBlock,Vivado 2025.2";
end MainDesign_StateBlock_0_2;

architecture STRUCTURE of MainDesign_StateBlock_0_2 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_StateBlock_0_2_StateBlock
     port map (
      CMD_EndFrameReset => CMD_EndFrameReset,
      CMD_NewStateBits(10 downto 0) => CMD_NewStateBits(10 downto 0),
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
      STAGE_StateBitsAtDrawID(10 downto 0) => STAGE_StateBitsAtDrawID(10 downto 0),
      STAGE_StateIsValid => STAGE_StateIsValid,
      clk => clk,
      \currentWriteSlot_reg[1]_0\(1 downto 0) => DBG_CurrentWriteSlotIndex(1 downto 0),
      \slotsData_reg[0][SlotIsValid]_0\ => DBG_SlotsValid(0),
      \slotsData_reg[1][SlotIsValid]_0\ => DBG_SlotsValid(1),
      \slotsData_reg[2][SlotIsValid]_0\ => DBG_SlotsValid(2),
      \slotsData_reg[3][SlotIsValid]_0\ => DBG_SlotsValid(3)
    );
end STRUCTURE;
