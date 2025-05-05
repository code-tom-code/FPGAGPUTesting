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

-- IP VLNV: xilinx.com:module_ref:TexSample:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_TexSample_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    INTERP_InFIFO_rd_data : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    INTERP_InFIFO_empty : IN STD_LOGIC;
    INTERP_InFIFO_rd_en : OUT STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    MEM_TexSampReadRequestsFIFO_full : IN STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    MEM_TexSampReadResponsesFIFO_empty : IN STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(73 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    TexCache_addra : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    TexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TexCache_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TexCache_ena : OUT STD_LOGIC;
    TexCache_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    CMD_TexSampleIsIdle : OUT STD_LOGIC;
    ROP_OutFIFO_wr_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    ROP_OutFIFO_full : IN STD_LOGIC;
    ROP_OutFIFO_wr_en : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingCacheLoad : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_TexSample_State : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_TexCache_douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_TexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_TexCache_addra : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    DBG_texCacheReadTexelsCount : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END design_1_TexSample_0_0;

ARCHITECTURE design_1_TexSample_0_0_arch OF design_1_TexSample_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_TexSample_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT TexSample IS
    PORT (
      clk : IN STD_LOGIC;
      INTERP_InFIFO_rd_data : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
      INTERP_InFIFO_empty : IN STD_LOGIC;
      INTERP_InFIFO_rd_en : OUT STD_LOGIC;
      MEM_TexSampReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      MEM_TexSampReadRequestsFIFO_full : IN STD_LOGIC;
      MEM_TexSampReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      MEM_TexSampReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      MEM_TexSampReadResponsesFIFO_empty : IN STD_LOGIC;
      MEM_TexSampReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(73 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      TexCache_addra : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      TexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TexCache_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TexCache_ena : OUT STD_LOGIC;
      TexCache_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      CMD_TexSampleIsIdle : OUT STD_LOGIC;
      ROP_OutFIFO_wr_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      ROP_OutFIFO_full : IN STD_LOGIC;
      ROP_OutFIFO_wr_en : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingCacheLoad : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_TexSample_State : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_TexCache_douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_TexCache_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_TexCache_addra : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      DBG_texCacheReadTexelsCount : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT TexSample;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_TexSample_0_0_arch: ARCHITECTURE IS "TexSample,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_TexSample_0_0_arch : ARCHITECTURE IS "design_1_TexSample_0_0,TexSample,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_TexSample_0_0_arch: ARCHITECTURE IS "design_1_TexSample_0_0,TexSample,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TexSample,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ROP_OutFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ROP_OutFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF ROP_OutFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF TexCache_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 TexCache WE";
  ATTRIBUTE X_INTERFACE_INFO OF TexCache_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 TexCache EN";
  ATTRIBUTE X_INTERFACE_INFO OF TexCache_douta: SIGNAL IS "xilinx.com:interface:bram:1.0 TexCache DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF TexCache_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 TexCache DIN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF TexCache_addra: SIGNAL IS "XIL_INTERFACENAME TexCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF TexCache_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 TexCache ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_TexSampReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_InFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_InFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF INTERP_InFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : TexSample
    PORT MAP (
      clk => clk,
      INTERP_InFIFO_rd_data => INTERP_InFIFO_rd_data,
      INTERP_InFIFO_empty => INTERP_InFIFO_empty,
      INTERP_InFIFO_rd_en => INTERP_InFIFO_rd_en,
      MEM_TexSampReadRequestsFIFO_wr_data => MEM_TexSampReadRequestsFIFO_wr_data,
      MEM_TexSampReadRequestsFIFO_full => MEM_TexSampReadRequestsFIFO_full,
      MEM_TexSampReadRequestsFIFO_wr_en => MEM_TexSampReadRequestsFIFO_wr_en,
      MEM_TexSampReadResponsesFIFO_rd_data => MEM_TexSampReadResponsesFIFO_rd_data,
      MEM_TexSampReadResponsesFIFO_empty => MEM_TexSampReadResponsesFIFO_empty,
      MEM_TexSampReadResponsesFIFO_rd_en => MEM_TexSampReadResponsesFIFO_rd_en,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      TexCache_addra => TexCache_addra,
      TexCache_dina => TexCache_dina,
      TexCache_douta => TexCache_douta,
      TexCache_ena => TexCache_ena,
      TexCache_wea => TexCache_wea,
      CMD_TexSampleIsIdle => CMD_TexSampleIsIdle,
      ROP_OutFIFO_wr_data => ROP_OutFIFO_wr_data,
      ROP_OutFIFO_full => ROP_OutFIFO_full,
      ROP_OutFIFO_wr_en => ROP_OutFIFO_wr_en,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CyclesWaitingCacheLoad => STAT_CyclesWaitingCacheLoad,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_TexSample_State => DBG_TexSample_State,
      DBG_TexCache_douta => DBG_TexCache_douta,
      DBG_TexCache_dina => DBG_TexCache_dina,
      DBG_TexCache_addra => DBG_TexCache_addra,
      DBG_texCacheReadTexelsCount => DBG_texCacheReadTexelsCount
    );
END design_1_TexSample_0_0_arch;
