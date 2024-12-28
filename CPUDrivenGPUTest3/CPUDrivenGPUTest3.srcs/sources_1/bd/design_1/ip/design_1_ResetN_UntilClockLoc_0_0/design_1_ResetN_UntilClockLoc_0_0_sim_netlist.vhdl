-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:02:13 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ResetN_UntilClockLoc_0_0/design_1_ResetN_UntilClockLoc_0_0_sim_netlist.vhdl
-- Design      : design_1_ResetN_UntilClockLoc_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ResetN_UntilClockLoc_0_0 is
  port (
    reset : in STD_LOGIC;
    locked : in STD_LOGIC;
    resetn : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ResetN_UntilClockLoc_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ResetN_UntilClockLoc_0_0 : entity is "design_1_ResetN_UntilClockLoc_0_0,ResetN_UntilClockLocked,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_ResetN_UntilClockLoc_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_ResetN_UntilClockLoc_0_0 : entity is "ResetN_UntilClockLocked,Vivado 2018.1_AR73068";
end design_1_ResetN_UntilClockLoc_0_0;

architecture STRUCTURE of design_1_ResetN_UntilClockLoc_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW";
begin
resetn_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      O => resetn
    );
end STRUCTURE;
