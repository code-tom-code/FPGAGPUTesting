-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:03:57 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StatsDataSampler_0_0/MainDesign_StatsDataSampler_0_0_sim_netlist.vhdl
-- Design      : MainDesign_StatsDataSampler_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StatsDataSampler_0_0_StatsDataSampler is
  port (
    STAT_CurrentWriteIndex : out STD_LOGIC_VECTOR ( 9 downto 0 );
    SamplingCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    STAT_Reset : in STD_LOGIC;
    STAT_SamplingIntervalCycles : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StatsDataSampler_0_0_StatsDataSampler : entity is "StatsDataSampler";
end MainDesign_StatsDataSampler_0_0_StatsDataSampler;

architecture STRUCTURE of MainDesign_StatsDataSampler_0_0_StatsDataSampler is
  signal \^stat_currentwriteindex\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \SamplingCache_wea0_carry__0_n_5\ : STD_LOGIC;
  signal \SamplingCache_wea0_carry__0_n_6\ : STD_LOGIC;
  signal \SamplingCache_wea0_carry__0_n_7\ : STD_LOGIC;
  signal \SamplingCache_wea0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_1_n_0 : STD_LOGIC;
  signal \SamplingCache_wea0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_2_n_0 : STD_LOGIC;
  signal \SamplingCache_wea0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_3_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_4_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_5_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_6_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_7_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_i_8_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_0 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_1 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_2 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_3 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_4 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_5 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_6 : STD_LOGIC;
  signal SamplingCache_wea0_carry_n_7 : STD_LOGIC;
  signal \SamplingCache_wea[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentCycle[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentCycle[0]_i_3_n_0\ : STD_LOGIC;
  signal currentCycle_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \currentCycle_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \currentCycle_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \currentCycle_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \currentCycle_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \currentCycle_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal \currentWriteIndex[9]_i_2_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal samplingInterval_cycles : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_SamplingCache_wea0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_SamplingCache_wea0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_SamplingCache_wea0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_currentCycle_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute x_interface_info : string;
  attribute x_interface_info of \SamplingCache_wea_reg[0]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache WE";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \currentCycle_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \currentCycle_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \currentCycle_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \currentCycle_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \currentWriteIndex[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \currentWriteIndex[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \currentWriteIndex[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentWriteIndex[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \currentWriteIndex[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \currentWriteIndex[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \currentWriteIndex[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \currentWriteIndex[9]_i_1\ : label is "soft_lutpair0";
  attribute x_interface_info of \currentWriteIndex_reg[0]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[1]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[2]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[3]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[4]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[5]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[6]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[7]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[8]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of \currentWriteIndex_reg[9]\ : label is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
begin
  STAT_CurrentWriteIndex(9 downto 0) <= \^stat_currentwriteindex\(9 downto 0);
SamplingCache_wea0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => SamplingCache_wea0_carry_n_0,
      CO(6) => SamplingCache_wea0_carry_n_1,
      CO(5) => SamplingCache_wea0_carry_n_2,
      CO(4) => SamplingCache_wea0_carry_n_3,
      CO(3) => SamplingCache_wea0_carry_n_4,
      CO(2) => SamplingCache_wea0_carry_n_5,
      CO(1) => SamplingCache_wea0_carry_n_6,
      CO(0) => SamplingCache_wea0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_SamplingCache_wea0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => SamplingCache_wea0_carry_i_1_n_0,
      S(6) => SamplingCache_wea0_carry_i_2_n_0,
      S(5) => SamplingCache_wea0_carry_i_3_n_0,
      S(4) => SamplingCache_wea0_carry_i_4_n_0,
      S(3) => SamplingCache_wea0_carry_i_5_n_0,
      S(2) => SamplingCache_wea0_carry_i_6_n_0,
      S(1) => SamplingCache_wea0_carry_i_7_n_0,
      S(0) => SamplingCache_wea0_carry_i_8_n_0
    );
\SamplingCache_wea0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => SamplingCache_wea0_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_SamplingCache_wea0_carry__0_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \SamplingCache_wea0_carry__0_n_5\,
      CO(1) => \SamplingCache_wea0_carry__0_n_6\,
      CO(0) => \SamplingCache_wea0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_SamplingCache_wea0_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 3) => B"00000",
      S(2) => \SamplingCache_wea0_carry_i_1__0_n_0\,
      S(1) => \SamplingCache_wea0_carry_i_2__0_n_0\,
      S(0) => \SamplingCache_wea0_carry_i_3__0_n_0\
    );
