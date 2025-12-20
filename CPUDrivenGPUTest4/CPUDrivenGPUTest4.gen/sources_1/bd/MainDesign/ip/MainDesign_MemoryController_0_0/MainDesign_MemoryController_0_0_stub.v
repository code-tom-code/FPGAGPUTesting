// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:29 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_MemoryController_0_0/MainDesign_MemoryController_0_0_stub.v
// Design      : MainDesign_MemoryController_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_MemoryController_0_0,MemoryController,{}" *) (* core_generation_info = "MainDesign_MemoryController_0_0,MemoryController,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=MemoryController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_M_START_DATA_VALUE=0x00000000,C_M_TARGET_SLAVE_BASE_ADDR=0x00000000,C_M_AXI_ADDR_WIDTH=30,C_M_AXI_DATA_WIDTH=256}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "MemoryController,Vivado 2025.2" *) 
module MainDesign_MemoryController_0_0(M_AXI_ACLK, M_AXI_ARESETN, M_AXI_AWADDR, 
  M_AXI_AWPROT, M_AXI_AWVALID, M_AXI_AWREADY, M_AXI_WDATA, M_AXI_WSTRB, M_AXI_WVALID, 
  M_AXI_WREADY, M_AXI_BRESP, M_AXI_BVALID, M_AXI_BREADY, M_AXI_ARADDR, M_AXI_ARPROT, 
  M_AXI_ARVALID, M_AXI_ARREADY, M_AXI_RDATA, M_AXI_RRESP, M_AXI_RVALID, M_AXI_RREADY, 
  M_AXI_ARBURST, M_AXI_ARCACHE, M_AXI_ARLEN, M_AXI_ARLOCK, M_AXI_ARSIZE, M_AXI_AWBURST, 
  M_AXI_AWCACHE, M_AXI_AWLEN, M_AXI_AWLOCK, M_AXI_AWSIZE, M_AXI_ARID, M_AXI_AWID, M_AXI_RID, 
  M_AXI_RLAST, M_AXI_WLAST, c0_init_calib_complete, ScanoutReadRequestsFIFO_rd_data, 
  ScanoutReadRequestsFIFO_empty, ScanoutReadRequestsFIFO_almost_empty, 
  ScanoutReadRequestsFIFO_rd_en, ScanoutReadResponsesFIFO_full, 
  ScanoutReadResponsesFIFO_wr_data, ScanoutReadResponsesFIFO_wr_en, 
  ZStencilReadRequestsFIFO_rd_data, ZStencilReadRequestsFIFO_empty, 
  ZStencilReadRequestsFIFO_almost_empty, ZStencilReadRequestsFIFO_rd_en, 
  ZStencilReadResponsesFIFO_full, ZStencilReadResponsesFIFO_wr_data, 
  ZStencilReadResponsesFIFO_wr_en, ZStencilWriteRequestsFIFO_rd_data, 
  ZStencilWriteRequestsFIFO_empty, ZStencilWriteRequestsFIFO_almost_empty, 
  ZStencilWriteRequestsFIFO_rd_en, CommandProcReadRequestsFIFO_rd_data, 
  CommandProcReadRequestsFIFO_empty, CommandProcReadRequestsFIFO_almost_empty, 
  CommandProcReadRequestsFIFO_rd_en, CommandProcReadResponsesFIFO_full, 
  CommandProcReadResponsesFIFO_wr_data, CommandProcReadResponsesFIFO_wr_en, 
  CommandProcWriteRequestsFIFO_rd_data, CommandProcWriteRequestsFIFO_empty, 
  CommandProcWriteRequestsFIFO_almost_empty, CommandProcWriteRequestsFIFO_rd_en, 
  VBCacheReadRequestsFIFO_rd_data, VBCacheReadRequestsFIFO_empty, 
  VBCacheReadRequestsFIFO_almost_empty, VBCacheReadRequestsFIFO_rd_en, 
  VBCacheReadResponsesFIFO_full, VBCacheReadResponsesFIFO_wr_data, 
  VBCacheReadResponsesFIFO_wr_en, IBCacheReadRequestsFIFO_rd_data, 
  IBCacheReadRequestsFIFO_empty, IBCacheReadRequestsFIFO_almost_empty, 
  IBCacheReadRequestsFIFO_rd_en, IBCacheReadResponsesFIFO_full, 
  IBCacheReadResponsesFIFO_wr_data, IBCacheReadResponsesFIFO_wr_en, 
  PacketDMAReadRequestsFIFO_rd_data, PacketDMAReadRequestsFIFO_empty, 
  PacketDMAReadRequestsFIFO_almost_empty, PacketDMAReadRequestsFIFO_rd_en, 
  PacketDMAReadResponsesFIFO_full, PacketDMAReadResponsesFIFO_wr_data, 
  PacketDMAReadResponsesFIFO_wr_en, PacketDMAWriteRequestsFIFO_rd_data, 
  PacketDMAWriteRequestsFIFO_empty, PacketDMAWriteRequestsFIFO_almost_empty, 
  PacketDMAWriteRequestsFIFO_rd_en, TexFetchReadRequestsFIFO_rd_data, 
  TexFetchReadRequestsFIFO_empty, TexFetchReadRequestsFIFO_almost_empty, 
  TexFetchReadRequestsFIFO_rd_en, TexFetchReadResponsesFIFO_full, 
  TexFetchReadResponsesFIFO_wr_data, TexFetchReadResponsesFIFO_wr_en, 
  ROPReadRequestsFIFO_rd_data, ROPReadRequestsFIFO_empty, 
  ROPReadRequestsFIFO_almost_empty, ROPReadRequestsFIFO_rd_en, 
  ROPReadResponsesFIFO_full, ROPReadResponsesFIFO_wr_data, ROPReadResponsesFIFO_wr_en, 
  ROPWriteRequestsFIFO_rd_data, ROPWriteRequestsFIFO_empty, 
  ROPWriteRequestsFIFO_almost_empty, ROPWriteRequestsFIFO_rd_en, 
  ClearBlockWriteRequestsFIFO_rd_data, ClearBlockWriteRequestsFIFO_empty, 
  ClearBlockWriteRequestsFIFO_almost_empty, ClearBlockWriteRequestsFIFO_rd_en, 
  StatsWriteRequestsFIFO_rd_data, StatsWriteRequestsFIFO_empty, 
  StatsWriteRequestsFIFO_almost_empty, StatsWriteRequestsFIFO_rd_en, 
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
/* synthesis syn_black_box black_box_pad_pin="M_AXI_ARESETN,M_AXI_AWADDR[29:0],M_AXI_AWPROT[2:0],M_AXI_AWVALID,M_AXI_AWREADY,M_AXI_WDATA[255:0],M_AXI_WSTRB[31:0],M_AXI_WVALID,M_AXI_WREADY,M_AXI_BRESP[1:0],M_AXI_BVALID,M_AXI_BREADY,M_AXI_ARADDR[29:0],M_AXI_ARPROT[2:0],M_AXI_ARVALID,M_AXI_ARREADY,M_AXI_RDATA[255:0],M_AXI_RRESP[1:0],M_AXI_RVALID,M_AXI_RREADY,M_AXI_ARBURST[1:0],M_AXI_ARCACHE[3:0],M_AXI_ARLEN[7:0],M_AXI_ARLOCK,M_AXI_ARSIZE[2:0],M_AXI_AWBURST[1:0],M_AXI_AWCACHE[3:0],M_AXI_AWLEN[7:0],M_AXI_AWLOCK,M_AXI_AWSIZE[2:0],M_AXI_ARID[3:0],M_AXI_AWID[3:0],M_AXI_RID[3:0],M_AXI_RLAST,M_AXI_WLAST,c0_init_calib_complete,ScanoutReadRequestsFIFO_rd_data[29:0],ScanoutReadRequestsFIFO_empty,ScanoutReadRequestsFIFO_almost_empty,ScanoutReadRequestsFIFO_rd_en,ScanoutReadResponsesFIFO_full,ScanoutReadResponsesFIFO_wr_data[255:0],ScanoutReadResponsesFIFO_wr_en,ZStencilReadRequestsFIFO_rd_data[29:0],ZStencilReadRequestsFIFO_empty,ZStencilReadRequestsFIFO_almost_empty,ZStencilReadRequestsFIFO_rd_en,ZStencilReadResponsesFIFO_full,ZStencilReadResponsesFIFO_wr_data[255:0],ZStencilReadResponsesFIFO_wr_en,ZStencilWriteRequestsFIFO_rd_data[293:0],ZStencilWriteRequestsFIFO_empty,ZStencilWriteRequestsFIFO_almost_empty,ZStencilWriteRequestsFIFO_rd_en,CommandProcReadRequestsFIFO_rd_data[29:0],CommandProcReadRequestsFIFO_empty,CommandProcReadRequestsFIFO_almost_empty,CommandProcReadRequestsFIFO_rd_en,CommandProcReadResponsesFIFO_full,CommandProcReadResponsesFIFO_wr_data[255:0],CommandProcReadResponsesFIFO_wr_en,CommandProcWriteRequestsFIFO_rd_data[293:0],CommandProcWriteRequestsFIFO_empty,CommandProcWriteRequestsFIFO_almost_empty,CommandProcWriteRequestsFIFO_rd_en,VBCacheReadRequestsFIFO_rd_data[29:0],VBCacheReadRequestsFIFO_empty,VBCacheReadRequestsFIFO_almost_empty,VBCacheReadRequestsFIFO_rd_en,VBCacheReadResponsesFIFO_full,VBCacheReadResponsesFIFO_wr_data[255:0],VBCacheReadResponsesFIFO_wr_en,IBCacheReadRequestsFIFO_rd_data[29:0],IBCacheReadRequestsFIFO_empty,IBCacheReadRequestsFIFO_almost_empty,IBCacheReadRequestsFIFO_rd_en,IBCacheReadResponsesFIFO_full,IBCacheReadResponsesFIFO_wr_data[255:0],IBCacheReadResponsesFIFO_wr_en,PacketDMAReadRequestsFIFO_rd_data[29:0],PacketDMAReadRequestsFIFO_empty,PacketDMAReadRequestsFIFO_almost_empty,PacketDMAReadRequestsFIFO_rd_en,PacketDMAReadResponsesFIFO_full,PacketDMAReadResponsesFIFO_wr_data[255:0],PacketDMAReadResponsesFIFO_wr_en,PacketDMAWriteRequestsFIFO_rd_data[293:0],PacketDMAWriteRequestsFIFO_empty,PacketDMAWriteRequestsFIFO_almost_empty,PacketDMAWriteRequestsFIFO_rd_en,TexFetchReadRequestsFIFO_rd_data[29:0],TexFetchReadRequestsFIFO_empty,TexFetchReadRequestsFIFO_almost_empty,TexFetchReadRequestsFIFO_rd_en,TexFetchReadResponsesFIFO_full,TexFetchReadResponsesFIFO_wr_data[255:0],TexFetchReadResponsesFIFO_wr_en,ROPReadRequestsFIFO_rd_data[29:0],ROPReadRequestsFIFO_empty,ROPReadRequestsFIFO_almost_empty,ROPReadRequestsFIFO_rd_en,ROPReadResponsesFIFO_full,ROPReadResponsesFIFO_wr_data[255:0],ROPReadResponsesFIFO_wr_en,ROPWriteRequestsFIFO_rd_data[293:0],ROPWriteRequestsFIFO_empty,ROPWriteRequestsFIFO_almost_empty,ROPWriteRequestsFIFO_rd_en,ClearBlockWriteRequestsFIFO_rd_data[293:0],ClearBlockWriteRequestsFIFO_empty,ClearBlockWriteRequestsFIFO_almost_empty,ClearBlockWriteRequestsFIFO_rd_en,StatsWriteRequestsFIFO_rd_data[293:0],StatsWriteRequestsFIFO_empty,StatsWriteRequestsFIFO_almost_empty,StatsWriteRequestsFIFO_rd_en,CMD_MemoryControllerIsIdle,STAT_MemReadCyclesIdle[31:0],STAT_MemReadCyclesSpentWorking[31:0],STAT_MemWriteCyclesIdle[31:0],STAT_MemWriteCyclesSpentWorking[31:0],STAT_MemReadCountBytesTransferred[31:0],STAT_MemReadCountTransactions[31:0],STAT_MemReadCountNonScanoutBytesTransferred[31:0],STAT_MemReadCountNonScanoutTransactions[31:0],STAT_MemWriteCountBytesTransferred[31:0],STAT_MemWriteCountTransactions[31:0],DBG_ReadControlState[3:0],DBG_WriteControlState[3:0],DBG_ScanoutReadRequests_Empty,DBG_ScanoutReadResponses_Full,DBG_ScanoutReadRequests_rd_en,DBG_LastWriteAddress[29:0],DBG_LastWriteData[255:0],DBG_LastWriteDataDWORDEnables[7:0],DBG_LastWriteMemoryClientIndex[3:0],DBG_LastReadAddress[29:0],DBG_LastReadMemoryClientIndex[3:0],DBG_ReadRequestsEmptyBitmask[7:0],DBG_WriteRequestsEmptyBitmask[5:0],DBG_ReadResponsesFullBitmask[7:0]" */
/* synthesis syn_force_seq_prim="M_AXI_ACLK" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 M_AXI_ACLK CLK" *) (* x_interface_mode = "slave M_AXI_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_ACLK, ASSOCIATED_BUSIF M_AXI:ScanoutReadRequests:ScanoutReadResponses:ZStencilReadRequests:ZStencilReadResponses:ZStencilWriteRequests:CommandProcReadRequests:CommandProcReadResponses:CommandProcWriteRequests:VBCacheReadRequests:VBCacheReadResponses:IBCacheReadRequests:IBCacheReadResponses:PacketDMAReadRequests:PacketDMAReadResponses:PacketDMAWriteRequests:TexFetchReadRequests:TexFetchReadResponses:ROPReadRequests:ROPReadResponses:ROPWriteRequests:ClearBlockWriteRequests:StatsWriteRequests, ASSOCIATED_RESET M_AXI_ARESETN, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input M_AXI_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 M_AXI_ARESETN RST" *) (* x_interface_mode = "slave M_AXI_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input M_AXI_ARESETN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) (* x_interface_mode = "master M_AXI" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXI, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, FREQ_HZ 333250000, MAX_BURST_LENGTH 16, NUM_WRITE_OUTSTANDING 32, NUM_READ_OUTSTANDING 32, SUPPORTS_NARROW_BURST 0, READ_WRITE_MODE READ_WRITE, BUSER_WIDTH 0, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, ADDR_WIDTH 30, ID_WIDTH 4, PROTOCOL AXI4, DATA_WIDTH 256, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.00, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [29:0]M_AXI_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]M_AXI_AWPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output M_AXI_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input M_AXI_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [255:0]M_AXI_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [31:0]M_AXI_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output M_AXI_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input M_AXI_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]M_AXI_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input M_AXI_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output M_AXI_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [29:0]M_AXI_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]M_AXI_ARPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output M_AXI_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input M_AXI_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [255:0]M_AXI_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]M_AXI_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input M_AXI_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output M_AXI_RREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]M_AXI_ARBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]M_AXI_ARCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [7:0]M_AXI_ARLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output M_AXI_ARLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]M_AXI_ARSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]M_AXI_AWBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]M_AXI_AWCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [7:0]M_AXI_AWLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output M_AXI_AWLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]M_AXI_AWSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *) output [3:0]M_AXI_ARID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *) output [3:0]M_AXI_AWID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RID" *) input [3:0]M_AXI_RID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input M_AXI_RLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output M_AXI_WLAST;
  input c0_init_calib_complete;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_DATA" *) (* x_interface_mode = "master ScanoutReadRequests" *) input [29:0]ScanoutReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests EMPTY" *) input ScanoutReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests ALMOST_EMPTY" *) input ScanoutReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_EN" *) output ScanoutReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses FULL" *) (* x_interface_mode = "master ScanoutReadResponses" *) input ScanoutReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_DATA" *) output [255:0]ScanoutReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_EN" *) output ScanoutReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_DATA" *) (* x_interface_mode = "master ZStencilReadRequests" *) input [29:0]ZStencilReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests EMPTY" *) input ZStencilReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests ALMOST_EMPTY" *) input ZStencilReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_EN" *) output ZStencilReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses FULL" *) (* x_interface_mode = "master ZStencilReadResponses" *) input ZStencilReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_DATA" *) output [255:0]ZStencilReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_EN" *) output ZStencilReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_DATA" *) (* x_interface_mode = "master ZStencilWriteRequests" *) input [293:0]ZStencilWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests EMPTY" *) input ZStencilWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests ALMOST_EMPTY" *) input ZStencilWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_EN" *) output ZStencilWriteRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_DATA" *) (* x_interface_mode = "master CommandProcReadRequests" *) input [29:0]CommandProcReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests EMPTY" *) input CommandProcReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests ALMOST_EMPTY" *) input CommandProcReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_EN" *) output CommandProcReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses FULL" *) (* x_interface_mode = "master CommandProcReadResponses" *) input CommandProcReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_DATA" *) output [255:0]CommandProcReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_EN" *) output CommandProcReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_DATA" *) (* x_interface_mode = "master CommandProcWriteRequests" *) input [293:0]CommandProcWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests EMPTY" *) input CommandProcWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests ALMOST_EMPTY" *) input CommandProcWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_EN" *) output CommandProcWriteRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_DATA" *) (* x_interface_mode = "master VBCacheReadRequests" *) input [29:0]VBCacheReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests EMPTY" *) input VBCacheReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests ALMOST_EMPTY" *) input VBCacheReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_EN" *) output VBCacheReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses FULL" *) (* x_interface_mode = "master VBCacheReadResponses" *) input VBCacheReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_DATA" *) output [255:0]VBCacheReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_EN" *) output VBCacheReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_DATA" *) (* x_interface_mode = "master IBCacheReadRequests" *) input [29:0]IBCacheReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests EMPTY" *) input IBCacheReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests ALMOST_EMPTY" *) input IBCacheReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_EN" *) output IBCacheReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses FULL" *) (* x_interface_mode = "master IBCacheReadResponses" *) input IBCacheReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_DATA" *) output [255:0]IBCacheReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_EN" *) output IBCacheReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_DATA" *) (* x_interface_mode = "master PacketDMAReadRequests" *) input [29:0]PacketDMAReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests EMPTY" *) input PacketDMAReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests ALMOST_EMPTY" *) input PacketDMAReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_EN" *) output PacketDMAReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses FULL" *) (* x_interface_mode = "master PacketDMAReadResponses" *) input PacketDMAReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_DATA" *) output [255:0]PacketDMAReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_EN" *) output PacketDMAReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_DATA" *) (* x_interface_mode = "master PacketDMAWriteRequests" *) input [293:0]PacketDMAWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests EMPTY" *) input PacketDMAWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests ALMOST_EMPTY" *) input PacketDMAWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_EN" *) output PacketDMAWriteRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_DATA" *) (* x_interface_mode = "master TexFetchReadRequests" *) input [29:0]TexFetchReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests EMPTY" *) input TexFetchReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests ALMOST_EMPTY" *) input TexFetchReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_EN" *) output TexFetchReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses FULL" *) (* x_interface_mode = "master TexFetchReadResponses" *) input TexFetchReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_DATA" *) output [255:0]TexFetchReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_EN" *) output TexFetchReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_DATA" *) (* x_interface_mode = "master ROPReadRequests" *) input [29:0]ROPReadRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadRequests EMPTY" *) input ROPReadRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadRequests ALMOST_EMPTY" *) input ROPReadRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_EN" *) output ROPReadRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadResponses FULL" *) (* x_interface_mode = "master ROPReadResponses" *) input ROPReadResponsesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_DATA" *) output [255:0]ROPReadResponsesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_EN" *) output ROPReadResponsesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_DATA" *) (* x_interface_mode = "master ROPWriteRequests" *) input [293:0]ROPWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests EMPTY" *) input ROPWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests ALMOST_EMPTY" *) input ROPWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_EN" *) output ROPWriteRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_DATA" *) (* x_interface_mode = "master ClearBlockWriteRequests" *) input [293:0]ClearBlockWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests EMPTY" *) input ClearBlockWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests ALMOST_EMPTY" *) input ClearBlockWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_EN" *) output ClearBlockWriteRequestsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_DATA" *) (* x_interface_mode = "master StatsWriteRequests" *) input [293:0]StatsWriteRequestsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests EMPTY" *) input StatsWriteRequestsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests ALMOST_EMPTY" *) input StatsWriteRequestsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_EN" *) output StatsWriteRequestsFIFO_rd_en;
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
