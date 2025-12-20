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

-- IP VLNV: xilinx.com:module_ref:Rasterizer:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_Rasterizer_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    TRISETUP_newTriBegin : IN STD_LOGIC;
    TRISETUP_readyForNewTri : OUT STD_LOGIC;
    TRISETUP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inMinX : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inMaxX : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inMinY : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inMaxY : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inInitialBarycentricRowResetA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inInitialBarycentricRowResetB : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inInitialBarycentricRowResetC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inIsTopLeftEdgeA : IN STD_LOGIC;
    TRISETUP_inIsTopLeftEdgeB : IN STD_LOGIC;
    TRISETUP_inIsTopLeftEdgeC : IN STD_LOGIC;
    TRISETUP_inBarycentricXDeltaA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricXDeltaB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricXDeltaC : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricYDeltaA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricYDeltaB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricYDeltaC : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTX0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTY0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTX10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTY10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTX20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inTY20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_inVertColor0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRISETUP_inVertColor10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRISETUP_inVertColor20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    RASTOUT_FIFO_full : IN STD_LOGIC;
    RASTOUT_FIFO_almost_full : IN STD_LOGIC;
    RASTOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
    RASTOUT_FIFO_wr_en : OUT STD_LOGIC;
    TRICACHE_BarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_Z0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_Z10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_Z20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_InvW0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_InvW10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_InvW20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TX0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TX10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TX20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TY0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TY10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_TY20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_VertColor0 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_VertColor10 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_VertColor20 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRICACHE_PushNewTriData : OUT STD_LOGIC;
    TRICACHE_IsFull : IN STD_LOGIC;
    CMD_Rasterizer_Idle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForTriWorkCache : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Rasterizer_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_PixelXPos : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_PixelYPos : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_BarycentricA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_BarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_BarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_MinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Message : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MessageData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_NewMessage : OUT STD_LOGIC
  );
END MainDesign_Rasterizer_0_0;

