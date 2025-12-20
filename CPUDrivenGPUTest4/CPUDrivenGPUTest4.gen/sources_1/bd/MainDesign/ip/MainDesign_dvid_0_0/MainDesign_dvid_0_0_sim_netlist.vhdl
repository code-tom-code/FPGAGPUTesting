-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:49:00 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_dvid_0_0/MainDesign_dvid_0_0_sim_netlist.vhdl
-- Design      : MainDesign_dvid_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_dvid_0_0_TDMS_encoder is
  port (
    isTERC4Region_0 : out STD_LOGIC;
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
  attribute ORIG_REF_NAME of MainDesign_dvid_0_0_TDMS_encoder : entity is "TDMS_encoder";
end MainDesign_dvid_0_0_TDMS_encoder;

architecture STRUCTURE of MainDesign_dvid_0_0_TDMS_encoder is
  signal \dc_bias[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_12_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_13_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_20__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_21_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_22__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_23__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_24_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_25_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_26_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_27_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[0]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[1]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[2]\ : STD_LOGIC;
  signal \e[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[0]_i_2_n_0\ : STD_LOGIC;
  signal \e[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[1]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_2_n_0\ : STD_LOGIC;
  signal \e[2]_i_3_n_0\ : STD_LOGIC;
  signal \e[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[3]_i_3_n_0\ : STD_LOGIC;
  signal \e[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[5]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[5]_i_4_n_0\ : STD_LOGIC;
  signal \e[6]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_3_n_0\ : STD_LOGIC;
  signal \e[6]_i_4_n_0\ : STD_LOGIC;
  signal \e[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_5_n_0\ : STD_LOGIC;
  signal \e[8]_i_1_n_0\ : STD_LOGIC;
  signal \e[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_3_n_0\ : STD_LOGIC;
  signal \e[9]_i_10__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_11_n_0\ : STD_LOGIC;
  signal \e[9]_i_12__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_13__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_14__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_15_n_0\ : STD_LOGIC;
  signal \e[9]_i_16__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_17__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_18__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_19_n_0\ : STD_LOGIC;
  signal \e[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_5_n_0\ : STD_LOGIC;
  signal \e[9]_i_6__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_7__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_8__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_9_n_0\ : STD_LOGIC;
  signal \e_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \e_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \e_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \e_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \e_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \^isterc4region_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_6\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_5__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_6\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_10__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_11\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_13\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_7__1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_9__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_11__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_12__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_21\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_22__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_26\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_27\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \e[1]_i_4__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \e[4]_i_3__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \e[6]_i_4\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \e[7]_i_4__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \e[7]_i_5\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \e[8]_i_3\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \e[9]_i_10__1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \e[9]_i_11\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \e[9]_i_14__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \e[9]_i_15\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \e[9]_i_16__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \e[9]_i_17__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \e[9]_i_7__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \e[9]_i_8__0\ : label is "soft_lutpair38";
begin
  isTERC4Region_0 <= \^isterc4region_0\;
\dc_bias[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"690069FF69FF6900"
    )
        port map (
      I0 => \e[9]_i_2__0_n_0\,
      I1 => \dc_bias[0]_i_2_n_0\,
      I2 => \dc_bias[0]_i_3_n_0\,
      I3 => \e[9]_i_3__0_n_0\,
      I4 => \dc_bias[0]_i_4__0_n_0\,
      I5 => \dc_bias[0]_i_5__0_n_0\,
      O => \dc_bias[0]_i_1__0_n_0\
    );
\dc_bias[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \dc_bias[0]_i_6_n_0\,
      I1 => red_p(0),
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => red_p(7),
      O => \dc_bias[0]_i_2_n_0\
    );
\dc_bias[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => red_p(2),
      I1 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[0]_i_3_n_0\
    );
\dc_bias[0]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00006996FFFF6996"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(0),
      I2 => red_p(3),
      I3 => \e[9]_i_10__1_n_0\,
      I4 => \e[9]_i_4__0_n_0\,
      I5 => red_p(2),
      O => \dc_bias[0]_i_4__0_n_0\
    );
\dc_bias[0]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B77B4884"
    )
        port map (
      I0 => \dc_bias[0]_i_6_n_0\,
      I1 => \e[9]_i_4__0_n_0\,
      I2 => red_p(7),
      I3 => red_p(0),
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[0]_i_5__0_n_0\
    );
\dc_bias[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      I4 => red_p(3),
      O => \dc_bias[0]_i_6_n_0\
    );
\dc_bias[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \dc_bias[3]_i_11__0_n_0\,
      I1 => \dc_bias[3]_i_10__1_n_0\,
      I2 => \dc_bias[2]_i_4__0_n_0\,
      I3 => \dc_bias[3]_i_13__0_n_0\,
      I4 => \dc_bias[3]_i_12__0_n_0\,
      O => \dc_bias[1]_i_2__0_n_0\
    );
\dc_bias[1]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"690069FF69FF6900"
    )
        port map (
      I0 => \dc_bias[1]_i_4_n_0\,
      I1 => \dc_bias[1]_i_5__0_n_0\,
      I2 => \dc_bias[1]_i_6_n_0\,
      I3 => \e[9]_i_2__0_n_0\,
      I4 => \dc_bias[1]_i_7__1_n_0\,
      I5 => \dc_bias[1]_i_8_n_0\,
      O => \dc_bias[1]_i_3__0_n_0\
    );
\dc_bias[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009099009909009"
    )
        port map (
      I0 => \dc_bias[2]_i_9__0_n_0\,
      I1 => \dc_bias[2]_i_10__1_n_0\,
      I2 => red_p(7),
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => red_p(0),
      I5 => \dc_bias[0]_i_6_n_0\,
      O => \dc_bias[1]_i_4_n_0\
    );
\dc_bias[1]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0690F96F"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(1),
      I2 => \e[9]_i_4__0_n_0\,
      I3 => red_p(2),
      I4 => \dc_bias[3]_i_22__0_n_0\,
      O => \dc_bias[1]_i_5__0_n_0\
    );
\dc_bias[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B22B"
    )
        port map (
      I0 => red_p(7),
      I1 => \dc_bias[0]_i_6_n_0\,
      I2 => red_p(0),
      I3 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_6_n_0\
    );
\dc_bias[1]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_13__0_n_0\,
      O => \dc_bias[1]_i_7__1_n_0\
    );
\dc_bias[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7DD7D77DEBBEBEEB"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => \e[9]_i_10__1_n_0\,
      I2 => red_p(3),
      I3 => red_p(0),
      I4 => red_p(1),
      I5 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_8_n_0\
    );
\dc_bias[2]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(2),
      I1 => red_p(0),
      I2 => red_p(1),
      O => \dc_bias[2]_i_10__1_n_0\
    );
\dc_bias[2]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_11_n_0\
    );
\dc_bias[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"788787781EE1E11E"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => red_p(5),
      I2 => red_p(3),
      I3 => red_p(2),
      I4 => \e[9]_i_14__0_n_0\,
      I5 => red_p(4),
      O => \dc_bias[2]_i_12_n_0\
    );
\dc_bias[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8EE8E88E"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => red_p(7),
      I2 => \e[4]_i_3__0_n_0\,
      I3 => red_p(5),
      I4 => red_p(6),
      O => \dc_bias[2]_i_13_n_0\
    );
\dc_bias[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18718E18E78E71E7"
    )
        port map (
      I0 => \dc_bias[3]_i_13__0_n_0\,
      I1 => \dc_bias[3]_i_12__0_n_0\,
      I2 => \dc_bias[3]_i_10__1_n_0\,
      I3 => \dc_bias[2]_i_4__0_n_0\,
      I4 => \dc_bias[3]_i_11__0_n_0\,
      I5 => \dc_bias[3]_i_5__0_n_0\,
      O => \dc_bias[2]_i_2__0_n_0\
    );
\dc_bias[2]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69FF6900"
    )
        port map (
      I0 => \dc_bias[2]_i_5_n_0\,
      I1 => \dc_bias[2]_i_6__0_n_0\,
      I2 => \dc_bias[2]_i_7__1_n_0\,
      I3 => \e[9]_i_2__0_n_0\,
      I4 => \dc_bias[2]_i_8_n_0\,
      O => \dc_bias[2]_i_3__0_n_0\
    );
\dc_bias[2]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95A595559AAA9A5A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => red_p(0),
      I2 => \e[9]_i_4__0_n_0\,
      I3 => red_p(7),
      I4 => \e[7]_i_4__0_n_0\,
      I5 => \e[9]_i_13__0_n_0\,
      O => \dc_bias[2]_i_4__0_n_0\
    );
\dc_bias[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"767777F780E8E8FE"
    )
        port map (
      I0 => \dc_bias[2]_i_9__0_n_0\,
      I1 => \dc_bias[2]_i_10__1_n_0\,
      I2 => red_p(7),
      I3 => \dc_bias[2]_i_11_n_0\,
      I4 => \dc_bias[0]_i_6_n_0\,
      I5 => \dc_bias[3]_i_22__0_n_0\,
      O => \dc_bias[2]_i_5_n_0\
    );
\dc_bias[2]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BBDBDBDD4424242"
    )
        port map (
      I0 => \dc_bias[2]_i_12_n_0\,
      I1 => \dc_bias[2]_i_13_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => red_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_6__0_n_0\
    );
\dc_bias[2]_i_7__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0690FFFF"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(1),
      I2 => \e[9]_i_4__0_n_0\,
      I3 => red_p(2),
      I4 => \dc_bias[3]_i_22__0_n_0\,
      O => \dc_bias[2]_i_7__1_n_0\
    );
\dc_bias[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A69A9A9A9A9A9A59"
    )
        port map (
      I0 => \dc_bias[3]_i_17__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \e[9]_i_13__0_n_0\,
      I3 => \e[9]_i_4__0_n_0\,
      I4 => \dc_bias[3]_i_24_n_0\,
      I5 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_8_n_0\
    );
\dc_bias[2]_i_9__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(1),
      I2 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[2]_i_9__0_n_0\
    );
\dc_bias[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8B888888B8BBB"
    )
        port map (
      I0 => \dc_bias_reg[3]_i_2_n_0\,
      I1 => \e[9]_i_3__0_n_0\,
      I2 => \dc_bias[3]_i_3__0_n_0\,
      I3 => \dc_bias[3]_i_4__0_n_0\,
      I4 => \dc_bias[3]_i_5__0_n_0\,
      I5 => \dc_bias[3]_i_6__0_n_0\,
      O => \dc_bias[3]_i_1_n_0\
    );
\dc_bias[3]_i_10__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C33C699600000000"
    )
        port map (
      I0 => red_p(4),
      I1 => \e[9]_i_14__0_n_0\,
      I2 => red_p(2),
      I3 => red_p(3),
      I4 => red_p(5),
      I5 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[3]_i_10__1_n_0\
    );
\dc_bias[3]_i_11__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => red_p(2),
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[3]_i_11__0_n_0\
    );
\dc_bias[3]_i_12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00909FFF"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(7),
      I2 => \e[9]_i_4__0_n_0\,
      I3 => \dc_bias[0]_i_6_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_12__0_n_0\
    );
\dc_bias[3]_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F55FF3F35FF5F3F3"
    )
        port map (
      I0 => red_p(2),
      I1 => \dc_bias[3]_i_24_n_0\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => \dc_bias[3]_i_25_n_0\,
      I4 => \e[9]_i_4__0_n_0\,
      I5 => \dc_bias[0]_i_6_n_0\,
      O => \dc_bias[3]_i_13__0_n_0\
    );
\dc_bias[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"808C8C808C80808C"
    )
        port map (
      I0 => red_p(0),
      I1 => \e[9]_i_4__0_n_0\,
      I2 => red_p(7),
      I3 => \e[4]_i_3__0_n_0\,
      I4 => red_p(5),
      I5 => red_p(6),
      O => \dc_bias[3]_i_14_n_0\
    );
