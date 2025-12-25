-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:04:10 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ResetN_UntilClockLoc_0_1/MainDesign_ResetN_UntilClockLoc_0_1_sim_netlist.vhdl
-- Design      : MainDesign_ResetN_UntilClockLoc_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_ResetN_UntilClockLoc_0_1 is
  port (
    inResetp : in STD_LOGIC;
    locked : in STD_LOGIC;
    outResetn : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_ResetN_UntilClockLoc_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ResetN_UntilClockLoc_0_1 : entity is "MainDesign_ResetN_UntilClockLoc_0_1,ResetN_UntilClockLocked,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ResetN_UntilClockLoc_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ResetN_UntilClockLoc_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_ResetN_UntilClockLoc_0_1 : entity is "ResetN_UntilClockLocked,Vivado 2025.2";
end MainDesign_ResetN_UntilClockLoc_0_1;

architecture STRUCTURE of MainDesign_ResetN_UntilClockLoc_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of inResetp : signal is "xilinx.com:signal:reset:1.0 inResetp RST";
  attribute x_interface_mode : string;
  attribute x_interface_mode of inResetp : signal is "slave inResetp";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of inResetp : signal is "XIL_INTERFACENAME inResetp, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of outResetn : signal is "xilinx.com:signal:reset:1.0 outResetn RST";
  attribute x_interface_mode of outResetn : signal is "master outResetn";
  attribute x_interface_parameter of outResetn : signal is "XIL_INTERFACENAME outResetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
outResetn_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => inResetp,
      O => outResetn
    );
end STRUCTURE;
