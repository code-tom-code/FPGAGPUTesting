-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:AttrInterpolator:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_AttrInterpolator_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    DINTERP_FIFO_rd_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    DINTERP_FIFO_empty : IN STD_LOGIC;
    DINTERP_FIFO_almost_empty : IN STD_LOGIC;
    DINTERP_FIFO_rd_en : OUT STD_LOGIC;
    TRICACHE_inT0X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inT0Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inT10X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inT10Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inT20X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inT20Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inColorRGBA0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_inColorRGBA10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_inColorRGBA20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_PopTriangleSlot : OUT STD_LOGIC;
    FPU_MUL_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_GO : OUT STD_LOGIC;
    FPU_CNV0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV0_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    FPU_CNV0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV0_GO : OUT STD_LOGIC;
    FPU_CNV1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV1_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    FPU_CNV1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV1_GO : OUT STD_LOGIC;
    TEXSAMP_OutFIFO_wr_data : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
    TEXSAMP_OutFIFO_full : IN STD_LOGIC;
    TEXSAMP_OutFIFO_wr_en : OUT STD_LOGIC;
    TEXSAMP_OutFIFO_almost_full : IN STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    CMD_IsIdle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_AttrInterpolator_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_InterpolatorDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_MultiplierDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_ConverterDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_OutputDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_PixelWFIFO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RastBarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RastBarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_CurrentDrawEvent : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Message : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MessageData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_NewMessage : OUT STD_LOGIC
  );
END MainDesign_AttrInterpolator_0_0;

ARCHITECTURE MainDesign_AttrInterpolator_0_0_arch OF MainDesign_AttrInterpolator_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_AttrInterpolator_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT AttrInterpolator IS
    GENERIC (
      MAX_OCCUPANCY : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      DINTERP_FIFO_rd_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      DINTERP_FIFO_empty : IN STD_LOGIC;
      DINTERP_FIFO_almost_empty : IN STD_LOGIC;
      DINTERP_FIFO_rd_en : OUT STD_LOGIC;
      TRICACHE_inT0X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inT0Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inT10X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inT10Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inT20X : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inT20Y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inColorRGBA0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_inColorRGBA10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_inColorRGBA20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_PopTriangleSlot : OUT STD_LOGIC;
      FPU_MUL_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_GO : OUT STD_LOGIC;
      FPU_CNV0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV0_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      FPU_CNV0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV0_GO : OUT STD_LOGIC;
      FPU_CNV1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV1_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      FPU_CNV1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV1_GO : OUT STD_LOGIC;
      TEXSAMP_OutFIFO_wr_data : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
      TEXSAMP_OutFIFO_full : IN STD_LOGIC;
      TEXSAMP_OutFIFO_wr_en : OUT STD_LOGIC;
      TEXSAMP_OutFIFO_almost_full : IN STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      CMD_IsIdle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_AttrInterpolator_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_InterpolatorDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_MultiplierDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_ConverterDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_OutputDriver_State : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_PixelWFIFO : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RastBarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RastBarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_CurrentDrawEvent : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Message : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MessageData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_NewMessage : OUT STD_LOGIC
    );
  END COMPONENT AttrInterpolator;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_FIFO_almost_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO ALMOST_EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF DINTERP_FIFO_rd_data: SIGNAL IS "master ATTR_FIFO";
  ATTRIBUTE X_INTERFACE_INFO OF DINTERP_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_OutFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_OutFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF TEXSAMP_OutFIFO_wr_data: SIGNAL IS "master TEXSAMP_OUT_FIFO";
  ATTRIBUTE X_INTERFACE_INFO OF TEXSAMP_OutFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF TEXSAMP_OUT_FIFO:ATTR_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : AttrInterpolator
    GENERIC MAP (
      MAX_OCCUPANCY => 8
    )
    PORT MAP (
      clk => clk,
      DINTERP_FIFO_rd_data => DINTERP_FIFO_rd_data,
      DINTERP_FIFO_empty => DINTERP_FIFO_empty,
      DINTERP_FIFO_almost_empty => DINTERP_FIFO_almost_empty,
      DINTERP_FIFO_rd_en => DINTERP_FIFO_rd_en,
      TRICACHE_inT0X => TRICACHE_inT0X,
      TRICACHE_inT0Y => TRICACHE_inT0Y,
      TRICACHE_inT10X => TRICACHE_inT10X,
      TRICACHE_inT10Y => TRICACHE_inT10Y,
      TRICACHE_inT20X => TRICACHE_inT20X,
      TRICACHE_inT20Y => TRICACHE_inT20Y,
      TRICACHE_inColorRGBA0 => TRICACHE_inColorRGBA0,
      TRICACHE_inColorRGBA10 => TRICACHE_inColorRGBA10,
      TRICACHE_inColorRGBA20 => TRICACHE_inColorRGBA20,
      TRICACHE_PopTriangleSlot => TRICACHE_PopTriangleSlot,
      FPU_MUL_A => FPU_MUL_A,
      FPU_MUL_B => FPU_MUL_B,
      FPU_MUL_OUT => FPU_MUL_OUT,
      FPU_MUL_GO => FPU_MUL_GO,
      FPU_CNV0_A => FPU_CNV0_A,
      FPU_CNV0_Mode => FPU_CNV0_Mode,
      FPU_CNV0_OUT => FPU_CNV0_OUT,
      FPU_CNV0_GO => FPU_CNV0_GO,
      FPU_CNV1_A => FPU_CNV1_A,
      FPU_CNV1_Mode => FPU_CNV1_Mode,
      FPU_CNV1_OUT => FPU_CNV1_OUT,
      FPU_CNV1_GO => FPU_CNV1_GO,
      TEXSAMP_OutFIFO_wr_data => TEXSAMP_OutFIFO_wr_data,
      TEXSAMP_OutFIFO_full => TEXSAMP_OutFIFO_full,
      TEXSAMP_OutFIFO_wr_en => TEXSAMP_OutFIFO_wr_en,
      TEXSAMP_OutFIFO_almost_full => TEXSAMP_OutFIFO_almost_full,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      CMD_IsIdle => CMD_IsIdle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_AttrInterpolator_State => DBG_AttrInterpolator_State,
      DBG_InterpolatorDriver_State => DBG_InterpolatorDriver_State,
      DBG_MultiplierDriver_State => DBG_MultiplierDriver_State,
      DBG_ConverterDriver_State => DBG_ConverterDriver_State,
      DBG_OutputDriver_State => DBG_OutputDriver_State,
      DBG_PixelWFIFO => DBG_PixelWFIFO,
      DBG_RastBarycentricB => DBG_RastBarycentricB,
      DBG_RastBarycentricC => DBG_RastBarycentricC,
      DBG_CurrentDrawEvent => DBG_CurrentDrawEvent,
      DBG_Message => DBG_Message,
      DBG_MessageData => DBG_MessageData,
      DBG_NewMessage => DBG_NewMessage
    );
END MainDesign_AttrInterpolator_0_0_arch;