\dc_bias[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAAAAA99A9A9AA"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_4__0_n_0\,
      I2 => \dc_bias[3]_i_23__0_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_8__0_n_0\,
      I5 => \e[9]_i_7__0_n_0\,
      O => \dc_bias[3]_i_15_n_0\
    );
\dc_bias[3]_i_16__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"656666A655656566"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias[3]_i_23__0_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_8__0_n_0\,
      I5 => \e[9]_i_7__0_n_0\,
      O => \dc_bias[3]_i_16__0_n_0\
    );
\dc_bias[3]_i_17__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AA6599A599A599A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[2]\,
      I1 => \e[9]_i_7__0_n_0\,
      I2 => \e[9]_i_8__0_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_10__1_n_0\,
      I5 => \e[9]_i_11_n_0\,
      O => \dc_bias[3]_i_17__0_n_0\
    );
\dc_bias[3]_i_18__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000014414114"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(3),
      I4 => \e[9]_i_10__1_n_0\,
      I5 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[3]_i_18__1_n_0\
    );
\dc_bias[3]_i_19__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8228288200000000"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(3),
      I4 => \e[9]_i_10__1_n_0\,
      I5 => \e[9]_i_4__0_n_0\,
      O => \dc_bias[3]_i_19__0_n_0\
    );
\dc_bias[3]_i_20__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556556A56AA6A"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias[3]_i_26_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[2]_i_12_n_0\,
      I4 => \dc_bias[2]_i_13_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_20__0_n_0\
    );
\dc_bias[3]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4224"
    )
        port map (
      I0 => red_p(2),
      I1 => \e[9]_i_4__0_n_0\,
      I2 => red_p(1),
      I3 => red_p(0),
      O => \dc_bias[3]_i_21_n_0\
    );
\dc_bias[3]_i_22__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999666"
    )
        port map (
      I0 => \dc_bias[2]_i_12_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => red_p(0),
      I4 => \dc_bias[2]_i_13_n_0\,
      O => \dc_bias[3]_i_22__0_n_0\
    );
\dc_bias[3]_i_23__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699600000000"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(6),
      I2 => red_p(0),
      I3 => \dc_bias[3]_i_27_n_0\,
      I4 => \e[5]_i_3__1_n_0\,
      I5 => \e[9]_i_11_n_0\,
      O => \dc_bias[3]_i_23__0_n_0\
    );
\dc_bias[3]_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(6),
      I2 => \e[9]_i_11_n_0\,
      I3 => red_p(0),
      I4 => \dc_bias[3]_i_27_n_0\,
      I5 => \e[5]_i_3__1_n_0\,
      O => \dc_bias[3]_i_24_n_0\
    );
\dc_bias[3]_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => red_p(0),
      I1 => red_p(7),
      O => \dc_bias[3]_i_25_n_0\
    );
\dc_bias[3]_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => red_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_26_n_0\
    );
\dc_bias[3]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => red_p(7),
      I1 => \e[4]_i_3__0_n_0\,
      I2 => red_p(5),
      I3 => red_p(6),
      O => \dc_bias[3]_i_27_n_0\
    );
\dc_bias[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000096699669FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_9_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_10__1_n_0\,
      I3 => \dc_bias[3]_i_11__0_n_0\,
      I4 => \dc_bias[3]_i_12__0_n_0\,
      I5 => \dc_bias[3]_i_13__0_n_0\,
      O => \dc_bias[3]_i_3__0_n_0\
    );
\dc_bias[3]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFEFFAB00A8AA02"
    )
        port map (
      I0 => \dc_bias[3]_i_10__1_n_0\,
      I1 => \e[9]_i_13__0_n_0\,
      I2 => \e[9]_i_4__0_n_0\,
      I3 => \dc_bias[3]_i_14_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      I5 => \dc_bias[3]_i_11__0_n_0\,
      O => \dc_bias[3]_i_4__0_n_0\
    );
\dc_bias[3]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C095C0993F6A3F66"
    )
        port map (
      I0 => \e[9]_i_12__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_14_n_0\,
      I3 => \e[9]_i_4__0_n_0\,
      I4 => \e[9]_i_13__0_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_5__0_n_0\
    );
\dc_bias[3]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56AA56AA555656AA"
    )
        port map (
      I0 => \dc_bias[3]_i_15_n_0\,
      I1 => \e[9]_i_12__0_n_0\,
      I2 => \e[9]_i_4__0_n_0\,
      I3 => \dc_bias_reg_n_0_[2]\,
      I4 => \dc_bias_reg_n_0_[1]\,
      I5 => \dc_bias[3]_i_9_n_0\,
      O => \dc_bias[3]_i_6__0_n_0\
    );
\dc_bias[3]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666AA6656556656"
    )
        port map (
      I0 => \dc_bias[3]_i_16__0_n_0\,
      I1 => \dc_bias[3]_i_17__0_n_0\,
      I2 => \dc_bias[3]_i_18__1_n_0\,
      I3 => \dc_bias_reg_n_0_[1]\,
      I4 => \e[9]_i_13__0_n_0\,
      I5 => \dc_bias[3]_i_19__0_n_0\,
      O => \dc_bias[3]_i_7__0_n_0\
    );
\dc_bias[3]_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56555555AA6A6A56"
    )
        port map (
      I0 => \dc_bias[3]_i_20__0_n_0\,
      I1 => \dc_bias[1]_i_6_n_0\,
      I2 => \dc_bias[3]_i_21_n_0\,
      I3 => \dc_bias[3]_i_22__0_n_0\,
      I4 => \dc_bias[1]_i_4_n_0\,
      I5 => \dc_bias[2]_i_6__0_n_0\,
      O => \dc_bias[3]_i_8__0_n_0\
    );
\dc_bias[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF6996"
    )
        port map (
      I0 => \dc_bias[3]_i_23__0_n_0\,
      I1 => \e[9]_i_9_n_0\,
      I2 => \e[9]_i_8__0_n_0\,
      I3 => \e[9]_i_7__0_n_0\,
      I4 => \e[9]_i_4__0_n_0\,
      I5 => \dc_bias[3]_i_14_n_0\,
      O => \dc_bias[3]_i_9_n_0\
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
      S => \e[9]_i_3__0_n_0\
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
      I1 => \dc_bias[2]_i_3__0_n_0\,
      O => \dc_bias_reg[2]_i_1__0_n_0\,
      S => \e[9]_i_3__0_n_0\
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
\dc_bias_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[3]_i_7__0_n_0\,
      I1 => \dc_bias[3]_i_8__0_n_0\,
      O => \dc_bias_reg[3]_i_2_n_0\,
      S => \e[9]_i_2__0_n_0\
    );
\e[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B88B8B8BB88B"
    )
        port map (
      I0 => \e[0]_i_2_n_0\,
      I1 => blank,
      I2 => red_p(0),
      I3 => \e[9]_i_4__0_n_0\,
      I4 => \e[9]_i_3__0_n_0\,
      I5 => \e[9]_i_2__0_n_0\,
      O => \e[0]_i_1__0_n_0\
    );
\e[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF8800D200"
    )
        port map (
      I0 => TERC4Character2(2),
      I1 => TERC4Character2(3),
      I2 => TERC4Character2(0),
      I3 => \^isterc4region_0\,
      I4 => TERC4Character2(1),
      I5 => \e[1]_i_4__0_n_0\,
      O => \e[0]_i_2_n_0\
    );
\e[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"609F9F60"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => \e[9]_i_2__0_n_0\,
      I2 => \e[9]_i_3__0_n_0\,
      I3 => red_p(1),
      I4 => red_p(0),
      O => \e[1]_i_2__0_n_0\
    );
\e[1]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC8404888"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => \^isterc4region_0\,
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(3),
      I5 => \e[1]_i_4__0_n_0\,
      O => \e[1]_i_3__0_n_0\
    );
\e[1]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8B88"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel2Red(0),
      O => \e[1]_i_4__0_n_0\
    );
\e[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696966969699669"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(0),
      I2 => red_p(2),
      I3 => \e[9]_i_4__0_n_0\,
      I4 => \e[9]_i_3__0_n_0\,
      I5 => \e[9]_i_2__0_n_0\,
      O => \e[2]_i_2_n_0\
    );
\e[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF5300B900"
    )
        port map (
      I0 => TERC4Character2(2),
      I1 => TERC4Character2(0),
      I2 => TERC4Character2(1),
      I3 => \^isterc4region_0\,
      I4 => TERC4Character2(3),
      I5 => \e[6]_i_4_n_0\,
      O => \e[2]_i_3_n_0\
    );
\e[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F60609F609F9F60"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => \e[9]_i_2__0_n_0\,
      I2 => \e[9]_i_3__0_n_0\,
      I3 => red_p(3),
      I4 => red_p(2),
      I5 => \e[9]_i_14__0_n_0\,
      O => \e[3]_i_2__0_n_0\
    );
\e[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF56002B00"
    )
        port map (
      I0 => TERC4Character2(3),
      I1 => TERC4Character2(0),
      I2 => TERC4Character2(1),
      I3 => \^isterc4region_0\,
      I4 => TERC4Character2(2),
      I5 => \e[7]_i_5_n_0\,
      O => \e[3]_i_3_n_0\
    );
\e[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABFB0151FEAE5404"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_4__0_n_0\,
      I2 => \e[9]_i_3__0_n_0\,
      I3 => \e[9]_i_2__0_n_0\,
      I4 => \e[4]_i_2__1_n_0\,
      I5 => \e[4]_i_3__0_n_0\,
      O => \e[4]_i_1__0_n_0\
    );
\e[4]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"72190000FFFFFFFF"
    )
        port map (
      I0 => TERC4Character2(3),
      I1 => TERC4Character2(1),
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(0),
      I4 => \^isterc4region_0\,
      I5 => \e[8]_i_3_n_0\,
      O => \e[4]_i_2__1_n_0\
    );
\e[4]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => red_p(4),
      I1 => red_p(1),
      I2 => red_p(0),
      I3 => red_p(2),
      I4 => red_p(3),
      O => \e[4]_i_3__0_n_0\
    );
\e[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA888AA88AA8AA88"
    )
        port map (
      I0 => \e[5]_i_2__1_n_0\,
      I1 => blank,
      I2 => \e[9]_i_3__0_n_0\,
      I3 => \e[5]_i_3__1_n_0\,
      I4 => \e[9]_i_2__0_n_0\,
      I5 => \e[9]_i_4__0_n_0\,
      O => \e[5]_i_1__0_n_0\
    );
\e[5]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBBBFBFFFBBBFBBB"
    )
        port map (
      I0 => \e[5]_i_4_n_0\,
      I1 => blank,
      I2 => guardBandType,
      I3 => guardBandEnable,
      I4 => isTERC4Region,
      I5 => controlChannel2Red(0),
      O => \e[5]_i_2__1_n_0\
    );
\e[5]_i_3__1\: unisim.vcomponents.LUT6
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
      O => \e[5]_i_3__1_n_0\
    );
\e[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404400040440440"
    )
        port map (
      I0 => guardBandEnable,
      I1 => isTERC4Region,
      I2 => TERC4Character2(1),
      I3 => TERC4Character2(2),
      I4 => TERC4Character2(0),
      I5 => TERC4Character2(3),
      O => \e[5]_i_4_n_0\
    );
\e[6]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969699696966996"
    )
        port map (
      I0 => \e[4]_i_3__0_n_0\,
      I1 => red_p(5),
      I2 => red_p(6),
      I3 => \e[9]_i_4__0_n_0\,
      I4 => \e[9]_i_3__0_n_0\,
      I5 => \e[9]_i_2__0_n_0\,
      O => \e[6]_i_2__1_n_0\
    );
