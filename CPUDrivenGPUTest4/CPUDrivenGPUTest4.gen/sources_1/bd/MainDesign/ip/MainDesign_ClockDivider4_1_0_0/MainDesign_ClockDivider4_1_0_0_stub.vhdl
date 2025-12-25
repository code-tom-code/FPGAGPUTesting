-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:02:08 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider4_1_0_0/MainDesign_ClockDivider4_1_0_0_stub.vhdl
-- Design      : MainDesign_ClockDivider4_1_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ClockDivider4_1_0_0 is
  Port ( 
    clkin100 : in STD_LOGIC;
    clkout25 : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ClockDivider4_1_0_0 : entity is "MainDesign_ClockDivider4_1_0_0,ClockDivider4_1,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ClockDivider4_1_0_0 : entity is "MainDesign_ClockDivider4_1_0_0,ClockDivider4_1,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClockDivider4_1,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ClockDivider4_1_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ClockDivider4_1_0_0 : entity is "module_ref";
end MainDesign_ClockDivider4_1_0_0;

architecture stub of MainDesign_ClockDivider4_1_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clkin100,clkout25";
  attribute x_interface_info : string;
  attribute x_interface_info of clkin100 : signal is "xilinx.com:signal:clock:1.0 clkin100 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clkin100 : signal is "slave clkin100";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin100 : signal is "XIL_INTERFACENAME clkin100, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_1_clk_out10_0, INSERT_VIP 0";
  attribute x_interface_info of clkout25 : signal is "xilinx.com:signal:clock:1.0 clkout25 CLK";
  attribute x_interface_mode of clkout25 : signal is "master clkout25";
  attribute x_interface_parameter of clkout25 : signal is "XIL_INTERFACENAME clkout25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ClockDivider4_1,Vivado 2025.2";
begin
end;
