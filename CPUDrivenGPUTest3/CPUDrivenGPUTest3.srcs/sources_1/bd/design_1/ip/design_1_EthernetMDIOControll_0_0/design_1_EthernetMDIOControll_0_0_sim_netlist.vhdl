-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:49:12 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_EthernetMDIOControll_0_0/design_1_EthernetMDIOControll_0_0_sim_netlist.vhdl
-- Design      : design_1_EthernetMDIOControll_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_EthernetMDIOControll_0_0_EthernetMDIOController is
  port (
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    mdio_i : out STD_LOGIC;
    DBG_InProgressRead : out STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    \DBG_EthMDIO_State[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    mdio_t_ctrl : out STD_LOGIC;
    registerReadReady : out STD_LOGIC;
    registerWriteComplete : out STD_LOGIC;
    newRequestIsWrite : in STD_LOGIC;
    clkin25 : in STD_LOGIC;
    newRequestStart : in STD_LOGIC;
    mdio_o : in STD_LOGIC;
    newRequestPHYAddress : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestData : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_EthernetMDIOControll_0_0_EthernetMDIOController : entity is "EthernetMDIOController";
end design_1_EthernetMDIOControll_0_0_EthernetMDIOController;

architecture STRUCTURE of design_1_EthernetMDIOControll_0_0_EthernetMDIOController is
  signal \^dbg_ethmdio_state[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^dbg_inprogressread\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \FSM_sequential_currentState[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currentState[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currentState[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currentState[3]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal bitsRemaining : STD_LOGIC;
  signal \bitsRemaining[0]_i_1_n_0\ : STD_LOGIC;
  signal \bitsRemaining[0]_i_2_n_0\ : STD_LOGIC;
  signal \bitsRemaining[0]_i_3_n_0\ : STD_LOGIC;
  signal \bitsRemaining[1]_i_1_n_0\ : STD_LOGIC;
  signal \bitsRemaining[2]_i_1_n_0\ : STD_LOGIC;
  signal \bitsRemaining[2]_i_2_n_0\ : STD_LOGIC;
  signal \bitsRemaining[2]_i_3_n_0\ : STD_LOGIC;
  signal \bitsRemaining[2]_i_4_n_0\ : STD_LOGIC;
  signal \bitsRemaining[3]_i_1_n_0\ : STD_LOGIC;
  signal \bitsRemaining[3]_i_2_n_0\ : STD_LOGIC;
  signal \bitsRemaining[3]_i_3_n_0\ : STD_LOGIC;
  signal \bitsRemaining[4]_i_2_n_0\ : STD_LOGIC;
  signal \bitsRemaining[4]_i_3_n_0\ : STD_LOGIC;
  signal currentState : STD_LOGIC;
  signal \currentState[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[2]_i_1_n_0\ : STD_LOGIC;
  signal \currentState[3]_i_2_n_0\ : STD_LOGIC;
  signal \currentState__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \currentState__0\ : signal is "yes";
  signal mdio_i_i_10_n_0 : STD_LOGIC;
  signal mdio_i_i_11_n_0 : STD_LOGIC;
  signal mdio_i_i_12_n_0 : STD_LOGIC;
  signal mdio_i_i_13_n_0 : STD_LOGIC;
  signal mdio_i_i_14_n_0 : STD_LOGIC;
  signal mdio_i_i_15_n_0 : STD_LOGIC;
  signal mdio_i_i_16_n_0 : STD_LOGIC;
  signal mdio_i_i_1_n_0 : STD_LOGIC;
  signal mdio_i_i_2_n_0 : STD_LOGIC;
  signal mdio_i_i_4_n_0 : STD_LOGIC;
  signal mdio_i_i_5_n_0 : STD_LOGIC;
  signal mdio_i_i_8_n_0 : STD_LOGIC;
  signal mdio_i_i_9_n_0 : STD_LOGIC;
  signal mdio_i_reg_i_3_n_0 : STD_LOGIC;
  signal mdio_i_reg_i_6_n_0 : STD_LOGIC;
  signal mdio_i_reg_i_7_n_0 : STD_LOGIC;
  signal \^mdio_t_ctrl\ : STD_LOGIC;
  signal mdio_t_ctrl_i_1_n_0 : STD_LOGIC;
  signal opcodeValue : STD_LOGIC;
  signal \opcodeValue[0]_i_1_n_0\ : STD_LOGIC;
  signal \opcodeValue[1]_i_2_n_0\ : STD_LOGIC;
  signal \opcodeValue_reg_n_0_[0]\ : STD_LOGIC;
  signal \opcodeValue_reg_n_0_[1]\ : STD_LOGIC;
  signal readInData0_in : STD_LOGIC_VECTOR ( 15 to 15 );
  signal \readInData[0]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[10]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[10]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[11]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[11]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[12]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[12]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[13]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[13]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[14]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[14]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[15]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[15]_i_3_n_0\ : STD_LOGIC;
  signal \readInData[15]_i_4_n_0\ : STD_LOGIC;
  signal \readInData[15]_i_5_n_0\ : STD_LOGIC;
  signal \readInData[1]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[2]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[3]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[4]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[5]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[6]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[7]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[7]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[8]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[8]_i_2_n_0\ : STD_LOGIC;
  signal \readInData[9]_i_1_n_0\ : STD_LOGIC;
  signal \readInData[9]_i_2_n_0\ : STD_LOGIC;
  signal \registerReadData[15]_i_1_n_0\ : STD_LOGIC;
  signal \^registerreadready\ : STD_LOGIC;
  signal registerReadReady_i_1_n_0 : STD_LOGIC;
  signal \^registerwritecomplete\ : STD_LOGIC;
  signal registerWriteComplete_i_1_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_currentState_reg[0]\ : label is "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_currentState_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_currentState_reg[1]\ : label is "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101";
  attribute KEEP of \FSM_sequential_currentState_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_currentState_reg[2]\ : label is "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101";
  attribute KEEP of \FSM_sequential_currentState_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_currentState_reg[3]\ : label is "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101";
  attribute KEEP of \FSM_sequential_currentState_reg[3]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bitsRemaining[2]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bitsRemaining[2]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \currentState[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentState[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \currentState[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \currentState[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of mdio_i_i_9 : label is "soft_lutpair4";
  attribute x_interface_info : string;
  attribute x_interface_info of mdio_i_reg : label is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  attribute SOFT_HLUTNM of \readInData[10]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \readInData[11]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \readInData[12]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \readInData[13]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \readInData[14]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \readInData[15]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \readInData[15]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \readInData[7]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \readInData[8]_i_2\ : label is "soft_lutpair0";
begin
  \DBG_EthMDIO_State[3]\(3 downto 0) <= \^dbg_ethmdio_state[3]\(3 downto 0);
  DBG_InProgressRead(15 downto 0) <= \^dbg_inprogressread\(15 downto 0);
  Q(4 downto 0) <= \^q\(4 downto 0);
  mdio_t_ctrl <= \^mdio_t_ctrl\;
  registerReadReady <= \^registerreadready\;
  registerWriteComplete <= \^registerwritecomplete\;
\FSM_sequential_currentState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F000F"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => newRequestIsWrite,
      I2 => \currentState__0\(0),
      I3 => \currentState__0\(3),
      I4 => \currentState__0\(1),
      O => \FSM_sequential_currentState[0]_i_1_n_0\
    );
\FSM_sequential_currentState[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => \currentState__0\(3),
      I1 => \currentState__0\(0),
      I2 => \currentState__0\(1),
      O => \FSM_sequential_currentState[1]_i_1_n_0\
    );
\FSM_sequential_currentState[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => \currentState__0\(1),
      I2 => \currentState__0\(3),
      I3 => \currentState__0\(2),
      O => \FSM_sequential_currentState[2]_i_1_n_0\
    );
\FSM_sequential_currentState[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3830"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => \currentState__0\(1),
      I2 => \currentState__0\(3),
      I3 => \currentState__0\(2),
      O => \FSM_sequential_currentState[3]_i_1_n_0\
    );
\FSM_sequential_currentState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \FSM_sequential_currentState[0]_i_1_n_0\,
      Q => \currentState__0\(0),
      R => '0'
    );
\FSM_sequential_currentState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \FSM_sequential_currentState[1]_i_1_n_0\,
      Q => \currentState__0\(1),
      R => '0'
    );
\FSM_sequential_currentState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \FSM_sequential_currentState[2]_i_1_n_0\,
      Q => \currentState__0\(2),
      R => '0'
    );
\FSM_sequential_currentState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \FSM_sequential_currentState[3]_i_1_n_0\,
      Q => \currentState__0\(3),
      R => '0'
    );
\bitsRemaining[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80AA88AAAAAAAA"
    )
        port map (
      I0 => \bitsRemaining[0]_i_2_n_0\,
      I1 => \currentState__0\(1),
      I2 => newRequestIsWrite,
      I3 => \bitsRemaining[0]_i_3_n_0\,
      I4 => \currentState__0\(0),
      I5 => \bitsRemaining[2]_i_4_n_0\,
      O => \bitsRemaining[0]_i_1_n_0\
    );
\bitsRemaining[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7755575755555757"
    )
        port map (
      I0 => \^q\(0),
      I1 => \currentState__0\(3),
      I2 => \currentState__0\(1),
      I3 => \bitsRemaining[2]_i_4_n_0\,
      I4 => \currentState__0\(2),
      I5 => \currentState__0\(0),
      O => \bitsRemaining[0]_i_2_n_0\
    );
\bitsRemaining[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \currentState__0\(3),
      I1 => \currentState__0\(2),
      O => \bitsRemaining[0]_i_3_n_0\
    );
\bitsRemaining[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA00020002AAAA"
    )
        port map (
      I0 => \bitsRemaining[3]_i_2_n_0\,
      I1 => \currentState__0\(3),
      I2 => \currentState__0\(2),
      I3 => \currentState__0\(1),
      I4 => \^q\(0),
      I5 => \^q\(1),
      O => \bitsRemaining[1]_i_1_n_0\
    );
\bitsRemaining[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFEFFAAABAAAB"
    )
        port map (
      I0 => \bitsRemaining[2]_i_2_n_0\,
      I1 => \currentState__0\(2),
      I2 => \currentState__0\(3),
      I3 => \currentState__0\(1),
      I4 => \bitsRemaining[2]_i_3_n_0\,
      I5 => \bitsRemaining[2]_i_4_n_0\,
      O => \bitsRemaining[2]_i_1_n_0\
    );
\bitsRemaining[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \bitsRemaining[2]_i_2_n_0\
    );
\bitsRemaining[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => \currentState__0\(2),
      I2 => newRequestIsWrite,
      O => \bitsRemaining[2]_i_3_n_0\
    );
\bitsRemaining[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(3),
      O => \bitsRemaining[2]_i_4_n_0\
    );
\bitsRemaining[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA88888882"
    )
        port map (
      I0 => \bitsRemaining[3]_i_2_n_0\,
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \bitsRemaining[3]_i_3_n_0\,
      O => \bitsRemaining[3]_i_1_n_0\
    );
\bitsRemaining[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EBABABABFFFFFFFF"
    )
        port map (
      I0 => \currentState__0\(3),
      I1 => \currentState__0\(1),
      I2 => \currentState__0\(2),
      I3 => newRequestIsWrite,
      I4 => \currentState__0\(0),
      I5 => \bitsRemaining[2]_i_4_n_0\,
      O => \bitsRemaining[3]_i_2_n_0\
    );
\bitsRemaining[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD01"
    )
        port map (
      I0 => \currentState__0\(1),
      I1 => \currentState__0\(2),
      I2 => \currentState__0\(3),
      I3 => \bitsRemaining[2]_i_4_n_0\,
      O => \bitsRemaining[3]_i_3_n_0\
    );
\bitsRemaining[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F0FF8"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => newRequestStart,
      I2 => \currentState__0\(3),
      I3 => \currentState__0\(2),
      I4 => \currentState__0\(1),
      O => bitsRemaining
    );
\bitsRemaining[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \bitsRemaining[4]_i_3_n_0\,
      O => \bitsRemaining[4]_i_2_n_0\
    );
\bitsRemaining[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0005080500050005"
    )
        port map (
      I0 => \currentState__0\(1),
      I1 => \currentState__0\(0),
      I2 => \currentState__0\(3),
      I3 => \currentState__0\(2),
      I4 => newRequestIsWrite,
      I5 => \bitsRemaining[2]_i_4_n_0\,
      O => \bitsRemaining[4]_i_3_n_0\
    );
\bitsRemaining_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => bitsRemaining,
      D => \bitsRemaining[0]_i_1_n_0\,
      Q => \^q\(0),
      R => '0'
    );
\bitsRemaining_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => bitsRemaining,
      D => \bitsRemaining[1]_i_1_n_0\,
      Q => \^q\(1),
      R => '0'
    );
\bitsRemaining_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => bitsRemaining,
      D => \bitsRemaining[2]_i_1_n_0\,
      Q => \^q\(2),
      R => '0'
    );
\bitsRemaining_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => bitsRemaining,
      D => \bitsRemaining[3]_i_1_n_0\,
      Q => \^q\(3),
      R => '0'
    );
\bitsRemaining_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => bitsRemaining,
      D => \bitsRemaining[4]_i_2_n_0\,
      Q => \^q\(4),
      R => '0'
    );
\currentState[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75007555"
    )
        port map (
      I0 => \^dbg_ethmdio_state[3]\(0),
      I1 => newRequestIsWrite,
      I2 => \^dbg_ethmdio_state[3]\(2),
      I3 => \^dbg_ethmdio_state[3]\(1),
      I4 => \^dbg_ethmdio_state[3]\(3),
      O => \currentState[0]_i_1_n_0\
    );
\currentState[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"36"
    )
        port map (
      I0 => \^dbg_ethmdio_state[3]\(0),
      I1 => \^dbg_ethmdio_state[3]\(1),
      I2 => \^dbg_ethmdio_state[3]\(3),
      O => \currentState[1]_i_1_n_0\
    );
\currentState[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^dbg_ethmdio_state[3]\(2),
      I1 => \^dbg_ethmdio_state[3]\(0),
      I2 => \^dbg_ethmdio_state[3]\(1),
      O => \currentState[2]_i_1_n_0\
    );
\currentState[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00FF00FD0D"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => newRequestStart,
      I2 => \currentState__0\(2),
      I3 => \bitsRemaining[2]_i_4_n_0\,
      I4 => \currentState__0\(3),
      I5 => \currentState__0\(1),
      O => currentState
    );
\currentState[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => \^dbg_ethmdio_state[3]\(0),
      I1 => \^dbg_ethmdio_state[3]\(2),
      I2 => \^dbg_ethmdio_state[3]\(1),
      I3 => \^dbg_ethmdio_state[3]\(3),
      O => \currentState[3]_i_2_n_0\
    );
\currentState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \currentState[0]_i_1_n_0\,
      Q => \^dbg_ethmdio_state[3]\(0),
      R => '0'
    );
