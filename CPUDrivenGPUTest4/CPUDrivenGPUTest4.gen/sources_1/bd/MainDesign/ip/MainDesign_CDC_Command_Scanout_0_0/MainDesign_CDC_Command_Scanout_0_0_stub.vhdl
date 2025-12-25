-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:58:44 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_Command_Scanout_0_0/MainDesign_CDC_Command_Scanout_0_0_stub.vhdl
-- Design      : MainDesign_CDC_Command_Scanout_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_CDC_Command_Scanout_0_0 is
  Port ( 
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_CDC_Command_Scanout_0_0 : entity is "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_CDC_Command_Scanout_0_0 : entity is "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_Command_Scanout,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_CDC_Command_Scanout_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_CDC_Command_Scanout_0_0 : entity is "module_ref";
end MainDesign_CDC_Command_Scanout_0_0;

architecture stub of MainDesign_CDC_Command_Scanout_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "cmd_clk,CMD_VSync,CMD_RenderTargetBaseAddr[29:0],CMD_ScanEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],scanout_clk,SCANOUT_VSync,SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of cmd_clk : signal is "xilinx.com:signal:clock:1.0 cmd_clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of cmd_clk : signal is "slave cmd_clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of cmd_clk : signal is "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of scanout_clk : signal is "xilinx.com:signal:clock:1.0 scanout_clk CLK";
  attribute x_interface_mode of scanout_clk : signal is "slave scanout_clk";
  attribute x_interface_parameter of scanout_clk : signal is "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "CDC_Command_Scanout,Vivado 2025.2";
begin
end;
