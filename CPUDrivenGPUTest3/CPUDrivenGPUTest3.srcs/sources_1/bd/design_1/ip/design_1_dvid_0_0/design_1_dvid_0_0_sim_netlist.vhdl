-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:44:04 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_dvid_0_0/design_1_dvid_0_0_sim_netlist.vhdl
-- Design      : design_1_dvid_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_dvid_0_0_TDMS_encoder is
  port (
    \e_reg[9]_0\ : out STD_LOGIC;
    EncodedR : out STD_LOGIC_VECTOR ( 9 downto 0 );
    red_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blank : in STD_LOGIC;
    isTERC4Region : in STD_LOGIC;
    guardBandEnable : in STD_LOGIC;
    guardBandType : in STD_LOGIC;
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_pixel_x1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_dvid_0_0_TDMS_encoder : entity is "TDMS_encoder";
end design_1_dvid_0_0_TDMS_encoder;

architecture STRUCTURE of design_1_dvid_0_0_TDMS_encoder is
  signal \dc_bias[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_10_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_11_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_8__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_9__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_20_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_21_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_22_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_23_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_24_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_25_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_26_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_27_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[0]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[1]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[2]\ : STD_LOGIC;
  signal \e[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[0]_i_2_n_0\ : STD_LOGIC;
  signal \e[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_2_n_0\ : STD_LOGIC;
  signal \e[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_2_n_0\ : STD_LOGIC;
  signal \e[6]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_4_n_0\ : STD_LOGIC;
  signal \e[7]_i_10_n_0\ : STD_LOGIC;
  signal \e[7]_i_11_n_0\ : STD_LOGIC;
  signal \e[7]_i_12_n_0\ : STD_LOGIC;
  signal \e[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_3_n_0\ : STD_LOGIC;
  signal \e[7]_i_4_n_0\ : STD_LOGIC;
  signal \e[7]_i_5__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_6_n_0\ : STD_LOGIC;
  signal \e[7]_i_7_n_0\ : STD_LOGIC;
  signal \e[7]_i_8_n_0\ : STD_LOGIC;
  signal \e[7]_i_9_n_0\ : STD_LOGIC;
  signal \e[8]_i_1_n_0\ : STD_LOGIC;
  signal \e[8]_i_2_n_0\ : STD_LOGIC;
  signal \e[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_4_n_0\ : STD_LOGIC;
  signal \e[8]_i_5_n_0\ : STD_LOGIC;
  signal \e[8]_i_6_n_0\ : STD_LOGIC;
  signal \e[8]_i_7_n_0\ : STD_LOGIC;
  signal \e[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_4__1_n_0\ : STD_LOGIC;
  signal \e_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \e_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \^e_reg[9]_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_3__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_4__1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_10\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_11\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_4__1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_7__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_8__1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_9__1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_10__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_11__0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_3__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_8__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_9__1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_10__0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_16__0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_17__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_20\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_21\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_22\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_24\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_25\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_26\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_27\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_6__1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_8__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \e[0]_i_1__0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \e[3]_i_3__1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \e[5]_i_4__0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \e[6]_i_3__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \e[6]_i_4\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \e[7]_i_11\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \e[7]_i_12\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \e[7]_i_4\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \e[7]_i_6\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \e[7]_i_7\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \e[7]_i_8\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \e[7]_i_9\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \e[8]_i_3__0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \e[8]_i_5\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \e[8]_i_6\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \e[9]_i_2__0\ : label is "soft_lutpair57";
begin
  \e_reg[9]_0\ <= \^e_reg[9]_0\;
\dc_bias[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F90909F909F9F90"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias[0]_i_2__0_n_0\,
      I2 => \e[7]_i_3_n_0\,
      I3 => \e[7]_i_5__0_n_0\,
      I4 => \dc_bias[0]_i_3__0_n_0\,
      I5 => \dc_bias[0]_i_4__1_n_0\,
      O => \dc_bias[0]_i_1__0_n_0\
    );
\dc_bias[0]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => red_p(0),
      I1 => \e[7]_i_4_n_0\,
      I2 => \dc_bias[0]_i_5__0_n_0\,
      I3 => \dc_bias[0]_i_6_n_0\,
      I4 => \e[7]_i_11_n_0\,
      O => \dc_bias[0]_i_2__0_n_0\
    );
\dc_bias[0]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \e[3]_i_3__1_n_0\,
      I1 => red_p(5),
      I2 => red_p(0),
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => red_p(7),
      O => \dc_bias[0]_i_3__0_n_0\
    );
\dc_bias[0]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => red_p(2),
      I1 => \e[8]_i_2_n_0\,
      O => \dc_bias[0]_i_4__1_n_0\
    );
\dc_bias[0]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(6),
      O => \dc_bias[0]_i_5__0_n_0\
    );
\dc_bias[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(3),
      I2 => red_p(2),
      I3 => red_p(0),
      I4 => red_p(1),
      I5 => red_p(4),
      O => \dc_bias[0]_i_6_n_0\
    );
\dc_bias[1]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_10_n_0\
    );
\dc_bias[1]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      I4 => red_p(3),
      O => \dc_bias[1]_i_11_n_0\
    );
\dc_bias[1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9556FFFF95560000"
    )
        port map (
      I0 => \dc_bias[1]_i_4__1_n_0\,
      I1 => \e[8]_i_2_n_0\,
      I2 => \dc_bias[0]_i_2__0_n_0\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \e[7]_i_5__0_n_0\,
      I5 => \dc_bias[1]_i_5_n_0\,
      O => \dc_bias[1]_i_2__0_n_0\
    );
\dc_bias[1]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"690069FF69FF6900"
    )
        port map (
      I0 => \dc_bias[1]_i_6_n_0\,
      I1 => \dc_bias[1]_i_7__0_n_0\,
      I2 => \e[7]_i_8_n_0\,
      I3 => \e[8]_i_2_n_0\,
      I4 => \dc_bias[3]_i_10__0_n_0\,
      I5 => \dc_bias[1]_i_4__1_n_0\,
      O => \dc_bias[1]_i_3__0_n_0\
    );
\dc_bias[1]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias[3]_i_9__0_n_0\,
      O => \dc_bias[1]_i_4__1_n_0\
    );
\dc_bias[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6659AA66559A665"
    )
        port map (
      I0 => \dc_bias[2]_i_8__0_n_0\,
      I1 => \dc_bias[1]_i_8__1_n_0\,
      I2 => \dc_bias[1]_i_9__1_n_0\,
      I3 => \dc_bias[1]_i_10_n_0\,
      I4 => red_p(7),
      I5 => \dc_bias[1]_i_11_n_0\,
      O => \dc_bias[1]_i_5_n_0\
    );
\dc_bias[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"28BEBE28EB8282EB"
    )
        port map (
      I0 => \e[7]_i_11_n_0\,
      I1 => \dc_bias[0]_i_5__0_n_0\,
      I2 => \dc_bias[0]_i_6_n_0\,
      I3 => \dc_bias[1]_i_10_n_0\,
      I4 => \e[7]_i_4_n_0\,
      I5 => \e[8]_i_2_n_0\,
      O => \dc_bias[1]_i_6_n_0\
    );
\dc_bias[1]_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => \dc_bias[3]_i_20_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => red_p(0),
      I3 => \e[7]_i_9_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[1]_i_7__0_n_0\
    );
\dc_bias[1]_i_8__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(2),
      I1 => red_p(0),
      I2 => red_p(1),
      O => \dc_bias[1]_i_8__1_n_0\
    );
\dc_bias[1]_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(1),
      I2 => \e[8]_i_2_n_0\,
      O => \dc_bias[1]_i_9__1_n_0\
    );
\dc_bias[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBB88B8888"
    )
        port map (
      I0 => \dc_bias_reg[2]_i_2_n_0\,
      I1 => \e[7]_i_3_n_0\,
      I2 => \dc_bias[2]_i_3__0_n_0\,
      I3 => \dc_bias[2]_i_4__0_n_0\,
      I4 => \e[7]_i_5__0_n_0\,
      I5 => \dc_bias[2]_i_5__0_n_0\,
      O => \dc_bias[2]_i_1_n_0\
    );
\dc_bias[2]_i_10__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"066F6F06"
    )
        port map (
      I0 => \e[3]_i_3__1_n_0\,
      I1 => red_p(5),
      I2 => red_p(7),
      I3 => red_p(0),
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_10__0_n_0\
    );
\dc_bias[2]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => red_p(2),
      I2 => \dc_bias[0]_i_3__0_n_0\,
      O => \dc_bias[2]_i_11__0_n_0\
    );
\dc_bias[2]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F9999990"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias[3]_i_9__0_n_0\,
      I2 => \e[8]_i_2_n_0\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \dc_bias[0]_i_2__0_n_0\,
      O => \dc_bias[2]_i_3__0_n_0\
    );
\dc_bias[2]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2DD2"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias[3]_i_9__0_n_0\,
      I2 => \dc_bias[3]_i_11__0_n_0\,
      I3 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_4__0_n_0\
    );
\dc_bias[2]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000009556566A"
    )
        port map (
      I0 => \dc_bias[3]_i_13__0_n_0\,
      I1 => \dc_bias[2]_i_8__0_n_0\,
      I2 => \dc_bias[2]_i_9__1_n_0\,
      I3 => \dc_bias[2]_i_10__0_n_0\,
      I4 => \dc_bias[2]_i_11__0_n_0\,
      I5 => \e[7]_i_5__0_n_0\,
      O => \dc_bias[2]_i_5__0_n_0\
    );
\dc_bias[2]_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2BD4D42B"
    )
        port map (
      I0 => \dc_bias[3]_i_9__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_10__0_n_0\,
      I3 => \dc_bias[3]_i_11__0_n_0\,
      I4 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_6__0_n_0\
    );
\dc_bias[2]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A59A69AA69A65A6"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \e[7]_i_9_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[3]_i_19_n_0\,
      I4 => \e[7]_i_8_n_0\,
      I5 => \dc_bias[1]_i_6_n_0\,
      O => \dc_bias[2]_i_7__0_n_0\
    );
\dc_bias[2]_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999666"
    )
        port map (
      I0 => \dc_bias[3]_i_23_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => red_p(0),
      I4 => \dc_bias[3]_i_24_n_0\,
      O => \dc_bias[2]_i_8__0_n_0\
    );
\dc_bias[2]_i_9__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB7D"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      O => \dc_bias[2]_i_9__1_n_0\
    );
\dc_bias[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AB00AB00AB00ABAB"
    )
        port map (
      I0 => \dc_bias[3]_i_2__0_n_0\,
      I1 => \e[8]_i_2_n_0\,
      I2 => \dc_bias[3]_i_3__0_n_0\,
      I3 => \dc_bias[3]_i_4__0_n_0\,
      I4 => \dc_bias[3]_i_5__0_n_0\,
      I5 => \dc_bias[3]_i_6__1_n_0\,
      O => \dc_bias[3]_i_1_n_0\
    );
\dc_bias[3]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias[0]_i_2__0_n_0\,
      O => \dc_bias[3]_i_10__0_n_0\
    );
\dc_bias[3]_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"424444D444D4D4DD"
    )
        port map (
      I0 => \e[7]_i_8_n_0\,
      I1 => \e[7]_i_9_n_0\,
      I2 => \dc_bias[3]_i_21_n_0\,
      I3 => \dc_bias[3]_i_20_n_0\,
      I4 => red_p(0),
      I5 => \e[7]_i_11_n_0\,
      O => \dc_bias[3]_i_11__0_n_0\
    );
\dc_bias[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556556A56AA6A"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias[3]_i_22_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[3]_i_23_n_0\,
      I4 => \dc_bias[3]_i_24_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_12_n_0\
    );
\dc_bias[3]_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D44242422BBDBDBD"
    )
        port map (
      I0 => \dc_bias[3]_i_23_n_0\,
      I1 => \dc_bias[3]_i_24_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => red_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_13__0_n_0\
    );
\dc_bias[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000069006969FF"
    )
        port map (
      I0 => \dc_bias[3]_i_23_n_0\,
      I1 => \dc_bias[3]_i_25_n_0\,
      I2 => \dc_bias[3]_i_24_n_0\,
      I3 => \dc_bias[2]_i_9__1_n_0\,
      I4 => \dc_bias[2]_i_10__0_n_0\,
      I5 => \dc_bias[2]_i_11__0_n_0\,
      O => \dc_bias[3]_i_14_n_0\
    );
\dc_bias[3]_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF9669FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_23_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_22_n_0\,
      I3 => \dc_bias[3]_i_24_n_0\,
      I4 => \dc_bias[2]_i_9__1_n_0\,
      I5 => \dc_bias[3]_i_26_n_0\,
      O => \dc_bias[3]_i_15__0_n_0\
    );
\dc_bias[3]_i_16__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \dc_bias[0]_i_2__0_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[8]_i_2_n_0\,
      O => \dc_bias[3]_i_16__0_n_0\
    );
\dc_bias[3]_i_17__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => \dc_bias[0]_i_2__0_n_0\,
      I2 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_17__0_n_0\
    );
\dc_bias[3]_i_18__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D002FDD0FFFFFFFF"
    )
        port map (
      I0 => \e[7]_i_11_n_0\,
      I1 => \e[7]_i_12_n_0\,
      I2 => \e[7]_i_10_n_0\,
      I3 => \e[7]_i_9_n_0\,
      I4 => \e[7]_i_8_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_18__1_n_0\
    );
\dc_bias[3]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7117177117717117"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \dc_bias[0]_i_5__0_n_0\,
      I3 => \e[6]_i_3__0_n_0\,
      I4 => red_p(7),
      I5 => \e[8]_i_2_n_0\,
      O => \dc_bias[3]_i_19_n_0\
    );
\dc_bias[3]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => red_p(6),
      I1 => red_p(5),
      I2 => \e[6]_i_3__0_n_0\,
      I3 => red_p(7),
      I4 => \e[8]_i_2_n_0\,
      O => \dc_bias[3]_i_20_n_0\
    );