\e[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEAAABAEABAFAEA"
    )
        port map (
      I0 => \e[6]_i_4_n_0\,
      I1 => TERC4Character2(0),
      I2 => \^isterc4region_0\,
      I3 => TERC4Character2(1),
      I4 => TERC4Character2(3),
      I5 => TERC4Character2(2),
      O => \e[6]_i_3_n_0\
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
\e[7]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"609F9F60"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => \e[9]_i_2__0_n_0\,
      I2 => \e[9]_i_3__0_n_0\,
      I3 => red_p(7),
      I4 => \e[7]_i_4__0_n_0\,
      O => \e[7]_i_2__0_n_0\
    );
\e[7]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F9F4F0F0FFF5F0F0"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => TERC4Character2(3),
      I2 => \e[7]_i_5_n_0\,
      I3 => TERC4Character2(1),
      I4 => \^isterc4region_0\,
      I5 => TERC4Character2(2),
      O => \e[7]_i_3__0_n_0\
    );
\e[7]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => red_p(6),
      I1 => red_p(5),
      I2 => \e[4]_i_3__0_n_0\,
      O => \e[7]_i_4__0_n_0\
    );
\e[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4744"
    )
        port map (
      I0 => guardBandType,
      I1 => guardBandEnable,
      I2 => isTERC4Region,
      I3 => controlChannel2Red(0),
      O => \e[7]_i_5_n_0\
    );
\e[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => isTERC4Region,
      I1 => guardBandEnable,
      O => \^isterc4region_0\
    );
\e[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222222E2EEEEEEEE"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => blank,
      I2 => isTERC4Region,
      I3 => guardBandEnable,
      I4 => \e[8]_i_2__0_n_0\,
      I5 => \e[8]_i_3_n_0\,
      O => \e[8]_i_1_n_0\
    );
\e[8]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B09F"
    )
        port map (
      I0 => TERC4Character2(0),
      I1 => TERC4Character2(1),
      I2 => TERC4Character2(3),
      I3 => TERC4Character2(2),
      O => \e[8]_i_2__0_n_0\
    );
\e[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FEE"
    )
        port map (
      I0 => isTERC4Region,
      I1 => controlChannel2Red(0),
      I2 => guardBandType,
      I3 => guardBandEnable,
      O => \e[8]_i_3_n_0\
    );
\e[9]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(5),
      I1 => red_p(7),
      I2 => red_p(0),
      O => \e[9]_i_10__1_n_0\
    );
\e[9]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(3),
      I1 => red_p(0),
      I2 => red_p(1),
      O => \e[9]_i_11_n_0\
    );
\e[9]_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"60FFFF9F006060FF"
    )
        port map (
      I0 => red_p(3),
      I1 => \e[9]_i_14__0_n_0\,
      I2 => \e[9]_i_10__1_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_8__0_n_0\,
      I5 => \e[9]_i_7__0_n_0\,
      O => \e[9]_i_12__0_n_0\
    );
\e[9]_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F60609F609F9F60"
    )
        port map (
      I0 => red_p(3),
      I1 => \e[9]_i_14__0_n_0\,
      I2 => \e[9]_i_10__1_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_8__0_n_0\,
      I5 => \e[9]_i_7__0_n_0\,
      O => \e[9]_i_13__0_n_0\
    );
\e[9]_i_14__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(0),
      O => \e[9]_i_14__0_n_0\
    );
\e[9]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => p_1_in,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias_reg_n_0_[1]\,
      O => \e[9]_i_15_n_0\
    );
\e[9]_i_16__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(4),
      I1 => red_p(6),
      I2 => red_p(5),
      O => \e[9]_i_16__0_n_0\
    );
\e[9]_i_17__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      O => \e[9]_i_17__0_n_0\
    );
\e[9]_i_18__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"171717FF17FFFFFF"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      I3 => red_p(5),
      I4 => red_p(6),
      I5 => red_p(4),
      O => \e[9]_i_18__0_n_0\
    );
\e[9]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001700171717"
    )
        port map (
      I0 => red_p(1),
      I1 => red_p(3),
      I2 => red_p(2),
      I3 => red_p(5),
      I4 => red_p(6),
      I5 => red_p(4),
      O => \e[9]_i_19_n_0\
    );
\e[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0047"
    )
        port map (
      I0 => \e[9]_i_2__0_n_0\,
      I1 => \e[9]_i_3__0_n_0\,
      I2 => \e[9]_i_4__0_n_0\,
      I3 => blank,
      I4 => \e[9]_i_5_n_0\,
      I5 => \e[9]_i_6__0_n_0\,
      O => \e[9]_i_1__0_n_0\
    );
\e[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAA599A599A599A"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_7__0_n_0\,
      I2 => \e[9]_i_8__0_n_0\,
      I3 => \e[9]_i_9_n_0\,
      I4 => \e[9]_i_10__1_n_0\,
      I5 => \e[9]_i_11_n_0\,
      O => \e[9]_i_2__0_n_0\
    );
\e[9]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FDDFDFFD"
    )
        port map (
      I0 => \e[9]_i_12__0_n_0\,
      I1 => \e[9]_i_13__0_n_0\,
      I2 => \e[9]_i_10__1_n_0\,
      I3 => red_p(3),
      I4 => \e[9]_i_14__0_n_0\,
      I5 => \e[9]_i_15_n_0\,
      O => \e[9]_i_3__0_n_0\
    );
\e[9]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF001700FF011700"
    )
        port map (
      I0 => red_p(7),
      I1 => \e[9]_i_16__0_n_0\,
      I2 => \e[9]_i_17__0_n_0\,
      I3 => \e[9]_i_18__0_n_0\,
      I4 => \e[9]_i_19_n_0\,
      I5 => red_p(0),
      O => \e[9]_i_4__0_n_0\
    );
\e[9]_i_5\: unisim.vcomponents.LUT6
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
      O => \e[9]_i_5_n_0\
    );
\e[9]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808800800088808"
    )
        port map (
      I0 => blank,
      I1 => \^isterc4region_0\,
      I2 => TERC4Character2(2),
      I3 => TERC4Character2(3),
      I4 => TERC4Character2(1),
      I5 => TERC4Character2(0),
      O => \e[9]_i_6__0_n_0\
    );
\e[9]_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18E7"
    )
        port map (
      I0 => \e[9]_i_4__0_n_0\,
      I1 => red_p(5),
      I2 => red_p(6),
      I3 => \e[4]_i_3__0_n_0\,
      O => \e[9]_i_7__0_n_0\
    );
\e[9]_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D22D4BB4"
    )
        port map (
      I0 => red_p(2),
      I1 => red_p(3),
      I2 => red_p(0),
      I3 => red_p(1),
      I4 => \e[9]_i_4__0_n_0\,
      O => \e[9]_i_8__0_n_0\
    );
\e[9]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"35C5535CC5355C53"
    )
        port map (
      I0 => red_p(0),
      I1 => \e[9]_i_4__0_n_0\,
      I2 => red_p(7),
      I3 => \e[4]_i_3__0_n_0\,
      I4 => red_p(5),
      I5 => red_p(6),
      O => \e[9]_i_9_n_0\
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
      D => \e_reg[2]_i_1_n_0\,
      Q => EncodedR(2),
      R => '0'
    );
\e_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[2]_i_2_n_0\,
      I1 => \e[2]_i_3_n_0\,
      O => \e_reg[2]_i_1_n_0\,
      S => blank
    );
\e_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[3]_i_1_n_0\,
      Q => EncodedR(3),
      R => '0'
    );
\e_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[3]_i_2__0_n_0\,
      I1 => \e[3]_i_3_n_0\,
      O => \e_reg[3]_i_1_n_0\,
      S => blank
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
      D => \e[5]_i_1__0_n_0\,
      Q => EncodedR(5),
      R => '0'
    );
\e_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[6]_i_1_n_0\,
      Q => EncodedR(6),
      R => '0'
    );
\e_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[6]_i_2__1_n_0\,
      I1 => \e[6]_i_3_n_0\,
      O => \e_reg[6]_i_1_n_0\,
      S => blank
    );
\e_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[7]_i_1_n_0\,
      Q => EncodedR(7),
      R => '0'
    );
\e_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[7]_i_2__0_n_0\,
      I1 => \e[7]_i_3__0_n_0\,
      O => \e_reg[7]_i_1_n_0\,
      S => blank
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
entity \MainDesign_dvid_0_0_TDMS_encoder__parameterized1\ is
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
  attribute ORIG_REF_NAME of \MainDesign_dvid_0_0_TDMS_encoder__parameterized1\ : entity is "TDMS_encoder";
end \MainDesign_dvid_0_0_TDMS_encoder__parameterized1\;

architecture STRUCTURE of \MainDesign_dvid_0_0_TDMS_encoder__parameterized1\ is
  signal \dc_bias[0]_i_1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_20_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_21__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_22_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_23_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_2_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9__0_n_0\ : STD_LOGIC;
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
  signal \e[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[3]_i_1_n_0\ : STD_LOGIC;
  signal \e[3]_i_2_n_0\ : STD_LOGIC;
  signal \e[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[4]_i_1_n_0\ : STD_LOGIC;
  signal \e[4]_i_2_n_0\ : STD_LOGIC;
  signal \e[4]_i_3_n_0\ : STD_LOGIC;
  signal \e[5]_i_1_n_0\ : STD_LOGIC;
  signal \e[5]_i_2_n_0\ : STD_LOGIC;
  signal \e[5]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_1_n_0\ : STD_LOGIC;
  signal \e[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[6]_i_4__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_2_n_0\ : STD_LOGIC;
  signal \e[7]_i_3_n_0\ : STD_LOGIC;
  signal \e[7]_i_4_n_0\ : STD_LOGIC;
  signal \e[7]_i_5__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_6__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_10_n_0\ : STD_LOGIC;
  signal \e[9]_i_11__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_12_n_0\ : STD_LOGIC;
  signal \e[9]_i_13_n_0\ : STD_LOGIC;
  signal \e[9]_i_14_n_0\ : STD_LOGIC;
  signal \e[9]_i_15__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_16_n_0\ : STD_LOGIC;
  signal \e[9]_i_17_n_0\ : STD_LOGIC;
  signal \e[9]_i_18_n_0\ : STD_LOGIC;
  signal \e[9]_i_2_n_0\ : STD_LOGIC;
  signal \e[9]_i_3_n_0\ : STD_LOGIC;
  signal \e[9]_i_4_n_0\ : STD_LOGIC;
  signal \e[9]_i_5__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_6__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_7_n_0\ : STD_LOGIC;
  signal \e[9]_i_8_n_0\ : STD_LOGIC;
  signal \e[9]_i_9__1_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_4\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_4__1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_6__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_7\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_11__1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_6\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_8__1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_10\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_16\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_17\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_21__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_22\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_23\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_8\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \e[1]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \e[2]_i_2__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \e[3]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \e[4]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \e[6]_i_2__0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \e[6]_i_4__1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \e[7]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \e[7]_i_5__1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \e[7]_i_6__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \e[9]_i_13\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \e[9]_i_15__1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \e[9]_i_17\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \e[9]_i_18\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \e[9]_i_5__1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \e[9]_i_6__1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \e[9]_i_8\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \e[9]_i_9__1\ : label is "soft_lutpair28";
begin
\dc_bias[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \e[9]_i_6__1_n_0\,
      I1 => \e[9]_i_3_n_0\,
      I2 => \dc_bias[0]_i_2__0_n_0\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \e[9]_i_4_n_0\,
      I5 => \dc_bias[0]_i_3__0_n_0\,
      O => \dc_bias[0]_i_1_n_0\
    );
\dc_bias[0]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => green_p(3),
      I1 => green_p(1),
      I2 => \e[7]_i_3_n_0\,
      I3 => \e[4]_i_2_n_0\,
      I4 => green_p(6),
      O => \dc_bias[0]_i_2__0_n_0\
    );
\dc_bias[0]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666669666969666"
    )
        port map (
      I0 => \dc_bias[0]_i_4_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[9]_i_3_n_0\,
      I3 => green_p(0),
      I4 => green_p(7),
      I5 => \dc_bias[0]_i_5_n_0\,
      O => \dc_bias[0]_i_3__0_n_0\
    );
\dc_bias[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \dc_bias[0]_i_2__0_n_0\,
      I1 => \e[9]_i_3_n_0\,
      I2 => green_p(2),
      O => \dc_bias[0]_i_4_n_0\
    );
\dc_bias[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(2),
      I2 => green_p(0),
      I3 => green_p(1),
      I4 => green_p(3),
      O => \dc_bias[0]_i_5_n_0\
    );
\dc_bias[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \dc_bias[2]_i_8__1_n_0\,
      I1 => \dc_bias[2]_i_6_n_0\,
      I2 => \dc_bias[2]_i_7_n_0\,
      I3 => \dc_bias[2]_i_4_n_0\,
      I4 => \dc_bias[2]_i_5__0_n_0\,
      O => \dc_bias[1]_i_2_n_0\
    );
\dc_bias[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9556FFFF95560000"
    )
        port map (
      I0 => \dc_bias[1]_i_4__1_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \dc_bias[0]_i_2__0_n_0\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \e[9]_i_6__1_n_0\,
      I5 => \dc_bias[1]_i_5_n_0\,
      O => \dc_bias[1]_i_3_n_0\
    );
\dc_bias[1]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_12_n_0\,
      O => \dc_bias[1]_i_4__1_n_0\
    );
