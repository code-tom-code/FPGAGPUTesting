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

-- IP VLNV: xilinx.com:module_ref:DepthInterpolator:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_DepthInterpolator_0_1 IS
  PORT (
    clk : IN STD_LOGIC;
    TRICACHE_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRICACHE_PopTriangleSlot : OUT STD_LOGIC;
    RASTOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    RASTOUT_FIFO_empty : IN STD_LOGIC;
    RASTOUT_FIFO_rd_en : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(76 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
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
    FPU_SPEC_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_SPEC_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_SPEC_GO : OUT STD_LOGIC;
    DEPTH_PixelReady : OUT STD_LOGIC;
    DEPTH_PosX : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DEPTH_PosY : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DEPTH_OutPixelDepth : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    DEPTH_PixelPassedDepthStencilTest : IN STD_LOGIC;
    DEPTH_PixelFailedDepthTest : IN STD_LOGIC;
    DEPTH_PixelFailedStencilTest : IN STD_LOGIC;
    DEPTH_SetDepthParams : OUT STD_LOGIC;
    DEPTH_DepthWriteEnable : OUT STD_LOGIC;
    DEPTH_DepthFunction : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DEPTH_StencilWriteEnable : OUT STD_LOGIC;
    DEPTH_StencilRefVal : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DEPTH_StencilReadMask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DEPTH_StencilWriteMask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DEPTH_StencilCmpFunc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DEPTH_StencilFailOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DEPTH_StencilZFailOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DEPTH_StencilPassOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DEPTH_DepthIsIdle : IN STD_LOGIC;
    ATTR_FIFO_wr_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    ATTR_FIFO_wr_en : OUT STD_LOGIC;
    ATTR_FIFO_full : IN STD_LOGIC;
    ATTR_FIFO_almost_full : IN STD_LOGIC;
    CMD_IsIdle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_DepthOnlyPixelsPassed : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_DepthInterpolator_State : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    DBG_BarycentricConvertState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_BarycentricNormalizeState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_InterpolatorDriverState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_ShiftConvertZState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_DepthTestDriverZState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_RastBarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RastBarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_InterpolatedDepthU24 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    DBG_IdleVector : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DBG_BarycentricBCFIFO : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DBG_CurrentDepthStencilState : OUT STD_LOGIC_VECTOR(76 DOWNTO 0)
  );
END design_1_DepthInterpolator_0_1;

ARCHITECTURE design_1_DepthInterpolator_0_1_arch OF design_1_DepthInterpolator_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_DepthInterpolator_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT DepthInterpolator IS
    GENERIC (
      MAX_OCCUPANCY : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      TRICACHE_inBarycentricInverse : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inZ0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inZ10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inZ20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inInvW0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inInvW10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_inInvW20 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRICACHE_PopTriangleSlot : OUT STD_LOGIC;
      RASTOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
      RASTOUT_FIFO_empty : IN STD_LOGIC;
      RASTOUT_FIFO_rd_en : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(76 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
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
      FPU_SPEC_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_SPEC_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_SPEC_GO : OUT STD_LOGIC;
      DEPTH_PixelReady : OUT STD_LOGIC;
      DEPTH_PosX : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DEPTH_PosY : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DEPTH_OutPixelDepth : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      DEPTH_PixelPassedDepthStencilTest : IN STD_LOGIC;
      DEPTH_PixelFailedDepthTest : IN STD_LOGIC;
      DEPTH_PixelFailedStencilTest : IN STD_LOGIC;
      DEPTH_SetDepthParams : OUT STD_LOGIC;
      DEPTH_DepthWriteEnable : OUT STD_LOGIC;
      DEPTH_DepthFunction : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DEPTH_StencilWriteEnable : OUT STD_LOGIC;
      DEPTH_StencilRefVal : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEPTH_StencilReadMask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEPTH_StencilWriteMask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEPTH_StencilCmpFunc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DEPTH_StencilFailOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DEPTH_StencilZFailOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DEPTH_StencilPassOp : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DEPTH_DepthIsIdle : IN STD_LOGIC;
      ATTR_FIFO_wr_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      ATTR_FIFO_wr_en : OUT STD_LOGIC;
      ATTR_FIFO_full : IN STD_LOGIC;
      ATTR_FIFO_almost_full : IN STD_LOGIC;
      CMD_IsIdle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_DepthOnlyPixelsPassed : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_DepthInterpolator_State : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      DBG_BarycentricConvertState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_BarycentricNormalizeState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_InterpolatorDriverState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_ShiftConvertZState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_DepthTestDriverZState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_RastBarycentricB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RastBarycentricC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_InterpolatedDepthU24 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      DBG_IdleVector : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DBG_BarycentricBCFIFO : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      DBG_CurrentDepthStencilState : OUT STD_LOGIC_VECTOR(76 DOWNTO 0)
    );
  END COMPONENT DepthInterpolator;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_DepthInterpolator_0_1_arch: ARCHITECTURE IS "DepthInterpolator,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_DepthInterpolator_0_1_arch : ARCHITECTURE IS "design_1_DepthInterpolator_0_1,DepthInterpolator,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_DepthInterpolator_0_1_arch: ARCHITECTURE IS "design_1_DepthInterpolator_0_1,DepthInterpolator,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DepthInterpolator,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,MAX_OCCUPANCY=32}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ATTR_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF ATTR_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ATTR_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF RASTOUT_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : DepthInterpolator
    GENERIC MAP (
      MAX_OCCUPANCY => 32
    )
    PORT MAP (
      clk => clk,
      TRICACHE_inBarycentricInverse => TRICACHE_inBarycentricInverse,
      TRICACHE_inZ0 => TRICACHE_inZ0,
      TRICACHE_inZ10 => TRICACHE_inZ10,
      TRICACHE_inZ20 => TRICACHE_inZ20,
      TRICACHE_inInvW0 => TRICACHE_inInvW0,
      TRICACHE_inInvW10 => TRICACHE_inInvW10,
      TRICACHE_inInvW20 => TRICACHE_inInvW20,
      TRICACHE_PopTriangleSlot => TRICACHE_PopTriangleSlot,
      RASTOUT_FIFO_rd_data => RASTOUT_FIFO_rd_data,
      RASTOUT_FIFO_empty => RASTOUT_FIFO_empty,
      RASTOUT_FIFO_rd_en => RASTOUT_FIFO_rd_en,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
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
      FPU_SPEC_A => FPU_SPEC_A,
      FPU_SPEC_OUT => FPU_SPEC_OUT,
      FPU_SPEC_GO => FPU_SPEC_GO,
      DEPTH_PixelReady => DEPTH_PixelReady,
      DEPTH_PosX => DEPTH_PosX,
      DEPTH_PosY => DEPTH_PosY,
      DEPTH_OutPixelDepth => DEPTH_OutPixelDepth,
      DEPTH_PixelPassedDepthStencilTest => DEPTH_PixelPassedDepthStencilTest,
      DEPTH_PixelFailedDepthTest => DEPTH_PixelFailedDepthTest,
      DEPTH_PixelFailedStencilTest => DEPTH_PixelFailedStencilTest,
      DEPTH_SetDepthParams => DEPTH_SetDepthParams,
      DEPTH_DepthWriteEnable => DEPTH_DepthWriteEnable,
      DEPTH_DepthFunction => DEPTH_DepthFunction,
      DEPTH_StencilWriteEnable => DEPTH_StencilWriteEnable,
      DEPTH_StencilRefVal => DEPTH_StencilRefVal,
      DEPTH_StencilReadMask => DEPTH_StencilReadMask,
      DEPTH_StencilWriteMask => DEPTH_StencilWriteMask,
      DEPTH_StencilCmpFunc => DEPTH_StencilCmpFunc,
      DEPTH_StencilFailOp => DEPTH_StencilFailOp,
      DEPTH_StencilZFailOp => DEPTH_StencilZFailOp,
      DEPTH_StencilPassOp => DEPTH_StencilPassOp,
      DEPTH_DepthIsIdle => DEPTH_DepthIsIdle,
      ATTR_FIFO_wr_data => ATTR_FIFO_wr_data,
      ATTR_FIFO_wr_en => ATTR_FIFO_wr_en,
      ATTR_FIFO_full => ATTR_FIFO_full,
      ATTR_FIFO_almost_full => ATTR_FIFO_almost_full,
      CMD_IsIdle => CMD_IsIdle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      STAT_DepthOnlyPixelsPassed => STAT_DepthOnlyPixelsPassed,
      DBG_DepthInterpolator_State => DBG_DepthInterpolator_State,
      DBG_BarycentricConvertState => DBG_BarycentricConvertState,
      DBG_BarycentricNormalizeState => DBG_BarycentricNormalizeState,
      DBG_InterpolatorDriverState => DBG_InterpolatorDriverState,
      DBG_ShiftConvertZState => DBG_ShiftConvertZState,
      DBG_DepthTestDriverZState => DBG_DepthTestDriverZState,
      DBG_RastBarycentricB => DBG_RastBarycentricB,
      DBG_RastBarycentricC => DBG_RastBarycentricC,
      DBG_InterpolatedDepthU24 => DBG_InterpolatedDepthU24,
      DBG_IdleVector => DBG_IdleVector,
      DBG_BarycentricBCFIFO => DBG_BarycentricBCFIFO,
      DBG_CurrentDepthStencilState => DBG_CurrentDepthStencilState
    );
END design_1_DepthInterpolator_0_1_arch;