\dc_bias[3]_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(6),
      I1 => \e[8]_i_2_n_0\,
      I2 => \e[6]_i_3__0_n_0\,
      O => \dc_bias[3]_i_21_n_0\
    );
\dc_bias[3]_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_22_n_0\
    );
\dc_bias[3]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BD4D42BD42B2BD4"
    )
        port map (
      I0 => red_p(4),
      I1 => red_p(5),
      I2 => \e[8]_i_2_n_0\,
      I3 => \dc_bias[3]_i_27_n_0\,
      I4 => red_p(2),
      I5 => red_p(3),
      O => \dc_bias[3]_i_23_n_0\
    );
\dc_bias[3]_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8EE8E88E"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => red_p(7),
      I2 => \e[6]_i_3__0_n_0\,
      I3 => red_p(5),
      I4 => red_p(6),
      O => \dc_bias[3]_i_24_n_0\
    );
\dc_bias[3]_i_25\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => red_p(0),
      O => \dc_bias[3]_i_25_n_0\
    );
\dc_bias[3]_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF9FFFFF"
    )
        port map (
      I0 => red_p(2),
      I1 => \e[8]_i_2_n_0\,
      I2 => \dc_bias[1]_i_10_n_0\,
      I3 => red_p(7),
      I4 => \dc_bias[1]_i_11_n_0\,
      O => \dc_bias[3]_i_26_n_0\
    );
\dc_bias[3]_i_27\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(0),
      O => \dc_bias[3]_i_27_n_0\
    );
\dc_bias[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5D5DD55DD5D55DD5"
    )
        port map (
      I0 => \e[7]_i_3_n_0\,
      I1 => \e[8]_i_2_n_0\,
      I2 => \dc_bias[3]_i_7__0_n_0\,
      I3 => \dc_bias[3]_i_8__0_n_0\,
      I4 => \dc_bias_reg_n_0_[2]\,
      I5 => p_1_in,
      O => \dc_bias[3]_i_2__0_n_0\
    );
\dc_bias[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A665AAAA5555A665"
    )
        port map (
      I0 => \e[7]_i_5__0_n_0\,
      I1 => \dc_bias[3]_i_9__0_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[3]_i_10__0_n_0\,
      I4 => \dc_bias[3]_i_11__0_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_3__0_n_0\
    );
\dc_bias[3]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABABBAABBABABABA"
    )
        port map (
      I0 => \e[7]_i_3_n_0\,
      I1 => \e[7]_i_5__0_n_0\,
      I2 => \dc_bias[3]_i_12_n_0\,
      I3 => \dc_bias[3]_i_13__0_n_0\,
      I4 => \dc_bias[3]_i_14_n_0\,
      I5 => \dc_bias[3]_i_15__0_n_0\,
      O => \dc_bias[3]_i_4__0_n_0\
    );
\dc_bias[3]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"990909099D9D9909"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \dc_bias[3]_i_11__0_n_0\,
      I2 => \dc_bias[3]_i_16__0_n_0\,
      I3 => \dc_bias[3]_i_17__0_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      I5 => \dc_bias[3]_i_9__0_n_0\,
      O => \dc_bias[3]_i_5__0_n_0\
    );
\dc_bias[3]_i_6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FBFFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_16__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_9__0_n_0\,
      I3 => \dc_bias[3]_i_18__1_n_0\,
      I4 => \e[7]_i_5__0_n_0\,
      O => \dc_bias[3]_i_6__1_n_0\
    );
\dc_bias[3]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"544080548054A880"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \dc_bias[1]_i_6_n_0\,
      I2 => \e[7]_i_8_n_0\,
      I3 => \dc_bias_reg_n_0_[1]\,
      I4 => \e[7]_i_9_n_0\,
      I5 => \dc_bias[3]_i_19_n_0\,
      O => \dc_bias[3]_i_7__0_n_0\
    );
\dc_bias[3]_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"17FF0017"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \dc_bias[3]_i_20_n_0\,
      I3 => \dc_bias_reg_n_0_[1]\,
      I4 => \e[7]_i_9_n_0\,
      O => \dc_bias[3]_i_8__0_n_0\
    );
\dc_bias[3]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1781E87EE87E1781"
    )
        port map (
      I0 => \e[7]_i_11_n_0\,
      I1 => red_p(0),
      I2 => \dc_bias[3]_i_20_n_0\,
      I3 => \dc_bias[3]_i_21_n_0\,
      I4 => \e[7]_i_9_n_0\,
      I5 => \e[7]_i_8_n_0\,
      O => \dc_bias[3]_i_9__0_n_0\
    );
\dc_bias_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[0]_i_1__0_n_0\,
      Q => \dc_bias_reg_n_0_[0]\,
      R => blank
    );
\dc_bias_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[1]_i_1__0_n_0\,
      Q => \dc_bias_reg_n_0_[1]\,
      R => blank
    );
\dc_bias_reg[1]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[1]_i_2__0_n_0\,
      I1 => \dc_bias[1]_i_3__0_n_0\,
      O => \dc_bias_reg[1]_i_1__0_n_0\,
      S => \e[7]_i_3_n_0\
    );
\dc_bias_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[2]_i_1_n_0\,
      Q => \dc_bias_reg_n_0_[2]\,
      R => blank
    );
\dc_bias_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[2]_i_6__0_n_0\,
      I1 => \dc_bias[2]_i_7__0_n_0\,
      O => \dc_bias_reg[2]_i_2_n_0\,
      S => \e[8]_i_2_n_0\
    );
\dc_bias_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[3]_i_1_n_0\,
      Q => p_1_in,
      R => blank
    );
\e[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B88B"
    )
        port map (
      I0 => \e[0]_i_2_n_0\,
      I1 => blank,
      I2 => red_p(0),
      I3 => \e[9]_i_2__0_n_0\,
      O => \e[0]_i_1__0_n_0\
    );
\e[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC09000A0"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => TERC4Character2(3),
      I2 => \^e_reg[9]_0\,
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(2),
      I5 => \e[5]_i_4__0_n_0\,
      O => \e[0]_i_2_n_0\
    );
\e[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4BB41EE1"
    )
        port map (
      I0 => \e[7]_i_3_n_0\,
      I1 => \e[8]_i_2_n_0\,
      I2 => red_p(1),
      I3 => red_p(0),
      I4 => \e[7]_i_5__0_n_0\,
      O => \e[1]_i_2__0_n_0\
    );
\e[1]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC8404888"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => \^e_reg[9]_0\,
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(3),
      I5 => \e[5]_i_4__0_n_0\,
      O => \e[1]_i_3__0_n_0\
    );
\e[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B88B8BB88BB8B88B"
    )
        port map (
      I0 => \e[2]_i_2_n_0\,
      I1 => blank,
      I2 => red_p(1),
      I3 => red_p(0),
      I4 => red_p(2),
      I5 => \e[9]_i_2__0_n_0\,
      O => \e[2]_i_1__0_n_0\
    );
\e[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44488C0C"
    )
        port map (
      I0 => TERC4Character2(3),
      I1 => \^e_reg[9]_0\,
      I2 => TERC4Character2(0),
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(2),
      I5 => \e[6]_i_4_n_0\,
      O => \e[2]_i_2_n_0\
    );
\e[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BB8B88BBB8888B"
    )
        port map (
      I0 => \e[3]_i_2__0_n_0\,
      I1 => blank,
      I2 => \e[7]_i_3_n_0\,
      I3 => \e[8]_i_2_n_0\,
      I4 => \e[3]_i_3__1_n_0\,
      I5 => \e[7]_i_5__0_n_0\,
      O => \e[3]_i_1__0_n_0\
    );
\e[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF36004D00"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => TERC4Character2(3),
      I2 => TERC4Character2(1),
      I3 => \^e_reg[9]_0\,
      I4 => TERC4Character2(2),
      I5 => \e[7]_i_6_n_0\,
      O => \e[3]_i_2__0_n_0\
    );
\e[3]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => red_p(3),
      I1 => red_p(2),
      I2 => red_p(0),
      I3 => red_p(1),
      O => \e[3]_i_3__1_n_0\
    );
\e[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B1E4"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_2__0_n_0\,
      I2 => \e[4]_i_2__0_n_0\,
      I3 => \e[6]_i_3__0_n_0\,
      O => \e[4]_i_1__0_n_0\
    );
\e[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"72190000FFFFFFFF"
    )
        port map (
      I0 => TERC4Character2(3),
      I1 => TERC4Character2(1),
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(0),
      I4 => \^e_reg[9]_0\,
      I5 => \e[8]_i_3__0_n_0\,
      O => \e[4]_i_2__0_n_0\
    );
\e[5]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B44BE11E"
    )
        port map (
      I0 => \e[7]_i_3_n_0\,
      I1 => \e[8]_i_2_n_0\,
      I2 => red_p(5),
      I3 => \e[6]_i_3__0_n_0\,
      I4 => \e[7]_i_5__0_n_0\,
      O => \e[5]_i_2__0_n_0\
    );
\e[5]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF659C0000"
    )
        port map (
      I0 => TERC4Character2(3),
      I1 => TERC4Character2(0),
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(1),
      I4 => \^e_reg[9]_0\,
      I5 => \e[5]_i_4__0_n_0\,
      O => \e[5]_i_3__0_n_0\
    );
\e[5]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel2Red(0),
      O => \e[5]_i_4__0_n_0\
    );
\e[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B88BB88B8BB8"
    )
        port map (
      I0 => \e[6]_i_2_n_0\,
      I1 => blank,
      I2 => \e[6]_i_3__0_n_0\,
      I3 => red_p(5),
      I4 => red_p(6),
      I5 => \e[9]_i_2__0_n_0\,
      O => \e[6]_i_1__0_n_0\
    );
\e[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEAAABAEABAFAEA"
    )
        port map (
      I0 => \e[6]_i_4_n_0\,
      I1 => TERC4Character2(0),
      I2 => \^e_reg[9]_0\,
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(3),
      I5 => TERC4Character2(2),
      O => \e[6]_i_2_n_0\
    );
\e[6]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => red_p(4),
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      I4 => red_p(3),
      O => \e[6]_i_3__0_n_0\
    );
\e[6]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4447"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel2Red(0),
      O => \e[6]_i_4_n_0\
    );
\e[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"35C5535CC5355C53"
    )
        port map (
      I0 => red_p(0),
      I1 => \e[8]_i_2_n_0\,
      I2 => red_p(7),
      I3 => \e[6]_i_3__0_n_0\,
      I4 => red_p(5),
      I5 => red_p(6),
      O => \e[7]_i_10_n_0\
    );
\e[7]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(3),
      I1 => red_p(0),
      I2 => red_p(1),
      O => \e[7]_i_11_n_0\
    );
\e[7]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(7),
      I2 => red_p(0),
      O => \e[7]_i_12_n_0\
    );
\e[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BB8B88BBB8888B"
    )
        port map (
      I0 => \e[7]_i_2__0_n_0\,
      I1 => blank,
      I2 => \e[7]_i_3_n_0\,
      I3 => \e[8]_i_2_n_0\,
      I4 => \e[7]_i_4_n_0\,
      I5 => \e[7]_i_5__0_n_0\,
      O => \e[7]_i_1__0_n_0\
    );
\e[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFD07D0000"
    )
        port map (
      I0 => TERC4Character2(2),
      I1 => TERC4Character2(3),
      I2 => TERC4Character2(1),
      I3 => TERC4Character2(0),
      I4 => \^e_reg[9]_0\,
      I5 => \e[7]_i_6_n_0\,
      O => \e[7]_i_2__0_n_0\
    );
\e[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAEEBEBBAAAAA"
    )
        port map (
      I0 => \e[7]_i_7_n_0\,
      I1 => \e[7]_i_8_n_0\,
      I2 => \e[7]_i_9_n_0\,
      I3 => \e[7]_i_10_n_0\,
      I4 => \e[7]_i_11_n_0\,
      I5 => \e[7]_i_12_n_0\,
      O => \e[7]_i_3_n_0\
    );
\e[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => red_p(7),
      I1 => \e[6]_i_3__0_n_0\,
      I2 => red_p(5),
      I3 => red_p(6),
      O => \e[7]_i_4_n_0\
    );
\e[7]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6A665A665655565"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[7]_i_8_n_0\,
      I2 => \e[7]_i_9_n_0\,
      I3 => \e[7]_i_11_n_0\,
      I4 => \e[7]_i_12_n_0\,
      I5 => \e[7]_i_10_n_0\,
      O => \e[7]_i_5__0_n_0\
    );
\e[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4744"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel2Red(0),
      O => \e[7]_i_6_n_0\
    );
\e[7]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => p_1_in,
      O => \e[7]_i_7_n_0\
    );
\e[7]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"693CC369"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      I4 => red_p(3),
      O => \e[7]_i_8_n_0\
    );
\e[7]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A96A"
    )
        port map (
      I0 => \e[6]_i_3__0_n_0\,
      I1 => red_p(5),
      I2 => \e[8]_i_2_n_0\,
      I3 => red_p(6),
      O => \e[7]_i_9_n_0\
    );
\e[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222222E2EEEEEEEE"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => blank,
      I2 => isTERC4Region,
      I3 => guardBandEnable,
      I4 => \e[9]_i_4__1_n_0\,
      I5 => \e[8]_i_3__0_n_0\,
      O => \e[8]_i_1_n_0\
    );
\e[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5DD50445D55D0445"
    )
        port map (
      I0 => \e[8]_i_4_n_0\,
      I1 => \e[8]_i_5_n_0\,
      I2 => red_p(7),
      I3 => \e[8]_i_6_n_0\,
      I4 => \e[8]_i_7_n_0\,
      I5 => red_p(0),
      O => \e[8]_i_2_n_0\
    );
\e[8]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FEE"
    )
        port map (
      I0 => isTERC4Region,
      I1 => controlChannel2Red(0),
      I2 => guardBandType,
      I3 => guardBandEnable,
      O => \e[8]_i_3__0_n_0\
    );
