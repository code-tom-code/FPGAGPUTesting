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

-- IP VLNV: xilinx.com:module_ref:ClipUnit:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_ClipUnit_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    IA_inPreviousStageIsValid : IN STD_LOGIC;
    IA_outPreviousStageIsReady : OUT STD_LOGIC;
    TRISETUP_outNextStageIsValid : OUT STD_LOGIC;
    TRISETUP_inNextStageisReady : IN STD_LOGIC;
    IA_inv0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    IA_inv0tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv0ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    IA_inv1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    IA_inv1tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv1ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    IA_inv2x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    IA_inv2tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    IA_inv2ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    IA_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    IA_inWholeTriangleAABBIntersectsViewport : IN STD_LOGIC;
    TRISETUP_outv0x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv0y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv0z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv0w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv0rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRISETUP_outv0tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv0ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRISETUP_outv1tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv1ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    TRISETUP_outv2tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_outv2ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    TRISETUP_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    FPU_Add0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Add0_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Add0_IADD_GO : OUT STD_LOGIC;
    FPU_Add0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Add1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Add1_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Add1_IADD_GO : OUT STD_LOGIC;
    FPU_Add1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul0_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul0_IMUL_GO : OUT STD_LOGIC;
    FPU_Mul0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul1_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Mul1_IMUL_GO : OUT STD_LOGIC;
    FPU_Mul1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Rcp0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU_Rcp0_ISPEC_GO : OUT STD_LOGIC;
    FPU_Rcp0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    CMD_IsIdle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_CurrentState : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_CurrentClipPlane : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_CurrentClipBitmask : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_ChildTriStackSize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_ClipDistance0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_ClipDistance1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_TriangleIntersectsViewport : OUT STD_LOGIC;
    DBG_V0PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V0PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V0PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V0PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V1PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V1PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V1PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V1PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V2PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V2PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V2PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_V2PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_ClipOutcodes0 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    DBG_ClipOutcodes1 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    DBG_ClipOutcodes2 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    DBG_AlreadyClippedPlanes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
  );
END MainDesign_ClipUnit_0_0;

