// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:07:28 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_MemoryController_0_0/design_1_MemoryController_0_0_stub.v
// Design      : design_1_MemoryController_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "MemoryController,Vivado 2018.1_AR73068" *)
module design_1_MemoryController_0_0(M_AXI_ACLK, M_AXI_ARESETN, M_AXI_AWADDR, 
  M_AXI_AWPROT, M_AXI_AWVALID, M_AXI_AWREADY, M_AXI_WDATA, M_AXI_WSTRB, M_AXI_WVALID, 
  M_AXI_WREADY, M_AXI_BRESP, M_AXI_BVALID, M_AXI_BREADY, M_AXI_ARADDR, M_AXI_ARPROT, 
  M_AXI_ARVALID, M_AXI_ARREADY, M_AXI_RDATA, M_AXI_RRESP, M_AXI_RVALID, M_AXI_RREADY, 
  M_AXI_ARBURST, M_AXI_ARCACHE, M_AXI_ARLEN, M_AXI_ARLOCK, M_AXI_ARSIZE, M_AXI_AWBURST, 
  M_AXI_AWCACHE, M_AXI_AWLEN, M_AXI_AWLOCK, M_AXI_AWSIZE, M_AXI_ARID, M_AXI_AWID, M_AXI_RID, 
  M_AXI_RLAST, M_AXI_WLAST, c0_init_calib_complete, ScanoutReadRequestsFIFO_rd_data, 
  ScanoutReadRequestsFIFO_empty, ScanoutReadRequestsFIFO_rd_en, 
  ScanoutReadResponsesFIFO_full, ScanoutReadResponsesFIFO_wr_data, 
  ScanoutReadResponsesFIFO_wr_en, ZStencilReadRequestsFIFO_rd_data, 
  ZStencilReadRequestsFIFO_empty, ZStencilReadRequestsFIFO_rd_en, 
  ZStencilReadResponsesFIFO_full, ZStencilReadResponsesFIFO_wr_data, 
  ZStencilReadResponsesFIFO_wr_en, ZStencilWriteRequestsFIFO_rd_data, 
  ZStencilWriteRequestsFIFO_empty, ZStencilWriteRequestsFIFO_rd_en, 
  CommandProcReadRequestsFIFO_rd_data, CommandProcReadRequestsFIFO_empty, 
  CommandProcReadRequestsFIFO_rd_en, CommandProcReadResponsesFIFO_full, 
  CommandProcReadResponsesFIFO_wr_data, CommandProcReadResponsesFIFO_wr_en, 
  CommandProcWriteRequestsFIFO_rd_data, CommandProcWriteRequestsFIFO_empty, 
  CommandProcWriteRequestsFIFO_rd_en, VBCacheReadRequestsFIFO_rd_data, 
  VBCacheReadRequestsFIFO_empty, VBCacheReadRequestsFIFO_rd_en, 
  VBCacheReadResponsesFIFO_full, VBCacheReadResponsesFIFO_wr_data, 
  VBCacheReadResponsesFIFO_wr_en, IBCacheReadRequestsFIFO_rd_data, 
  IBCacheReadRequestsFIFO_empty, IBCacheReadRequestsFIFO_rd_en, 
  IBCacheReadResponsesFIFO_full, IBCacheReadResponsesFIFO_wr_data, 
  IBCacheReadResponsesFIFO_wr_en, PacketDMAReadRequestsFIFO_rd_data, 
  PacketDMAReadRequestsFIFO_empty, PacketDMAReadRequestsFIFO_rd_en, 
  PacketDMAReadResponsesFIFO_full, PacketDMAReadResponsesFIFO_wr_data, 
  PacketDMAReadResponsesFIFO_wr_en, PacketDMAWriteRequestsFIFO_rd_data, 
  PacketDMAWriteRequestsFIFO_empty, PacketDMAWriteRequestsFIFO_rd_en, 
  TexFetchReadRequestsFIFO_rd_data, TexFetchReadRequestsFIFO_empty, 
  TexFetchReadRequestsFIFO_rd_en, TexFetchReadResponsesFIFO_full, 
  TexFetchReadResponsesFIFO_wr_data, TexFetchReadResponsesFIFO_wr_en, 
  ROPReadRequestsFIFO_rd_data, ROPReadRequestsFIFO_empty, ROPReadRequestsFIFO_rd_en, 
  ROPReadResponsesFIFO_full, ROPReadResponsesFIFO_wr_data, ROPReadResponsesFIFO_wr_en, 
  ROPWriteRequestsFIFO_rd_data, ROPWriteRequestsFIFO_empty, ROPWriteRequestsFIFO_rd_en, 
  ClearBlockWriteRequestsFIFO_rd_data, ClearBlockWriteRequestsFIFO_empty, 
  ClearBlockWriteRequestsFIFO_rd_en, StatsWriteRequestsFIFO_rd_data, 
  StatsWriteRequestsFIFO_empty, StatsWriteRequestsFIFO_rd_en, 
  CMD_MemoryControllerIsIdle, STAT_MemReadCyclesIdle, STAT_MemReadCyclesSpentWorking, 
  STAT_MemWriteCyclesIdle, STAT_MemWriteCyclesSpentWorking, 
  STAT_MemReadCountBytesTransferred, STAT_MemReadCountTransactions, 
  STAT_MemReadCountNonScanoutBytesTransferred, 
  STAT_MemReadCountNonScanoutTransactions, STAT_MemWriteCountBytesTransferred, 
  STAT_MemWriteCountTransactions, DBG_ReadControlState, DBG_WriteControlState, 
  DBG_ScanoutReadRequests_Empty, DBG_ScanoutReadResponses_Full, 
  DBG_ScanoutReadRequests_rd_en, DBG_LastWriteAddress, DBG_LastWriteData, 
  DBG_LastWriteDataDWORDEnables, DBG_LastWriteMemoryClientIndex, DBG_LastReadAddress, 
  DBG_LastReadMemoryClientIndex, DBG_ReadRequestsEmptyBitmask, 
  DBG_WriteRequestsEmptyBitmask, DBG_ReadResponsesFullBitmask)
