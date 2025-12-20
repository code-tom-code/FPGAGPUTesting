-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:49:47 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_A_0_1/MainDesign_StandaloneFloatALU_A_0_1_stub.vhdl
-- Design      : MainDesign_StandaloneFloatALU_A_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_StandaloneFloatALU_A_0_1 is
  Port ( 
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StandaloneFloatALU_A_0_1 : entity is "MainDesign_StandaloneFloatALU_A_0_1,StandaloneFloatALU_ADD,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_StandaloneFloatALU_A_0_1 : entity is "MainDesign_StandaloneFloatALU_A_0_1,StandaloneFloatALU_ADD,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StandaloneFloatALU_ADD,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StandaloneFloatALU_A_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StandaloneFloatALU_A_0_1 : entity is "module_ref";
end MainDesign_StandaloneFloatALU_A_0_1;

architecture stub of MainDesign_StandaloneFloatALU_A_0_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,IN_A[31:0],IN_B[31:0],OADD[31:0],IADD_GO";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "StandaloneFloatALU_ADD,Vivado 2025.2";
begin
end;
