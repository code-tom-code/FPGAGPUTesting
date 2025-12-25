-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:04:43 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StatsCollector_0_0/MainDesign_StatsCollector_0_0_stub.vhdl
-- Design      : MainDesign_StatsCollector_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_StatsCollector_0_0 is
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
    STAT_WriteOrderNibblesFIFO_almost_empty : in STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_en : out STD_LOGIC;
    STAT_ResetWriteOrderNibblesFIFO : out STD_LOGIC;
    SAMP_SamplingIntervalCycles : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SAMP_CurrentWriteIndex : in STD_LOGIC_VECTOR ( 9 downto 0 );
    SAMP_Reset : out STD_LOGIC;
    SAMP_cache_addrb : out STD_LOGIC_VECTOR ( 9 downto 0 );
    SAMP_cache_doutb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SAMP_cache_enb : out STD_LOGIC;
    SAMP_cache_clk : out STD_LOGIC;
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StatsCollector_0_0 : entity is "MainDesign_StatsCollector_0_0,StatsCollector,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_StatsCollector_0_0 : entity is "MainDesign_StatsCollector_0_0,StatsCollector,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StatsCollector,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StatsCollector_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StatsCollector_0_0 : entity is "module_ref";
end MainDesign_StatsCollector_0_0;

architecture stub of MainDesign_StatsCollector_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_PresentSignal,CMD_SetNewStatsConfig,CMD_WriteFrameStatsAddress[29:0],CMD_EnableEventTimestamps,CMD_WriteEventTimestampsAddress[29:0],CMD_WriteEventTimestampOrders[29:0],CMD_CountTimestampsMemoryWrites[15:0],CMD_CountTimestampsOrdersMemoryWrites[15:0],CMD_StatsSaveComplete,MEM_StatsWriteRequestsFIFO_wr_data[293:0],MEM_StatsWriteRequestsFIFO_full,MEM_StatsWriteRequestsFIFO_wr_en,STAT_WriteOrderNibblesFIFO_wr_data[15:0],STAT_WriteOrderNibblesFIFO_full,STAT_WriteOrderNibblesFIFO_wr_en,STAT_WriteOrderNibblesFIFO_rd_data[15:0],STAT_WriteOrderNibblesFIFO_empty,STAT_WriteOrderNibblesFIFO_almost_empty,STAT_WriteOrderNibblesFIFO_rd_en,STAT_ResetWriteOrderNibblesFIFO,SAMP_SamplingIntervalCycles[31:0],SAMP_CurrentWriteIndex[9:0],SAMP_Reset,SAMP_cache_addrb[9:0],SAMP_cache_doutb[31:0],SAMP_cache_enb,SAMP_cache_clk,VBB_CyclesIdle[31:0],VBB_CyclesSpentWorking[31:0],VBB_CyclesWaitingForOutput[31:0],VBB_CurrentDrawEventID[15:0],VSHADER_CyclesIdle[31:0],VSHADER_CyclesSpentWorking[31:0],VSHADER_CyclesExecShaderCode[31:0],VSHADER_CyclesWaitingForOutput[31:0],VSHADER_CurrentDrawEventID[15:0],IA_CyclesIdle[31:0],IA_CyclesSpentWorking[31:0],IA_CyclesLoadingDataToCache[31:0],IA_CyclesWaitingForOutput[31:0],IA_CurrentDrawEventID[15:0],CLIP_CyclesIdle[31:0],CLIP_CyclesSpentWorking[31:0],CLIP_CyclesWaitingForOutput[31:0],CLIP_CurrentDrawEventID[15:0],TRISETUP_CyclesIdle[31:0],TRISETUP_CyclesSpentWorking[31:0],TRISETUP_CyclesWaitingForOutput[31:0],TRISETUP_CurrentDrawEventID[15:0],RAST_CyclesIdle[31:0],RAST_CyclesSpentWorking[31:0],RAST_CyclesWaitingForOutput[31:0],RAST_CyclesWaitingForTriWorkCache[31:0],RAST_CurrentDrawEventID[15:0],DINTERP_CyclesIdle[31:0],DINTERP_CyclesSpentWorking[31:0],DINTERP_CyclesWaitingForOutput[31:0],DINTERP_CurrentDrawEventID[15:0],INTERP_CyclesIdle[31:0],INTERP_CyclesSpentWorking[31:0],INTERP_CyclesWaitingForOutput[31:0],INTERP_CurrentDrawEventID[15:0],TEXSAMP_CyclesIdle[31:0],TEXSAMP_CyclesSpentWorking[31:0],TEXSAMP_CyclesWaitingForOutput[31:0],TEXSAMP_CyclesWaitingCacheLoad[31:0],TEXSAMP_CurrentDrawEventID[15:0],ROP_CyclesIdle[31:0],ROP_CyclesSpentWorking[31:0],ROP_CyclesWaitingForOutput[31:0],ROP_CyclesWaitingForMemoryRead[31:0],ROP_CountCacheHits[31:0],ROP_CountCacheMisses[31:0],ROP_CurrentDrawEventID[15:0],CMD_CyclesIdle[31:0],CMD_CyclesSpentWorking[31:0],MEM_ReadCyclesIdle[31:0],MEM_ReadCyclesSpentWorking[31:0],MEM_WriteCyclesIdle[31:0],MEM_WriteCyclesSpentWorking[31:0],MEM_MemReadCountBytesTransferred[31:0],MEM_MemReadCountTransactions[31:0],MEM_MemReadCountNonScanoutBytesTransferred[31:0],MEM_MemReadCountNonScanoutTransactions[31:0],MEM_MemWriteCountBytesTransferred[31:0],MEM_MemWriteCountTransactions[31:0],DBG_CurrentState[4:0],DBG_EventsWriteIsReady[9:0],DBG_EventsWriteIsReadyAck[9:0],DBG_CurrentWriteOrderNibbles[15:0],DBG_CurrentWriteData[293:0],DBG_CurrentWriteEn";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF StatsWriteRequestsFIFO:StatsWriteOrderNibblesFIFO_WR:StatsWriteOrderNibblesFIFO_RD:SamplerCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of MEM_StatsWriteRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_StatsWriteRequestsFIFO_wr_data : signal is "master StatsWriteRequestsFIFO";
  attribute x_interface_info of MEM_StatsWriteRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO FULL";
  attribute x_interface_info of MEM_StatsWriteRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_EN";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_DATA";
  attribute x_interface_mode of STAT_WriteOrderNibblesFIFO_wr_data : signal is "master StatsWriteOrderNibblesFIFO_WR";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR FULL";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_EN";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_DATA";
  attribute x_interface_mode of STAT_WriteOrderNibblesFIFO_rd_data : signal is "master StatsWriteOrderNibblesFIFO_RD";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD EMPTY";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD ALMOST_EMPTY";
  attribute x_interface_info of STAT_WriteOrderNibblesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_EN";
  attribute x_interface_info of STAT_ResetWriteOrderNibblesFIFO : signal is "xilinx.com:signal:reset:1.0 STAT_ResetWriteOrderNibblesFIFO RST";
  attribute x_interface_mode of STAT_ResetWriteOrderNibblesFIFO : signal is "master STAT_ResetWriteOrderNibblesFIFO";
  attribute x_interface_parameter of STAT_ResetWriteOrderNibblesFIFO : signal is "XIL_INTERFACENAME STAT_ResetWriteOrderNibblesFIFO, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of SAMP_Reset : signal is "xilinx.com:signal:reset:1.0 SAMP_Reset RST";
  attribute x_interface_mode of SAMP_Reset : signal is "master SAMP_Reset";
  attribute x_interface_parameter of SAMP_Reset : signal is "XIL_INTERFACENAME SAMP_Reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of SAMP_cache_addrb : signal is "xilinx.com:interface:bram:1.0 SamplerCache ADDR";
  attribute x_interface_mode of SAMP_cache_addrb : signal is "master SamplerCache";
  attribute x_interface_parameter of SAMP_cache_addrb : signal is "XIL_INTERFACENAME SamplerCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of SAMP_cache_doutb : signal is "xilinx.com:interface:bram:1.0 SamplerCache DOUT";
  attribute x_interface_info of SAMP_cache_enb : signal is "xilinx.com:interface:bram:1.0 SamplerCache EN";
  attribute x_interface_info of SAMP_cache_clk : signal is "xilinx.com:interface:bram:1.0 SamplerCache CLK";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "StatsCollector,Vivado 2025.2";
begin
end;
