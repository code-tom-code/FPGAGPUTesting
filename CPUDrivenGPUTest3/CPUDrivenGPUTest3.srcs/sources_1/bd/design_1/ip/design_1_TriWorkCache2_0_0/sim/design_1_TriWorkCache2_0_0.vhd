-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:TriWorkCache2:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_TriWorkCache2_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    DINTERP_outBarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outZ0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outZ10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outZ20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outInvW0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outInvW10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_outInvW20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_PopTriangleSlot : IN STD_LOGIC;
    INTERP_outT0X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outT0Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outT10X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outT10Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outT20X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outT20Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_outColorRGBA0 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    INTERP_outColorRGBA10 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    INTERP_outColorRGBA20 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    INTERP_PopTriangleSlot : IN STD_LOGIC;
    RAST_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT0X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT0Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT10X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT10Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT20X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inT20Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_inColorRGBA0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_inColorRGBA10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_inColorRGBA20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_PushNewTriData : IN STD_LOGIC;
    RAST_IsFull : OUT STD_LOGIC;
    DINTERP_TRIDATA_FIFO_empty : IN STD_LOGIC;
    DINTERP_TRIDATA_FIFO_rd_data : IN STD_LOGIC_VECTOR(223 DOWNTO 0);
    DINTERP_TRIDATA_FIFO_rd_en : OUT STD_LOGIC;
    DINTERP_TRIDATA_FIFO_full : IN STD_LOGIC;
    DINTERP_TRIDATA_FIFO_wr_data : OUT STD_LOGIC_VECTOR(223 DOWNTO 0);
    DINTERP_TRIDATA_FIFO_wr_en : OUT STD_LOGIC;
    INTERP_TRIDATA_FIFO_empty : IN STD_LOGIC;
    INTERP_TRIDATA_FIFO_rd_data : IN STD_LOGIC_VECTOR(575 DOWNTO 0);
    INTERP_TRIDATA_FIFO_rd_en : OUT STD_LOGIC;
    INTERP_TRIDATA_FIFO_full : IN STD_LOGIC;
    INTERP_TRIDATA_FIFO_wr_data : OUT STD_LOGIC_VECTOR(575 DOWNTO 0);
    INTERP_TRIDATA_FIFO_wr_en : OUT STD_LOGIC
  );
END design_1_TriWorkCache2_0_0;

