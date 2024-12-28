-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:CommandProcessor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_CommandProcessor_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    resetn : IN STD_LOGIC;
    validPacketsFIFO_rd_data : IN STD_LOGIC_VECTOR(87 DOWNTO 0);
    validPacketsFIFO_empty : IN STD_LOGIC;
    validPacketsFIFO_rd_en : OUT STD_LOGIC;
    returnPacketsFIFO_full : IN STD_LOGIC;
    returnPacketsFIFO_wr_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    returnPacketsFIFO_wr_en : OUT STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    CommandProcReadRequestsFIFO_full : IN STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    CommandProcReadResponsesFIFO_empty : IN STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    CommandProcWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
    CommandProcWriteRequestsFIFO_full : IN STD_LOGIC;
    CommandProcWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
    CMD_VS_Idle : IN STD_LOGIC;
    CMD_IA_Idle : IN STD_LOGIC;
    CMD_Clip_Idle : IN STD_LOGIC;
    CMD_TriSetup_Idle : IN STD_LOGIC;
    CMD_Rasterizer_Idle : IN STD_LOGIC;
    CMD_DepthInterpolator_Idle : IN STD_LOGIC;
    CMD_Depth_Idle : IN STD_LOGIC;
    CMD_AttrInterpolator_Idle : IN STD_LOGIC;
    CMD_TexSampler_Idle : IN STD_LOGIC;
    CMD_ROP_Idle : IN STD_LOGIC;
    CMD_ClearBlock_Idle : IN STD_LOGIC;
    CMD_MemController_Idle : IN STD_LOGIC;
    CMD_VSync : IN STD_LOGIC;
    CMD_FIFO_EMPTY_VBB : IN STD_LOGIC;
    CMD_FIFO_EMPTY_VS : IN STD_LOGIC;
    CMD_FIFO_EMPTY_RASTOUT : IN STD_LOGIC;
    CMD_FIFO_EMPTY_ATTR : IN STD_LOGIC;
    CMD_FIFO_EMPTY_TEXSAMP : IN STD_LOGIC;
    CMD_FIFO_EMPTY_ROP : IN STD_LOGIC;
    SHADER_IsReadyForCommand : IN STD_LOGIC;
    SHADER_InCommand : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    SHADER_LoadProgramAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    SHADER_LoadProgramLen : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    SHADER_SetConstantIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    SHADER_SetConstantData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    SHADER_SetNumVertexStreams : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    SHADER_SetVertexStreamID : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    SHADER_SetVertexStreamDWORDCount : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    SHADER_SetVertexStreamIsD3DCOLOR : OUT STD_LOGIC;
    SHADER_SetVertexStreamShaderRegIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    SHADER_SetVertexStreamDWORDStride : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    SHADER_SetVertexStreamDWORDOffset : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    SHADER_ReadRegisterOutRequest : OUT STD_LOGIC;
    SHADER_ReadRegisterOutDataReady : IN STD_LOGIC;
    SHADER_ReadRegisterOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    IA_SetNewState : OUT STD_LOGIC;
    IA_EndFrameReset : OUT STD_LOGIC;
    IA_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    IA_NewStateBits : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    IA_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    VBB_SendCommand : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    VBB_CommandArg0 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    VBB_CommandArg1 : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
    VBB_CommandArg2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    VBB_NewDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    VBB_ReadyState : IN STD_LOGIC;
    VBB_SetNewState : OUT STD_LOGIC;
    VBB_EndFrameReset : OUT STD_LOGIC;
    VBB_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    VBB_NewStateBits : OUT STD_LOGIC_VECTOR(34 DOWNTO 0);
    VBB_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    CLIP_SetNewState : OUT STD_LOGIC;
    CLIP_EndFrameReset : OUT STD_LOGIC;
    CLIP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CLIP_NewStateBits : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    CLIP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    TRISETUP_SetNewState : OUT STD_LOGIC;
    TRISETUP_EndFrameReset : OUT STD_LOGIC;
    TRISETUP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    TRISETUP_NewStateBits : OUT STD_LOGIC_VECTOR(191 DOWNTO 0);
    TRISETUP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DINTERP_STAT_CountDepthOnlyPixelsPassed : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    DINTERP_SetNewState : OUT STD_LOGIC;
    DINTERP_EndFrameReset : OUT STD_LOGIC;
    DINTERP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    DINTERP_NewStateBits : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
    DINTERP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DEPTH_ClearDepthBuffer : OUT STD_LOGIC;
    DEPTH_ClearDepthValue : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    INTERP_SetNewState : OUT STD_LOGIC;
    INTERP_EndFrameReset : OUT STD_LOGIC;
    INTERP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    INTERP_NewStateBits : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    INTERP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    TEXSAMP_SetNewState : OUT STD_LOGIC;
    TEXSAMP_EndFrameReset : OUT STD_LOGIC;
    TEXSAMP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    TEXSAMP_NewStateBits : OUT STD_LOGIC_VECTOR(73 DOWNTO 0);
    TEXSAMP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ROP_SetClearColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_ClearSignal : OUT STD_LOGIC;
    ROP_ClearSignalAck : IN STD_LOGIC;
    ROP_FlushCacheSignal : OUT STD_LOGIC;
    ROP_FlushCacheAck : IN STD_LOGIC;
    ROP_STAT_CountPixelsPassed : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ROP_STAT_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    ROP_SetNewState : OUT STD_LOGIC;
    ROP_EndFrameReset : OUT STD_LOGIC;
    ROP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ROP_NewStateBits : OUT STD_LOGIC_VECTOR(100 DOWNTO 0);
    ROP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    SCANOUT_RenderTargetBaseAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    SCANOUT_ScanEnable : OUT STD_LOGIC;
    SCANOUT_InvertOutputColor : OUT STD_LOGIC;
    SCANOUT_OutputColorChannels : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    CLEAR_ClearBlockBeginSignal : OUT STD_LOGIC;
    CLEAR_BaseRenderTargetAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    CLEAR_ClearColorRGBA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    CLEAR_ClearDRAMLineCount : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_PresentSignal : OUT STD_LOGIC;
    STAT_SetNewStatsConfig : OUT STD_LOGIC;
    STAT_WriteFrameStatsAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    STAT_EnableEventTimestamps : OUT STD_LOGIC;
    STAT_WriteEventTimestampsAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    STAT_WriteEventTimestampOrders : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    STAT_CountTimestampsMemoryWrites : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_CountTimestampsOrdersMemoryWrites : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    STAT_StatsSaveComplete : IN STD_LOGIC;
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_CMDPACKETSTATE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_LAST_IN_PACKET : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    DBG_LAST_OUT_PACKET : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    DBG_LAST_READ_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_LAST_WRITE_ADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_LAST_WRITE_DATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    DBG_IdleSignalsVector : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
    DBG_CurrentDrawGeneration : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END design_1_CommandProcessor_0_0;

