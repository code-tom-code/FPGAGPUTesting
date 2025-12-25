-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:58:44 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_Command_Scanout_0_0/MainDesign_CDC_Command_Scanout_0_0_sim_netlist.vhdl
-- Design      : MainDesign_CDC_Command_Scanout_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC_VECTOR ( 29 downto 0 );
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC_VECTOR ( 29 downto 0 )
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is "xpm_cdc_array_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 0;
  attribute WIDTH : integer;
  attribute WIDTH of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is 30;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single : entity is "ARRAY_SINGLE";
end MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single;

architecture STRUCTURE of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single is
  signal async_path_bit : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \syncstages_ff[0]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \syncstages_ff[0]\ : signal is "true";
  attribute async_reg : string;
  attribute async_reg of \syncstages_ff[0]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[0]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[1]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[1]\ : signal is "true";
  attribute async_reg of \syncstages_ff[1]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[1]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[2]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[2]\ : signal is "true";
  attribute async_reg of \syncstages_ff[2]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[2]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[3]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[3]\ : signal is "true";
  attribute async_reg of \syncstages_ff[3]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[3]\ : signal is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][10]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][10]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][10]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][11]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][11]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][11]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][12]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][12]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][12]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][13]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][13]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][13]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][14]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][14]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][14]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][15]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][15]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][15]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][16]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][16]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][16]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][17]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][17]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][17]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][18]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][18]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][18]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][19]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][19]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][19]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][20]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][20]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][20]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][21]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][21]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][21]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][22]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][22]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][22]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][23]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][23]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][23]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][24]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][24]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][24]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][25]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][25]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][25]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][26]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][26]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][26]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][27]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][27]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][27]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][28]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][28]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][28]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][29]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][29]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][29]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][9]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][9]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][9]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][10]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][10]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][10]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][11]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][11]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][11]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][12]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][12]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][12]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][13]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][13]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][13]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][14]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][14]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][14]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][15]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][15]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][15]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][16]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][16]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][16]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][17]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][17]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][17]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][18]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][18]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][18]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][19]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][19]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][19]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][20]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][20]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][20]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][21]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][21]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][21]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][22]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][22]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][22]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][23]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][23]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][23]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][24]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][24]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][24]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][25]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][25]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][25]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][26]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][26]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][26]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][27]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][27]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][27]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][28]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][28]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][28]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][29]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][29]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][29]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][9]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][9]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][9]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][10]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][10]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][10]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][11]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][11]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][11]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][12]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][12]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][12]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][13]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][13]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][13]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][14]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][14]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][14]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][15]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][15]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][15]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][16]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][16]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][16]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][17]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][17]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][17]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][18]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][18]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][18]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][19]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][19]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][19]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][20]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][20]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][20]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][21]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][21]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][21]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][22]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][22]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][22]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][23]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][23]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][23]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][24]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][24]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][24]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][25]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][25]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][25]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][26]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][26]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][26]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][27]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][27]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][27]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][28]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][28]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][28]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][29]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][29]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][29]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][9]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][9]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][9]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][10]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][10]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][10]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][11]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][11]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][11]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][12]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][12]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][12]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][13]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][13]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][13]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][14]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][14]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][14]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][15]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][15]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][15]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][16]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][16]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][16]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][17]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][17]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][17]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][18]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][18]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][18]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][19]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][19]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][19]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][20]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][20]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][20]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][21]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][21]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][21]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][22]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][22]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][22]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][23]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][23]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][23]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][24]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][24]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][24]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][25]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][25]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][25]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][26]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][26]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][26]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][27]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][27]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][27]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][28]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][28]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][28]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][29]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][29]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][29]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][9]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][9]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][9]\ : label is "ARRAY_SINGLE";
begin
  dest_out(29 downto 0) <= \syncstages_ff[3]\(29 downto 0);
\src_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(0),
      Q => async_path_bit(0),
      R => '0'
    );
\src_ff_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(10),
      Q => async_path_bit(10),
      R => '0'
    );
\src_ff_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(11),
      Q => async_path_bit(11),
      R => '0'
    );
\src_ff_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(12),
      Q => async_path_bit(12),
      R => '0'
    );
\src_ff_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(13),
      Q => async_path_bit(13),
      R => '0'
    );
\src_ff_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(14),
      Q => async_path_bit(14),
      R => '0'
    );
\src_ff_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(15),
      Q => async_path_bit(15),
      R => '0'
    );
\src_ff_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(16),
      Q => async_path_bit(16),
      R => '0'
    );
\src_ff_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(17),
      Q => async_path_bit(17),
      R => '0'
    );
\src_ff_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(18),
      Q => async_path_bit(18),
      R => '0'
    );
\src_ff_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(19),
      Q => async_path_bit(19),
      R => '0'
    );
\src_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(1),
      Q => async_path_bit(1),
      R => '0'
    );
\src_ff_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(20),
      Q => async_path_bit(20),
      R => '0'
    );
\src_ff_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(21),
      Q => async_path_bit(21),
      R => '0'
    );
\src_ff_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(22),
      Q => async_path_bit(22),
      R => '0'
    );
\src_ff_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(23),
      Q => async_path_bit(23),
      R => '0'
    );
\src_ff_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(24),
      Q => async_path_bit(24),
      R => '0'
    );
\src_ff_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(25),
      Q => async_path_bit(25),
      R => '0'
    );