\currentState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \currentState[1]_i_1_n_0\,
      Q => \^dbg_ethmdio_state[3]\(1),
      R => '0'
    );
\currentState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \currentState[2]_i_1_n_0\,
      Q => \^dbg_ethmdio_state[3]\(2),
      R => '0'
    );
\currentState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => currentState,
      D => \currentState[3]_i_2_n_0\,
      Q => \^dbg_ethmdio_state[3]\(3),
      R => '0'
    );
mdio_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F8F0F0FFF8F0"
    )
        port map (
      I0 => mdio_i_i_2_n_0,
      I1 => mdio_i_reg_i_3_n_0,
      I2 => mdio_i_i_4_n_0,
      I3 => \currentState__0\(3),
      I4 => \currentState__0\(1),
      I5 => mdio_i_i_5_n_0,
      O => mdio_i_i_1_n_0
    );
mdio_i_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \currentState__0\(1),
      I1 => \currentState__0\(2),
      I2 => \currentState__0\(3),
      O => mdio_i_i_10_n_0
    );
mdio_i_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestDevTypeRegister(3),
      I1 => newRequestDevTypeRegister(2),
      I2 => \^q\(1),
      I3 => newRequestDevTypeRegister(1),
      I4 => \^q\(0),
      I5 => newRequestDevTypeRegister(0),
      O => mdio_i_i_11_n_0
    );