ARCHITECTURE MainDesign_Rasterizer_0_0_arch OF MainDesign_Rasterizer_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_Rasterizer_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT Rasterizer IS
    PORT (
      clk : IN STD_LOGIC;
      TRISETUP_newTriBegin : IN STD_LOGIC;
      TRISETUP_readyForNewTri : OUT STD_LOGIC;
      TRISETUP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inMinX : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inMaxX : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inMinY : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inMaxY : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inInitialBarycentricRowResetA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inInitialBarycentricRowResetB : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inInitialBarycentricRowResetC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inIsTopLeftEdgeA : IN STD_LOGIC;
      TRISETUP_inIsTopLeftEdgeB : IN STD_LOGIC;
      TRISETUP_inIsTopLeftEdgeC : IN STD_LOGIC;
      TRISETUP_inBarycentricXDeltaA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricXDeltaB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricXDeltaC : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricYDeltaA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricYDeltaB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricYDeltaC : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTX0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTY0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTX10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTY10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTX20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inTY20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_inVertColor0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRISETUP_inVertColor10 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRISETUP_inVertColor20 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      RASTOUT_FIFO_full : IN STD_LOGIC;
      RASTOUT_FIFO_almost_full : IN STD_LOGIC;
      RASTOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
      RASTOUT_FIFO_wr_en : OUT STD_LOGIC;
      TRICACHE_BarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_Z0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_Z10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_Z20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_InvW0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_InvW10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_InvW20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TX0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TX10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TX20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TY0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TY10 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_TY20 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_VertColor0 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_VertColor10 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_VertColor20 : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRICACHE_PushNewTriData : OUT STD_LOGIC;
      TRICACHE_IsFull : IN STD_LOGIC;
      CMD_Rasterizer_Idle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForTriWorkCache : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Rasterizer_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_PixelXPos : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_PixelYPos : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_BarycentricA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_BarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_BarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_MinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Message : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MessageData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_NewMessage : OUT STD_LOGIC
    );
  END COMPONENT Rasterizer;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_almost_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO ALMOST_FULL";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO FULL";
  ATTRIBUTE X_INTERFACE_MODE OF RASTOUT_FIFO_full: SIGNAL IS "master RASTOUT_FIFO";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF RASTOUT_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : Rasterizer
    PORT MAP (
      clk => clk,
      TRISETUP_newTriBegin => TRISETUP_newTriBegin,
      TRISETUP_readyForNewTri => TRISETUP_readyForNewTri,
      TRISETUP_CurrentDrawEventID => TRISETUP_CurrentDrawEventID,
      TRISETUP_inMinX => TRISETUP_inMinX,
      TRISETUP_inMaxX => TRISETUP_inMaxX,
      TRISETUP_inMinY => TRISETUP_inMinY,
      TRISETUP_inMaxY => TRISETUP_inMaxY,
      TRISETUP_inInitialBarycentricRowResetA => TRISETUP_inInitialBarycentricRowResetA,
      TRISETUP_inInitialBarycentricRowResetB => TRISETUP_inInitialBarycentricRowResetB,
      TRISETUP_inInitialBarycentricRowResetC => TRISETUP_inInitialBarycentricRowResetC,
      TRISETUP_inIsTopLeftEdgeA => TRISETUP_inIsTopLeftEdgeA,
      TRISETUP_inIsTopLeftEdgeB => TRISETUP_inIsTopLeftEdgeB,
      TRISETUP_inIsTopLeftEdgeC => TRISETUP_inIsTopLeftEdgeC,
      TRISETUP_inBarycentricXDeltaA => TRISETUP_inBarycentricXDeltaA,
      TRISETUP_inBarycentricXDeltaB => TRISETUP_inBarycentricXDeltaB,
      TRISETUP_inBarycentricXDeltaC => TRISETUP_inBarycentricXDeltaC,
      TRISETUP_inBarycentricYDeltaA => TRISETUP_inBarycentricYDeltaA,
      TRISETUP_inBarycentricYDeltaB => TRISETUP_inBarycentricYDeltaB,
      TRISETUP_inBarycentricYDeltaC => TRISETUP_inBarycentricYDeltaC,
      TRISETUP_inBarycentricInverse => TRISETUP_inBarycentricInverse,
      TRISETUP_inZ0 => TRISETUP_inZ0,
      TRISETUP_inZ10 => TRISETUP_inZ10,
      TRISETUP_inZ20 => TRISETUP_inZ20,
      TRISETUP_inInvW0 => TRISETUP_inInvW0,
      TRISETUP_inInvW10 => TRISETUP_inInvW10,
      TRISETUP_inInvW20 => TRISETUP_inInvW20,
      TRISETUP_inTX0 => TRISETUP_inTX0,
      TRISETUP_inTY0 => TRISETUP_inTY0,
      TRISETUP_inTX10 => TRISETUP_inTX10,
      TRISETUP_inTY10 => TRISETUP_inTY10,
      TRISETUP_inTX20 => TRISETUP_inTX20,
      TRISETUP_inTY20 => TRISETUP_inTY20,
      TRISETUP_inVertColor0 => TRISETUP_inVertColor0,
      TRISETUP_inVertColor10 => TRISETUP_inVertColor10,
      TRISETUP_inVertColor20 => TRISETUP_inVertColor20,
      RASTOUT_FIFO_full => RASTOUT_FIFO_full,
      RASTOUT_FIFO_almost_full => RASTOUT_FIFO_almost_full,
      RASTOUT_FIFO_wr_data => RASTOUT_FIFO_wr_data,
      RASTOUT_FIFO_wr_en => RASTOUT_FIFO_wr_en,
      TRICACHE_BarycentricInverse => TRICACHE_BarycentricInverse,
      TRICACHE_Z0 => TRICACHE_Z0,
      TRICACHE_Z10 => TRICACHE_Z10,
      TRICACHE_Z20 => TRICACHE_Z20,
      TRICACHE_InvW0 => TRICACHE_InvW0,
      TRICACHE_InvW10 => TRICACHE_InvW10,
      TRICACHE_InvW20 => TRICACHE_InvW20,
      TRICACHE_TX0 => TRICACHE_TX0,
      TRICACHE_TX10 => TRICACHE_TX10,
      TRICACHE_TX20 => TRICACHE_TX20,
      TRICACHE_TY0 => TRICACHE_TY0,
      TRICACHE_TY10 => TRICACHE_TY10,
      TRICACHE_TY20 => TRICACHE_TY20,
      TRICACHE_VertColor0 => TRICACHE_VertColor0,
      TRICACHE_VertColor10 => TRICACHE_VertColor10,
      TRICACHE_VertColor20 => TRICACHE_VertColor20,
      TRICACHE_PushNewTriData => TRICACHE_PushNewTriData,
      TRICACHE_IsFull => TRICACHE_IsFull,
      CMD_Rasterizer_Idle => CMD_Rasterizer_Idle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CyclesWaitingForTriWorkCache => STAT_CyclesWaitingForTriWorkCache,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_Rasterizer_State => DBG_Rasterizer_State,
      DBG_PixelXPos => DBG_PixelXPos,
      DBG_PixelYPos => DBG_PixelYPos,
      DBG_BarycentricA => DBG_BarycentricA,
      DBG_BarycentricB => DBG_BarycentricB,
      DBG_BarycentricC => DBG_BarycentricC,
      DBG_MinX => DBG_MinX,
      DBG_MaxX => DBG_MaxX,
      DBG_MinY => DBG_MinY,
      DBG_MaxY => DBG_MaxY,
      DBG_Message => DBG_Message,
      DBG_MessageData => DBG_MessageData,
      DBG_NewMessage => DBG_NewMessage
    );
END MainDesign_Rasterizer_0_0_arch;