\src_ff_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(26),
      Q => async_path_bit(26),
      R => '0'
    );
\src_ff_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(27),
      Q => async_path_bit(27),
      R => '0'
    );
\src_ff_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(28),
      Q => async_path_bit(28),
      R => '0'
    );
\src_ff_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(29),
      Q => async_path_bit(29),
      R => '0'
    );
\src_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(2),
      Q => async_path_bit(2),
      R => '0'
    );
\src_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(3),
      Q => async_path_bit(3),
      R => '0'
    );
\src_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(4),
      Q => async_path_bit(4),
      R => '0'
    );
\src_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(5),
      Q => async_path_bit(5),
      R => '0'
    );
\src_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(6),
      Q => async_path_bit(6),
      R => '0'
    );
\src_ff_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(7),
      Q => async_path_bit(7),
      R => '0'
    );
\src_ff_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(8),
      Q => async_path_bit(8),
      R => '0'
    );
\src_ff_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(9),
      Q => async_path_bit(9),
      R => '0'
    );
\syncstages_ff_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(0),
      Q => \syncstages_ff[0]\(0),
      R => '0'
    );
\syncstages_ff_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(10),
      Q => \syncstages_ff[0]\(10),
      R => '0'
    );
\syncstages_ff_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(11),
      Q => \syncstages_ff[0]\(11),
      R => '0'
    );
\syncstages_ff_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(12),
      Q => \syncstages_ff[0]\(12),
      R => '0'
    );
\syncstages_ff_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(13),
      Q => \syncstages_ff[0]\(13),
      R => '0'
    );
\syncstages_ff_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(14),
      Q => \syncstages_ff[0]\(14),
      R => '0'
    );
\syncstages_ff_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(15),
      Q => \syncstages_ff[0]\(15),
      R => '0'
    );
\syncstages_ff_reg[0][16]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(16),
      Q => \syncstages_ff[0]\(16),
      R => '0'
    );
\syncstages_ff_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(17),
      Q => \syncstages_ff[0]\(17),
      R => '0'
    );
\syncstages_ff_reg[0][18]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(18),
      Q => \syncstages_ff[0]\(18),
      R => '0'
    );
\syncstages_ff_reg[0][19]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(19),
      Q => \syncstages_ff[0]\(19),
      R => '0'
    );
\syncstages_ff_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(1),
      Q => \syncstages_ff[0]\(1),
      R => '0'
    );
\syncstages_ff_reg[0][20]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(20),
      Q => \syncstages_ff[0]\(20),
      R => '0'
    );
\syncstages_ff_reg[0][21]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(21),
      Q => \syncstages_ff[0]\(21),
      R => '0'
    );
\syncstages_ff_reg[0][22]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(22),
      Q => \syncstages_ff[0]\(22),
      R => '0'
    );
\syncstages_ff_reg[0][23]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(23),
      Q => \syncstages_ff[0]\(23),
      R => '0'
    );
\syncstages_ff_reg[0][24]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(24),
      Q => \syncstages_ff[0]\(24),
      R => '0'
    );
\syncstages_ff_reg[0][25]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(25),
      Q => \syncstages_ff[0]\(25),
      R => '0'
    );
\syncstages_ff_reg[0][26]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(26),
      Q => \syncstages_ff[0]\(26),
      R => '0'
    );
\syncstages_ff_reg[0][27]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(27),
      Q => \syncstages_ff[0]\(27),
      R => '0'
    );
\syncstages_ff_reg[0][28]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(28),
      Q => \syncstages_ff[0]\(28),
      R => '0'
    );
\syncstages_ff_reg[0][29]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(29),
      Q => \syncstages_ff[0]\(29),
      R => '0'
    );
\syncstages_ff_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(2),
      Q => \syncstages_ff[0]\(2),
      R => '0'
    );
\syncstages_ff_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(3),
      Q => \syncstages_ff[0]\(3),
      R => '0'
    );
\syncstages_ff_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(4),
      Q => \syncstages_ff[0]\(4),
      R => '0'
    );
\syncstages_ff_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(5),
      Q => \syncstages_ff[0]\(5),
      R => '0'
    );
\syncstages_ff_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(6),
      Q => \syncstages_ff[0]\(6),
      R => '0'
    );
\syncstages_ff_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(7),
      Q => \syncstages_ff[0]\(7),
      R => '0'
    );
\syncstages_ff_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(8),
      Q => \syncstages_ff[0]\(8),
      R => '0'
    );
\syncstages_ff_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(9),
      Q => \syncstages_ff[0]\(9),
      R => '0'
    );
\syncstages_ff_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(0),
      Q => \syncstages_ff[1]\(0),
      R => '0'
    );
\syncstages_ff_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(10),
      Q => \syncstages_ff[1]\(10),
      R => '0'
    );
\syncstages_ff_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(11),
      Q => \syncstages_ff[1]\(11),
      R => '0'
    );
\syncstages_ff_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(12),
      Q => \syncstages_ff[1]\(12),
      R => '0'
    );
\syncstages_ff_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(13),
      Q => \syncstages_ff[1]\(13),
      R => '0'
    );
\syncstages_ff_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(14),
      Q => \syncstages_ff[1]\(14),
      R => '0'
    );
\syncstages_ff_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(15),
      Q => \syncstages_ff[1]\(15),
      R => '0'
    );
