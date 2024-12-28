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

-- IP VLNV: xilinx.com:module_ref:IndexBufferCache:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_IndexBufferCache_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    VBB_ReadEnable : IN STD_LOGIC;
    VBB_ReadAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    VBB_ReadData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    VBB_ReadReady : OUT STD_LOGIC;
    VBB_InvalidateIndexCache : IN STD_LOGIC;
    IBCReadRequestsFIFO_full : IN STD_LOGIC;
    IBCReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    IBCReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    IBCReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    IBCReadResponsesFIFO_empty : IN STD_LOGIC;
    IBCReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    DBG_State : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_IBCReadRequestsFIFO_full : OUT STD_LOGIC;
    DBG_IBCReadResponsesFIFO_empty : OUT STD_LOGIC
  );
END design_1_IndexBufferCache_0_0;

ARCHITECTURE design_1_IndexBufferCache_0_0_arch OF design_1_IndexBufferCache_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_IndexBufferCache_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT IndexBufferCache IS
    PORT (
      clk : IN STD_LOGIC;
      VBB_ReadEnable : IN STD_LOGIC;
      VBB_ReadAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      VBB_ReadData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      VBB_ReadReady : OUT STD_LOGIC;
      VBB_InvalidateIndexCache : IN STD_LOGIC;
      IBCReadRequestsFIFO_full : IN STD_LOGIC;
      IBCReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      IBCReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      IBCReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      IBCReadResponsesFIFO_empty : IN STD_LOGIC;
      IBCReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      DBG_State : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_IBCReadRequestsFIFO_full : OUT STD_LOGIC;
      DBG_IBCReadResponsesFIFO_empty : OUT STD_LOGIC
    );
  END COMPONENT IndexBufferCache;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF IBCReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests FULL";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : IndexBufferCache
    PORT MAP (
      clk => clk,
      VBB_ReadEnable => VBB_ReadEnable,
      VBB_ReadAddr => VBB_ReadAddr,
      VBB_ReadData => VBB_ReadData,
      VBB_ReadReady => VBB_ReadReady,
      VBB_InvalidateIndexCache => VBB_InvalidateIndexCache,
      IBCReadRequestsFIFO_full => IBCReadRequestsFIFO_full,
      IBCReadRequestsFIFO_wr_data => IBCReadRequestsFIFO_wr_data,
      IBCReadRequestsFIFO_wr_en => IBCReadRequestsFIFO_wr_en,
      IBCReadResponsesFIFO_rd_data => IBCReadResponsesFIFO_rd_data,
      IBCReadResponsesFIFO_empty => IBCReadResponsesFIFO_empty,
      IBCReadResponsesFIFO_rd_en => IBCReadResponsesFIFO_rd_en,
      DBG_State => DBG_State,
      DBG_IBCReadRequestsFIFO_full => DBG_IBCReadRequestsFIFO_full,
      DBG_IBCReadResponsesFIFO_empty => DBG_IBCReadResponsesFIFO_empty
    );
END design_1_IndexBufferCache_0_0_arch;
