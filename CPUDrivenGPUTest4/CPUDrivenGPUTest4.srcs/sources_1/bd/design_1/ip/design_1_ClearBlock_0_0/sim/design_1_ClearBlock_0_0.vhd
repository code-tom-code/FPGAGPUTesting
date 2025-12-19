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

-- IP VLNV: xilinx.com:module_ref:ClearBlock:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ClearBlock_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_ClearBlockIsIdle : OUT STD_LOGIC;
    CMD_ClearBlockBeginSignal : IN STD_LOGIC;
    CMD_BaseRenderTargetAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_ClearColorRGBA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CMD_ClearDRAMLineCount : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    MEM_ClearBlockWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
    MEM_ClearBlockWriteRequestsFIFO_full : IN STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
    DBG_ClearBlock_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_LastWrittenClearData : OUT STD_LOGIC_VECTOR(293 DOWNTO 0)
  );
END design_1_ClearBlock_0_0;

ARCHITECTURE design_1_ClearBlock_0_0_arch OF design_1_ClearBlock_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_ClearBlock_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ClearBlock IS
    PORT (
      clk : IN STD_LOGIC;
      CMD_ClearBlockIsIdle : OUT STD_LOGIC;
      CMD_ClearBlockBeginSignal : IN STD_LOGIC;
      CMD_BaseRenderTargetAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_ClearColorRGBA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CMD_ClearDRAMLineCount : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      MEM_ClearBlockWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
      MEM_ClearBlockWriteRequestsFIFO_full : IN STD_LOGIC;
      MEM_ClearBlockWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
      DBG_ClearBlock_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_LastWrittenClearData : OUT STD_LOGIC_VECTOR(293 DOWNTO 0)
    );
  END COMPONENT ClearBlock;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ClearBlockWriteRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ClearBlockWriteRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ClearBlockWriteRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : ClearBlock
    PORT MAP (
      clk => clk,
      CMD_ClearBlockIsIdle => CMD_ClearBlockIsIdle,
      CMD_ClearBlockBeginSignal => CMD_ClearBlockBeginSignal,
      CMD_BaseRenderTargetAddr => CMD_BaseRenderTargetAddr,
      CMD_ClearColorRGBA => CMD_ClearColorRGBA,
      CMD_ClearDRAMLineCount => CMD_ClearDRAMLineCount,
      MEM_ClearBlockWriteRequestsFIFO_wr_data => MEM_ClearBlockWriteRequestsFIFO_wr_data,
      MEM_ClearBlockWriteRequestsFIFO_full => MEM_ClearBlockWriteRequestsFIFO_full,
      MEM_ClearBlockWriteRequestsFIFO_wr_en => MEM_ClearBlockWriteRequestsFIFO_wr_en,
      DBG_ClearBlock_State => DBG_ClearBlock_State,
      DBG_LastWrittenClearData => DBG_LastWrittenClearData
    );
END design_1_ClearBlock_0_0_arch;