\e[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8E8E800E8000000"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      I3 => red_p(4),
      I4 => red_p(6),
      I5 => red_p(5),
      O => \e[8]_i_4_n_0\
    );
\e[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      O => \e[8]_i_5_n_0\
    );
\e[8]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(4),
      I1 => red_p(6),
      I2 => red_p(5),
      O => \e[8]_i_6_n_0\
    );
\e[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001700171717"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      I3 => red_p(4),
      I4 => red_p(6),
      I5 => red_p(5),
      O => \e[8]_i_7_n_0\
    );
\e[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCDDCCDDFCDDCCDD"
    )
        port map (
      I0 => \e[9]_i_2__0_n_0\,
      I1 => \e[9]_i_3__0_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => blank,
      I4 => isTERC4Region,
      I5 => guardBandEnable,
      O => \e[9]_i_1__0_n_0\
    );
\e[9]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => \e[7]_i_3_n_0\,
      I2 => \e[7]_i_5__0_n_0\,
      O => \e[9]_i_2__0_n_0\
    );
\e[9]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5300500050005300"
    )
        port map (
      I0 => guardBandType,
      I1 => isTERC4Region,
      I2 => guardBandEnable,
      I3 => blank,
      I4 => controlChannel2Red(0),
      I5 => controlChannel2Red(1),
      O => \e[9]_i_3__0_n_0\
    );
\e[9]_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B09F"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => TERC4Character2(1),
      I2 => TERC4Character2(3),
      I3 => TERC4Character2(2),
      O => \e[9]_i_4__1_n_0\
    );
\e[9]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => isTERC4Region,
      I1 => guardBandEnable,
      O => \^e_reg[9]_0\
    );
\e_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[0]_i_1__0_n_0\,
      Q => EncodedR(0),
      R => '0'
    );
\e_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[1]_i_1_n_0\,
      Q => EncodedR(1),
      R => '0'
    );
\e_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[1]_i_2__0_n_0\,
      I1 => \e[1]_i_3__0_n_0\,
      O => \e_reg[1]_i_1_n_0\,
      S => blank
    );
\e_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[2]_i_1__0_n_0\,
      Q => EncodedR(2),
      R => '0'
    );
\e_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[3]_i_1__0_n_0\,
      Q => EncodedR(3),
      R => '0'
    );
\e_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[4]_i_1__0_n_0\,
      Q => EncodedR(4),
      R => '0'
    );
\e_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[5]_i_1_n_0\,
      Q => EncodedR(5),
      R => '0'
    );
\e_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[5]_i_2__0_n_0\,
      I1 => \e[5]_i_3__0_n_0\,
      O => \e_reg[5]_i_1_n_0\,
      S => blank
    );
\e_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[6]_i_1__0_n_0\,
      Q => EncodedR(6),
      R => '0'
    );
\e_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[7]_i_1__0_n_0\,
      Q => EncodedR(7),
      R => '0'
    );
\e_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[8]_i_1_n_0\,
      Q => EncodedR(8),
      R => '0'
    );
\e_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[9]_i_1__0_n_0\,
      Q => EncodedR(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_dvid_0_0_TDMS_encoder__parameterized1\ is
  port (
    EncodedG : out STD_LOGIC_VECTOR ( 9 downto 0 );
    controlChannel1Green : in STD_LOGIC_VECTOR ( 1 downto 0 );
    isTERC4Region : in STD_LOGIC;
    blank : in STD_LOGIC;
    green_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    guardBandEnable : in STD_LOGIC;
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_pixel_x1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_dvid_0_0_TDMS_encoder__parameterized1\ : entity is "TDMS_encoder";
end \design_1_dvid_0_0_TDMS_encoder__parameterized1\;

architecture STRUCTURE of \design_1_dvid_0_0_TDMS_encoder__parameterized1\ is
  signal \dc_bias[0]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_9__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_12_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_13_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_14_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_15_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[0]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[1]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[2]\ : STD_LOGIC;
  signal e0_in : STD_LOGIC_VECTOR ( 9 downto 7 );
  signal \e[0]_i_1_n_0\ : STD_LOGIC;
  signal \e[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[1]_i_1_n_0\ : STD_LOGIC;
  signal \e[1]_i_2_n_0\ : STD_LOGIC;
  signal \e[1]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[2]_i_1_n_0\ : STD_LOGIC;
  signal \e[2]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[2]_i_3_n_0\ : STD_LOGIC;
  signal \e[3]_i_1_n_0\ : STD_LOGIC;
  signal \e[3]_i_2_n_0\ : STD_LOGIC;
  signal \e[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[4]_i_1_n_0\ : STD_LOGIC;
  signal \e[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_1_n_0\ : STD_LOGIC;
  signal \e[5]_i_2_n_0\ : STD_LOGIC;
  signal \e[5]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_1_n_0\ : STD_LOGIC;
  signal \e[6]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_3_n_0\ : STD_LOGIC;
  signal \e[6]_i_4__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_2_n_0\ : STD_LOGIC;
  signal \e[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_5_n_0\ : STD_LOGIC;
  signal \e[7]_i_6__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_10_n_0\ : STD_LOGIC;
  signal \e[9]_i_11_n_0\ : STD_LOGIC;
  signal \e[9]_i_12__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_13_n_0\ : STD_LOGIC;
  signal \e[9]_i_14_n_0\ : STD_LOGIC;
  signal \e[9]_i_15_n_0\ : STD_LOGIC;
  signal \e[9]_i_16_n_0\ : STD_LOGIC;
  signal \e[9]_i_17_n_0\ : STD_LOGIC;
  signal \e[9]_i_2_n_0\ : STD_LOGIC;
  signal \e[9]_i_3_n_0\ : STD_LOGIC;
  signal \e[9]_i_4_n_0\ : STD_LOGIC;
  signal \e[9]_i_5_n_0\ : STD_LOGIC;
  signal \e[9]_i_6_n_0\ : STD_LOGIC;
  signal \e[9]_i_7_n_0\ : STD_LOGIC;
  signal \e[9]_i_8_n_0\ : STD_LOGIC;
  signal \e[9]_i_9_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_5__1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_8\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_12\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_13\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_14\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_15\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_9\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_11\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_12__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_14__1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_17\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_18\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_19__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_7\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \e[1]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \e[2]_i_2__1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \e[3]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \e[4]_i_2__1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \e[6]_i_2__1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \e[6]_i_4__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \e[7]_i_3__1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \e[7]_i_5\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \e[7]_i_6__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \e[9]_i_12__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \e[9]_i_13\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \e[9]_i_14\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \e[9]_i_15\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \e[9]_i_17\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \e[9]_i_5\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \e[9]_i_8\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \e[9]_i_9\ : label is "soft_lutpair27";
begin
\dc_bias[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"909F9F909F90909F"
    )
        port map (
      I0 => \dc_bias[0]_i_2_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_6_n_0\,
      I4 => \dc_bias[0]_i_3_n_0\,
      I5 => \dc_bias[0]_i_4__0_n_0\,
      O => \dc_bias[0]_i_1_n_0\
    );
\dc_bias[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \e[9]_i_13_n_0\,
      I1 => \e[4]_i_2__1_n_0\,
      I2 => green_p(6),
      I3 => green_p(0),
      I4 => \dc_bias[0]_i_5_n_0\,
      O => \dc_bias[0]_i_2_n_0\
    );
\dc_bias[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \e[3]_i_2_n_0\,
      I1 => green_p(5),
      I2 => green_p(0),
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => green_p(7),
      O => \dc_bias[0]_i_3_n_0\
    );
\dc_bias[0]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => green_p(2),
      I1 => \e[9]_i_4_n_0\,
      O => \dc_bias[0]_i_4__0_n_0\
    );
\dc_bias[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => green_p(7),
      I1 => \e[4]_i_2__1_n_0\,
      I2 => green_p(5),
      I3 => green_p(6),
      O => \dc_bias[0]_i_5_n_0\
    );
\dc_bias[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B88B8BB8B8B8"
    )
        port map (
      I0 => \dc_bias[1]_i_4_n_0\,
      I1 => \e[9]_i_6_n_0\,
      I2 => \dc_bias[1]_i_5__1_n_0\,
      I3 => \dc_bias[0]_i_2_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      I5 => \e[9]_i_4_n_0\,
      O => \dc_bias[1]_i_2_n_0\
    );
\dc_bias[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F90909F909F9F90"
    )
        port map (
      I0 => \dc_bias[1]_i_6__0_n_0\,
      I1 => \dc_bias[1]_i_5__1_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \dc_bias[1]_i_7_n_0\,
      I4 => \dc_bias[1]_i_8_n_0\,
      I5 => \e[9]_i_15_n_0\,
      O => \dc_bias[1]_i_3_n_0\
    );
\dc_bias[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A96A95A995A95695"
    )
        port map (
      I0 => \dc_bias[3]_i_13_n_0\,
      I1 => \dc_bias[2]_i_12_n_0\,
      I2 => \e[2]_i_2__1_n_0\,
      I3 => \dc_bias[2]_i_14_n_0\,
      I4 => green_p(7),
      I5 => \dc_bias[2]_i_13_n_0\,
      O => \dc_bias[1]_i_4_n_0\
    );
\dc_bias[1]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias[3]_i_16_n_0\,
      O => \dc_bias[1]_i_5__1_n_0\
    );
\dc_bias[1]_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EBBEBEEB"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias[0]_i_5_n_0\,
      I2 => green_p(0),
      I3 => \dc_bias[1]_i_9__0_n_0\,
      I4 => \e[9]_i_13_n_0\,
      O => \dc_bias[1]_i_6__0_n_0\
    );
\dc_bias[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B712DE84DE84B712"
    )
        port map (
      I0 => \dc_bias[0]_i_5_n_0\,
      I1 => \e[9]_i_4_n_0\,
      I2 => \dc_bias[2]_i_14_n_0\,
      I3 => \e[9]_i_13_n_0\,
      I4 => green_p(6),
      I5 => \e[4]_i_2__1_n_0\,
      O => \dc_bias[1]_i_7_n_0\
    );
\dc_bias[1]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2BD4D42B"
    )
        port map (
      I0 => \e[7]_i_3__1_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => green_p(0),
      I3 => \dc_bias[3]_i_17_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[1]_i_8_n_0\
    );
\dc_bias[1]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => green_p(6),
      I1 => green_p(0),
      I2 => green_p(1),
      I3 => green_p(3),
      I4 => green_p(2),
      I5 => green_p(4),
      O => \dc_bias[1]_i_9__0_n_0\
    );
\dc_bias[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996C33C3CC36996"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => \e[1]_i_2_n_0\,
      I2 => green_p(3),
      I3 => green_p(2),
      I4 => green_p(4),
      I5 => green_p(5),
      O => \dc_bias[2]_i_10_n_0\
    );
\dc_bias[2]_i_11__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEBFFEBFFFF"
    )
        port map (
      I0 => \dc_bias[0]_i_4__0_n_0\,
      I1 => green_p(5),
      I2 => \e[3]_i_2_n_0\,
      I3 => green_p(7),
      I4 => \dc_bias_reg_n_0_[0]\,
      I5 => green_p(0),
      O => \dc_bias[2]_i_11__1_n_0\
    );
\dc_bias[2]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(0),
      I1 => green_p(1),
      I2 => \e[9]_i_4_n_0\,
      O => \dc_bias[2]_i_12_n_0\
    );
\dc_bias[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(2),
      I2 => green_p(3),
      I3 => green_p(1),
      I4 => green_p(0),
      O => \dc_bias[2]_i_13_n_0\
    );
\dc_bias[2]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_14_n_0\
    );
\dc_bias[2]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6996FFFF"
    )
        port map (
      I0 => \e[4]_i_2__1_n_0\,
      I1 => green_p(6),
      I2 => green_p(0),
      I3 => \dc_bias[0]_i_5_n_0\,
      I4 => \e[9]_i_13_n_0\,
      O => \dc_bias[2]_i_15_n_0\
    );
\dc_bias[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F00F99999999"
    )
        port map (
      I0 => \dc_bias[3]_i_7_n_0\,
      I1 => \dc_bias[2]_i_4_n_0\,
      I2 => \dc_bias[2]_i_5_n_0\,
      I3 => \dc_bias[2]_i_6_n_0\,
      I4 => \dc_bias[2]_i_7_n_0\,
      I5 => \e[9]_i_6_n_0\,
      O => \dc_bias[2]_i_2_n_0\
    );
\dc_bias[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606F9F906F60909F"
    )
        port map (
      I0 => \dc_bias[3]_i_6_n_0\,
      I1 => \dc_bias[2]_i_8_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \dc_bias[3]_i_10_n_0\,
      I4 => \dc_bias_reg_n_0_[2]\,
      I5 => \dc_bias[3]_i_9_n_0\,
      O => \dc_bias[2]_i_3_n_0\
    );
\dc_bias[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7887"
    )
        port map (
      I0 => \dc_bias[3]_i_16_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias[3]_i_6_n_0\,
      O => \dc_bias[2]_i_4_n_0\
    );
\dc_bias[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8818181177E7E7E"
    )
        port map (
      I0 => \dc_bias[2]_i_9_n_0\,
      I1 => \dc_bias[2]_i_10_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => green_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_5_n_0\
    );
\dc_bias[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000051154554"
    )
        port map (
      I0 => \dc_bias[3]_i_13_n_0\,
      I1 => \e[9]_i_4_n_0\,
      I2 => green_p(1),
      I3 => green_p(0),
      I4 => green_p(2),
      I5 => \dc_bias[2]_i_11__1_n_0\,
      O => \dc_bias[2]_i_6_n_0\
    );
\dc_bias[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0808000F8E0E080"
    )
        port map (
      I0 => \e[2]_i_2__1_n_0\,
      I1 => \dc_bias[2]_i_12_n_0\,
      I2 => \dc_bias[3]_i_13_n_0\,
      I3 => \dc_bias[2]_i_13_n_0\,
      I4 => green_p(7),
      I5 => \dc_bias[2]_i_14_n_0\,
      O => \dc_bias[2]_i_7_n_0\
    );
