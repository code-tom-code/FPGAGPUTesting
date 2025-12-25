-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:02:55 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_UNORM8ToFloat_0_0/MainDesign_UNORM8ToFloat_0_0_sim_netlist.vhdl
-- Design      : MainDesign_UNORM8ToFloat_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_UNORM8ToFloat_0_0_UNORM8ToFloat is
  port (
    FloatXOut : out STD_LOGIC_VECTOR ( 11 downto 0 );
    FloatYOut : out STD_LOGIC_VECTOR ( 11 downto 0 );
    FloatZOut : out STD_LOGIC_VECTOR ( 11 downto 0 );
    FloatWOut : out STD_LOGIC_VECTOR ( 11 downto 0 );
    D3DColorIn : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Enable : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_UNORM8ToFloat_0_0_UNORM8ToFloat : entity is "UNORM8ToFloat";
end MainDesign_UNORM8ToFloat_0_0_UNORM8ToFloat;

architecture STRUCTURE of MainDesign_UNORM8ToFloat_0_0_UNORM8ToFloat is
  signal \FloatWOut[16]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[17]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[18]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[19]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[19]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[20]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[20]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[21]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[21]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[21]_i_3_n_0\ : STD_LOGIC;
  signal \FloatWOut[22]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[22]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[23]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[23]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[23]_i_3_n_0\ : STD_LOGIC;
  signal \FloatWOut[24]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[24]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[25]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[25]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[26]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[26]_i_2_n_0\ : STD_LOGIC;
  signal \FloatWOut[29]_i_1_n_0\ : STD_LOGIC;
  signal \FloatWOut[29]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[16]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[17]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[19]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[19]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[20]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[21]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[21]_i_3_n_0\ : STD_LOGIC;
  signal \FloatXOut[22]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[22]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[23]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[23]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[23]_i_3_n_0\ : STD_LOGIC;
  signal \FloatXOut[24]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[24]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[25]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[25]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[26]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[26]_i_2_n_0\ : STD_LOGIC;
  signal \FloatXOut[29]_i_1_n_0\ : STD_LOGIC;
  signal \FloatXOut[29]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[16]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[17]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[18]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[19]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[19]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[20]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[20]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[21]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[21]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[21]_i_3_n_0\ : STD_LOGIC;
  signal \FloatYOut[22]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[22]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[23]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[23]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[23]_i_3_n_0\ : STD_LOGIC;
  signal \FloatYOut[24]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[24]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[25]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[25]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[26]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[26]_i_2_n_0\ : STD_LOGIC;
  signal \FloatYOut[29]_i_1_n_0\ : STD_LOGIC;
  signal \FloatYOut[29]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[16]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[17]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[18]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[19]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[19]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[20]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[20]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[21]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[21]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[21]_i_3_n_0\ : STD_LOGIC;
  signal \FloatZOut[22]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[22]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[22]_i_3_n_0\ : STD_LOGIC;
  signal \FloatZOut[23]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[23]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[23]_i_3_n_0\ : STD_LOGIC;
  signal \FloatZOut[24]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[24]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[25]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[26]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[26]_i_2_n_0\ : STD_LOGIC;
  signal \FloatZOut[29]_i_1_n_0\ : STD_LOGIC;
  signal \FloatZOut[29]_i_2_n_0\ : STD_LOGIC;
  signal \mantissaBits[0]_0\ : STD_LOGIC_VECTOR ( 21 downto 18 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FloatWOut[16]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FloatWOut[17]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FloatWOut[23]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FloatWOut[24]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FloatWOut[25]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FloatWOut[26]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FloatXOut[16]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FloatXOut[17]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FloatXOut[23]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FloatXOut[24]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FloatXOut[25]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FloatXOut[26]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FloatYOut[16]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FloatYOut[17]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FloatYOut[23]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FloatYOut[24]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \FloatYOut[25]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \FloatYOut[26]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FloatZOut[16]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FloatZOut[17]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FloatZOut[23]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FloatZOut[24]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FloatZOut[25]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FloatZOut[26]_i_1\ : label is "soft_lutpair6";
begin
\FloatWOut[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C00"
    )
        port map (
      I0 => D3DColorIn(30),
      I1 => D3DColorIn(31),
      I2 => \FloatWOut[23]_i_3_n_0\,
      I3 => D3DColorIn(24),
      O => \FloatWOut[16]_i_1_n_0\
    );
\FloatWOut[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6E224C00"
    )
        port map (
      I0 => D3DColorIn(30),
      I1 => D3DColorIn(31),
      I2 => \FloatWOut[23]_i_3_n_0\,
      I3 => D3DColorIn(25),
      I4 => D3DColorIn(24),
      O => \FloatWOut[17]_i_1_n_0\
    );
\FloatWOut[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(26),
      I1 => D3DColorIn(31),
      I2 => D3DColorIn(25),
      I3 => D3DColorIn(30),
      I4 => D3DColorIn(24),
      I5 => D3DColorIn(29),
      O => \FloatWOut[18]_i_1_n_0\
    );
\FloatWOut[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5BFB0B0B50F00000"
    )
        port map (
      I0 => D3DColorIn(30),
      I1 => \FloatWOut[29]_i_2_n_0\,
      I2 => D3DColorIn(31),
      I3 => \FloatWOut[23]_i_3_n_0\,
      I4 => D3DColorIn(27),
      I5 => \FloatWOut[19]_i_2_n_0\,
      O => \FloatWOut[19]_i_1_n_0\
    );
\FloatWOut[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(26),
      I1 => D3DColorIn(30),
      I2 => D3DColorIn(25),
      I3 => D3DColorIn(29),
      I4 => D3DColorIn(28),
      I5 => D3DColorIn(24),
      O => \FloatWOut[19]_i_2_n_0\
    );
\FloatWOut[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(28),
      I1 => D3DColorIn(31),
      I2 => D3DColorIn(27),
      I3 => D3DColorIn(30),
      I4 => \FloatWOut[20]_i_2_n_0\,
      O => \FloatWOut[20]_i_1_n_0\
    );
\FloatWOut[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8888888B888"
    )
        port map (
      I0 => D3DColorIn(26),
      I1 => D3DColorIn(29),
      I2 => D3DColorIn(24),
      I3 => D3DColorIn(27),
      I4 => D3DColorIn(28),
      I5 => D3DColorIn(25),
      O => \FloatWOut[20]_i_2_n_0\
    );
\FloatWOut[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A4040000"
    )
        port map (
      I0 => D3DColorIn(30),
      I1 => \FloatWOut[29]_i_2_n_0\,
      I2 => D3DColorIn(31),
      I3 => \FloatWOut[23]_i_3_n_0\,
      I4 => Enable,
      O => \FloatWOut[21]_i_1_n_0\
    );
\FloatWOut[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(31),
      I2 => D3DColorIn(28),
      I3 => D3DColorIn(30),
      I4 => \FloatWOut[21]_i_3_n_0\,
      O => \FloatWOut[21]_i_2_n_0\
    );
\FloatWOut[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5F5A0A0E5E0E0E0"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(25),
      I2 => D3DColorIn(27),
      I3 => D3DColorIn(24),
      I4 => D3DColorIn(26),
      I5 => D3DColorIn(28),
      O => \FloatWOut[21]_i_3_n_0\
    );
\FloatWOut[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BAB01A10AAA00A0"
    )
        port map (
      I0 => D3DColorIn(30),
      I1 => \FloatWOut[29]_i_2_n_0\,
      I2 => D3DColorIn(31),
      I3 => \FloatWOut[23]_i_3_n_0\,
      I4 => D3DColorIn(29),
      I5 => \FloatWOut[22]_i_2_n_0\,
      O => \FloatWOut[22]_i_1_n_0\
    );
\FloatWOut[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE55EE10EE44EE00"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(27),
      I2 => D3DColorIn(24),
      I3 => D3DColorIn(28),
      I4 => D3DColorIn(26),
      I5 => D3DColorIn(25),
      O => \FloatWOut[22]_i_2_n_0\
    );
\FloatWOut[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0AA"
    )
        port map (
      I0 => \FloatWOut[23]_i_2_n_0\,
      I1 => D3DColorIn(30),
      I2 => \FloatWOut[23]_i_3_n_0\,
      I3 => D3DColorIn(31),
      O => \FloatWOut[23]_i_1_n_0\
    );
\FloatWOut[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55105511"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(27),
      I2 => D3DColorIn(26),
      I3 => D3DColorIn(28),
      I4 => D3DColorIn(25),
      I5 => D3DColorIn(30),
      O => \FloatWOut[23]_i_2_n_0\
    );
\FloatWOut[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => D3DColorIn(27),
      I1 => D3DColorIn(25),
      I2 => D3DColorIn(26),
      I3 => D3DColorIn(28),
      I4 => D3DColorIn(24),
      I5 => D3DColorIn(29),
      O => \FloatWOut[23]_i_3_n_0\
    );
\FloatWOut[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatWOut[24]_i_2_n_0\,
      I1 => D3DColorIn(31),
      O => \FloatWOut[24]_i_1_n_0\
    );
\FloatWOut[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555051"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(26),
      I2 => D3DColorIn(28),
      I3 => D3DColorIn(25),
      I4 => D3DColorIn(27),
      I5 => D3DColorIn(30),
      O => \FloatWOut[24]_i_2_n_0\
    );
\FloatWOut[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatWOut[25]_i_2_n_0\,
      I1 => D3DColorIn(31),
      O => \FloatWOut[25]_i_1_n_0\
    );
\FloatWOut[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAAB"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(25),
      I2 => D3DColorIn(26),
      I3 => D3DColorIn(28),
      I4 => D3DColorIn(27),
      I5 => D3DColorIn(30),
      O => \FloatWOut[25]_i_2_n_0\
    );
\FloatWOut[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatWOut[26]_i_2_n_0\,
      I1 => D3DColorIn(31),
      O => \FloatWOut[26]_i_1_n_0\
    );
\FloatWOut[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => D3DColorIn(29),
      I1 => D3DColorIn(25),
      I2 => D3DColorIn(28),
      I3 => D3DColorIn(26),
      I4 => D3DColorIn(27),
      I5 => D3DColorIn(30),
      O => \FloatWOut[26]_i_2_n_0\
    );
\FloatWOut[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => D3DColorIn(31),
      I1 => \FloatWOut[29]_i_2_n_0\,
      I2 => D3DColorIn(30),
      I3 => Enable,
      O => \FloatWOut[29]_i_1_n_0\
    );
\FloatWOut[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => D3DColorIn(27),
      I1 => D3DColorIn(25),
      I2 => D3DColorIn(26),
      I3 => D3DColorIn(28),
      I4 => D3DColorIn(24),
      I5 => D3DColorIn(29),
      O => \FloatWOut[29]_i_2_n_0\
    );
\FloatWOut_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[16]_i_1_n_0\,
      Q => FloatWOut(0),
      R => '0'
    );
\FloatWOut_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[17]_i_1_n_0\,
      Q => FloatWOut(1),
      R => '0'
    );