mdio_i_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80DD8055"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => \currentState__0\(0),
      I2 => \opcodeValue_reg_n_0_[1]\,
      I3 => \^q\(0),
      I4 => \opcodeValue_reg_n_0_[0]\,
      O => mdio_i_i_12_n_0
    );
mdio_i_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestData(3),
      I1 => newRequestData(2),
      I2 => \^q\(1),
      I3 => newRequestData(1),
      I4 => \^q\(0),
      I5 => newRequestData(0),
      O => mdio_i_i_13_n_0
    );
mdio_i_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestData(7),
      I1 => newRequestData(6),
      I2 => \^q\(1),
      I3 => newRequestData(5),
      I4 => \^q\(0),
      I5 => newRequestData(4),
      O => mdio_i_i_14_n_0
    );
mdio_i_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestData(11),
      I1 => newRequestData(10),
      I2 => \^q\(1),
      I3 => newRequestData(9),
      I4 => \^q\(0),
      I5 => newRequestData(8),
      O => mdio_i_i_15_n_0
    );
mdio_i_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestData(15),
      I1 => newRequestData(14),
      I2 => \^q\(1),
      I3 => newRequestData(13),
      I4 => \^q\(0),
      I5 => newRequestData(12),
      O => mdio_i_i_16_n_0
    );
