-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:SGMII_PHY_Bringup_MDIO:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_SGMII_PHY_Bringup_MD_0_0 IS
  PORT (
    clkin25 : IN STD_LOGIC;
    dbgRst : IN STD_LOGIC;
    registerReadData : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    registerReadReady : IN STD_LOGIC;
    registerWriteComplete : IN STD_LOGIC;
    newRequestPHYAddress : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    newRequestDevTypeRegister : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    newRequestRegister : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    newRequestData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    newRequestIsWrite : OUT STD_LOGIC;
    newRequestStart : OUT STD_LOGIC;
    phyBringupComplete : OUT STD_LOGIC;
    DBG_RegReadIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RegReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_RegPCSPMAReadIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RegPCSPMAReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Bringup_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END MainDesign_SGMII_PHY_Bringup_MD_0_0;

ARCHITECTURE MainDesign_SGMII_PHY_Bringup_MD_0_0_arch OF MainDesign_SGMII_PHY_Bringup_MD_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_SGMII_PHY_Bringup_MD_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT SGMII_PHY_Bringup_MDIO IS
    GENERIC (
      PHY_Address : INTEGER;
      PCS_Address : INTEGER
    );
    PORT (
      clkin25 : IN STD_LOGIC;
      dbgRst : IN STD_LOGIC;
      registerReadData : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      registerReadReady : IN STD_LOGIC;
      registerWriteComplete : IN STD_LOGIC;
      newRequestPHYAddress : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      newRequestDevTypeRegister : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      newRequestRegister : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      newRequestData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      newRequestIsWrite : OUT STD_LOGIC;
      newRequestStart : OUT STD_LOGIC;
      phyBringupComplete : OUT STD_LOGIC;
      DBG_RegReadIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RegReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_RegPCSPMAReadIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RegPCSPMAReadData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Bringup_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT SGMII_PHY_Bringup_MDIO;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MainDesign_SGMII_PHY_Bringup_MD_0_0_arch: ARCHITECTURE IS "SGMII_PHY_Bringup_MDIO,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MainDesign_SGMII_PHY_Bringup_MD_0_0_arch : ARCHITECTURE IS "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MainDesign_SGMII_PHY_Bringup_MD_0_0_arch: ARCHITECTURE IS "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=SGMII_PHY_Bringup_MDIO,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,PHY_Address=3,PCS_Address=1}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MainDesign_SGMII_PHY_Bringup_MD_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clkin25: SIGNAL IS "xilinx.com:signal:clock:1.0 clkin25 CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clkin25: SIGNAL IS "slave clkin25";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkin25: SIGNAL IS "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0";
BEGIN
  U0 : SGMII_PHY_Bringup_MDIO
    GENERIC MAP (
      PHY_Address => 3,
      PCS_Address => 1
    )
    PORT MAP (
      clkin25 => clkin25,
      dbgRst => dbgRst,
      registerReadData => registerReadData,
      registerReadReady => registerReadReady,
      registerWriteComplete => registerWriteComplete,
      newRequestPHYAddress => newRequestPHYAddress,
      newRequestDevTypeRegister => newRequestDevTypeRegister,
      newRequestRegister => newRequestRegister,
      newRequestData => newRequestData,
      newRequestIsWrite => newRequestIsWrite,
      newRequestStart => newRequestStart,
      phyBringupComplete => phyBringupComplete,
      DBG_RegReadIndex => DBG_RegReadIndex,
      DBG_RegReadData => DBG_RegReadData,
      DBG_RegPCSPMAReadIndex => DBG_RegPCSPMAReadIndex,
      DBG_RegPCSPMAReadData => DBG_RegPCSPMAReadData,
      DBG_Bringup_State => DBG_Bringup_State
    );
END MainDesign_SGMII_PHY_Bringup_MD_0_0_arch;
