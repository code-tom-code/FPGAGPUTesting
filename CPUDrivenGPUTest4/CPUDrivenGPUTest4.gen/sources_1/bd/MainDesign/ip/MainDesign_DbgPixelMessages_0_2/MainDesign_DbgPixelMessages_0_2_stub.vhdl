-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue Dec 16 23:51:17 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DbgPixelMessages_0_2/MainDesign_DbgPixelMessages_0_2_stub.vhdl
-- Design      : MainDesign_DbgPixelMessages_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_DbgPixelMessages_0_2 is
  Port ( 
    clk : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    DBG_BeginDump : in STD_LOGIC;
    STAGE_Message : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_MessageData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_NewMessage : in STD_LOGIC;
    DBG_IsDumping : out STD_LOGIC;
    DBG_MessageIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_DbgPixelMessages_0_2 : entity is "MainDesign_DbgPixelMessages_0_2,DbgPixelMessages,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_DbgPixelMessages_0_2 : entity is "MainDesign_DbgPixelMessages_0_2,DbgPixelMessages,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DbgPixelMessages,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_MAX_NUM_MESSAGES=64}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_DbgPixelMessages_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_DbgPixelMessages_0_2 : entity is "module_ref";
end MainDesign_DbgPixelMessages_0_2;

architecture stub of MainDesign_DbgPixelMessages_0_2 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_EndFrameReset,DBG_BeginDump,STAGE_Message[15:0],STAGE_MessageData[15:0],STAGE_NewMessage,DBG_IsDumping,DBG_MessageIndex[7:0],DBG_Message[15:0],DBG_MessageData[15:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "DbgPixelMessages,Vivado 2025.2";
begin
end;