ARCHITECTURE design_1_TriWorkCache2_0_0_arch OF design_1_TriWorkCache2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_TriWorkCache2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT TriWorkCache2 IS
    PORT (
      clk : IN STD_LOGIC;
      DINTERP_outBarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outZ0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outZ10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outZ20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outInvW0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outInvW10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_outInvW20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_PopTriangleSlot : IN STD_LOGIC;
      INTERP_outT0X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outT0Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outT10X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outT10Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outT20X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outT20Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_outColorRGBA0 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      INTERP_outColorRGBA10 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      INTERP_outColorRGBA20 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      INTERP_PopTriangleSlot : IN STD_LOGIC;
      RAST_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT0X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT0Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT10X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT10Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT20X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inT20Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_inColorRGBA0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_inColorRGBA10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_inColorRGBA20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_PushNewTriData : IN STD_LOGIC;
      RAST_IsFull : OUT STD_LOGIC;
      DINTERP_TRIDATA_FIFO_empty : IN STD_LOGIC;
      DINTERP_TRIDATA_FIFO_rd_data : IN STD_LOGIC_VECTOR(223 DOWNTO 0);
      DINTERP_TRIDATA_FIFO_rd_en : OUT STD_LOGIC;
      DINTERP_TRIDATA_FIFO_full : IN STD_LOGIC;
      DINTERP_TRIDATA_FIFO_wr_data : OUT STD_LOGIC_VECTOR(223 DOWNTO 0);
      DINTERP_TRIDATA_FIFO_wr_en : OUT STD_LOGIC;
      INTERP_TRIDATA_FIFO_empty : IN STD_LOGIC;
      INTERP_TRIDATA_FIFO_rd_data : IN STD_LOGIC_VECTOR(575 DOWNTO 0);
      INTERP_TRIDATA_FIFO_rd_en : OUT STD_LOGIC;
      INTERP_TRIDATA_FIFO_full : IN STD_LOGIC;
      INTERP_TRIDATA_FIFO_wr_data : OUT STD_LOGIC_VECTOR(575 DOWNTO 0);
      INTERP_TRIDATA_FIFO_wr_en : OUT STD_LOGIC
    );
  END COMPONENT TriWorkCache2;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_TRIDATA_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_TRIDATA_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : TriWorkCache2
    PORT MAP (
      clk => clk,
      DINTERP_outBarycentricInverse => DINTERP_outBarycentricInverse,
      DINTERP_outZ0 => DINTERP_outZ0,
      DINTERP_outZ10 => DINTERP_outZ10,
      DINTERP_outZ20 => DINTERP_outZ20,
      DINTERP_outInvW0 => DINTERP_outInvW0,
      DINTERP_outInvW10 => DINTERP_outInvW10,
      DINTERP_outInvW20 => DINTERP_outInvW20,
      DINTERP_PopTriangleSlot => DINTERP_PopTriangleSlot,
      INTERP_outT0X => INTERP_outT0X,
      INTERP_outT0Y => INTERP_outT0Y,
      INTERP_outT10X => INTERP_outT10X,
      INTERP_outT10Y => INTERP_outT10Y,
      INTERP_outT20X => INTERP_outT20X,
      INTERP_outT20Y => INTERP_outT20Y,
      INTERP_outColorRGBA0 => INTERP_outColorRGBA0,
      INTERP_outColorRGBA10 => INTERP_outColorRGBA10,
      INTERP_outColorRGBA20 => INTERP_outColorRGBA20,
      INTERP_PopTriangleSlot => INTERP_PopTriangleSlot,
      RAST_inBarycentricInverse => RAST_inBarycentricInverse,
      RAST_inZ0 => RAST_inZ0,
      RAST_inZ10 => RAST_inZ10,
      RAST_inZ20 => RAST_inZ20,
      RAST_inInvW0 => RAST_inInvW0,
      RAST_inInvW10 => RAST_inInvW10,
      RAST_inInvW20 => RAST_inInvW20,
      RAST_inT0X => RAST_inT0X,
      RAST_inT0Y => RAST_inT0Y,
      RAST_inT10X => RAST_inT10X,
      RAST_inT10Y => RAST_inT10Y,
      RAST_inT20X => RAST_inT20X,
      RAST_inT20Y => RAST_inT20Y,
      RAST_inColorRGBA0 => RAST_inColorRGBA0,
      RAST_inColorRGBA10 => RAST_inColorRGBA10,
      RAST_inColorRGBA20 => RAST_inColorRGBA20,
      RAST_PushNewTriData => RAST_PushNewTriData,
      RAST_IsFull => RAST_IsFull,
      DINTERP_TRIDATA_FIFO_empty => DINTERP_TRIDATA_FIFO_empty,
      DINTERP_TRIDATA_FIFO_rd_data => DINTERP_TRIDATA_FIFO_rd_data,
      DINTERP_TRIDATA_FIFO_rd_en => DINTERP_TRIDATA_FIFO_rd_en,
      DINTERP_TRIDATA_FIFO_full => DINTERP_TRIDATA_FIFO_full,
      DINTERP_TRIDATA_FIFO_wr_data => DINTERP_TRIDATA_FIFO_wr_data,
      DINTERP_TRIDATA_FIFO_wr_en => DINTERP_TRIDATA_FIFO_wr_en,
      INTERP_TRIDATA_FIFO_empty => INTERP_TRIDATA_FIFO_empty,
      INTERP_TRIDATA_FIFO_rd_data => INTERP_TRIDATA_FIFO_rd_data,
      INTERP_TRIDATA_FIFO_rd_en => INTERP_TRIDATA_FIFO_rd_en,
      INTERP_TRIDATA_FIFO_full => INTERP_TRIDATA_FIFO_full,
      INTERP_TRIDATA_FIFO_wr_data => INTERP_TRIDATA_FIFO_wr_data,
      INTERP_TRIDATA_FIFO_wr_en => INTERP_TRIDATA_FIFO_wr_en
    );
END design_1_TriWorkCache2_0_0_arch;
