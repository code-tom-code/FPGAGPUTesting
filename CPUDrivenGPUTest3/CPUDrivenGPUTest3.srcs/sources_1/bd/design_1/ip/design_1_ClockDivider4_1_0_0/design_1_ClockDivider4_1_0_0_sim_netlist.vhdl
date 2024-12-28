-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:54:14 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClockDivider4_1_0_0/design_1_ClockDivider4_1_0_0_sim_netlist.vhdl
-- Design      : design_1_ClockDivider4_1_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ClockDivider4_1_0_0_ClockDivider4_1 is
  port (
    clkout25 : out STD_LOGIC;
    clkin100 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ClockDivider4_1_0_0_ClockDivider4_1 : entity is "ClockDivider4_1";
end design_1_ClockDivider4_1_0_0_ClockDivider4_1;

architecture STRUCTURE of design_1_ClockDivider4_1_0_0_ClockDivider4_1 is
  signal \^clkout25\ : STD_LOGIC;
  signal \currentClk_reg[3]_srl3_n_0\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of \currentClk_reg[0]\ : label is "xilinx.com:signal:clock:1.0 clkout25 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of \currentClk_reg[0]\ : label is "FREQ_HZ 2500000";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \currentClk_reg[3]_srl3\ : label is "\U0/currentClk_reg ";
  attribute srl_name : string;
  attribute srl_name of \currentClk_reg[3]_srl3\ : label is "\U0/currentClk_reg[3]_srl3 ";
begin
  clkout25 <= \^clkout25\;
\currentClk_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clkin100,
      CE => '1',
      D => \currentClk_reg[3]_srl3_n_0\,
      Q => \^clkout25\,
      R => '0'
    );
\currentClk_reg[3]_srl3\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0001"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clkin100,
      D => \^clkout25\,
      Q => \currentClk_reg[3]_srl3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ClockDivider4_1_0_0 is
  port (
    clkin100 : in STD_LOGIC;
    clkout25 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ClockDivider4_1_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ClockDivider4_1_0_0 : entity is "design_1_ClockDivider4_1_0_0,ClockDivider4_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_ClockDivider4_1_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_ClockDivider4_1_0_0 : entity is "ClockDivider4_1,Vivado 2018.1_AR73068";
end design_1_ClockDivider4_1_0_0;

architecture STRUCTURE of design_1_ClockDivider4_1_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clkin100 : signal is "xilinx.com:signal:clock:1.0 clkin100 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin100 : signal is "XIL_INTERFACENAME clkin100, FREQ_HZ 10000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_1_clk_out1";
  attribute x_interface_info of clkout25 : signal is "xilinx.com:signal:clock:1.0 clkout25 CLK";
  attribute x_interface_parameter of clkout25 : signal is "XIL_INTERFACENAME clkout25, FREQ_HZ 2500000, PHASE 0.000, CLK_DOMAIN design_1_ClockDivider4_1_0_0_clkout25";
begin
U0: entity work.design_1_ClockDivider4_1_0_0_ClockDivider4_1
     port map (
      clkin100 => clkin100,
      clkout25 => clkout25
    );
end STRUCTURE;
