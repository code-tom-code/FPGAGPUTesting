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

-- IP VLNV: xilinx.com:module_ref:TriSetup:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_TriSetup_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CLIP_v0_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t0_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t0_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t1_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t1_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t2_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_t2_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_v1_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_v2_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CLIP_newTriBegin : IN STD_LOGIC;
    CLIP_readyForNewTri : OUT STD_LOGIC;
    TEXCFG_nointerpolation : IN STD_LOGIC;
    RAST_outBarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v0_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v10_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v20_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v0_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v10_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v20_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t0_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t0_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t10_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t10_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t20_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_t20_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_v0_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_v10_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_v20_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    RAST_outMinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outMaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outMinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outMaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outInitialBarycentricRowResetA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_outInitialBarycentricRowResetB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_outInitialBarycentricRowResetC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    RAST_outIsTopLeftEdgeA : OUT STD_LOGIC;
    RAST_outIsTopLeftEdgeB : OUT STD_LOGIC;
    RAST_outIsTopLeftEdgeC : OUT STD_LOGIC;
    RAST_outBarycentricXDeltaA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outBarycentricXDeltaB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outBarycentricXDeltaC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outBarycentricYDeltaA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outBarycentricYDeltaB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_outBarycentricYDeltaC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    RAST_readyForTriSetupData : IN STD_LOGIC;
    RAST_triSetupDataIsValid : OUT STD_LOGIC;
    FPU_ADD_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_ADD_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_ADD_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_ADD_GO : OUT STD_LOGIC;
    FPU_MUL_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_MUL_GO : OUT STD_LOGIC;
    FPU_CNV_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    FPU_CNV_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_CNV_GO : OUT STD_LOGIC;
    FPU_SPEC_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_SPEC_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_SPEC_GO : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(191 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    CMD_TriSetupIsIdle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_TriSetup_State : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_MinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_MaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_XProdSub0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_XProdSub1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_XProdSub2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_XProdSub3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_XProdProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_XProdProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_LeftProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_LeftProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_LeftProd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RightProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RightProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RightProd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_TwiceTriArea : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END MainDesign_TriSetup_0_0;

ARCHITECTURE MainDesign_TriSetup_0_0_arch OF MainDesign_TriSetup_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_TriSetup_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT TriSetup IS
    PORT (
      clk : IN STD_LOGIC;
      CLIP_v0_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2_in_z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2_in_w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t0_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t0_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t1_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t1_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t2_in_x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_t2_in_y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_v1_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_v2_in_RGBA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CLIP_newTriBegin : IN STD_LOGIC;
      CLIP_readyForNewTri : OUT STD_LOGIC;
      TEXCFG_nointerpolation : IN STD_LOGIC;
      RAST_outBarycentricInverse : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v0_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v10_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v20_out_Z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v0_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v10_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v20_out_invW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t0_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t0_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t10_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t10_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t20_out_x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_t20_out_y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_v0_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_v10_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_v20_out_colorRGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      RAST_outMinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outMaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outMinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outMaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outInitialBarycentricRowResetA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_outInitialBarycentricRowResetB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_outInitialBarycentricRowResetC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      RAST_outIsTopLeftEdgeA : OUT STD_LOGIC;
      RAST_outIsTopLeftEdgeB : OUT STD_LOGIC;
      RAST_outIsTopLeftEdgeC : OUT STD_LOGIC;
      RAST_outBarycentricXDeltaA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outBarycentricXDeltaB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outBarycentricXDeltaC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outBarycentricYDeltaA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outBarycentricYDeltaB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_outBarycentricYDeltaC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      RAST_readyForTriSetupData : IN STD_LOGIC;
      RAST_triSetupDataIsValid : OUT STD_LOGIC;
      FPU_ADD_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_ADD_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_ADD_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_ADD_GO : OUT STD_LOGIC;
      FPU_MUL_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_MUL_GO : OUT STD_LOGIC;
      FPU_CNV_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV_Mode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      FPU_CNV_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_CNV_GO : OUT STD_LOGIC;
      FPU_SPEC_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_SPEC_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_SPEC_GO : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(191 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      CMD_TriSetupIsIdle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_TriSetup_State : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_MinX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MaxX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MinY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_MaxY : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_XProdSub0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_XProdSub1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_XProdSub2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_XProdSub3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_XProdProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_XProdProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_LeftProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_LeftProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_LeftProd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RightProd0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RightProd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RightProd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_TwiceTriArea : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT TriSetup;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MainDesign_TriSetup_0_0_arch: ARCHITECTURE IS "TriSetup,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MainDesign_TriSetup_0_0_arch : ARCHITECTURE IS "MainDesign_TriSetup_0_0,TriSetup,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MainDesign_TriSetup_0_0_arch: ARCHITECTURE IS "MainDesign_TriSetup_0_0,TriSetup,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TriSetup,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MainDesign_TriSetup_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : TriSetup
    PORT MAP (
      clk => clk,
      CLIP_v0_in_x => CLIP_v0_in_x,
      CLIP_v0_in_y => CLIP_v0_in_y,
      CLIP_v0_in_z => CLIP_v0_in_z,
      CLIP_v0_in_w => CLIP_v0_in_w,
      CLIP_v1_in_x => CLIP_v1_in_x,
      CLIP_v1_in_y => CLIP_v1_in_y,
      CLIP_v1_in_z => CLIP_v1_in_z,
      CLIP_v1_in_w => CLIP_v1_in_w,
      CLIP_v2_in_x => CLIP_v2_in_x,
      CLIP_v2_in_y => CLIP_v2_in_y,
      CLIP_v2_in_z => CLIP_v2_in_z,
      CLIP_v2_in_w => CLIP_v2_in_w,
      CLIP_t0_in_x => CLIP_t0_in_x,
      CLIP_t0_in_y => CLIP_t0_in_y,
      CLIP_t1_in_x => CLIP_t1_in_x,
      CLIP_t1_in_y => CLIP_t1_in_y,
      CLIP_t2_in_x => CLIP_t2_in_x,
      CLIP_t2_in_y => CLIP_t2_in_y,
      CLIP_v0_in_RGBA => CLIP_v0_in_RGBA,
      CLIP_v1_in_RGBA => CLIP_v1_in_RGBA,
      CLIP_v2_in_RGBA => CLIP_v2_in_RGBA,
      CLIP_CurrentDrawEventID => CLIP_CurrentDrawEventID,
      CLIP_newTriBegin => CLIP_newTriBegin,
      CLIP_readyForNewTri => CLIP_readyForNewTri,
      TEXCFG_nointerpolation => TEXCFG_nointerpolation,
      RAST_outBarycentricInverse => RAST_outBarycentricInverse,
      RAST_v0_out_Z => RAST_v0_out_Z,
      RAST_v10_out_Z => RAST_v10_out_Z,
      RAST_v20_out_Z => RAST_v20_out_Z,
      RAST_v0_out_invW => RAST_v0_out_invW,
      RAST_v10_out_invW => RAST_v10_out_invW,
      RAST_v20_out_invW => RAST_v20_out_invW,
      RAST_t0_out_x => RAST_t0_out_x,
      RAST_t0_out_y => RAST_t0_out_y,
      RAST_t10_out_x => RAST_t10_out_x,
      RAST_t10_out_y => RAST_t10_out_y,
      RAST_t20_out_x => RAST_t20_out_x,
      RAST_t20_out_y => RAST_t20_out_y,
      RAST_v0_out_colorRGBA => RAST_v0_out_colorRGBA,
      RAST_v10_out_colorRGBA => RAST_v10_out_colorRGBA,
      RAST_v20_out_colorRGBA => RAST_v20_out_colorRGBA,
      RAST_outMinX => RAST_outMinX,
      RAST_outMaxX => RAST_outMaxX,
      RAST_outMinY => RAST_outMinY,
      RAST_outMaxY => RAST_outMaxY,
      RAST_outInitialBarycentricRowResetA => RAST_outInitialBarycentricRowResetA,
      RAST_outInitialBarycentricRowResetB => RAST_outInitialBarycentricRowResetB,
      RAST_outInitialBarycentricRowResetC => RAST_outInitialBarycentricRowResetC,
      RAST_outIsTopLeftEdgeA => RAST_outIsTopLeftEdgeA,
      RAST_outIsTopLeftEdgeB => RAST_outIsTopLeftEdgeB,
      RAST_outIsTopLeftEdgeC => RAST_outIsTopLeftEdgeC,
      RAST_outBarycentricXDeltaA => RAST_outBarycentricXDeltaA,
      RAST_outBarycentricXDeltaB => RAST_outBarycentricXDeltaB,
      RAST_outBarycentricXDeltaC => RAST_outBarycentricXDeltaC,
      RAST_outBarycentricYDeltaA => RAST_outBarycentricYDeltaA,
      RAST_outBarycentricYDeltaB => RAST_outBarycentricYDeltaB,
      RAST_outBarycentricYDeltaC => RAST_outBarycentricYDeltaC,
      RAST_CurrentDrawEventID => RAST_CurrentDrawEventID,
      RAST_readyForTriSetupData => RAST_readyForTriSetupData,
      RAST_triSetupDataIsValid => RAST_triSetupDataIsValid,
      FPU_ADD_A => FPU_ADD_A,
      FPU_ADD_B => FPU_ADD_B,
      FPU_ADD_OUT => FPU_ADD_OUT,
      FPU_ADD_GO => FPU_ADD_GO,
      FPU_MUL_A => FPU_MUL_A,
      FPU_MUL_B => FPU_MUL_B,
      FPU_MUL_OUT => FPU_MUL_OUT,
      FPU_MUL_GO => FPU_MUL_GO,
      FPU_CNV_A => FPU_CNV_A,
      FPU_CNV_Mode => FPU_CNV_Mode,
      FPU_CNV_OUT => FPU_CNV_OUT,
      FPU_CNV_GO => FPU_CNV_GO,
      FPU_SPEC_A => FPU_SPEC_A,
      FPU_SPEC_OUT => FPU_SPEC_OUT,
      FPU_SPEC_GO => FPU_SPEC_GO,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      CMD_TriSetupIsIdle => CMD_TriSetupIsIdle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_TriSetup_State => DBG_TriSetup_State,
      DBG_MinX => DBG_MinX,
      DBG_MaxX => DBG_MaxX,
      DBG_MinY => DBG_MinY,
      DBG_MaxY => DBG_MaxY,
      DBG_XProdSub0 => DBG_XProdSub0,
      DBG_XProdSub1 => DBG_XProdSub1,
      DBG_XProdSub2 => DBG_XProdSub2,
      DBG_XProdSub3 => DBG_XProdSub3,
      DBG_XProdProd0 => DBG_XProdProd0,
      DBG_XProdProd1 => DBG_XProdProd1,
      DBG_LeftProd0 => DBG_LeftProd0,
      DBG_LeftProd1 => DBG_LeftProd1,
      DBG_LeftProd2 => DBG_LeftProd2,
      DBG_RightProd0 => DBG_RightProd0,
      DBG_RightProd1 => DBG_RightProd1,
      DBG_RightProd2 => DBG_RightProd2,
      DBG_TwiceTriArea => DBG_TwiceTriArea
    );
END MainDesign_TriSetup_0_0_arch;
