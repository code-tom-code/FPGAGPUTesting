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

-- IP VLNV: xilinx.com:module_ref:CDC_EthernetController_NetPktProcessor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_CDC_EthernetControll_0_0 IS
  PORT (
    Out_clk333 : IN STD_LOGIC;
    Out_Signal : OUT STD_LOGIC;
    In_clk125 : IN STD_LOGIC;
    In_Signal : IN STD_LOGIC
  );
END design_1_CDC_EthernetControll_0_0;

ARCHITECTURE design_1_CDC_EthernetControll_0_0_arch OF design_1_CDC_EthernetControll_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_CDC_EthernetControll_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT CDC_EthernetController_NetPktProcessor IS
    PORT (
      Out_clk333 : IN STD_LOGIC;
      Out_Signal : OUT STD_LOGIC;
      In_clk125 : IN STD_LOGIC;
      In_Signal : IN STD_LOGIC
    );
  END COMPONENT CDC_EthernetController_NetPktProcessor;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF In_clk125: SIGNAL IS "XIL_INTERFACENAME In_clk_125, FREQ_HZ 125000000, PHASE 0, CLK_DOMAIN design_1_gig_ethernet_pcs_pma_0_0_clk125_out";
  ATTRIBUTE X_INTERFACE_INFO OF In_clk125: SIGNAL IS "xilinx.com:signal:clock:1.0 In_clk_125 CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Out_clk333: SIGNAL IS "XIL_INTERFACENAME Out_clk_333, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF Out_clk333: SIGNAL IS "xilinx.com:signal:clock:1.0 Out_clk_333 CLK";
BEGIN
  U0 : CDC_EthernetController_NetPktProcessor
    PORT MAP (
      Out_clk333 => Out_clk333,
      Out_Signal => Out_Signal,
      In_clk125 => In_clk125,
      In_Signal => In_Signal
    );
END design_1_CDC_EthernetControll_0_0_arch;