mdio_i_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => \currentState__0\(0),
      O => mdio_i_i_2_n_0
    );
mdio_i_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B8FFB800"
    )
        port map (
      I0 => newRequestPHYAddress(4),
      I1 => \^q\(2),
      I2 => mdio_i_i_8_n_0,
      I3 => \currentState__0\(0),
      I4 => mdio_i_i_9_n_0,
      I5 => mdio_i_i_10_n_0,
      O => mdio_i_i_4_n_0
    );
mdio_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF1D00"
    )
        port map (
      I0 => mdio_i_i_11_n_0,
      I1 => \^q\(2),
      I2 => newRequestDevTypeRegister(4),
      I3 => \currentState__0\(2),
      I4 => \currentState__0\(0),
      I5 => mdio_i_i_12_n_0,
      O => mdio_i_i_5_n_0
    );
mdio_i_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => newRequestPHYAddress(3),
      I1 => newRequestPHYAddress(2),
      I2 => \^q\(1),
      I3 => newRequestPHYAddress(1),
      I4 => \^q\(0),
      I5 => newRequestPHYAddress(0),
      O => mdio_i_i_8_n_0
    );
mdio_i_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \opcodeValue_reg_n_0_[1]\,
      I1 => \^q\(0),
      I2 => \opcodeValue_reg_n_0_[0]\,
      O => mdio_i_i_9_n_0
    );