/* synthesis syn_black_box black_box_pad_pin="M_AXI_ACLK,M_AXI_ARESETN,M_AXI_AWADDR[29:0],M_AXI_AWPROT[2:0],M_AXI_AWVALID,M_AXI_AWREADY,M_AXI_WDATA[255:0],M_AXI_WSTRB[31:0],M_AXI_WVALID,M_AXI_WREADY,M_AXI_BRESP[1:0],M_AXI_BVALID,M_AXI_BREADY,M_AXI_ARADDR[29:0],M_AXI_ARPROT[2:0],M_AXI_ARVALID,M_AXI_ARREADY,M_AXI_RDATA[255:0],M_AXI_RRESP[1:0],M_AXI_RVALID,M_AXI_RREADY,M_AXI_ARBURST[1:0],M_AXI_ARCACHE[3:0],M_AXI_ARLEN[7:0],M_AXI_ARLOCK,M_AXI_ARSIZE[2:0],M_AXI_AWBURST[1:0],M_AXI_AWCACHE[3:0],M_AXI_AWLEN[7:0],M_AXI_AWLOCK,M_AXI_AWSIZE[2:0],M_AXI_ARID[3:0],M_AXI_AWID[3:0],M_AXI_RID[3:0],M_AXI_RLAST,M_AXI_WLAST,c0_init_calib_complete,ScanoutReadRequestsFIFO_rd_data[29:0],ScanoutReadRequestsFIFO_empty,ScanoutReadRequestsFIFO_rd_en,ScanoutReadResponsesFIFO_full,ScanoutReadResponsesFIFO_wr_data[255:0],ScanoutReadResponsesFIFO_wr_en,ZStencilReadRequestsFIFO_rd_data[29:0],ZStencilReadRequestsFIFO_empty,ZStencilReadRequestsFIFO_rd_en,ZStencilReadResponsesFIFO_full,ZStencilReadResponsesFIFO_wr_data[255:0],ZStencilReadResponsesFIFO_wr_en,ZStencilWriteRequestsFIFO_rd_data[293:0],ZStencilWriteRequestsFIFO_empty,ZStencilWriteRequestsFIFO_rd_en,CommandProcReadRequestsFIFO_rd_data[29:0],CommandProcReadRequestsFIFO_empty,CommandProcReadRequestsFIFO_rd_en,CommandProcReadResponsesFIFO_full,CommandProcReadResponsesFIFO_wr_data[255:0],CommandProcReadResponsesFIFO_wr_en,CommandProcWriteRequestsFIFO_rd_data[293:0],CommandProcWriteRequestsFIFO_empty,CommandProcWriteRequestsFIFO_rd_en,VBCacheReadRequestsFIFO_rd_data[29:0],VBCacheReadRequestsFIFO_empty,VBCacheReadRequestsFIFO_rd_en,VBCacheReadResponsesFIFO_full,VBCacheReadResponsesFIFO_wr_data[255:0],VBCacheReadResponsesFIFO_wr_en,IBCacheReadRequestsFIFO_rd_data[29:0],IBCacheReadRequestsFIFO_empty,IBCacheReadRequestsFIFO_rd_en,IBCacheReadResponsesFIFO_full,IBCacheReadResponsesFIFO_wr_data[255:0],IBCacheReadResponsesFIFO_wr_en,PacketDMAReadRequestsFIFO_rd_data[29:0],PacketDMAReadRequestsFIFO_empty,PacketDMAReadRequestsFIFO_rd_en,PacketDMAReadResponsesFIFO_full,PacketDMAReadResponsesFIFO_wr_data[255:0],PacketDMAReadResponsesFIFO_wr_en,PacketDMAWriteRequestsFIFO_rd_data[293:0],PacketDMAWriteRequestsFIFO_empty,PacketDMAWriteRequestsFIFO_rd_en,TexFetchReadRequestsFIFO_rd_data[29:0],TexFetchReadRequestsFIFO_empty,TexFetchReadRequestsFIFO_rd_en,TexFetchReadResponsesFIFO_full,TexFetchReadResponsesFIFO_wr_data[255:0],TexFetchReadResponsesFIFO_wr_en,ROPReadRequestsFIFO_rd_data[29:0],ROPReadRequestsFIFO_empty,ROPReadRequestsFIFO_rd_en,ROPReadResponsesFIFO_full,ROPReadResponsesFIFO_wr_data[255:0],ROPReadResponsesFIFO_wr_en,ROPWriteRequestsFIFO_rd_data[293:0],ROPWriteRequestsFIFO_empty,ROPWriteRequestsFIFO_rd_en,ClearBlockWriteRequestsFIFO_rd_data[293:0],ClearBlockWriteRequestsFIFO_empty,ClearBlockWriteRequestsFIFO_rd_en,StatsWriteRequestsFIFO_rd_data[293:0],StatsWriteRequestsFIFO_empty,StatsWriteRequestsFIFO_rd_en,CMD_MemoryControllerIsIdle,STAT_MemReadCyclesIdle[31:0],STAT_MemReadCyclesSpentWorking[31:0],STAT_MemWriteCyclesIdle[31:0],STAT_MemWriteCyclesSpentWorking[31:0],STAT_MemReadCountBytesTransferred[31:0],STAT_MemReadCountTransactions[31:0],STAT_MemReadCountNonScanoutBytesTransferred[31:0],STAT_MemReadCountNonScanoutTransactions[31:0],STAT_MemWriteCountBytesTransferred[31:0],STAT_MemWriteCountTransactions[31:0],DBG_ReadControlState[3:0],DBG_WriteControlState[3:0],DBG_ScanoutReadRequests_Empty,DBG_ScanoutReadResponses_Full,DBG_ScanoutReadRequests_rd_en,DBG_LastWriteAddress[29:0],DBG_LastWriteData[255:0],DBG_LastWriteDataDWORDEnables[7:0],DBG_LastWriteMemoryClientIndex[3:0],DBG_LastReadAddress[29:0],DBG_LastReadMemoryClientIndex[3:0],DBG_ReadRequestsEmptyBitmask[7:0],DBG_WriteRequestsEmptyBitmask[5:0],DBG_ReadResponsesFullBitmask[7:0]" */;
  input M_AXI_ACLK;
  input M_AXI_ARESETN;
  output [29:0]M_AXI_AWADDR;
  output [2:0]M_AXI_AWPROT;
  output M_AXI_AWVALID;
  input M_AXI_AWREADY;
  output [255:0]M_AXI_WDATA;
  output [31:0]M_AXI_WSTRB;
  output M_AXI_WVALID;
  input M_AXI_WREADY;
  input [1:0]M_AXI_BRESP;
  input M_AXI_BVALID;
  output M_AXI_BREADY;
  output [29:0]M_AXI_ARADDR;
  output [2:0]M_AXI_ARPROT;
  output M_AXI_ARVALID;
  input M_AXI_ARREADY;
  input [255:0]M_AXI_RDATA;
  input [1:0]M_AXI_RRESP;
  input M_AXI_RVALID;
  output M_AXI_RREADY;
  output [1:0]M_AXI_ARBURST;
  output [3:0]M_AXI_ARCACHE;
  output [7:0]M_AXI_ARLEN;
  output M_AXI_ARLOCK;
  output [2:0]M_AXI_ARSIZE;
  output [1:0]M_AXI_AWBURST;
  output [3:0]M_AXI_AWCACHE;
  output [7:0]M_AXI_AWLEN;
  output M_AXI_AWLOCK;
  output [2:0]M_AXI_AWSIZE;
  output [3:0]M_AXI_ARID;
  output [3:0]M_AXI_AWID;
  input [3:0]M_AXI_RID;
  input M_AXI_RLAST;
  output M_AXI_WLAST;
  input c0_init_calib_complete;
  input [29:0]ScanoutReadRequestsFIFO_rd_data;
  input ScanoutReadRequestsFIFO_empty;
  output ScanoutReadRequestsFIFO_rd_en;
  input ScanoutReadResponsesFIFO_full;
  output [255:0]ScanoutReadResponsesFIFO_wr_data;
  output ScanoutReadResponsesFIFO_wr_en;
  input [29:0]ZStencilReadRequestsFIFO_rd_data;
  input ZStencilReadRequestsFIFO_empty;
  output ZStencilReadRequestsFIFO_rd_en;
  input ZStencilReadResponsesFIFO_full;
  output [255:0]ZStencilReadResponsesFIFO_wr_data;
  output ZStencilReadResponsesFIFO_wr_en;
  input [293:0]ZStencilWriteRequestsFIFO_rd_data;
  input ZStencilWriteRequestsFIFO_empty;
  output ZStencilWriteRequestsFIFO_rd_en;
  input [29:0]CommandProcReadRequestsFIFO_rd_data;
  input CommandProcReadRequestsFIFO_empty;
  output CommandProcReadRequestsFIFO_rd_en;
  input CommandProcReadResponsesFIFO_full;
  output [255:0]CommandProcReadResponsesFIFO_wr_data;
  output CommandProcReadResponsesFIFO_wr_en;
  input [293:0]CommandProcWriteRequestsFIFO_rd_data;
  input CommandProcWriteRequestsFIFO_empty;
  output CommandProcWriteRequestsFIFO_rd_en;
  input [29:0]VBCacheReadRequestsFIFO_rd_data;
  input VBCacheReadRequestsFIFO_empty;
  output VBCacheReadRequestsFIFO_rd_en;
  input VBCacheReadResponsesFIFO_full;
  output [255:0]VBCacheReadResponsesFIFO_wr_data;
  output VBCacheReadResponsesFIFO_wr_en;
  input [29:0]IBCacheReadRequestsFIFO_rd_data;
  input IBCacheReadRequestsFIFO_empty;
  output IBCacheReadRequestsFIFO_rd_en;
  input IBCacheReadResponsesFIFO_full;
  output [255:0]IBCacheReadResponsesFIFO_wr_data;
  output IBCacheReadResponsesFIFO_wr_en;
  input [29:0]PacketDMAReadRequestsFIFO_rd_data;
  input PacketDMAReadRequestsFIFO_empty;
  output PacketDMAReadRequestsFIFO_rd_en;
  input PacketDMAReadResponsesFIFO_full;
  output [255:0]PacketDMAReadResponsesFIFO_wr_data;
  output PacketDMAReadResponsesFIFO_wr_en;
  input [293:0]PacketDMAWriteRequestsFIFO_rd_data;
  input PacketDMAWriteRequestsFIFO_empty;
  output PacketDMAWriteRequestsFIFO_rd_en;
  input [29:0]TexFetchReadRequestsFIFO_rd_data;
  input TexFetchReadRequestsFIFO_empty;
  output TexFetchReadRequestsFIFO_rd_en;
  input TexFetchReadResponsesFIFO_full;
  output [255:0]TexFetchReadResponsesFIFO_wr_data;
  output TexFetchReadResponsesFIFO_wr_en;
  input [29:0]ROPReadRequestsFIFO_rd_data;
  input ROPReadRequestsFIFO_empty;
  output ROPReadRequestsFIFO_rd_en;
  input ROPReadResponsesFIFO_full;
  output [255:0]ROPReadResponsesFIFO_wr_data;
  output ROPReadResponsesFIFO_wr_en;
  input [293:0]ROPWriteRequestsFIFO_rd_data;
  input ROPWriteRequestsFIFO_empty;
  output ROPWriteRequestsFIFO_rd_en;
  input [293:0]ClearBlockWriteRequestsFIFO_rd_data;
  input ClearBlockWriteRequestsFIFO_empty;
  output ClearBlockWriteRequestsFIFO_rd_en;
  input [293:0]StatsWriteRequestsFIFO_rd_data;
  input StatsWriteRequestsFIFO_empty;
  output StatsWriteRequestsFIFO_rd_en;
  output CMD_MemoryControllerIsIdle;
  output [31:0]STAT_MemReadCyclesIdle;
  output [31:0]STAT_MemReadCyclesSpentWorking;
  output [31:0]STAT_MemWriteCyclesIdle;
  output [31:0]STAT_MemWriteCyclesSpentWorking;
  output [31:0]STAT_MemReadCountBytesTransferred;
  output [31:0]STAT_MemReadCountTransactions;
  output [31:0]STAT_MemReadCountNonScanoutBytesTransferred;
  output [31:0]STAT_MemReadCountNonScanoutTransactions;
  output [31:0]STAT_MemWriteCountBytesTransferred;
  output [31:0]STAT_MemWriteCountTransactions;
  output [3:0]DBG_ReadControlState;
  output [3:0]DBG_WriteControlState;
  output DBG_ScanoutReadRequests_Empty;
  output DBG_ScanoutReadResponses_Full;
  output DBG_ScanoutReadRequests_rd_en;
  output [29:0]DBG_LastWriteAddress;
  output [255:0]DBG_LastWriteData;
  output [7:0]DBG_LastWriteDataDWORDEnables;
  output [3:0]DBG_LastWriteMemoryClientIndex;
  output [29:0]DBG_LastReadAddress;
  output [3:0]DBG_LastReadMemoryClientIndex;
  output [7:0]DBG_ReadRequestsEmptyBitmask;
  output [5:0]DBG_WriteRequestsEmptyBitmask;
  output [7:0]DBG_ReadResponsesFullBitmask;
endmodule