\dc_bias[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"41141441D77D7DD7"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_14_n_0\,
      I2 => \e[9]_i_15_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \dc_bias[2]_i_15_n_0\,
      I5 => \dc_bias[1]_i_6__0_n_0\,
      O => \dc_bias[2]_i_8_n_0\
    );
\dc_bias[2]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4DD4D44D"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => green_p(7),
      I2 => \e[4]_i_2__1_n_0\,
      I3 => green_p(5),
      I4 => green_p(6),
      O => \dc_bias[2]_i_9_n_0\
    );
\dc_bias[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2B22BB2B22BB2B2"
    )
        port map (
      I0 => \dc_bias[3]_i_18_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[4]_i_2__1_n_0\,
      I3 => green_p(6),
      I4 => green_p(5),
      I5 => \e[9]_i_4_n_0\,
      O => \dc_bias[3]_i_10_n_0\
    );
\dc_bias[3]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"066F6F06"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => green_p(7),
      I3 => \e[3]_i_2_n_0\,
      I4 => green_p(5),
      O => \dc_bias[3]_i_11_n_0\
    );
\dc_bias[3]_i_12__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F6"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => green_p(2),
      I2 => \dc_bias[0]_i_3_n_0\,
      O => \dc_bias[3]_i_12__1_n_0\
    );
\dc_bias[3]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969696"
    )
        port map (
      I0 => \dc_bias[2]_i_10_n_0\,
      I1 => \dc_bias[2]_i_9_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => green_p(0),
      O => \dc_bias[3]_i_13_n_0\
    );
\dc_bias[3]_i_14__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2841"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => green_p(1),
      I2 => green_p(0),
      I3 => green_p(2),
      O => \dc_bias[3]_i_14__1_n_0\
    );
\dc_bias[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555556566A6AAA"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias[3]_i_19__0_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[2]_i_10_n_0\,
      I4 => \dc_bias[2]_i_9_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_15_n_0\
    );
\dc_bias[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1871E78EE78E1871"
    )
        port map (
      I0 => \e[9]_i_13_n_0\,
      I1 => \e[9]_i_17_n_0\,
      I2 => \e[7]_i_3__1_n_0\,
      I3 => green_p(0),
      I4 => \e[9]_i_15_n_0\,
      I5 => \e[9]_i_14_n_0\,
      O => \dc_bias[3]_i_16_n_0\
    );
\dc_bias[3]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"24DB"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => green_p(5),
      I2 => green_p(6),
      I3 => \e[4]_i_2__1_n_0\,
      O => \dc_bias[3]_i_17_n_0\
    );
\dc_bias[3]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"17717117"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[9]_i_4_n_0\,
      I3 => green_p(7),
      I4 => \e[6]_i_2__1_n_0\,
      O => \dc_bias[3]_i_18_n_0\
    );
\dc_bias[3]_i_19__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_19__0_n_0\
    );
\dc_bias[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B8888B888B8B8BB"
    )
        port map (
      I0 => \dc_bias[3]_i_4_n_0\,
      I1 => \e[9]_i_6_n_0\,
      I2 => \dc_bias[3]_i_5_n_0\,
      I3 => \dc_bias_reg_n_0_[2]\,
      I4 => \dc_bias[3]_i_6_n_0\,
      I5 => \dc_bias[3]_i_7_n_0\,
      O => \dc_bias[3]_i_2_n_0\
    );
\dc_bias[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB8BB8BB88B88B88"
    )
        port map (
      I0 => \dc_bias[3]_i_8_n_0\,
      I1 => \e[9]_i_4_n_0\,
      I2 => \dc_bias[3]_i_9_n_0\,
      I3 => \dc_bias_reg_n_0_[2]\,
      I4 => \dc_bias[3]_i_10_n_0\,
      I5 => p_1_in,
      O => \dc_bias[3]_i_3_n_0\
    );
\dc_bias[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"088A8AAEF7757551"
    )
        port map (
      I0 => \dc_bias[2]_i_5_n_0\,
      I1 => \dc_bias[3]_i_11_n_0\,
      I2 => \dc_bias[3]_i_12__1_n_0\,
      I3 => \dc_bias[3]_i_13_n_0\,
      I4 => \dc_bias[3]_i_14__1_n_0\,
      I5 => \dc_bias[3]_i_15_n_0\,
      O => \dc_bias[3]_i_4_n_0\
    );
\dc_bias[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D77D7DD7D77DD77D"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_14_n_0\,
      I2 => \e[9]_i_15_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \e[9]_i_12__0_n_0\,
      I5 => \e[9]_i_13_n_0\,
      O => \dc_bias[3]_i_5_n_0\
    );
\dc_bias[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77E7717771771171"
    )
        port map (
      I0 => \e[9]_i_15_n_0\,
      I1 => \e[9]_i_14_n_0\,
      I2 => \e[9]_i_13_n_0\,
      I3 => \e[7]_i_3__1_n_0\,
      I4 => green_p(0),
      I5 => \e[9]_i_17_n_0\,
      O => \dc_bias[3]_i_6_n_0\
    );
\dc_bias[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6F666606"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias[3]_i_16_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \dc_bias[0]_i_2_n_0\,
      O => \dc_bias[3]_i_7_n_0\
    );
\dc_bias[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A995A9959595"
    )
        port map (
      I0 => \e[9]_i_6_n_0\,
      I1 => \dc_bias[3]_i_6_n_0\,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias[1]_i_6__0_n_0\,
      I4 => \dc_bias[3]_i_16_n_0\,
      I5 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[3]_i_8_n_0\
    );
\dc_bias[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D77D4114"
    )
        port map (
      I0 => \dc_bias[1]_i_7_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_17_n_0\,
      I3 => \dc_bias[3]_i_18_n_0\,
      I4 => \e[9]_i_15_n_0\,
      O => \dc_bias[3]_i_9_n_0\
    );
\dc_bias_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[0]_i_1_n_0\,
      Q => \dc_bias_reg_n_0_[0]\,
      R => blank
    );
\dc_bias_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[1]_i_1_n_0\,
      Q => \dc_bias_reg_n_0_[1]\,
      R => blank
    );
\dc_bias_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[1]_i_2_n_0\,
      I1 => \dc_bias[1]_i_3_n_0\,
      O => \dc_bias_reg[1]_i_1_n_0\,
      S => \e[9]_i_3_n_0\
    );
\dc_bias_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[2]_i_1_n_0\,
      Q => \dc_bias_reg_n_0_[2]\,
      R => blank
    );
\dc_bias_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[2]_i_2_n_0\,
      I1 => \dc_bias[2]_i_3_n_0\,
      O => \dc_bias_reg[2]_i_1_n_0\,
      S => \e[9]_i_3_n_0\
    );
\dc_bias_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[3]_i_1_n_0\,
      Q => p_1_in,
      R => blank
    );
\dc_bias_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[3]_i_2_n_0\,
      I1 => \dc_bias[3]_i_3_n_0\,
      O => \dc_bias_reg[3]_i_1_n_0\,
      S => \e[9]_i_3_n_0\
    );
\e[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000059A9"
    )
        port map (
      I0 => green_p(0),
      I1 => \e[9]_i_6_n_0\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => blank,
      I5 => \e[0]_i_2__1_n_0\,
      O => \e[0]_i_1_n_0\
    );
\e[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEBAABBAAAAAAAAA"
    )
        port map (
      I0 => \e[7]_i_5_n_0\,
      I1 => TERC4Character1(1),
      I2 => TERC4Character1(0),
      I3 => TERC4Character1(2),
      I4 => TERC4Character1(3),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[0]_i_2__1_n_0\
    );
\e[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF45105401"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[1]_i_2_n_0\,
      I4 => \e[9]_i_6_n_0\,
      I5 => \e[1]_i_3__1_n_0\,
      O => \e[1]_i_1_n_0\
    );
\e[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => green_p(1),
      I1 => green_p(0),
      O => \e[1]_i_2_n_0\
    );
\e[1]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC4884808"
    )
        port map (
      I0 => TERC4Character1(0),
      I1 => \e[7]_i_6__0_n_0\,
      I2 => TERC4Character1(3),
      I3 => TERC4Character1(2),
      I4 => TERC4Character1(1),
      I5 => \e[7]_i_5_n_0\,
      O => \e[1]_i_3__1_n_0\
    );
\e[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000A656"
    )
        port map (
      I0 => \e[2]_i_2__1_n_0\,
      I1 => \e[9]_i_6_n_0\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => blank,
      I5 => \e[2]_i_3_n_0\,
      O => \e[2]_i_1_n_0\
    );
\e[2]_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(0),
      I2 => green_p(1),
      O => \e[2]_i_2__1_n_0\
    );
\e[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1B00E300"
    )
        port map (
      I0 => TERC4Character1(1),
      I1 => TERC4Character1(0),
      I2 => TERC4Character1(2),
      I3 => \e[7]_i_6__0_n_0\,
      I4 => TERC4Character1(3),
      I5 => \e[6]_i_4__1_n_0\,
      O => \e[2]_i_3_n_0\
    );
\e[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000B4E1"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[9]_i_4_n_0\,
      I2 => \e[3]_i_2_n_0\,
      I3 => \e[9]_i_6_n_0\,
      I4 => blank,
      I5 => \e[3]_i_3__0_n_0\,
      O => \e[3]_i_1_n_0\
    );
\e[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => green_p(0),
      I1 => green_p(1),
      I2 => green_p(3),
      I3 => green_p(2),
      O => \e[3]_i_2_n_0\
    );
\e[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF044C8884"
    )
        port map (
      I0 => TERC4Character1(2),
      I1 => \e[7]_i_6__0_n_0\,
      I2 => TERC4Character1(0),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(3),
      I5 => \e[7]_i_5_n_0\,
      O => \e[3]_i_3__0_n_0\
    );
\e[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF41114144"
    )
        port map (
      I0 => blank,
      I1 => \e[4]_i_2__1_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \e[9]_i_6_n_0\,
      I5 => \e[4]_i_3__0_n_0\,
      O => \e[4]_i_1_n_0\
    );
\e[4]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => green_p(4),
      I1 => green_p(2),
      I2 => green_p(3),
      I3 => green_p(1),
      I4 => green_p(0),
      O => \e[4]_i_2__1_n_0\
    );
\e[4]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF088C4084"
    )
        port map (
      I0 => TERC4Character1(0),
      I1 => \e[7]_i_6__0_n_0\,
      I2 => TERC4Character1(3),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(2),
      I5 => \e[6]_i_4__1_n_0\,
      O => \e[4]_i_3__0_n_0\
    );
\e[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00006336"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[5]_i_2_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_6_n_0\,
      I4 => blank,
      I5 => \e[5]_i_3__1_n_0\,
      O => \e[5]_i_1_n_0\
    );
\e[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(0),
      I2 => green_p(1),
      I3 => green_p(3),
      I4 => green_p(2),
      I5 => green_p(4),
      O => \e[5]_i_2_n_0\
    );
\e[5]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44848C40"
    )
        port map (
      I0 => TERC4Character1(3),
      I1 => \e[7]_i_6__0_n_0\,
      I2 => TERC4Character1(2),
      I3 => TERC4Character1(0),
      I4 => TERC4Character1(1),
      I5 => \e[7]_i_5_n_0\,
      O => \e[5]_i_3__1_n_0\
    );
\e[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF15104045"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_4_n_0\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_6_n_0\,
      I4 => \e[6]_i_2__1_n_0\,
      I5 => \e[6]_i_3_n_0\,
      O => \e[6]_i_1_n_0\
    );
\e[6]_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(6),
      I1 => green_p(5),
      I2 => \e[4]_i_2__1_n_0\,
      O => \e[6]_i_2__1_n_0\
    );
\e[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEAAABAEABAFAEA"
    )
        port map (
      I0 => \e[6]_i_4__1_n_0\,
      I1 => TERC4Character1(0),
      I2 => \e[7]_i_6__0_n_0\,
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(3),
      I5 => TERC4Character1(2),
      O => \e[6]_i_3_n_0\
    );
\e[6]_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => isTERC4Region,
      I1 => blank,
      I2 => controlChannel1Green(0),
      O => \e[6]_i_4__1_n_0\
    );
\e[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => blank,
      I1 => guardBandEnable,
      O => e0_in(7)
    );
\e[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000A656"
    )
        port map (
      I0 => \e[7]_i_3__1_n_0\,
      I1 => \e[9]_i_6_n_0\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => blank,
      I5 => \e[7]_i_4__1_n_0\,
      O => \e[7]_i_2_n_0\
    );
\e[7]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => green_p(6),
      I1 => green_p(5),
      I2 => \e[4]_i_2__1_n_0\,
      I3 => green_p(7),
      I4 => \e[9]_i_4_n_0\,
      O => \e[7]_i_3__1_n_0\
    );
\e[7]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBAABFFBAAAAAAAA"
    )
        port map (
      I0 => \e[7]_i_5_n_0\,
      I1 => TERC4Character1(2),
      I2 => TERC4Character1(3),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(0),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[7]_i_4__1_n_0\
    );
\e[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => controlChannel1Green(0),
      I1 => isTERC4Region,
      I2 => blank,
      O => \e[7]_i_5_n_0\
    );
\e[7]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => blank,
      I1 => isTERC4Region,
      O => \e[7]_i_6__0_n_0\
    );
\e[8]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D100D100D100D1FF"
    )
        port map (
      I0 => controlChannel1Green(0),
      I1 => isTERC4Region,
      I2 => \e[8]_i_2__1_n_0\,
      I3 => blank,
      I4 => \e[9]_i_4_n_0\,
      I5 => \e[9]_i_3_n_0\,
      O => \e[8]_i_1__1_n_0\
    );
\e[8]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C2C"
    )
        port map (
      I0 => TERC4Character1(0),
      I1 => TERC4Character1(2),
      I2 => TERC4Character1(3),
      I3 => TERC4Character1(1),
      O => \e[8]_i_2__1_n_0\
    );
