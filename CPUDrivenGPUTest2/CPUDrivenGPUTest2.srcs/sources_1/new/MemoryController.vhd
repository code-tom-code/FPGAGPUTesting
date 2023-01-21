library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MemoryController is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- The master will start generating data from the C_M_START_DATA_VALUE value
		C_M_START_DATA_VALUE	: std_logic_vector	:= x"00000000";
		-- The master requires a target slave base address.
		-- The master will initiate read and write transactions on the slave with base address specified here as a parameter.
		C_M_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"00000000";
		-- Width of M_AXI address bus. 
		-- The master generates the read and write addresses of width specified as C_M_AXI_ADDR_WIDTH.
		C_M_AXI_ADDR_WIDTH	: integer range 8 to 32 := 30;
		-- Width of M_AXI data bus. 
		-- The master issues write data and accept read data where the width of the data bus is C_M_AXI_DATA_WIDTH
		C_M_AXI_DATA_WIDTH	: integer range 16 to 1024 := 256
	);
    Port ( 
		-- AXI clock signal
		M_AXI_ACLK	: in std_logic;
		-- AXI active low reset signal
		M_AXI_ARESETN	: in std_logic;
		-- Master Interface Write Address Channel ports. Write address (issued by master)
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		-- Write channel Protection type.
		-- This signal indicates the privilege and security level of the transaction,
		-- and whether the transaction is a data access or an instruction access.
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0) := (others => '0');
		-- Write address valid. 
		-- This signal indicates that the master signaling valid write address and control information.
		M_AXI_AWVALID	: out std_logic := '0';
		-- Write address ready. 
		-- This signal indicates that the slave is ready to accept an address and associated control signals.
		M_AXI_AWREADY	: in std_logic;
		-- Master Interface Write Data Channel ports. Write data (issued by master)
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		-- Write strobes. 
		-- This signal indicates which byte lanes hold valid data.
		-- There is one write strobe bit for each eight bits of the write data bus.
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0) := (others => '0');
		-- Write valid. This signal indicates that valid write data and strobes are available.
		M_AXI_WVALID	: out std_logic := '0';
		-- Write ready. This signal indicates that the slave can accept the write data.
		M_AXI_WREADY	: in std_logic;
		-- Master Interface Write Response Channel ports. 
		-- This signal indicates the status of the write transaction.
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		-- Write response valid. 
		-- This signal indicates that the channel is signaling a valid write response
		M_AXI_BVALID	: in std_logic;
		-- Response ready. This signal indicates that the master can accept a write response.
		M_AXI_BREADY	: out std_logic := '0';
		-- Master Interface Read Address Channel ports. Read address (issued by master)
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		-- Protection type. 
		-- This signal indicates the privilege and security level of the transaction, 
		-- and whether the transaction is a data access or an instruction access.
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0) := "001";
		-- Read address valid. 
		-- This signal indicates that the channel is signaling valid read address and control information.
		M_AXI_ARVALID	: out std_logic := '0';
		-- Read address ready. 
		-- This signal indicates that the slave is ready to accept an address and associated control signals.
		M_AXI_ARREADY	: in std_logic;
		-- Master Interface Read Data Channel ports. Read data (issued by slave)
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the read transfer.
		M_AXI_RRESP	: in std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is signaling the required read data.
		M_AXI_RVALID	: in std_logic;
		-- Read ready. This signal indicates that the master can accept the read data and response information.
		M_AXI_RREADY	: out std_logic := '0';

		-- AXI4 Full signals that don't exist in AXI4 Lite
		M_AXI_ARBURST : out std_logic_vector(1 downto 0) := (others => '0');
		M_AXI_ARCACHE : out std_logic_vector(3 downto 0) := (others => '0');
		M_AXI_ARLEN : out std_logic_vector(7 downto 0) := (others => '0');
		M_AXI_ARLOCK : out std_logic := '0';
		M_AXI_ARSIZE : out std_logic_vector(2 downto 0) := "101";

		M_AXI_AWBURST : out std_logic_vector(1 downto 0) := (others => '0');
		M_AXI_AWCACHE : out std_logic_vector(3 downto 0) := (others => '0');
		M_AXI_AWLEN : out std_logic_vector(7 downto 0) := (others => '0');
		M_AXI_AWLOCK : out std_logic := '0';
		M_AXI_AWSIZE : out std_logic_vector(2 downto 0) := "101";

		M_AXI_ARID : out std_logic_vector(3 downto 0) := (others => '0');
		M_AXI_AWID : out std_logic_vector(3 downto 0) := (others => '0');
		M_AXI_RID : in std_logic_vector(3 downto 0);

		M_AXI_RLAST : in std_logic;
		M_AXI_WLAST : out std_logic := '1';

		c0_init_calib_complete : in STD_LOGIC;

	-- Scanout system incoming read requests FIFO:
        ScanoutReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        ScanoutReadRequestsFIFO_empty : in STD_LOGIC;
        ScanoutReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Scanout system returned read responses FIFO:
		ScanoutReadResponsesFIFO_full : in STD_LOGIC;
		ScanoutReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		ScanoutReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ZStencil system incoming read requests FIFO:
        ZStencilReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        ZStencilReadRequestsFIFO_empty : in STD_LOGIC;
        ZStencilReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- ZStencil system returned read responses FIFO:
		ZStencilReadResponsesFIFO_full : in STD_LOGIC;
		ZStencilReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		ZStencilReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ZStencil system incoming write requests FIFO:
        ZStencilWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        ZStencilWriteRequestsFIFO_empty : in STD_LOGIC;
        ZStencilWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Command Processor system incoming read requests FIFO:
        CommandProcReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        CommandProcReadRequestsFIFO_empty : in STD_LOGIC;
        CommandProcReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Command Processor system returned read responses FIFO:
		CommandProcReadResponsesFIFO_full : in STD_LOGIC;
		CommandProcReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		CommandProcReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Command Processor system incoming write requests FIFO:
        CommandProcWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        CommandProcWriteRequestsFIFO_empty : in STD_LOGIC;
        CommandProcWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Vertex Buffer Cache (VBC) system incoming read requests FIFO:
        VBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        VBCacheReadRequestsFIFO_empty : in STD_LOGIC;
        VBCacheReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Vertex Buffer Cache (VBC) system returned read responses FIFO:
		VBCacheReadResponsesFIFO_full : in STD_LOGIC;
		VBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		VBCacheReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Index Buffer Cache (IBC) system incoming read requests FIFO:
        IBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        IBCacheReadRequestsFIFO_empty : in STD_LOGIC;
        IBCacheReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Index Buffer Cache (IBC) system returned read responses FIFO:
		IBCacheReadResponsesFIFO_full : in STD_LOGIC;
		IBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		IBCacheReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Packet DMA system incoming read requests FIFO:
        PacketDMAReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        PacketDMAReadRequestsFIFO_empty : in STD_LOGIC;
        PacketDMAReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Packet DMA system returned read responses FIFO:
		PacketDMAReadResponsesFIFO_full : in STD_LOGIC;
		PacketDMAReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		PacketDMAReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Packet DMA system incoming write requests FIFO:
        PacketDMAWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        PacketDMAWriteRequestsFIFO_empty : in STD_LOGIC;
        PacketDMAWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Texture fetch incoming read requests FIFO:
        TexFetchReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        TexFetchReadRequestsFIFO_empty : in STD_LOGIC;
        TexFetchReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Texture fetch returned read responses FIFO:
		TexFetchReadResponsesFIFO_full : in STD_LOGIC;
		TexFetchReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		TexFetchReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ROP system incoming read requests FIFO:
        ROPReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        ROPReadRequestsFIFO_empty : in STD_LOGIC;
        ROPReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- ROP system returned read responses FIFO:
		ROPReadResponsesFIFO_full : in STD_LOGIC;
		ROPReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		ROPReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ROP system incoming write requests FIFO:
        ROPWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        ROPWriteRequestsFIFO_empty : in STD_LOGIC;
        ROPWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Clear block incoming write requests FIFO:
        ClearBlockWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        ClearBlockWriteRequestsFIFO_empty : in STD_LOGIC;
        ClearBlockWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Stats Collector system incoming write requests FIFO:
        StatsWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        StatsWriteRequestsFIFO_empty : in STD_LOGIC;
        StatsWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Command processor interfaces begin
		CMD_MemoryControllerIsIdle : out STD_LOGIC := '1'; -- Signal to let the command processor know that we are idle (have no work to do)
	-- Command processor interfaces end

	-- Stats interface begin
		STAT_MemReadCyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemReadCyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemWriteCyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemWriteCyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemReadCountBytesTransferred : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemReadCountTransactions : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemReadCountNonScanoutBytesTransferred : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemReadCountNonScanoutTransactions : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemWriteCountBytesTransferred : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_MemWriteCountTransactions : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_ReadControlState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_WriteControlState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_ScanoutReadRequests_Empty : out STD_LOGIC := '0';
		DBG_ScanoutReadResponses_Full : out STD_LOGIC := '0';
		DBG_ScanoutReadRequests_rd_en : out STD_LOGIC := '0';
		DBG_LastWriteAddress : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		DBG_LastWriteData : out STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		DBG_LastWriteDataDWORDEnables : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_LastWriteMemoryClientIndex : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_LastReadAddress : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
		DBG_LastReadMemoryClientIndex : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_ReadRequestsEmptyBitmask : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_WriteRequestsEmptyBitmask : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_ReadResponsesFullBitmask : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		);
