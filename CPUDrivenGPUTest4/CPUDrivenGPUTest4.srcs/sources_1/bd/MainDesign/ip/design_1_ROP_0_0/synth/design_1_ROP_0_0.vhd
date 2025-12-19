-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:ROP:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ROP_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    MEM_ROPReadRequestsFIFO_full : IN STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    MEM_ROPReadResponsesFIFO_empty : IN STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
    MEM_ROPWriteRequestsFIFO_full : IN STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
    CMD_SetClearColor : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CMD_ClearSignal : IN STD_LOGIC;
    CMD_ClearSignalAck : OUT STD_LOGIC;
    CMD_FlushCacheSignal : IN STD_LOGIC;
    CMD_FlushCacheAck : OUT STD_LOGIC;
    CMD_ROPIsIdle : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(100 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    TEXSAMP_InFIFO_rd_data : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    TEXSAMP_InFIFO_empty : IN STD_LOGIC;
    TEXSAMP_InFIFO_rd_en : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForMemoryRead : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountCacheHits : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountCacheMisses : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_CountPixelsPassed : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_ROP_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_CurrentPixelAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    DBG_CurrentBlendedColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_PreviousFramebufferColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_CurrentCacheLineDirtyFlags : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_TempSelectedOutputRGB : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    DBG_TempSelectedOutputA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_TempBlendedOutputRGB : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
    DBG_TempBlendedOutputA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_ReadRequestFIFOFull : OUT STD_LOGIC
  );
END design_1_ROP_0_0;

ARCHITECTURE design_1_ROP_0_0_arch OF design_1_ROP_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_ROP_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ROP IS
    PORT (
      clk : IN STD_LOGIC;
      MEM_ROPReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      MEM_ROPReadRequestsFIFO_full : IN STD_LOGIC;
      MEM_ROPReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      MEM_ROPReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      MEM_ROPReadResponsesFIFO_empty : IN STD_LOGIC;
      MEM_ROPReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      MEM_ROPWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
      MEM_ROPWriteRequestsFIFO_full : IN STD_LOGIC;
      MEM_ROPWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
      CMD_SetClearColor : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CMD_ClearSignal : IN STD_LOGIC;
      CMD_ClearSignalAck : OUT STD_LOGIC;
      CMD_FlushCacheSignal : IN STD_LOGIC;
      CMD_FlushCacheAck : OUT STD_LOGIC;
      CMD_ROPIsIdle : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(100 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      TEXSAMP_InFIFO_rd_data : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      TEXSAMP_InFIFO_empty : IN STD_LOGIC;
      TEXSAMP_InFIFO_rd_en : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForMemoryRead : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountCacheHits : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountCacheMisses : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_CountPixelsPassed : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_ROP_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_CurrentPixelAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DBG_CurrentBlendedColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_PreviousFramebufferColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_CurrentCacheLineDirtyFlags : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_TempSelectedOutputRGB : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
      DBG_TempSelectedOutputA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_TempBlendedOutputRGB : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
      DBG_TempBlendedOutputA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_ReadRequestFIFOFull : OUT STD_LOGIC
    );
  END COMPONENT ROP;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_ROP_0_0_arch: ARCHITECTURE IS "ROP,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_ROP_0_0_arch : ARCHITECTURE IS "design_1_ROP_0_0,ROP,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_ROP_0_0_arch: ARCHITECTURE IS "design_1_ROP_0_0,ROP,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ROP,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_InFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_InFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_InFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPWriteRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPWriteRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPWriteRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ROPReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : ROP
    PORT MAP (
      clk => clk,
      MEM_ROPReadRequestsFIFO_wr_data => MEM_ROPReadRequestsFIFO_wr_data,
      MEM_ROPReadRequestsFIFO_full => MEM_ROPReadRequestsFIFO_full,
      MEM_ROPReadRequestsFIFO_wr_en => MEM_ROPReadRequestsFIFO_wr_en,
      MEM_ROPReadResponsesFIFO_rd_data => MEM_ROPReadResponsesFIFO_rd_data,
      MEM_ROPReadResponsesFIFO_empty => MEM_ROPReadResponsesFIFO_empty,
      MEM_ROPReadResponsesFIFO_rd_en => MEM_ROPReadResponsesFIFO_rd_en,
      MEM_ROPWriteRequestsFIFO_wr_data => MEM_ROPWriteRequestsFIFO_wr_data,
      MEM_ROPWriteRequestsFIFO_full => MEM_ROPWriteRequestsFIFO_full,
      MEM_ROPWriteRequestsFIFO_wr_en => MEM_ROPWriteRequestsFIFO_wr_en,
      CMD_SetClearColor => CMD_SetClearColor,
      CMD_ClearSignal => CMD_ClearSignal,
      CMD_ClearSignalAck => CMD_ClearSignalAck,
      CMD_FlushCacheSignal => CMD_FlushCacheSignal,
      CMD_FlushCacheAck => CMD_FlushCacheAck,
      CMD_ROPIsIdle => CMD_ROPIsIdle,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      TEXSAMP_InFIFO_rd_data => TEXSAMP_InFIFO_rd_data,
      TEXSAMP_InFIFO_empty => TEXSAMP_InFIFO_empty,
      TEXSAMP_InFIFO_rd_en => TEXSAMP_InFIFO_rd_en,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CyclesWaitingForMemoryRead => STAT_CyclesWaitingForMemoryRead,
      STAT_CountCacheHits => STAT_CountCacheHits,
      STAT_CountCacheMisses => STAT_CountCacheMisses,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      STAT_CountPixelsPassed => STAT_CountPixelsPassed,
      DBG_ROP_State => DBG_ROP_State,
      DBG_CurrentPixelAddr => DBG_CurrentPixelAddr,
      DBG_CurrentBlendedColor => DBG_CurrentBlendedColor,
      DBG_PreviousFramebufferColor => DBG_PreviousFramebufferColor,
      DBG_CurrentCacheLineDirtyFlags => DBG_CurrentCacheLineDirtyFlags,
      DBG_TempSelectedOutputRGB => DBG_TempSelectedOutputRGB,
      DBG_TempSelectedOutputA => DBG_TempSelectedOutputA,
      DBG_TempBlendedOutputRGB => DBG_TempBlendedOutputRGB,
      DBG_TempBlendedOutputA => DBG_TempBlendedOutputA,
      DBG_ReadRequestFIFOFull => DBG_ReadRequestFIFOFull
    );
END design_1_ROP_0_0_arch;