SamplingCache_wea0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(21),
      I1 => samplingInterval_cycles(21),
      I2 => samplingInterval_cycles(23),
      I3 => currentCycle_reg(23),
      I4 => samplingInterval_cycles(22),
      I5 => currentCycle_reg(22),
      O => SamplingCache_wea0_carry_i_1_n_0
    );
\SamplingCache_wea0_carry_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => currentCycle_reg(30),
      I1 => samplingInterval_cycles(30),
      I2 => currentCycle_reg(31),
      I3 => samplingInterval_cycles(31),
      O => \SamplingCache_wea0_carry_i_1__0_n_0\
    );
SamplingCache_wea0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(18),
      I1 => samplingInterval_cycles(18),
      I2 => samplingInterval_cycles(20),
      I3 => currentCycle_reg(20),
      I4 => samplingInterval_cycles(19),
      I5 => currentCycle_reg(19),
      O => SamplingCache_wea0_carry_i_2_n_0
    );
\SamplingCache_wea0_carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(27),
      I1 => samplingInterval_cycles(27),
      I2 => samplingInterval_cycles(29),
      I3 => currentCycle_reg(29),
      I4 => samplingInterval_cycles(28),
      I5 => currentCycle_reg(28),
      O => \SamplingCache_wea0_carry_i_2__0_n_0\
    );
SamplingCache_wea0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(15),
      I1 => samplingInterval_cycles(15),
      I2 => samplingInterval_cycles(17),
      I3 => currentCycle_reg(17),
      I4 => samplingInterval_cycles(16),
      I5 => currentCycle_reg(16),
      O => SamplingCache_wea0_carry_i_3_n_0
    );
\SamplingCache_wea0_carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(24),
      I1 => samplingInterval_cycles(24),
      I2 => samplingInterval_cycles(26),
      I3 => currentCycle_reg(26),
      I4 => samplingInterval_cycles(25),
      I5 => currentCycle_reg(25),
      O => \SamplingCache_wea0_carry_i_3__0_n_0\
    );
SamplingCache_wea0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(12),
      I1 => samplingInterval_cycles(12),
      I2 => samplingInterval_cycles(14),
      I3 => currentCycle_reg(14),
      I4 => samplingInterval_cycles(13),
      I5 => currentCycle_reg(13),
      O => SamplingCache_wea0_carry_i_4_n_0
    );
SamplingCache_wea0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(9),
      I1 => samplingInterval_cycles(9),
      I2 => samplingInterval_cycles(11),
      I3 => currentCycle_reg(11),
      I4 => samplingInterval_cycles(10),
      I5 => currentCycle_reg(10),
      O => SamplingCache_wea0_carry_i_5_n_0
    );
SamplingCache_wea0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(6),
      I1 => samplingInterval_cycles(6),
      I2 => samplingInterval_cycles(8),
      I3 => currentCycle_reg(8),
      I4 => samplingInterval_cycles(7),
      I5 => currentCycle_reg(7),
      O => SamplingCache_wea0_carry_i_6_n_0
    );
SamplingCache_wea0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(3),
      I1 => samplingInterval_cycles(3),
      I2 => samplingInterval_cycles(5),
      I3 => currentCycle_reg(5),
      I4 => samplingInterval_cycles(4),
      I5 => currentCycle_reg(4),
      O => SamplingCache_wea0_carry_i_7_n_0
    );
SamplingCache_wea0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCycle_reg(0),
      I1 => samplingInterval_cycles(0),
      I2 => samplingInterval_cycles(2),
      I3 => currentCycle_reg(2),
      I4 => samplingInterval_cycles(1),
      I5 => currentCycle_reg(1),
      O => SamplingCache_wea0_carry_i_8_n_0
    );
\SamplingCache_wea[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \SamplingCache_wea0_carry__0_n_5\,
      I1 => STAT_Reset,
      O => \SamplingCache_wea[0]_i_1_n_0\
    );
\SamplingCache_wea_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \SamplingCache_wea[0]_i_1_n_0\,
      Q => SamplingCache_wea(0),
      R => '0'
    );
\currentCycle[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => STAT_Reset,
      I1 => \SamplingCache_wea0_carry__0_n_5\,
      O => \currentCycle[0]_i_1_n_0\
    );
