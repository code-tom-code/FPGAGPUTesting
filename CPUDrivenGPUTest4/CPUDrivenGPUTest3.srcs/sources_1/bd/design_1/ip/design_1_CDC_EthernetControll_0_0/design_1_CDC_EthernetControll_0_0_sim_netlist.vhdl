-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:51:06 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_CDC_EthernetControll_0_0/design_1_CDC_EthernetControll_0_0_sim_netlist.vhdl
-- Design      : design_1_CDC_EthernetControll_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CDC_EthernetControll_0_0_xpm_cdc_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "TRUE";
  attribute xpm_cdc : string;
  attribute xpm_cdc of design_1_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "SINGLE";
end design_1_CDC_EthernetControll_0_0_xpm_cdc_single;

architecture STRUCTURE of design_1_CDC_EthernetControll_0_0_xpm_cdc_single is
  signal src_ff : STD_LOGIC;
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
      Q => src_ff,
      R => '0'
    );
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => src_ff,
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
entity design_1_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor is
  port (
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC;
    Out_clk333 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor : entity is "CDC_EthernetController_NetPktProcessor";
end design_1_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor;

architecture STRUCTURE of design_1_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor is
  signal Signal_Pipeline2_reg_srl2_n_0 : STD_LOGIC;
  signal dest_out : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of Signal_Pipeline2_reg_srl2 : label is "\U0/Signal_Pipeline2_reg_srl2 ";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of cdcVSyncLogic : label is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of cdcVSyncLogic : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of cdcVSyncLogic : label is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of cdcVSyncLogic : label is 1;
  attribute VERSION : integer;
  attribute VERSION of cdcVSyncLogic : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of cdcVSyncLogic : label is "SINGLE";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of cdcVSyncLogic : label is "TRUE";
begin
Out_Signal_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Out_clk333,
      CE => '1',
      D => Signal_Pipeline2_reg_srl2_n_0,
      Q => Out_Signal,
      R => '0'
    );
Signal_Pipeline2_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => Out_clk333,
      D => dest_out,
      Q => Signal_Pipeline2_reg_srl2_n_0
    );
cdcVSyncLogic: entity work.design_1_CDC_EthernetControll_0_0_xpm_cdc_single
     port map (
      dest_clk => Out_clk333,
      dest_out => dest_out,
      src_clk => In_clk125,
      src_in => In_Signal
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CDC_EthernetControll_0_0 is
  port (
    Out_clk333 : in STD_LOGIC;
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_CDC_EthernetControll_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_CDC_EthernetControll_0_0 : entity is "design_1_CDC_EthernetControll_0_0,CDC_EthernetController_NetPktProcessor,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_CDC_EthernetControll_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_CDC_EthernetControll_0_0 : entity is "CDC_EthernetController_NetPktProcessor,Vivado 2018.1_AR73068";
end design_1_CDC_EthernetControll_0_0;

architecture STRUCTURE of design_1_CDC_EthernetControll_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of In_clk125 : signal is "xilinx.com:signal:clock:1.0 In_clk_125 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of In_clk125 : signal is "XIL_INTERFACENAME In_clk_125, FREQ_HZ 125000000, PHASE 0, CLK_DOMAIN design_1_gig_ethernet_pcs_pma_0_0_clk125_out";
  attribute x_interface_info of Out_clk333 : signal is "xilinx.com:signal:clock:1.0 Out_clk_333 CLK";
  attribute x_interface_parameter of Out_clk333 : signal is "XIL_INTERFACENAME Out_clk_333, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
begin
U0: entity work.design_1_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor
     port map (
      In_Signal => In_Signal,
      In_clk125 => In_clk125,
      Out_Signal => Out_Signal,
      Out_clk333 => Out_clk333
    );
end STRUCTURE;