\dc_bias[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"596565A665A6A69A"
    )
        port map (
      I0 => \dc_bias[3]_i_16_n_0\,
      I1 => \dc_bias[0]_i_5_n_0\,
      I2 => \dc_bias[1]_i_6__0_n_0\,
      I3 => green_p(7),
      I4 => \e[2]_i_2__0_n_0\,
      I5 => \dc_bias[1]_i_7_n_0\,
      O => \dc_bias[1]_i_5_n_0\
    );
\dc_bias[1]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_6__0_n_0\
    );
\dc_bias[1]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => green_p(0),
      I1 => green_p(1),
      I2 => \e[9]_i_3_n_0\,
      O => \dc_bias[1]_i_7_n_0\
    );
\dc_bias[2]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5AA6A6A5"
    )
        port map (
      I0 => \dc_bias[3]_i_20_n_0\,
      I1 => \dc_bias[3]_i_19_n_0\,
      I2 => \dc_bias[3]_i_18_n_0\,
      I3 => \dc_bias[3]_i_17_n_0\,
      I4 => \dc_bias[3]_i_16_n_0\,
      O => \dc_bias[2]_i_10_n_0\
    );
\dc_bias[2]_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => green_p(0),
      I1 => green_p(7),
      O => \dc_bias[2]_i_11__1_n_0\
    );
\dc_bias[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18718E18E78E71E7"
    )
        port map (
      I0 => \dc_bias[2]_i_4_n_0\,
      I1 => \dc_bias[2]_i_5__0_n_0\,
      I2 => \dc_bias[2]_i_6_n_0\,
      I3 => \dc_bias[2]_i_7_n_0\,
      I4 => \dc_bias[2]_i_8__1_n_0\,
      I5 => \dc_bias[2]_i_9_n_0\,
      O => \dc_bias[2]_i_2_n_0\
    );
\dc_bias[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669FFFF96690000"
    )
        port map (
      I0 => \e[9]_i_11__1_n_0\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias[3]_i_10_n_0\,
      I3 => \dc_bias[3]_i_9__0_n_0\,
      I4 => \e[9]_i_6__1_n_0\,
      I5 => \dc_bias[2]_i_10_n_0\,
      O => \dc_bias[2]_i_3_n_0\
    );
\dc_bias[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"090F9F0F9F0F090F"
    )
        port map (
      I0 => green_p(7),
      I1 => green_p(0),
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \e[3]_i_2_n_0\,
      I5 => green_p(5),
      O => \dc_bias[2]_i_4_n_0\
    );
\dc_bias[2]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5FF3F5F3F5F35FF3"
    )
        port map (
      I0 => green_p(2),
      I1 => \dc_bias[0]_i_2__0_n_0\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \dc_bias[2]_i_11__1_n_0\,
      I5 => \dc_bias[0]_i_5_n_0\,
      O => \dc_bias[2]_i_5__0_n_0\
    );
\dc_bias[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2282"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[3]_i_2_n_0\,
      I2 => green_p(4),
      I3 => green_p(5),
      O => \dc_bias[2]_i_6_n_0\
    );
\dc_bias[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95A595559AAA9A5A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => green_p(0),
      I2 => \e[9]_i_3_n_0\,
      I3 => green_p(7),
      I4 => \e[6]_i_2__0_n_0\,
      I5 => \e[9]_i_12_n_0\,
      O => \dc_bias[2]_i_7_n_0\
    );
\dc_bias[2]_i_8__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(1),
      I2 => green_p(0),
      I3 => \e[9]_i_3_n_0\,
      O => \dc_bias[2]_i_8__1_n_0\
    );
\dc_bias[2]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C095C0993F6A3F66"
    )
        port map (
      I0 => \e[9]_i_11__1_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_13_n_0\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \e[9]_i_12_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_9_n_0\
    );
\dc_bias[3]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F9999990"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_12_n_0\,
      I2 => \dc_bias[0]_i_2__0_n_0\,
      I3 => \e[9]_i_3_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_10_n_0\
    );
\dc_bias[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95559555AA95AAA9"
    )
        port map (
      I0 => \dc_bias[3]_i_15__0_n_0\,
      I1 => \dc_bias[3]_i_16_n_0\,
      I2 => \dc_bias[3]_i_17_n_0\,
      I3 => \dc_bias[3]_i_18_n_0\,
      I4 => \dc_bias[3]_i_19_n_0\,
      I5 => \dc_bias[3]_i_20_n_0\,
      O => \dc_bias[3]_i_11_n_0\
    );
\dc_bias[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF6996"
    )
        port map (
      I0 => \dc_bias[3]_i_14__1_n_0\,
      I1 => \e[9]_i_16_n_0\,
      I2 => \e[9]_i_17_n_0\,
      I3 => \e[9]_i_18_n_0\,
      I4 => \e[9]_i_3_n_0\,
      I5 => \dc_bias[3]_i_13_n_0\,
      O => \dc_bias[3]_i_12_n_0\
    );
\dc_bias[3]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"808C8C808C80808C"
    )
        port map (
      I0 => green_p(0),
      I1 => \e[9]_i_3_n_0\,
      I2 => green_p(7),
      I3 => green_p(5),
      I4 => green_p(6),
      I5 => \e[4]_i_2_n_0\,
      O => \dc_bias[3]_i_13_n_0\
    );
\dc_bias[3]_i_14__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8412128412848412"
    )
        port map (
      I0 => green_p(3),
      I1 => green_p(0),
      I2 => green_p(1),
      I3 => \e[7]_i_3_n_0\,
      I4 => \e[4]_i_2_n_0\,
      I5 => green_p(6),
      O => \dc_bias[3]_i_14__1_n_0\
    );
\dc_bias[3]_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAAAAA559595A9"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias[3]_i_21__0_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[3]_i_22_n_0\,
      I4 => \dc_bias[3]_i_23_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_15__0_n_0\
    );
\dc_bias[3]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96666999"
    )
        port map (
      I0 => \dc_bias[3]_i_22_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => green_p(0),
      I4 => \dc_bias[3]_i_23_n_0\,
      O => \dc_bias[3]_i_16_n_0\
    );
\dc_bias[3]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BDDB"
    )
        port map (
      I0 => green_p(2),
      I1 => \e[9]_i_3_n_0\,
      I2 => green_p(1),
      I3 => green_p(0),
      O => \dc_bias[3]_i_17_n_0\
    );
\dc_bias[3]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000990"
    )
        port map (
      I0 => \e[2]_i_2__0_n_0\,
      I1 => \dc_bias[1]_i_7_n_0\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => green_p(0),
      I4 => green_p(7),
      I5 => \dc_bias[0]_i_5_n_0\,
      O => \dc_bias[3]_i_18_n_0\
    );
\dc_bias[3]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8200EB82EB828200"
    )
        port map (
      I0 => \dc_bias[0]_i_5_n_0\,
      I1 => green_p(0),
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => green_p(7),
      I4 => \e[2]_i_2__0_n_0\,
      I5 => \dc_bias[1]_i_7_n_0\,
      O => \dc_bias[3]_i_19_n_0\
    );
\dc_bias[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"177E7EE8E8818117"
    )
        port map (
      I0 => \dc_bias[3]_i_4_n_0\,
      I1 => \dc_bias[3]_i_5_n_0\,
      I2 => \dc_bias[3]_i_6_n_0\,
      I3 => \dc_bias_reg_n_0_[2]\,
      I4 => \dc_bias[3]_i_7_n_0\,
      I5 => \dc_bias[3]_i_8_n_0\,
      O => \dc_bias[3]_i_2_n_0\
    );
\dc_bias[3]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8EE7E7E771181818"
    )
        port map (
      I0 => \dc_bias[3]_i_22_n_0\,
      I1 => \dc_bias[3]_i_23_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => green_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_20_n_0\
    );
\dc_bias[3]_i_21__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => green_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_21__0_n_0\
    );
\dc_bias[3]_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"95A9"
    )
        port map (
      I0 => \e[3]_i_2_n_0\,
      I1 => \e[9]_i_3_n_0\,
      I2 => green_p(5),
      I3 => green_p(4),
      O => \dc_bias[3]_i_22_n_0\
    );
\dc_bias[3]_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"71171771"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => green_p(7),
      I2 => green_p(5),
      I3 => green_p(6),
      I4 => \e[4]_i_2_n_0\,
      O => \dc_bias[3]_i_23_n_0\
    );
\dc_bias[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"422B422B0000FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_9__0_n_0\,
      I1 => \dc_bias[3]_i_10_n_0\,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \e[9]_i_11__1_n_0\,
      I4 => \dc_bias[3]_i_11_n_0\,
      I5 => \e[9]_i_6__1_n_0\,
      O => \dc_bias[3]_i_3_n_0\
    );
\dc_bias[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000096699669FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_12_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[2]_i_6_n_0\,
      I3 => \dc_bias[2]_i_8__1_n_0\,
      I4 => \dc_bias[2]_i_5__0_n_0\,
      I5 => \dc_bias[2]_i_4_n_0\,
      O => \dc_bias[3]_i_4_n_0\
    );
\dc_bias[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFEFFAB00A8AA02"
    )
        port map (
      I0 => \dc_bias[2]_i_6_n_0\,
      I1 => \e[9]_i_12_n_0\,
      I2 => \e[9]_i_3_n_0\,
      I3 => \dc_bias[3]_i_13_n_0\,
      I4 => \dc_bias_reg_n_0_[1]\,
      I5 => \dc_bias[2]_i_8__1_n_0\,
      O => \dc_bias[3]_i_5_n_0\
    );
\dc_bias[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBEFBAFB"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[9]_i_18_n_0\,
      I2 => \e[9]_i_17_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \dc_bias[3]_i_14__1_n_0\,
      O => \dc_bias[3]_i_6_n_0\
    );
\dc_bias[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80A080008AAA8A0A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => green_p(0),
      I2 => \e[9]_i_3_n_0\,
      I3 => green_p(7),
      I4 => \e[6]_i_2__0_n_0\,
      I5 => \e[9]_i_12_n_0\,
      O => \dc_bias[3]_i_7_n_0\
    );
\dc_bias[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[9]_i_14_n_0\,
      O => \dc_bias[3]_i_8_n_0\
    );