\currentCycle[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => currentCycle_reg(0),
      O => \currentCycle[0]_i_3_n_0\
    );
\currentCycle_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_15\,
      Q => currentCycle_reg(0),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \currentCycle_reg[0]_i_2_n_0\,
      CO(6) => \currentCycle_reg[0]_i_2_n_1\,
      CO(5) => \currentCycle_reg[0]_i_2_n_2\,
      CO(4) => \currentCycle_reg[0]_i_2_n_3\,
      CO(3) => \currentCycle_reg[0]_i_2_n_4\,
      CO(2) => \currentCycle_reg[0]_i_2_n_5\,
      CO(1) => \currentCycle_reg[0]_i_2_n_6\,
      CO(0) => \currentCycle_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \currentCycle_reg[0]_i_2_n_8\,
      O(6) => \currentCycle_reg[0]_i_2_n_9\,
      O(5) => \currentCycle_reg[0]_i_2_n_10\,
      O(4) => \currentCycle_reg[0]_i_2_n_11\,
      O(3) => \currentCycle_reg[0]_i_2_n_12\,
      O(2) => \currentCycle_reg[0]_i_2_n_13\,
      O(1) => \currentCycle_reg[0]_i_2_n_14\,
      O(0) => \currentCycle_reg[0]_i_2_n_15\,
      S(7 downto 1) => currentCycle_reg(7 downto 1),
      S(0) => \currentCycle[0]_i_3_n_0\
    );
\currentCycle_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_13\,
      Q => currentCycle_reg(10),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_12\,
      Q => currentCycle_reg(11),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_11\,
      Q => currentCycle_reg(12),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_10\,
      Q => currentCycle_reg(13),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_9\,
      Q => currentCycle_reg(14),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_8\,
      Q => currentCycle_reg(15),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_15\,
      Q => currentCycle_reg(16),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \currentCycle_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \currentCycle_reg[16]_i_1_n_0\,
      CO(6) => \currentCycle_reg[16]_i_1_n_1\,
      CO(5) => \currentCycle_reg[16]_i_1_n_2\,
      CO(4) => \currentCycle_reg[16]_i_1_n_3\,
      CO(3) => \currentCycle_reg[16]_i_1_n_4\,
      CO(2) => \currentCycle_reg[16]_i_1_n_5\,
      CO(1) => \currentCycle_reg[16]_i_1_n_6\,
      CO(0) => \currentCycle_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \currentCycle_reg[16]_i_1_n_8\,
      O(6) => \currentCycle_reg[16]_i_1_n_9\,
      O(5) => \currentCycle_reg[16]_i_1_n_10\,
      O(4) => \currentCycle_reg[16]_i_1_n_11\,
      O(3) => \currentCycle_reg[16]_i_1_n_12\,
      O(2) => \currentCycle_reg[16]_i_1_n_13\,
      O(1) => \currentCycle_reg[16]_i_1_n_14\,
      O(0) => \currentCycle_reg[16]_i_1_n_15\,
      S(7 downto 0) => currentCycle_reg(23 downto 16)
    );
\currentCycle_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_14\,
      Q => currentCycle_reg(17),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_13\,
      Q => currentCycle_reg(18),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_12\,
      Q => currentCycle_reg(19),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_14\,
      Q => currentCycle_reg(1),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_11\,
      Q => currentCycle_reg(20),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_10\,
      Q => currentCycle_reg(21),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_9\,
      Q => currentCycle_reg(22),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[16]_i_1_n_8\,
      Q => currentCycle_reg(23),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_15\,
      Q => currentCycle_reg(24),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \currentCycle_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_currentCycle_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \currentCycle_reg[24]_i_1_n_1\,
      CO(5) => \currentCycle_reg[24]_i_1_n_2\,
      CO(4) => \currentCycle_reg[24]_i_1_n_3\,
      CO(3) => \currentCycle_reg[24]_i_1_n_4\,
      CO(2) => \currentCycle_reg[24]_i_1_n_5\,
      CO(1) => \currentCycle_reg[24]_i_1_n_6\,
      CO(0) => \currentCycle_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \currentCycle_reg[24]_i_1_n_8\,
      O(6) => \currentCycle_reg[24]_i_1_n_9\,
      O(5) => \currentCycle_reg[24]_i_1_n_10\,
      O(4) => \currentCycle_reg[24]_i_1_n_11\,
      O(3) => \currentCycle_reg[24]_i_1_n_12\,
      O(2) => \currentCycle_reg[24]_i_1_n_13\,
      O(1) => \currentCycle_reg[24]_i_1_n_14\,
      O(0) => \currentCycle_reg[24]_i_1_n_15\,
      S(7 downto 0) => currentCycle_reg(31 downto 24)
    );