\FloatWOut_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[18]_i_1_n_0\,
      Q => FloatWOut(2),
      R => \FloatWOut[21]_i_1_n_0\
    );
\FloatWOut_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[19]_i_1_n_0\,
      Q => FloatWOut(3),
      R => '0'
    );
\FloatWOut_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[20]_i_1_n_0\,
      Q => FloatWOut(4),
      R => \FloatWOut[21]_i_1_n_0\
    );
\FloatWOut_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[21]_i_2_n_0\,
      Q => FloatWOut(5),
      R => \FloatWOut[21]_i_1_n_0\
    );
\FloatWOut_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[22]_i_1_n_0\,
      Q => FloatWOut(6),
      R => '0'
    );
\FloatWOut_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[23]_i_1_n_0\,
      Q => FloatWOut(7),
      R => \FloatWOut[29]_i_1_n_0\
    );
\FloatWOut_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[24]_i_1_n_0\,
      Q => FloatWOut(8),
      R => \FloatWOut[29]_i_1_n_0\
    );
\FloatWOut_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[25]_i_1_n_0\,
      Q => FloatWOut(9),
      R => \FloatWOut[29]_i_1_n_0\
    );
\FloatWOut_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatWOut[26]_i_1_n_0\,
      Q => FloatWOut(10),
      R => \FloatWOut[29]_i_1_n_0\
    );
