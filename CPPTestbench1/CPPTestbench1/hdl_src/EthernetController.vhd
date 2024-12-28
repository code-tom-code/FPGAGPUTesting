library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eCmpFunc enum type defined in there
library work;
use work.PacketType.all;

entity EthernetController is
	Port (
	-- 300MHz AXI4-Lite interface:
		m_axi4lite_clk : in STD_LOGIC;
		m_axi4lite_clklocked : in STD_LOGIC;

		m_axi4lite_araddr : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		m_axi4lite_arready : in STD_LOGIC;
		m_axi4lite_arvalid : out STD_LOGIC := '0';
		m_axi4lite_awaddr : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		m_axi4lite_awready : in STD_LOGIC;
		m_axi4lite_awvalid : out STD_LOGIC := '0';
		m_axi4lite_bready : out STD_LOGIC := '0';
		m_axi4lite_bresp : in STD_LOGIC_VECTOR(1 downto 0);
		m_axi4lite_bvalid : in STD_LOGIC;
		m_axi4lite_rdata : in STD_LOGIC_VECTOR(31 downto 0);
		m_axi4lite_rready : out STD_LOGIC := '0';
		m_axi4lite_rresp : in STD_LOGIC_VECTOR(1 downto 0);
		m_axi4lite_rvalid : in STD_LOGIC;
		m_axi4lite_wdata : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		m_axi4lite_wready : in STD_LOGIC;
		m_axi4lite_wstrb : out STD_LOGIC_VECTOR(3 downto 0) := (others => '1'); -- Always hold all of the byte-strobe bits high. We're only ever writing 32-bit values, so this is fine.
		m_axi4lite_wvalid : out STD_LOGIC := '0';
	-- End 300MHz AXI4-Lite interface

	-- 125MHz AXI4-Stream interfaces:
		m_axi4stream_clk : in STD_LOGIC;
		m_axi4stream_clklocked : in STD_LOGIC;

		m_axi4stream_tx_tdata : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		m_axi4stream_tx_tlast : out STD_LOGIC := '0';
		m_axi4stream_tx_tready : in STD_LOGIC;
		m_axi4stream_tx_tvalid : out STD_LOGIC := '0';
		m_axi4stream_tx_tkeep : out STD_LOGIC_VECTOR(3 downto 0) := (others => '1');

		m_axi4stream_rxd_tdata : in STD_LOGIC_VECTOR(31 downto 0);
		m_axi4stream_rxd_tlast : in STD_LOGIC;
		m_axi4stream_rxd_tready : out STD_LOGIC := '0';
		m_axi4stream_rxd_tvalid : in STD_LOGIC;
		m_axi4stream_rxd_tkeep : in STD_LOGIC_VECTOR(3 downto 0);

		m_axi4stream_rxs_tdata : in STD_LOGIC_VECTOR(31 downto 0);
		m_axi4stream_rxs_tlast : in STD_LOGIC;
		m_axi4stream_rxs_tready : out STD_LOGIC := '0';
		m_axi4stream_rxs_tvalid : in STD_LOGIC;
		m_axi4stream_rxs_tkeep : in STD_LOGIC_VECTOR(3 downto 0);

		m_axi4stream_txc_ctrl_tdata : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		m_axi4stream_txc_ctrl_tlast : out STD_LOGIC := '0';
		m_axi4stream_txc_ctrl_tready : in STD_LOGIC;
		m_axi4stream_txc_ctrl_tvalid : out STD_LOGIC := '0';
		m_axi4stream_txc_ctrl_tkeep : out STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
	-- End 125MHz AXI4-Stream interfaces

	-- Locked interfaces:
		rx_locked : in STD_LOGIC;
		tx_locked : in STD_LOGIC;
	-- End Locked interfaces

	-- Misc. interfaces:
		signal_detect : out STD_LOGIC := '0';

		-- RIU ports:
		riu_valid_1 : out STD_LOGIC := '0';
		riu_prsnt_1 : out STD_LOGIC := '0';
		riu_rddata_1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		riu_valid_2 : out STD_LOGIC := '0';
		riu_prsnt_2 : out STD_LOGIC := '0';
		riu_rddata_2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		riu_valid_3 : out STD_LOGIC := '0';
		riu_prsnt_3 : out STD_LOGIC := '0';
		riu_rddata_3 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		-- Delay ready signals:
		tx_dly_rdy_1 : out STD_LOGIC := '0';
		rx_dly_rdy_1 : out STD_LOGIC := '0';
		tx_vtc_rdy_1 : out STD_LOGIC := '0';
		rx_vtc_rdy_1 : out STD_LOGIC := '0';
		tx_dly_rdy_2 : out STD_LOGIC := '0';
		rx_dly_rdy_2 : out STD_LOGIC := '0';
		tx_vtc_rdy_2 : out STD_LOGIC := '0';
		rx_vtc_rdy_2 : out STD_LOGIC := '0';
		tx_dly_rdy_3 : out STD_LOGIC := '0';
		rx_dly_rdy_3 : out STD_LOGIC := '0';
		tx_vtc_rdy_3 : out STD_LOGIC := '0';
		rx_vtc_rdy_3 : out STD_LOGIC := '0';
	-- End Misc. interfaces

	-- Debug signals
		DBG_Eth_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0')
		);
