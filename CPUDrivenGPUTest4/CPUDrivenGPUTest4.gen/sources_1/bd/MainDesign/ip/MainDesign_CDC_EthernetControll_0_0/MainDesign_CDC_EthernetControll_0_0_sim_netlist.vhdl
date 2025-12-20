-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:50:39 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_EthernetControll_0_0/MainDesign_CDC_EthernetControll_0_0_sim_netlist.vhdl
-- Design      : MainDesign_CDC_EthernetControll_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "soft";
  attribute xpm_cdc : string;
  attribute xpm_cdc of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single : entity is "SINGLE";
end MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single;

architecture STRUCTURE of MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single is
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
entity MainDesign_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor is
  port (
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC;
    Out_clk333 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor : entity is "CDC_EthernetController_NetPktProcessor";
end MainDesign_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor;

architecture STRUCTURE of MainDesign_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor is
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
cdcVSyncLogic: entity work.MainDesign_CDC_EthernetControll_0_0_xpm_cdc_single
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
entity MainDesign_CDC_EthernetControll_0_0 is
  port (
    Out_clk333 : in STD_LOGIC;
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_CDC_EthernetControll_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_CDC_EthernetControll_0_0 : entity is "MainDesign_CDC_EthernetControll_0_0,CDC_EthernetController_NetPktProcessor,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_CDC_EthernetControll_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_CDC_EthernetControll_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_CDC_EthernetControll_0_0 : entity is "CDC_EthernetController_NetPktProcessor,Vivado 2025.2";
end MainDesign_CDC_EthernetControll_0_0;

architecture STRUCTURE of MainDesign_CDC_EthernetControll_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of In_clk125 : signal is "xilinx.com:signal:clock:1.0 In_clk_125 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of In_clk125 : signal is "slave In_clk_125";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of In_clk125 : signal is "XIL_INTERFACENAME In_clk_125, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0";
  attribute x_interface_info of Out_clk333 : signal is "xilinx.com:signal:clock:1.0 Out_clk_333 CLK";
  attribute x_interface_mode of Out_clk333 : signal is "slave Out_clk_333";
  attribute x_interface_parameter of Out_clk333 : signal is "XIL_INTERFACENAME Out_clk_333, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_CDC_EthernetControll_0_0_CDC_EthernetController_NetPktProcessor
     port map (
      In_Signal => In_Signal,
      In_clk125 => In_clk125,
      Out_Signal => Out_Signal,
      Out_clk333 => Out_clk333
    );
end STRUCTURE;