\FloatWOut_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => '1',
      Q => FloatWOut(11),
      R => \FloatWOut[29]_i_1_n_0\
    );
\FloatXOut[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C00"
    )
        port map (
      I0 => D3DColorIn(22),
      I1 => D3DColorIn(23),
      I2 => \FloatXOut[23]_i_3_n_0\,
      I3 => D3DColorIn(16),
      O => \FloatXOut[16]_i_1_n_0\
    );
\FloatXOut[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6E224C00"
    )
        port map (
      I0 => D3DColorIn(22),
      I1 => D3DColorIn(23),
      I2 => \FloatXOut[23]_i_3_n_0\,
      I3 => D3DColorIn(17),
      I4 => D3DColorIn(16),
      O => \FloatXOut[17]_i_1_n_0\
    );
\FloatXOut[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(18),
      I1 => D3DColorIn(23),
      I2 => D3DColorIn(17),
      I3 => D3DColorIn(22),
      I4 => D3DColorIn(16),
      I5 => D3DColorIn(21),
      O => \mantissaBits[0]_0\(18)
    );
\FloatXOut[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5BFB0B0B50F00000"
    )
        port map (
      I0 => D3DColorIn(22),
      I1 => \FloatXOut[29]_i_2_n_0\,
      I2 => D3DColorIn(23),
      I3 => \FloatXOut[23]_i_3_n_0\,
      I4 => D3DColorIn(19),
      I5 => \FloatXOut[19]_i_2_n_0\,
      O => \FloatXOut[19]_i_1_n_0\
    );
\FloatXOut[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(18),
      I1 => D3DColorIn(22),
      I2 => D3DColorIn(17),
      I3 => D3DColorIn(21),
      I4 => D3DColorIn(20),
      I5 => D3DColorIn(16),
      O => \FloatXOut[19]_i_2_n_0\
    );
\FloatXOut[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(20),
      I1 => D3DColorIn(23),
      I2 => D3DColorIn(19),
      I3 => D3DColorIn(22),
      I4 => \FloatXOut[20]_i_2_n_0\,
      O => \mantissaBits[0]_0\(20)
    );
\FloatXOut[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBB8888888B888"
    )
        port map (
      I0 => D3DColorIn(18),
      I1 => D3DColorIn(21),
      I2 => D3DColorIn(16),
      I3 => D3DColorIn(19),
      I4 => D3DColorIn(20),
      I5 => D3DColorIn(17),
      O => \FloatXOut[20]_i_2_n_0\
    );
\FloatXOut[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A4040000"
    )
        port map (
      I0 => D3DColorIn(22),
      I1 => \FloatXOut[29]_i_2_n_0\,
      I2 => D3DColorIn(23),
      I3 => \FloatXOut[23]_i_3_n_0\,
      I4 => Enable,
      O => \FloatXOut[21]_i_1_n_0\
    );
\FloatXOut[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(23),
      I2 => D3DColorIn(20),
      I3 => D3DColorIn(22),
      I4 => \FloatXOut[21]_i_3_n_0\,
      O => \mantissaBits[0]_0\(21)
    );
\FloatXOut[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5F5A0A0E5E0E0E0"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(17),
      I2 => D3DColorIn(19),
      I3 => D3DColorIn(16),
      I4 => D3DColorIn(18),
      I5 => D3DColorIn(20),
      O => \FloatXOut[21]_i_3_n_0\
    );
\FloatXOut[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BAB01A10AAA00A0"
    )
        port map (
      I0 => D3DColorIn(22),
      I1 => \FloatXOut[29]_i_2_n_0\,
      I2 => D3DColorIn(23),
      I3 => \FloatXOut[23]_i_3_n_0\,
      I4 => D3DColorIn(21),
      I5 => \FloatXOut[22]_i_2_n_0\,
      O => \FloatXOut[22]_i_1_n_0\
    );