end EthernetController;

architecture Behavioral of EthernetController is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_clk: SIGNAL is "xilinx.com:signal:clock:1.0 AXI4LiteClk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4lite_clk: SIGNAL is "FREQ_HZ 300000000";

ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_clk: SIGNAL is "xilinx.com:signal:clock:1.0 AXI4Stream CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4stream_clk: SIGNAL is "FREQ_HZ 125000000";

ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_awaddr: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite AWADDR";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_awvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite AWVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_awready: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite AWREADY";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_wdata: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite WDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_wstrb: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite WSTRB";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_wvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite WVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_wready: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite WREADY";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_bresp: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite BRESP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_bvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite BVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_bready: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite BREADY";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_araddr: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite ARADDR";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_arvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite ARVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_arready: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite ARREADY";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_rdata: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite RDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_rresp: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite RRESP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_rvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite RVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4lite_rready: SIGNAL is "xilinx.com:interface:aximm:1.0 AXI4Lite RREADY";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4lite_awaddr: SIGNAL is "CLK_DOMAIN m_axi4lite_clk,MAX_BURST_LENGTH 1,NUM_WRITE_OUTSTANDING 0,NUM_READ_OUTSTANDING 0,SUPPORTS_NARROW_BURST 0,READ_WRITE_MODE READ_WRITE,BUSER_WIDTH 0,RUSER_WIDTH 0,WUSER_WIDTH 0,ARUSER_WIDTH 0,AWUSER_WIDTH 0,ADDR_WIDTH 18,ID_WIDTH 0,FREQ_HZ 300000000,PROTOCOL AXI4LITE,DATA_WIDTH 32,HAS_BURST 0,HAS_CACHE 0,HAS_LOCK 0,HAS_PROT 0,HAS_QOS 0,HAS_REGION 0,HAS_WSTRB 1,HAS_BRESP 1,HAS_RRESP 1";

ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_tx_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXData TDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_tx_tkeep: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXData TKEEP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_tx_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXData TLAST";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_tx_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXData TVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_tx_tready: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXData TREADY";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4stream_tx_tdata: SIGNAL is "CLK_DOMAIN m_axi4stream_clk,FREQ_HZ 125000000,HAS_TLAST 1,HAS_TKEEP 1,HAS_TSTRB 0,HAS_TREADY 1,TUSER_WIDTH 0,TID_WIDTH 0,TDEST_WIDTH 0,TDATA_NUM_BYTES 4";

ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxd_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXData TDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxd_tkeep: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXData TKEEP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxd_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXData TLAST";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxd_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXData TVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxd_tready: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXData TREADY";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4stream_rxd_tdata: SIGNAL is "CLK_DOMAIN m_axi4stream_clk,FREQ_HZ 125000000,HAS_TLAST 1,HAS_TKEEP 1,HAS_TSTRB 0,HAS_TREADY 1,TUSER_WIDTH 0,TID_WIDTH 0,TDEST_WIDTH 0,TDATA_NUM_BYTES 4";

ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxs_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXStats TDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxs_tkeep: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXStats TKEEP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxs_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXStats TLAST";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxs_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXStats TVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_rxs_tready: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_RXStats TREADY";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4stream_rxs_tdata: SIGNAL is "CLK_DOMAIN m_axi4stream_clk,FREQ_HZ 125000000,HAS_TLAST 1,HAS_TKEEP 1,HAS_TSTRB 0,HAS_TREADY 1,TUSER_WIDTH 0,TID_WIDTH 0,TDEST_WIDTH 0,TDATA_NUM_BYTES 4";

ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_txc_ctrl_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXCtrl TDATA";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_txc_ctrl_tkeep: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXCtrl TKEEP";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_txc_ctrl_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXCtrl TLAST";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_txc_ctrl_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXCtrl TVALID";
ATTRIBUTE X_INTERFACE_INFO of m_axi4stream_txc_ctrl_tready: SIGNAL is "xilinx.com:interface:axis:1.0 AXI4Stream_TXCtrl TREADY";
ATTRIBUTE X_INTERFACE_PARAMETER of m_axi4stream_txc_ctrl_tdata: SIGNAL is "CLK_DOMAIN m_axi4stream_clk,FREQ_HZ 125000000,HAS_TLAST 1,HAS_TKEEP 1,HAS_TSTRB 0,HAS_TREADY 1,TUSER_WIDTH 0,TID_WIDTH 0,TDEST_WIDTH 0,TDATA_NUM_BYTES 4";