\e[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => guardBandEnable,
      I1 => blank,
      I2 => \e[9]_i_3_n_0\,
      I3 => \e[9]_i_4_n_0\,
      O => e0_in(9)
    );
\e[9]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8E8E800E8000000"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(3),
      I2 => green_p(1),
      I3 => green_p(4),
      I4 => green_p(6),
      I5 => green_p(5),
      O => \e[9]_i_10_n_0\
    );
\e[9]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE8FFE8E8E8"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(3),
      I2 => green_p(1),
      I3 => green_p(4),
      I4 => green_p(6),
      I5 => green_p(5),
      O => \e[9]_i_11_n_0\
    );
\e[9]_i_12__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(7),
      I2 => green_p(0),
      O => \e[9]_i_12__0_n_0\
    );
\e[9]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => green_p(3),
      I1 => green_p(0),
      I2 => green_p(1),
      O => \e[9]_i_13_n_0\
    );
\e[9]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DB24"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => green_p(5),
      I2 => green_p(6),
      I3 => \e[4]_i_2__1_n_0\,
      O => \e[9]_i_14_n_0\
    );
\e[9]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4BB4D22D"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(3),
      I2 => green_p(0),
      I3 => green_p(1),
      I4 => \e[9]_i_4_n_0\,
      O => \e[9]_i_15_n_0\
    );
\e[9]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69FFFF6969000069"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => \e[4]_i_2__1_n_0\,
      I2 => green_p(6),
      I3 => green_p(7),
      I4 => green_p(5),
      I5 => green_p(0),
      O => \e[9]_i_16_n_0\
    );
\e[9]_i_17\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \e[9]_i_4_n_0\,
      I1 => \e[4]_i_2__1_n_0\,
      I2 => green_p(6),
      O => \e[9]_i_17_n_0\
    );
\e[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAAABABB"
    )
        port map (
      I0 => \e[9]_i_5_n_0\,
      I1 => blank,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \e[9]_i_6_n_0\,
      O => \e[9]_i_2_n_0\
    );
\e[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \e[9]_i_7_n_0\,
      O => \e[9]_i_3_n_0\
    );
\e[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF8EFF8EFF00EF00"
    )
        port map (
      I0 => green_p(7),
      I1 => \e[9]_i_8_n_0\,
      I2 => \e[9]_i_9_n_0\,
      I3 => \e[9]_i_10_n_0\,
      I4 => green_p(0),
      I5 => \e[9]_i_11_n_0\,
      O => \e[9]_i_4_n_0\
    );
\e[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5500C300"
    )
        port map (
      I0 => \e[8]_i_2__1_n_0\,
      I1 => controlChannel1Green(0),
      I2 => controlChannel1Green(1),
      I3 => blank,
      I4 => isTERC4Region,
      O => \e[9]_i_5_n_0\
    );
\e[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"65AAAAAA556565AA"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_12__0_n_0\,
      I2 => \e[9]_i_13_n_0\,
      I3 => \e[9]_i_14_n_0\,
      I4 => \e[9]_i_15_n_0\,
      I5 => \e[9]_i_16_n_0\,
      O => \e[9]_i_6_n_0\
    );
\e[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FF9E799E79FFEF"
    )
        port map (
      I0 => \e[9]_i_17_n_0\,
      I1 => green_p(0),
      I2 => \e[7]_i_3__1_n_0\,
      I3 => \e[9]_i_13_n_0\,
      I4 => \e[9]_i_14_n_0\,
      I5 => \e[9]_i_15_n_0\,
      O => \e[9]_i_7_n_0\
    );
\e[9]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => green_p(4),
      I1 => green_p(6),
      I2 => green_p(5),
      O => \e[9]_i_8_n_0\
    );
\e[9]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(3),
      I2 => green_p(1),
      O => \e[9]_i_9_n_0\
    );
\e_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[0]_i_1_n_0\,
      Q => EncodedG(0),
      S => e0_in(7)
    );
\e_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[1]_i_1_n_0\,
      Q => EncodedG(1),
      S => e0_in(7)
    );
\e_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[2]_i_1_n_0\,
      Q => EncodedG(2),
      R => e0_in(7)
    );
\e_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[3]_i_1_n_0\,
      Q => EncodedG(3),
      R => e0_in(7)
    );
\e_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[4]_i_1_n_0\,
      Q => EncodedG(4),
      S => e0_in(7)
    );
\e_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[5]_i_1_n_0\,
      Q => EncodedG(5),
      S => e0_in(7)
    );
\e_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[6]_i_1_n_0\,
      Q => EncodedG(6),
      R => e0_in(7)
    );
\e_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[7]_i_2_n_0\,
      Q => EncodedG(7),
      R => e0_in(7)
    );
\e_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[8]_i_1__1_n_0\,
      Q => EncodedG(8),
      S => e0_in(9)
    );
\e_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[9]_i_2_n_0\,
      Q => EncodedG(9),
      R => e0_in(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_dvid_0_0_TDMS_encoder__parameterized3\ is
  port (
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    guardBandType : in STD_LOGIC;
    guardBandEnable : in STD_LOGIC;
    blank : in STD_LOGIC;
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    guardBandEnable_0 : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    isTERC4Region : in STD_LOGIC;
    clk_pixel_x1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_dvid_0_0_TDMS_encoder__parameterized3\ : entity is "TDMS_encoder";
end \design_1_dvid_0_0_TDMS_encoder__parameterized3\;

architecture STRUCTURE of \design_1_dvid_0_0_TDMS_encoder__parameterized3\ is
  signal \dc_bias[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_10__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_9_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9__1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[0]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[1]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[2]\ : STD_LOGIC;
  signal \e[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[0]_i_3_n_0\ : STD_LOGIC;
  signal \e[1]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[1]_i_3_n_0\ : STD_LOGIC;
  signal \e[1]_i_4_n_0\ : STD_LOGIC;
  signal \e[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[3]_i_3_n_0\ : STD_LOGIC;
  signal \e[3]_i_4_n_0\ : STD_LOGIC;
  signal \e[3]_i_5_n_0\ : STD_LOGIC;
  signal \e[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_2_n_0\ : STD_LOGIC;
  signal \e[4]_i_3_n_0\ : STD_LOGIC;
  signal \e[5]_i_10_n_0\ : STD_LOGIC;
  signal \e[5]_i_11_n_0\ : STD_LOGIC;
  signal \e[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[5]_i_3_n_0\ : STD_LOGIC;
  signal \e[5]_i_4_n_0\ : STD_LOGIC;
  signal \e[5]_i_5_n_0\ : STD_LOGIC;
  signal \e[5]_i_6_n_0\ : STD_LOGIC;
  signal \e[5]_i_7_n_0\ : STD_LOGIC;
  signal \e[5]_i_8_n_0\ : STD_LOGIC;
  signal \e[5]_i_9_n_0\ : STD_LOGIC;
  signal \e[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_3_n_0\ : STD_LOGIC;
  signal \e[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_5__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_6__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_7__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_10__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_11__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_12_n_0\ : STD_LOGIC;
  signal \e[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_2_n_0\ : STD_LOGIC;
  signal \e[9]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_5__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_7__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_8__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_9__0_n_0\ : STD_LOGIC;
  signal \e_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_1__1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_2__1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_3__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5__1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_10__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_4__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_5__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_8__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_9\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_10__1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_4__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_5__1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_9__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_10__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_11__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_17__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_18__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_4__1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_8__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_9__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \e[0]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \e[1]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \e[2]_i_3__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \e[3]_i_2__1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \e[3]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \e[4]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \e[5]_i_10\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \e[5]_i_11\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \e[5]_i_6\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \e[5]_i_7\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \e[5]_i_8\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \e[6]_i_3__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \e[6]_i_4__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \e[7]_i_4__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \e[8]_i_5__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \e[8]_i_6__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \e[9]_i_10__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \e[9]_i_11__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \e[9]_i_4__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \e[9]_i_5__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \e[9]_i_7__0\ : label is "soft_lutpair14";
begin
\dc_bias[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EB1414EB"
    )
        port map (
      I0 => \e[5]_i_2__1_n_0\,
      I1 => \e[5]_i_4_n_0\,
      I2 => \e[8]_i_3_n_0\,
      I3 => \dc_bias[0]_i_2__1_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[0]_i_1__1_n_0\
    );
\dc_bias[0]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \dc_bias[0]_i_3__1_n_0\,
      I1 => blue_p(0),
      I2 => \dc_bias[0]_i_4_n_0\,
      I3 => \dc_bias[0]_i_5__1_n_0\,
      I4 => \e[5]_i_3_n_0\,
      O => \dc_bias[0]_i_2__1_n_0\
    );
\dc_bias[0]_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(0),
      I2 => blue_p(1),
      O => \dc_bias[0]_i_3__1_n_0\
    );
\dc_bias[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => blue_p(7),
      I1 => \e[6]_i_3__1_n_0\,
      I2 => blue_p(5),
      I3 => blue_p(6),
      O => \dc_bias[0]_i_4_n_0\
    );
\dc_bias[0]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(6),
      O => \dc_bias[0]_i_5__1_n_0\
    );
\dc_bias[1]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => blue_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_10__0_n_0\
    );
\dc_bias[1]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"966996690000FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_8__1_n_0\,
      I1 => \dc_bias[3]_i_10__1_n_0\,
      I2 => \dc_bias[3]_i_11__1_n_0\,
      I3 => \dc_bias[3]_i_9__1_n_0\,
      I4 => \dc_bias[1]_i_4__0_n_0\,
      I5 => \e[5]_i_4_n_0\,
      O => \dc_bias[1]_i_2__1_n_0\
    );
\dc_bias[1]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF0F00F66666666"
    )
        port map (
      I0 => \dc_bias[1]_i_5__0_n_0\,
      I1 => \dc_bias[1]_i_6__1_n_0\,
      I2 => \dc_bias[1]_i_7__1_n_0\,
      I3 => \dc_bias[1]_i_8__0_n_0\,
      I4 => \e[5]_i_6_n_0\,
      I5 => \e[8]_i_3_n_0\,
      O => \dc_bias[1]_i_3__1_n_0\
    );
\dc_bias[1]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69C3C396"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[9]_i_8__0_n_0\,
      I3 => \e[8]_i_3_n_0\,
      I4 => \dc_bias[0]_i_2__1_n_0\,
      O => \dc_bias[1]_i_4__0_n_0\
    );
\dc_bias[1]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias[0]_i_2__1_n_0\,
      O => \dc_bias[1]_i_5__0_n_0\
    );
\dc_bias[1]_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669966969969669"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[5]_i_10_n_0\,
      I2 => \e[5]_i_6_n_0\,
      I3 => \e[5]_i_9_n_0\,
      I4 => \dc_bias[0]_i_3__1_n_0\,
      I5 => \dc_bias[1]_i_9_n_0\,
      O => \dc_bias[1]_i_6__1_n_0\
    );
\dc_bias[1]_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14D782BE82BE14D7"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => \dc_bias[0]_i_4_n_0\,
      I2 => \dc_bias[1]_i_10__0_n_0\,
      I3 => \dc_bias[0]_i_3__1_n_0\,
      I4 => \dc_bias[0]_i_5__1_n_0\,
      I5 => \e[5]_i_3_n_0\,
      O => \dc_bias[1]_i_7__1_n_0\
    );
\dc_bias[1]_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2BD4D42B"
    )
        port map (
      I0 => \e[7]_i_4__0_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => blue_p(0),
      I3 => \e[5]_i_10_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[1]_i_8__0_n_0\
    );
\dc_bias[1]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(7),
      I2 => blue_p(0),
      O => \dc_bias[1]_i_9_n_0\
    );
\dc_bias[2]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => blue_p(0),
      O => \dc_bias[2]_i_10__1_n_0\
    );
\dc_bias[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7117177117717117"
    )
        port map (
      I0 => blue_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[8]_i_3_n_0\,
      I3 => blue_p(7),
      I4 => \e[6]_i_3__1_n_0\,
      I5 => \dc_bias[0]_i_5__1_n_0\,
      O => \dc_bias[2]_i_11_n_0\
    );
\dc_bias[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0000FF69696969"
    )
        port map (
      I0 => \dc_bias[2]_i_4__1_n_0\,
      I1 => \dc_bias[3]_i_14__0_n_0\,
      I2 => \dc_bias[2]_i_5__1_n_0\,
      I3 => \dc_bias[2]_i_6__1_n_0\,
      I4 => \dc_bias[3]_i_12__0_n_0\,
      I5 => \e[5]_i_4_n_0\,
      O => \dc_bias[2]_i_2__0_n_0\
    );
\dc_bias[2]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"69AA6955695569AA"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \dc_bias[2]_i_7__1_n_0\,
      I2 => \dc_bias[2]_i_8__1_n_0\,
      I3 => \e[8]_i_3_n_0\,
      I4 => \dc_bias[2]_i_9__0_n_0\,
      I5 => \e[9]_i_9__0_n_0\,
      O => \dc_bias[2]_i_3__1_n_0\
    );
\dc_bias[2]_i_4__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F9999990"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_8__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \e[8]_i_3_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_4__1_n_0\
    );
\dc_bias[2]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \e[9]_i_8__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[2]_i_5__1_n_0\
    );
\dc_bias[2]_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D44242D442D4D442"
    )
        port map (
      I0 => \dc_bias[3]_i_8__1_n_0\,
      I1 => \dc_bias[3]_i_9__1_n_0\,
      I2 => \dc_bias[3]_i_10__1_n_0\,
      I3 => \dc_bias[2]_i_10__1_n_0\,
      I4 => \dc_bias[3]_i_17__1_n_0\,
      I5 => \dc_bias[3]_i_16__1_n_0\,
      O => \dc_bias[2]_i_6__1_n_0\
    );
\dc_bias[2]_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DD44D4D4D4DD44D"
    )
        port map (
      I0 => \dc_bias[2]_i_11_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[6]_i_3__1_n_0\,
      I3 => blue_p(6),
      I4 => blue_p(5),
      I5 => \e[8]_i_3_n_0\,
      O => \dc_bias[2]_i_7__1_n_0\
    );