\FloatXOut[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE55EE10EE44EE00"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(19),
      I2 => D3DColorIn(16),
      I3 => D3DColorIn(20),
      I4 => D3DColorIn(18),
      I5 => D3DColorIn(17),
      O => \FloatXOut[22]_i_2_n_0\
    );
\FloatXOut[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0AA"
    )
        port map (
      I0 => \FloatXOut[23]_i_2_n_0\,
      I1 => D3DColorIn(22),
      I2 => \FloatXOut[23]_i_3_n_0\,
      I3 => D3DColorIn(23),
      O => \FloatXOut[23]_i_1_n_0\
    );
\FloatXOut[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55105511"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(19),
      I2 => D3DColorIn(18),
      I3 => D3DColorIn(20),
      I4 => D3DColorIn(17),
      I5 => D3DColorIn(22),
      O => \FloatXOut[23]_i_2_n_0\
    );
\FloatXOut[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => D3DColorIn(19),
      I1 => D3DColorIn(17),
      I2 => D3DColorIn(18),
      I3 => D3DColorIn(20),
      I4 => D3DColorIn(16),
      I5 => D3DColorIn(21),
      O => \FloatXOut[23]_i_3_n_0\
    );
\FloatXOut[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatXOut[24]_i_2_n_0\,
      I1 => D3DColorIn(23),
      O => \FloatXOut[24]_i_1_n_0\
    );
\FloatXOut[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555051"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(18),
      I2 => D3DColorIn(20),
      I3 => D3DColorIn(17),
      I4 => D3DColorIn(19),
      I5 => D3DColorIn(22),
      O => \FloatXOut[24]_i_2_n_0\
    );
\FloatXOut[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatXOut[25]_i_2_n_0\,
      I1 => D3DColorIn(23),
      O => \FloatXOut[25]_i_1_n_0\
    );
\FloatXOut[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAAB"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(17),
      I2 => D3DColorIn(18),
      I3 => D3DColorIn(20),
      I4 => D3DColorIn(19),
      I5 => D3DColorIn(22),
      O => \FloatXOut[25]_i_2_n_0\
    );
\FloatXOut[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatXOut[26]_i_2_n_0\,
      I1 => D3DColorIn(23),
      O => \FloatXOut[26]_i_1_n_0\
    );
\FloatXOut[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => D3DColorIn(21),
      I1 => D3DColorIn(17),
      I2 => D3DColorIn(20),
      I3 => D3DColorIn(18),
      I4 => D3DColorIn(19),
      I5 => D3DColorIn(22),
      O => \FloatXOut[26]_i_2_n_0\
    );
\FloatXOut[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => D3DColorIn(23),
      I1 => \FloatXOut[29]_i_2_n_0\,
      I2 => D3DColorIn(22),
      I3 => Enable,
      O => \FloatXOut[29]_i_1_n_0\
    );
\FloatXOut[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => D3DColorIn(19),
      I1 => D3DColorIn(17),
      I2 => D3DColorIn(18),
      I3 => D3DColorIn(20),
      I4 => D3DColorIn(16),
      I5 => D3DColorIn(21),
      O => \FloatXOut[29]_i_2_n_0\
    );
\FloatXOut_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[16]_i_1_n_0\,
      Q => FloatXOut(0),
      R => '0'
    );
\FloatXOut_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[17]_i_1_n_0\,
      Q => FloatXOut(1),
      R => '0'
    );
\FloatXOut_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \mantissaBits[0]_0\(18),
      Q => FloatXOut(2),
      R => \FloatXOut[21]_i_1_n_0\
    );
\FloatXOut_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[19]_i_1_n_0\,
      Q => FloatXOut(3),
      R => '0'
    );
\FloatXOut_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \mantissaBits[0]_0\(20),
      Q => FloatXOut(4),
      R => \FloatXOut[21]_i_1_n_0\
    );
\FloatXOut_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \mantissaBits[0]_0\(21),
      Q => FloatXOut(5),
      R => \FloatXOut[21]_i_1_n_0\
    );
\FloatXOut_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[22]_i_1_n_0\,
      Q => FloatXOut(6),
      R => '0'
    );
\FloatXOut_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[23]_i_1_n_0\,
      Q => FloatXOut(7),
      R => \FloatXOut[29]_i_1_n_0\
    );
\FloatXOut_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[24]_i_1_n_0\,
      Q => FloatXOut(8),
      R => \FloatXOut[29]_i_1_n_0\
    );
\FloatXOut_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[25]_i_1_n_0\,
      Q => FloatXOut(9),
      R => \FloatXOut[29]_i_1_n_0\
    );
\FloatXOut_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatXOut[26]_i_1_n_0\,
      Q => FloatXOut(10),
      R => \FloatXOut[29]_i_1_n_0\
    );
\FloatXOut_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => '1',
      Q => FloatXOut(11),
      R => \FloatXOut[29]_i_1_n_0\
    );
\FloatYOut[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C00"
    )
        port map (
      I0 => D3DColorIn(14),
      I1 => D3DColorIn(15),
      I2 => \FloatYOut[23]_i_3_n_0\,
      I3 => D3DColorIn(8),
      O => \FloatYOut[16]_i_1_n_0\
    );
\FloatYOut[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6E224C00"
    )
        port map (
      I0 => D3DColorIn(14),
      I1 => D3DColorIn(15),
      I2 => \FloatYOut[23]_i_3_n_0\,
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(8),
      O => \FloatYOut[17]_i_1_n_0\
    );
