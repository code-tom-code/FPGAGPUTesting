-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:EthernetMDIOController:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_EthernetMDIOControll_0_0 IS
  PORT (
    clkin25 : IN STD_LOGIC;
    mdio_clk : OUT STD_LOGIC;
    mdio_i : OUT STD_LOGIC;
    mdio_o : IN STD_LOGIC;
    mdio_t : IN STD_LOGIC;
    mdio_t_ctrl : OUT STD_LOGIC;
    registerReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    registerReadReady : OUT STD_LOGIC;
    registerWriteComplete : OUT STD_LOGIC;
    newRequestPHYAddress : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    newRequestDevTypeRegister : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    newRequestRegister : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    newRequestData : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    newRequestIsWrite : IN STD_LOGIC;
    newRequestStart : IN STD_LOGIC;
    DBG_BitsRemaining : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_InProgressRead : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_EthMDIO_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END design_1_EthernetMDIOControll_0_0;

ARCHITECTURE design_1_EthernetMDIOControll_0_0_arch OF design_1_EthernetMDIOControll_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_EthernetMDIOControll_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT EthernetMDIOController IS
    GENERIC (
      USE_CLAUSE_45_PACKETS : BOOLEAN
    );
    PORT (
      clkin25 : IN STD_LOGIC;
      mdio_clk : OUT STD_LOGIC;
      mdio_i : OUT STD_LOGIC;
      mdio_o : IN STD_LOGIC;
      mdio_t : IN STD_LOGIC;
      mdio_t_ctrl : OUT STD_LOGIC;
      registerReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      registerReadReady : OUT STD_LOGIC;
      registerWriteComplete : OUT STD_LOGIC;
      newRequestPHYAddress : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      newRequestDevTypeRegister : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      newRequestRegister : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      newRequestData : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      newRequestIsWrite : IN STD_LOGIC;
      newRequestStart : IN STD_LOGIC;
      DBG_BitsRemaining : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_InProgressRead : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_EthMDIO_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT EthernetMDIOController;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_EthernetMDIOControll_0_0_arch: ARCHITECTURE IS "EthernetMDIOController,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_EthernetMDIOControll_0_0_arch : ARCHITECTURE IS "design_1_EthernetMDIOControll_0_0,EthernetMDIOController,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_EthernetMDIOControll_0_0_arch: ARCHITECTURE IS "design_1_EthernetMDIOControll_0_0,EthernetMDIOController,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetMDIOController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,USE_CLAUSE_45_PACKETS=false}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF mdio_t: SIGNAL IS "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
  ATTRIBUTE X_INTERFACE_INFO OF mdio_o: SIGNAL IS "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
  ATTRIBUTE X_INTERFACE_INFO OF mdio_i: SIGNAL IS "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
  ATTRIBUTE X_INTERFACE_PARAMETER OF mdio_clk: SIGNAL IS "XIL_INTERFACENAME MDIO, FREQ_HZ 25000000, CAN_DEBUG false";
  ATTRIBUTE X_INTERFACE_INFO OF mdio_clk: SIGNAL IS "xilinx.com:interface:mdio:1.0 MDIO MDC";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkin25: SIGNAL IS "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, PHASE 0.000, CLK_DOMAIN design_1_ClockDivider4_1_0_0_clkout25";
  ATTRIBUTE X_INTERFACE_INFO OF clkin25: SIGNAL IS "xilinx.com:signal:clock:1.0 clkin25 CLK";
BEGIN
  U0 : EthernetMDIOController
    GENERIC MAP (
      USE_CLAUSE_45_PACKETS => false
    )
    PORT MAP (
      clkin25 => clkin25,
      mdio_clk => mdio_clk,
      mdio_i => mdio_i,
      mdio_o => mdio_o,
      mdio_t => mdio_t,
      mdio_t_ctrl => mdio_t_ctrl,
      registerReadData => registerReadData,
      registerReadReady => registerReadReady,
      registerWriteComplete => registerWriteComplete,
      newRequestPHYAddress => newRequestPHYAddress,
      newRequestDevTypeRegister => newRequestDevTypeRegister,
      newRequestRegister => newRequestRegister,
      newRequestData => newRequestData,
      newRequestIsWrite => newRequestIsWrite,
      newRequestStart => newRequestStart,
      DBG_BitsRemaining => DBG_BitsRemaining,
      DBG_InProgressRead => DBG_InProgressRead,
      DBG_EthMDIO_State => DBG_EthMDIO_State
    );
END design_1_EthernetMDIOControll_0_0_arch;
