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

-- IP VLNV: xilinx.com:module_ref:StatsCollector:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_StatsCollector_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_PresentSignal : IN STD_LOGIC;
    CMD_SetNewStatsConfig : IN STD_LOGIC;
    CMD_WriteFrameStatsAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_EnableEventTimestamps : IN STD_LOGIC;
    CMD_WriteEventTimestampsAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_WriteEventTimestampOrders : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_CountTimestampsMemoryWrites : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_CountTimestampsOrdersMemoryWrites : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_StatsSaveComplete : OUT STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
    MEM_StatsWriteRequestsFIFO_full : IN STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_WriteOrderNibblesFIFO_full : IN STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_en : OUT STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_WriteOrderNibblesFIFO_empty : IN STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_en : OUT STD_LOGIC;
    STAT_ResetWriteOrderNibblesFIFO : OUT STD_LOGIC;
    VBB_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VBB_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VBB_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VBB_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    VSHADER_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSHADER_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSHADER_CyclesExecShaderCode : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSHADER_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSHADER_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    IA_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_CyclesLoadingDataToCache : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CLIP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_CyclesWaitingForTriWorkCache : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    DINTERP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    INTERP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    INTERP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TEXSAMP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TEXSAMP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TEXSAMP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TEXSAMP_CyclesWaitingCacheLoad : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TEXSAMP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ROP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CyclesWaitingForMemoryRead : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CountCacheHits : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CountCacheMisses : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CMD_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_ReadCyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_ReadCyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_WriteCyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_WriteCyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemReadCountBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemReadCountTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemReadCountNonScanoutBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemReadCountNonScanoutTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemWriteCountBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    MEM_MemWriteCountTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_CurrentState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_EventsWriteIsReady : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DBG_EventsWriteIsReadyAck : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DBG_CurrentWriteOrderNibbles : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_CurrentWriteData : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
    DBG_CurrentWriteEn : OUT STD_LOGIC
  );
END design_1_StatsCollector_0_0;