\FloatYOut[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(10),
      I1 => D3DColorIn(15),
      I2 => D3DColorIn(9),
      I3 => D3DColorIn(14),
      I4 => D3DColorIn(8),
      I5 => D3DColorIn(13),
      O => \FloatYOut[18]_i_1_n_0\
    );
\FloatYOut[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5BFB0B0B50F00000"
    )
        port map (
      I0 => D3DColorIn(14),
      I1 => \FloatYOut[29]_i_2_n_0\,
      I2 => D3DColorIn(15),
      I3 => \FloatYOut[23]_i_3_n_0\,
      I4 => D3DColorIn(11),
      I5 => \FloatYOut[19]_i_2_n_0\,
      O => \FloatYOut[19]_i_1_n_0\
    );
\FloatYOut[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(10),
      I1 => D3DColorIn(14),
      I2 => D3DColorIn(9),
      I3 => D3DColorIn(13),
      I4 => D3DColorIn(8),
      I5 => D3DColorIn(12),
      O => \FloatYOut[19]_i_2_n_0\
    );
\FloatYOut[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(12),
      I1 => D3DColorIn(15),
      I2 => D3DColorIn(11),
      I3 => D3DColorIn(14),
      I4 => \FloatYOut[20]_i_2_n_0\,
      O => \FloatYOut[20]_i_1_n_0\
    );
\FloatYOut[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(10),
      I1 => D3DColorIn(13),
      I2 => D3DColorIn(9),
      I3 => D3DColorIn(12),
      I4 => D3DColorIn(11),
      I5 => D3DColorIn(8),
      O => \FloatYOut[20]_i_2_n_0\
    );
\FloatYOut[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A4040000"
    )
        port map (
      I0 => D3DColorIn(14),
      I1 => \FloatYOut[29]_i_2_n_0\,
      I2 => D3DColorIn(15),
      I3 => \FloatYOut[23]_i_3_n_0\,
      I4 => Enable,
      O => \FloatYOut[21]_i_1_n_0\
    );
\FloatYOut[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(15),
      I2 => D3DColorIn(12),
      I3 => D3DColorIn(14),
      I4 => \FloatYOut[21]_i_3_n_0\,
      O => \FloatYOut[21]_i_2_n_0\
    );
\FloatYOut[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBEAEA50405040"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(12),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(8),
      I4 => D3DColorIn(9),
      I5 => D3DColorIn(11),
      O => \FloatYOut[21]_i_3_n_0\
    );
\FloatYOut[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BAB01A10AAA00A0"
    )
        port map (
      I0 => D3DColorIn(14),
      I1 => \FloatYOut[29]_i_2_n_0\,
      I2 => D3DColorIn(15),
      I3 => \FloatYOut[23]_i_3_n_0\,
      I4 => D3DColorIn(13),
      I5 => \FloatYOut[22]_i_2_n_0\,
      O => \FloatYOut[22]_i_1_n_0\
    );
\FloatYOut[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD99CC98DD88CC88"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(12),
      I2 => D3DColorIn(8),
      I3 => D3DColorIn(11),
      I4 => D3DColorIn(10),
      I5 => D3DColorIn(9),
      O => \FloatYOut[22]_i_2_n_0\
    );
\FloatYOut[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0AA"
    )
        port map (
      I0 => \FloatYOut[23]_i_2_n_0\,
      I1 => D3DColorIn(14),
      I2 => \FloatYOut[23]_i_3_n_0\,
      I3 => D3DColorIn(15),
      O => \FloatYOut[23]_i_1_n_0\
    );
\FloatYOut[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(12),
      I5 => D3DColorIn(14),
      O => \FloatYOut[23]_i_2_n_0\
    );
\FloatYOut[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => D3DColorIn(12),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(8),
      I5 => D3DColorIn(13),
      O => \FloatYOut[23]_i_3_n_0\
    );
\FloatYOut[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatYOut[24]_i_2_n_0\,
      I1 => D3DColorIn(15),
      O => \FloatYOut[24]_i_1_n_0\
    );
\FloatYOut[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055554445"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(12),
      I5 => D3DColorIn(14),
      O => \FloatYOut[24]_i_2_n_0\
    );
\FloatYOut[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatYOut[25]_i_2_n_0\,
      I1 => D3DColorIn(15),
      O => \FloatYOut[25]_i_1_n_0\
    );
\FloatYOut[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAAB"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(12),
      I5 => D3DColorIn(14),
      O => \FloatYOut[25]_i_2_n_0\
    );
\FloatYOut[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatYOut[26]_i_2_n_0\,
      I1 => D3DColorIn(15),
      O => \FloatYOut[26]_i_1_n_0\
    );
\FloatYOut[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => D3DColorIn(13),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(9),
      I3 => D3DColorIn(10),
      I4 => D3DColorIn(12),
      I5 => D3DColorIn(14),
      O => \FloatYOut[26]_i_2_n_0\
    );
\FloatYOut[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => D3DColorIn(15),
      I1 => \FloatYOut[29]_i_2_n_0\,
      I2 => D3DColorIn(14),
      I3 => Enable,
      O => \FloatYOut[29]_i_1_n_0\
    );
\FloatYOut[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => D3DColorIn(12),
      I1 => D3DColorIn(11),
      I2 => D3DColorIn(10),
      I3 => D3DColorIn(9),
      I4 => D3DColorIn(8),
      I5 => D3DColorIn(13),
      O => \FloatYOut[29]_i_2_n_0\
    );
\FloatYOut_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[16]_i_1_n_0\,
      Q => FloatYOut(0),
      R => '0'
    );