\syncstages_ff_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(16),
      Q => \syncstages_ff[1]\(16),
      R => '0'
    );
\syncstages_ff_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(17),
      Q => \syncstages_ff[1]\(17),
      R => '0'
    );
\syncstages_ff_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(18),
      Q => \syncstages_ff[1]\(18),
      R => '0'
    );
\syncstages_ff_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(19),
      Q => \syncstages_ff[1]\(19),
      R => '0'
    );
\syncstages_ff_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(1),
      Q => \syncstages_ff[1]\(1),
      R => '0'
    );
\syncstages_ff_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(20),
      Q => \syncstages_ff[1]\(20),
      R => '0'
    );
\syncstages_ff_reg[1][21]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(21),
      Q => \syncstages_ff[1]\(21),
      R => '0'
    );
\syncstages_ff_reg[1][22]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(22),
      Q => \syncstages_ff[1]\(22),
      R => '0'
    );
\syncstages_ff_reg[1][23]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(23),
      Q => \syncstages_ff[1]\(23),
      R => '0'
    );
\syncstages_ff_reg[1][24]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(24),
      Q => \syncstages_ff[1]\(24),
      R => '0'
    );
\syncstages_ff_reg[1][25]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(25),
      Q => \syncstages_ff[1]\(25),
      R => '0'
    );
\syncstages_ff_reg[1][26]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(26),
      Q => \syncstages_ff[1]\(26),
      R => '0'
    );
\syncstages_ff_reg[1][27]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(27),
      Q => \syncstages_ff[1]\(27),
      R => '0'
    );
\syncstages_ff_reg[1][28]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(28),
      Q => \syncstages_ff[1]\(28),
      R => '0'
    );
\syncstages_ff_reg[1][29]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(29),
      Q => \syncstages_ff[1]\(29),
      R => '0'
    );
\syncstages_ff_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(2),
      Q => \syncstages_ff[1]\(2),
      R => '0'
    );
\syncstages_ff_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(3),
      Q => \syncstages_ff[1]\(3),
      R => '0'
    );
\syncstages_ff_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(4),
      Q => \syncstages_ff[1]\(4),
      R => '0'
    );
\syncstages_ff_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(5),
      Q => \syncstages_ff[1]\(5),
      R => '0'
    );
\syncstages_ff_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(6),
      Q => \syncstages_ff[1]\(6),
      R => '0'
    );
\syncstages_ff_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(7),
      Q => \syncstages_ff[1]\(7),
      R => '0'
    );
\syncstages_ff_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(8),
      Q => \syncstages_ff[1]\(8),
      R => '0'
    );
\syncstages_ff_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(9),
      Q => \syncstages_ff[1]\(9),
      R => '0'
    );
\syncstages_ff_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(0),
      Q => \syncstages_ff[2]\(0),
      R => '0'
    );
\syncstages_ff_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(10),
      Q => \syncstages_ff[2]\(10),
      R => '0'
    );
\syncstages_ff_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(11),
      Q => \syncstages_ff[2]\(11),
      R => '0'
    );
\syncstages_ff_reg[2][12]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(12),
      Q => \syncstages_ff[2]\(12),
      R => '0'
    );
\syncstages_ff_reg[2][13]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(13),
      Q => \syncstages_ff[2]\(13),
      R => '0'
    );
\syncstages_ff_reg[2][14]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(14),
      Q => \syncstages_ff[2]\(14),
      R => '0'
    );
\syncstages_ff_reg[2][15]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(15),
      Q => \syncstages_ff[2]\(15),
      R => '0'
    );
\syncstages_ff_reg[2][16]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(16),
      Q => \syncstages_ff[2]\(16),
      R => '0'
    );
\syncstages_ff_reg[2][17]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(17),
      Q => \syncstages_ff[2]\(17),
      R => '0'
    );
\syncstages_ff_reg[2][18]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(18),
      Q => \syncstages_ff[2]\(18),
      R => '0'
    );
\syncstages_ff_reg[2][19]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(19),
      Q => \syncstages_ff[2]\(19),
      R => '0'
    );
\syncstages_ff_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(1),
      Q => \syncstages_ff[2]\(1),
      R => '0'
    );
\syncstages_ff_reg[2][20]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(20),
      Q => \syncstages_ff[2]\(20),
      R => '0'
    );
\syncstages_ff_reg[2][21]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(21),
      Q => \syncstages_ff[2]\(21),
      R => '0'
    );
\syncstages_ff_reg[2][22]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(22),
      Q => \syncstages_ff[2]\(22),
      R => '0'
    );
\syncstages_ff_reg[2][23]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(23),
      Q => \syncstages_ff[2]\(23),
      R => '0'
    );
\syncstages_ff_reg[2][24]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(24),
      Q => \syncstages_ff[2]\(24),
      R => '0'
    );
\syncstages_ff_reg[2][25]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(25),
      Q => \syncstages_ff[2]\(25),
      R => '0'
    );
\syncstages_ff_reg[2][26]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(26),
      Q => \syncstages_ff[2]\(26),
      R => '0'
    );
\syncstages_ff_reg[2][27]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(27),
      Q => \syncstages_ff[2]\(27),
      R => '0'
    );
\syncstages_ff_reg[2][28]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(28),
      Q => \syncstages_ff[2]\(28),
      R => '0'
    );
\syncstages_ff_reg[2][29]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(29),
      Q => \syncstages_ff[2]\(29),
      R => '0'
    );