\dc_bias[2]_i_8__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14417DD7"
    )
        port map (
      I0 => \dc_bias[1]_i_7__1_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[5]_i_10_n_0\,
      I3 => \dc_bias[2]_i_11_n_0\,
      I4 => \e[5]_i_6_n_0\,
      O => \dc_bias[2]_i_8__1_n_0\
    );
\dc_bias[2]_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => \dc_bias[1]_i_5__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[9]_i_8__0_n_0\,
      O => \dc_bias[2]_i_9__0_n_0\
    );
\dc_bias[3]_i_10__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1482"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => blue_p(1),
      I2 => blue_p(0),
      I3 => blue_p(2),
      O => \dc_bias[3]_i_10__1_n_0\
    );
\dc_bias[3]_i_11__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969696"
    )
        port map (
      I0 => \dc_bias[3]_i_16__1_n_0\,
      I1 => \dc_bias[3]_i_17__1_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => blue_p(0),
      O => \dc_bias[3]_i_11__1_n_0\
    );
\dc_bias[3]_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8818181177E7E7E"
    )
        port map (
      I0 => \dc_bias[3]_i_17__1_n_0\,
      I1 => \dc_bias[3]_i_16__1_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => blue_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_12__0_n_0\
    );
\dc_bias[3]_i_13__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA9A999A9999995"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias[3]_i_18__0_n_0\,
      I3 => \dc_bias_reg_n_0_[1]\,
      I4 => \dc_bias[3]_i_17__1_n_0\,
      I5 => \dc_bias[3]_i_16__1_n_0\,
      O => \dc_bias[3]_i_13__1_n_0\
    );
\dc_bias[3]_i_14__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"65A6A6656559A69A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \e[5]_i_8_n_0\,
      I2 => \e[5]_i_9_n_0\,
      I3 => \e[5]_i_6_n_0\,
      I4 => \e[5]_i_10_n_0\,
      I5 => \e[5]_i_7_n_0\,
      O => \dc_bias[3]_i_14__0_n_0\
    );
\dc_bias[3]_i_15__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(2),
      I2 => blue_p(3),
      I3 => blue_p(1),
      I4 => blue_p(0),
      I5 => blue_p(7),
      O => \dc_bias[3]_i_15__1_n_0\
    );
\dc_bias[3]_i_16__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D22D2DD24BB4B44B"
    )
        port map (
      I0 => blue_p(4),
      I1 => \e[8]_i_3_n_0\,
      I2 => \dc_bias[3]_i_19__1_n_0\,
      I3 => blue_p(3),
      I4 => blue_p(2),
      I5 => blue_p(5),
      O => \dc_bias[3]_i_16__1_n_0\
    );
\dc_bias[3]_i_17__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8EE8E88E"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => blue_p(7),
      I2 => \e[6]_i_3__1_n_0\,
      I3 => blue_p(5),
      I4 => blue_p(6),
      O => \dc_bias[3]_i_17__1_n_0\
    );
\dc_bias[3]_i_18__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => blue_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_18__0_n_0\
    );
\dc_bias[3]_i_19__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => blue_p(1),
      I1 => blue_p(0),
      O => \dc_bias[3]_i_19__1_n_0\
    );
\dc_bias[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B8BBB8BBB888"
    )
        port map (
      I0 => \dc_bias_reg[3]_i_2_n_0\,
      I1 => \e[5]_i_2__1_n_0\,
      I2 => \dc_bias[3]_i_3__1_n_0\,
      I3 => \e[5]_i_4_n_0\,
      I4 => \dc_bias[3]_i_4__1_n_0\,
      I5 => \dc_bias[3]_i_5__1_n_0\,
      O => \dc_bias[3]_i_1__0_n_0\
    );
\dc_bias[3]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D440FFFD2BBF0002"
    )
        port map (
      I0 => \dc_bias[3]_i_8__1_n_0\,
      I1 => \dc_bias[3]_i_9__1_n_0\,
      I2 => \dc_bias[3]_i_10__1_n_0\,
      I3 => \dc_bias[3]_i_11__1_n_0\,
      I4 => \dc_bias[3]_i_12__0_n_0\,
      I5 => \dc_bias[3]_i_13__1_n_0\,
      O => \dc_bias[3]_i_3__1_n_0\
    );
\dc_bias[3]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \e[9]_i_9__0_n_0\,
      O => \dc_bias[3]_i_4__1_n_0\
    );
\dc_bias[3]_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"455D5D5D5D5D5DDF"
    )
        port map (
      I0 => \dc_bias[3]_i_14__0_n_0\,
      I1 => \e[9]_i_8__0_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[0]_i_2__1_n_0\,
      I4 => \e[8]_i_3_n_0\,
      I5 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_5__1_n_0\
    );
\dc_bias[3]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A995A995A99595"
    )
        port map (
      I0 => \e[5]_i_4_n_0\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \e[9]_i_9__0_n_0\,
      I3 => \e[9]_i_8__0_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      I5 => \dc_bias[1]_i_5__0_n_0\,
      O => \dc_bias[3]_i_6__0_n_0\
    );
\dc_bias[3]_i_7__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E81"
    )
        port map (
      I0 => \dc_bias[2]_i_8__1_n_0\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias[2]_i_7__1_n_0\,
      I3 => p_1_in,
      O => \dc_bias[3]_i_7__1_n_0\
    );
\dc_bias[3]_i_8__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"06606006"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => blue_p(2),
      I2 => \dc_bias[3]_i_15__1_n_0\,
      I3 => blue_p(0),
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_8__1_n_0\
    );
\dc_bias[3]_i_9__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EB8282EB"
    )
        port map (
      I0 => blue_p(7),
      I1 => \e[3]_i_3_n_0\,
      I2 => blue_p(5),
      I3 => blue_p(0),
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_9__1_n_0\
    );
\dc_bias_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[0]_i_1__1_n_0\,
      Q => \dc_bias_reg_n_0_[0]\,
      R => blank
    );
\dc_bias_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[1]_i_1__1_n_0\,
      Q => \dc_bias_reg_n_0_[1]\,
      R => blank
    );
\dc_bias_reg[1]_i_1__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[1]_i_2__1_n_0\,
      I1 => \dc_bias[1]_i_3__1_n_0\,
      O => \dc_bias_reg[1]_i_1__1_n_0\,
      S => \e[5]_i_2__1_n_0\
    );
\dc_bias_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[2]_i_1__0_n_0\,
      Q => \dc_bias_reg_n_0_[2]\,
      R => blank
    );
\dc_bias_reg[2]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[2]_i_2__0_n_0\,
      I1 => \dc_bias[2]_i_3__1_n_0\,
      O => \dc_bias_reg[2]_i_1__0_n_0\,
      S => \e[5]_i_2__1_n_0\
    );
\dc_bias_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias[3]_i_1__0_n_0\,
      Q => p_1_in,
      R => blank
    );
\dc_bias_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[3]_i_6__0_n_0\,
      I1 => \dc_bias[3]_i_7__1_n_0\,
      O => \dc_bias_reg[3]_i_2_n_0\,
      S => \e[8]_i_3_n_0\
    );
\e[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEFEFEE"
    )
        port map (
      I0 => \e[0]_i_2__0_n_0\,
      I1 => \e[0]_i_3_n_0\,
      I2 => blank,
      I3 => \e[9]_i_3__1_n_0\,
      I4 => blue_p(0),
      O => \e[0]_i_1__1_n_0\
    );
\e[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0A6000000000000"
    )
        port map (
      I0 => TERC4Character0(0),
      I1 => TERC4Character0(2),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(1),
      I4 => guardBandEnable_0,
      I5 => blank,
      O => \e[0]_i_2__0_n_0\
    );
\e[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C4C0C400"
    )
        port map (
      I0 => isTERC4Region,
      I1 => blank,
      I2 => guardBandEnable,
      I3 => controlChannel0Blue(0),
      I4 => controlChannel0Blue(1),
      O => \e[0]_i_3_n_0\
    );
\e[1]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1EE14BB4"
    )
        port map (
      I0 => \e[5]_i_2__1_n_0\,
      I1 => \e[8]_i_3_n_0\,
      I2 => blue_p(1),
      I3 => blue_p(0),
      I4 => \e[5]_i_4_n_0\,
      O => \e[1]_i_2__1_n_0\
    );
\e[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FABABAEAEAEAAAEA"
    )
        port map (
      I0 => \e[1]_i_4_n_0\,
      I1 => TERC4Character0(0),
      I2 => guardBandEnable_0,
      I3 => TERC4Character0(3),
      I4 => TERC4Character0(1),
      I5 => TERC4Character0(2),
      O => \e[1]_i_3_n_0\
    );
\e[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BCC"
    )
        port map (
      I0 => controlChannel0Blue(1),
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel0Blue(0),
      O => \e[1]_i_4_n_0\
    );
\e[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B88BB88B8BB8"
    )
        port map (
      I0 => \e[2]_i_2__0_n_0\,
      I1 => blank,
      I2 => blue_p(1),
      I3 => blue_p(0),
      I4 => blue_p(2),
      I5 => \e[9]_i_3__1_n_0\,
      O => \e[2]_i_1__1_n_0\
    );
\e[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F6666000F0F0F"
    )
        port map (
      I0 => \e[2]_i_3__0_n_0\,
      I1 => \e[9]_i_7__0_n_0\,
      I2 => controlChannel0Blue(0),
      I3 => controlChannel0Blue(1),
      I4 => guardBandEnable,
      I5 => isTERC4Region,
      O => \e[2]_i_2__0_n_0\
    );
\e[2]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"03B3"
    )
        port map (
      I0 => TERC4Character0(3),
      I1 => TERC4Character0(0),
      I2 => TERC4Character0(1),
      I3 => TERC4Character0(2),
      O => \e[2]_i_3__0_n_0\
    );
\e[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8888BB8BB8B88"
    )
        port map (
      I0 => \e[3]_i_2__1_n_0\,
      I1 => blank,
      I2 => \e[5]_i_2__1_n_0\,
      I3 => \e[8]_i_3_n_0\,
      I4 => \e[3]_i_3_n_0\,
      I5 => \e[5]_i_4_n_0\,
      O => \e[3]_i_1__1_n_0\
    );
\e[3]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
        port map (
      I0 => guardBandEnable,
      I1 => controlChannel0Blue(1),
      I2 => controlChannel0Blue(0),
      I3 => \e[3]_i_4_n_0\,
      O => \e[3]_i_2__1_n_0\
    );
\e[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => blue_p(0),
      I1 => blue_p(1),
      I2 => blue_p(3),
      I3 => blue_p(2),
      O => \e[3]_i_3_n_0\
    );
\e[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF1070C090"
    )
        port map (
      I0 => TERC4Character0(0),
      I1 => TERC4Character0(2),
      I2 => guardBandEnable_0,
      I3 => TERC4Character0(1),
      I4 => TERC4Character0(3),
      I5 => \e[3]_i_5_n_0\,
      O => \e[3]_i_4_n_0\
    );
\e[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => controlChannel0Blue(0),
      I1 => isTERC4Region,
      I2 => guardBandEnable,
      O => \e[3]_i_5_n_0\
    );
\e[4]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E2D1"
    )
        port map (
      I0 => \e[9]_i_3__1_n_0\,
      I1 => blank,
      I2 => \e[4]_i_2_n_0\,
      I3 => \e[6]_i_3__1_n_0\,
      O => \e[4]_i_1__1_n_0\
    );
\e[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEBAAAAAFEAFAAAA"
    )
        port map (
      I0 => \e[4]_i_3_n_0\,
      I1 => TERC4Character0(2),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(0),
      I4 => guardBandEnable_0,
      I5 => TERC4Character0(1),
      O => \e[4]_i_2_n_0\
    );
\e[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01C1"
    )
        port map (
      I0 => isTERC4Region,
      I1 => guardBandEnable,
      I2 => controlChannel0Blue(0),
      I3 => controlChannel0Blue(1),
      O => \e[4]_i_3_n_0\
    );
\e[5]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18E7"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => blue_p(5),
      I2 => blue_p(6),
      I3 => \e[6]_i_3__1_n_0\,
      O => \e[5]_i_10_n_0\
    );
\e[5]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96B1"
    )
        port map (
      I0 => TERC4Character0(1),
      I1 => TERC4Character0(0),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(2),
      O => \e[5]_i_11_n_0\
    );
\e[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001E4B"
    )
        port map (
      I0 => \e[5]_i_2__1_n_0\,
      I1 => \e[8]_i_3_n_0\,
      I2 => \e[5]_i_3_n_0\,
      I3 => \e[5]_i_4_n_0\,
      I4 => blank,
      I5 => \e[5]_i_5_n_0\,
      O => \e[5]_i_1__0_n_0\
    );
\e[5]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF40"
    )
        port map (
      I0 => \e[9]_i_8__0_n_0\,
      I1 => \dc_bias[0]_i_2__1_n_0\,
      I2 => \e[9]_i_9__0_n_0\,
      I3 => \e[9]_i_10__0_n_0\,
      O => \e[5]_i_2__1_n_0\
    );
\e[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(0),
      I2 => blue_p(1),
      I3 => blue_p(3),
      I4 => blue_p(2),
      I5 => blue_p(4),
      O => \e[5]_i_3_n_0\
    );
\e[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A56AA9A6656AA66"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[5]_i_6_n_0\,
      I2 => \e[5]_i_7_n_0\,
      I3 => \e[5]_i_8_n_0\,
      I4 => \e[5]_i_9_n_0\,
      I5 => \e[5]_i_10_n_0\,
      O => \e[5]_i_4_n_0\
    );
\e[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"303050C0C0C050C0"
    )
        port map (
      I0 => \e[5]_i_11_n_0\,
      I1 => controlChannel0Blue(0),
      I2 => blank,
      I3 => isTERC4Region,
      I4 => guardBandEnable,
      I5 => controlChannel0Blue(1),
      O => \e[5]_i_5_n_0\
    );