ARCHITECTURE MainDesign_ClipUnit_0_0_arch OF MainDesign_ClipUnit_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_ClipUnit_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ClipUnit IS
    PORT (
      clk : IN STD_LOGIC;
      IA_inPreviousStageIsValid : IN STD_LOGIC;
      IA_outPreviousStageIsReady : OUT STD_LOGIC;
      TRISETUP_outNextStageIsValid : OUT STD_LOGIC;
      TRISETUP_inNextStageisReady : IN STD_LOGIC;
      IA_inv0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      IA_inv0tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv0ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      IA_inv1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      IA_inv1tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv1ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      IA_inv2x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2y : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2z : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2w : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2rgba : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      IA_inv2tx : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2ty : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      IA_inv2ClipOutcodes : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      IA_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      IA_inWholeTriangleAABBIntersectsViewport : IN STD_LOGIC;
      TRISETUP_outv0x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv0y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv0z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv0w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv0rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRISETUP_outv0tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv0ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRISETUP_outv1tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv1ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2z : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2w : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2rgba : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      TRISETUP_outv2tx : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_outv2ty : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      TRISETUP_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      FPU_Add0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Add0_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Add0_IADD_GO : OUT STD_LOGIC;
      FPU_Add0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Add1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Add1_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Add1_IADD_GO : OUT STD_LOGIC;
      FPU_Add1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul0_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul0_IMUL_GO : OUT STD_LOGIC;
      FPU_Mul0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul1_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul1_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Mul1_IMUL_GO : OUT STD_LOGIC;
      FPU_Mul1_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Rcp0_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU_Rcp0_ISPEC_GO : OUT STD_LOGIC;
      FPU_Rcp0_OUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      CMD_IsIdle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_CurrentState : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_CurrentClipPlane : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_CurrentClipBitmask : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_ChildTriStackSize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_ClipDistance0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_ClipDistance1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_TriangleIntersectsViewport : OUT STD_LOGIC;
      DBG_V0PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V0PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V0PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V0PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V1PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V1PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V1PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V1PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V2PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V2PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V2PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_V2PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_ClipOutcodes0 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      DBG_ClipOutcodes1 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      DBG_ClipOutcodes2 : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      DBG_AlreadyClippedPlanes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
  END COMPONENT ClipUnit;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : ClipUnit
    PORT MAP (
      clk => clk,
      IA_inPreviousStageIsValid => IA_inPreviousStageIsValid,
      IA_outPreviousStageIsReady => IA_outPreviousStageIsReady,
      TRISETUP_outNextStageIsValid => TRISETUP_outNextStageIsValid,
      TRISETUP_inNextStageisReady => TRISETUP_inNextStageisReady,
      IA_inv0x => IA_inv0x,
      IA_inv0y => IA_inv0y,
      IA_inv0z => IA_inv0z,
      IA_inv0w => IA_inv0w,
      IA_inv0rgba => IA_inv0rgba,
      IA_inv0tx => IA_inv0tx,
      IA_inv0ty => IA_inv0ty,
      IA_inv0ClipOutcodes => IA_inv0ClipOutcodes,
      IA_inv1x => IA_inv1x,
      IA_inv1y => IA_inv1y,
      IA_inv1z => IA_inv1z,
      IA_inv1w => IA_inv1w,
      IA_inv1rgba => IA_inv1rgba,
      IA_inv1tx => IA_inv1tx,
      IA_inv1ty => IA_inv1ty,
      IA_inv1ClipOutcodes => IA_inv1ClipOutcodes,
      IA_inv2x => IA_inv2x,
      IA_inv2y => IA_inv2y,
      IA_inv2z => IA_inv2z,
      IA_inv2w => IA_inv2w,
      IA_inv2rgba => IA_inv2rgba,
      IA_inv2tx => IA_inv2tx,
      IA_inv2ty => IA_inv2ty,
      IA_inv2ClipOutcodes => IA_inv2ClipOutcodes,
      IA_CurrentDrawEventID => IA_CurrentDrawEventID,
      IA_inWholeTriangleAABBIntersectsViewport => IA_inWholeTriangleAABBIntersectsViewport,
      TRISETUP_outv0x => TRISETUP_outv0x,
      TRISETUP_outv0y => TRISETUP_outv0y,
      TRISETUP_outv0z => TRISETUP_outv0z,
      TRISETUP_outv0w => TRISETUP_outv0w,
      TRISETUP_outv0rgba => TRISETUP_outv0rgba,
      TRISETUP_outv0tx => TRISETUP_outv0tx,
      TRISETUP_outv0ty => TRISETUP_outv0ty,
      TRISETUP_outv1x => TRISETUP_outv1x,
      TRISETUP_outv1y => TRISETUP_outv1y,
      TRISETUP_outv1z => TRISETUP_outv1z,
      TRISETUP_outv1w => TRISETUP_outv1w,
      TRISETUP_outv1rgba => TRISETUP_outv1rgba,
      TRISETUP_outv1tx => TRISETUP_outv1tx,
      TRISETUP_outv1ty => TRISETUP_outv1ty,
      TRISETUP_outv2x => TRISETUP_outv2x,
      TRISETUP_outv2y => TRISETUP_outv2y,
      TRISETUP_outv2z => TRISETUP_outv2z,
      TRISETUP_outv2w => TRISETUP_outv2w,
      TRISETUP_outv2rgba => TRISETUP_outv2rgba,
      TRISETUP_outv2tx => TRISETUP_outv2tx,
      TRISETUP_outv2ty => TRISETUP_outv2ty,
      TRISETUP_CurrentDrawEventID => TRISETUP_CurrentDrawEventID,
      FPU_Add0_A => FPU_Add0_A,
      FPU_Add0_B => FPU_Add0_B,
      FPU_Add0_IADD_GO => FPU_Add0_IADD_GO,
      FPU_Add0_OUT => FPU_Add0_OUT,
      FPU_Add1_A => FPU_Add1_A,
      FPU_Add1_B => FPU_Add1_B,
      FPU_Add1_IADD_GO => FPU_Add1_IADD_GO,
      FPU_Add1_OUT => FPU_Add1_OUT,
      FPU_Mul0_A => FPU_Mul0_A,
      FPU_Mul0_B => FPU_Mul0_B,
      FPU_Mul0_IMUL_GO => FPU_Mul0_IMUL_GO,
      FPU_Mul0_OUT => FPU_Mul0_OUT,
      FPU_Mul1_A => FPU_Mul1_A,
      FPU_Mul1_B => FPU_Mul1_B,
      FPU_Mul1_IMUL_GO => FPU_Mul1_IMUL_GO,
      FPU_Mul1_OUT => FPU_Mul1_OUT,
      FPU_Rcp0_A => FPU_Rcp0_A,
      FPU_Rcp0_ISPEC_GO => FPU_Rcp0_ISPEC_GO,
      FPU_Rcp0_OUT => FPU_Rcp0_OUT,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      CMD_IsIdle => CMD_IsIdle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_CurrentState => DBG_CurrentState,
      DBG_CurrentClipPlane => DBG_CurrentClipPlane,
      DBG_CurrentClipBitmask => DBG_CurrentClipBitmask,
      DBG_ChildTriStackSize => DBG_ChildTriStackSize,
      DBG_ClipDistance0 => DBG_ClipDistance0,
      DBG_ClipDistance1 => DBG_ClipDistance1,
      DBG_TriangleIntersectsViewport => DBG_TriangleIntersectsViewport,
      DBG_V0PosX => DBG_V0PosX,
      DBG_V0PosY => DBG_V0PosY,
      DBG_V0PosZ => DBG_V0PosZ,
      DBG_V0PosW => DBG_V0PosW,
      DBG_V1PosX => DBG_V1PosX,
      DBG_V1PosY => DBG_V1PosY,
      DBG_V1PosZ => DBG_V1PosZ,
      DBG_V1PosW => DBG_V1PosW,
      DBG_V2PosX => DBG_V2PosX,
      DBG_V2PosY => DBG_V2PosY,
      DBG_V2PosZ => DBG_V2PosZ,
      DBG_V2PosW => DBG_V2PosW,
      DBG_ClipOutcodes0 => DBG_ClipOutcodes0,
      DBG_ClipOutcodes1 => DBG_ClipOutcodes1,
      DBG_ClipOutcodes2 => DBG_ClipOutcodes2,
      DBG_AlreadyClippedPlanes => DBG_AlreadyClippedPlanes
    );
END MainDesign_ClipUnit_0_0_arch;