mdio_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => mdio_i_i_1_n_0,
      Q => mdio_i,
      R => '0'
    );
mdio_i_reg_i_3: unisim.vcomponents.MUXF8
     port map (
      I0 => mdio_i_reg_i_6_n_0,
      I1 => mdio_i_reg_i_7_n_0,
      O => mdio_i_reg_i_3_n_0,
      S => \^q\(3)
    );
mdio_i_reg_i_6: unisim.vcomponents.MUXF7
     port map (
      I0 => mdio_i_i_13_n_0,
      I1 => mdio_i_i_14_n_0,
      O => mdio_i_reg_i_6_n_0,
      S => \^q\(2)
    );
mdio_i_reg_i_7: unisim.vcomponents.MUXF7
     port map (
      I0 => mdio_i_i_15_n_0,
      I1 => mdio_i_i_16_n_0,
      O => mdio_i_reg_i_7_n_0,
      S => \^q\(2)
    );
mdio_t_ctrl_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFFF000400000"
    )
        port map (
      I0 => newRequestIsWrite,
      I1 => \currentState__0\(0),
      I2 => \currentState__0\(1),
      I3 => \currentState__0\(3),
      I4 => \currentState__0\(2),
      I5 => \^mdio_t_ctrl\,
      O => mdio_t_ctrl_i_1_n_0
    );
mdio_t_ctrl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => mdio_t_ctrl_i_1_n_0,
      Q => \^mdio_t_ctrl\,
      R => '0'
    );
\opcodeValue[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => newRequestIsWrite,
      O => \opcodeValue[0]_i_1_n_0\
    );