\syncstages_ff_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(2),
      Q => \syncstages_ff[2]\(2),
      R => '0'
    );
\syncstages_ff_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(3),
      Q => \syncstages_ff[2]\(3),
      R => '0'
    );
\syncstages_ff_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(4),
      Q => \syncstages_ff[2]\(4),
      R => '0'
    );
\syncstages_ff_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(5),
      Q => \syncstages_ff[2]\(5),
      R => '0'
    );
\syncstages_ff_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(6),
      Q => \syncstages_ff[2]\(6),
      R => '0'
    );
\syncstages_ff_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(7),
      Q => \syncstages_ff[2]\(7),
      R => '0'
    );
\syncstages_ff_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(8),
      Q => \syncstages_ff[2]\(8),
      R => '0'
    );
\syncstages_ff_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(9),
      Q => \syncstages_ff[2]\(9),
      R => '0'
    );
\syncstages_ff_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(0),
      Q => \syncstages_ff[3]\(0),
      R => '0'
    );
\syncstages_ff_reg[3][10]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(10),
      Q => \syncstages_ff[3]\(10),
      R => '0'
    );
\syncstages_ff_reg[3][11]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(11),
      Q => \syncstages_ff[3]\(11),
      R => '0'
    );
\syncstages_ff_reg[3][12]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(12),
      Q => \syncstages_ff[3]\(12),
      R => '0'
    );
\syncstages_ff_reg[3][13]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(13),
      Q => \syncstages_ff[3]\(13),
      R => '0'
    );
\syncstages_ff_reg[3][14]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(14),
      Q => \syncstages_ff[3]\(14),
      R => '0'
    );
\syncstages_ff_reg[3][15]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(15),
      Q => \syncstages_ff[3]\(15),
      R => '0'
    );
\syncstages_ff_reg[3][16]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(16),
      Q => \syncstages_ff[3]\(16),
      R => '0'
    );
\syncstages_ff_reg[3][17]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(17),
      Q => \syncstages_ff[3]\(17),
      R => '0'
    );
\syncstages_ff_reg[3][18]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(18),
      Q => \syncstages_ff[3]\(18),
      R => '0'
    );
\syncstages_ff_reg[3][19]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(19),
      Q => \syncstages_ff[3]\(19),
      R => '0'
    );
\syncstages_ff_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(1),
      Q => \syncstages_ff[3]\(1),
      R => '0'
    );
\syncstages_ff_reg[3][20]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(20),
      Q => \syncstages_ff[3]\(20),
      R => '0'
    );
\syncstages_ff_reg[3][21]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(21),
      Q => \syncstages_ff[3]\(21),
      R => '0'
    );
\syncstages_ff_reg[3][22]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(22),
      Q => \syncstages_ff[3]\(22),
      R => '0'
    );
\syncstages_ff_reg[3][23]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(23),
      Q => \syncstages_ff[3]\(23),
      R => '0'
    );
\syncstages_ff_reg[3][24]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(24),
      Q => \syncstages_ff[3]\(24),
      R => '0'
    );
\syncstages_ff_reg[3][25]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(25),
      Q => \syncstages_ff[3]\(25),
      R => '0'
    );
\syncstages_ff_reg[3][26]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(26),
      Q => \syncstages_ff[3]\(26),
      R => '0'
    );
\syncstages_ff_reg[3][27]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(27),
      Q => \syncstages_ff[3]\(27),
      R => '0'
    );
\syncstages_ff_reg[3][28]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(28),
      Q => \syncstages_ff[3]\(28),
      R => '0'
    );
\syncstages_ff_reg[3][29]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(29),
      Q => \syncstages_ff[3]\(29),
      R => '0'
    );
\syncstages_ff_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(2),
      Q => \syncstages_ff[3]\(2),
      R => '0'
    );
\syncstages_ff_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(3),
      Q => \syncstages_ff[3]\(3),
      R => '0'
    );
\syncstages_ff_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(4),
      Q => \syncstages_ff[3]\(4),
      R => '0'
    );
\syncstages_ff_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(5),
      Q => \syncstages_ff[3]\(5),
      R => '0'
    );
\syncstages_ff_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(6),
      Q => \syncstages_ff[3]\(6),
      R => '0'
    );
\syncstages_ff_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(7),
      Q => \syncstages_ff[3]\(7),
      R => '0'
    );
\syncstages_ff_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(8),
      Q => \syncstages_ff[3]\(8),
      R => '0'
    );
\syncstages_ff_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(9),
      Q => \syncstages_ff[3]\(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is "xpm_cdc_array_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 0;
  attribute WIDTH : integer;
  attribute WIDTH of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is 9;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ : entity is "ARRAY_SINGLE";
end \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\;

architecture STRUCTURE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\ is
  signal async_path_bit : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \syncstages_ff[0]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \syncstages_ff[0]\ : signal is "true";
  attribute async_reg : string;
  attribute async_reg of \syncstages_ff[0]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[0]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[1]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[1]\ : signal is "true";
  attribute async_reg of \syncstages_ff[1]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[1]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[2]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[2]\ : signal is "true";
  attribute async_reg of \syncstages_ff[2]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[2]\ : signal is "ARRAY_SINGLE";
  signal \syncstages_ff[3]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute RTL_KEEP of \syncstages_ff[3]\ : signal is "true";
  attribute async_reg of \syncstages_ff[3]\ : signal is "true";
  attribute xpm_cdc of \syncstages_ff[3]\ : signal is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[0][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2][8]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][0]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][0]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][1]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][2]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][3]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][4]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][4]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][4]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][5]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][5]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][5]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][6]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][6]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][6]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][7]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][7]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][7]\ : label is "ARRAY_SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3][8]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3][8]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3][8]\ : label is "ARRAY_SINGLE";
