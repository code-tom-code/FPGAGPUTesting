-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:51:00 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_obuf_outputs_0_0/MainDesign_obuf_outputs_0_0_stub.vhdl
-- Design      : MainDesign_obuf_outputs_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_obuf_outputs_0_0 is
  Port ( 
    red_s : in STD_LOGIC;
    green_s : in STD_LOGIC;
    blue_s : in STD_LOGIC;
    cl_s : in STD_LOGIC;
    out_red_p : out STD_LOGIC;
    out_red_n : out STD_LOGIC;
    out_green_p : out STD_LOGIC;
    out_green_n : out STD_LOGIC;
    out_blue_p : out STD_LOGIC;
    out_blue_n : out STD_LOGIC;
    out_cl_p : out STD_LOGIC;
    out_cl_n : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_obuf_outputs_0_0 : entity is "MainDesign_obuf_outputs_0_0,obuf_outputs,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_obuf_outputs_0_0 : entity is "MainDesign_obuf_outputs_0_0,obuf_outputs,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=obuf_outputs,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_obuf_outputs_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_obuf_outputs_0_0 : entity is "module_ref";
end MainDesign_obuf_outputs_0_0;

architecture stub of MainDesign_obuf_outputs_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "red_s,green_s,blue_s,cl_s,out_red_p,out_red_n,out_green_p,out_green_n,out_blue_p,out_blue_n,out_cl_p,out_cl_n";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "obuf_outputs,Vivado 2025.2";
begin
end;