ARCHITECTURE design_1_CommandProcessor_0_0_arch OF design_1_CommandProcessor_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_CommandProcessor_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT CommandProcessor IS
    GENERIC (
      ADDR_WIDTH_BITS : INTEGER;
      DATA_WIDTH_BITS : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      resetn : IN STD_LOGIC;
      validPacketsFIFO_rd_data : IN STD_LOGIC_VECTOR(87 DOWNTO 0);
      validPacketsFIFO_empty : IN STD_LOGIC;
      validPacketsFIFO_rd_en : OUT STD_LOGIC;
      returnPacketsFIFO_full : IN STD_LOGIC;
      returnPacketsFIFO_wr_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
      returnPacketsFIFO_wr_en : OUT STD_LOGIC;
      CommandProcReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      CommandProcReadRequestsFIFO_full : IN STD_LOGIC;
      CommandProcReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      CommandProcReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      CommandProcReadResponsesFIFO_empty : IN STD_LOGIC;
      CommandProcReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      CommandProcWriteRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(293 DOWNTO 0);
      CommandProcWriteRequestsFIFO_full : IN STD_LOGIC;
      CommandProcWriteRequestsFIFO_wr_en : OUT STD_LOGIC;
      CMD_VS_Idle : IN STD_LOGIC;
      CMD_IA_Idle : IN STD_LOGIC;
      CMD_Clip_Idle : IN STD_LOGIC;
      CMD_TriSetup_Idle : IN STD_LOGIC;
      CMD_Rasterizer_Idle : IN STD_LOGIC;
      CMD_DepthInterpolator_Idle : IN STD_LOGIC;
      CMD_Depth_Idle : IN STD_LOGIC;
      CMD_AttrInterpolator_Idle : IN STD_LOGIC;
      CMD_TexSampler_Idle : IN STD_LOGIC;
      CMD_ROP_Idle : IN STD_LOGIC;
      CMD_ClearBlock_Idle : IN STD_LOGIC;
      CMD_MemController_Idle : IN STD_LOGIC;
      CMD_VSync : IN STD_LOGIC;
      CMD_FIFO_EMPTY_VBB : IN STD_LOGIC;
      CMD_FIFO_EMPTY_VS : IN STD_LOGIC;
      CMD_FIFO_EMPTY_RASTOUT : IN STD_LOGIC;
      CMD_FIFO_EMPTY_ATTR : IN STD_LOGIC;
      CMD_FIFO_EMPTY_TEXSAMP : IN STD_LOGIC;
      CMD_FIFO_EMPTY_ROP : IN STD_LOGIC;
      SHADER_IsReadyForCommand : IN STD_LOGIC;
      SHADER_InCommand : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      SHADER_LoadProgramAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      SHADER_LoadProgramLen : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      SHADER_SetConstantIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      SHADER_SetConstantData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      SHADER_SetNumVertexStreams : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      SHADER_SetVertexStreamID : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      SHADER_SetVertexStreamDWORDCount : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      SHADER_SetVertexStreamIsD3DCOLOR : OUT STD_LOGIC;
      SHADER_SetVertexStreamShaderRegIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      SHADER_SetVertexStreamDWORDStride : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      SHADER_SetVertexStreamDWORDOffset : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      SHADER_ReadRegisterOutRequest : OUT STD_LOGIC;
      SHADER_ReadRegisterOutDataReady : IN STD_LOGIC;
      SHADER_ReadRegisterOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      IA_SetNewState : OUT STD_LOGIC;
      IA_EndFrameReset : OUT STD_LOGIC;
      IA_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      IA_NewStateBits : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      IA_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      VBB_SendCommand : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      VBB_CommandArg0 : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      VBB_CommandArg1 : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      VBB_CommandArg2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      VBB_NewDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      VBB_ReadyState : IN STD_LOGIC;
      VBB_SetNewState : OUT STD_LOGIC;
      VBB_EndFrameReset : OUT STD_LOGIC;
      VBB_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      VBB_NewStateBits : OUT STD_LOGIC_VECTOR(34 DOWNTO 0);
      VBB_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      CLIP_SetNewState : OUT STD_LOGIC;
      CLIP_EndFrameReset : OUT STD_LOGIC;
      CLIP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CLIP_NewStateBits : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      CLIP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      TRISETUP_SetNewState : OUT STD_LOGIC;
      TRISETUP_EndFrameReset : OUT STD_LOGIC;
      TRISETUP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      TRISETUP_NewStateBits : OUT STD_LOGIC_VECTOR(191 DOWNTO 0);
      TRISETUP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DINTERP_STAT_CountDepthOnlyPixelsPassed : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      DINTERP_SetNewState : OUT STD_LOGIC;
      DINTERP_EndFrameReset : OUT STD_LOGIC;
      DINTERP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      DINTERP_NewStateBits : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
      DINTERP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DEPTH_ClearDepthBuffer : OUT STD_LOGIC;
      DEPTH_ClearDepthValue : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      INTERP_SetNewState : OUT STD_LOGIC;
      INTERP_EndFrameReset : OUT STD_LOGIC;
      INTERP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      INTERP_NewStateBits : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      INTERP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      TEXSAMP_SetNewState : OUT STD_LOGIC;
      TEXSAMP_EndFrameReset : OUT STD_LOGIC;
      TEXSAMP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      TEXSAMP_NewStateBits : OUT STD_LOGIC_VECTOR(73 DOWNTO 0);
      TEXSAMP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      ROP_SetClearColor : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_ClearSignal : OUT STD_LOGIC;
      ROP_ClearSignalAck : IN STD_LOGIC;
      ROP_FlushCacheSignal : OUT STD_LOGIC;
      ROP_FlushCacheAck : IN STD_LOGIC;
      ROP_STAT_CountPixelsPassed : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ROP_STAT_CurrentDrawEventID : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      ROP_SetNewState : OUT STD_LOGIC;
      ROP_EndFrameReset : OUT STD_LOGIC;
      ROP_NumFreeSlots : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      ROP_NewStateBits : OUT STD_LOGIC_VECTOR(100 DOWNTO 0);
      ROP_NewStateDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      SCANOUT_RenderTargetBaseAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      SCANOUT_ScanEnable : OUT STD_LOGIC;
      SCANOUT_InvertOutputColor : OUT STD_LOGIC;
      SCANOUT_OutputColorChannels : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      CLEAR_ClearBlockBeginSignal : OUT STD_LOGIC;
      CLEAR_BaseRenderTargetAddr : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      CLEAR_ClearColorRGBA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      CLEAR_ClearDRAMLineCount : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_PresentSignal : OUT STD_LOGIC;
      STAT_SetNewStatsConfig : OUT STD_LOGIC;
      STAT_WriteFrameStatsAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      STAT_EnableEventTimestamps : OUT STD_LOGIC;
      STAT_WriteEventTimestampsAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      STAT_WriteEventTimestampOrders : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      STAT_CountTimestampsMemoryWrites : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_CountTimestampsOrdersMemoryWrites : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      STAT_StatsSaveComplete : IN STD_LOGIC;
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_CMDPACKETSTATE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_LAST_IN_PACKET : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
      DBG_LAST_OUT_PACKET : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
      DBG_LAST_READ_DATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_LAST_WRITE_ADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_LAST_WRITE_DATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      DBG_IdleSignalsVector : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
      DBG_CurrentDrawGeneration : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT CommandProcessor;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests FULL";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF resetn: SIGNAL IS "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF resetn: SIGNAL IS "xilinx.com:signal:reset:1.0 resetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : CommandProcessor
    GENERIC MAP (
      ADDR_WIDTH_BITS => 30,
      DATA_WIDTH_BITS => 256
    )
    PORT MAP (
      clk => clk,
      resetn => resetn,
      validPacketsFIFO_rd_data => validPacketsFIFO_rd_data,
      validPacketsFIFO_empty => validPacketsFIFO_empty,
      validPacketsFIFO_rd_en => validPacketsFIFO_rd_en,
      returnPacketsFIFO_full => returnPacketsFIFO_full,
      returnPacketsFIFO_wr_data => returnPacketsFIFO_wr_data,
      returnPacketsFIFO_wr_en => returnPacketsFIFO_wr_en,
      CommandProcReadRequestsFIFO_wr_data => CommandProcReadRequestsFIFO_wr_data,
      CommandProcReadRequestsFIFO_full => CommandProcReadRequestsFIFO_full,
      CommandProcReadRequestsFIFO_wr_en => CommandProcReadRequestsFIFO_wr_en,
      CommandProcReadResponsesFIFO_rd_data => CommandProcReadResponsesFIFO_rd_data,
      CommandProcReadResponsesFIFO_empty => CommandProcReadResponsesFIFO_empty,
      CommandProcReadResponsesFIFO_rd_en => CommandProcReadResponsesFIFO_rd_en,
      CommandProcWriteRequestsFIFO_wr_data => CommandProcWriteRequestsFIFO_wr_data,
      CommandProcWriteRequestsFIFO_full => CommandProcWriteRequestsFIFO_full,
      CommandProcWriteRequestsFIFO_wr_en => CommandProcWriteRequestsFIFO_wr_en,
      CMD_VS_Idle => CMD_VS_Idle,
      CMD_IA_Idle => CMD_IA_Idle,
      CMD_Clip_Idle => CMD_Clip_Idle,
      CMD_TriSetup_Idle => CMD_TriSetup_Idle,
      CMD_Rasterizer_Idle => CMD_Rasterizer_Idle,
      CMD_DepthInterpolator_Idle => CMD_DepthInterpolator_Idle,
      CMD_Depth_Idle => CMD_Depth_Idle,
      CMD_AttrInterpolator_Idle => CMD_AttrInterpolator_Idle,
      CMD_TexSampler_Idle => CMD_TexSampler_Idle,
      CMD_ROP_Idle => CMD_ROP_Idle,
      CMD_ClearBlock_Idle => CMD_ClearBlock_Idle,
      CMD_MemController_Idle => CMD_MemController_Idle,
      CMD_VSync => CMD_VSync,
      CMD_FIFO_EMPTY_VBB => CMD_FIFO_EMPTY_VBB,
      CMD_FIFO_EMPTY_VS => CMD_FIFO_EMPTY_VS,
      CMD_FIFO_EMPTY_RASTOUT => CMD_FIFO_EMPTY_RASTOUT,
      CMD_FIFO_EMPTY_ATTR => CMD_FIFO_EMPTY_ATTR,
      CMD_FIFO_EMPTY_TEXSAMP => CMD_FIFO_EMPTY_TEXSAMP,
      CMD_FIFO_EMPTY_ROP => CMD_FIFO_EMPTY_ROP,
      SHADER_IsReadyForCommand => SHADER_IsReadyForCommand,
      SHADER_InCommand => SHADER_InCommand,
      SHADER_LoadProgramAddr => SHADER_LoadProgramAddr,
      SHADER_LoadProgramLen => SHADER_LoadProgramLen,
      SHADER_SetConstantIndex => SHADER_SetConstantIndex,
      SHADER_SetConstantData => SHADER_SetConstantData,
      SHADER_SetNumVertexStreams => SHADER_SetNumVertexStreams,
      SHADER_SetVertexStreamID => SHADER_SetVertexStreamID,
      SHADER_SetVertexStreamDWORDCount => SHADER_SetVertexStreamDWORDCount,
      SHADER_SetVertexStreamIsD3DCOLOR => SHADER_SetVertexStreamIsD3DCOLOR,
      SHADER_SetVertexStreamShaderRegIndex => SHADER_SetVertexStreamShaderRegIndex,
      SHADER_SetVertexStreamDWORDStride => SHADER_SetVertexStreamDWORDStride,
      SHADER_SetVertexStreamDWORDOffset => SHADER_SetVertexStreamDWORDOffset,
      SHADER_ReadRegisterOutRequest => SHADER_ReadRegisterOutRequest,
      SHADER_ReadRegisterOutDataReady => SHADER_ReadRegisterOutDataReady,
      SHADER_ReadRegisterOutData => SHADER_ReadRegisterOutData,
      IA_SetNewState => IA_SetNewState,
      IA_EndFrameReset => IA_EndFrameReset,
      IA_NumFreeSlots => IA_NumFreeSlots,
      IA_NewStateBits => IA_NewStateBits,
      IA_NewStateDrawEventID => IA_NewStateDrawEventID,
      VBB_SendCommand => VBB_SendCommand,
      VBB_CommandArg0 => VBB_CommandArg0,
      VBB_CommandArg1 => VBB_CommandArg1,
      VBB_CommandArg2 => VBB_CommandArg2,
      VBB_NewDrawEventID => VBB_NewDrawEventID,
      VBB_ReadyState => VBB_ReadyState,
      VBB_SetNewState => VBB_SetNewState,
      VBB_EndFrameReset => VBB_EndFrameReset,
      VBB_NumFreeSlots => VBB_NumFreeSlots,
      VBB_NewStateBits => VBB_NewStateBits,
      VBB_NewStateDrawEventID => VBB_NewStateDrawEventID,
      CLIP_SetNewState => CLIP_SetNewState,
      CLIP_EndFrameReset => CLIP_EndFrameReset,
      CLIP_NumFreeSlots => CLIP_NumFreeSlots,
      CLIP_NewStateBits => CLIP_NewStateBits,
      CLIP_NewStateDrawEventID => CLIP_NewStateDrawEventID,
      TRISETUP_SetNewState => TRISETUP_SetNewState,
      TRISETUP_EndFrameReset => TRISETUP_EndFrameReset,
      TRISETUP_NumFreeSlots => TRISETUP_NumFreeSlots,
      TRISETUP_NewStateBits => TRISETUP_NewStateBits,
      TRISETUP_NewStateDrawEventID => TRISETUP_NewStateDrawEventID,
      DINTERP_STAT_CountDepthOnlyPixelsPassed => DINTERP_STAT_CountDepthOnlyPixelsPassed,
      DINTERP_SetNewState => DINTERP_SetNewState,
      DINTERP_EndFrameReset => DINTERP_EndFrameReset,
      DINTERP_NumFreeSlots => DINTERP_NumFreeSlots,
      DINTERP_NewStateBits => DINTERP_NewStateBits,
      DINTERP_NewStateDrawEventID => DINTERP_NewStateDrawEventID,
      DEPTH_ClearDepthBuffer => DEPTH_ClearDepthBuffer,
      DEPTH_ClearDepthValue => DEPTH_ClearDepthValue,
      INTERP_SetNewState => INTERP_SetNewState,
      INTERP_EndFrameReset => INTERP_EndFrameReset,
      INTERP_NumFreeSlots => INTERP_NumFreeSlots,
      INTERP_NewStateBits => INTERP_NewStateBits,
      INTERP_NewStateDrawEventID => INTERP_NewStateDrawEventID,
      TEXSAMP_SetNewState => TEXSAMP_SetNewState,
      TEXSAMP_EndFrameReset => TEXSAMP_EndFrameReset,
      TEXSAMP_NumFreeSlots => TEXSAMP_NumFreeSlots,
      TEXSAMP_NewStateBits => TEXSAMP_NewStateBits,
      TEXSAMP_NewStateDrawEventID => TEXSAMP_NewStateDrawEventID,
      ROP_SetClearColor => ROP_SetClearColor,
      ROP_ClearSignal => ROP_ClearSignal,
      ROP_ClearSignalAck => ROP_ClearSignalAck,
      ROP_FlushCacheSignal => ROP_FlushCacheSignal,
      ROP_FlushCacheAck => ROP_FlushCacheAck,
      ROP_STAT_CountPixelsPassed => ROP_STAT_CountPixelsPassed,
      ROP_STAT_CurrentDrawEventID => ROP_STAT_CurrentDrawEventID,
      ROP_SetNewState => ROP_SetNewState,
      ROP_EndFrameReset => ROP_EndFrameReset,
      ROP_NumFreeSlots => ROP_NumFreeSlots,
      ROP_NewStateBits => ROP_NewStateBits,
      ROP_NewStateDrawEventID => ROP_NewStateDrawEventID,
      SCANOUT_RenderTargetBaseAddr => SCANOUT_RenderTargetBaseAddr,
      SCANOUT_ScanEnable => SCANOUT_ScanEnable,
      SCANOUT_InvertOutputColor => SCANOUT_InvertOutputColor,
      SCANOUT_OutputColorChannels => SCANOUT_OutputColorChannels,
      CLEAR_ClearBlockBeginSignal => CLEAR_ClearBlockBeginSignal,
      CLEAR_BaseRenderTargetAddr => CLEAR_BaseRenderTargetAddr,
      CLEAR_ClearColorRGBA => CLEAR_ClearColorRGBA,
      CLEAR_ClearDRAMLineCount => CLEAR_ClearDRAMLineCount,
      STAT_PresentSignal => STAT_PresentSignal,
      STAT_SetNewStatsConfig => STAT_SetNewStatsConfig,
      STAT_WriteFrameStatsAddress => STAT_WriteFrameStatsAddress,
      STAT_EnableEventTimestamps => STAT_EnableEventTimestamps,
      STAT_WriteEventTimestampsAddress => STAT_WriteEventTimestampsAddress,
      STAT_WriteEventTimestampOrders => STAT_WriteEventTimestampOrders,
      STAT_CountTimestampsMemoryWrites => STAT_CountTimestampsMemoryWrites,
      STAT_CountTimestampsOrdersMemoryWrites => STAT_CountTimestampsOrdersMemoryWrites,
      STAT_StatsSaveComplete => STAT_StatsSaveComplete,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      DBG_CMDPACKETSTATE => DBG_CMDPACKETSTATE,
      DBG_LAST_IN_PACKET => DBG_LAST_IN_PACKET,
      DBG_LAST_OUT_PACKET => DBG_LAST_OUT_PACKET,
      DBG_LAST_READ_DATA => DBG_LAST_READ_DATA,
      DBG_LAST_WRITE_ADDR => DBG_LAST_WRITE_ADDR,
      DBG_LAST_WRITE_DATA => DBG_LAST_WRITE_DATA,
      DBG_IdleSignalsVector => DBG_IdleSignalsVector,
      DBG_CurrentDrawGeneration => DBG_CurrentDrawGeneration
    );
END design_1_CommandProcessor_0_0_arch;