\opcodeValue[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020002003000000"
    )
        port map (
      I0 => \bitsRemaining[2]_i_4_n_0\,
      I1 => \currentState__0\(3),
      I2 => \currentState__0\(1),
      I3 => \currentState__0\(0),
      I4 => newRequestStart,
      I5 => \currentState__0\(2),
      O => opcodeValue
    );
\opcodeValue[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => newRequestIsWrite,
      O => \opcodeValue[1]_i_2_n_0\
    );
\opcodeValue_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => opcodeValue,
      D => \opcodeValue[0]_i_1_n_0\,
      Q => \opcodeValue_reg_n_0_[0]\,
      R => '0'
    );
\opcodeValue_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => opcodeValue,
      D => \opcodeValue[1]_i_2_n_0\,
      Q => \opcodeValue_reg_n_0_[1]\,
      R => '0'
    );
\readInData[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEE2022"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \bitsRemaining[2]_i_4_n_0\,
      I3 => \currentState__0\(3),
      I4 => \^dbg_inprogressread\(0),
      O => \readInData[0]_i_1_n_0\
    );
\readInData[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_5_n_0\,
      I3 => \readInData[10]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(10),
      O => \readInData[10]_i_1_n_0\
    );
\readInData[10]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \readInData[10]_i_2_n_0\
    );
\readInData[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_5_n_0\,
      I3 => \readInData[11]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(11),
      O => \readInData[11]_i_1_n_0\
    );
\readInData[11]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \readInData[11]_i_2_n_0\
    );
\readInData[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFEEEE20002222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[12]_i_2_n_0\,
      I3 => \readInData[15]_i_5_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(12),
      O => \readInData[12]_i_1_n_0\
    );
\readInData[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \readInData[12]_i_2_n_0\
    );
\readInData[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_5_n_0\,
      I3 => \readInData[13]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(13),
      O => \readInData[13]_i_1_n_0\
    );
\readInData[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \readInData[13]_i_2_n_0\
    );
\readInData[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_5_n_0\,
      I3 => \readInData[14]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(14),
      O => \readInData[14]_i_1_n_0\
    );
\readInData[14]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      O => \readInData[14]_i_2_n_0\
    );
\readInData[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFEEEE20002222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_4_n_0\,
      I3 => \readInData[15]_i_5_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(15),
      O => \readInData[15]_i_1_n_0\
    );
\readInData[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => mdio_o,
      I1 => \currentState__0\(3),
      I2 => \currentState__0\(1),
      I3 => \currentState__0\(2),
      O => readInData0_in(15)
    );
\readInData[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \currentState__0\(1),
      I1 => \currentState__0\(2),
      I2 => \currentState__0\(0),
      O => \readInData[15]_i_3_n_0\
    );
\readInData[15]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \readInData[15]_i_4_n_0\
    );
\readInData[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      O => \readInData[15]_i_5_n_0\
    );
\readInData[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEE00022222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[7]_i_2_n_0\,
      I3 => \readInData[9]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(1),
      O => \readInData[1]_i_1_n_0\
    );
\readInData[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEE00022222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[7]_i_2_n_0\,
      I3 => \readInData[10]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(2),
      O => \readInData[2]_i_1_n_0\
    );
\readInData[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEE00022222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[7]_i_2_n_0\,
      I3 => \readInData[11]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(3),
      O => \readInData[3]_i_1_n_0\
    );
\readInData[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[12]_i_2_n_0\,
      I3 => \readInData[7]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(4),
      O => \readInData[4]_i_1_n_0\
    );
\readInData[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEE00022222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[7]_i_2_n_0\,
      I3 => \readInData[13]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(5),
      O => \readInData[5]_i_1_n_0\
    );
\readInData[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEEEEE00022222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[7]_i_2_n_0\,
      I3 => \readInData[14]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(6),
      O => \readInData[6]_i_1_n_0\
    );
\readInData[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_4_n_0\,
      I3 => \readInData[7]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(7),
      O => \readInData[7]_i_1_n_0\
    );
\readInData[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      O => \readInData[7]_i_2_n_0\
    );
\readInData[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFEEEE20002222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[8]_i_2_n_0\,
      I3 => \readInData[15]_i_5_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(8),
      O => \readInData[8]_i_1_n_0\
    );
\readInData[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \readInData[8]_i_2_n_0\
    );
