-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:28:54 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StatsCollector_0_0/design_1_StatsCollector_0_0_stub.vhdl
-- Design      : design_1_StatsCollector_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_StatsCollector_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CMD_PresentSignal : in STD_LOGIC;
    CMD_SetNewStatsConfig : in STD_LOGIC;
    CMD_WriteFrameStatsAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_EnableEventTimestamps : in STD_LOGIC;
    CMD_WriteEventTimestampsAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_WriteEventTimestampOrders : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_CountTimestampsMemoryWrites : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_CountTimestampsOrdersMemoryWrites : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_StatsSaveComplete : out STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_StatsWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_en : out STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_WriteOrderNibblesFIFO_full : in STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_en : out STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_WriteOrderNibblesFIFO_empty : in STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_en : out STD_LOGIC;
    STAT_ResetWriteOrderNibblesFIFO : out STD_LOGIC;
    VBB_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    VSHADER_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesExecShaderCode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    IA_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesLoadingDataToCache : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesWaitingForTriWorkCache : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DINTERP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTERP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TEXSAMP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesWaitingCacheLoad : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ROP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesWaitingForMemoryRead : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CountCacheHits : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CountCacheMisses : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_ReadCyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_ReadCyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_WriteCyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_WriteCyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountNonScanoutBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountNonScanoutTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemWriteCountBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemWriteCountTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EventsWriteIsReady : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_EventsWriteIsReadyAck : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_CurrentWriteOrderNibbles : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_CurrentWriteData : out STD_LOGIC_VECTOR ( 293 downto 0 );
    DBG_CurrentWriteEn : out STD_LOGIC
  );

end design_1_StatsCollector_0_0;

architecture stub of design_1_StatsCollector_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,CMD_PresentSignal,CMD_SetNewStatsConfig,CMD_WriteFrameStatsAddress[29:0],CMD_EnableEventTimestamps,CMD_WriteEventTimestampsAddress[29:0],CMD_WriteEventTimestampOrders[29:0],CMD_CountTimestampsMemoryWrites[15:0],CMD_CountTimestampsOrdersMemoryWrites[15:0],CMD_StatsSaveComplete,MEM_StatsWriteRequestsFIFO_wr_data[293:0],MEM_StatsWriteRequestsFIFO_full,MEM_StatsWriteRequestsFIFO_wr_en,STAT_WriteOrderNibblesFIFO_wr_data[15:0],STAT_WriteOrderNibblesFIFO_full,STAT_WriteOrderNibblesFIFO_wr_en,STAT_WriteOrderNibblesFIFO_rd_data[15:0],STAT_WriteOrderNibblesFIFO_empty,STAT_WriteOrderNibblesFIFO_rd_en,STAT_ResetWriteOrderNibblesFIFO,VBB_CyclesIdle[31:0],VBB_CyclesSpentWorking[31:0],VBB_CyclesWaitingForOutput[31:0],VBB_CurrentDrawEventID[15:0],VSHADER_CyclesIdle[31:0],VSHADER_CyclesSpentWorking[31:0],VSHADER_CyclesExecShaderCode[31:0],VSHADER_CyclesWaitingForOutput[31:0],VSHADER_CurrentDrawEventID[15:0],IA_CyclesIdle[31:0],IA_CyclesSpentWorking[31:0],IA_CyclesLoadingDataToCache[31:0],IA_CyclesWaitingForOutput[31:0],IA_CurrentDrawEventID[15:0],CLIP_CyclesIdle[31:0],CLIP_CyclesSpentWorking[31:0],CLIP_CyclesWaitingForOutput[31:0],CLIP_CurrentDrawEventID[15:0],TRISETUP_CyclesIdle[31:0],TRISETUP_CyclesSpentWorking[31:0],TRISETUP_CyclesWaitingForOutput[31:0],TRISETUP_CurrentDrawEventID[15:0],RAST_CyclesIdle[31:0],RAST_CyclesSpentWorking[31:0],RAST_CyclesWaitingForOutput[31:0],RAST_CyclesWaitingForTriWorkCache[31:0],RAST_CurrentDrawEventID[15:0],DINTERP_CyclesIdle[31:0],DINTERP_CyclesSpentWorking[31:0],DINTERP_CyclesWaitingForOutput[31:0],DINTERP_CurrentDrawEventID[15:0],INTERP_CyclesIdle[31:0],INTERP_CyclesSpentWorking[31:0],INTERP_CyclesWaitingForOutput[31:0],INTERP_CurrentDrawEventID[15:0],TEXSAMP_CyclesIdle[31:0],TEXSAMP_CyclesSpentWorking[31:0],TEXSAMP_CyclesWaitingForOutput[31:0],TEXSAMP_CyclesWaitingCacheLoad[31:0],TEXSAMP_CurrentDrawEventID[15:0],ROP_CyclesIdle[31:0],ROP_CyclesSpentWorking[31:0],ROP_CyclesWaitingForOutput[31:0],ROP_CyclesWaitingForMemoryRead[31:0],ROP_CountCacheHits[31:0],ROP_CountCacheMisses[31:0],ROP_CurrentDrawEventID[15:0],CMD_CyclesIdle[31:0],CMD_CyclesSpentWorking[31:0],MEM_ReadCyclesIdle[31:0],MEM_ReadCyclesSpentWorking[31:0],MEM_WriteCyclesIdle[31:0],MEM_WriteCyclesSpentWorking[31:0],MEM_MemReadCountBytesTransferred[31:0],MEM_MemReadCountTransactions[31:0],MEM_MemReadCountNonScanoutBytesTransferred[31:0],MEM_MemReadCountNonScanoutTransactions[31:0],MEM_MemWriteCountBytesTransferred[31:0],MEM_MemWriteCountTransactions[31:0],DBG_CurrentState[4:0],DBG_EventsWriteIsReady[9:0],DBG_EventsWriteIsReadyAck[9:0],DBG_CurrentWriteOrderNibbles[15:0],DBG_CurrentWriteData[293:0],DBG_CurrentWriteEn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "StatsCollector,Vivado 2018.1_AR73068";
begin
end;
