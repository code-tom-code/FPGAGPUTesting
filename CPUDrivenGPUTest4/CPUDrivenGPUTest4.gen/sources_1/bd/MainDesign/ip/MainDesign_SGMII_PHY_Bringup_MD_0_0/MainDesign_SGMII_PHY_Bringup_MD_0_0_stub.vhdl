-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:50:40 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_SGMII_PHY_Bringup_MD_0_0/MainDesign_SGMII_PHY_Bringup_MD_0_0_stub.vhdl
-- Design      : MainDesign_SGMII_PHY_Bringup_MD_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_SGMII_PHY_Bringup_MD_0_0 is
  Port ( 
    clkin25 : in STD_LOGIC;
    dbgRst : in STD_LOGIC;
    registerReadData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : in STD_LOGIC;
    registerWriteComplete : in STD_LOGIC;
    newRequestPHYAddress : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : out STD_LOGIC;
    newRequestStart : out STD_LOGIC;
    phyBringupComplete : out STD_LOGIC;
    DBG_RegReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_RegPCSPMAReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegPCSPMAReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Bringup_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=SGMII_PHY_Bringup_MDIO,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,PHY_Address=3,PCS_Address=1}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_SGMII_PHY_Bringup_MD_0_0 : entity is "module_ref";
end MainDesign_SGMII_PHY_Bringup_MD_0_0;

architecture stub of MainDesign_SGMII_PHY_Bringup_MD_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clkin25,dbgRst,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,phyBringupComplete,DBG_RegReadIndex[4:0],DBG_RegReadData[15:0],DBG_RegPCSPMAReadIndex[4:0],DBG_RegPCSPMAReadData[15:0],DBG_Bringup_State[4:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clkin25 : signal is "xilinx.com:signal:clock:1.0 clkin25 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clkin25 : signal is "slave clkin25";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin25 : signal is "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "SGMII_PHY_Bringup_MDIO,Vivado 2025.2";
begin
end;