\dc_bias[3]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \e[9]_i_12_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      O => \dc_bias[3]_i_9__0_n_0\
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
      S => \e[9]_i_4_n_0\
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
      S => \e[9]_i_4_n_0\
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
      S => \e[9]_i_4_n_0\
    );
\e[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000059A9"
    )
        port map (
      I0 => green_p(0),
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_6__1_n_0\,
      I4 => blank,
      I5 => \e[0]_i_2__1_n_0\,
      O => \e[0]_i_1_n_0\
    );
\e[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEBAABBAAAAAAAAA"
    )
        port map (
      I0 => \e[7]_i_6__0_n_0\,
      I1 => TERC4Character1(1),
      I2 => TERC4Character1(0),
      I3 => TERC4Character1(2),
      I4 => TERC4Character1(3),
      I5 => \e[7]_i_5__1_n_0\,
      O => \e[0]_i_2__1_n_0\
    );
\e[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14415050"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[1]_i_2_n_0\,
      I3 => \e[9]_i_6__1_n_0\,
      I4 => \e[9]_i_4_n_0\,
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
      INIT => X"FFFFFFFFC8404888"
    )
        port map (
      I0 => TERC4Character1(0),
      I1 => \e[7]_i_5__1_n_0\,
      I2 => TERC4Character1(2),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(3),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[1]_i_3__1_n_0\
    );
\e[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000A656"
    )
        port map (
      I0 => \e[2]_i_2__0_n_0\,
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_6__1_n_0\,
      I4 => blank,
      I5 => \e[2]_i_3__1_n_0\,
      O => \e[2]_i_1_n_0\
    );
\e[2]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(0),
      I2 => green_p(1),
      O => \e[2]_i_2__0_n_0\
    );
\e[2]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF4700AD00"
    )
        port map (
      I0 => TERC4Character1(2),
      I1 => TERC4Character1(1),
      I2 => TERC4Character1(0),
      I3 => \e[7]_i_5__1_n_0\,
      I4 => TERC4Character1(3),
      I5 => \e[6]_i_4__1_n_0\,
      O => \e[2]_i_3__1_n_0\
    );
\e[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000906F"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[9]_i_6__1_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[3]_i_2_n_0\,
      I4 => blank,
      I5 => \e[3]_i_3__0_n_0\,
      O => \e[3]_i_1_n_0\
    );
\e[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => green_p(3),
      I1 => green_p(1),
      I2 => green_p(0),
      I3 => green_p(2),
      O => \e[3]_i_2_n_0\
    );
\e[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF044C8884"
    )
        port map (
      I0 => TERC4Character1(2),
      I1 => \e[7]_i_5__1_n_0\,
      I2 => TERC4Character1(0),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(3),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[3]_i_3__0_n_0\
    );
\e[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000A656"
    )
        port map (
      I0 => \e[4]_i_2_n_0\,
      I1 => \e[9]_i_3_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[9]_i_6__1_n_0\,
      I4 => blank,
      I5 => \e[4]_i_3_n_0\,
      O => \e[4]_i_1_n_0\
    );
\e[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => green_p(4),
      I1 => green_p(2),
      I2 => green_p(0),
      I3 => green_p(1),
      I4 => green_p(3),
      O => \e[4]_i_2_n_0\
    );
\e[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF088C4084"
    )
        port map (
      I0 => TERC4Character1(0),
      I1 => \e[7]_i_5__1_n_0\,
      I2 => TERC4Character1(3),
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(2),
      I5 => \e[6]_i_4__1_n_0\,
      O => \e[4]_i_3_n_0\
    );
\e[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000906F"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[9]_i_6__1_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[5]_i_2_n_0\,
      I4 => blank,
      I5 => \e[5]_i_3__0_n_0\,
      O => \e[5]_i_1_n_0\
    );
\e[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(3),
      I2 => green_p(1),
      I3 => green_p(0),
      I4 => green_p(2),
      I5 => green_p(4),
      O => \e[5]_i_2_n_0\
    );
\e[5]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF44848C40"
    )
        port map (
      I0 => TERC4Character1(3),
      I1 => \e[7]_i_5__1_n_0\,
      I2 => TERC4Character1(2),
      I3 => TERC4Character1(0),
      I4 => TERC4Character1(1),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[5]_i_3__0_n_0\
    );
\e[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF14441411"
    )
        port map (
      I0 => blank,
      I1 => \e[6]_i_2__0_n_0\,
      I2 => \e[9]_i_6__1_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => \e[9]_i_3_n_0\,
      I5 => \e[6]_i_3__1_n_0\,
      O => \e[6]_i_1_n_0\
    );
\e[6]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \e[4]_i_2_n_0\,
      I1 => green_p(6),
      I2 => green_p(5),
      O => \e[6]_i_2__0_n_0\
    );
\e[6]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEAAABAEABAFAEA"
    )
        port map (
      I0 => \e[6]_i_4__1_n_0\,
      I1 => TERC4Character1(0),
      I2 => \e[7]_i_5__1_n_0\,
      I3 => TERC4Character1(1),
      I4 => TERC4Character1(3),
      I5 => TERC4Character1(2),
      O => \e[6]_i_3__1_n_0\
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
      INIT => X"FFFFFFFF00006F90"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => \e[9]_i_6__1_n_0\,
      I2 => \e[9]_i_4_n_0\,
      I3 => \e[7]_i_3_n_0\,
      I4 => blank,
      I5 => \e[7]_i_4_n_0\,
      O => \e[7]_i_2_n_0\
    );
\e[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => green_p(7),
      I1 => green_p(5),
      I2 => green_p(6),
      I3 => \e[4]_i_2_n_0\,
      O => \e[7]_i_3_n_0\
    );
\e[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF9F002300"
    )
        port map (
      I0 => TERC4Character1(3),
      I1 => TERC4Character1(0),
      I2 => TERC4Character1(2),
      I3 => \e[7]_i_5__1_n_0\,
      I4 => TERC4Character1(1),
      I5 => \e[7]_i_6__0_n_0\,
      O => \e[7]_i_4_n_0\
    );
\e[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => blank,
      I1 => isTERC4Region,
      O => \e[7]_i_5__1_n_0\
    );
\e[7]_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => controlChannel1Green(0),
      I1 => isTERC4Region,
      I2 => blank,
      O => \e[7]_i_6__0_n_0\
    );
\e[8]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D1D1FF00D1D10000"
    )
        port map (
      I0 => controlChannel1Green(0),
      I1 => isTERC4Region,
      I2 => \e[8]_i_2__1_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => blank,
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
      I0 => green_p(1),
      I1 => green_p(3),
      I2 => green_p(2),
      I3 => green_p(4),
      I4 => green_p(6),
      I5 => green_p(5),
      O => \e[9]_i_10_n_0\
    );
\e[9]_i_11__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14FF0014FFEB14FF"
    )
        port map (
      I0 => \e[9]_i_15__1_n_0\,
      I1 => green_p(3),
      I2 => \e[1]_i_2_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \e[9]_i_17_n_0\,
      I5 => \e[9]_i_18_n_0\,
      O => \e[9]_i_11__1_n_0\
    );
\e[9]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB1414EB14EBEB14"
    )
        port map (
      I0 => \e[9]_i_15__1_n_0\,
      I1 => green_p(3),
      I2 => \e[1]_i_2_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \e[9]_i_17_n_0\,
      I5 => \e[9]_i_18_n_0\,
      O => \e[9]_i_12_n_0\
    );
\e[9]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => p_1_in,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias_reg_n_0_[1]\,
      O => \e[9]_i_13_n_0\
    );
\e[9]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB000000FFEBEB00"
    )
        port map (
      I0 => \e[9]_i_15__1_n_0\,
      I1 => green_p(3),
      I2 => \e[1]_i_2_n_0\,
      I3 => \e[9]_i_16_n_0\,
      I4 => \e[9]_i_18_n_0\,
      I5 => \e[9]_i_17_n_0\,
      O => \e[9]_i_14_n_0\
    );
\e[9]_i_15__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(5),
      I1 => green_p(7),
      I2 => green_p(0),
      O => \e[9]_i_15__1_n_0\
    );
\e[9]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"600690096FF69FF9"
    )
        port map (
      I0 => \e[4]_i_2_n_0\,
      I1 => green_p(6),
      I2 => green_p(5),
      I3 => green_p(7),
      I4 => \e[9]_i_3_n_0\,
      I5 => green_p(0),
      O => \e[9]_i_16_n_0\
    );
\e[9]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18E7"
    )
        port map (
      I0 => \e[9]_i_3_n_0\,
      I1 => green_p(5),
      I2 => green_p(6),
      I3 => \e[4]_i_2_n_0\,
      O => \e[9]_i_17_n_0\
    );
\e[9]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C369693C"
    )
        port map (
      I0 => green_p(2),
      I1 => green_p(0),
      I2 => green_p(1),
      I3 => green_p(3),
      I4 => \e[9]_i_3_n_0\,
      O => \e[9]_i_18_n_0\
    );
\e[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAAABABB"
    )
        port map (
      I0 => \e[9]_i_5__1_n_0\,
      I1 => blank,
      I2 => \e[9]_i_6__1_n_0\,
      I3 => \e[9]_i_4_n_0\,
      I4 => \e[9]_i_3_n_0\,
      O => \e[9]_i_2_n_0\
    );
\e[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80080880EEFFAAEE"
    )
        port map (
      I0 => \e[9]_i_7_n_0\,
      I1 => \e[9]_i_8_n_0\,
      I2 => green_p(0),
      I3 => green_p(7),
      I4 => \e[9]_i_9__1_n_0\,
      I5 => \e[9]_i_10_n_0\,
      O => \e[9]_i_3_n_0\
    );
\e[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00DF"
    )
        port map (
      I0 => \e[9]_i_11__1_n_0\,
      I1 => \e[9]_i_12_n_0\,
      I2 => \dc_bias[0]_i_2__0_n_0\,
      I3 => \e[9]_i_13_n_0\,
      O => \e[9]_i_4_n_0\
    );
\e[9]_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5500C300"
    )
        port map (
      I0 => \e[8]_i_2__1_n_0\,
      I1 => controlChannel1Green(0),
      I2 => controlChannel1Green(1),
      I3 => blank,
      I4 => isTERC4Region,
      O => \e[9]_i_5__1_n_0\
    );
\e[9]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_14_n_0\,
      O => \e[9]_i_6__1_n_0\
    );
\e[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001700171717"
    )
        port map (
      I0 => green_p(1),
      I1 => green_p(3),
      I2 => green_p(2),
      I3 => green_p(4),
      I4 => green_p(6),
      I5 => green_p(5),
      O => \e[9]_i_7_n_0\
    );
\e[9]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(1),
      I1 => green_p(3),
      I2 => green_p(2),
      O => \e[9]_i_8_n_0\
    );
