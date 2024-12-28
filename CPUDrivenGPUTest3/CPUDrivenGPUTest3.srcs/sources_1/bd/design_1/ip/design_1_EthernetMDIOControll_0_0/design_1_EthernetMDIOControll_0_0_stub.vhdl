-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:49:12 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_EthernetMDIOControll_0_0/design_1_EthernetMDIOControll_0_0_stub.vhdl
-- Design      : design_1_EthernetMDIOControll_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_EthernetMDIOControll_0_0 is
  Port ( 
    clkin25 : in STD_LOGIC;
    mdio_clk : out STD_LOGIC;
    mdio_i : out STD_LOGIC;
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC;
    mdio_t_ctrl : out STD_LOGIC;
    registerReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : out STD_LOGIC;
    registerWriteComplete : out STD_LOGIC;
    newRequestPHYAddress : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : in STD_LOGIC;
    newRequestStart : in STD_LOGIC;
    DBG_BitsRemaining : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_InProgressRead : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_EthMDIO_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end design_1_EthernetMDIOControll_0_0;

architecture stub of design_1_EthernetMDIOControll_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkin25,mdio_clk,mdio_i,mdio_o,mdio_t,mdio_t_ctrl,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,DBG_BitsRemaining[5:0],DBG_InProgressRead[15:0],DBG_EthMDIO_State[4:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "EthernetMDIOController,Vivado 2018.1_AR73068";
begin
end;
