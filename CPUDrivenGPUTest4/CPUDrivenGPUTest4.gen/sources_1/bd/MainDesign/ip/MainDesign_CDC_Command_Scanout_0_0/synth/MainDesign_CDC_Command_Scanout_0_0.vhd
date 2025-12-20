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

-- IP VLNV: xilinx.com:module_ref:CDC_Command_Scanout:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_CDC_Command_Scanout_0_0 IS
  PORT (
    cmd_clk : IN STD_LOGIC;
    CMD_VSync : OUT STD_LOGIC;
    CMD_RenderTargetBaseAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_ScanEnable : IN STD_LOGIC;
    CMD_InvertOutputColor : IN STD_LOGIC;
    CMD_OutputColorChannels : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    scanout_clk : IN STD_LOGIC;
    SCANOUT_VSync : IN STD_LOGIC;
    SCANOUT_RenderTargetBaseAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    SCANOUT_ScanEnable : OUT STD_LOGIC;
    SCANOUT_InvertOutputColor : OUT STD_LOGIC;
    SCANOUT_OutputColorChannels : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END MainDesign_CDC_Command_Scanout_0_0;

ARCHITECTURE MainDesign_CDC_Command_Scanout_0_0_arch OF MainDesign_CDC_Command_Scanout_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT CDC_Command_Scanout IS
    PORT (
      cmd_clk : IN STD_LOGIC;
      CMD_VSync : OUT STD_LOGIC;
      CMD_RenderTargetBaseAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_ScanEnable : IN STD_LOGIC;
      CMD_InvertOutputColor : IN STD_LOGIC;
      CMD_OutputColorChannels : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      scanout_clk : IN STD_LOGIC;
      SCANOUT_VSync : IN STD_LOGIC;
      SCANOUT_RenderTargetBaseAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      SCANOUT_ScanEnable : OUT STD_LOGIC;
      SCANOUT_InvertOutputColor : OUT STD_LOGIC;
      SCANOUT_OutputColorChannels : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
    );
  END COMPONENT CDC_Command_Scanout;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MainDesign_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "CDC_Command_Scanout,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MainDesign_CDC_Command_Scanout_0_0_arch : ARCHITECTURE IS "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MainDesign_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_Command_Scanout,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MainDesign_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF cmd_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 cmd_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF cmd_clk: SIGNAL IS "slave cmd_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cmd_clk: SIGNAL IS "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF scanout_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 scanout_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF scanout_clk: SIGNAL IS "slave scanout_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF scanout_clk: SIGNAL IS "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0";
BEGIN
  U0 : CDC_Command_Scanout
    PORT MAP (
      cmd_clk => cmd_clk,
      CMD_VSync => CMD_VSync,
      CMD_RenderTargetBaseAddr => CMD_RenderTargetBaseAddr,
      CMD_ScanEnable => CMD_ScanEnable,
      CMD_InvertOutputColor => CMD_InvertOutputColor,
      CMD_OutputColorChannels => CMD_OutputColorChannels,
      scanout_clk => scanout_clk,
      SCANOUT_VSync => SCANOUT_VSync,
      SCANOUT_RenderTargetBaseAddr => SCANOUT_RenderTargetBaseAddr,
      SCANOUT_ScanEnable => SCANOUT_ScanEnable,
      SCANOUT_InvertOutputColor => SCANOUT_InvertOutputColor,
      SCANOUT_OutputColorChannels => SCANOUT_OutputColorChannels
    );
END MainDesign_CDC_Command_Scanout_0_0_arch;