\e[9]_i_9__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => green_p(6),
      I1 => green_p(5),
      I2 => green_p(4),
      O => \e[9]_i_9__1_n_0\
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
entity \MainDesign_dvid_0_0_TDMS_encoder__parameterized3\ is
  port (
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    guardBandType : in STD_LOGIC;
    guardBandEnable : in STD_LOGIC;
    blank : in STD_LOGIC;
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    isTERC4Region : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \e_reg[6]_0\ : in STD_LOGIC;
    clk_pixel_x1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \MainDesign_dvid_0_0_TDMS_encoder__parameterized3\ : entity is "TDMS_encoder";
end \MainDesign_dvid_0_0_TDMS_encoder__parameterized3\;

architecture STRUCTURE of \MainDesign_dvid_0_0_TDMS_encoder__parameterized3\ is
  signal \dc_bias[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_2__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_4__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[1]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_10__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_11__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_2__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_7__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_8__0_n_0\ : STD_LOGIC;
  signal \dc_bias[2]_i_9__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_10__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_11__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_12__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_13__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_14__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_15__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_16__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_17__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_18__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_19__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_20__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_21__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_6__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_7__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_8__1_n_0\ : STD_LOGIC;
  signal \dc_bias[3]_i_9__1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \dc_bias_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[0]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[1]\ : STD_LOGIC;
  signal \dc_bias_reg_n_0_[2]\ : STD_LOGIC;
  signal \e[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[0]_i_3_n_0\ : STD_LOGIC;
  signal \e[1]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[1]_i_3_n_0\ : STD_LOGIC;
  signal \e[1]_i_4_n_0\ : STD_LOGIC;
  signal \e[2]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[2]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[2]_i_4_n_0\ : STD_LOGIC;
  signal \e[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[3]_i_4_n_0\ : STD_LOGIC;
  signal \e[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[4]_i_4_n_0\ : STD_LOGIC;
  signal \e[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \e[5]_i_3_n_0\ : STD_LOGIC;
  signal \e[5]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_2_n_0\ : STD_LOGIC;
  signal \e[6]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[6]_i_4__0_n_0\ : STD_LOGIC;
  signal \e[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \e[7]_i_5__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \e[8]_i_2_n_0\ : STD_LOGIC;
  signal \e[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_10__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_11__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_12__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_13__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_14__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_15__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_16__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_17__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_18__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_19__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_20_n_0\ : STD_LOGIC;
  signal \e[9]_i_2_n_0\ : STD_LOGIC;
  signal \e[9]_i_3__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_4__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_5__0_n_0\ : STD_LOGIC;
  signal \e[9]_i_6_n_0\ : STD_LOGIC;
  signal \e[9]_i_7__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_8__1_n_0\ : STD_LOGIC;
  signal \e[9]_i_9__0_n_0\ : STD_LOGIC;
  signal \e_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \e_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \e_reg[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \e_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dc_bias[0]_i_2__1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_4__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dc_bias[0]_i_5__1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_4__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_5__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_6__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \dc_bias[1]_i_8__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_5__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_7__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \dc_bias[2]_i_9__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_10__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_13__1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_17__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_18__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_19__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_20__1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \dc_bias[3]_i_21__1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \e[0]_i_3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \e[1]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \e[3]_i_3__1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \e[3]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \e[4]_i_3__1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \e[4]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \e[5]_i_4__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \e[6]_i_4__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \e[7]_i_4__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \e[8]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \e[9]_i_10__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \e[9]_i_12__1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \e[9]_i_13__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \e[9]_i_16__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \e[9]_i_19__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \e[9]_i_20\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \e[9]_i_3__1\ : label is "soft_lutpair10";
begin
\dc_bias[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996FFFF69960000"
    )
        port map (
      I0 => \e[9]_i_3__1_n_0\,
      I1 => \e[9]_i_5__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => \e[9]_i_4__1_n_0\,
      I5 => \dc_bias[0]_i_3__1_n_0\,
      O => \dc_bias[0]_i_1__1_n_0\
    );
\dc_bias[0]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(1),
      I2 => blue_p(7),
      I3 => blue_p(5),
      O => \dc_bias[0]_i_2__1_n_0\
    );
\dc_bias[0]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666669666969666"
    )
        port map (
      I0 => \dc_bias[0]_i_4__1_n_0\,
      I1 => \dc_bias_reg_n_0_[0]\,
      I2 => \e[9]_i_5__0_n_0\,
      I3 => blue_p(0),
      I4 => blue_p(7),
      I5 => \dc_bias[0]_i_5__1_n_0\,
      O => \dc_bias[0]_i_3__1_n_0\
    );
\dc_bias[0]_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \dc_bias[0]_i_2__1_n_0\,
      I1 => \e[9]_i_5__0_n_0\,
      I2 => blue_p(2),
      O => \dc_bias[0]_i_4__1_n_0\
    );
\dc_bias[0]_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(2),
      I2 => blue_p(0),
      I3 => blue_p(1),
      I4 => blue_p(3),
      O => \dc_bias[0]_i_5__1_n_0\
    );
\dc_bias[1]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \dc_bias[2]_i_9__1_n_0\,
      I1 => \dc_bias[2]_i_7__0_n_0\,
      I2 => \dc_bias[2]_i_8__0_n_0\,
      I3 => \dc_bias[2]_i_4__1_n_0\,
      I4 => \dc_bias[2]_i_5__1_n_0\,
      O => \dc_bias[1]_i_2__1_n_0\
    );
\dc_bias[1]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B88B8BB8"
    )
        port map (
      I0 => \dc_bias[1]_i_4__0_n_0\,
      I1 => \e[9]_i_3__1_n_0\,
      I2 => \dc_bias[1]_i_5__1_n_0\,
      I3 => \dc_bias[1]_i_6__1_n_0\,
      I4 => \dc_bias[1]_i_7__0_n_0\,
      O => \dc_bias[1]_i_3__1_n_0\
    );
\dc_bias[1]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96666669"
    )
        port map (
      I0 => \e[9]_i_9__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => \dc_bias[0]_i_2__1_n_0\,
      I4 => \e[9]_i_5__0_n_0\,
      O => \dc_bias[1]_i_4__0_n_0\
    );
\dc_bias[1]_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BED74128"
    )
        port map (
      I0 => blue_p(2),
      I1 => blue_p(0),
      I2 => blue_p(1),
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \dc_bias[3]_i_18__0_n_0\,
      O => \dc_bias[1]_i_5__1_n_0\
    );
\dc_bias[1]_i_6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F99090F9"
    )
        port map (
      I0 => \e[3]_i_3__1_n_0\,
      I1 => blue_p(5),
      I2 => blue_p(7),
      I3 => blue_p(0),
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[1]_i_6__1_n_0\
    );
\dc_bias[1]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1441411441141441"
    )
        port map (
      I0 => \dc_bias[1]_i_8__0_n_0\,
      I1 => blue_p(7),
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => blue_p(0),
      I4 => blue_p(5),
      I5 => \e[3]_i_3__1_n_0\,
      O => \dc_bias[1]_i_7__0_n_0\
    );
\dc_bias[1]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => blue_p(2),
      I1 => \e[9]_i_5__0_n_0\,
      O => \dc_bias[1]_i_8__0_n_0\
    );
\dc_bias[2]_i_10__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D2B4B42D"
    )
        port map (
      I0 => \dc_bias[1]_i_7__0_n_0\,
      I1 => \dc_bias[1]_i_6__1_n_0\,
      I2 => \dc_bias[3]_i_16__1_n_0\,
      I3 => \dc_bias[3]_i_18__0_n_0\,
      I4 => \dc_bias[3]_i_17__1_n_0\,
      O => \dc_bias[2]_i_10__0_n_0\
    );
\dc_bias[2]_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"966900006996FFFF"
    )
        port map (
      I0 => blue_p(5),
      I1 => \e[3]_i_3__1_n_0\,
      I2 => blue_p(7),
      I3 => blue_p(0),
      I4 => \e[9]_i_5__0_n_0\,
      I5 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[2]_i_11__0_n_0\
    );
\dc_bias[2]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E17887E1781EE178"
    )
        port map (
      I0 => \dc_bias[2]_i_4__1_n_0\,
      I1 => \dc_bias[2]_i_5__1_n_0\,
      I2 => \dc_bias[2]_i_6__1_n_0\,
      I3 => \dc_bias[2]_i_7__0_n_0\,
      I4 => \dc_bias[2]_i_8__0_n_0\,
      I5 => \dc_bias[2]_i_9__1_n_0\,
      O => \dc_bias[2]_i_2__1_n_0\
    );
\dc_bias[2]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669FFFF96690000"
    )
        port map (
      I0 => \e[9]_i_8__1_n_0\,
      I1 => \dc_bias_reg_n_0_[2]\,
      I2 => \dc_bias[3]_i_10__0_n_0\,
      I3 => \dc_bias[3]_i_9__1_n_0\,
      I4 => \e[9]_i_3__1_n_0\,
      I5 => \dc_bias[2]_i_10__0_n_0\,
      O => \dc_bias[2]_i_3__1_n_0\
    );
\dc_bias[2]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F0F090F090F9F0F"
    )
        port map (
      I0 => blue_p(7),
      I1 => blue_p(0),
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[3]_i_3__1_n_0\,
      I5 => blue_p(5),
      O => \dc_bias[2]_i_4__1_n_0\
    );
\dc_bias[2]_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47FF"
    )
        port map (
      I0 => blue_p(2),
      I1 => \e[9]_i_5__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \dc_bias[2]_i_11__0_n_0\,
      O => \dc_bias[2]_i_5__1_n_0\
    );
\dc_bias[2]_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F6A3F66C095C099"
    )
        port map (
      I0 => \e[9]_i_8__1_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_14__0_n_0\,
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[9]_i_9__0_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[2]_i_6__1_n_0\
    );
\dc_bias[2]_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8828"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => \e[3]_i_3__1_n_0\,
      I2 => blue_p(4),
      I3 => blue_p(5),
      O => \dc_bias[2]_i_7__0_n_0\
    );
\dc_bias[2]_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"95A595559AAA9A5A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => blue_p(0),
      I2 => \e[9]_i_5__0_n_0\,
      I3 => blue_p(7),
      I4 => \e[7]_i_4__1_n_0\,
      I5 => \e[9]_i_9__0_n_0\,
      O => \dc_bias[2]_i_8__0_n_0\
    );
\dc_bias[2]_i_9__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1400"
    )
        port map (
      I0 => blue_p(2),
      I1 => blue_p(1),
      I2 => blue_p(0),
      I3 => \e[9]_i_5__0_n_0\,
      O => \dc_bias[2]_i_9__1_n_0\
    );
\dc_bias[3]_i_10__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F9999990"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => \e[9]_i_9__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_10__0_n_0\
    );
\dc_bias[3]_i_11__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A66665666565655"
    )
        port map (
      I0 => \dc_bias[3]_i_15__1_n_0\,
      I1 => \dc_bias[3]_i_16__1_n_0\,
      I2 => \dc_bias[1]_i_6__1_n_0\,
      I3 => \dc_bias[3]_i_17__1_n_0\,
      I4 => \dc_bias[3]_i_18__0_n_0\,
      I5 => \dc_bias[1]_i_7__0_n_0\,
      O => \dc_bias[3]_i_11__1_n_0\
    );
\dc_bias[3]_i_12__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF9669"
    )
        port map (
      I0 => \dc_bias[3]_i_13__1_n_0\,
      I1 => \e[9]_i_18__1_n_0\,
      I2 => \e[9]_i_20_n_0\,
      I3 => \e[9]_i_19__0_n_0\,
      I4 => \e[9]_i_5__0_n_0\,
      I5 => \dc_bias[3]_i_14__0_n_0\,
      O => \dc_bias[3]_i_12__1_n_0\
    );
\dc_bias[3]_i_13__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"84121284"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(0),
      I2 => blue_p(1),
      I3 => blue_p(7),
      I4 => blue_p(5),
      O => \dc_bias[3]_i_13__1_n_0\
    );
\dc_bias[3]_i_14__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"808C8C808C80808C"
    )
        port map (
      I0 => blue_p(0),
      I1 => \e[9]_i_5__0_n_0\,
      I2 => blue_p(7),
      I3 => \e[4]_i_3__1_n_0\,
      I4 => blue_p(5),
      I5 => blue_p(6),
      O => \dc_bias[3]_i_14__0_n_0\
    );
\dc_bias[3]_i_15__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA9AA95A95595"
    )
        port map (
      I0 => p_1_in,
      I1 => \dc_bias[3]_i_19__1_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias[3]_i_20__1_n_0\,
      I4 => \dc_bias[3]_i_21__1_n_0\,
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_15__1_n_0\
    );
