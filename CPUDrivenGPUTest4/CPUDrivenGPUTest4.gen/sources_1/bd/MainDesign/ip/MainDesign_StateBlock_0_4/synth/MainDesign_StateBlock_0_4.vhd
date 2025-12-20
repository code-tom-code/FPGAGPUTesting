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

-- IP VLNV: xilinx.com:module_ref:StateBlock:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_StateBlock_0_4 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_SetNewState : IN STD_LOGIC;
    CMD_EndFrameReset : IN STD_LOGIC;
    CMD_NumFreeSlots : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_NewStateBits : IN STD_LOGIC_VECTOR(76 DOWNTO 0);
    CMD_NewStateDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAGE_StateBitsAtDrawID : OUT STD_LOGIC_VECTOR(76 DOWNTO 0);
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
END MainDesign_StateBlock_0_4;

ARCHITECTURE MainDesign_StateBlock_0_4_arch OF MainDesign_StateBlock_0_4 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_StateBlock_0_4_arch: ARCHITECTURE IS "yes";
  COMPONENT StateBlock IS
    GENERIC (
      StateBitsCount : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      CMD_SetNewState : IN STD_LOGIC;
      CMD_EndFrameReset : IN STD_LOGIC;
      CMD_NumFreeSlots : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_NewStateBits : IN STD_LOGIC_VECTOR(76 DOWNTO 0);
      CMD_NewStateDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAGE_StateBitsAtDrawID : OUT STD_LOGIC_VECTOR(76 DOWNTO 0);
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
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MainDesign_StateBlock_0_4_arch: ARCHITECTURE IS "StateBlock,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MainDesign_StateBlock_0_4_arch : ARCHITECTURE IS "MainDesign_StateBlock_0_4,StateBlock,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MainDesign_StateBlock_0_4_arch: ARCHITECTURE IS "MainDesign_StateBlock_0_4,StateBlock,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StateBlock,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,StateBitsCount=77}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MainDesign_StateBlock_0_4_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : StateBlock
    GENERIC MAP (
      StateBitsCount => 77
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
END MainDesign_StateBlock_0_4_arch;