\e[5]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D22D4BB4"
    )
        port map (
      I0 => blue_p(2),
      I1 => blue_p(3),
      I2 => blue_p(0),
      I3 => blue_p(1),
      I4 => \e[8]_i_3_n_0\,
      O => \e[5]_i_6_n_0\
    );
\e[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E718"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => blue_p(5),
      I2 => blue_p(6),
      I3 => \e[6]_i_3__1_n_0\,
      O => \e[5]_i_7_n_0\
    );
\e[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82282882"
    )
        port map (
      I0 => \dc_bias[0]_i_3__1_n_0\,
      I1 => blue_p(0),
      I2 => \dc_bias[0]_i_4_n_0\,
      I3 => \dc_bias[0]_i_5__1_n_0\,
      I4 => \e[5]_i_3_n_0\,
      O => \e[5]_i_8_n_0\
    );
\e[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"35C5535CC5355C53"
    )
        port map (
      I0 => blue_p(0),
      I1 => blue_p(6),
      I2 => blue_p(5),
      I3 => \e[6]_i_3__1_n_0\,
      I4 => blue_p(7),
      I5 => \e[8]_i_3_n_0\,
      O => \e[5]_i_9_n_0\
    );
\e[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B88B8BB88BB8B88B"
    )
        port map (
      I0 => \e[6]_i_2__0_n_0\,
      I1 => blank,
      I2 => \e[6]_i_3__1_n_0\,
      I3 => blue_p(5),
      I4 => blue_p(6),
      I5 => \e[9]_i_3__1_n_0\,
      O => \e[6]_i_1__1_n_0\
    );
\e[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEBEBBEAAAAAAAA"
    )
        port map (
      I0 => \e[6]_i_4__0_n_0\,
      I1 => TERC4Character0(3),
      I2 => TERC4Character0(2),
      I3 => TERC4Character0(1),
      I4 => TERC4Character0(0),
      I5 => guardBandEnable_0,
      O => \e[6]_i_2__0_n_0\
    );
\e[6]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => blue_p(4),
      I1 => blue_p(2),
      I2 => blue_p(3),
      I3 => blue_p(1),
      I4 => blue_p(0),
      O => \e[6]_i_3__1_n_0\
    );
\e[6]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FC05"
    )
        port map (
      I0 => isTERC4Region,
      I1 => controlChannel0Blue(1),
      I2 => controlChannel0Blue(0),
      I3 => guardBandEnable,
      O => \e[6]_i_4__0_n_0\
    );
\e[7]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFE0E0EF"
    )
        port map (
      I0 => \e[7]_i_2__1_n_0\,
      I1 => \e[7]_i_3__0_n_0\,
      I2 => blank,
      I3 => \e[7]_i_4__0_n_0\,
      I4 => \e[9]_i_3__1_n_0\,
      O => \e[7]_i_1__1_n_0\
    );
\e[7]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000400004404444"
    )
        port map (
      I0 => guardBandEnable,
      I1 => isTERC4Region,
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(1),
      I4 => TERC4Character0(2),
      I5 => TERC4Character0(0),
      O => \e[7]_i_2__1_n_0\
    );
\e[7]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F3FB0008030BF0F8"
    )
        port map (
      I0 => TERC4Character0(1),
      I1 => isTERC4Region,
      I2 => guardBandEnable,
      I3 => TERC4Character0(2),
      I4 => controlChannel0Blue(0),
      I5 => controlChannel0Blue(1),
      O => \e[7]_i_3__0_n_0\
    );
\e[7]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => blue_p(6),
      I1 => blue_p(5),
      I2 => \e[6]_i_3__1_n_0\,
      I3 => blue_p(7),
      I4 => \e[8]_i_3_n_0\,
      O => \e[7]_i_4__0_n_0\
    );
\e[8]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777777F7444444C4"
    )
        port map (
      I0 => \e[8]_i_2__0_n_0\,
      I1 => blank,
      I2 => isTERC4Region,
      I3 => guardBandEnable,
      I4 => \e[9]_i_5__0_n_0\,
      I5 => \e[8]_i_3_n_0\,
      O => \e[8]_i_1__0_n_0\
    );
\e[8]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0DDF0FFFFDDF0"
    )
        port map (
      I0 => TERC4Character0(2),
      I1 => TERC4Character0(3),
      I2 => controlChannel0Blue(0),
      I3 => isTERC4Region,
      I4 => guardBandEnable,
      I5 => controlChannel0Blue(1),
      O => \e[8]_i_2__0_n_0\
    );
\e[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55550445555D0445"
    )
        port map (
      I0 => \e[8]_i_4__0_n_0\,
      I1 => \e[8]_i_5__0_n_0\,
      I2 => blue_p(7),
      I3 => \e[8]_i_6__0_n_0\,
      I4 => \e[8]_i_7__0_n_0\,
      I5 => blue_p(0),
      O => \e[8]_i_3_n_0\
    );
\e[8]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8E8E800E8000000"
    )
        port map (
      I0 => blue_p(4),
      I1 => blue_p(6),
      I2 => blue_p(5),
      I3 => blue_p(1),
      I4 => blue_p(3),
      I5 => blue_p(2),
      O => \e[8]_i_4__0_n_0\
    );
\e[8]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(2),
      I1 => blue_p(3),
      I2 => blue_p(1),
      O => \e[8]_i_5__0_n_0\
    );
\e[8]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => blue_p(4),
      I1 => blue_p(6),
      I2 => blue_p(5),
      O => \e[8]_i_6__0_n_0\
    );
\e[8]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001700171717"
    )
        port map (
      I0 => blue_p(1),
      I1 => blue_p(3),
      I2 => blue_p(2),
      I3 => blue_p(4),
      I4 => blue_p(6),
      I5 => blue_p(5),
      O => \e[8]_i_7__0_n_0\
    );
\e[9]_i_10__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => p_1_in,
      O => \e[9]_i_10__0_n_0\
    );
\e[9]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(6),
      I1 => \e[8]_i_3_n_0\,
      I2 => \e[6]_i_3__1_n_0\,
      O => \e[9]_i_11__0_n_0\
    );
\e[9]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \e[6]_i_3__1_n_0\,
      I1 => blue_p(5),
      I2 => \e[8]_i_3_n_0\,
      O => \e[9]_i_12_n_0\
    );
\e[9]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => blank,
      O => \e[9]_i_1__1_n_0\
    );
\e[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCEEEEFCCCEEEE"
    )
        port map (
      I0 => \e[9]_i_3__1_n_0\,
      I1 => \e[9]_i_4__0_n_0\,
      I2 => \e[9]_i_5__0_n_0\,
      I3 => guardBandEnable_0,
      I4 => blank,
      I5 => \e[9]_i_7__0_n_0\,
      O => \e[9]_i_2_n_0\
    );
\e[9]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555510005555DFFF"
    )
        port map (
      I0 => \e[8]_i_3_n_0\,
      I1 => \e[9]_i_8__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \e[9]_i_9__0_n_0\,
      I4 => \e[9]_i_10__0_n_0\,
      I5 => \e[5]_i_4_n_0\,
      O => \e[9]_i_3__1_n_0\
    );
\e[9]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A200E300"
    )
        port map (
      I0 => guardBandEnable,
      I1 => controlChannel0Blue(1),
      I2 => controlChannel0Blue(0),
      I3 => blank,
      I4 => isTERC4Region,
      O => \e[9]_i_4__0_n_0\
    );
\e[9]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B9FF"
    )
        port map (
      I0 => TERC4Character0(0),
      I1 => TERC4Character0(1),
      I2 => TERC4Character0(2),
      I3 => TERC4Character0(3),
      O => \e[9]_i_5__0_n_0\
    );
\e[9]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => TERC4Character0(2),
      I1 => TERC4Character0(3),
      O => \e[9]_i_7__0_n_0\
    );
\e[9]_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"71188EE78EE77118"
    )
        port map (
      I0 => \dc_bias[0]_i_3__1_n_0\,
      I1 => blue_p(0),
      I2 => \e[7]_i_4__0_n_0\,
      I3 => \e[9]_i_11__0_n_0\,
      I4 => \e[5]_i_6_n_0\,
      I5 => \e[5]_i_10_n_0\,
      O => \e[9]_i_8__0_n_0\
    );
\e[9]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BFFFF74008B8BFF"
    )
        port map (
      I0 => \e[9]_i_12_n_0\,
      I1 => \dc_bias[0]_i_5__1_n_0\,
      I2 => \e[6]_i_3__1_n_0\,
      I3 => \e[5]_i_6_n_0\,
      I4 => \e[5]_i_9_n_0\,
      I5 => \e[5]_i_8_n_0\,
      O => \e[9]_i_9__0_n_0\
    );
\e_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[0]_i_1__1_n_0\,
      Q => EncodedB(0),
      R => \e[9]_i_1__1_n_0\
    );
\e_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[1]_i_1__0_n_0\,
      Q => EncodedB(1),
      R => \e[9]_i_1__1_n_0\
    );
\e_reg[1]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[1]_i_2__1_n_0\,
      I1 => \e[1]_i_3_n_0\,
      O => \e_reg[1]_i_1__0_n_0\,
      S => blank
    );
\e_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[2]_i_1__1_n_0\,
      Q => EncodedB(2),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[3]_i_1__1_n_0\,
      Q => EncodedB(3),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[4]_i_1__1_n_0\,
      Q => EncodedB(4),
      R => \e[9]_i_1__1_n_0\
    );
\e_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[5]_i_1__0_n_0\,
      Q => EncodedB(5),
      R => \e[9]_i_1__1_n_0\
    );
\e_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[6]_i_1__1_n_0\,
      Q => EncodedB(6),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[7]_i_1__1_n_0\,
      Q => EncodedB(7),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[8]_i_1__0_n_0\,
      Q => EncodedB(8),
      R => \e[9]_i_1__1_n_0\
    );
\e_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[9]_i_2_n_0\,
      Q => EncodedB(9),
      S => \e[9]_i_1__1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_dvid_0_0_dvid is
  port (
    EncodedR : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedG : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    red_s : out STD_LOGIC;
    green_s : out STD_LOGIC;
    blue_s : out STD_LOGIC;
    cl_s : out STD_LOGIC;
    controlChannel1Green : in STD_LOGIC_VECTOR ( 1 downto 0 );
    isTERC4Region : in STD_LOGIC;
    blank : in STD_LOGIC;
    green_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    red_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    guardBandType : in STD_LOGIC;
    guardBandEnable : in STD_LOGIC;
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_pixel_x1 : in STD_LOGIC;
    clk_x10 : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    scanout_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_dvid_0_0_dvid : entity is "dvid";
end design_1_dvid_0_0_dvid;

architecture STRUCTURE of design_1_dvid_0_0_dvid is
  signal \^encodedb\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^encodedg\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^encodedr\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal TDMS_encoder_red_n_0 : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal latched_blue : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal latched_green : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal latched_red : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal red_s_i_1_n_0 : STD_LOGIC;
  signal shift_blue : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \shift_blue_reg_n_0_[0]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[1]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[2]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[3]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[4]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[5]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[6]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[7]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[8]\ : STD_LOGIC;
  signal \shift_blue_reg_n_0_[9]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[0]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[1]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[2]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[3]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[4]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[5]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[6]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[7]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[8]\ : STD_LOGIC;
  signal \shift_clock_reg_n_0_[9]\ : STD_LOGIC;
  signal shift_green : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \shift_green_reg_n_0_[0]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[1]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[2]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[3]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[4]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[5]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[6]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[7]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[8]\ : STD_LOGIC;
  signal \shift_green_reg_n_0_[9]\ : STD_LOGIC;
  signal shift_red : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \shift_red[9]_i_2_n_0\ : STD_LOGIC;
  signal \shift_red[9]_i_3_n_0\ : STD_LOGIC;
  signal \shift_red_reg_n_0_[0]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \shift_blue[0]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \shift_blue[1]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \shift_blue[2]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \shift_blue[3]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \shift_blue[4]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \shift_blue[5]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \shift_blue[6]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \shift_blue[7]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \shift_blue[8]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \shift_blue[9]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \shift_green[0]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \shift_green[1]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \shift_green[2]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \shift_green[3]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \shift_green[4]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \shift_green[5]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \shift_green[6]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \shift_green[7]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \shift_green[8]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \shift_green[9]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \shift_red[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \shift_red[1]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \shift_red[2]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \shift_red[3]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \shift_red[4]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \shift_red[5]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \shift_red[6]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \shift_red[7]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \shift_red[8]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \shift_red[9]_i_1\ : label is "soft_lutpair73";
begin
  EncodedB(9 downto 0) <= \^encodedb\(9 downto 0);
  EncodedG(9 downto 0) <= \^encodedg\(9 downto 0);
  EncodedR(9 downto 0) <= \^encodedr\(9 downto 0);
TDMS_encoder_blue: entity work.\design_1_dvid_0_0_TDMS_encoder__parameterized3\
     port map (
      EncodedB(9 downto 0) => \^encodedb\(9 downto 0),
      TERC4Character0(3 downto 0) => TERC4Character0(3 downto 0),
      blank => blank,
      blue_p(7 downto 0) => blue_p(7 downto 0),
      clk_pixel_x1 => clk_pixel_x1,
      controlChannel0Blue(1 downto 0) => controlChannel0Blue(1 downto 0),
      guardBandEnable => guardBandEnable,
      guardBandEnable_0 => TDMS_encoder_red_n_0,
      guardBandType => guardBandType,
      isTERC4Region => isTERC4Region
    );
TDMS_encoder_green: entity work.\design_1_dvid_0_0_TDMS_encoder__parameterized1\
     port map (
      EncodedG(9 downto 0) => \^encodedg\(9 downto 0),
      TERC4Character1(3 downto 0) => TERC4Character1(3 downto 0),
      blank => blank,
      clk_pixel_x1 => clk_pixel_x1,
      controlChannel1Green(1 downto 0) => controlChannel1Green(1 downto 0),
      green_p(7 downto 0) => green_p(7 downto 0),
      guardBandEnable => guardBandEnable,
      isTERC4Region => isTERC4Region
    );
TDMS_encoder_red: entity work.design_1_dvid_0_0_TDMS_encoder
     port map (
      EncodedR(9 downto 0) => \^encodedr\(9 downto 0),
      TERC4Character2(3 downto 0) => TERC4Character2(3 downto 0),
      blank => blank,
      clk_pixel_x1 => clk_pixel_x1,
      controlChannel2Red(1 downto 0) => controlChannel2Red(1 downto 0),
      \e_reg[9]_0\ => TDMS_encoder_red_n_0,
      guardBandEnable => guardBandEnable,
      guardBandType => guardBandType,
      isTERC4Region => isTERC4Region,
      red_p(7 downto 0) => red_p(7 downto 0)
    );
blue_s_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_x10,
      CE => '1',
      D => \shift_blue_reg_n_0_[0]\,
      Q => blue_s,
      R => red_s_i_1_n_0
    );
cl_s_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[0]\,
      Q => cl_s,
      R => red_s_i_1_n_0
    );
