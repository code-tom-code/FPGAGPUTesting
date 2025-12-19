-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:46:51 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_xlconstant_2_0/design_1_xlconstant_2_0_sim_netlist.vhdl
-- Design      : design_1_xlconstant_2_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_xlconstant_2_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_xlconstant_2_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_xlconstant_2_0 : entity is "design_1_xlconstant_2_0,xlconstant_v1_1_4_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_xlconstant_2_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_xlconstant_2_0 : entity is "xlconstant_v1_1_4_xlconstant,Vivado 2018.1_AR73068";
end design_1_xlconstant_2_0;

architecture STRUCTURE of design_1_xlconstant_2_0 is
  signal \<const0>\ : STD_LOGIC;
begin
  dout(15) <= \<const0>\;
  dout(14) <= \<const0>\;
  dout(13) <= \<const0>\;
  dout(12) <= \<const0>\;
  dout(11) <= \<const0>\;
  dout(10) <= \<const0>\;
  dout(9) <= \<const0>\;
  dout(8) <= \<const0>\;
  dout(7) <= \<const0>\;
  dout(6) <= \<const0>\;
  dout(5) <= \<const0>\;
  dout(4) <= \<const0>\;
  dout(3) <= \<const0>\;
  dout(2) <= \<const0>\;
  dout(1) <= \<const0>\;
  dout(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