begin
  dest_out(8 downto 0) <= \syncstages_ff[3]\(8 downto 0);
\src_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(0),
      Q => async_path_bit(0),
      R => '0'
    );
\src_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(1),
      Q => async_path_bit(1),
      R => '0'
    );
\src_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(2),
      Q => async_path_bit(2),
      R => '0'
    );
\src_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(3),
      Q => async_path_bit(3),
      R => '0'
    );
\src_ff_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(4),
      Q => async_path_bit(4),
      R => '0'
    );
\src_ff_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(5),
      Q => async_path_bit(5),
      R => '0'
    );
\src_ff_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(6),
      Q => async_path_bit(6),
      R => '0'
    );
\src_ff_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(7),
      Q => async_path_bit(7),
      R => '0'
    );
\src_ff_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in(8),
      Q => async_path_bit(8),
      R => '0'
    );
\syncstages_ff_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(0),
      Q => \syncstages_ff[0]\(0),
      R => '0'
    );
\syncstages_ff_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(1),
      Q => \syncstages_ff[0]\(1),
      R => '0'
    );
\syncstages_ff_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(2),
      Q => \syncstages_ff[0]\(2),
      R => '0'
    );
\syncstages_ff_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(3),
      Q => \syncstages_ff[0]\(3),
      R => '0'
    );
\syncstages_ff_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(4),
      Q => \syncstages_ff[0]\(4),
      R => '0'
    );
\syncstages_ff_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(5),
      Q => \syncstages_ff[0]\(5),
      R => '0'
    );
\syncstages_ff_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(6),
      Q => \syncstages_ff[0]\(6),
      R => '0'
    );
\syncstages_ff_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(7),
      Q => \syncstages_ff[0]\(7),
      R => '0'
    );
\syncstages_ff_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => async_path_bit(8),
      Q => \syncstages_ff[0]\(8),
      R => '0'
    );
\syncstages_ff_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(0),
      Q => \syncstages_ff[1]\(0),
      R => '0'
    );
\syncstages_ff_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(1),
      Q => \syncstages_ff[1]\(1),
      R => '0'
    );
\syncstages_ff_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(2),
      Q => \syncstages_ff[1]\(2),
      R => '0'
    );
\syncstages_ff_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(3),
      Q => \syncstages_ff[1]\(3),
      R => '0'
    );
\syncstages_ff_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(4),
      Q => \syncstages_ff[1]\(4),
      R => '0'
    );
\syncstages_ff_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(5),
      Q => \syncstages_ff[1]\(5),
      R => '0'
    );
\syncstages_ff_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(6),
      Q => \syncstages_ff[1]\(6),
      R => '0'
    );
\syncstages_ff_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(7),
      Q => \syncstages_ff[1]\(7),
      R => '0'
    );
\syncstages_ff_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[0]\(8),
      Q => \syncstages_ff[1]\(8),
      R => '0'
    );
\syncstages_ff_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(0),
      Q => \syncstages_ff[2]\(0),
      R => '0'
    );
\syncstages_ff_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(1),
      Q => \syncstages_ff[2]\(1),
      R => '0'
    );
\syncstages_ff_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(2),
      Q => \syncstages_ff[2]\(2),
      R => '0'
    );
\syncstages_ff_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(3),
      Q => \syncstages_ff[2]\(3),
      R => '0'
    );
\syncstages_ff_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(4),
      Q => \syncstages_ff[2]\(4),
      R => '0'
    );
\syncstages_ff_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(5),
      Q => \syncstages_ff[2]\(5),
      R => '0'
    );
\syncstages_ff_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(6),
      Q => \syncstages_ff[2]\(6),
      R => '0'
    );
\syncstages_ff_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(7),
      Q => \syncstages_ff[2]\(7),
      R => '0'
    );
\syncstages_ff_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[1]\(8),
      Q => \syncstages_ff[2]\(8),
      R => '0'
    );
\syncstages_ff_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(0),
      Q => \syncstages_ff[3]\(0),
      R => '0'
    );
\syncstages_ff_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(1),
      Q => \syncstages_ff[3]\(1),
      R => '0'
    );
\syncstages_ff_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(2),
      Q => \syncstages_ff[3]\(2),
      R => '0'
    );
\syncstages_ff_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(3),
      Q => \syncstages_ff[3]\(3),
      R => '0'
    );
\syncstages_ff_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(4),
      Q => \syncstages_ff[3]\(4),
      R => '0'
    );
\syncstages_ff_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(5),
      Q => \syncstages_ff[3]\(5),
      R => '0'
    );
\syncstages_ff_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(6),
      Q => \syncstages_ff[3]\(6),
      R => '0'
    );
\syncstages_ff_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(7),
      Q => \syncstages_ff[3]\(7),
      R => '0'
    );
\syncstages_ff_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => \syncstages_ff[2]\(8),
      Q => \syncstages_ff[3]\(8),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single : entity is "SINGLE";
end MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single;

architecture STRUCTURE of MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single is
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
src_ff_reg: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in,
      Q => p_0_in(0),
      R => '0'
    );
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => p_0_in(0),
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ : entity is "SINGLE";
end \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\;

architecture STRUCTURE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\ is
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
src_ff_reg: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in,
      Q => p_0_in(0),
      R => '0'
    );
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => p_0_in(0),
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ : entity is "SINGLE";
end \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\;

architecture STRUCTURE of \MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\ is
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
src_ff_reg: unisim.vcomponents.FDRE
     port map (
      C => src_clk,
      CE => '1',
      D => src_in,
      Q => p_0_in(0),
      R => '0'
    );
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => p_0_in(0),
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout is
  port (
    CMD_VSync : out STD_LOGIC;
    SCANOUT_ScanEnable : out STD_LOGIC;
    SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SCANOUT_InvertOutputColor : out STD_LOGIC;
    SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR ( 8 downto 0 );
    cmd_clk : in STD_LOGIC;
    scanout_clk : in STD_LOGIC;
    SCANOUT_VSync : in STD_LOGIC;
    CMD_RenderTargetBaseAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout : entity is "CDC_Command_Scanout";
end MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout;

architecture STRUCTURE of MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout is
  signal \CMD_SendState0_reg[InvertOutputColor]__0\ : STD_LOGIC;
  signal \CMD_SendState0_reg[OutputColorChannels]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \CMD_SendState0_reg[RenderTargetBaseAddr]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \CMD_SendState0_reg[ScanEnable]__0\ : STD_LOGIC;
  signal \CMD_SendState1_reg[InvertOutputColor]__0\ : STD_LOGIC;
  signal \CMD_SendState1_reg[OutputColorChannels]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \CMD_SendState1_reg[RenderTargetBaseAddr]\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \CMD_SendState1_reg[ScanEnable]__0\ : STD_LOGIC;
  signal \CMD_SendState2_reg[InvertOutputColor_n_0_]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][0]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][1]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][2]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][3]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][4]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][5]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][6]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][7]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[OutputColorChannels_n_0_][8]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9]\ : STD_LOGIC;
  signal \CMD_SendState2_reg[ScanEnable_n_0_]\ : STD_LOGIC;
  signal VSync_Signal_Pipeline0 : STD_LOGIC;
  signal VSync_Signal_Pipeline2_reg_srl2_n_0 : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of VSync_Signal_Pipeline2_reg_srl2 : label is "\U0/VSync_Signal_Pipeline2_reg_srl2 ";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of cdcInvertOutputColorLogic : label is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of cdcInvertOutputColorLogic : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of cdcInvertOutputColorLogic : label is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of cdcInvertOutputColorLogic : label is 1;
  attribute VERSION : integer;
  attribute VERSION of cdcInvertOutputColorLogic : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of cdcInvertOutputColorLogic : label is "SINGLE";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of cdcInvertOutputColorLogic : label is "TRUE";
  attribute DEST_SYNC_FF of cdcOutputColorChannelsLogicVector : label is 4;
  attribute INIT_SYNC_FF of cdcOutputColorChannelsLogicVector : label is 0;
  attribute SIM_ASSERT_CHK of cdcOutputColorChannelsLogicVector : label is 0;
  attribute SRC_INPUT_REG of cdcOutputColorChannelsLogicVector : label is 1;
  attribute VERSION of cdcOutputColorChannelsLogicVector : label is 0;
  attribute WIDTH : integer;
  attribute WIDTH of cdcOutputColorChannelsLogicVector : label is 9;
  attribute XPM_CDC of cdcOutputColorChannelsLogicVector : label is "ARRAY_SINGLE";
  attribute XPM_MODULE of cdcOutputColorChannelsLogicVector : label is "TRUE";
  attribute DEST_SYNC_FF of cdcRenderTargetBaseAddrLogicVector : label is 4;
  attribute INIT_SYNC_FF of cdcRenderTargetBaseAddrLogicVector : label is 0;
  attribute SIM_ASSERT_CHK of cdcRenderTargetBaseAddrLogicVector : label is 0;
  attribute SRC_INPUT_REG of cdcRenderTargetBaseAddrLogicVector : label is 1;
  attribute VERSION of cdcRenderTargetBaseAddrLogicVector : label is 0;
  attribute WIDTH of cdcRenderTargetBaseAddrLogicVector : label is 30;
  attribute XPM_CDC of cdcRenderTargetBaseAddrLogicVector : label is "ARRAY_SINGLE";
  attribute XPM_MODULE of cdcRenderTargetBaseAddrLogicVector : label is "TRUE";
  attribute DEST_SYNC_FF of cdcScanEnableLogic : label is 4;
  attribute INIT_SYNC_FF of cdcScanEnableLogic : label is 0;
  attribute SIM_ASSERT_CHK of cdcScanEnableLogic : label is 0;
  attribute SRC_INPUT_REG of cdcScanEnableLogic : label is 1;
  attribute VERSION of cdcScanEnableLogic : label is 0;
  attribute XPM_CDC of cdcScanEnableLogic : label is "SINGLE";
  attribute XPM_MODULE of cdcScanEnableLogic : label is "TRUE";
  attribute DEST_SYNC_FF of cdcVSyncLogic : label is 4;
  attribute INIT_SYNC_FF of cdcVSyncLogic : label is 0;
  attribute SIM_ASSERT_CHK of cdcVSyncLogic : label is 0;
  attribute SRC_INPUT_REG of cdcVSyncLogic : label is 1;
  attribute VERSION of cdcVSyncLogic : label is 0;
  attribute XPM_CDC of cdcVSyncLogic : label is "SINGLE";
  attribute XPM_MODULE of cdcVSyncLogic : label is "TRUE";
