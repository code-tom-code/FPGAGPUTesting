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

-- IP VLNV: xilinx.com:module_ref:VertexStreamCache:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_VertexStreamCache_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    VSC_ReadEnable : IN STD_LOGIC;
    VSC_ReadStreamIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    VSC_ReadDWORDAddr : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
    VSC_ReadData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSC_ReadReady : OUT STD_LOGIC;
    VSC_SetStreamVBAddress : IN STD_LOGIC;
    VSC_StreamIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    VSC_StreamVBAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    VSC_InvalidateCache : IN STD_LOGIC;
    VertexCache_clk : OUT STD_LOGIC;
    VertexCache_addra : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    VertexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    VertexCache_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VertexCache_ena : OUT STD_LOGIC;
    VertexCache_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    VSCReadRequestsFIFO_full : IN STD_LOGIC;
    VSCReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    VSCReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    VSCReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    VSCReadResponsesFIFO_empty : IN STD_LOGIC;
    VSCReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    DBG_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_CacheSetIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_CacheElementIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END design_1_VertexStreamCache_0_0;

ARCHITECTURE design_1_VertexStreamCache_0_0_arch OF design_1_VertexStreamCache_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_VertexStreamCache_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT VertexStreamCache IS
    PORT (
      clk : IN STD_LOGIC;
      VSC_ReadEnable : IN STD_LOGIC;
      VSC_ReadStreamIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      VSC_ReadDWORDAddr : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
      VSC_ReadData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSC_ReadReady : OUT STD_LOGIC;
      VSC_SetStreamVBAddress : IN STD_LOGIC;
      VSC_StreamIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      VSC_StreamVBAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      VSC_InvalidateCache : IN STD_LOGIC;
      VertexCache_clk : OUT STD_LOGIC;
      VertexCache_addra : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      VertexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      VertexCache_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VertexCache_ena : OUT STD_LOGIC;
      VertexCache_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      VSCReadRequestsFIFO_full : IN STD_LOGIC;
      VSCReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      VSCReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      VSCReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      VSCReadResponsesFIFO_empty : IN STD_LOGIC;
      VSCReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      DBG_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_CacheSetIndex : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_CacheElementIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
  END COMPONENT VertexStreamCache;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VSCReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests FULL";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache WE";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache EN";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_douta: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache DIN";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF VertexCache_clk: SIGNAL IS "XIL_INTERFACENAME VBCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF VertexCache_clk: SIGNAL IS "xilinx.com:interface:bram:1.0 VBCache CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : VertexStreamCache
    PORT MAP (
      clk => clk,
      VSC_ReadEnable => VSC_ReadEnable,
      VSC_ReadStreamIndex => VSC_ReadStreamIndex,
      VSC_ReadDWORDAddr => VSC_ReadDWORDAddr,
      VSC_ReadData => VSC_ReadData,
      VSC_ReadReady => VSC_ReadReady,
      VSC_SetStreamVBAddress => VSC_SetStreamVBAddress,
      VSC_StreamIndex => VSC_StreamIndex,
      VSC_StreamVBAddress => VSC_StreamVBAddress,
      VSC_InvalidateCache => VSC_InvalidateCache,
      VertexCache_clk => VertexCache_clk,
      VertexCache_addra => VertexCache_addra,
      VertexCache_dina => VertexCache_dina,
      VertexCache_douta => VertexCache_douta,
      VertexCache_ena => VertexCache_ena,
      VertexCache_wea => VertexCache_wea,
      VSCReadRequestsFIFO_full => VSCReadRequestsFIFO_full,
      VSCReadRequestsFIFO_wr_data => VSCReadRequestsFIFO_wr_data,
      VSCReadRequestsFIFO_wr_en => VSCReadRequestsFIFO_wr_en,
      VSCReadResponsesFIFO_rd_data => VSCReadResponsesFIFO_rd_data,
      VSCReadResponsesFIFO_empty => VSCReadResponsesFIFO_empty,
      VSCReadResponsesFIFO_rd_en => VSCReadResponsesFIFO_rd_en,
      DBG_State => DBG_State,
      DBG_CacheSetIndex => DBG_CacheSetIndex,
      DBG_CacheElementIndex => DBG_CacheElementIndex
    );
END design_1_VertexStreamCache_0_0_arch;