\dc_bias[3]_i_16__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BBDBDBDD4424242"
    )
        port map (
      I0 => \dc_bias[3]_i_20__1_n_0\,
      I1 => \dc_bias[3]_i_21__1_n_0\,
      I2 => \dc_bias_reg_n_0_[1]\,
      I3 => \dc_bias_reg_n_0_[0]\,
      I4 => blue_p(0),
      I5 => \dc_bias_reg_n_0_[2]\,
      O => \dc_bias[3]_i_16__1_n_0\
    );
\dc_bias[3]_i_17__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB7D"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => blue_p(1),
      I2 => blue_p(0),
      I3 => blue_p(2),
      O => \dc_bias[3]_i_17__1_n_0\
    );
\dc_bias[3]_i_18__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69999666"
    )
        port map (
      I0 => \dc_bias[3]_i_20__1_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias_reg_n_0_[0]\,
      I3 => blue_p(0),
      I4 => \dc_bias[3]_i_21__1_n_0\,
      O => \dc_bias[3]_i_18__0_n_0\
    );
\dc_bias[3]_i_19__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => blue_p(0),
      I1 => \dc_bias_reg_n_0_[0]\,
      O => \dc_bias[3]_i_19__1_n_0\
    );
\dc_bias[3]_i_20__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"781E"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => blue_p(5),
      I2 => \e[3]_i_3__1_n_0\,
      I3 => blue_p(4),
      O => \dc_bias[3]_i_20__1_n_0\
    );
\dc_bias[3]_i_21__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8EE8E88E"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => blue_p(7),
      I2 => \e[4]_i_3__1_n_0\,
      I3 => blue_p(5),
      I4 => blue_p(6),
      O => \dc_bias[3]_i_21__1_n_0\
    );
\dc_bias[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A69A9A5965A6A69A"
    )
        port map (
      I0 => \dc_bias[3]_i_4__1_n_0\,
      I1 => \dc_bias[3]_i_5__1_n_0\,
      I2 => \dc_bias[3]_i_6__1_n_0\,
      I3 => \dc_bias[3]_i_7__1_n_0\,
      I4 => \dc_bias_reg_n_0_[2]\,
      I5 => \dc_bias[3]_i_8__1_n_0\,
      O => \dc_bias[3]_i_2__0_n_0\
    );
\dc_bias[3]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"422B422B0000FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_9__1_n_0\,
      I1 => \dc_bias[3]_i_10__0_n_0\,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \e[9]_i_8__1_n_0\,
      I4 => \dc_bias[3]_i_11__1_n_0\,
      I5 => \e[9]_i_3__1_n_0\,
      O => \dc_bias[3]_i_3__1_n_0\
    );
\dc_bias[3]_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_5__0_n_0\,
      I2 => \e[9]_i_7__1_n_0\,
      O => \dc_bias[3]_i_4__1_n_0\
    );
\dc_bias[3]_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000096699669FFFF"
    )
        port map (
      I0 => \dc_bias[3]_i_12__1_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[2]_i_7__0_n_0\,
      I3 => \dc_bias[2]_i_9__1_n_0\,
      I4 => \dc_bias[2]_i_5__1_n_0\,
      I5 => \dc_bias[2]_i_4__1_n_0\,
      O => \dc_bias[3]_i_5__1_n_0\
    );
\dc_bias[3]_i_6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01401501"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => \e[9]_i_19__0_n_0\,
      I2 => \e[9]_i_20_n_0\,
      I3 => \e[9]_i_18__1_n_0\,
      I4 => \dc_bias[3]_i_13__1_n_0\,
      O => \dc_bias[3]_i_6__1_n_0\
    );
\dc_bias[3]_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80A080008AAA8A0A"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[1]\,
      I1 => blue_p(0),
      I2 => \e[9]_i_5__0_n_0\,
      I3 => blue_p(7),
      I4 => \e[7]_i_4__1_n_0\,
      I5 => \e[9]_i_9__0_n_0\,
      O => \dc_bias[3]_i_7__1_n_0\
    );
\dc_bias[3]_i_8__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"41414144D7D7D7DD"
    )
        port map (
      I0 => \dc_bias[2]_i_7__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
      I2 => \dc_bias[3]_i_14__0_n_0\,
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[9]_i_9__0_n_0\,
      I5 => \dc_bias[2]_i_9__1_n_0\,
      O => \dc_bias[3]_i_8__1_n_0\
    );
\dc_bias[3]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \e[9]_i_9__0_n_0\,
      I1 => \dc_bias_reg_n_0_[1]\,
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
      S => \e[9]_i_4__1_n_0\
    );
\dc_bias_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[2]_i_1__1_n_0\,
      Q => \dc_bias_reg_n_0_[2]\,
      R => blank
    );
\dc_bias_reg[2]_i_1__1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[2]_i_2__1_n_0\,
      I1 => \dc_bias[2]_i_3__1_n_0\,
      O => \dc_bias_reg[2]_i_1__1_n_0\,
      S => \e[9]_i_4__1_n_0\
    );
\dc_bias_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \dc_bias_reg[3]_i_1__0_n_0\,
      Q => p_1_in,
      R => blank
    );
\dc_bias_reg[3]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \dc_bias[3]_i_2__0_n_0\,
      I1 => \dc_bias[3]_i_3__1_n_0\,
      O => \dc_bias_reg[3]_i_1__0_n_0\,
      S => \e[9]_i_4__1_n_0\
    );
\e[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000059A9"
    )
        port map (
      I0 => blue_p(0),
      I1 => \e[9]_i_5__0_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => \e[9]_i_3__1_n_0\,
      I4 => blank,
      I5 => \e[0]_i_2__0_n_0\,
      O => \e[0]_i_1__1_n_0\
    );
\e[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC550000FCF00000"
    )
        port map (
      I0 => \e[0]_i_3_n_0\,
      I1 => controlChannel0Blue(1),
      I2 => controlChannel0Blue(0),
      I3 => guardBandEnable,
      I4 => blank,
      I5 => isTERC4Region,
      O => \e[0]_i_2__0_n_0\
    );
\e[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EBB"
    )
        port map (
      I0 => TERC4Character0(1),
      I1 => TERC4Character0(0),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(2),
      O => \e[0]_i_3_n_0\
    );
\e[1]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"906F6F90"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => \e[9]_i_3__1_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => blue_p(1),
      I4 => blue_p(0),
      O => \e[1]_i_2__1_n_0\
    );
\e[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FABABAEAEAEAAAEA"
    )
        port map (
      I0 => \e[1]_i_4_n_0\,
      I1 => TERC4Character0(0),
      I2 => \e_reg[6]_0\,
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
\e[2]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6969966996969669"
    )
        port map (
      I0 => blue_p(1),
      I1 => blue_p(0),
      I2 => blue_p(2),
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[9]_i_4__1_n_0\,
      I5 => \e[9]_i_3__1_n_0\,
      O => \e[2]_i_2__1_n_0\
    );
\e[2]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAABBB"
    )
        port map (
      I0 => \e[2]_i_4_n_0\,
      I1 => controlChannel0Blue(0),
      I2 => controlChannel0Blue(1),
      I3 => guardBandEnable,
      I4 => isTERC4Region,
      O => \e[2]_i_3__0_n_0\
    );
\e[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0047000000AD0000"
    )
        port map (
      I0 => TERC4Character0(2),
      I1 => TERC4Character0(1),
      I2 => TERC4Character0(0),
      I3 => guardBandEnable,
      I4 => isTERC4Region,
      I5 => TERC4Character0(3),
      O => \e[2]_i_4_n_0\
    );
\e[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8BBBBB88B8888"
    )
        port map (
      I0 => \e[3]_i_2__1_n_0\,
      I1 => blank,
      I2 => \e[9]_i_5__0_n_0\,
      I3 => \e[9]_i_3__1_n_0\,
      I4 => \e[9]_i_4__1_n_0\,
      I5 => \e[3]_i_3__1_n_0\,
      O => \e[3]_i_1__0_n_0\
    );
\e[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABABAFAEAEAEABA"
    )
        port map (
      I0 => \e[3]_i_4_n_0\,
      I1 => TERC4Character0(2),
      I2 => \e_reg[6]_0\,
      I3 => TERC4Character0(0),
      I4 => TERC4Character0(1),
      I5 => TERC4Character0(3),
      O => \e[3]_i_2__1_n_0\
    );
\e[3]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(1),
      I2 => blue_p(0),
      I3 => blue_p(2),
      O => \e[3]_i_3__1_n_0\
    );
\e[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"110C"
    )
        port map (
      I0 => isTERC4Region,
      I1 => guardBandEnable,
      I2 => controlChannel0Blue(1),
      I3 => controlChannel0Blue(0),
      O => \e[3]_i_4_n_0\
    );
\e[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8888BBBB8BB8B88"
    )
        port map (
      I0 => \e[4]_i_2__0_n_0\,
      I1 => blank,
      I2 => \e[9]_i_3__1_n_0\,
      I3 => \e[9]_i_4__1_n_0\,
      I4 => \e[4]_i_3__1_n_0\,
      I5 => \e[9]_i_5__0_n_0\,
      O => \e[4]_i_1__1_n_0\
    );
\e[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAFABABAEAAABA"
    )
        port map (
      I0 => \e[4]_i_4_n_0\,
      I1 => TERC4Character0(1),
      I2 => \e_reg[6]_0\,
      I3 => TERC4Character0(0),
      I4 => TERC4Character0(3),
      I5 => TERC4Character0(2),
      O => \e[4]_i_2__0_n_0\
    );
\e[4]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => blue_p(4),
      I1 => blue_p(2),
      I2 => blue_p(0),
      I3 => blue_p(1),
      I4 => blue_p(3),
      O => \e[4]_i_3__1_n_0\
    );
\e[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01C1"
    )
        port map (
      I0 => isTERC4Region,
      I1 => guardBandEnable,
      I2 => controlChannel0Blue(0),
      I3 => controlChannel0Blue(1),
      O => \e[4]_i_4_n_0\
    );
\e[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000906F"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => \e[9]_i_3__1_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => \e[5]_i_2__0_n_0\,
      I4 => blank,
      I5 => \e[5]_i_3_n_0\,
      O => \e[5]_i_1__1_n_0\
    );
\e[5]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(3),
      I2 => blue_p(1),
      I3 => blue_p(0),
      I4 => blue_p(2),
      I5 => blue_p(4),
      O => \e[5]_i_2__0_n_0\
    );
\e[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"303050C0C0C050C0"
    )
        port map (
      I0 => \e[5]_i_4__0_n_0\,
      I1 => controlChannel0Blue(0),
      I2 => blank,
      I3 => isTERC4Region,
      I4 => guardBandEnable,
      I5 => controlChannel0Blue(1),
      O => \e[5]_i_3_n_0\
    );
\e[5]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96B1"
    )
        port map (
      I0 => TERC4Character0(1),
      I1 => TERC4Character0(0),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(2),
      O => \e[5]_i_4__0_n_0\
    );
\e[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9696699669696996"
    )
        port map (
      I0 => \e[4]_i_3__1_n_0\,
      I1 => blue_p(5),
      I2 => blue_p(6),
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[9]_i_4__1_n_0\,
      I5 => \e[9]_i_3__1_n_0\,
      O => \e[6]_i_2_n_0\
    );
\e[6]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAEAFAEABABAEA"
    )
        port map (
      I0 => \e[6]_i_4__0_n_0\,
      I1 => TERC4Character0(0),
      I2 => \e_reg[6]_0\,
      I3 => TERC4Character0(3),
      I4 => TERC4Character0(2),
      I5 => TERC4Character0(1),
      O => \e[6]_i_3__0_n_0\
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
\e[7]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"906F6F90"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => \e[9]_i_3__1_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => blue_p(7),
      I4 => \e[7]_i_4__1_n_0\,
      O => \e[7]_i_2__1_n_0\
    );
