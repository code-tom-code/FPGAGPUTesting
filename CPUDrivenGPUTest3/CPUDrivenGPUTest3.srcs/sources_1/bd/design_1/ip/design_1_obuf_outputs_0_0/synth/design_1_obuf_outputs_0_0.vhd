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

-- IP VLNV: xilinx.com:module_ref:obuf_outputs:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_obuf_outputs_0_0 IS
  PORT (
    red_s : IN STD_LOGIC;
    green_s : IN STD_LOGIC;
    blue_s : IN STD_LOGIC;
    cl_s : IN STD_LOGIC;
    out_red_p : OUT STD_LOGIC;
    out_red_n : OUT STD_LOGIC;
    out_green_p : OUT STD_LOGIC;
    out_green_n : OUT STD_LOGIC;
    out_blue_p : OUT STD_LOGIC;
    out_blue_n : OUT STD_LOGIC;
    out_cl_p : OUT STD_LOGIC;
    out_cl_n : OUT STD_LOGIC
  );
END design_1_obuf_outputs_0_0;

ARCHITECTURE design_1_obuf_outputs_0_0_arch OF design_1_obuf_outputs_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_obuf_outputs_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT obuf_outputs IS
    PORT (
      red_s : IN STD_LOGIC;
      green_s : IN STD_LOGIC;
      blue_s : IN STD_LOGIC;
      cl_s : IN STD_LOGIC;
      out_red_p : OUT STD_LOGIC;
      out_red_n : OUT STD_LOGIC;
      out_green_p : OUT STD_LOGIC;
      out_green_n : OUT STD_LOGIC;
      out_blue_p : OUT STD_LOGIC;
      out_blue_n : OUT STD_LOGIC;
      out_cl_p : OUT STD_LOGIC;
      out_cl_n : OUT STD_LOGIC
    );
  END COMPONENT obuf_outputs;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_obuf_outputs_0_0_arch: ARCHITECTURE IS "obuf_outputs,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_obuf_outputs_0_0_arch : ARCHITECTURE IS "design_1_obuf_outputs_0_0,obuf_outputs,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_obuf_outputs_0_0_arch: ARCHITECTURE IS "design_1_obuf_outputs_0_0,obuf_outputs,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=obuf_outputs,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
BEGIN
  U0 : obuf_outputs
    PORT MAP (
      red_s => red_s,
      green_s => green_s,
      blue_s => blue_s,
      cl_s => cl_s,
      out_red_p => out_red_p,
      out_red_n => out_red_n,
      out_green_p => out_green_p,
      out_green_n => out_green_n,
      out_blue_p => out_blue_p,
      out_blue_n => out_blue_n,
      out_cl_p => out_cl_p,
      out_cl_n => out_cl_n
    );
END design_1_obuf_outputs_0_0_arch;