\currentCycle_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_14\,
      Q => currentCycle_reg(25),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_13\,
      Q => currentCycle_reg(26),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_12\,
      Q => currentCycle_reg(27),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_11\,
      Q => currentCycle_reg(28),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_10\,
      Q => currentCycle_reg(29),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_13\,
      Q => currentCycle_reg(2),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_9\,
      Q => currentCycle_reg(30),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[24]_i_1_n_8\,
      Q => currentCycle_reg(31),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_12\,
      Q => currentCycle_reg(3),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_11\,
      Q => currentCycle_reg(4),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_10\,
      Q => currentCycle_reg(5),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_9\,
      Q => currentCycle_reg(6),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[0]_i_2_n_8\,
      Q => currentCycle_reg(7),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_15\,
      Q => currentCycle_reg(8),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentCycle_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \currentCycle_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \currentCycle_reg[8]_i_1_n_0\,
      CO(6) => \currentCycle_reg[8]_i_1_n_1\,
      CO(5) => \currentCycle_reg[8]_i_1_n_2\,
      CO(4) => \currentCycle_reg[8]_i_1_n_3\,
      CO(3) => \currentCycle_reg[8]_i_1_n_4\,
      CO(2) => \currentCycle_reg[8]_i_1_n_5\,
      CO(1) => \currentCycle_reg[8]_i_1_n_6\,
      CO(0) => \currentCycle_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \currentCycle_reg[8]_i_1_n_8\,
      O(6) => \currentCycle_reg[8]_i_1_n_9\,
      O(5) => \currentCycle_reg[8]_i_1_n_10\,
      O(4) => \currentCycle_reg[8]_i_1_n_11\,
      O(3) => \currentCycle_reg[8]_i_1_n_12\,
      O(2) => \currentCycle_reg[8]_i_1_n_13\,
      O(1) => \currentCycle_reg[8]_i_1_n_14\,
      O(0) => \currentCycle_reg[8]_i_1_n_15\,
      S(7 downto 0) => currentCycle_reg(15 downto 8)
    );
\currentCycle_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \currentCycle_reg[8]_i_1_n_14\,
      Q => currentCycle_reg(9),
      R => \currentCycle[0]_i_1_n_0\
    );
\currentWriteIndex[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stat_currentwriteindex\(0),
      O => plusOp(0)
    );
\currentWriteIndex[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^stat_currentwriteindex\(0),
      I1 => \^stat_currentwriteindex\(1),
      O => plusOp(1)
    );
\currentWriteIndex[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^stat_currentwriteindex\(0),
      I1 => \^stat_currentwriteindex\(1),
      I2 => \^stat_currentwriteindex\(2),
      O => plusOp(2)
    );
\currentWriteIndex[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^stat_currentwriteindex\(1),
      I1 => \^stat_currentwriteindex\(0),
      I2 => \^stat_currentwriteindex\(2),
      I3 => \^stat_currentwriteindex\(3),
      O => plusOp(3)
    );
\currentWriteIndex[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^stat_currentwriteindex\(2),
      I1 => \^stat_currentwriteindex\(0),
      I2 => \^stat_currentwriteindex\(1),
      I3 => \^stat_currentwriteindex\(3),
      I4 => \^stat_currentwriteindex\(4),
      O => plusOp(4)
    );
\currentWriteIndex[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^stat_currentwriteindex\(3),
      I1 => \^stat_currentwriteindex\(1),
      I2 => \^stat_currentwriteindex\(0),
      I3 => \^stat_currentwriteindex\(2),
      I4 => \^stat_currentwriteindex\(4),
      I5 => \^stat_currentwriteindex\(5),
      O => plusOp(5)
    );
\currentWriteIndex[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \currentWriteIndex[9]_i_2_n_0\,
      I1 => \^stat_currentwriteindex\(6),
      O => plusOp(6)
    );
\currentWriteIndex[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \currentWriteIndex[9]_i_2_n_0\,
      I1 => \^stat_currentwriteindex\(6),
      I2 => \^stat_currentwriteindex\(7),
      O => plusOp(7)
    );