\FloatYOut_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[17]_i_1_n_0\,
      Q => FloatYOut(1),
      R => '0'
    );
\FloatYOut_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[18]_i_1_n_0\,
      Q => FloatYOut(2),
      R => \FloatYOut[21]_i_1_n_0\
    );
\FloatYOut_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[19]_i_1_n_0\,
      Q => FloatYOut(3),
      R => '0'
    );
\FloatYOut_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[20]_i_1_n_0\,
      Q => FloatYOut(4),
      R => \FloatYOut[21]_i_1_n_0\
    );
\FloatYOut_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[21]_i_2_n_0\,
      Q => FloatYOut(5),
      R => \FloatYOut[21]_i_1_n_0\
    );
\FloatYOut_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[22]_i_1_n_0\,
      Q => FloatYOut(6),
      R => '0'
    );
\FloatYOut_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[23]_i_1_n_0\,
      Q => FloatYOut(7),
      R => \FloatYOut[29]_i_1_n_0\
    );
\FloatYOut_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[24]_i_1_n_0\,
      Q => FloatYOut(8),
      R => \FloatYOut[29]_i_1_n_0\
    );
\FloatYOut_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[25]_i_1_n_0\,
      Q => FloatYOut(9),
      R => \FloatYOut[29]_i_1_n_0\
    );
\FloatYOut_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatYOut[26]_i_1_n_0\,
      Q => FloatYOut(10),
      R => \FloatYOut[29]_i_1_n_0\
    );
\FloatYOut_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => '1',
      Q => FloatYOut(11),
      R => \FloatYOut[29]_i_1_n_0\
    );
\FloatZOut[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C00"
    )
        port map (
      I0 => D3DColorIn(6),
      I1 => D3DColorIn(7),
      I2 => \FloatZOut[23]_i_3_n_0\,
      I3 => D3DColorIn(0),
      O => \FloatZOut[16]_i_1_n_0\
    );
\FloatZOut[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6E224C00"
    )
        port map (
      I0 => D3DColorIn(6),
      I1 => D3DColorIn(7),
      I2 => \FloatZOut[23]_i_3_n_0\,
      I3 => D3DColorIn(1),
      I4 => D3DColorIn(0),
      O => \FloatZOut[17]_i_1_n_0\
    );
\FloatZOut[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(2),
      I1 => D3DColorIn(7),
      I2 => D3DColorIn(1),
      I3 => D3DColorIn(6),
      I4 => D3DColorIn(0),
      I5 => D3DColorIn(5),
      O => \FloatZOut[18]_i_1_n_0\
    );
\FloatZOut[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5BFB0B0B50F00000"
    )
        port map (
      I0 => D3DColorIn(6),
      I1 => \FloatZOut[22]_i_2_n_0\,
      I2 => D3DColorIn(7),
      I3 => \FloatZOut[23]_i_3_n_0\,
      I4 => D3DColorIn(3),
      I5 => \FloatZOut[19]_i_2_n_0\,
      O => \FloatZOut[19]_i_1_n_0\
    );
\FloatZOut[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => D3DColorIn(2),
      I1 => D3DColorIn(6),
      I2 => D3DColorIn(1),
      I3 => D3DColorIn(5),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(0),
      O => \FloatZOut[19]_i_2_n_0\
    );
\FloatZOut[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(4),
      I1 => D3DColorIn(7),
      I2 => D3DColorIn(3),
      I3 => D3DColorIn(6),
      I4 => \FloatZOut[20]_i_2_n_0\,
      O => \FloatZOut[20]_i_1_n_0\
    );
\FloatZOut[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBB8888B888B888"
    )
        port map (
      I0 => D3DColorIn(2),
      I1 => D3DColorIn(5),
      I2 => D3DColorIn(3),
      I3 => D3DColorIn(0),
      I4 => D3DColorIn(1),
      I5 => D3DColorIn(4),
      O => \FloatZOut[20]_i_2_n_0\
    );
\FloatZOut[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A4040000"
    )
        port map (
      I0 => D3DColorIn(6),
      I1 => \FloatZOut[22]_i_2_n_0\,
      I2 => D3DColorIn(7),
      I3 => \FloatZOut[23]_i_3_n_0\,
      I4 => Enable,
      O => \FloatZOut[21]_i_1_n_0\
    );
\FloatZOut[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(7),
      I2 => D3DColorIn(4),
      I3 => D3DColorIn(6),
      I4 => \FloatZOut[21]_i_3_n_0\,
      O => \FloatZOut[21]_i_2_n_0\
    );
\FloatZOut[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFFFAAA50405040"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(0),
      I2 => D3DColorIn(2),
      I3 => D3DColorIn(4),
      I4 => D3DColorIn(1),
      I5 => D3DColorIn(3),
      O => \FloatZOut[21]_i_3_n_0\
    );
\FloatZOut[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0BAB01A10AAA00A0"
    )
        port map (
      I0 => D3DColorIn(6),
      I1 => \FloatZOut[22]_i_2_n_0\,
      I2 => D3DColorIn(7),
      I3 => \FloatZOut[23]_i_3_n_0\,
      I4 => D3DColorIn(5),
      I5 => \FloatZOut[22]_i_3_n_0\,
      O => \FloatZOut[22]_i_1_n_0\
    );
\FloatZOut[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => D3DColorIn(0),
      I1 => D3DColorIn(3),
      I2 => D3DColorIn(2),
      I3 => D3DColorIn(1),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(5),
      O => \FloatZOut[22]_i_2_n_0\
    );