ARCHITECTURE design_1_StatsCollector_0_0_arch OF design_1_StatsCollector_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_StatsCollector_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT StatsCollector IS
    PORT (
      clk : IN STD_LOGIC;
      CMD_PresentSignal : IN STD_LOGIC;
      CMD_SetNewStatsConfig : IN STD_LOGIC;
      CMD_WriteFrameStatsAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_EnableEventTimestamps : IN STD_LOGIC;
      CMD_WriteEventTimestampsAddress : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_WriteEventTimestampOrders : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_CountTimestampsMemoryWrites : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_CountTimestampsOrdersMemoryWrites : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_StatsSaveComplete : OUT STD_LOGIC;
      MEM_StatsWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
      MEM_StatsWriteRequestsFIFO_full : IN STD_LOGIC;
      MEM_StatsWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
      STAT_WriteOrderNibblesFIFO_wr_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_WriteOrderNibblesFIFO_full : IN STD_LOGIC;
      STAT_WriteOrderNibblesFIFO_wr_en : OUT STD_LOGIC;
      STAT_WriteOrderNibblesFIFO_rd_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_WriteOrderNibblesFIFO_empty : IN STD_LOGIC;
      STAT_WriteOrderNibblesFIFO_rd_en : OUT STD_LOGIC;
      STAT_ResetWriteOrderNibblesFIFO : OUT STD_LOGIC;
      VBB_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VBB_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VBB_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VBB_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      VSHADER_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSHADER_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSHADER_CyclesExecShaderCode : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSHADER_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSHADER_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      IA_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_CyclesLoadingDataToCache : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CLIP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_CyclesWaitingForTriWorkCache : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      DINTERP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      INTERP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      INTERP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TEXSAMP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TEXSAMP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TEXSAMP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TEXSAMP_CyclesWaitingCacheLoad : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TEXSAMP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      ROP_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CyclesWaitingForOutput : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CyclesWaitingForMemoryRead : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CountCacheHits : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CountCacheMisses : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_CyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CMD_CyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_ReadCyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_ReadCyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_WriteCyclesIdle : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_WriteCyclesSpentWorking : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemReadCountBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemReadCountTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemReadCountNonScanoutBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemReadCountNonScanoutTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemWriteCountBytesTransferred : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      MEM_MemWriteCountTransactions : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_CurrentState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_EventsWriteIsReady : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DBG_EventsWriteIsReadyAck : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DBG_CurrentWriteOrderNibbles : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_CurrentWriteData : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
      DBG_CurrentWriteEn : OUT STD_LOGIC
    );
  END COMPONENT StatsCollector;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_StatsCollector_0_0_arch: ARCHITECTURE IS "StatsCollector,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_StatsCollector_0_0_arch : ARCHITECTURE IS "design_1_StatsCollector_0_0,StatsCollector,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_StatsCollector_0_0_arch: ARCHITECTURE IS "design_1_StatsCollector_0_0,StatsCollector,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StatsCollector,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR FULL";
  ATTRIBUTE X_INTERFACE_INFO OF STAT_WriteOrderNibblesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_StatsWriteRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_StatsWriteRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_StatsWriteRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : StatsCollector
    PORT MAP (
      clk => clk,
      CMD_PresentSignal => CMD_PresentSignal,
      CMD_SetNewStatsConfig => CMD_SetNewStatsConfig,
      CMD_WriteFrameStatsAddress => CMD_WriteFrameStatsAddress,
      CMD_EnableEventTimestamps => CMD_EnableEventTimestamps,
      CMD_WriteEventTimestampsAddress => CMD_WriteEventTimestampsAddress,
      CMD_WriteEventTimestampOrders => CMD_WriteEventTimestampOrders,
      CMD_CountTimestampsMemoryWrites => CMD_CountTimestampsMemoryWrites,
      CMD_CountTimestampsOrdersMemoryWrites => CMD_CountTimestampsOrdersMemoryWrites,
      CMD_StatsSaveComplete => CMD_StatsSaveComplete,
      MEM_StatsWriteRequestsFIFO_wr_data => MEM_StatsWriteRequestsFIFO_wr_data,
      MEM_StatsWriteRequestsFIFO_full => MEM_StatsWriteRequestsFIFO_full,
      MEM_StatsWriteRequestsFIFO_wr_en => MEM_StatsWriteRequestsFIFO_wr_en,
      STAT_WriteOrderNibblesFIFO_wr_data => STAT_WriteOrderNibblesFIFO_wr_data,
      STAT_WriteOrderNibblesFIFO_full => STAT_WriteOrderNibblesFIFO_full,
      STAT_WriteOrderNibblesFIFO_wr_en => STAT_WriteOrderNibblesFIFO_wr_en,
      STAT_WriteOrderNibblesFIFO_rd_data => STAT_WriteOrderNibblesFIFO_rd_data,
      STAT_WriteOrderNibblesFIFO_empty => STAT_WriteOrderNibblesFIFO_empty,
      STAT_WriteOrderNibblesFIFO_rd_en => STAT_WriteOrderNibblesFIFO_rd_en,
      STAT_ResetWriteOrderNibblesFIFO => STAT_ResetWriteOrderNibblesFIFO,
      VBB_CyclesIdle => VBB_CyclesIdle,
      VBB_CyclesSpentWorking => VBB_CyclesSpentWorking,
      VBB_CyclesWaitingForOutput => VBB_CyclesWaitingForOutput,
      VBB_CurrentDrawEventID => VBB_CurrentDrawEventID,
      VSHADER_CyclesIdle => VSHADER_CyclesIdle,
      VSHADER_CyclesSpentWorking => VSHADER_CyclesSpentWorking,
      VSHADER_CyclesExecShaderCode => VSHADER_CyclesExecShaderCode,
      VSHADER_CyclesWaitingForOutput => VSHADER_CyclesWaitingForOutput,
      VSHADER_CurrentDrawEventID => VSHADER_CurrentDrawEventID,
      IA_CyclesIdle => IA_CyclesIdle,
      IA_CyclesSpentWorking => IA_CyclesSpentWorking,
      IA_CyclesLoadingDataToCache => IA_CyclesLoadingDataToCache,
      IA_CyclesWaitingForOutput => IA_CyclesWaitingForOutput,
      IA_CurrentDrawEventID => IA_CurrentDrawEventID,
      CLIP_CyclesIdle => CLIP_CyclesIdle,
      CLIP_CyclesSpentWorking => CLIP_CyclesSpentWorking,
      CLIP_CyclesWaitingForOutput => CLIP_CyclesWaitingForOutput,
      CLIP_CurrentDrawEventID => CLIP_CurrentDrawEventID,
      TRISETUP_CyclesIdle => TRISETUP_CyclesIdle,
      TRISETUP_CyclesSpentWorking => TRISETUP_CyclesSpentWorking,
      TRISETUP_CyclesWaitingForOutput => TRISETUP_CyclesWaitingForOutput,
      TRISETUP_CurrentDrawEventID => TRISETUP_CurrentDrawEventID,
      RAST_CyclesIdle => RAST_CyclesIdle,
      RAST_CyclesSpentWorking => RAST_CyclesSpentWorking,
      RAST_CyclesWaitingForOutput => RAST_CyclesWaitingForOutput,
      RAST_CyclesWaitingForTriWorkCache => RAST_CyclesWaitingForTriWorkCache,
      RAST_CurrentDrawEventID => RAST_CurrentDrawEventID,
      DINTERP_CyclesIdle => DINTERP_CyclesIdle,
      DINTERP_CyclesSpentWorking => DINTERP_CyclesSpentWorking,
      DINTERP_CyclesWaitingForOutput => DINTERP_CyclesWaitingForOutput,
      DINTERP_CurrentDrawEventID => DINTERP_CurrentDrawEventID,
      INTERP_CyclesIdle => INTERP_CyclesIdle,
      INTERP_CyclesSpentWorking => INTERP_CyclesSpentWorking,
      INTERP_CyclesWaitingForOutput => INTERP_CyclesWaitingForOutput,
      INTERP_CurrentDrawEventID => INTERP_CurrentDrawEventID,
      TEXSAMP_CyclesIdle => TEXSAMP_CyclesIdle,
      TEXSAMP_CyclesSpentWorking => TEXSAMP_CyclesSpentWorking,
      TEXSAMP_CyclesWaitingForOutput => TEXSAMP_CyclesWaitingForOutput,
      TEXSAMP_CyclesWaitingCacheLoad => TEXSAMP_CyclesWaitingCacheLoad,
      TEXSAMP_CurrentDrawEventID => TEXSAMP_CurrentDrawEventID,
      ROP_CyclesIdle => ROP_CyclesIdle,
      ROP_CyclesSpentWorking => ROP_CyclesSpentWorking,
      ROP_CyclesWaitingForOutput => ROP_CyclesWaitingForOutput,
      ROP_CyclesWaitingForMemoryRead => ROP_CyclesWaitingForMemoryRead,
      ROP_CountCacheHits => ROP_CountCacheHits,
      ROP_CountCacheMisses => ROP_CountCacheMisses,
      ROP_CurrentDrawEventID => ROP_CurrentDrawEventID,
      CMD_CyclesIdle => CMD_CyclesIdle,
      CMD_CyclesSpentWorking => CMD_CyclesSpentWorking,
      MEM_ReadCyclesIdle => MEM_ReadCyclesIdle,
      MEM_ReadCyclesSpentWorking => MEM_ReadCyclesSpentWorking,
      MEM_WriteCyclesIdle => MEM_WriteCyclesIdle,
      MEM_WriteCyclesSpentWorking => MEM_WriteCyclesSpentWorking,
      MEM_MemReadCountBytesTransferred => MEM_MemReadCountBytesTransferred,
      MEM_MemReadCountTransactions => MEM_MemReadCountTransactions,
      MEM_MemReadCountNonScanoutBytesTransferred => MEM_MemReadCountNonScanoutBytesTransferred,
      MEM_MemReadCountNonScanoutTransactions => MEM_MemReadCountNonScanoutTransactions,
      MEM_MemWriteCountBytesTransferred => MEM_MemWriteCountBytesTransferred,
      MEM_MemWriteCountTransactions => MEM_MemWriteCountTransactions,
      DBG_CurrentState => DBG_CurrentState,
      DBG_EventsWriteIsReady => DBG_EventsWriteIsReady,
      DBG_EventsWriteIsReadyAck => DBG_EventsWriteIsReadyAck,
      DBG_CurrentWriteOrderNibbles => DBG_CurrentWriteOrderNibbles,
      DBG_CurrentWriteData => DBG_CurrentWriteData,
      DBG_CurrentWriteEn => DBG_CurrentWriteEn
    );
END design_1_StatsCollector_0_0_arch;