\currentWriteIndex[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^stat_currentwriteindex\(6),
      I1 => \currentWriteIndex[9]_i_2_n_0\,
      I2 => \^stat_currentwriteindex\(7),
      I3 => \^stat_currentwriteindex\(8),
      O => plusOp(8)
    );
\currentWriteIndex[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^stat_currentwriteindex\(7),
      I1 => \currentWriteIndex[9]_i_2_n_0\,
      I2 => \^stat_currentwriteindex\(6),
      I3 => \^stat_currentwriteindex\(8),
      I4 => \^stat_currentwriteindex\(9),
      O => plusOp(9)
    );
\currentWriteIndex[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^stat_currentwriteindex\(5),
      I1 => \^stat_currentwriteindex\(3),
      I2 => \^stat_currentwriteindex\(1),
      I3 => \^stat_currentwriteindex\(0),
      I4 => \^stat_currentwriteindex\(2),
      I5 => \^stat_currentwriteindex\(4),
      O => \currentWriteIndex[9]_i_2_n_0\
    );
\currentWriteIndex_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(0),
      Q => \^stat_currentwriteindex\(0),
      R => STAT_Reset
    );
\currentWriteIndex_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(1),
      Q => \^stat_currentwriteindex\(1),
      R => STAT_Reset
    );
\currentWriteIndex_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(2),
      Q => \^stat_currentwriteindex\(2),
      R => STAT_Reset
    );
\currentWriteIndex_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(3),
      Q => \^stat_currentwriteindex\(3),
      R => STAT_Reset
    );
\currentWriteIndex_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(4),
      Q => \^stat_currentwriteindex\(4),
      R => STAT_Reset
    );
\currentWriteIndex_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(5),
      Q => \^stat_currentwriteindex\(5),
      R => STAT_Reset
    );
\currentWriteIndex_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(6),
      Q => \^stat_currentwriteindex\(6),
      R => STAT_Reset
    );
\currentWriteIndex_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(7),
      Q => \^stat_currentwriteindex\(7),
      R => STAT_Reset
    );
\currentWriteIndex_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(8),
      Q => \^stat_currentwriteindex\(8),
      R => STAT_Reset
    );
\currentWriteIndex_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \SamplingCache_wea0_carry__0_n_5\,
      D => plusOp(9),
      Q => \^stat_currentwriteindex\(9),
      R => STAT_Reset
    );
\samplingInterval_cycles_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(0),
      Q => samplingInterval_cycles(0),
      R => '0'
    );
\samplingInterval_cycles_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(10),
      Q => samplingInterval_cycles(10),
      R => '0'
    );
\samplingInterval_cycles_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(11),
      Q => samplingInterval_cycles(11),
      R => '0'
    );
\samplingInterval_cycles_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(12),
      Q => samplingInterval_cycles(12),
      R => '0'
    );
\samplingInterval_cycles_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(13),
      Q => samplingInterval_cycles(13),
      R => '0'
    );
\samplingInterval_cycles_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(14),
      Q => samplingInterval_cycles(14),
      R => '0'
    );
\samplingInterval_cycles_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(15),
      Q => samplingInterval_cycles(15),
      R => '0'
    );
\samplingInterval_cycles_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(16),
      Q => samplingInterval_cycles(16),
      R => '0'
    );
\samplingInterval_cycles_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(17),
      Q => samplingInterval_cycles(17),
      R => '0'
    );
\samplingInterval_cycles_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(18),
      Q => samplingInterval_cycles(18),
      R => '0'
    );
\samplingInterval_cycles_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(19),
      Q => samplingInterval_cycles(19),
      R => '0'
    );
\samplingInterval_cycles_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(1),
      Q => samplingInterval_cycles(1),
      R => '0'
    );
\samplingInterval_cycles_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(20),
      Q => samplingInterval_cycles(20),
      R => '0'
    );
\samplingInterval_cycles_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(21),
      Q => samplingInterval_cycles(21),
      R => '0'
    );
\samplingInterval_cycles_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(22),
      Q => samplingInterval_cycles(22),
      R => '0'
    );
\samplingInterval_cycles_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(23),
      Q => samplingInterval_cycles(23),
      R => '0'
    );
\samplingInterval_cycles_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(24),
      Q => samplingInterval_cycles(24),
      R => '0'
    );
\samplingInterval_cycles_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(25),
      Q => samplingInterval_cycles(25),
      R => '0'
    );