\FloatZOut[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5A5F0A4F5A0F0A0"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(0),
      I2 => D3DColorIn(4),
      I3 => D3DColorIn(3),
      I4 => D3DColorIn(2),
      I5 => D3DColorIn(1),
      O => \FloatZOut[22]_i_3_n_0\
    );
\FloatZOut[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C0AA"
    )
        port map (
      I0 => \FloatZOut[23]_i_2_n_0\,
      I1 => D3DColorIn(6),
      I2 => \FloatZOut[23]_i_3_n_0\,
      I3 => D3DColorIn(7),
      O => \FloatZOut[23]_i_1_n_0\
    );
\FloatZOut[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(3),
      I2 => D3DColorIn(2),
      I3 => D3DColorIn(1),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(6),
      O => \FloatZOut[23]_i_2_n_0\
    );
\FloatZOut[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => D3DColorIn(0),
      I1 => D3DColorIn(3),
      I2 => D3DColorIn(2),
      I3 => D3DColorIn(1),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(5),
      O => \FloatZOut[23]_i_3_n_0\
    );
\FloatZOut[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatZOut[24]_i_2_n_0\,
      I1 => D3DColorIn(7),
      O => \FloatZOut[24]_i_1_n_0\
    );
\FloatZOut[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055554445"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(3),
      I2 => D3DColorIn(2),
      I3 => D3DColorIn(1),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(6),
      O => \FloatZOut[24]_i_2_n_0\
    );
\FloatZOut[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => \FloatZOut[29]_i_2_n_0\,
      I2 => D3DColorIn(6),
      I3 => D3DColorIn(7),
      O => \FloatZOut[25]_i_1_n_0\
    );
\FloatZOut[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FloatZOut[26]_i_2_n_0\,
      I1 => D3DColorIn(7),
      O => \FloatZOut[26]_i_1_n_0\
    );
\FloatZOut[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => D3DColorIn(5),
      I1 => D3DColorIn(3),
      I2 => D3DColorIn(1),
      I3 => D3DColorIn(2),
      I4 => D3DColorIn(4),
      I5 => D3DColorIn(6),
      O => \FloatZOut[26]_i_2_n_0\
    );
\FloatZOut[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => D3DColorIn(7),
      I1 => D3DColorIn(5),
      I2 => \FloatZOut[29]_i_2_n_0\,
      I3 => D3DColorIn(0),
      I4 => D3DColorIn(6),
      I5 => Enable,
      O => \FloatZOut[29]_i_1_n_0\
    );
\FloatZOut[29]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => D3DColorIn(3),
      I1 => D3DColorIn(2),
      I2 => D3DColorIn(1),
      I3 => D3DColorIn(4),
      O => \FloatZOut[29]_i_2_n_0\
    );
\FloatZOut_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[16]_i_1_n_0\,
      Q => FloatZOut(0),
      R => '0'
    );
\FloatZOut_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[17]_i_1_n_0\,
      Q => FloatZOut(1),
      R => '0'
    );
\FloatZOut_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[18]_i_1_n_0\,
      Q => FloatZOut(2),
      R => \FloatZOut[21]_i_1_n_0\
    );
\FloatZOut_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[19]_i_1_n_0\,
      Q => FloatZOut(3),
      R => '0'
    );
\FloatZOut_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[20]_i_1_n_0\,
      Q => FloatZOut(4),
      R => \FloatZOut[21]_i_1_n_0\
    );
\FloatZOut_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[21]_i_2_n_0\,
      Q => FloatZOut(5),
      R => \FloatZOut[21]_i_1_n_0\
    );
\FloatZOut_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[22]_i_1_n_0\,
      Q => FloatZOut(6),
      R => '0'
    );
\FloatZOut_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[23]_i_1_n_0\,
      Q => FloatZOut(7),
      R => \FloatZOut[29]_i_1_n_0\
    );
\FloatZOut_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[24]_i_1_n_0\,
      Q => FloatZOut(8),
      R => \FloatZOut[29]_i_1_n_0\
    );
\FloatZOut_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[25]_i_1_n_0\,
      Q => FloatZOut(9),
      R => \FloatZOut[29]_i_1_n_0\
    );
\FloatZOut_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => \FloatZOut[26]_i_1_n_0\,
      Q => FloatZOut(10),
      R => \FloatZOut[29]_i_1_n_0\
    );
