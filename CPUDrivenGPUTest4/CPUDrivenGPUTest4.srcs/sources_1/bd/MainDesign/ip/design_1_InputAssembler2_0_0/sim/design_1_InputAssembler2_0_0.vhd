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

-- IP VLNV: xilinx.com:module_ref:InputAssembler2:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_InputAssembler2_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CLIP_v0PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v0PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v1PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_v2PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex0_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex0_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex1_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex1_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex2_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_tex2_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLIP_vertColor0_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_vertColor1_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_vertColor2_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    CLIP_v0ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    CLIP_v1ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    CLIP_v2ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    CLIP_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    CLIP_AABBTriOverlapsViewport : OUT STD_LOGIC;
    CLIP_readyForNewTri : IN STD_LOGIC;
    CLIP_newTriBegin : OUT STD_LOGIC;
    VBO_Pushed : IN STD_LOGIC;
    VBO_NumVertices : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    VBO_NumIndices : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    VBO_IsIndexedDrawCall : IN STD_LOGIC;
    VBO_Ready : OUT STD_LOGIC;
    VERTOUT_FIFO_empty : IN STD_LOGIC;
    VERTOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(319 DOWNTO 0);
    VERTOUT_FIFO_rd_en : OUT STD_LOGIC;
    INDEXOUT_FIFO_empty : IN STD_LOGIC;
    INDEXOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(271 DOWNTO 0);
    INDEXOUT_FIFO_rd_en : OUT STD_LOGIC;
    STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STATE_StateIsValid : IN STD_LOGIC;
    STATE_ConsumeStateSlot : OUT STD_LOGIC;
    CMD_IA_Idle : OUT STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesLoadingDataToCache : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_IA_State : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_IA_VertexIDPerBatch : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_IA_CurrentTriIndices : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END design_1_InputAssembler2_0_0;

ARCHITECTURE design_1_InputAssembler2_0_0_arch OF design_1_InputAssembler2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_InputAssembler2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT InputAssembler2 IS
    PORT (
      clk : IN STD_LOGIC;
      CLIP_v0PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v0PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v1PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2PosX : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2PosY : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2PosZ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_v2PosW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex0_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex0_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex1_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex1_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex2_X : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_tex2_Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLIP_vertColor0_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_vertColor1_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_vertColor2_RGBA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      CLIP_v0ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      CLIP_v1ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      CLIP_v2ClipCodes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      CLIP_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      CLIP_AABBTriOverlapsViewport : OUT STD_LOGIC;
      CLIP_readyForNewTri : IN STD_LOGIC;
      CLIP_newTriBegin : OUT STD_LOGIC;
      VBO_Pushed : IN STD_LOGIC;
      VBO_NumVertices : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      VBO_NumIndices : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      VBO_IsIndexedDrawCall : IN STD_LOGIC;
      VBO_Ready : OUT STD_LOGIC;
      VERTOUT_FIFO_empty : IN STD_LOGIC;
      VERTOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(319 DOWNTO 0);
      VERTOUT_FIFO_rd_en : OUT STD_LOGIC;
      INDEXOUT_FIFO_empty : IN STD_LOGIC;
      INDEXOUT_FIFO_rd_data : IN STD_LOGIC_VECTOR(271 DOWNTO 0);
      INDEXOUT_FIFO_rd_en : OUT STD_LOGIC;
      STATE_StateBitsAtDrawID : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      STATE_NextDrawID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STATE_StateIsValid : IN STD_LOGIC;
      STATE_ConsumeStateSlot : OUT STD_LOGIC;
      CMD_IA_Idle : OUT STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesLoadingDataToCache : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_IA_State : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_IA_VertexIDPerBatch : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_IA_CurrentTriIndices : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
  END COMPONENT InputAssembler2;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : InputAssembler2
    PORT MAP (
      clk => clk,
      CLIP_v0PosX => CLIP_v0PosX,
      CLIP_v0PosY => CLIP_v0PosY,
      CLIP_v0PosZ => CLIP_v0PosZ,
      CLIP_v0PosW => CLIP_v0PosW,
      CLIP_v1PosX => CLIP_v1PosX,
      CLIP_v1PosY => CLIP_v1PosY,
      CLIP_v1PosZ => CLIP_v1PosZ,
      CLIP_v1PosW => CLIP_v1PosW,
      CLIP_v2PosX => CLIP_v2PosX,
      CLIP_v2PosY => CLIP_v2PosY,
      CLIP_v2PosZ => CLIP_v2PosZ,
      CLIP_v2PosW => CLIP_v2PosW,
      CLIP_tex0_X => CLIP_tex0_X,
      CLIP_tex0_Y => CLIP_tex0_Y,
      CLIP_tex1_X => CLIP_tex1_X,
      CLIP_tex1_Y => CLIP_tex1_Y,
      CLIP_tex2_X => CLIP_tex2_X,
      CLIP_tex2_Y => CLIP_tex2_Y,
      CLIP_vertColor0_RGBA => CLIP_vertColor0_RGBA,
      CLIP_vertColor1_RGBA => CLIP_vertColor1_RGBA,
      CLIP_vertColor2_RGBA => CLIP_vertColor2_RGBA,
      CLIP_v0ClipCodes => CLIP_v0ClipCodes,
      CLIP_v1ClipCodes => CLIP_v1ClipCodes,
      CLIP_v2ClipCodes => CLIP_v2ClipCodes,
      CLIP_CurrentDrawEventID => CLIP_CurrentDrawEventID,
      CLIP_AABBTriOverlapsViewport => CLIP_AABBTriOverlapsViewport,
      CLIP_readyForNewTri => CLIP_readyForNewTri,
      CLIP_newTriBegin => CLIP_newTriBegin,
      VBO_Pushed => VBO_Pushed,
      VBO_NumVertices => VBO_NumVertices,
      VBO_NumIndices => VBO_NumIndices,
      VBO_IsIndexedDrawCall => VBO_IsIndexedDrawCall,
      VBO_Ready => VBO_Ready,
      VERTOUT_FIFO_empty => VERTOUT_FIFO_empty,
      VERTOUT_FIFO_rd_data => VERTOUT_FIFO_rd_data,
      VERTOUT_FIFO_rd_en => VERTOUT_FIFO_rd_en,
      INDEXOUT_FIFO_empty => INDEXOUT_FIFO_empty,
      INDEXOUT_FIFO_rd_data => INDEXOUT_FIFO_rd_data,
      INDEXOUT_FIFO_rd_en => INDEXOUT_FIFO_rd_en,
      STATE_StateBitsAtDrawID => STATE_StateBitsAtDrawID,
      STATE_NextDrawID => STATE_NextDrawID,
      STATE_StateIsValid => STATE_StateIsValid,
      STATE_ConsumeStateSlot => STATE_ConsumeStateSlot,
      CMD_IA_Idle => CMD_IA_Idle,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesLoadingDataToCache => STAT_CyclesLoadingDataToCache,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_IA_State => DBG_IA_State,
      DBG_IA_VertexIDPerBatch => DBG_IA_VertexIDPerBatch,
      DBG_IA_CurrentTriIndices => DBG_IA_CurrentTriIndices
    );
END design_1_InputAssembler2_0_0_arch;
