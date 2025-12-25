-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue Dec 23 19:02:17 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_MDIOController_E_0_0/MainDesign_CDC_MDIOController_E_0_0_stub.vhdl
-- Design      : MainDesign_CDC_MDIOController_E_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_CDC_MDIOController_E_0_0 is
  Port ( 
    Out_clk125 : in STD_LOGIC;
    Out_Signal : out STD_LOGIC;
    In_clk2_5 : in STD_LOGIC;
    In_Signal : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_CDC_MDIOController_E_0_0 : entity is "MainDesign_CDC_MDIOController_E_0_0,CDC_MDIOController_EthernetController,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_CDC_MDIOController_E_0_0 : entity is "MainDesign_CDC_MDIOController_E_0_0,CDC_MDIOController_EthernetController,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_MDIOController_EthernetController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_CDC_MDIOController_E_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_CDC_MDIOController_E_0_0 : entity is "module_ref";
end MainDesign_CDC_MDIOController_E_0_0;

architecture stub of MainDesign_CDC_MDIOController_E_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "Out_clk125,Out_Signal,In_clk2_5,In_Signal";
  attribute x_interface_info : string;
  attribute x_interface_info of Out_clk125 : signal is "xilinx.com:signal:clock:1.0 Out_clk125 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of Out_clk125 : signal is "slave Out_clk125";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of Out_clk125 : signal is "XIL_INTERFACENAME Out_clk125, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0";
  attribute x_interface_info of In_clk2_5 : signal is "xilinx.com:signal:clock:1.0 In_clk2_5 CLK";
  attribute x_interface_mode of In_clk2_5 : signal is "slave In_clk2_5";
  attribute x_interface_parameter of In_clk2_5 : signal is "XIL_INTERFACENAME In_clk2_5, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "CDC_MDIOController_EthernetController,Vivado 2025.2";
begin
end;
