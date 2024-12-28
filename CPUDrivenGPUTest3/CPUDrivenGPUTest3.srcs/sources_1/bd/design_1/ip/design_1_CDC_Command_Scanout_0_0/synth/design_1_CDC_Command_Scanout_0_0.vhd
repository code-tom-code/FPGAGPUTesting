-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:CDC_Command_Scanout:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_CDC_Command_Scanout_0_0 IS
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
END design_1_CDC_Command_Scanout_0_0;

ARCHITECTURE design_1_CDC_Command_Scanout_0_0_arch OF design_1_CDC_Command_Scanout_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "yes";
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
  ATTRIBUTE X_CORE_INFO OF design_1_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "CDC_Command_Scanout,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_CDC_Command_Scanout_0_0_arch : ARCHITECTURE IS "design_1_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_CDC_Command_Scanout_0_0_arch: ARCHITECTURE IS "design_1_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_Command_Scanout,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF scanout_clk: SIGNAL IS "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_x10";
  ATTRIBUTE X_INTERFACE_INFO OF scanout_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 scanout_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cmd_clk: SIGNAL IS "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF cmd_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 cmd_clk CLK";
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
END design_1_CDC_Command_Scanout_0_0_arch;