end MemoryController;

architecture Behavioral of MemoryController is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWADDR: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWLEN: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWLEN";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWSIZE: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWBURST: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWBURST";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWLOCK: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWCACHE: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWPROT: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWVALID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWREADY: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_WDATA: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_WSTRB: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_WLAST: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WLAST";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_WVALID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_WREADY: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_BRESP: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_BVALID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_BREADY: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARADDR: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARADDR";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARLEN: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARLEN";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARSIZE: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARBURST: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARBURST";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARLOCK: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARCACHE: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARPROT: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARPROT";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARVALID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARVALID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARREADY: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARREADY";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RDATA: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RDATA";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RRESP: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RRESP";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RLAST: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RLAST";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RVALID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RVALID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RREADY: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RREADY";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_ARID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI ARID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_AWID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWID";
	ATTRIBUTE X_INTERFACE_INFO of M_AXI_RID: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI RID";

	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of M_AXI_AWADDR: SIGNAL is "CLK_DOMAIN M_AXI_ACLK,MAX_BURST_LENGTH 16,NUM_WRITE_OUTSTANDING 32,NUM_READ_OUTSTANDING 32,SUPPORTS_NARROW_BURST 0,READ_WRITE_MODE READ_WRITE,BUSER_WIDTH 0,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,ADDR_WIDTH 30,ID_WIDTH 4,FREQ_HZ 333250000,PROTOCOL AXI4,DATA_WIDTH 256,HAS_BURST 1,HAS_CACHE 1,HAS_LOCK 1,HAS_PROT 1,HAS_QOS 0,HAS_REGION 0,HAS_WSTRB 1,HAS_BRESP 1,HAS_RRESP 1";
	
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadRequests EMPTY";
	
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of ScanoutReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ZStencilReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of ZStencilWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ZStencilWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ZStencilWriteRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcWriteRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of VBCacheReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCacheReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 PacketDMAReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of PacketDMAWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of PacketDMAWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 PacketDMAWriteRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexFetchReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of TexFetchReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexFetchReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of ROPReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ROPReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ROPReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of ROPReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ROPReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of ROPReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of ROPWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ROPWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ROPWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPWriteRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of ClearBlockWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of ClearBlockWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of ClearBlockWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ClearBlockWriteRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of StatsWriteRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of StatsWriteRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of StatsWriteRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteRequests EMPTY";

	-- Defines the various memory endpoints to return results to (also used for debugging)
	type memoryClient is ( SCANOUT, -- 0
						ZSTENCIL, -- 1
						COMMANDPROCESSOR, -- 2
						VBCACHE, -- 3
						TEXTUREFETCH, -- 4
						ROP, -- 5
						CLEARBLOCK, -- 6
						STATS, -- 7
						IBCACHE, -- 8
						PACKETDMA -- 9
						);

	type readControlState is ( READCTRL_INIT, -- 0
						READCTRL_HANDLE_INCOMING_MEMREQUEST, -- 1
						READCTRL_MEM_COOLDOWN -- 2
						);

	type writeControlState is ( WRITECTRL_INIT, -- 0
						WRITECTRL_HANDLE_INCOMING_WRITEREQUEST, -- 1
						WRITECTRL_DEASSERT -- 2
						);

	type IncomingReadRequest is record
		readAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
		memoryClientIndex : unsigned(3 downto 0);
	end record IncomingReadRequest;

	type ReturningReadResponse is record
		readAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
		readData : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0);
		memoryClientIndex : unsigned(3 downto 0);
	end record ReturningReadResponse;

	type IncomingWriteRequest is record
		writeAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
		writeData : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0);
		writeDataDWORDEnables : STD_LOGIC_VECTOR(7 downto 0);
		memoryClientIndex : unsigned(3 downto 0); -- The memoryClientIndex here is only used for debugging purposes (because unlike in the read request case, we don't return anything from write requests)
	end record IncomingWriteRequest;

	-- Expands an 8-bit bitmask of active DWORD's into a 32-bit mask of active bytes (each bit from the DWORD bitmask gets replicated 4 times)
	pure function ExpandDWORDMaskToByteMask(dwordWriteMask : STD_LOGIC_VECTOR(7 downto 0) ) return std_logic_vector is
		variable retVal : std_logic_vector(31 downto 0) := (others => '0');
	begin
		for i in 0 to 7 loop
			if (dwordWriteMask(i) = '0') then
				retVal(4*(i+1)-1 downto 4*i) := "0000";
			else
				retVal(4*(i+1)-1 downto 4*i) := "1111";
			end if;
		end loop;
		return retVal;
	end function;

	pure function CountBytesInWriteTransaction(dwordWriteMask : STD_LOGIC_VECTOR(7 downto 0) ) return unsigned is
		variable countBits : unsigned(3 downto 0) := (others => '0');
	begin
		if (dwordWriteMask(0) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(1) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(2) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(3) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(4) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(5) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(6) = '1') then
			countBits := countBits + 1;
		end if;
		if (dwordWriteMask(7) = '1') then
			countBits := countBits + 1;
		end if;
		return countBits & "00"; -- Shift left by 2 to multiply by sizeof(DWORD)
	end function;


	signal newReadRequest : IncomingReadRequest;
	signal newReadResponse : ReturningReadResponse;
	signal newWriteRequest : IncomingWriteRequest;

	signal currentReadControlState : readControlState := READCTRL_INIT;
	signal currentWriteControlState : writeControlState := WRITECTRL_INIT;

	-- AXI4LITE signals
	--write address valid
	signal axi_awvalid	: std_logic := '0';
	--write data valid
	signal axi_wvalid	: std_logic := '0';
	--read address valid
	signal axi_arvalid	: std_logic := '0';
	--read data acceptance
	signal axi_rready	: std_logic := '0';
	--write response acceptance
	signal axi_bready	: std_logic := '0';
	--write address
	signal axi_awaddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	--write data
	signal axi_wdata	: std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	--read addresss
	signal axi_araddr	: std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	--Write strobe (bitmap of which bytes are valid 1 or invalid 0)
	signal axi_wstrb	: std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0) := (others => '1');
	--Asserts when there is a write response error
	signal write_resp_error	: std_logic := '0';
	--Asserts when there is a read response error
	signal read_resp_error	: std_logic := '0';
	--A pulse to initiate a write transaction
	signal start_single_write	: std_logic := '0';
	--A pulse to initiate a read transaction
	signal start_single_read	: std_logic := '0';
	--Asserts when a single beat write transaction is issued and remains asserted till the completion of write trasaction.
	signal write_issued	: std_logic := '0';
	--Asserts when a single beat read transaction is issued and remains asserted till the completion of read trasaction.
	signal read_issued	: std_logic := '0';
	--Flag marks the completion of comparison of the read data with the expected read data
	signal compare_done	: std_logic := '0';
	--This flag is asserted when there is a mismatch of the read data with the expected read data.
	signal read_mismatch	: std_logic := '0';

	signal scanoutRequests_rd_en : std_logic := '0';

	-- System idle flags are used to signal to the Command Processor unit when the Memory Controller system is idle (has no pending requests)
	signal readSystem_idle : std_logic := '0';
	signal writeSystem_idle : std_logic := '0';

	-- Read system signals
	signal LastReadAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal LastReadMemoryClientIndex : unsigned(3 downto 0) := (others => '0');

	-- Write system signals
	signal LastWriteAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal LastWriteData : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal LastWriteDataDWORDEnables : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal LastWriteMemoryClientIndex : unsigned(3 downto 0) := (others => '0');
	signal NextWriteTransactionID : unsigned(3 downto 0) := (others => '0');

	signal statMemReadCyclesIdle : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCyclesWorking : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCyclesIdle : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCyclesWorking : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountTransactions : unsigned(31 downto 0) := (others => '0'); -- Note that this counts completed transactions, not initiated transactions that have yet to complete
	signal statMemReadCountNonScanoutBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountNonScanoutTransactions : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCountBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCountTransactions : unsigned(31 downto 0) := (others => '0');

	procedure QueueReadTransaction(signal argNewReadRequest : out IncomingReadRequest;
									signal argAxi_araddr : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
									signal argAxi_arvalid : out std_logic;
									signal argAxi_arid : out std_logic_vector(3 downto 0);
									constant readClient : in memoryClient;
									signal readAddr : in std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 5) ) is
	begin
		argNewReadRequest.readAddress <= readAddr & "00000";
		argNewReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(readClient), 4);
		argAxi_araddr <= readAddr & "00000";
		argAxi_arid <= std_logic_vector(to_unsigned(memoryClient'pos(readClient), 4) );
		argAxi_arvalid <= '1';
	end procedure;

	procedure QueueWriteTransaction(signal argNewWriteRequest : out IncomingWriteRequest;
									signal argAxi_awaddr : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
									signal argAxi_wdata : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
									signal argAxi_wstrb : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
									signal argAxi_awvalid : out std_logic;
									signal ArgNextWriteTransactionID : inout unsigned(3 downto 0);
									constant writeClient : in memoryClient;
									signal writeAddr : in std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 5);
									signal writeData : in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
									signal writeDWORDStrobe : in std_logic_vector(C_M_AXI_DATA_WIDTH/32-1 downto 0) ) is
	begin
		argNewWriteRequest.writeAddress <= writeAddr & "00000";
		argNewWriteRequest.writeData <= writeData;
		argNewWriteRequest.writeDataDWORDEnables <= writeDWORDStrobe;
		argNewWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(writeClient), 4);
		argAxi_awaddr <= writeAddr & "00000";
		argAxi_wdata <= writeData;
		argAxi_wstrb <= ExpandDWORDMaskToByteMask(writeDWORDStrobe);
		argAxi_awvalid <= '1';
		ArgNextWriteTransactionID <= ArgNextWriteTransactionID + 1;
	end procedure;