\samplingInterval_cycles_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(26),
      Q => samplingInterval_cycles(26),
      R => '0'
    );
\samplingInterval_cycles_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(27),
      Q => samplingInterval_cycles(27),
      R => '0'
    );
\samplingInterval_cycles_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(28),
      Q => samplingInterval_cycles(28),
      R => '0'
    );
\samplingInterval_cycles_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(29),
      Q => samplingInterval_cycles(29),
      R => '0'
    );
\samplingInterval_cycles_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(2),
      Q => samplingInterval_cycles(2),
      R => '0'
    );
\samplingInterval_cycles_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(30),
      Q => samplingInterval_cycles(30),
      R => '0'
    );
\samplingInterval_cycles_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(31),
      Q => samplingInterval_cycles(31),
      R => '0'
    );
\samplingInterval_cycles_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(3),
      Q => samplingInterval_cycles(3),
      R => '0'
    );
\samplingInterval_cycles_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(4),
      Q => samplingInterval_cycles(4),
      R => '0'
    );
\samplingInterval_cycles_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(5),
      Q => samplingInterval_cycles(5),
      R => '0'
    );
\samplingInterval_cycles_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(6),
      Q => samplingInterval_cycles(6),
      R => '0'
    );
\samplingInterval_cycles_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(7),
      Q => samplingInterval_cycles(7),
      R => '0'
    );
\samplingInterval_cycles_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(8),
      Q => samplingInterval_cycles(8),
      R => '0'
    );
\samplingInterval_cycles_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => STAT_Reset,
      D => STAT_SamplingIntervalCycles(9),
      Q => samplingInterval_cycles(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StatsDataSampler_0_0 is
  port (
    clk : in STD_LOGIC;
    SamplingCache_clk : out STD_LOGIC;
    SamplingCache_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    SamplingCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SamplingCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    STAT_SamplingIntervalCycles : in STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_SampleData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentWriteIndex : out STD_LOGIC_VECTOR ( 9 downto 0 );
    STAT_Reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_StatsDataSampler_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StatsDataSampler_0_0 : entity is "MainDesign_StatsDataSampler_0_0,StatsDataSampler,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StatsDataSampler_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StatsDataSampler_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StatsDataSampler_0_0 : entity is "StatsDataSampler,Vivado 2025.2";
end MainDesign_StatsDataSampler_0_0;

architecture STRUCTURE of MainDesign_StatsDataSampler_0_0 is
  signal \^stat_currentwriteindex\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^stat_sampledata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^clk\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of STAT_Reset : signal is "xilinx.com:signal:reset:1.0 STAT_Reset RST";
  attribute x_interface_mode : string;
  attribute x_interface_mode of STAT_Reset : signal is "slave STAT_Reset";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of STAT_Reset : signal is "XIL_INTERFACENAME STAT_Reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of SamplingCache_clk : signal is "xilinx.com:interface:bram:1.0 SamplingCache CLK";
  attribute x_interface_mode of SamplingCache_clk : signal is "master SamplingCache";
  attribute x_interface_parameter of SamplingCache_clk : signal is "XIL_INTERFACENAME SamplingCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF SamplingCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of SamplingCache_addra : signal is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";
  attribute x_interface_info of SamplingCache_dina : signal is "xilinx.com:interface:bram:1.0 SamplingCache DIN";
  attribute x_interface_info of SamplingCache_wea : signal is "xilinx.com:interface:bram:1.0 SamplingCache WE";
begin
  STAT_CurrentWriteIndex(9 downto 0) <= \^stat_currentwriteindex\(9 downto 0);
  SamplingCache_addra(9 downto 0) <= \^stat_currentwriteindex\(9 downto 0);
  SamplingCache_clk <= \^clk\;
  SamplingCache_dina(31 downto 0) <= \^stat_sampledata\(31 downto 0);
  \^clk\ <= clk;
  \^stat_sampledata\(31 downto 0) <= STAT_SampleData(31 downto 0);
U0: entity work.MainDesign_StatsDataSampler_0_0_StatsDataSampler
     port map (
      STAT_CurrentWriteIndex(9 downto 0) => \^stat_currentwriteindex\(9 downto 0),
      STAT_Reset => STAT_Reset,
      STAT_SamplingIntervalCycles(31 downto 0) => STAT_SamplingIntervalCycles(31 downto 0),
      SamplingCache_wea(0) => SamplingCache_wea(0),
      clk => \^clk\
    );
end STRUCTURE;