begin
\CMD_SendState0_reg[InvertOutputColor]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_InvertOutputColor,
      Q => \CMD_SendState0_reg[InvertOutputColor]__0\,
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(0),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(0),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(1),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(1),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(2),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(2),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(3),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(3),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(4),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(4),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(5),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(5),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(6),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(6),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(7),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(7),
      R => '0'
    );
\CMD_SendState0_reg[OutputColorChannels][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_OutputColorChannels(8),
      Q => \CMD_SendState0_reg[OutputColorChannels]\(8),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(0),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(0),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(10),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(10),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(11),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(11),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(12),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(12),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(13),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(13),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(14),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(14),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(15),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(15),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(16),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(16),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(17),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(17),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(18),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(18),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(19),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(19),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(1),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(1),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(20),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(20),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(21),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(21),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(22),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(22),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(23),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(23),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(24),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(24),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(25),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(25),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(26),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(26),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(27),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(27),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(28),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(28),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(29),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(29),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(2),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(2),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(3),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(3),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(4),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(4),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(5),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(5),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(6),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(6),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(7),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(7),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(8),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(8),
      R => '0'
    );
\CMD_SendState0_reg[RenderTargetBaseAddr][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_RenderTargetBaseAddr(9),
      Q => \CMD_SendState0_reg[RenderTargetBaseAddr]\(9),
      R => '0'
    );
\CMD_SendState0_reg[ScanEnable]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => CMD_ScanEnable,
      Q => \CMD_SendState0_reg[ScanEnable]__0\,
      R => '0'
    );
\CMD_SendState1_reg[InvertOutputColor]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[InvertOutputColor]__0\,
      Q => \CMD_SendState1_reg[InvertOutputColor]__0\,
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(0),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(0),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(1),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(1),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(2),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(2),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(3),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(3),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(4),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(4),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(5),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(5),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(6),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(6),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(7),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(7),
      R => '0'
    );
\CMD_SendState1_reg[OutputColorChannels][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[OutputColorChannels]\(8),
      Q => \CMD_SendState1_reg[OutputColorChannels]\(8),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(0),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(0),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(10),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(10),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(11),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(11),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(12),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(12),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(13),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(13),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(14),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(14),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(15),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(15),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(16),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(16),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(17),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(17),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(18),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(18),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(19),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(19),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(1),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(1),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(20),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(20),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(21),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(21),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(22),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(22),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(23),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(23),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(24),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(24),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(25),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(25),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(26),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(26),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(27),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(27),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(28),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(28),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(29),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(29),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(2),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(2),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(3),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(3),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(4),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(4),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(5),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(5),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(6),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(6),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(7),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(7),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(8),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(8),
      R => '0'
    );
\CMD_SendState1_reg[RenderTargetBaseAddr][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[RenderTargetBaseAddr]\(9),
      Q => \CMD_SendState1_reg[RenderTargetBaseAddr]\(9),
      R => '0'
    );
\CMD_SendState1_reg[ScanEnable]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState0_reg[ScanEnable]__0\,
      Q => \CMD_SendState1_reg[ScanEnable]__0\,
      R => '0'
    );
\CMD_SendState2_reg[InvertOutputColor]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[InvertOutputColor]__0\,
      Q => \CMD_SendState2_reg[InvertOutputColor_n_0_]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(0),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][0]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(1),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][1]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(2),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][2]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(3),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][3]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(4),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][4]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(5),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][5]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(6),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][6]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(7),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][7]\,
      R => '0'
    );
\CMD_SendState2_reg[OutputColorChannels][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[OutputColorChannels]\(8),
      Q => \CMD_SendState2_reg[OutputColorChannels_n_0_][8]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(0),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(10),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(11),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(12),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(13),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(14),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(15),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(16),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(17),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(18),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(19),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(1),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(20),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(21),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(22),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(23),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(24),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(25),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(26),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(27),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(28),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(29),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(2),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(3),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(4),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(5),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(6),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(7),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(8),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8]\,
      R => '0'
    );
\CMD_SendState2_reg[RenderTargetBaseAddr][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[RenderTargetBaseAddr]\(9),
      Q => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9]\,
      R => '0'
    );
\CMD_SendState2_reg[ScanEnable]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => \CMD_SendState1_reg[ScanEnable]__0\,
      Q => \CMD_SendState2_reg[ScanEnable_n_0_]\,
      R => '0'
    );
CMD_VSync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmd_clk,
      CE => '1',
      D => VSync_Signal_Pipeline2_reg_srl2_n_0,
      Q => CMD_VSync,
      R => '0'
    );
VSync_Signal_Pipeline2_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => cmd_clk,
      D => VSync_Signal_Pipeline0,
      Q => VSync_Signal_Pipeline2_reg_srl2_n_0
    );
cdcInvertOutputColorLogic: entity work.\MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2\
     port map (
      dest_clk => scanout_clk,
      dest_out => SCANOUT_InvertOutputColor,
      src_clk => cmd_clk,
      src_in => \CMD_SendState2_reg[InvertOutputColor_n_0_]\
    );
