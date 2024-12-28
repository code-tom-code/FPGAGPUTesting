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

-- IP VLNV: xilinx.com:module_ref:MemoryController:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_MemoryController_0_0 IS
  PORT (
    M_AXI_ACLK : IN STD_LOGIC;
    M_AXI_ARESETN : IN STD_LOGIC;
    M_AXI_AWADDR : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    M_AXI_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_AWVALID : OUT STD_LOGIC;
    M_AXI_AWREADY : IN STD_LOGIC;
    M_AXI_WDATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    M_AXI_WSTRB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXI_WVALID : OUT STD_LOGIC;
    M_AXI_WREADY : IN STD_LOGIC;
    M_AXI_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_BVALID : IN STD_LOGIC;
    M_AXI_BREADY : OUT STD_LOGIC;
    M_AXI_ARADDR : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    M_AXI_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_ARVALID : OUT STD_LOGIC;
    M_AXI_ARREADY : IN STD_LOGIC;
    M_AXI_RDATA : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    M_AXI_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_RVALID : IN STD_LOGIC;
    M_AXI_RREADY : OUT STD_LOGIC;
    M_AXI_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M_AXI_ARLOCK : OUT STD_LOGIC;
    M_AXI_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M_AXI_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M_AXI_AWLOCK : OUT STD_LOGIC;
    M_AXI_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    M_AXI_ARID : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_AWID : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_RID : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_AXI_RLAST : IN STD_LOGIC;
    M_AXI_WLAST : OUT STD_LOGIC;
    c0_init_calib_complete : IN STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    ScanoutReadRequestsFIFO_empty : IN STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    ScanoutReadResponsesFIFO_full : IN STD_LOGIC;
    ScanoutReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    ScanoutReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    ZStencilReadRequestsFIFO_empty : IN STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    ZStencilReadResponsesFIFO_full : IN STD_LOGIC;
    ZStencilReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    ZStencilReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    ZStencilWriteRequestsFIFO_empty : IN STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CommandProcReadRequestsFIFO_empty : IN STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    CommandProcReadResponsesFIFO_full : IN STD_LOGIC;
    CommandProcReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    CommandProcReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    CommandProcWriteRequestsFIFO_empty : IN STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    VBCacheReadRequestsFIFO_empty : IN STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    VBCacheReadResponsesFIFO_full : IN STD_LOGIC;
    VBCacheReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    VBCacheReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    IBCacheReadRequestsFIFO_empty : IN STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    IBCacheReadResponsesFIFO_full : IN STD_LOGIC;
    IBCacheReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    IBCacheReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    PacketDMAReadRequestsFIFO_empty : IN STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    PacketDMAReadResponsesFIFO_full : IN STD_LOGIC;
    PacketDMAReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    PacketDMAReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    PacketDMAWriteRequestsFIFO_empty : IN STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    TexFetchReadRequestsFIFO_empty : IN STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    TexFetchReadResponsesFIFO_full : IN STD_LOGIC;
    TexFetchReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    TexFetchReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    ROPReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    ROPReadRequestsFIFO_empty : IN STD_LOGIC;
    ROPReadRequestsFIFO_rd_en : OUT STD_LOGIC;
    ROPReadResponsesFIFO_full : IN STD_LOGIC;
    ROPReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    ROPReadResponsesFIFO_wr_en : OUT STD_LOGIC;
    ROPWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    ROPWriteRequestsFIFO_empty : IN STD_LOGIC;
    ROPWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    ClearBlockWriteRequestsFIFO_empty : IN STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    StatsWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
    StatsWriteRequestsFIFO_empty : IN STD_LOGIC;
    StatsWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
    CMD_MemoryControllerIsIdle : OUT STD_LOGIC;
    STAT_MemReadCyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemReadCyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemWriteCyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemWriteCyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemReadCountBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemReadCountTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemReadCountNonScanoutBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemReadCountNonScanoutTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemWriteCountBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_MemWriteCountTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_ReadControlState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_WriteControlState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_ScanoutReadRequests_Empty : OUT STD_LOGIC;
    DBG_ScanoutReadResponses_Full : OUT STD_LOGIC;
    DBG_ScanoutReadRequests_rd_en : OUT STD_LOGIC;
    DBG_LastWriteAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    DBG_LastWriteData : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    DBG_LastWriteDataDWORDEnables : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_LastWriteMemoryClientIndex : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_LastReadAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    DBG_LastReadMemoryClientIndex : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_ReadRequestsEmptyBitmask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_WriteRequestsEmptyBitmask : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_ReadResponsesFullBitmask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END design_1_MemoryController_0_0;

ARCHITECTURE design_1_MemoryController_0_0_arch OF design_1_MemoryController_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_MemoryController_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT MemoryController IS
    GENERIC (
      C_M_START_DATA_VALUE : STD_LOGIC_VECTOR;
      C_M_TARGET_SLAVE_BASE_ADDR : STD_LOGIC_VECTOR;
      C_M_AXI_ADDR_WIDTH : INTEGER;
      C_M_AXI_DATA_WIDTH : INTEGER
    );
    PORT (
      M_AXI_ACLK : IN STD_LOGIC;
      M_AXI_ARESETN : IN STD_LOGIC;
      M_AXI_AWADDR : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      M_AXI_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M_AXI_AWVALID : OUT STD_LOGIC;
      M_AXI_AWREADY : IN STD_LOGIC;
      M_AXI_WDATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      M_AXI_WSTRB : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      M_AXI_WVALID : OUT STD_LOGIC;
      M_AXI_WREADY : IN STD_LOGIC;
      M_AXI_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M_AXI_BVALID : IN STD_LOGIC;
      M_AXI_BREADY : OUT STD_LOGIC;
      M_AXI_ARADDR : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      M_AXI_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M_AXI_ARVALID : OUT STD_LOGIC;
      M_AXI_ARREADY : IN STD_LOGIC;
      M_AXI_RDATA : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      M_AXI_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M_AXI_RVALID : IN STD_LOGIC;
      M_AXI_RREADY : OUT STD_LOGIC;
      M_AXI_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M_AXI_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_AXI_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M_AXI_ARLOCK : OUT STD_LOGIC;
      M_AXI_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M_AXI_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M_AXI_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_AXI_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      M_AXI_AWLOCK : OUT STD_LOGIC;
      M_AXI_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      M_AXI_ARID : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_AXI_AWID : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_AXI_RID : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_AXI_RLAST : IN STD_LOGIC;
      M_AXI_WLAST : OUT STD_LOGIC;
      c0_init_calib_complete : IN STD_LOGIC;
      ScanoutReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      ScanoutReadRequestsFIFO_empty : IN STD_LOGIC;
      ScanoutReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      ScanoutReadResponsesFIFO_full : IN STD_LOGIC;
      ScanoutReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      ScanoutReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      ZStencilReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      ZStencilReadRequestsFIFO_empty : IN STD_LOGIC;
      ZStencilReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      ZStencilReadResponsesFIFO_full : IN STD_LOGIC;
      ZStencilReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      ZStencilReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      ZStencilWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      ZStencilWriteRequestsFIFO_empty : IN STD_LOGIC;
      ZStencilWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      CommandProcReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CommandProcReadRequestsFIFO_empty : IN STD_LOGIC;
      CommandProcReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      CommandProcReadResponsesFIFO_full : IN STD_LOGIC;
      CommandProcReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      CommandProcReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      CommandProcWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      CommandProcWriteRequestsFIFO_empty : IN STD_LOGIC;
      CommandProcWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      VBCacheReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      VBCacheReadRequestsFIFO_empty : IN STD_LOGIC;
      VBCacheReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      VBCacheReadResponsesFIFO_full : IN STD_LOGIC;
      VBCacheReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      VBCacheReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      IBCacheReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      IBCacheReadRequestsFIFO_empty : IN STD_LOGIC;
      IBCacheReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      IBCacheReadResponsesFIFO_full : IN STD_LOGIC;
      IBCacheReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      IBCacheReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      PacketDMAReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      PacketDMAReadRequestsFIFO_empty : IN STD_LOGIC;
      PacketDMAReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      PacketDMAReadResponsesFIFO_full : IN STD_LOGIC;
      PacketDMAReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      PacketDMAReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      PacketDMAWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      PacketDMAWriteRequestsFIFO_empty : IN STD_LOGIC;
      PacketDMAWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      TexFetchReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      TexFetchReadRequestsFIFO_empty : IN STD_LOGIC;
      TexFetchReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      TexFetchReadResponsesFIFO_full : IN STD_LOGIC;
      TexFetchReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      TexFetchReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      ROPReadRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      ROPReadRequestsFIFO_empty : IN STD_LOGIC;
      ROPReadRequestsFIFO_rd_en : OUT STD_LOGIC;
      ROPReadResponsesFIFO_full : IN STD_LOGIC;
      ROPReadResponsesFIFO_wr_data : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      ROPReadResponsesFIFO_wr_en : OUT STD_LOGIC;
      ROPWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      ROPWriteRequestsFIFO_empty : IN STD_LOGIC;
      ROPWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      ClearBlockWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      ClearBlockWriteRequestsFIFO_empty : IN STD_LOGIC;
      ClearBlockWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      StatsWriteRequestsFIFO_rd_data : IN STD_LOGIC_VECTOR(293 DOWNTO 0);
      StatsWriteRequestsFIFO_empty : IN STD_LOGIC;
      StatsWriteRequestsFIFO_rd_en : OUT STD_LOGIC;
      CMD_MemoryControllerIsIdle : OUT STD_LOGIC;
      STAT_MemReadCyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemReadCyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemWriteCyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemWriteCyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemReadCountBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemReadCountTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemReadCountNonScanoutBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemReadCountNonScanoutTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemWriteCountBytesTransferred : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_MemWriteCountTransactions : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_ReadControlState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_WriteControlState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_ScanoutReadRequests_Empty : OUT STD_LOGIC;
      DBG_ScanoutReadResponses_Full : OUT STD_LOGIC;
      DBG_ScanoutReadRequests_rd_en : OUT STD_LOGIC;
      DBG_LastWriteAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DBG_LastWriteData : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      DBG_LastWriteDataDWORDEnables : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_LastWriteMemoryClientIndex : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_LastReadAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      DBG_LastReadMemoryClientIndex : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_ReadRequestsEmptyBitmask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_WriteRequestsEmptyBitmask : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_ReadResponsesFullBitmask : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT MemoryController;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_MemoryController_0_0_arch: ARCHITECTURE IS "MemoryController,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_MemoryController_0_0_arch : ARCHITECTURE IS "design_1_MemoryController_0_0,MemoryController,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_MemoryController_0_0_arch: ARCHITECTURE IS "design_1_MemoryController_0_0,MemoryController,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=MemoryController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_M_START_DATA_VALUE=0x00000000,C_M_TARGET_SLAVE_BASE_ADDR=0x00000000,C_M_AXI_ADDR_WIDTH=30,C_M_AXI_DATA_WIDTH=256}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF StatsWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF StatsWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF StatsWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ClearBlockWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ClearBlockWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ClearBlockWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ROPWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ROPWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ROPWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ROPReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ROPReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF TexFetchReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF PacketDMAReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF IBCacheReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF VBCacheReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF CommandProcReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilWriteRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilWriteRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilWriteRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ZStencilReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadResponsesFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadResponsesFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadResponsesFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses FULL";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadRequestsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadRequestsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF ScanoutReadRequestsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXI_AWADDR: SIGNAL IS "XIL_INTERFACENAME M_AXI, MAX_BURST_LENGTH 16, NUM_WRITE_OUTSTANDING 32, NUM_READ_OUTSTANDING 32, SUPPORTS_NARROW_BURST 0, READ_WRITE_MODE READ_WRITE, BUSER_WIDTH 0, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, ADDR_WIDTH 30, ID_WIDTH 4, FREQ_HZ 333250000, PROTOCOL AXI4, DATA_WIDTH 256, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_W" & 
"RITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXI_ARESETN: SIGNAL IS "XIL_INTERFACENAME M_AXI_ARESETN, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ARESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 M_AXI_ARESETN RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXI_ACLK: SIGNAL IS "XIL_INTERFACENAME M_AXI_ACLK, ASSOCIATED_BUSIF M_AXI, ASSOCIATED_RESET M_AXI_ARESETN, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXI_ACLK: SIGNAL IS "xilinx.com:signal:clock:1.0 M_AXI_ACLK CLK";
BEGIN
  U0 : MemoryController
    GENERIC MAP (
      C_M_START_DATA_VALUE => X"00000000",
      C_M_TARGET_SLAVE_BASE_ADDR => X"00000000",
      C_M_AXI_ADDR_WIDTH => 30,
      C_M_AXI_DATA_WIDTH => 256
    )
    PORT MAP (
      M_AXI_ACLK => M_AXI_ACLK,
      M_AXI_ARESETN => M_AXI_ARESETN,
      M_AXI_AWADDR => M_AXI_AWADDR,
      M_AXI_AWPROT => M_AXI_AWPROT,
      M_AXI_AWVALID => M_AXI_AWVALID,
      M_AXI_AWREADY => M_AXI_AWREADY,
      M_AXI_WDATA => M_AXI_WDATA,
      M_AXI_WSTRB => M_AXI_WSTRB,
      M_AXI_WVALID => M_AXI_WVALID,
      M_AXI_WREADY => M_AXI_WREADY,
      M_AXI_BRESP => M_AXI_BRESP,
      M_AXI_BVALID => M_AXI_BVALID,
      M_AXI_BREADY => M_AXI_BREADY,
      M_AXI_ARADDR => M_AXI_ARADDR,
      M_AXI_ARPROT => M_AXI_ARPROT,
      M_AXI_ARVALID => M_AXI_ARVALID,
      M_AXI_ARREADY => M_AXI_ARREADY,
      M_AXI_RDATA => M_AXI_RDATA,
      M_AXI_RRESP => M_AXI_RRESP,
      M_AXI_RVALID => M_AXI_RVALID,
      M_AXI_RREADY => M_AXI_RREADY,
      M_AXI_ARBURST => M_AXI_ARBURST,
      M_AXI_ARCACHE => M_AXI_ARCACHE,
      M_AXI_ARLEN => M_AXI_ARLEN,
      M_AXI_ARLOCK => M_AXI_ARLOCK,
      M_AXI_ARSIZE => M_AXI_ARSIZE,
      M_AXI_AWBURST => M_AXI_AWBURST,
      M_AXI_AWCACHE => M_AXI_AWCACHE,
      M_AXI_AWLEN => M_AXI_AWLEN,
      M_AXI_AWLOCK => M_AXI_AWLOCK,
      M_AXI_AWSIZE => M_AXI_AWSIZE,
      M_AXI_ARID => M_AXI_ARID,
      M_AXI_AWID => M_AXI_AWID,
      M_AXI_RID => M_AXI_RID,
      M_AXI_RLAST => M_AXI_RLAST,
      M_AXI_WLAST => M_AXI_WLAST,
      c0_init_calib_complete => c0_init_calib_complete,
      ScanoutReadRequestsFIFO_rd_data => ScanoutReadRequestsFIFO_rd_data,
      ScanoutReadRequestsFIFO_empty => ScanoutReadRequestsFIFO_empty,
      ScanoutReadRequestsFIFO_rd_en => ScanoutReadRequestsFIFO_rd_en,
      ScanoutReadResponsesFIFO_full => ScanoutReadResponsesFIFO_full,
      ScanoutReadResponsesFIFO_wr_data => ScanoutReadResponsesFIFO_wr_data,
      ScanoutReadResponsesFIFO_wr_en => ScanoutReadResponsesFIFO_wr_en,
      ZStencilReadRequestsFIFO_rd_data => ZStencilReadRequestsFIFO_rd_data,
      ZStencilReadRequestsFIFO_empty => ZStencilReadRequestsFIFO_empty,
      ZStencilReadRequestsFIFO_rd_en => ZStencilReadRequestsFIFO_rd_en,
      ZStencilReadResponsesFIFO_full => ZStencilReadResponsesFIFO_full,
      ZStencilReadResponsesFIFO_wr_data => ZStencilReadResponsesFIFO_wr_data,
      ZStencilReadResponsesFIFO_wr_en => ZStencilReadResponsesFIFO_wr_en,
      ZStencilWriteRequestsFIFO_rd_data => ZStencilWriteRequestsFIFO_rd_data,
      ZStencilWriteRequestsFIFO_empty => ZStencilWriteRequestsFIFO_empty,
      ZStencilWriteRequestsFIFO_rd_en => ZStencilWriteRequestsFIFO_rd_en,
      CommandProcReadRequestsFIFO_rd_data => CommandProcReadRequestsFIFO_rd_data,
      CommandProcReadRequestsFIFO_empty => CommandProcReadRequestsFIFO_empty,
      CommandProcReadRequestsFIFO_rd_en => CommandProcReadRequestsFIFO_rd_en,
      CommandProcReadResponsesFIFO_full => CommandProcReadResponsesFIFO_full,
      CommandProcReadResponsesFIFO_wr_data => CommandProcReadResponsesFIFO_wr_data,
      CommandProcReadResponsesFIFO_wr_en => CommandProcReadResponsesFIFO_wr_en,
      CommandProcWriteRequestsFIFO_rd_data => CommandProcWriteRequestsFIFO_rd_data,
      CommandProcWriteRequestsFIFO_empty => CommandProcWriteRequestsFIFO_empty,
      CommandProcWriteRequestsFIFO_rd_en => CommandProcWriteRequestsFIFO_rd_en,
      VBCacheReadRequestsFIFO_rd_data => VBCacheReadRequestsFIFO_rd_data,
      VBCacheReadRequestsFIFO_empty => VBCacheReadRequestsFIFO_empty,
      VBCacheReadRequestsFIFO_rd_en => VBCacheReadRequestsFIFO_rd_en,
      VBCacheReadResponsesFIFO_full => VBCacheReadResponsesFIFO_full,
      VBCacheReadResponsesFIFO_wr_data => VBCacheReadResponsesFIFO_wr_data,
      VBCacheReadResponsesFIFO_wr_en => VBCacheReadResponsesFIFO_wr_en,
      IBCacheReadRequestsFIFO_rd_data => IBCacheReadRequestsFIFO_rd_data,
      IBCacheReadRequestsFIFO_empty => IBCacheReadRequestsFIFO_empty,
      IBCacheReadRequestsFIFO_rd_en => IBCacheReadRequestsFIFO_rd_en,
      IBCacheReadResponsesFIFO_full => IBCacheReadResponsesFIFO_full,
      IBCacheReadResponsesFIFO_wr_data => IBCacheReadResponsesFIFO_wr_data,
      IBCacheReadResponsesFIFO_wr_en => IBCacheReadResponsesFIFO_wr_en,
      PacketDMAReadRequestsFIFO_rd_data => PacketDMAReadRequestsFIFO_rd_data,
      PacketDMAReadRequestsFIFO_empty => PacketDMAReadRequestsFIFO_empty,
      PacketDMAReadRequestsFIFO_rd_en => PacketDMAReadRequestsFIFO_rd_en,
      PacketDMAReadResponsesFIFO_full => PacketDMAReadResponsesFIFO_full,
      PacketDMAReadResponsesFIFO_wr_data => PacketDMAReadResponsesFIFO_wr_data,
      PacketDMAReadResponsesFIFO_wr_en => PacketDMAReadResponsesFIFO_wr_en,
      PacketDMAWriteRequestsFIFO_rd_data => PacketDMAWriteRequestsFIFO_rd_data,
      PacketDMAWriteRequestsFIFO_empty => PacketDMAWriteRequestsFIFO_empty,
      PacketDMAWriteRequestsFIFO_rd_en => PacketDMAWriteRequestsFIFO_rd_en,
      TexFetchReadRequestsFIFO_rd_data => TexFetchReadRequestsFIFO_rd_data,
      TexFetchReadRequestsFIFO_empty => TexFetchReadRequestsFIFO_empty,
      TexFetchReadRequestsFIFO_rd_en => TexFetchReadRequestsFIFO_rd_en,
      TexFetchReadResponsesFIFO_full => TexFetchReadResponsesFIFO_full,
      TexFetchReadResponsesFIFO_wr_data => TexFetchReadResponsesFIFO_wr_data,
      TexFetchReadResponsesFIFO_wr_en => TexFetchReadResponsesFIFO_wr_en,
      ROPReadRequestsFIFO_rd_data => ROPReadRequestsFIFO_rd_data,
      ROPReadRequestsFIFO_empty => ROPReadRequestsFIFO_empty,
      ROPReadRequestsFIFO_rd_en => ROPReadRequestsFIFO_rd_en,
      ROPReadResponsesFIFO_full => ROPReadResponsesFIFO_full,
      ROPReadResponsesFIFO_wr_data => ROPReadResponsesFIFO_wr_data,
      ROPReadResponsesFIFO_wr_en => ROPReadResponsesFIFO_wr_en,
      ROPWriteRequestsFIFO_rd_data => ROPWriteRequestsFIFO_rd_data,
      ROPWriteRequestsFIFO_empty => ROPWriteRequestsFIFO_empty,
      ROPWriteRequestsFIFO_rd_en => ROPWriteRequestsFIFO_rd_en,
      ClearBlockWriteRequestsFIFO_rd_data => ClearBlockWriteRequestsFIFO_rd_data,
      ClearBlockWriteRequestsFIFO_empty => ClearBlockWriteRequestsFIFO_empty,
      ClearBlockWriteRequestsFIFO_rd_en => ClearBlockWriteRequestsFIFO_rd_en,
      StatsWriteRequestsFIFO_rd_data => StatsWriteRequestsFIFO_rd_data,
      StatsWriteRequestsFIFO_empty => StatsWriteRequestsFIFO_empty,
      StatsWriteRequestsFIFO_rd_en => StatsWriteRequestsFIFO_rd_en,
      CMD_MemoryControllerIsIdle => CMD_MemoryControllerIsIdle,
      STAT_MemReadCyclesIdle => STAT_MemReadCyclesIdle,
      STAT_MemReadCyclesSpentWorking => STAT_MemReadCyclesSpentWorking,
      STAT_MemWriteCyclesIdle => STAT_MemWriteCyclesIdle,
      STAT_MemWriteCyclesSpentWorking => STAT_MemWriteCyclesSpentWorking,
      STAT_MemReadCountBytesTransferred => STAT_MemReadCountBytesTransferred,
      STAT_MemReadCountTransactions => STAT_MemReadCountTransactions,
      STAT_MemReadCountNonScanoutBytesTransferred => STAT_MemReadCountNonScanoutBytesTransferred,
      STAT_MemReadCountNonScanoutTransactions => STAT_MemReadCountNonScanoutTransactions,
      STAT_MemWriteCountBytesTransferred => STAT_MemWriteCountBytesTransferred,
      STAT_MemWriteCountTransactions => STAT_MemWriteCountTransactions,
      DBG_ReadControlState => DBG_ReadControlState,
      DBG_WriteControlState => DBG_WriteControlState,
      DBG_ScanoutReadRequests_Empty => DBG_ScanoutReadRequests_Empty,
      DBG_ScanoutReadResponses_Full => DBG_ScanoutReadResponses_Full,
      DBG_ScanoutReadRequests_rd_en => DBG_ScanoutReadRequests_rd_en,
      DBG_LastWriteAddress => DBG_LastWriteAddress,
      DBG_LastWriteData => DBG_LastWriteData,
      DBG_LastWriteDataDWORDEnables => DBG_LastWriteDataDWORDEnables,
      DBG_LastWriteMemoryClientIndex => DBG_LastWriteMemoryClientIndex,
      DBG_LastReadAddress => DBG_LastReadAddress,
      DBG_LastReadMemoryClientIndex => DBG_LastReadMemoryClientIndex,
      DBG_ReadRequestsEmptyBitmask => DBG_ReadRequestsEmptyBitmask,
      DBG_WriteRequestsEmptyBitmask => DBG_WriteRequestsEmptyBitmask,
      DBG_ReadResponsesFullBitmask => DBG_ReadResponsesFullBitmask
    );
END design_1_MemoryController_0_0_arch;
