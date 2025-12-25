-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:04:04 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_EthernetMDIOControll_0_0/MainDesign_EthernetMDIOControll_0_0_stub.vhdl
-- Design      : MainDesign_EthernetMDIOControll_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_EthernetMDIOControll_0_0 is
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_EthernetMDIOControll_0_0 : entity is "MainDesign_EthernetMDIOControll_0_0,EthernetMDIOController,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_EthernetMDIOControll_0_0 : entity is "MainDesign_EthernetMDIOControll_0_0,EthernetMDIOController,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetMDIOController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,USE_CLAUSE_45_PACKETS=false}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_EthernetMDIOControll_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_EthernetMDIOControll_0_0 : entity is "module_ref";
end MainDesign_EthernetMDIOControll_0_0;

architecture stub of MainDesign_EthernetMDIOControll_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clkin25,mdio_clk,mdio_i,mdio_o,mdio_t,mdio_t_ctrl,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,DBG_BitsRemaining[5:0],DBG_InProgressRead[15:0],DBG_EthMDIO_State[4:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clkin25 : signal is "xilinx.com:signal:clock:1.0 clkin25 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clkin25 : signal is "slave clkin25";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clkin25 : signal is "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, ASSOCIATED_BUSIF MDIO, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
  attribute x_interface_info of mdio_clk : signal is "xilinx.com:interface:mdio:1.0 MDIO MDC";
  attribute x_interface_mode of mdio_clk : signal is "master MDIO";
  attribute x_interface_parameter of mdio_clk : signal is "XIL_INTERFACENAME MDIO, FREQ_HZ 2500000, CAN_DEBUG false";
  attribute x_interface_info of mdio_i : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  attribute x_interface_info of mdio_o : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
  attribute x_interface_info of mdio_t : signal is "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "EthernetMDIOController,Vivado 2025.2";
begin
end;