cdcOutputColorChannelsLogicVector: entity work.\MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1\
     port map (
      dest_clk => scanout_clk,
      dest_out(8 downto 0) => SCANOUT_OutputColorChannels(8 downto 0),
      src_clk => cmd_clk,
      src_in(8) => \CMD_SendState2_reg[OutputColorChannels_n_0_][8]\,
      src_in(7) => \CMD_SendState2_reg[OutputColorChannels_n_0_][7]\,
      src_in(6) => \CMD_SendState2_reg[OutputColorChannels_n_0_][6]\,
      src_in(5) => \CMD_SendState2_reg[OutputColorChannels_n_0_][5]\,
      src_in(4) => \CMD_SendState2_reg[OutputColorChannels_n_0_][4]\,
      src_in(3) => \CMD_SendState2_reg[OutputColorChannels_n_0_][3]\,
      src_in(2) => \CMD_SendState2_reg[OutputColorChannels_n_0_][2]\,
      src_in(1) => \CMD_SendState2_reg[OutputColorChannels_n_0_][1]\,
      src_in(0) => \CMD_SendState2_reg[OutputColorChannels_n_0_][0]\
    );
cdcRenderTargetBaseAddrLogicVector: entity work.MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single
     port map (
      dest_clk => scanout_clk,
      dest_out(29 downto 0) => SCANOUT_RenderTargetBaseAddr(29 downto 0),
      src_clk => cmd_clk,
      src_in(29) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29]\,
      src_in(28) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28]\,
      src_in(27) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27]\,
      src_in(26) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26]\,
      src_in(25) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25]\,
      src_in(24) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24]\,
      src_in(23) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23]\,
      src_in(22) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22]\,
      src_in(21) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21]\,
      src_in(20) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20]\,
      src_in(19) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19]\,
      src_in(18) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18]\,
      src_in(17) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17]\,
      src_in(16) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16]\,
      src_in(15) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15]\,
      src_in(14) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14]\,
      src_in(13) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13]\,
      src_in(12) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12]\,
      src_in(11) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11]\,
      src_in(10) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10]\,
      src_in(9) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9]\,
      src_in(8) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8]\,
      src_in(7) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7]\,
      src_in(6) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6]\,
      src_in(5) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5]\,
      src_in(4) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4]\,
      src_in(3) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3]\,
      src_in(2) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2]\,
      src_in(1) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1]\,
      src_in(0) => \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0]\
    );
cdcScanEnableLogic: entity work.\MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1\
     port map (
      dest_clk => scanout_clk,
      dest_out => SCANOUT_ScanEnable,
      src_clk => cmd_clk,
      src_in => \CMD_SendState2_reg[ScanEnable_n_0_]\
    );
cdcVSyncLogic: entity work.MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single
     port map (
      dest_clk => cmd_clk,
      dest_out => VSync_Signal_Pipeline0,
      src_clk => scanout_clk,
      src_in => SCANOUT_VSync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_CDC_Command_Scanout_0_0 is
  port (
    cmd_clk : in STD_LOGIC;
    CMD_VSync : out STD_LOGIC;
    CMD_RenderTargetBaseAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    scanout_clk : in STD_LOGIC;
    SCANOUT_VSync : in STD_LOGIC;
    SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SCANOUT_ScanEnable : out STD_LOGIC;
    SCANOUT_InvertOutputColor : out STD_LOGIC;
    SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_CDC_Command_Scanout_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_CDC_Command_Scanout_0_0 : entity is "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_CDC_Command_Scanout_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_CDC_Command_Scanout_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_CDC_Command_Scanout_0_0 : entity is "CDC_Command_Scanout,Vivado 2025.2";
end MainDesign_CDC_Command_Scanout_0_0;

architecture STRUCTURE of MainDesign_CDC_Command_Scanout_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of cmd_clk : signal is "xilinx.com:signal:clock:1.0 cmd_clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of cmd_clk : signal is "slave cmd_clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of cmd_clk : signal is "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of scanout_clk : signal is "xilinx.com:signal:clock:1.0 scanout_clk CLK";
  attribute x_interface_mode of scanout_clk : signal is "slave scanout_clk";
  attribute x_interface_parameter of scanout_clk : signal is "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0";
begin
U0: entity work.MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout
     port map (
      CMD_InvertOutputColor => CMD_InvertOutputColor,
      CMD_OutputColorChannels(8 downto 0) => CMD_OutputColorChannels(8 downto 0),
      CMD_RenderTargetBaseAddr(29 downto 0) => CMD_RenderTargetBaseAddr(29 downto 0),
      CMD_ScanEnable => CMD_ScanEnable,
      CMD_VSync => CMD_VSync,
      SCANOUT_InvertOutputColor => SCANOUT_InvertOutputColor,
      SCANOUT_OutputColorChannels(8 downto 0) => SCANOUT_OutputColorChannels(8 downto 0),
      SCANOUT_RenderTargetBaseAddr(29 downto 0) => SCANOUT_RenderTargetBaseAddr(29 downto 0),
      SCANOUT_ScanEnable => SCANOUT_ScanEnable,
      SCANOUT_VSync => SCANOUT_VSync,
      cmd_clk => cmd_clk,
      scanout_clk => scanout_clk
    );
end STRUCTURE;