\FloatZOut_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => Enable,
      D => '1',
      Q => FloatZOut(11),
      R => \FloatZOut[29]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_UNORM8ToFloat_0_0 is
  port (
    clk : in STD_LOGIC;
    Enable : in STD_LOGIC;
    D3DColorIn : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatXOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatYOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatZOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatWOut : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_UNORM8ToFloat_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_UNORM8ToFloat_0_0 : entity is "MainDesign_UNORM8ToFloat_0_0,UNORM8ToFloat,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_UNORM8ToFloat_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_UNORM8ToFloat_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_UNORM8ToFloat_0_0 : entity is "UNORM8ToFloat,Vivado 2025.2";
end MainDesign_UNORM8ToFloat_0_0;

architecture STRUCTURE of MainDesign_UNORM8ToFloat_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^floatwout\ : STD_LOGIC_VECTOR ( 28 downto 16 );
  signal \^floatxout\ : STD_LOGIC_VECTOR ( 28 downto 16 );
  signal \^floatyout\ : STD_LOGIC_VECTOR ( 28 downto 16 );
  signal \^floatzout\ : STD_LOGIC_VECTOR ( 28 downto 16 );
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
  FloatWOut(31) <= \<const0>\;
  FloatWOut(30) <= \<const0>\;
  FloatWOut(29) <= \^floatwout\(28);
  FloatWOut(28) <= \^floatwout\(28);
  FloatWOut(27) <= \^floatwout\(28);
  FloatWOut(26 downto 16) <= \^floatwout\(26 downto 16);
  FloatWOut(15) <= \<const0>\;
  FloatWOut(14) <= \<const0>\;
  FloatWOut(13) <= \<const0>\;
  FloatWOut(12) <= \<const0>\;
  FloatWOut(11) <= \<const0>\;
  FloatWOut(10) <= \<const0>\;
  FloatWOut(9) <= \<const0>\;
  FloatWOut(8) <= \<const0>\;
  FloatWOut(7) <= \<const0>\;
  FloatWOut(6) <= \<const0>\;
  FloatWOut(5) <= \<const0>\;
  FloatWOut(4) <= \<const0>\;
  FloatWOut(3) <= \<const0>\;
  FloatWOut(2) <= \<const0>\;
  FloatWOut(1) <= \<const0>\;
  FloatWOut(0) <= \<const0>\;
  FloatXOut(31) <= \<const0>\;
  FloatXOut(30) <= \<const0>\;
  FloatXOut(29) <= \^floatxout\(28);
  FloatXOut(28) <= \^floatxout\(28);
  FloatXOut(27) <= \^floatxout\(28);
  FloatXOut(26 downto 16) <= \^floatxout\(26 downto 16);
  FloatXOut(15) <= \<const0>\;
  FloatXOut(14) <= \<const0>\;
  FloatXOut(13) <= \<const0>\;
  FloatXOut(12) <= \<const0>\;
  FloatXOut(11) <= \<const0>\;
  FloatXOut(10) <= \<const0>\;
  FloatXOut(9) <= \<const0>\;
  FloatXOut(8) <= \<const0>\;
  FloatXOut(7) <= \<const0>\;
  FloatXOut(6) <= \<const0>\;
  FloatXOut(5) <= \<const0>\;
  FloatXOut(4) <= \<const0>\;
  FloatXOut(3) <= \<const0>\;
  FloatXOut(2) <= \<const0>\;
  FloatXOut(1) <= \<const0>\;
  FloatXOut(0) <= \<const0>\;
  FloatYOut(31) <= \<const0>\;
  FloatYOut(30) <= \<const0>\;
  FloatYOut(29) <= \^floatyout\(28);
  FloatYOut(28) <= \^floatyout\(28);
  FloatYOut(27) <= \^floatyout\(28);
  FloatYOut(26 downto 16) <= \^floatyout\(26 downto 16);
  FloatYOut(15) <= \<const0>\;
  FloatYOut(14) <= \<const0>\;
  FloatYOut(13) <= \<const0>\;
  FloatYOut(12) <= \<const0>\;
  FloatYOut(11) <= \<const0>\;
  FloatYOut(10) <= \<const0>\;
  FloatYOut(9) <= \<const0>\;
  FloatYOut(8) <= \<const0>\;
  FloatYOut(7) <= \<const0>\;
  FloatYOut(6) <= \<const0>\;
  FloatYOut(5) <= \<const0>\;
  FloatYOut(4) <= \<const0>\;
  FloatYOut(3) <= \<const0>\;
  FloatYOut(2) <= \<const0>\;
  FloatYOut(1) <= \<const0>\;
  FloatYOut(0) <= \<const0>\;
  FloatZOut(31) <= \<const0>\;
  FloatZOut(30) <= \<const0>\;
  FloatZOut(29) <= \^floatzout\(28);
  FloatZOut(28) <= \^floatzout\(28);
  FloatZOut(27) <= \^floatzout\(28);
  FloatZOut(26 downto 16) <= \^floatzout\(26 downto 16);
  FloatZOut(15) <= \<const0>\;
  FloatZOut(14) <= \<const0>\;
  FloatZOut(13) <= \<const0>\;
  FloatZOut(12) <= \<const0>\;
  FloatZOut(11) <= \<const0>\;
  FloatZOut(10) <= \<const0>\;
  FloatZOut(9) <= \<const0>\;
  FloatZOut(8) <= \<const0>\;
  FloatZOut(7) <= \<const0>\;
  FloatZOut(6) <= \<const0>\;
  FloatZOut(5) <= \<const0>\;
  FloatZOut(4) <= \<const0>\;
  FloatZOut(3) <= \<const0>\;
  FloatZOut(2) <= \<const0>\;
  FloatZOut(1) <= \<const0>\;
  FloatZOut(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.MainDesign_UNORM8ToFloat_0_0_UNORM8ToFloat
     port map (
      D3DColorIn(31 downto 0) => D3DColorIn(31 downto 0),
      Enable => Enable,
      FloatWOut(11) => \^floatwout\(28),
      FloatWOut(10 downto 0) => \^floatwout\(26 downto 16),
      FloatXOut(11) => \^floatxout\(28),
      FloatXOut(10 downto 0) => \^floatxout\(26 downto 16),
      FloatYOut(11) => \^floatyout\(28),
      FloatYOut(10 downto 0) => \^floatyout\(26 downto 16),
      FloatZOut(11) => \^floatzout\(28),
      FloatZOut(10 downto 0) => \^floatzout\(26 downto 16),
      clk => clk
    );
end STRUCTURE;
