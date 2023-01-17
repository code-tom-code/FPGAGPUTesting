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
		ScanoutReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		ScanoutReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ZStencil system incoming read requests FIFO:
        ZStencilReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        ZStencilReadRequestsFIFO_empty : in STD_LOGIC;
        ZStencilReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- ZStencil system returned read responses FIFO:
		ZStencilReadResponsesFIFO_full : in STD_LOGIC;
		ZStencilReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
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
		CommandProcReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		CommandProcReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Command Processor system incoming write requests FIFO:
        CommandProcWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto 0);
        CommandProcWriteRequestsFIFO_empty : in STD_LOGIC;
        CommandProcWriteRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Input Assembler (IA) system incoming read requests FIFO:
        IAReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        IAReadRequestsFIFO_empty : in STD_LOGIC;
        IAReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Input Assembler (IA) system returned read responses FIFO:
		IAReadResponsesFIFO_full : in STD_LOGIC;
		IAReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		IAReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Index Buffer Pretransform Cache (IBC) system incoming read requests FIFO:
        IBCPreReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        IBCPreReadRequestsFIFO_empty : in STD_LOGIC;
        IBCPreReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Index Buffer Pretransform Cache (IBC) system returned read responses FIFO:
		IBCPreReadResponsesFIFO_full : in STD_LOGIC;
		IBCPreReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		IBCPreReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Index Buffer Posttransform Cache (IBC) system incoming read requests FIFO:
        IBCPostReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        IBCPostReadRequestsFIFO_empty : in STD_LOGIC;
        IBCPostReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Index Buffer Posttransform Cache (IBC) system returned read responses FIFO:
		IBCPostReadResponsesFIFO_full : in STD_LOGIC;
		IBCPostReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		IBCPostReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- Texture fetch incoming read requests FIFO:
        TexFetchReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        TexFetchReadRequestsFIFO_empty : in STD_LOGIC;
        TexFetchReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- Texture fetch returned read responses FIFO:
		TexFetchReadResponsesFIFO_full : in STD_LOGIC;
		TexFetchReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
		TexFetchReadResponsesFIFO_wr_en : out STD_LOGIC := '0';

	-- ROP system incoming read requests FIFO:
        ROPReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0);
        ROPReadRequestsFIFO_empty : in STD_LOGIC;
        ROPReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

	-- ROP system returned read responses FIFO:
		ROPReadResponsesFIFO_full : in STD_LOGIC;
		ROPReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
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
		DBG_ReadState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_WriteState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_ReadControlState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_WriteControlState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_NewReadEnable : out STD_LOGIC := '0';
		DBG_NewReadDataReady : out STD_LOGIC := '0';
		DBG_ReadyForNewRead : out STD_LOGIC := '0';
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
		DBG_WriteRequestsEmptyBitmask : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
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

	ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPreReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPreReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPreReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPreReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPreReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCPreReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPreReadResponses FULL";

	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPostReadRequests RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPostReadRequests RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCPostReadRequests EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPostReadResponses WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPostReadResponses WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of IBCPostReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCPostReadResponses FULL";

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
						IA, -- 3
						TEXTUREFETCH, -- 4
						ROP, -- 5
						CLEARBLOCK, -- 6
						STATS, -- 7
						IBCPRE, -- 8
						IBCPOST -- 9
						);

	type readState is ( READ_INIT, -- 0
						READ_WAIT_FOR_MEM_READY, -- 1
						READ_WRITE_AND_CHECK_STATUS -- 2
						);

	type writeState is ( WRITE_INIT, -- 0
						WRITE_WAIT_FOR_WRITE, -- 1
						WRITE_CHECK_STATUS -- 2
						);

	type readControlState is ( READCTRL_INIT, -- 0
						READCTRL_HANDLE_INCOMING_MEMREQUEST, -- 1
						READCTRL_ROUTE_MEMRESPONSE -- 2
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

	signal currentReadState : readState := READ_INIT;
	signal currentWriteState : writeState := WRITE_INIT;
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
	signal newReadEnable : std_logic := '0'; -- Written to by the packet processor process, read from by the AXI read process
	signal newReadDataReady : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process
	signal readyForNewRead : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process

	signal LastReadAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal LastReadMemoryClientIndex : unsigned(3 downto 0) := (others => '0');

	-- Write system signals
	signal newWriteEnable : std_logic := '0';
	signal readyForNewWrite : std_logic := '0';

	signal LastWriteAddress : STD_LOGIC_VECTOR(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal LastWriteData : STD_LOGIC_VECTOR(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal LastWriteDataDWORDEnables : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal LastWriteMemoryClientIndex : unsigned(3 downto 0) := (others => '0');

	signal statMemReadCyclesIdle : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCyclesWorking : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCyclesIdle : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCyclesWorking : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountTransactions : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountNonScanoutBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemReadCountNonScanoutTransactions : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCountBytesTransferred : unsigned(31 downto 0) := (others => '0');
	signal statMemWriteCountTransactions : unsigned(31 downto 0) := (others => '0');

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

	DBG_ReadState <= std_logic_vector(to_unsigned(readState'pos(currentReadState), 4) );
	DBG_WriteState <= std_logic_vector(to_unsigned(writeState'pos(currentWriteState), 4) );
	DBG_ReadControlState <= std_logic_vector(to_unsigned(readControlState'pos(currentReadControlState), 4) );
	DBG_WriteControlState <= std_logic_vector(to_unsigned(writeControlState'pos(currentWriteControlState), 4) );
	DBG_NewReadEnable <= newReadEnable;
	DBG_NewReadDataReady <= newReadDataReady;
	DBG_ReadyForNewRead <= readyForNewRead;
	DBG_ScanoutReadRequests_Empty <= ScanoutReadRequestsFIFO_empty;
	DBG_ScanoutReadResponses_Full <= ScanoutReadResponsesFIFO_full;
	DBG_ScanoutReadRequests_rd_en <= scanoutRequests_rd_en;

	DBG_LastWriteAddress <= LastWriteAddress;
	DBG_LastWriteData <= LastWriteData;
	DBG_LastWriteDataDWORDEnables <= LastWriteDataDWORDEnables;
	DBG_LastWriteMemoryClientIndex <= std_logic_vector(LastWriteMemoryClientIndex);
	DBG_LastReadAddress <= LastReadAddress;
	DBG_LastReadMemoryClientIndex <= std_logic_vector(LastReadMemoryClientIndex);
	DBG_ReadRequestsEmptyBitmask <= ROPReadRequestsFIFO_empty & TexFetchReadRequestsFIFO_empty & IBCPostReadRequestsFIFO_empty & IBCPreReadRequestsFIFO_empty &
		IAReadRequestsFIFO_empty & CommandProcReadRequestsFIFO_empty & ZStencilReadRequestsFIFO_empty & ScanoutReadRequestsFIFO_empty;
	DBG_WriteRequestsEmptyBitmask <= StatsWriteRequestsFIFO_empty & ClearBlockWriteRequestsFIFO_empty & ROPWriteRequestsFIFO_empty & CommandProcWriteRequestsFIFO_empty & ZStencilWriteRequestsFIFO_empty;
	DBG_ReadResponsesFullBitmask <= ROPReadResponsesFIFO_full & TexFetchReadResponsesFIFO_full & IBCPostReadResponsesFIFO_full & IBCPreReadResponsesFIFO_full &
		IAReadResponsesFIFO_full & CommandProcReadResponsesFIFO_full & ZStencilReadResponsesFIFO_full & ScanoutReadResponsesFIFO_full;

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
				if (M_AXI_BVALID = '1' and axi_bready = '0') then              
					-- accept/acknowledge bresp with axi_bready by the master    
					-- when M_AXI_BVALID is asserted by slave                    
					axi_bready <= '1';                                          
				elsif (axi_bready = '1') then                                  
					-- deassert after one clock cycle                            
					axi_bready <= '0';                                           
				end if;                                                        
			end if;                                                          
		end if;                                                            
	end process;

	------------------------------
	-- Main controller read state machine
	------------------------------
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			if (M_AXI_ARESETN = '0') then
				currentReadControlState <= READCTRL_INIT;
			else
				case (currentReadControlState) is
					when READCTRL_INIT =>
						newReadEnable <= '0';
						readSystem_idle <= '0';

						scanoutRequests_rd_en <= '0';
						ZStencilReadRequestsFIFO_rd_en <= '0';
						CommandProcReadRequestsFIFO_rd_en <= '0';
						IAReadRequestsFIFO_rd_en <= '0';
						IBCPreReadRequestsFIFO_rd_en <= '0';
						IBCPostReadRequestsFIFO_rd_en <= '0';
						TexFetchReadRequestsFIFO_rd_en <= '0';
						ROPReadRequestsFIFO_rd_en <= '0';

						ScanoutReadResponsesFIFO_wr_en <= '0';
						ZStencilReadResponsesFIFO_wr_en <= '0';
						CommandProcReadResponsesFIFO_wr_en <= '0';
						IAReadResponsesFIFO_wr_en <= '0';
						IBCPreReadResponsesFIFO_wr_en <= '0';
						IBCPostReadResponsesFIFO_wr_en <= '0';
						TexFetchReadResponsesFIFO_wr_en <= '0';
						ROPReadResponsesFIFO_wr_en <= '0';

						if (c0_init_calib_complete = '1') then
							currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
						end if;

					when READCTRL_HANDLE_INCOMING_MEMREQUEST =>
						readSystem_idle <= '0';

						-- Deassert all of these after one clock cycle
						ScanoutReadResponsesFIFO_wr_en <= '0';
						ZStencilReadResponsesFIFO_wr_en <= '0';
						CommandProcReadResponsesFIFO_wr_en <= '0';
						IAReadResponsesFIFO_wr_en <= '0';
						IBCPreReadResponsesFIFO_wr_en <= '0';
						IBCPreReadResponsesFIFO_wr_en <= '0';
						TexFetchReadResponsesFIFO_wr_en <= '0';
						ROPReadResponsesFIFO_wr_en <= '0';

						if (readyForNewRead = '1') then

							-- These memory clients are ordered in order of most important (first) to least important (last)
							-- For example, SCANOUT always gets served first because if SCANOUT were to miss a memory read, it could cause screen glitches
							if (ScanoutReadRequestsFIFO_empty = '0' and ScanoutReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= ScanoutReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								scanoutRequests_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(SCANOUT), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (ZStencilReadRequestsFIFO_empty = '0' and ZStencilReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= ZStencilReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								ZStencilReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(ZSTENCIL), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (CommandProcReadRequestsFIFO_empty = '0' and CommandProcReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= CommandProcReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								CommandProcReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(COMMANDPROCESSOR), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (IBCPreReadRequestsFIFO_empty = '0' and IBCPreReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= IBCPreReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								IBCPreReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(IBCPRE), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (IAReadRequestsFIFO_empty = '0' and IAReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= IAReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								IAReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(IA), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (IBCPostReadRequestsFIFO_empty = '0' and IBCPostReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= IBCPostReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								IBCPostReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(IBCPOST), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (TexFetchReadRequestsFIFO_empty = '0' and TexFetchReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= TexFetchReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								TexFetchReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(TEXTUREFETCH), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							elsif (ROPReadRequestsFIFO_empty = '0' and ROPReadResponsesFIFO_full = '0') then
								newReadRequest.readAddress <= ROPReadRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH-1 downto 5) & "00000";
								ROPReadRequestsFIFO_rd_en <= '1';
								newReadRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(ROP), 4);
								newReadEnable <= '1';
								currentReadControlState <= READCTRL_ROUTE_MEMRESPONSE;
							else
								newReadEnable <= '0';
								readSystem_idle <= '1';
								currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
							end if;
						else
							newReadEnable <= '0';

							scanoutRequests_rd_en <= '0';
							ZStencilReadRequestsFIFO_rd_en <= '0';
							CommandProcReadRequestsFIFO_rd_en <= '0';
							IAReadRequestsFIFO_rd_en <= '0';
							IBCPreReadRequestsFIFO_rd_en <= '0';
							IBCPostReadRequestsFIFO_rd_en <= '0';
							TexFetchReadRequestsFIFO_rd_en <= '0';
							ROPReadRequestsFIFO_rd_en <= '0';

							currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
						end if;

					when READCTRL_ROUTE_MEMRESPONSE =>
						-- Deassert all of these after one clock cycle
						newReadEnable <= '0';
						scanoutRequests_rd_en <= '0';
						ZStencilReadRequestsFIFO_rd_en <= '0';
						CommandProcReadRequestsFIFO_rd_en <= '0';
						IAReadRequestsFIFO_rd_en <= '0';
						IBCPreReadRequestsFIFO_rd_en <= '0';
						IBCPostReadRequestsFIFO_rd_en <= '0';
						TexFetchReadRequestsFIFO_rd_en <= '0';
						ROPReadRequestsFIFO_rd_en <= '0';

						LastReadAddress <= newReadRequest.readAddress;
						LastReadMemoryClientIndex <= newReadRequest.memoryClientIndex;

						if (newReadDataReady = '1') then
							case (memoryClient'val(to_integer(newReadResponse.memoryClientIndex) ) ) is
								when SCANOUT =>
									ScanoutReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									ScanoutReadResponsesFIFO_wr_en <= '1';
								when ZSTENCIL =>
									ZStencilReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									ZStencilReadResponsesFIFO_wr_en <= '1';
								when COMMANDPROCESSOR =>
									CommandProcReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									CommandProcReadResponsesFIFO_wr_en <= '1';
								when IBCPRE =>
									IBCPreReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									IBCPreReadResponsesFIFO_wr_en <= '1';
								when IA =>
									IAReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									IAReadResponsesFIFO_wr_en <= '1';
								when IBCPOST =>
									IBCPostReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									IBCPostReadResponsesFIFO_wr_en <= '1';
								when TEXTUREFETCH =>
									TexFetchReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									TexFetchReadResponsesFIFO_wr_en <= '1';
								when ROP =>
									ROPReadResponsesFIFO_wr_data <= X"0000000" & "00" & newReadResponse.readData;
									ROPReadResponsesFIFO_wr_en <= '1';
								when others =>
									-- Should never be here, just fall through and do nothing
							end case;

							statMemReadCountTransactions <= statMemReadCountTransactions + 1;
							statMemReadCountBytesTransferred <= statMemReadCountBytesTransferred + 32;

							if (newReadResponse.memoryClientIndex /= to_unsigned(memoryClient'pos(SCANOUT), 4) ) then
								statMemReadCountNonScanoutTransactions <= statMemReadCountNonScanoutTransactions + 1;
								statMemReadCountNonScanoutBytesTransferred <= statMemReadCountNonScanoutBytesTransferred + 32;
							end if;

							currentReadControlState <= READCTRL_HANDLE_INCOMING_MEMREQUEST;
						else
							ScanoutReadResponsesFIFO_wr_en <= '0';
							ZStencilReadResponsesFIFO_wr_en <= '0';
							CommandProcReadResponsesFIFO_wr_en <= '0';
							IAReadResponsesFIFO_wr_en <= '0';
							IBCPreReadResponsesFIFO_wr_en <= '0';
							IBCPostReadResponsesFIFO_wr_en <= '0';
							TexFetchReadResponsesFIFO_wr_en <= '0';
							ROPReadResponsesFIFO_wr_en <= '0';
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
			if (M_AXI_ARESETN = '0') then
				currentWriteControlState <= WRITECTRL_INIT;
			else
				case (currentWriteControlState) is
					when WRITECTRL_INIT =>
						newWriteEnable <= '0';
						writeSystem_idle <= '0';

						ZStencilWriteRequestsFIFO_rd_en <= '0';
						CommandProcWriteRequestsFIFO_rd_en <= '0';
						ROPWriteRequestsFIFO_rd_en <= '0';
						ClearBlockWriteRequestsFIFO_rd_en <= '0';
						StatsWriteRequestsFIFO_rd_en <= '0';

						if (c0_init_calib_complete = '1') then
							currentWriteControlState <= WRITECTRL_HANDLE_INCOMING_WRITEREQUEST;
						end if;

					when WRITECTRL_HANDLE_INCOMING_WRITEREQUEST =>
						writeSystem_idle <= '0';

						if (readyForNewWrite = '1') then

							-- These memory clients are ordered in order of most important (first) to least important (last)
							if (ZStencilWriteRequestsFIFO_empty = '0') then
								newWriteRequest.writeAddress <= ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5) & "00000";
								newWriteRequest.writeData <= ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32);
								newWriteRequest.writeDataDWORDEnables <= ZStencilWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0);
								ZStencilWriteRequestsFIFO_rd_en <= '1';
								newWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(ZSTENCIL), 4);
								newWriteEnable <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (CommandProcWriteRequestsFIFO_empty = '0') then
								newWriteRequest.writeAddress <= CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5) & "00000";
								newWriteRequest.writeData <= CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32);
								newWriteRequest.writeDataDWORDEnables <= CommandProcWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0);
								CommandProcWriteRequestsFIFO_rd_en <= '1';
								newWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(COMMANDPROCESSOR), 4);
								newWriteEnable <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (ROPWriteRequestsFIFO_empty = '0') then
								newWriteRequest.writeAddress <= ROPWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5) & "00000";
								newWriteRequest.writeData <= ROPWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32);
								newWriteRequest.writeDataDWORDEnables <= ROPWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0);
								ROPWriteRequestsFIFO_rd_en <= '1';
								newWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(ROP), 4);
								newWriteEnable <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (ClearBlockWriteRequestsFIFO_empty = '0') then
								newWriteRequest.writeAddress <= ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5) & "00000";
								newWriteRequest.writeData <= ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32);
								newWriteRequest.writeDataDWORDEnables <= ClearBlockWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0);
								ClearBlockWriteRequestsFIFO_rd_en <= '1';
								newWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(CLEARBLOCK), 4);
								newWriteEnable <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							elsif (StatsWriteRequestsFIFO_empty = '0') then
								newWriteRequest.writeAddress <= StatsWriteRequestsFIFO_rd_data(C_M_AXI_ADDR_WIDTH+C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32+5) & "00000";
								newWriteRequest.writeData <= StatsWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH+C_M_AXI_DATA_WIDTH/32-1 downto C_M_AXI_DATA_WIDTH/32);
								newWriteRequest.writeDataDWORDEnables <= StatsWriteRequestsFIFO_rd_data(C_M_AXI_DATA_WIDTH/32-1 downto 0);
								StatsWriteRequestsFIFO_rd_en <= '1';
								newWriteRequest.memoryClientIndex <= to_unsigned(memoryClient'pos(STATS), 4);
								newWriteEnable <= '1';
								currentWriteControlState <= WRITECTRL_DEASSERT;
							else
								newWriteEnable <= '0';
								writeSystem_idle <= '1';
							end if;
						else
							newWriteEnable <= '0';
						end if;

					when WRITECTRL_DEASSERT =>
						-- Deassert all of these after one clock cycle
						newWriteEnable <= '0';
						ZStencilWriteRequestsFIFO_rd_en <= '0';
						CommandProcWriteRequestsFIFO_rd_en <= '0';
						ROPWriteRequestsFIFO_rd_en <= '0';
						ClearBlockWriteRequestsFIFO_rd_en <= '0';
						StatsWriteRequestsFIFO_rd_en <= '0';

						-- Write out our debug info
						LastWriteAddress <= newWriteRequest.writeAddress;
						LastWriteData <= newWriteRequest.writeData;
						LastWriteDataDWORDEnables <= newWriteRequest.writeDataDWORDEnables;
						LastWriteMemoryClientIndex <= newWriteRequest.memoryClientIndex;

						statMemWriteCountTransactions <= statMemWriteCountTransactions + 1;
						statMemWriteCountBytesTransferred <= statMemWriteCountBytesTransferred + to_integer(CountBytesInWriteTransaction(newWriteRequest.writeDataDWORDEnables) );

						currentWriteControlState <= WRITECTRL_HANDLE_INCOMING_WRITEREQUEST;
				end case;
			end if;
		end if;
	end process;

	------------------------------
	-- Read state machine
	------------------------------
	process(M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			if (M_AXI_ARESETN = '0') then
				currentReadState <= READ_INIT;
			else
				case (currentReadState) is
					when READ_INIT =>
						axi_araddr <= (others => '0');
						axi_arvalid <= '0';
						axi_rready <= '0';
						newReadDataReady <= '0';
						readyForNewRead <= '0';
						currentReadState <= READ_WAIT_FOR_MEM_READY;

					when READ_WAIT_FOR_MEM_READY =>
						newReadDataReady <= '0';
						if (newReadEnable = '1' and readyForNewRead = '1') then
							axi_araddr <= newReadRequest.readAddress;
							axi_arvalid <= '1';
							readyForNewRead <= '0';
							currentReadState <= READ_WRITE_AND_CHECK_STATUS;
						else
							axi_araddr <= (others => '0');
							axi_rready <= '0';
							axi_arvalid <= '0';
							readyForNewRead <= '1';
						end if;

					when READ_WRITE_AND_CHECK_STATUS =>
						readyForNewRead <= '0';
						if (axi_arvalid = '1' and M_AXI_ARREADY = '1') then
							axi_rready <= '1';
							axi_arvalid <= '0';
						end if;
						if (M_AXI_RVALID = '1' and axi_rready = '1') then
							axi_rready <= '0';
							newReadResponse.readData <= M_AXI_RDATA;
							newReadResponse.readAddress <= newReadRequest.readAddress;
							newReadResponse.memoryClientIndex <= newReadRequest.memoryClientIndex;
							newReadDataReady <= '1';
							currentReadState <= READ_WAIT_FOR_MEM_READY;
						end if;
				end case;
			end if;
		end if;
	end process;

	------------------------------
	-- Write state machine
	------------------------------
	process (M_AXI_ACLK)
	begin
		if (rising_edge(M_AXI_ACLK)) then
			if (M_AXI_ARESETN = '0') then
				currentWriteState <= WRITE_INIT;
			else
				case (currentWriteState) is
					when WRITE_INIT =>
						readyForNewWrite <= '0';
						axi_awaddr <= (others => '0');
						axi_wdata <= (others => '0');
						axi_wstrb <= (others => '1');
						axi_awvalid <= '0';
						axi_wvalid <= '0';
						currentWriteState <= WRITE_WAIT_FOR_WRITE;

					when WRITE_WAIT_FOR_WRITE =>
						if (newWriteEnable = '1') then
							readyForNewWrite <= '0';
							axi_awaddr <= newWriteRequest.writeAddress;
							axi_wdata <= newWriteRequest.writeData;
							axi_wstrb <= ExpandDWORDMaskToByteMask(newWriteRequest.writeDataDWORDEnables);
							axi_awvalid <= '1';
							currentWriteState <= WRITE_CHECK_STATUS;
						else
							readyForNewWrite <= '1';
							axi_awaddr <= (others => '0');
							axi_wdata <= (others => '0');
							axi_wstrb <= (others => '1');
							axi_awvalid <= '0';
						end if;

					when WRITE_CHECK_STATUS =>
						readyForNewWrite <= '0';
						if (M_AXI_AWREADY = '1' and axi_awvalid = '1') then
							axi_awvalid <= '0';
							axi_wvalid <= '1';
						end if;
						if (M_AXI_WREADY = '1' and axi_wvalid = '1') then
							axi_awvalid <= '0';
							axi_wvalid <= '0';
							axi_awaddr <= (others => '0');
							axi_wdata <= (others => '0');

							currentWriteState <= WRITE_WAIT_FOR_WRITE;
						end if;
				end case;
			end if;
		end if;
	end process;

end Behavioral;
