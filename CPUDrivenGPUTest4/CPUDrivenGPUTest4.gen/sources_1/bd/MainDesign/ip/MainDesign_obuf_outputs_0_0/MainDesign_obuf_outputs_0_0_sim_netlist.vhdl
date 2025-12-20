-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:51:00 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_obuf_outputs_0_0/MainDesign_obuf_outputs_0_0_sim_netlist.vhdl
-- Design      : MainDesign_obuf_outputs_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_obuf_outputs_0_0_obuf_outputs is
  port (
    out_red_p : out STD_LOGIC;
    out_red_n : out STD_LOGIC;
    out_green_p : out STD_LOGIC;
    out_green_n : out STD_LOGIC;
    out_blue_p : out STD_LOGIC;
    out_blue_n : out STD_LOGIC;
    out_cl_p : out STD_LOGIC;
    out_cl_n : out STD_LOGIC;
    red_s : in STD_LOGIC;
    green_s : in STD_LOGIC;
    blue_s : in STD_LOGIC;
    cl_s : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_obuf_outputs_0_0_obuf_outputs : entity is "obuf_outputs";
end MainDesign_obuf_outputs_0_0_obuf_outputs;

architecture STRUCTURE of MainDesign_obuf_outputs_0_0_obuf_outputs is
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of OBUFDS_blue : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of OBUFDS_blue : label is "OBUFDS";
  attribute box_type : string;
  attribute box_type of OBUFDS_blue : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_cl : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_cl : label is "OBUFDS";
  attribute box_type of OBUFDS_cl : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_green : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_green : label is "OBUFDS";
  attribute box_type of OBUFDS_green : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_red : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_red : label is "OBUFDS";
  attribute box_type of OBUFDS_red : label is "PRIMITIVE";
begin
OBUFDS_blue: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => blue_s,
      O => out_blue_p,
      OB => out_blue_n
    );
OBUFDS_cl: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => cl_s,
      O => out_cl_p,
      OB => out_cl_n
    );
OBUFDS_green: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => green_s,
      O => out_green_p,
      OB => out_green_n
    );
OBUFDS_red: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => red_s,
      O => out_red_p,
      OB => out_red_n
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_obuf_outputs_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_obuf_outputs_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_obuf_outputs_0_0 : entity is "MainDesign_obuf_outputs_0_0,obuf_outputs,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_obuf_outputs_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_obuf_outputs_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_obuf_outputs_0_0 : entity is "obuf_outputs,Vivado 2025.2";
end MainDesign_obuf_outputs_0_0;

architecture STRUCTURE of MainDesign_obuf_outputs_0_0 is
begin
U0: entity work.MainDesign_obuf_outputs_0_0_obuf_outputs
     port map (
      blue_s => blue_s,
      cl_s => cl_s,
      green_s => green_s,
      out_blue_n => out_blue_n,
      out_blue_p => out_blue_p,
      out_cl_n => out_cl_n,
      out_cl_p => out_cl_p,
      out_green_n => out_green_n,
      out_green_p => out_green_p,
      out_red_n => out_red_n,
      out_red_p => out_red_p,
      red_s => red_s
    );
end STRUCTURE;
