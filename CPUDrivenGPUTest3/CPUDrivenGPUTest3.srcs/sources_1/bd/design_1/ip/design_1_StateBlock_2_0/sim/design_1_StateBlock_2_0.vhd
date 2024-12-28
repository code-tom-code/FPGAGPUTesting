-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:StateBlock:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_StateBlock_2_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_SetNewState : IN STD_LOGIC;
    CMD_EndFrameReset : IN STD_LOGIC;
    CMD_NumFreeSlots : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_NewStateBits : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    CMD_NewStateDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAGE_StateBitsAtDrawID : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    STAGE_NextDrawID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAGE_StateIsValid : OUT STD_LOGIC;
    STAGE_ConsumeStateSlot : IN STD_LOGIC;
    DBG_SlotsValid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_CurrentReadSlotIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_CurrentWriteSlotIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_Slot0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Slot1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Slot2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_Slot3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END design_1_StateBlock_2_0;

ARCHITECTURE design_1_StateBlock_2_0_arch OF design_1_StateBlock_2_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_StateBlock_2_0_arch: ARCHITECTURE IS "yes";
  COMPONENT StateBlock IS
    GENERIC (
      StateBitsCount : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      CMD_SetNewState : IN STD_LOGIC;
      CMD_EndFrameReset : IN STD_LOGIC;
      CMD_NumFreeSlots : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_NewStateBits : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      CMD_NewStateDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAGE_StateBitsAtDrawID : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      STAGE_NextDrawID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAGE_StateIsValid : OUT STD_LOGIC;
      STAGE_ConsumeStateSlot : IN STD_LOGIC;
      DBG_SlotsValid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_CurrentReadSlotIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_CurrentWriteSlotIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_Slot0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Slot1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Slot2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_Slot3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT StateBlock;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : StateBlock
    GENERIC MAP (
      StateBitsCount => 5
    )
    PORT MAP (
      clk => clk,
      CMD_SetNewState => CMD_SetNewState,
      CMD_EndFrameReset => CMD_EndFrameReset,
      CMD_NumFreeSlots => CMD_NumFreeSlots,
      CMD_NewStateBits => CMD_NewStateBits,
      CMD_NewStateDrawEventID => CMD_NewStateDrawEventID,
      STAGE_StateBitsAtDrawID => STAGE_StateBitsAtDrawID,
      STAGE_NextDrawID => STAGE_NextDrawID,
      STAGE_StateIsValid => STAGE_StateIsValid,
      STAGE_ConsumeStateSlot => STAGE_ConsumeStateSlot,
      DBG_SlotsValid => DBG_SlotsValid,
      DBG_CurrentReadSlotIndex => DBG_CurrentReadSlotIndex,
      DBG_CurrentWriteSlotIndex => DBG_CurrentWriteSlotIndex,
      DBG_Slot0 => DBG_Slot0,
      DBG_Slot1 => DBG_Slot1,
      DBG_Slot2 => DBG_Slot2,
      DBG_Slot3 => DBG_Slot3
    );
END design_1_StateBlock_2_0_arch;