\readInData[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFEEEE00202222"
    )
        port map (
      I0 => readInData0_in(15),
      I1 => \readInData[15]_i_3_n_0\,
      I2 => \readInData[15]_i_5_n_0\,
      I3 => \readInData[9]_i_2_n_0\,
      I4 => \currentState__0\(3),
      I5 => \^dbg_inprogressread\(9),
      O => \readInData[9]_i_1_n_0\
    );
\readInData[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \readInData[9]_i_2_n_0\
    );
\readInData_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[0]_i_1_n_0\,
      Q => \^dbg_inprogressread\(0),
      R => '0'
    );
\readInData_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[10]_i_1_n_0\,
      Q => \^dbg_inprogressread\(10),
      R => '0'
    );
\readInData_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[11]_i_1_n_0\,
      Q => \^dbg_inprogressread\(11),
      R => '0'
    );
\readInData_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[12]_i_1_n_0\,
      Q => \^dbg_inprogressread\(12),
      R => '0'
    );
\readInData_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[13]_i_1_n_0\,
      Q => \^dbg_inprogressread\(13),
      R => '0'
    );
\readInData_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[14]_i_1_n_0\,
      Q => \^dbg_inprogressread\(14),
      R => '0'
    );
\readInData_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[15]_i_1_n_0\,
      Q => \^dbg_inprogressread\(15),
      R => '0'
    );
\readInData_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[1]_i_1_n_0\,
      Q => \^dbg_inprogressread\(1),
      R => '0'
    );
\readInData_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[2]_i_1_n_0\,
      Q => \^dbg_inprogressread\(2),
      R => '0'
    );
\readInData_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[3]_i_1_n_0\,
      Q => \^dbg_inprogressread\(3),
      R => '0'
    );
\readInData_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[4]_i_1_n_0\,
      Q => \^dbg_inprogressread\(4),
      R => '0'
    );
\readInData_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[5]_i_1_n_0\,
      Q => \^dbg_inprogressread\(5),
      R => '0'
    );
\readInData_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[6]_i_1_n_0\,
      Q => \^dbg_inprogressread\(6),
      R => '0'
    );
\readInData_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[7]_i_1_n_0\,
      Q => \^dbg_inprogressread\(7),
      R => '0'
    );
\readInData_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[8]_i_1_n_0\,
      Q => \^dbg_inprogressread\(8),
      R => '0'
    );
\readInData_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => \readInData[9]_i_1_n_0\,
      Q => \^dbg_inprogressread\(9),
      R => '0'
    );
\registerReadData[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \currentState__0\(1),
      I1 => \currentState__0\(3),
      I2 => newRequestIsWrite,
      I3 => \currentState__0\(2),
      I4 => \currentState__0\(0),
      O => \registerReadData[15]_i_1_n_0\
    );
\registerReadData_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(0),
      Q => registerReadData(0),
      R => '0'
    );
\registerReadData_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(10),
      Q => registerReadData(10),
      R => '0'
    );
\registerReadData_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(11),
      Q => registerReadData(11),
      R => '0'
    );
\registerReadData_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(12),
      Q => registerReadData(12),
      R => '0'
    );
\registerReadData_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(13),
      Q => registerReadData(13),
      R => '0'
    );
\registerReadData_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(14),
      Q => registerReadData(14),
      R => '0'
    );
\registerReadData_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(15),
      Q => registerReadData(15),
      R => '0'
    );
\registerReadData_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(1),
      Q => registerReadData(1),
      R => '0'
    );
\registerReadData_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(2),
      Q => registerReadData(2),
      R => '0'
    );
\registerReadData_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(3),
      Q => registerReadData(3),
      R => '0'
    );
\registerReadData_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(4),
      Q => registerReadData(4),
      R => '0'
    );
\registerReadData_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(5),
      Q => registerReadData(5),
      R => '0'
    );
\registerReadData_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(6),
      Q => registerReadData(6),
      R => '0'
    );
\registerReadData_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(7),
      Q => registerReadData(7),
      R => '0'
    );
\registerReadData_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(8),
      Q => registerReadData(8),
      R => '0'
    );
\registerReadData_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => \registerReadData[15]_i_1_n_0\,
      D => \^dbg_inprogressread\(9),
      Q => registerReadData(9),
      R => '0'
    );
