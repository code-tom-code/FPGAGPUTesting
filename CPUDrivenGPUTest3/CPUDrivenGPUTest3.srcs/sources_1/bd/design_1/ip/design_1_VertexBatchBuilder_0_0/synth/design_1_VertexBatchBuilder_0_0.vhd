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

-- IP VLNV: xilinx.com:module_ref:VertexBatchBuilder:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_VertexBatchBuilder_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_SendCommand : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    CMD_CommandArg0 : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    CMD_CommandArg1 : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    CMD_CommandArg2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_NewDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_ReadyState : OUT STD_LOGIC;
    IBC_ReadEnable : OUT STD_LOGIC;
    IBC_ReadAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    IBC_ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IBC_ReadReady : IN STD_LOGIC;
    IBC_InvalidateIndexCache : OUT STD_LOGIC;
    SHADER_Done : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(34 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    VERTBATCH_FIFO_full : IN STD_LOGIC;
    VERTBATCH_FIFO_wr_data : OUT STD_LOGIC_VECTOR(543 DOWNTO 0);
    VERTBATCH_FIFO_wr_en : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_UseConstantOutput : IN STD_LOGIC;
    DBG_CurrentState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_CurrentBatchLength : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_CurrentIndexBatchLength : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    DBG_CurrentBatchRemainingPrims : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    DBG_QueueIsFull : OUT STD_LOGIC;
    DBG_QueueIsEmpty : OUT STD_LOGIC;
    DBG_DoneGeneratingIndices : OUT STD_LOGIC;
    DBG_IndexGeneratorRemainingPrims : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    DBG_LastPolygonIndices : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END design_1_VertexBatchBuilder_0_0;

ARCHITECTURE design_1_VertexBatchBuilder_0_0_arch OF design_1_VertexBatchBuilder_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_VertexBatchBuilder_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT VertexBatchBuilder IS
    PORT (
      clk : IN STD_LOGIC;
      CMD_SendCommand : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      CMD_CommandArg0 : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      CMD_CommandArg1 : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
      CMD_CommandArg2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_NewDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_ReadyState : OUT STD_LOGIC;
      IBC_ReadEnable : OUT STD_LOGIC;
      IBC_ReadAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      IBC_ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IBC_ReadReady : IN STD_LOGIC;
      IBC_InvalidateIndexCache : OUT STD_LOGIC;
      SHADER_Done : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(34 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      VERTBATCH_FIFO_full : IN STD_LOGIC;
      VERTBATCH_FIFO_wr_data : OUT STD_LOGIC_VECTOR(543 DOWNTO 0);
      VERTBATCH_FIFO_wr_en : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_UseConstantOutput : IN STD_LOGIC;
      DBG_CurrentState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_CurrentBatchLength : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_CurrentIndexBatchLength : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      DBG_CurrentBatchRemainingPrims : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      DBG_QueueIsFull : OUT STD_LOGIC;
      DBG_QueueIsEmpty : OUT STD_LOGIC;
      DBG_DoneGeneratingIndices : OUT STD_LOGIC;
      DBG_IndexGeneratorRemainingPrims : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      DBG_LastPolygonIndices : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
    );
  END COMPONENT VertexBatchBuilder;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_VertexBatchBuilder_0_0_arch: ARCHITECTURE IS "VertexBatchBuilder,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_VertexBatchBuilder_0_0_arch : ARCHITECTURE IS "design_1_VertexBatchBuilder_0_0,VertexBatchBuilder,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_VertexBatchBuilder_0_0_arch: ARCHITECTURE IS "design_1_VertexBatchBuilder_0_0,VertexBatchBuilder,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=VertexBatchBuilder,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO FULL";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : VertexBatchBuilder
    PORT MAP (
      clk => clk,
      CMD_SendCommand => CMD_SendCommand,
      CMD_CommandArg0 => CMD_CommandArg0,
      CMD_CommandArg1 => CMD_CommandArg1,
      CMD_CommandArg2 => CMD_CommandArg2,
      CMD_NewDrawEventID => CMD_NewDrawEventID,
      CMD_ReadyState => CMD_ReadyState,
      IBC_ReadEnable => IBC_ReadEnable,
      IBC_ReadAddr => IBC_ReadAddr,
      IBC_ReadData => IBC_ReadData,
      IBC_ReadReady => IBC_ReadReady,
      IBC_InvalidateIndexCache => IBC_InvalidateIndexCache,
      SHADER_Done => SHADER_Done,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      VERTBATCH_FIFO_full => VERTBATCH_FIFO_full,
      VERTBATCH_FIFO_wr_data => VERTBATCH_FIFO_wr_data,
      VERTBATCH_FIFO_wr_en => VERTBATCH_FIFO_wr_en,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_UseConstantOutput => DBG_UseConstantOutput,
      DBG_CurrentState => DBG_CurrentState,
      DBG_CurrentBatchLength => DBG_CurrentBatchLength,
      DBG_CurrentIndexBatchLength => DBG_CurrentIndexBatchLength,
      DBG_CurrentBatchRemainingPrims => DBG_CurrentBatchRemainingPrims,
      DBG_QueueIsFull => DBG_QueueIsFull,
      DBG_QueueIsEmpty => DBG_QueueIsEmpty,
      DBG_DoneGeneratingIndices => DBG_DoneGeneratingIndices,
      DBG_IndexGeneratorRemainingPrims => DBG_IndexGeneratorRemainingPrims,
      DBG_LastPolygonIndices => DBG_LastPolygonIndices
    );
END design_1_VertexBatchBuilder_0_0_arch;
