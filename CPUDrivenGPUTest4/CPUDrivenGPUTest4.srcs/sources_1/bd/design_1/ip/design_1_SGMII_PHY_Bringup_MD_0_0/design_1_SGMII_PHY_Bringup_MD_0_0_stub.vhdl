-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:49:24 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_SGMII_PHY_Bringup_MD_0_0/design_1_SGMII_PHY_Bringup_MD_0_0_stub.vhdl
-- Design      : design_1_SGMII_PHY_Bringup_MD_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_SGMII_PHY_Bringup_MD_0_0 is
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

end design_1_SGMII_PHY_Bringup_MD_0_0;

architecture stub of design_1_SGMII_PHY_Bringup_MD_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkin25,dbgRst,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,phyBringupComplete,DBG_RegReadIndex[4:0],DBG_RegReadData[15:0],DBG_RegPCSPMAReadIndex[4:0],DBG_RegPCSPMAReadData[15:0],DBG_Bringup_State[4:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SGMII_PHY_Bringup_MDIO,Vivado 2018.1_AR73068";
begin
end;