registerReadReady_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFDFFFD00000400"
    )
        port map (
      I0 => \currentState__0\(0),
      I1 => \currentState__0\(1),
      I2 => \currentState__0\(2),
      I3 => \currentState__0\(3),
      I4 => newRequestIsWrite,
      I5 => \^registerreadready\,
      O => registerReadReady_i_1_n_0
    );
registerReadReady_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => registerReadReady_i_1_n_0,
      Q => \^registerreadready\,
      R => '0'
    );
registerWriteComplete_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0040"
    )
        port map (
      I0 => \currentState__0\(2),
      I1 => \currentState__0\(3),
      I2 => \currentState__0\(1),
      I3 => \currentState__0\(0),
      I4 => \^registerwritecomplete\,
      O => registerWriteComplete_i_1_n_0
    );
registerWriteComplete_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clkin25,
      CE => '1',
      D => registerWriteComplete_i_1_n_0,
      Q => \^registerwritecomplete\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_EthernetMDIOControll_0_0 is
  port (
    clkin25 : in STD_LOGIC;
    mdio_clk : out STD_LOGIC;
    mdio_i : out STD_LOGIC;
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC;
    mdio_t_ctrl : out STD_LOGIC;
    registerReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : out STD_LOGIC;
    registerWriteComplete : out STD_LOGIC;
    newRequestPHYAddress : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : in STD_LOGIC;
    newRequestStart : in STD_LOGIC;
    DBG_BitsRemaining : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_InProgressRead : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_EthMDIO_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_EthernetMDIOControll_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_EthernetMDIOControll_0_0 : entity is "design_1_EthernetMDIOControll_0_0,EthernetMDIOController,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_EthernetMDIOControll_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_EthernetMDIOControll_0_0 : entity is "EthernetMDIOController,Vivado 2018.1_AR73068";
end design_1_EthernetMDIOControll_0_0;

architecture STRUCTURE of design_1_EthernetMDIOControll_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^dbg_bitsremaining\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^dbg_ethmdio_state\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^clkin25\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clkin25 : signal is "xilinx.com:signal:clock:1.0 clkin25 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin25 : signal is "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, PHASE 0.000, CLK_DOMAIN design_1_ClockDivider4_1_0_0_clkout25";
  attribute x_interface_info of mdio_clk : signal is "xilinx.com:interface:mdio:1.0 MDIO MDC";
  attribute x_interface_parameter of mdio_clk : signal is "XIL_INTERFACENAME MDIO, FREQ_HZ 25000000, CAN_DEBUG false";
  attribute x_interface_info of mdio_i : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  attribute x_interface_info of mdio_o : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
  attribute x_interface_info of mdio_t : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
begin
  DBG_BitsRemaining(5) <= \<const0>\;
  DBG_BitsRemaining(4 downto 0) <= \^dbg_bitsremaining\(4 downto 0);
  DBG_EthMDIO_State(4) <= \<const0>\;
  DBG_EthMDIO_State(3 downto 0) <= \^dbg_ethmdio_state\(3 downto 0);
  \^clkin25\ <= clkin25;
  mdio_clk <= \^clkin25\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_EthernetMDIOControll_0_0_EthernetMDIOController
     port map (
      \DBG_EthMDIO_State[3]\(3 downto 0) => \^dbg_ethmdio_state\(3 downto 0),
      DBG_InProgressRead(15 downto 0) => DBG_InProgressRead(15 downto 0),
      Q(4 downto 0) => \^dbg_bitsremaining\(4 downto 0),
      clkin25 => \^clkin25\,
      mdio_i => mdio_i,
      mdio_o => mdio_o,
      mdio_t_ctrl => mdio_t_ctrl,
      newRequestData(15 downto 0) => newRequestData(15 downto 0),
      newRequestDevTypeRegister(4 downto 0) => newRequestDevTypeRegister(4 downto 0),
      newRequestIsWrite => newRequestIsWrite,
      newRequestPHYAddress(4 downto 0) => newRequestPHYAddress(4 downto 0),
      newRequestStart => newRequestStart,
      registerReadData(15 downto 0) => registerReadData(15 downto 0),
      registerReadReady => registerReadReady,
      registerWriteComplete => registerWriteComplete
    );
end STRUCTURE;