begin

	-- I/O Connections assignments

	--Adding the offset address to the base addr of the slave
	M_AXI_AWADDR	<= axi_awaddr;
	--AXI 4 write data
	M_AXI_WDATA	<= axi_wdata;
	M_AXI_AWPROT	<= "000";
	M_AXI_AWVALID	<= axi_awvalid;
	--Write Data(W)
	M_AXI_WVALID	<= axi_wvalid;
	--Set all byte strobes in this example
	M_AXI_WSTRB	<= axi_wstrb;
	--Write Response (B)
	M_AXI_BREADY	<= axi_bready;
	--Read Address (AR)
	M_AXI_ARADDR	<= axi_araddr;
	M_AXI_ARVALID	<= axi_arvalid;
	M_AXI_ARPROT	<= "001";
	--Read and Read Response (R)
	M_AXI_RREADY	<= axi_rready;

	-- AXI4 Full constants that don't exist in AXI4 Lite
	M_AXI_ARBURST <= "00"; -- FIXED = 0b00
	M_AXI_ARCACHE <= "0000"; -- Normal Non-cacheable Non-bufferable
	M_AXI_ARLEN <= x"00"; -- Sets a burst length of 1
	M_AXI_ARLOCK <= '0'; -- Never lock
	M_AXI_ARSIZE <= "101"; -- 32 byte transfers for 256 bit wide data (change this to "010" for AXI4Lite which transfers at 32 bits)

	M_AXI_AWBURST <= "00"; -- FIXED = 0b00
	M_AXI_AWCACHE <= "0000"; -- Normal Non-cacheable Non-bufferable
	M_AXI_AWLEN <= x"00"; -- Sets a burst length of 1
	M_AXI_AWLOCK <= '0';
	M_AXI_AWSIZE <= "101"; -- 32 byte transfers for 256 bit wide data (change this to "010" for AXI4Lite which transfers at 32 bits)

	M_AXI_WLAST <= '1'; -- Since we have a burst length of 1, we are always finishing a burst

	-- Each write transaction can be done using a different write transaction ID to tell the AXI slave
	-- that it's acceptable for the writes to complete in any order.
	M_AXI_AWID <= std_logic_vector(NextWriteTransactionID);

	--Flag write errors                                                    
	write_resp_error <= (axi_bready and M_AXI_BVALID and M_AXI_BRESP(1));
                                                                                                                            
	--Flag write errors                                                     
	read_resp_error <= (axi_rready and M_AXI_RVALID and M_AXI_RRESP(1));  

	CMD_MemoryControllerIsIdle <= (readSystem_idle and writeSystem_idle);

	ScanoutReadRequestsFIFO_rd_en <= scanoutRequests_rd_en;

	STAT_MemReadCyclesIdle <= std_logic_vector(statMemReadCyclesIdle);
	STAT_MemReadCyclesSpentWorking <= std_logic_vector(statMemReadCyclesWorking);
	STAT_MemWriteCyclesIdle <= std_logic_vector(statMemWriteCyclesIdle);
	STAT_MemWriteCyclesSpentWorking <= std_logic_vector(statMemWriteCyclesWorking);
	STAT_MemReadCountBytesTransferred <= std_logic_vector(statMemReadCountBytesTransferred);
	STAT_MemReadCountTransactions <= std_logic_vector(statMemReadCountTransactions);
	STAT_MemReadCountNonScanoutBytesTransferred <= std_logic_vector(statMemReadCountNonScanoutBytesTransferred);
	STAT_MemReadCountNonScanoutTransactions <= std_logic_vector(statMemReadCountNonScanoutTransactions);
	STAT_MemWriteCountBytesTransferred <= std_logic_vector(statMemWriteCountBytesTransferred);
	STAT_MemWriteCountTransactions <= std_logic_vector(statMemWriteCountTransactions);

	DBG_ReadControlState <= std_logic_vector(to_unsigned(readControlState'pos(currentReadControlState), 4) );
	DBG_WriteControlState <= std_logic_vector(to_unsigned(writeControlState'pos(currentWriteControlState), 4) );
	DBG_ScanoutReadRequests_Empty <= ScanoutReadRequestsFIFO_empty;
	DBG_ScanoutReadResponses_Full <= ScanoutReadResponsesFIFO_full;
	DBG_ScanoutReadRequests_rd_en <= scanoutRequests_rd_en;

	DBG_LastWriteAddress <= LastWriteAddress;
	DBG_LastWriteData <= LastWriteData;
	DBG_LastWriteDataDWORDEnables <= LastWriteDataDWORDEnables;
	DBG_LastWriteMemoryClientIndex <= std_logic_vector(LastWriteMemoryClientIndex);
	DBG_LastReadAddress <= LastReadAddress;
	DBG_LastReadMemoryClientIndex <= std_logic_vector(LastReadMemoryClientIndex);
	DBG_ReadRequestsEmptyBitmask <= ROPReadRequestsFIFO_empty & TexFetchReadRequestsFIFO_empty & PacketDMAReadRequestsFIFO_empty & IBCacheReadRequestsFIFO_empty &
		VBCacheReadRequestsFIFO_empty & CommandProcReadRequestsFIFO_empty & ZStencilReadRequestsFIFO_empty & ScanoutReadRequestsFIFO_empty;
	DBG_WriteRequestsEmptyBitmask <= PacketDMAWriteRequestsFIFO_empty & StatsWriteRequestsFIFO_empty & ClearBlockWriteRequestsFIFO_empty & ROPWriteRequestsFIFO_empty & CommandProcWriteRequestsFIFO_empty & ZStencilWriteRequestsFIFO_empty;
	DBG_ReadResponsesFullBitmask <= ROPReadResponsesFIFO_full & TexFetchReadResponsesFIFO_full & PacketDMAReadResponsesFIFO_full & IBCacheReadResponsesFIFO_full &
		VBCacheReadResponsesFIFO_full & CommandProcReadResponsesFIFO_full & ZStencilReadResponsesFIFO_full & ScanoutReadResponsesFIFO_full;

	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK) ) then
			if (readSystem_idle = '1') then
				statMemReadCyclesIdle <= statMemReadCyclesIdle + 1;
			else
				statMemReadCyclesWorking <= statMemReadCyclesWorking + 1;
			end if;

			if (writeSystem_idle = '1') then
				statMemWriteCyclesIdle <= statMemWriteCyclesIdle + 1;
			else
				statMemWriteCyclesWorking <= statMemWriteCyclesWorking + 1;
			end if;
		end if;
	end process;

	------------------------------
	--Write Response (B) Channel
	------------------------------

	--The write response channel provides feedback that the write has committed
	--to memory. BREADY will occur after both the data and the write address
	--has arrived and been accepted by the slave, and can guarantee that no
	--other accesses launched afterwards will be able to be reordered before it.

	--The BRESP bit [1] is used indicate any errors from the interconnect or
	--slave for the entire write burst. This example will capture the error.

	--While not necessary per spec, it is advisable to reset READY signals in
	--case of differing reset latencies between master/slave.

	process(M_AXI_ACLK)
	begin
		if (rising_edge (M_AXI_ACLK)) then
			if (M_AXI_ARESETN = '0') then
				axi_bready <= '0';
			else
				-- Always hold bready high to tell the AXI4 slave that we can always accept a write response
				axi_bready <= '1';
			end if;
		end if;
	end process;

	------------------------------
	-- Main controller read state machine (issues the read transaction and controls the AR channel)
	------------------------------
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			scanoutRequests_rd_en <= '0';
			ZStencilReadRequestsFIFO_rd_en <= '0';
			CommandProcReadRequestsFIFO_rd_en <= '0';
			VBCacheReadRequestsFIFO_rd_en <= '0';
			IBCacheReadRequestsFIFO_rd_en <= '0';
			PacketDMAReadRequestsFIFO_rd_en <= '0';
			TexFetchReadRequestsFIFO_rd_en <= '0';
			ROPReadRequestsFIFO_rd_en <= '0';
			axi_arvalid <= '0';

			if (M_AXI_ARESETN = '0') then
				currentReadControlState <= READCTRL_INIT;
			else
				case (currentReadControlState) is
					when READCTRL_INIT =>
						readSystem_idle <= '0';

						if (c0_init_calib_complete = '1') then
							currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
						end if;

					when READCTRL_HANDLE_INCOMING_MEMREQUEST =>
						readSystem_idle <= '0';

						-- These memory clients are ordered in order of most important (first) to least important (last)
						-- For example, SCANOUT always gets served first because if SCANOUT were to miss a memory read, it could cause screen glitches
						if (ScanoutReadRequestsFIFO_empty = '0' and ScanoutReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								SCANOUT, 
								ScanoutReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							scanoutRequests_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (ZStencilReadRequestsFIFO_empty = '0' and ZStencilReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								ZSTENCIL, 
								ZStencilReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							ZStencilReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (CommandProcReadRequestsFIFO_empty = '0' and CommandProcReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								COMMANDPROCESSOR, 
								CommandProcReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							CommandProcReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (IBCacheReadRequestsFIFO_empty = '0' and IBCacheReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								IBCACHE, 
								IBCacheReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							IBCacheReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (VBCacheReadRequestsFIFO_empty = '0' and VBCacheReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								VBCACHE, 
								VBCacheReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							VBCacheReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (PacketDMAReadRequestsFIFO_empty = '0' and PacketDMAReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								PACKETDMA, 
								PacketDMAReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							PacketDMAReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (TexFetchReadRequestsFIFO_empty = '0' and TexFetchReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								TEXTUREFETCH, 
								TexFetchReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							TexFetchReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						elsif (ROPReadRequestsFIFO_empty = '0' and ROPReadResponsesFIFO_full = '0') then
							QueueReadTransaction(newReadRequest, axi_araddr, axi_arvalid, M_AXI_ARID, 
								ROP, 
								ROPReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) );
							ROPReadRequestsFIFO_rd_en <= '1';
							currentReadControlState <= READCTRL_MEM_COOLDOWN;
						else
							readSystem_idle <= '1';
						end if;

					when READCTRL_MEM_COOLDOWN =>
						readSystem_idle <= '0';

						axi_arvalid <= '1';
						if (M_AXI_ARREADY = '1' and axi_arvalid = '1') then
							axi_arvalid <= '0';
							LastReadAddress <= newReadRequest.readAddress;
							LastReadMemoryClientIndex <= newReadRequest.memoryClientIndex;
							currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
						end if;

				end case;
			end if;
		end if;
	end process;

	------------------------------
	-- Main controller write state machine
	------------------------------
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			ZStencilWriteRequestsFIFO_rd_en <= '0';
			CommandProcWriteRequestsFIFO_rd_en <= '0';
			ROPWriteRequestsFIFO_rd_en <= '0';
			ClearBlockWriteRequestsFIFO_rd_en <= '0';
			StatsWriteRequestsFIFO_rd_en <= '0';
			PacketDMAWriteRequestsFIFO_rd_en <= '0';

			axi_awvalid <= '0';

			if (M_AXI_ARESETN = '0') then
				currentWriteControlState <= WRITECTRL_INIT;
			else
				case (currentWriteControlState) is
					when WRITECTRL_INIT =>
						writeSystem_idle <= '0';
						axi_wvalid <= '0';

						if (c0_init_calib_complete = '1') then
							currentWriteControlState <= WRITECTRL_HANDLE_INCOMING_WRITEREQUEST;
						end if;

					when WRITECTRL_HANDLE_INCOMING_WRITEREQUEST =>
						writeSystem_idle <= '0';

						if (axi_wvalid = '0' or
							(axi_wvalid = '1' and M_AXI_WREADY = '1') ) then

							-- If we have a write that is currently pending, then finish it up
							if (axi_wvalid = '1') then
								axi_wvalid <= '0';

								-- Write out our debug info
								LastWriteAddress <= newWriteRequest.writeAddress;
								LastWriteData <= newWriteRequest.writeData;
								LastWriteDataDWORDEnables <= newWriteRequest.writeDataDWORDEnables;
								LastWriteMemoryClientIndex <= newWriteRequest.memoryClientIndex;

								statMemWriteCountTransactions <= statMemWriteCountTransactions + 1;
								statMemWriteCountBytesTransferred <= statMemWriteCountBytesTransferred + to_integer(CountBytesInWriteTransaction(newWriteRequest.writeDataDWORDEnables) );
							end if;

							-- These memory clients are ordered in order of most important (first) to least important (last)
							if (ZStencilWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									ZSTENCIL,
									ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
								ZStencilWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (CommandProcWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									COMMANDPROCESSOR,
									CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
									CommandProcWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (ROPWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									ROP,
									ROPWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									ROPWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									ROPWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
								ROPWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (ClearBlockWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									CLEARBLOCK,
									ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
								ClearBlockWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (PacketDMAWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									PACKETDMA,
									PacketDMAWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									PacketDMAWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									PacketDMAWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
								PacketDMAWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (StatsWriteRequestsFIFO_empty = '0') then
								QueueWriteTransaction(newWriteRequest, axi_awaddr, axi_wdata, axi_wstrb, axi_awvalid, NextWriteTransactionID,
									STATS,
									StatsWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5),
									StatsWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32),
									StatsWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0) );
								StatsWriteRequestsFIFO_rd_en <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							else
								writeSystem_idle <= '1';
							end if;
						end if;

					when WRITECTRL_DEASSERT =>
						writeSystem_idle <= '0';
						axi_awvalid <= '1';

						if (axi_awvalid = '1' and M_AXI_AWREADY = '1') then
							axi_awvalid <= '0';
							axi_wvalid <= '1';

							currentWriteControlState <= WRITECTRL_HANDLE_INCOMING_WRITEREQUEST;
						end if;

				end case;
			end if;
		end if;
	end process;

	------------------------------
	-- Read response state machine (is always ready to process incoming read responses on the RR channel)
	------------------------------
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			ScanoutReadResponsesFIFO_wr_en <= '0';
			ZStencilReadResponsesFIFO_wr_en <= '0';
			CommandProcReadResponsesFIFO_wr_en <= '0';
			VBCacheReadResponsesFIFO_wr_en <= '0';
			IBCacheReadResponsesFIFO_wr_en <= '0';
			PacketDMAReadResponsesFIFO_wr_en <= '0';
			TexFetchReadResponsesFIFO_wr_en <= '0';
			ROPReadResponsesFIFO_wr_en <= '0';

			if (M_AXI_ARESETN = '0') then
				axi_rready <= '0';
			else
				axi_rready <= '1';
				if (M_AXI_RVALID = '1' and axi_rready = '1') then
					newReadResponse.readData <= M_AXI_RDATA;
					newReadResponse.readAddress <= newReadRequest.readAddress;
					newReadResponse.memoryClientIndex <= unsigned(M_AXI_RID);

					case (memoryClient'val(to_integer(unsigned(M_AXI_RID) ) ) ) is
						when SCANOUT =>
							ScanoutReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							ScanoutReadResponsesFIFO_wr_en <= '1';
						when ZSTENCIL =>
							ZStencilReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							ZStencilReadResponsesFIFO_wr_en <= '1';
						when COMMANDPROCESSOR =>
							CommandProcReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							CommandProcReadResponsesFIFO_wr_en <= '1';
						when IBCACHE =>
							IBCacheReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							IBCacheReadResponsesFIFO_wr_en <= '1';
						when VBCACHE =>
							VBCacheReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							VBCacheReadResponsesFIFO_wr_en <= '1';
						when PACKETDMA =>
							PacketDMAReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							PacketDMAReadResponsesFIFO_wr_en <= '1';
						when TEXTUREFETCH =>
							TexFetchReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							TexFetchReadResponsesFIFO_wr_en <= '1';
						when ROP =>
							ROPReadResponsesFIFO_wr_data <= M_AXI_RDATA;
							ROPReadResponsesFIFO_wr_en <= '1';
						when others =>
							-- Should never be here, just fall through and do nothing
					end case;

					statMemReadCountTransactions <= statMemReadCountTransactions + 1;
					statMemReadCountBytesTransferred <= statMemReadCountBytesTransferred + 32;

					if (unsigned(M_AXI_RID) /= to_unsigned(memoryClient'pos(SCANOUT), 4) ) then
						statMemReadCountNonScanoutTransactions <= statMemReadCountNonScanoutTransactions + 1;
						statMemReadCountNonScanoutBytesTransferred <= statMemReadCountNonScanoutBytesTransferred + 32;
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
