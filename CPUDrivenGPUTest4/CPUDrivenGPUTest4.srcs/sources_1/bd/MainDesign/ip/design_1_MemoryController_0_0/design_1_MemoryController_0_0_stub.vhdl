-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:07:28 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_MemoryController_0_0/design_1_MemoryController_0_0_stub.vhdl
-- Design      : design_1_MemoryController_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_MemoryController_0_0 is
  Port ( 
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    M_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_ARLOCK : out STD_LOGIC;
    M_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_AWLOCK : out STD_LOGIC;
    M_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARID : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWID : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_RID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_RLAST : in STD_LOGIC;
    M_AXI_WLAST : out STD_LOGIC;
    c0_init_calib_complete : in STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ScanoutReadRequestsFIFO_empty : in STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_en : out STD_LOGIC;
    ScanoutReadResponsesFIFO_full : in STD_LOGIC;
    ScanoutReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ScanoutReadResponsesFIFO_wr_en : out STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ZStencilReadRequestsFIFO_empty : in STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_en : out STD_LOGIC;
    ZStencilReadResponsesFIFO_full : in STD_LOGIC;
    ZStencilReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ZStencilReadResponsesFIFO_wr_en : out STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ZStencilWriteRequestsFIFO_empty : in STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_en : out STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CommandProcReadRequestsFIFO_empty : in STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_en : out STD_LOGIC;
    CommandProcReadResponsesFIFO_full : in STD_LOGIC;
    CommandProcReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    CommandProcReadResponsesFIFO_wr_en : out STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    CommandProcWriteRequestsFIFO_empty : in STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_en : out STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBCacheReadRequestsFIFO_empty : in STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_en : out STD_LOGIC;
    VBCacheReadResponsesFIFO_full : in STD_LOGIC;
    VBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    VBCacheReadResponsesFIFO_wr_en : out STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCacheReadRequestsFIFO_empty : in STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_en : out STD_LOGIC;
    IBCacheReadResponsesFIFO_full : in STD_LOGIC;
    IBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCacheReadResponsesFIFO_wr_en : out STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    PacketDMAReadRequestsFIFO_empty : in STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_en : out STD_LOGIC;
    PacketDMAReadResponsesFIFO_full : in STD_LOGIC;
    PacketDMAReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    PacketDMAReadResponsesFIFO_wr_en : out STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    PacketDMAWriteRequestsFIFO_empty : in STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_en : out STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    TexFetchReadRequestsFIFO_empty : in STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_en : out STD_LOGIC;
    TexFetchReadResponsesFIFO_full : in STD_LOGIC;
    TexFetchReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    TexFetchReadResponsesFIFO_wr_en : out STD_LOGIC;
    ROPReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ROPReadRequestsFIFO_empty : in STD_LOGIC;
    ROPReadRequestsFIFO_rd_en : out STD_LOGIC;
    ROPReadResponsesFIFO_full : in STD_LOGIC;
    ROPReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ROPReadResponsesFIFO_wr_en : out STD_LOGIC;
    ROPWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ROPWriteRequestsFIFO_empty : in STD_LOGIC;
    ROPWriteRequestsFIFO_rd_en : out STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ClearBlockWriteRequestsFIFO_empty : in STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_en : out STD_LOGIC;
    StatsWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    StatsWriteRequestsFIFO_empty : in STD_LOGIC;
    StatsWriteRequestsFIFO_rd_en : out STD_LOGIC;
    CMD_MemoryControllerIsIdle : out STD_LOGIC;
    STAT_MemReadCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ReadControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_WriteControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ScanoutReadRequests_Empty : out STD_LOGIC;
    DBG_ScanoutReadResponses_Full : out STD_LOGIC;
    DBG_ScanoutReadRequests_rd_en : out STD_LOGIC;
    DBG_LastWriteAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastWriteData : out STD_LOGIC_VECTOR ( 255 downto 0 );
    DBG_LastWriteDataDWORDEnables : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_LastWriteMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastReadAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastReadMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ReadRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_WriteRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_ReadResponsesFullBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_MemoryController_0_0;

architecture stub of design_1_MemoryController_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "M_AXI_ACLK,M_AXI_ARESETN,M_AXI_AWADDR[29:0],M_AXI_AWPROT[2:0],M_AXI_AWVALID,M_AXI_AWREADY,M_AXI_WDATA[255:0],M_AXI_WSTRB[31:0],M_AXI_WVALID,M_AXI_WREADY,M_AXI_BRESP[1:0],M_AXI_BVALID,M_AXI_BREADY,M_AXI_ARADDR[29:0],M_AXI_ARPROT[2:0],M_AXI_ARVALID,M_AXI_ARREADY,M_AXI_RDATA[255:0],M_AXI_RRESP[1:0],M_AXI_RVALID,M_AXI_RREADY,M_AXI_ARBURST[1:0],M_AXI_ARCACHE[3:0],M_AXI_ARLEN[7:0],M_AXI_ARLOCK,M_AXI_ARSIZE[2:0],M_AXI_AWBURST[1:0],M_AXI_AWCACHE[3:0],M_AXI_AWLEN[7:0],M_AXI_AWLOCK,M_AXI_AWSIZE[2:0],M_AXI_ARID[3:0],M_AXI_AWID[3:0],M_AXI_RID[3:0],M_AXI_RLAST,M_AXI_WLAST,c0_init_calib_complete,ScanoutReadRequestsFIFO_rd_data[29:0],ScanoutReadRequestsFIFO_empty,ScanoutReadRequestsFIFO_rd_en,ScanoutReadResponsesFIFO_full,ScanoutReadResponsesFIFO_wr_data[255:0],ScanoutReadResponsesFIFO_wr_en,ZStencilReadRequestsFIFO_rd_data[29:0],ZStencilReadRequestsFIFO_empty,ZStencilReadRequestsFIFO_rd_en,ZStencilReadResponsesFIFO_full,ZStencilReadResponsesFIFO_wr_data[255:0],ZStencilReadResponsesFIFO_wr_en,ZStencilWriteRequestsFIFO_rd_data[293:0],ZStencilWriteRequestsFIFO_empty,ZStencilWriteRequestsFIFO_rd_en,CommandProcReadRequestsFIFO_rd_data[29:0],CommandProcReadRequestsFIFO_empty,CommandProcReadRequestsFIFO_rd_en,CommandProcReadResponsesFIFO_full,CommandProcReadResponsesFIFO_wr_data[255:0],CommandProcReadResponsesFIFO_wr_en,CommandProcWriteRequestsFIFO_rd_data[293:0],CommandProcWriteRequestsFIFO_empty,CommandProcWriteRequestsFIFO_rd_en,VBCacheReadRequestsFIFO_rd_data[29:0],VBCacheReadRequestsFIFO_empty,VBCacheReadRequestsFIFO_rd_en,VBCacheReadResponsesFIFO_full,VBCacheReadResponsesFIFO_wr_data[255:0],VBCacheReadResponsesFIFO_wr_en,IBCacheReadRequestsFIFO_rd_data[29:0],IBCacheReadRequestsFIFO_empty,IBCacheReadRequestsFIFO_rd_en,IBCacheReadResponsesFIFO_full,IBCacheReadResponsesFIFO_wr_data[255:0],IBCacheReadResponsesFIFO_wr_en,PacketDMAReadRequestsFIFO_rd_data[29:0],PacketDMAReadRequestsFIFO_empty,PacketDMAReadRequestsFIFO_rd_en,PacketDMAReadResponsesFIFO_full,PacketDMAReadResponsesFIFO_wr_data[255:0],PacketDMAReadResponsesFIFO_wr_en,PacketDMAWriteRequestsFIFO_rd_data[293:0],PacketDMAWriteRequestsFIFO_empty,PacketDMAWriteRequestsFIFO_rd_en,TexFetchReadRequestsFIFO_rd_data[29:0],TexFetchReadRequestsFIFO_empty,TexFetchReadRequestsFIFO_rd_en,TexFetchReadResponsesFIFO_full,TexFetchReadResponsesFIFO_wr_data[255:0],TexFetchReadResponsesFIFO_wr_en,ROPReadRequestsFIFO_rd_data[29:0],ROPReadRequestsFIFO_empty,ROPReadRequestsFIFO_rd_en,ROPReadResponsesFIFO_full,ROPReadResponsesFIFO_wr_data[255:0],ROPReadResponsesFIFO_wr_en,ROPWriteRequestsFIFO_rd_data[293:0],ROPWriteRequestsFIFO_empty,ROPWriteRequestsFIFO_rd_en,ClearBlockWriteRequestsFIFO_rd_data[293:0],ClearBlockWriteRequestsFIFO_empty,ClearBlockWriteRequestsFIFO_rd_en,StatsWriteRequestsFIFO_rd_data[293:0],StatsWriteRequestsFIFO_empty,StatsWriteRequestsFIFO_rd_en,CMD_MemoryControllerIsIdle,STAT_MemReadCyclesIdle[31:0],STAT_MemReadCyclesSpentWorking[31:0],STAT_MemWriteCyclesIdle[31:0],STAT_MemWriteCyclesSpentWorking[31:0],STAT_MemReadCountBytesTransferred[31:0],STAT_MemReadCountTransactions[31:0],STAT_MemReadCountNonScanoutBytesTransferred[31:0],STAT_MemReadCountNonScanoutTransactions[31:0],STAT_MemWriteCountBytesTransferred[31:0],STAT_MemWriteCountTransactions[31:0],DBG_ReadControlState[3:0],DBG_WriteControlState[3:0],DBG_ScanoutReadRequests_Empty,DBG_ScanoutReadResponses_Full,DBG_ScanoutReadRequests_rd_en,DBG_LastWriteAddress[29:0],DBG_LastWriteData[255:0],DBG_LastWriteDataDWORDEnables[7:0],DBG_LastWriteMemoryClientIndex[3:0],DBG_LastReadAddress[29:0],DBG_LastReadMemoryClientIndex[3:0],DBG_ReadRequestsEmptyBitmask[7:0],DBG_WriteRequestsEmptyBitmask[5:0],DBG_ReadResponsesFullBitmask[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "MemoryController,Vivado 2018.1_AR73068";
begin
end;