\e[7]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAABFFBAAAAAAAA"
    )
        port map (
      I0 => \e[7]_i_5__0_n_0\,
      I1 => TERC4Character0(2),
      I2 => TERC4Character0(3),
      I3 => TERC4Character0(1),
      I4 => TERC4Character0(0),
      I5 => \e_reg[6]_0\,
      O => \e[7]_i_3__1_n_0\
    );
\e[7]_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(6),
      I1 => blue_p(5),
      I2 => \e[4]_i_3__1_n_0\,
      O => \e[7]_i_4__1_n_0\
    );
\e[7]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA3FAA0F55305500"
    )
        port map (
      I0 => controlChannel0Blue(1),
      I1 => TERC4Character0(2),
      I2 => isTERC4Region,
      I3 => guardBandEnable,
      I4 => TERC4Character0(1),
      I5 => controlChannel0Blue(0),
      O => \e[7]_i_5__0_n_0\
    );
\e[8]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFE0"
    )
        port map (
      I0 => \e[8]_i_2_n_0\,
      I1 => \e[8]_i_3__0_n_0\,
      I2 => blank,
      I3 => \e[9]_i_5__0_n_0\,
      O => \e[8]_i_1__0_n_0\
    );
\e[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0022220F000F0F"
    )
        port map (
      I0 => TERC4Character0(2),
      I1 => TERC4Character0(3),
      I2 => controlChannel0Blue(0),
      I3 => controlChannel0Blue(1),
      I4 => guardBandEnable,
      I5 => isTERC4Region,
      O => \e[8]_i_2_n_0\
    );
\e[8]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001C000000"
    )
        port map (
      I0 => TERC4Character0(2),
      I1 => TERC4Character0(1),
      I2 => TERC4Character0(0),
      I3 => isTERC4Region,
      I4 => TERC4Character0(3),
      I5 => guardBandEnable,
      O => \e[8]_i_3__0_n_0\
    );
\e[9]_i_10__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \dc_bias_reg_n_0_[0]\,
      I1 => p_1_in,
      I2 => \dc_bias_reg_n_0_[2]\,
      I3 => \dc_bias_reg_n_0_[1]\,
      O => \e[9]_i_10__0_n_0\
    );
\e[9]_i_11__0\: unisim.vcomponents.LUT6
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
      O => \e[9]_i_11__0_n_0\
    );
\e[9]_i_12__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(2),
      I2 => blue_p(1),
      O => \e[9]_i_12__1_n_0\
    );
\e[9]_i_13__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(4),
      I1 => blue_p(6),
      I2 => blue_p(5),
      O => \e[9]_i_13__1_n_0\
    );
\e[9]_i_14__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8E8E800E8000000"
    )
        port map (
      I0 => blue_p(1),
      I1 => blue_p(3),
      I2 => blue_p(2),
      I3 => blue_p(4),
      I4 => blue_p(6),
      I5 => blue_p(5),
      O => \e[9]_i_14__1_n_0\
    );
\e[9]_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B00090000000F000"
    )
        port map (
      I0 => TERC4Character0(0),
      I1 => TERC4Character0(1),
      I2 => \e_reg[6]_0\,
      I3 => blank,
      I4 => TERC4Character0(2),
      I5 => TERC4Character0(3),
      O => \e[9]_i_15__0_n_0\
    );
\e[9]_i_16__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => blue_p(5),
      I1 => blue_p(7),
      I2 => blue_p(0),
      O => \e[9]_i_16__1_n_0\
    );
\e[9]_i_17__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => blue_p(1),
      I1 => blue_p(0),
      O => \e[9]_i_17__1_n_0\
    );
\e[9]_i_18__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"481284217BDEB7ED"
    )
        port map (
      I0 => blue_p(6),
      I1 => blue_p(5),
      I2 => \e[4]_i_3__1_n_0\,
      I3 => blue_p(7),
      I4 => \e[9]_i_5__0_n_0\,
      I5 => blue_p(0),
      O => \e[9]_i_18__1_n_0\
    );
\e[9]_i_19__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"18E7"
    )
        port map (
      I0 => \e[9]_i_5__0_n_0\,
      I1 => blue_p(5),
      I2 => blue_p(6),
      I3 => \e[4]_i_3__1_n_0\,
      O => \e[9]_i_19__0_n_0\
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
\e[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4045"
    )
        port map (
      I0 => blank,
      I1 => \e[9]_i_3__1_n_0\,
      I2 => \e[9]_i_4__1_n_0\,
      I3 => \e[9]_i_5__0_n_0\,
      I4 => \e[9]_i_6_n_0\,
      O => \e[9]_i_2_n_0\
    );
\e[9]_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69C33C69"
    )
        port map (
      I0 => blue_p(3),
      I1 => blue_p(0),
      I2 => blue_p(1),
      I3 => \e[9]_i_5__0_n_0\,
      I4 => blue_p(2),
      O => \e[9]_i_20_n_0\
    );
\e[9]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_1_in,
      I1 => \e[9]_i_7__1_n_0\,
      O => \e[9]_i_3__1_n_0\
    );
\e[9]_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00DF"
    )
        port map (
      I0 => \e[9]_i_8__1_n_0\,
      I1 => \e[9]_i_9__0_n_0\,
      I2 => \dc_bias[0]_i_2__1_n_0\,
      I3 => \e[9]_i_10__0_n_0\,
      O => \e[9]_i_4__1_n_0\
    );
\e[9]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80080880EEFFAAEE"
    )
        port map (
      I0 => \e[9]_i_11__0_n_0\,
      I1 => \e[9]_i_12__1_n_0\,
      I2 => blue_p(0),
      I3 => blue_p(7),
      I4 => \e[9]_i_13__1_n_0\,
      I5 => \e[9]_i_14__1_n_0\,
      O => \e[9]_i_5__0_n_0\
    );
\e[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAAAFAFABAAAAABA"
    )
        port map (
      I0 => \e[9]_i_15__0_n_0\,
      I1 => isTERC4Region,
      I2 => blank,
      I3 => controlChannel0Blue(0),
      I4 => controlChannel0Blue(1),
      I5 => guardBandEnable,
      O => \e[9]_i_6_n_0\
    );
\e[9]_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EB00EB00FFEB"
    )
        port map (
      I0 => \e[9]_i_16__1_n_0\,
      I1 => blue_p(3),
      I2 => \e[9]_i_17__1_n_0\,
      I3 => \e[9]_i_18__1_n_0\,
      I4 => \e[9]_i_19__0_n_0\,
      I5 => \e[9]_i_20_n_0\,
      O => \e[9]_i_7__1_n_0\
    );
\e[9]_i_8__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEB14FF14FF0014"
    )
        port map (
      I0 => \e[9]_i_16__1_n_0\,
      I1 => blue_p(3),
      I2 => \e[9]_i_17__1_n_0\,
      I3 => \e[9]_i_18__1_n_0\,
      I4 => \e[9]_i_20_n_0\,
      I5 => \e[9]_i_19__0_n_0\,
      O => \e[9]_i_8__1_n_0\
    );
\e[9]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14EBEB14EB1414EB"
    )
        port map (
      I0 => \e[9]_i_16__1_n_0\,
      I1 => blue_p(3),
      I2 => \e[9]_i_17__1_n_0\,
      I3 => \e[9]_i_18__1_n_0\,
      I4 => \e[9]_i_20_n_0\,
      I5 => \e[9]_i_19__0_n_0\,
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
      D => \e_reg[2]_i_1__0_n_0\,
      Q => EncodedB(2),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[2]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[2]_i_2__1_n_0\,
      I1 => \e[2]_i_3__0_n_0\,
      O => \e_reg[2]_i_1__0_n_0\,
      S => blank
    );
\e_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e[3]_i_1__0_n_0\,
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
      D => \e[5]_i_1__1_n_0\,
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
      D => \e_reg[6]_i_1__0_n_0\,
      Q => EncodedB(6),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[6]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[6]_i_2_n_0\,
      I1 => \e[6]_i_3__0_n_0\,
      O => \e_reg[6]_i_1__0_n_0\,
      S => blank
    );
\e_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_pixel_x1,
      CE => '1',
      D => \e_reg[7]_i_1__0_n_0\,
      Q => EncodedB(7),
      S => \e[9]_i_1__1_n_0\
    );
\e_reg[7]_i_1__0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \e[7]_i_2__1_n_0\,
      I1 => \e[7]_i_3__1_n_0\,
      O => \e_reg[7]_i_1__0_n_0\,
      S => blank
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
entity MainDesign_dvid_0_0_dvid is
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
    clk_pixel_x1 : in STD_LOGIC;
    clk_x10 : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    scanout_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_dvid_0_0_dvid : entity is "dvid";
end MainDesign_dvid_0_0_dvid;

architecture STRUCTURE of MainDesign_dvid_0_0_dvid is
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
  attribute SOFT_HLUTNM of \shift_blue[0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \shift_blue[1]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \shift_blue[2]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \shift_blue[3]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \shift_blue[4]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \shift_blue[5]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \shift_blue[6]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \shift_blue[7]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \shift_blue[8]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \shift_blue[9]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \shift_green[0]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \shift_green[1]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \shift_green[2]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \shift_green[3]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \shift_green[4]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \shift_green[5]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \shift_green[6]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \shift_green[7]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \shift_green[8]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \shift_green[9]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \shift_red[0]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \shift_red[1]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \shift_red[2]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \shift_red[3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \shift_red[4]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \shift_red[5]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \shift_red[6]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \shift_red[7]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \shift_red[8]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \shift_red[9]_i_1\ : label is "soft_lutpair62";
begin
  EncodedB(9 downto 0) <= \^encodedb\(9 downto 0);
  EncodedG(9 downto 0) <= \^encodedg\(9 downto 0);
  EncodedR(9 downto 0) <= \^encodedr\(9 downto 0);
TDMS_encoder_blue: entity work.\MainDesign_dvid_0_0_TDMS_encoder__parameterized3\
     port map (
      EncodedB(9 downto 0) => \^encodedb\(9 downto 0),
      TERC4Character0(3 downto 0) => TERC4Character0(3 downto 0),
      blank => blank,
      blue_p(7 downto 0) => blue_p(7 downto 0),
      clk_pixel_x1 => clk_pixel_x1,
      controlChannel0Blue(1 downto 0) => controlChannel0Blue(1 downto 0),
      \e_reg[6]_0\ => TDMS_encoder_red_n_0,
      guardBandEnable => guardBandEnable,
      guardBandType => guardBandType,
      isTERC4Region => isTERC4Region
    );
TDMS_encoder_green: entity work.\MainDesign_dvid_0_0_TDMS_encoder__parameterized1\
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
TDMS_encoder_red: entity work.MainDesign_dvid_0_0_TDMS_encoder
     port map (
      EncodedR(9 downto 0) => \^encodedr\(9 downto 0),
      TERC4Character2(3 downto 0) => TERC4Character2(3 downto 0),
      blank => blank,
      clk_pixel_x1 => clk_pixel_x1,
      controlChannel2Red(1 downto 0) => controlChannel2Red(1 downto 0),
      guardBandEnable => guardBandEnable,
      guardBandType => guardBandType,
      isTERC4Region => isTERC4Region,
      isTERC4Region_0 => TDMS_encoder_red_n_0,
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
entity MainDesign_dvid_0_0 is
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
  attribute NotValidForBitStream of MainDesign_dvid_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_dvid_0_0 : entity is "MainDesign_dvid_0_0,dvid,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_dvid_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_dvid_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_dvid_0_0 : entity is "dvid,Vivado 2025.2";
end MainDesign_dvid_0_0;

architecture STRUCTURE of MainDesign_dvid_0_0 is
begin
U0: entity work.MainDesign_dvid_0_0_dvid
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