green_s_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_x10,
      CE => '1',
      D => \shift_green_reg_n_0_[0]\,
      Q => green_s,
      R => red_s_i_1_n_0
    );
\latched_blue_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(0),
      Q => latched_blue(0),
      R => '0'
    );
\latched_blue_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(1),
      Q => latched_blue(1),
      R => '0'
    );
\latched_blue_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(2),
      Q => latched_blue(2),
      R => '0'
    );
\latched_blue_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(3),
      Q => latched_blue(3),
      R => '0'
    );
\latched_blue_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(4),
      Q => latched_blue(4),
      R => '0'
    );
\latched_blue_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(5),
      Q => latched_blue(5),
      R => '0'
    );
\latched_blue_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(6),
      Q => latched_blue(6),
      R => '0'
    );
\latched_blue_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(7),
      Q => latched_blue(7),
      R => '0'
    );
\latched_blue_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(8),
      Q => latched_blue(8),
      R => '0'
    );
\latched_blue_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedb\(9),
      Q => latched_blue(9),
      R => '0'
    );
\latched_green_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(0),
      Q => latched_green(0),
      R => '0'
    );
\latched_green_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(1),
      Q => latched_green(1),
      R => '0'
    );
\latched_green_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(2),
      Q => latched_green(2),
      R => '0'
    );
\latched_green_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(3),
      Q => latched_green(3),
      R => '0'
    );
\latched_green_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(4),
      Q => latched_green(4),
      R => '0'
    );
\latched_green_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(5),
      Q => latched_green(5),
      R => '0'
    );
\latched_green_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(6),
      Q => latched_green(6),
      R => '0'
    );
\latched_green_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(7),
      Q => latched_green(7),
      R => '0'
    );
\latched_green_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(8),
      Q => latched_green(8),
      R => '0'
    );
\latched_green_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedg\(9),
      Q => latched_green(9),
      R => '0'
    );
\latched_red_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(0),
      Q => latched_red(0),
      R => '0'
    );
\latched_red_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(1),
      Q => latched_red(1),
      R => '0'
    );
\latched_red_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(2),
      Q => latched_red(2),
      R => '0'
    );
\latched_red_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(3),
      Q => latched_red(3),
      R => '0'
    );
\latched_red_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(4),
      Q => latched_red(4),
      R => '0'
    );
\latched_red_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(5),
      Q => latched_red(5),
      R => '0'
    );
\latched_red_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(6),
      Q => latched_red(6),
      R => '0'
    );
\latched_red_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(7),
      Q => latched_red(7),
      R => '0'
    );
\latched_red_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(8),
      Q => latched_red(8),
      R => '0'
    );
\latched_red_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \^encodedr\(9),
      Q => latched_red(9),
      R => '0'
    );
red_s_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => scanout_en,
      O => red_s_i_1_n_0
    );
red_s_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_x10,
      CE => '1',
      D => \shift_red_reg_n_0_[0]\,
      Q => red_s,
      R => red_s_i_1_n_0
    );
\shift_blue[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[1]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(0),
      O => shift_blue(0)
    );
\shift_blue[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[2]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(1),
      O => shift_blue(1)
    );
\shift_blue[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[3]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(2),
      O => shift_blue(2)
    );
\shift_blue[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[4]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(3),
      O => shift_blue(3)
    );
\shift_blue[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[5]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(4),
      O => shift_blue(4)
    );
\shift_blue[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[6]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(5),
      O => shift_blue(5)
    );
\shift_blue[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[7]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(6),
      O => shift_blue(6)
    );
\shift_blue[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[8]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(7),
      O => shift_blue(7)
    );
\shift_blue[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_blue_reg_n_0_[9]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_blue(8),
      O => shift_blue(8)
    );
\shift_blue[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => latched_blue(9),
      I1 => \shift_red[9]_i_2_n_0\,
      O => shift_blue(9)
    );
\shift_blue_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(0),
      Q => \shift_blue_reg_n_0_[0]\,
      R => '0'
    );
\shift_blue_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(1),
      Q => \shift_blue_reg_n_0_[1]\,
      R => '0'
    );
\shift_blue_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(2),
      Q => \shift_blue_reg_n_0_[2]\,
      R => '0'
    );
\shift_blue_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(3),
      Q => \shift_blue_reg_n_0_[3]\,
      R => '0'
    );
\shift_blue_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(4),
      Q => \shift_blue_reg_n_0_[4]\,
      R => '0'
    );
\shift_blue_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(5),
      Q => \shift_blue_reg_n_0_[5]\,
      R => '0'
    );
\shift_blue_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(6),
      Q => \shift_blue_reg_n_0_[6]\,
      R => '0'
    );
\shift_blue_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(7),
      Q => \shift_blue_reg_n_0_[7]\,
      R => '0'
    );
\shift_blue_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(8),
      Q => \shift_blue_reg_n_0_[8]\,
      R => '0'
    );
\shift_blue_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_blue(9),
      Q => \shift_blue_reg_n_0_[9]\,
      R => '0'
    );
\shift_clock_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[1]\,
      Q => \shift_clock_reg_n_0_[0]\,
      R => '0'
    );
\shift_clock_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[2]\,
      Q => \shift_clock_reg_n_0_[1]\,
      R => '0'
    );
\shift_clock_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[3]\,
      Q => \shift_clock_reg_n_0_[2]\,
      R => '0'
    );
\shift_clock_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[4]\,
      Q => \shift_clock_reg_n_0_[3]\,
      R => '0'
    );
\shift_clock_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[5]\,
      Q => \shift_clock_reg_n_0_[4]\,
      R => '0'
    );
\shift_clock_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[6]\,
      Q => \shift_clock_reg_n_0_[5]\,
      R => '0'
    );
\shift_clock_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[7]\,
      Q => \shift_clock_reg_n_0_[6]\,
      R => '0'
    );
\shift_clock_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[8]\,
      Q => \shift_clock_reg_n_0_[7]\,
      R => '0'
    );
\shift_clock_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[9]\,
      Q => \shift_clock_reg_n_0_[8]\,
      R => '0'
    );
\shift_clock_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => \shift_clock_reg_n_0_[0]\,
      Q => \shift_clock_reg_n_0_[9]\,
      R => '0'
    );
\shift_green[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[1]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(0),
      O => shift_green(0)
    );
\shift_green[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[2]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(1),
      O => shift_green(1)
    );
\shift_green[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[3]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(2),
      O => shift_green(2)
    );
\shift_green[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[4]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(3),
      O => shift_green(3)
    );
\shift_green[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[5]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(4),
      O => shift_green(4)
    );
\shift_green[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[6]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(5),
      O => shift_green(5)
    );
\shift_green[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[7]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(6),
      O => shift_green(6)
    );
\shift_green[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[8]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(7),
      O => shift_green(7)
    );
\shift_green[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \shift_green_reg_n_0_[9]\,
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_green(8),
      O => shift_green(8)
    );
\shift_green[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => latched_green(9),
      I1 => \shift_red[9]_i_2_n_0\,
      O => shift_green(9)
    );
\shift_green_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(0),
      Q => \shift_green_reg_n_0_[0]\,
      R => '0'
    );
\shift_green_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(1),
      Q => \shift_green_reg_n_0_[1]\,
      R => '0'
    );
\shift_green_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(2),
      Q => \shift_green_reg_n_0_[2]\,
      R => '0'
    );
\shift_green_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(3),
      Q => \shift_green_reg_n_0_[3]\,
      R => '0'
    );
\shift_green_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(4),
      Q => \shift_green_reg_n_0_[4]\,
      R => '0'
    );
\shift_green_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(5),
      Q => \shift_green_reg_n_0_[5]\,
      R => '0'
    );
\shift_green_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(6),
      Q => \shift_green_reg_n_0_[6]\,
      R => '0'
    );
\shift_green_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(7),
      Q => \shift_green_reg_n_0_[7]\,
      R => '0'
    );
\shift_green_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(8),
      Q => \shift_green_reg_n_0_[8]\,
      R => '0'
    );
\shift_green_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_green(9),
      Q => \shift_green_reg_n_0_[9]\,
      R => '0'
    );
\shift_red[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(0),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(0),
      O => shift_red(0)
    );
\shift_red[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(1),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(1),
      O => shift_red(1)
    );
\shift_red[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(2),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(2),
      O => shift_red(2)
    );
\shift_red[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(3),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(3),
      O => shift_red(3)
    );
\shift_red[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(4),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(4),
      O => shift_red(4)
    );
\shift_red[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(5),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(5),
      O => shift_red(5)
    );
\shift_red[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(6),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(6),
      O => shift_red(6)
    );
\shift_red[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(7),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(7),
      O => shift_red(7)
    );
\shift_red[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data1(8),
      I1 => \shift_red[9]_i_2_n_0\,
      I2 => latched_red(8),
      O => shift_red(8)
    );
\shift_red[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => latched_red(9),
      I1 => \shift_red[9]_i_2_n_0\,
      O => shift_red(9)
    );
\shift_red[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFFFFF"
    )
        port map (
      I0 => \shift_red[9]_i_3_n_0\,
      I1 => \shift_clock_reg_n_0_[5]\,
      I2 => \shift_clock_reg_n_0_[4]\,
      I3 => \shift_clock_reg_n_0_[2]\,
      I4 => \shift_clock_reg_n_0_[3]\,
      O => \shift_red[9]_i_2_n_0\
    );
\shift_red[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => \shift_clock_reg_n_0_[8]\,
      I1 => \shift_clock_reg_n_0_[9]\,
      I2 => \shift_clock_reg_n_0_[6]\,
      I3 => \shift_clock_reg_n_0_[7]\,
      I4 => \shift_clock_reg_n_0_[1]\,
      I5 => \shift_clock_reg_n_0_[0]\,
      O => \shift_red[9]_i_3_n_0\
    );
\shift_red_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(0),
      Q => \shift_red_reg_n_0_[0]\,
      R => '0'
    );
\shift_red_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(1),
      Q => data1(0),
      R => '0'
    );
\shift_red_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(2),
      Q => data1(1),
      R => '0'
    );
\shift_red_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(3),
      Q => data1(2),
      R => '0'
    );
\shift_red_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(4),
      Q => data1(3),
      R => '0'
    );
\shift_red_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(5),
      Q => data1(4),
      R => '0'
    );
\shift_red_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(6),
      Q => data1(5),
      R => '0'
    );
\shift_red_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(7),
      Q => data1(6),
      R => '0'
    );
\shift_red_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(8),
      Q => data1(7),
      R => '0'
    );
\shift_red_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_x10,
      CE => '1',
      D => shift_red(9),
      Q => data1(8),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_dvid_0_0 is
  port (
    clk_x10 : in STD_LOGIC;
    clk_x10n : in STD_LOGIC;
    clk_pixel_x1 : in STD_LOGIC;
    scanout_en : in STD_LOGIC;
    red_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    green_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blank : in STD_LOGIC;
    hsync : in STD_LOGIC;
    vsync : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel1Green : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    guardBandEnable : in STD_LOGIC;
    guardBandType : in STD_LOGIC;
    isTERC4Region : in STD_LOGIC;
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    red_s : out STD_LOGIC;
    green_s : out STD_LOGIC;
    blue_s : out STD_LOGIC;
    cl_s : out STD_LOGIC;
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedG : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedR : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_dvid_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_dvid_0_0 : entity is "design_1_dvid_0_0,dvid,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_dvid_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_dvid_0_0 : entity is "dvid,Vivado 2018.1_AR73068";
end design_1_dvid_0_0;

architecture STRUCTURE of design_1_dvid_0_0 is
begin
U0: entity work.design_1_dvid_0_0_dvid
     port map (
      EncodedB(9 downto 0) => EncodedB(9 downto 0),
      EncodedG(9 downto 0) => EncodedG(9 downto 0),
      EncodedR(9 downto 0) => EncodedR(9 downto 0),
      TERC4Character0(3 downto 0) => TERC4Character0(3 downto 0),
      TERC4Character1(3 downto 0) => TERC4Character1(3 downto 0),
      TERC4Character2(3 downto 0) => TERC4Character2(3 downto 0),
      blank => blank,
      blue_p(7 downto 0) => blue_p(7 downto 0),
      blue_s => blue_s,
      cl_s => cl_s,
      clk_pixel_x1 => clk_pixel_x1,
      clk_x10 => clk_x10,
      controlChannel0Blue(1 downto 0) => controlChannel0Blue(1 downto 0),
      controlChannel1Green(1 downto 0) => controlChannel1Green(1 downto 0),
      controlChannel2Red(1 downto 0) => controlChannel2Red(1 downto 0),
      green_p(7 downto 0) => green_p(7 downto 0),
      green_s => green_s,
      guardBandEnable => guardBandEnable,
      guardBandType => guardBandType,
      isTERC4Region => isTERC4Region,
      red_p(7 downto 0) => red_p(7 downto 0),
      red_s => red_s,
      scanout_en => scanout_en
    );
end STRUCTURE;