type EthStateType is 
(
	init, -- 0
	waitForClocksLocked, -- 1
	waitForResetDelay, -- 2 -- Wait for 16 microseconds (about 4920 cycles at 300MHz)
	waitForLockedTXRX, -- 3
	setupRegistersSetAddress, -- 4
	setupRegistersWaitForAckAddress, -- 5
	setupRegistersSetData, -- 6
	setupRegistersWaitForAckData, -- 7
	sendFirstPacket, -- 8
	readyState -- 9
);

type registerSetup is record
	registerAddress : unsigned(17 downto 0); -- 18 bit register address
	registerSetValue : unsigned(31 downto 0); -- 32 bit data to fill the register with
end record registerSetup;

constant NUM_REGISTERS_TO_SETUP : natural := 2;

type registerSetupList is array(0 to NUM_REGISTERS_TO_SETUP-1) of registerSetup;

constant registersToSetup : registerSetupList := (

	-- Set McstRej ("multicast reject") bit 1 to "true" to enable auto-rejecting all multicast packets (this means we don't need to configure the FMI register)
	-- TODO: Look into whether RxBadFrmEn ("Receive Bad Frame Enable") bit 14 should be set to "true" to accept bad packets during debugging of packet loss issues
	("000000000000000000", X"00000002"), -- Reset and Address Filter Register (0x0000_0000)

	-- Transmit Pause Frame Register (0x0000_0004)
	-- Transmit Inter Frame Gap Adjustment Register (0x0000_0008)
	-- Interrupt Status Register (0x0000_000C)
	-- Interrupt Pending Register (0x0000_0010)
	-- Interrupt Enable Register (0x0000_0014)
	-- Transmit VLAN Tag Register (0x0000_0018)
	-- Receive VLAN Tag Register (0x0000_001C)
	-- Unicast Address Word Lower Register (0x020)
	-- Unicast Address Word Upper Register (0x024)
	-- VLAN TPID Word 0 Register (0x0000_0028)
	-- VLAN TPID Word 1 Register (0x0000_002C)
	-- PCS PMA TEMAC Status Register (0x0000_0030)
	-- TEMAC Receive Configuration Word0 (RCW0) Register (0x400)
	-- TEMAC Receive Configuration Word1 (RCW1) Register (0x404)
	-- TEMAC Transmit Configuration Register (0x408)

	-- Set bit 30 and bit 29 to "false" to disable TX and RX flow control respectively.
	-- Set bit 20 ("TX Auto XON") to "false" to disable automatically sending XON flow control packets after a pause request gets dropped.
	-- Set bits 15:8 to 0x00 to disable all 8 TX Priority Flow Control (PFC) pause enables.
	-- Set bits 7:0 to 0x00 to disable all 8 RX Priority Flow Control (PFC) pause enables.
	("000000010000001100", X"00000000") -- TEMAC Flow Control Configuration Register (0x40C)

	-- TEMAC Ethernet MAC Speed Configuration Register (0x410)
	-- TEMAC Receive Max Frame Configuration Register (0x414)
	-- TEMAC Transmit Max Frame Configuration Register (0x418)
	-- TEMAC Transmitter Timestamp Adjust Control Register (0x41C)
	-- TEMAC ID Register (0x4F8?)
	-- TEMAC Ability Register (0x4FC?)
	-- TEMAC MDIO Setup Register (0x500?)
	-- TEMAC MDIO Control Register (0x504?)
	-- TEMAC MDIO Write Data Register (0x508?)
	-- TEMAC MDIO Read Data Register (0x50C?)
	-- TEMAC Interrupt Status Register (0x600?)
	-- TEMAC Interrupt Pending Register (0x610?)
	-- TEMAC Interrupt Enable Register (0x620?)
	-- TEMAC Interrupt Clear Register (0x630?)
	-- TEMAC Unicast Address Word 0 Register (0x700?)
	-- TEMAC Unicast Address Word 1 Register (0x704?)
	-- TEMAC Frame Filter Control Register (0x708?)
	-- TEMAC Frame Filter Enable Register (0x70C?)
	-- TEMAC Frame Filter Value Registers (0x710-0x750?)
);

type SendPacketDataArray is array(0 to 51) of unsigned(7 downto 0);

constant InitialSendPacket : SendPacketDataArray := (

-- Ethernet II Header begin:
	0 => X"44", -- Destination MAC address is the PC's MAC ID: 44:A8:42:FC:3C:93
	1 => X"A8",
	2 => X"42",
	3 => X"FC",
	4 => X"3C",
	5 => X"93",

	6 => X"00", -- Source MAC address is the FPGA's MAC ID: 00:0A:35:03:78:F1
	7 => X"0A",
	8 => X"35",
	9 => X"03",
	10 => X"78",
	11 => X"F1",

	12 => X"08", -- EtherType 0x0800 indicates IPv4
	13 => X"00",
-- Ethernet II Frame end

-- IPv4 Header begin:
	14 => X"45", -- IP version 4, IPv4 header length = 5 DWORD's (20 bytes). This must be set to exactly 0x45 or else we won't get TCP/UDP checksum offloading!
	15 => X"00", -- DSCN is 6 bits, all zeroes for "Standard" mode, and ECN is 2 bits, also all zeroes for a standard packet.
	16 => X"00", -- IPv4 Packet length, high 8 bits
	17 => X"26", -- IPv4 Packet length, low 8 bits (includes header size, minimum of 20 bytes for an empty packet with minimal header)
	18 => X"00", -- Packet ID, high 8 bits
	19 => X"00", -- Packet ID, low 8 bits. The packet ID needs to be unique for each packet, so use an incrementing counter to fill this 16-bit value.
	20 => X"40", -- Flags (top bit is reserved and must be zero, next bit is the "Don't Fragment" bit, which is set to 1, and below that is the "More Fragments" bit, which is set to 0). The remaining 5 bits are the high bits of the Fragment Offset.
	21 => X"00", -- Fragment Offset lower 8 bits. All are set to zero because we don't want to deal with packet fragmentation.
	22 => X"7F", -- TTL is set to 127 by default
	23 => X"11", -- IPv4 Protocol number is set to 0x11 (this is decimal 17) to select UDP.
	24 => X"00", -- IPv4 Checksum high 8 bits
	25 => X"00", -- IPv4 Checksum low 8 bits. The checksum field is the 16 bit one's complement of the one's complement sum of all 16 bit words in the header. For purposes of computing the checksum, the value of the checksum field is zero.
	26 => X"C0", -- Source IPv4 Address (first byte)
	27 => X"A8", -- Source IPv4 Address (second byte)
	28 => X"01", -- Source IPv4 Address (third byte)
	29 => X"AA", -- Source IPv4 Address (fourth byte). Our source IP for the FPGA should always be 192.168.1.170 .
	30 => X"C0", -- Destination IPv4 Address (first byte)
	31 => X"A8", -- Destination IPv4 Address (second byte)
	32 => X"01", -- Destination IPv4 Address (third byte)
	33 => X"9E", -- Destination IPv4 Address (fourth byte). Our destination IP should always be the PC's IP address at 192.168.1.158 .
-- IPv4 Header end

-- UDP Header begin:
	34 => X"0C", -- UDP Source Port (high 8 bits)
	35 => X"38", -- UDP Source Port (low 8 bits). Let's use port 3128 as our source port.
	36 => X"0C", -- UDP Destination Port (high 8 bits)
	37 => X"38", -- UDP Destination Port (low 8 bits). Let's use port 3128 as our destination port.
	38 => X"00", -- UDP Packet Length (high 8 bits)
	39 => X"12", -- UDP Packet Length (low 8 bits). The packet length includes the 8-byte UDP header so it is always at least 8.
	40 => X"00", -- UDP Packet Checksum (high 8 bits)
	41 => X"00", -- UDP Packet Checksum (low 8 bits). Leave this as zero to enable UDP checksum offloading to fill in the correct value.
-- UDP Header end:

-- UDP Data Payload begin:
	42 => X"0A",
	43 => X"0B",
	44 => X"0C",
	45 => X"0D",
	46 => X"0E",
	47 => X"0F",
	48 => X"00",
	49 => X"01",
	50 => X"02",
	51 => X"03"
-- UDP Data Payload end
);

constant DefaultResetDelay : unsigned(12 downto 0) := to_unsigned(4920, 13); -- Set to 4920 cycles (a bit over 16 microseconds at 300MHz)

-- Master state machine signals:
signal currentState : EthStateType := init;
signal resetDelayCycles : unsigned(12 downto 0) := (others => '0');
signal currentSetRegister : unsigned(1 downto 0) := (others => '0');
signal controllerIsReadyForData : std_logic := '0';
signal axi4lite_bready : std_logic := '0';
signal axi4lite_awvalid : std_logic := '0';
signal axi4lite_wvalid : std_logic := '0';

-- Send process signals:
signal axi4stream_tx_valid : std_logic := '0';
signal initialPacketSendPtr : unsigned(4 downto 0) := (others => '0');
signal sendFirstPacketComplete : std_logic := '0';

begin

m_axi4lite_bready <= axi4lite_bready;
m_axi4lite_awvalid <= axi4lite_awvalid;
m_axi4lite_wvalid <= axi4lite_wvalid;
m_axi4stream_tx_tvalid <= axi4stream_tx_valid;
DBG_Eth_State <= std_logic_vector(to_unsigned(EthStateType'pos(currentState), 5) );

	bready_process: process(m_axi4lite_clk)
	begin
		if (rising_edge (m_axi4lite_clk) ) then
			if (m_axi4lite_bvalid = '1' and axi4lite_bready = '0') then
				-- accept/acknowledge bresp with axi4lite_bready by the master
				-- when m_axi4lite_bvalid is asserted by slave
				axi4lite_bready <= '1';
			elsif (axi4lite_bready = '1') then
				-- deassert after one clock cycle
				axi4lite_bready <= '0';
			end if;
		end if;
	end process bready_process;

	mainStateMachineAXI4Lite: process(m_axi4lite_clk)
	begin
		if (rising_edge(m_axi4lite_clk) ) then
			case currentState is
				when init =>
					currentState <= waitForClocksLocked;

				when waitForClocksLocked =>
					if (m_axi4lite_clklocked = '1' and m_axi4stream_clklocked = '1') then
						resetDelayCycles <= DefaultResetDelay;
						currentState <= waitForResetDelay;
					end if;

				when waitForResetDelay =>
					resetDelayCycles <= resetDelayCycles - 1;
					if (resetDelayCycles = 0) then
						currentSetRegister <= (others => '0');
						currentState <= waitForLockedTXRX;
					end if;

				when waitForLockedTXRX =>
					if (rx_locked = '1' and tx_locked = '1') then
						currentState <= setupRegistersSetAddress;
					end if;

				when setupRegistersSetAddress =>
					m_axi4lite_awaddr <= std_logic_vector(registersToSetup(to_integer(currentSetRegister) ).registerAddress);
					axi4lite_awvalid <= '1';
					currentState <= setupRegistersWaitForAckAddress;

				when setupRegistersWaitForAckAddress =>
					if (axi4lite_awvalid = '1' and m_axi4lite_awready = '1') then
						axi4lite_awvalid <= '0';
						currentState <= setupRegistersSetData;
					end if;

				when setupRegistersSetData =>
					m_axi4lite_wdata <= std_logic_vector(registersToSetup(to_integer(currentSetRegister) ).registerSetValue);
					axi4lite_wvalid <= '1';
					currentState <= setupRegistersWaitForAckData;

				when setupRegistersWaitForAckData =>
					if (axi4lite_wvalid = '1' and m_axi4lite_wready = '1') then
						axi4lite_wvalid <= '0';
						if (currentSetRegister < (NUM_REGISTERS_TO_SETUP-1) ) then
							currentSetRegister <= currentSetRegister + 1; -- Increment our register index
							currentState <= setupRegistersSetAddress;
						else
							currentSetRegister <= (others => '0');
							currentState <= sendFirstPacket;
						end if;
					end if;

				when sendFirstPacket =>
					-- Wait for the first packet to be sent before moving on to the ready state
					if (sendFirstPacketComplete = '1') then
						currentState <= readyState;
					end if;

				when readyState =>
					controllerIsReadyForData <= '1';
					-- Do nothing. We're ready to send and receive data now!

			end case;
		end if;
	end process mainStateMachineAXI4Lite;

	send_data_process: process(m_axi4stream_clk)
	begin
		if (rising_edge(m_axi4stream_clk) ) then
			if (controllerIsReadyForData = '1') then
			elsif (currentState = sendFirstPacket) then
				if (initialPacketSendPtr < 52) then
					if (initialPacketSendPtr >= 48) then
						m_axi4stream_tx_tlast <= '1';
					else
						m_axi4stream_tx_tlast <= '0';
					end if;
					m_axi4stream_tx_tdata(31 downto 24) <= std_logic_vector(InitialSendPacket(to_integer(initialPacketSendPtr) ) ); -- Send the high byte first (this is big_endian network order)
					m_axi4stream_tx_tdata(23 downto 16) <= std_logic_vector(InitialSendPacket(to_integer(initialPacketSendPtr + 1) ) );
					m_axi4stream_tx_tdata(15 downto 8) <= std_logic_vector(InitialSendPacket(to_integer(initialPacketSendPtr + 2) ) );
					m_axi4stream_tx_tdata(7 downto 0) <= std_logic_vector(InitialSendPacket(to_integer(initialPacketSendPtr + 3) ) );
					axi4stream_tx_valid <= '1';

					if (axi4stream_tx_valid = '1' and m_axi4stream_tx_tready = '1') then
						initialPacketSendPtr <= initialPacketSendPtr + 4; -- Advance one DWORD at a time
						axi4stream_tx_valid <= '0';
					end if;
				else
					sendFirstPacketComplete <= '1';
				end if;
			end if;
		end if;
	end process send_data_process;

	recv_data_process: process(m_axi4stream_clk)
	begin
		if (rising_edge(m_axi4stream_clk) ) then
			if (controllerIsReadyForData = '1') then
				if (m_axi4stream_rxd_tvalid = '1') then
					m_axi4stream_rxd_tready <= '1'; -- Blindly receive packet data and then do nothing with it
				else
					m_axi4stream_rxd_tready <= '0';
				end if;
			end if;
		end if;
	end process recv_data_process;

	recv_stats_process: process(m_axi4stream_clk)
	begin
		if (rising_edge(m_axi4stream_clk) ) then
			if (controllerIsReadyForData = '1') then
				if (m_axi4stream_rxs_tvalid = '1') then
					m_axi4stream_rxs_tready <= '1'; -- Blindly receive data on the stats channel and then do nothing with it
				else
					m_axi4stream_rxs_tready <= '0';
				end if;
			end if;
		end if;
	end process recv_stats_process;

end Behavioral;
