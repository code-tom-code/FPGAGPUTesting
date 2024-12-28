library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetProtoHelpers_Core.all;
use work.NetProtoHelpers_MAC.all;
use work.NetProtoHelpers_IPv4.all;
use work.NetProtoHelpers_UDP.all;
use work.NetProtoHelpers_ARP.all;

entity EthernetController3 is
	Generic (
		-- Number of bytes/clocks between sent frames required by the spec. Set lower values to overdrive the PHY.
		TX_INTER_PACKET_GAP_BYTES : positive range 1 to 32767 := 12;

		-- Number of bytes/clocks between received frames required by the spec (gigabit allows this to be a little less than the transmit IPG at just 8 clocks)
		RX_INTER_PACKET_GAP_BYTES : positive range 1 to 32767 := 1;

		-- This is the magic header byte that all payloads must start with in order to be considered valid. It is automatically appended
		-- to each sent packet, and its presence is checked for in received packets.
		PAYLOAD_MAGIC_HEADER_BYTE : std_logic_vector(7 downto 0) := X"A5";

		-- Do we ignore FCS CRC32 checks on receiving packets?
		RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES : boolean := false;

		-- Do we ignore IPv4 checksum checks on receiving packets?
		RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES : boolean := false;

		-- Do we ignore the incoming MAC address if it doesn't match ours or the broadcast address?
		RX_DISABLE_MAC_ADDR_FILTERING : boolean := false;

		-- Do we ignore the incoming IPv4 address if it doesn't match ours or the broadcast address?
		RX_DISABLE_IPv4_ADDR_FILTERING : boolean := false;

		-- This is the FPGA's MAC address (defaults to 00:0A:35:03:78:F1):
		DEVICE_MAC_ADDRESS_OCTET_0 : std_logic_vector(7 downto 0) := X"00";
		DEVICE_MAC_ADDRESS_OCTET_1 : std_logic_vector(7 downto 0) := X"0A";
		DEVICE_MAC_ADDRESS_OCTET_2 : std_logic_vector(7 downto 0) := X"35";
		DEVICE_MAC_ADDRESS_OCTET_3 : std_logic_vector(7 downto 0) := X"03";
		DEVICE_MAC_ADDRESS_OCTET_4 : std_logic_vector(7 downto 0) := X"78";
		DEVICE_MAC_ADDRESS_OCTET_5 : std_logic_vector(7 downto 0) := X"F1";

		-- This is the FPGA's static IP address (defaults to 192.168.1.171):
		DEVICE_IPv4_ADDRESS_OCTET_0 : std_logic_vector(7 downto 0) := X"C0";
		DEVICE_IPv4_ADDRESS_OCTET_1 : std_logic_vector(7 downto 0) := X"A8";
		DEVICE_IPv4_ADDRESS_OCTET_2 : std_logic_vector(7 downto 0) := X"01";
		DEVICE_IPv4_ADDRESS_OCTET_3 : std_logic_vector(7 downto 0) := X"AB";

		-- This is the UDP port numbers that the device uses to communicate:
		UDP_PROTOCOL_PORT_D2H : positive range 1 to 65535 := 3128;
		UDP_PROTOCOL_PORT_H2D : positive range 1 to 65535 := 3129;

		-- How many DWORD's of storage are available in total in the recv packet data FIFO
		RECV_PKT_DATA_DWORD_CAPACITY : positive range 1 to 65535 := 2048
	);
	Port (
	-- 125MHz Ethernet MAC interfaces:
		clk125 : in STD_LOGIC;

	-- GMII interface:
		tx_en : out STD_LOGIC := '0';
		tx_er : out STD_LOGIC := '0';
		tx_data : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

		rx_dv : in STD_LOGIC;
		rx_er : in STD_LOGIC;
		rx_data : in STD_LOGIC_VECTOR(7 downto 0);
	-- End GMII interface

		mac_address : out STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
		speed_override : out STD_LOGIC_VECTOR(1 downto 0) := "10"; -- Default to 1000M

	-- End 125MHz Ethernet MAC interface

	-- IO Data FIFO's
		recv_pkt_header_prog_full : in STD_LOGIC;
		recv_pkt_header_wr_data : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		recv_pkt_header_wr_en : out STD_LOGIC := '0';

		recv_pkt_data_count : in STD_LOGIC_VECTOR(10 downto 0);
		recv_pkt_data_wr_data : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		recv_pkt_data_wr_en : out STD_LOGIC := '0';

		send_pkt_header_empty : in STD_LOGIC;
		send_pkt_header_rd_data : in STD_LOGIC_VECTOR(31 downto 0);
		send_pkt_header_rd_en : out STD_LOGIC := '0';

		send_pkt_data_empty : in STD_LOGIC;
		send_pkt_data_rd_data : in STD_LOGIC_VECTOR(7 downto 0);
		send_pkt_data_rd_en : out STD_LOGIC := '0';
	-- End IO Data FIFO's

	-- Recv Packet Scratch Memory BRAM:
		-- Port A is the write-only port
		recv_scratch_addra : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		recv_scratch_clka125 : out STD_LOGIC := '0';
		recv_scratch_dina : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		recv_scratch_ena : out STD_LOGIC := '0';
		recv_scratch_wea : out STD_LOGIC_VECTOR(0 downto 0) := "0";

		-- Port B is the read-only port
		recv_scratch_addrb : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
		recv_scratch_clkb125 : out STD_LOGIC := '0';
		recv_scratch_doutb : in STD_LOGIC_VECTOR(31 downto 0);
		recv_scratch_enb : out STD_LOGIC := '0';
	-- End Recv Packet Scratch Memory BRAM

	-- Misc. interfaces:
		signal_detect : out STD_LOGIC := '1';

		-- If this is '1' then the PHY is currently isolated from the network and cannot send or receive data.
		-- This should be the case on startup.
		-- We need to clear the isolate bit using the configuration_vector(bit 3) to tell the PCS/PMA to remove GMII isolation.
		gmii_isolate : in STD_LOGIC;

		speed_is_10_100 : out STD_LOGIC := '0';
		speed_is_100 : out STD_LOGIC := '0';
		pcs_rst_out : out STD_LOGIC := '0';
		phyaddr : out STD_LOGIC_VECTOR(4 downto 0) := "00001";
		configuration_vector : out STD_LOGIC_VECTOR(4 downto 0) := "00000";--"11011";
		configuration_valid : out STD_LOGIC := '0';
		an_adv_config_vector : out STD_LOGIC_VECTOR(15 downto 0) := X"0021";--X"B820";
		an_adv_config_val : out STD_LOGIC := '0';
		an_restart_config : out STD_LOGIC := '0';

		phyBringupComplete : in STD_LOGIC;

		status_vector : in STD_LOGIC_VECTOR(15 downto 0);

		rx_locked : in STD_LOGIC;
		tx_locked : in STD_LOGIC;

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
		tx_dly_rdy_1 : out STD_LOGIC := '1';
		rx_dly_rdy_1 : out STD_LOGIC := '1';
		tx_vtc_rdy_1 : out STD_LOGIC := '1';
		rx_vtc_rdy_1 : out STD_LOGIC := '1';
		tx_dly_rdy_2 : out STD_LOGIC := '1';
		rx_dly_rdy_2 : out STD_LOGIC := '1';
		tx_vtc_rdy_2 : out STD_LOGIC := '1';
		rx_vtc_rdy_2 : out STD_LOGIC := '1';
		tx_dly_rdy_3 : out STD_LOGIC := '1';
		rx_dly_rdy_3 : out STD_LOGIC := '1';
		tx_vtc_rdy_3 : out STD_LOGIC := '1';
		rx_vtc_rdy_3 : out STD_LOGIC := '1';

		-- NetProtoPacketProcessor interface:
		NETPKT_SendReady : out STD_LOGIC := '0'; -- Set to '1' when we are ready to send packets over the network, '0' otherwise.
		NETPKT_RecvReady : out STD_LOGIC := '0'; -- Set to '1' when we are ready to receive packets from the network, '0' otherwise.
	-- End Misc. interfaces

	-- Stat signals
		STAT_CountSendUdpPackets : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountValidRecvUdpPackets : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountValidRecvArpPackets : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountInvalidRecvPackets : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountDroppedRecvPackets : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- End Stat signals

	-- Debug signals
		DBG_EthConfig_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_EthSend_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_EthRecv_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_RecvFifoPush_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');

		DBG_RecvValid_MAC : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_RecvValid_IPv4 : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_RecvValid_UDP : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		DBG_RecvValid_Payload : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		DBG_RecvValid_ARP : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');

		DBG_ARPPacketTPA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_DeviceTPA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_SendType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

		DBG_RecvPacketFCS : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RecvComputedCRC32 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		DBG_Recv_pkt_header_prog_full : out STD_LOGIC := '0';
		DBG_RecvPacketSizeDWORDs : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
		DBG_RecvFIFOAvailableBytes : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		DBG_RecvFIFOCount : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		DBG_RecvFIFOCurrentPushDWORD : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
		DBG_RecvFIFOPktLengthDWORDs : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

		DBG_SendPacketRemainingFIFOPumpBytes : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		DBG_PacketSendPtr : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
		DBG_send_pkt_data_rd_en : out STD_LOGIC := '0';
		DBG_SendPacketHeaderData : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_SendPacketBodyData : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_SendUDPPacketCount : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		);
end EthernetController3;

architecture Behavioral of EthernetController3 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE FSM_ENCODING : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk125: SIGNAL is "xilinx.com:signal:clock:1.0 clk125 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk125: SIGNAL is "FREQ_HZ 125000000";

ATTRIBUTE X_INTERFACE_INFO of tx_data: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII TXD";
ATTRIBUTE X_INTERFACE_INFO of tx_en: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII TX_EN";
ATTRIBUTE X_INTERFACE_INFO of tx_er: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII TX_ER";
ATTRIBUTE X_INTERFACE_INFO of rx_data: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII RXD";
ATTRIBUTE X_INTERFACE_INFO of rx_dv: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII RX_DV";
ATTRIBUTE X_INTERFACE_INFO of rx_er: SIGNAL is "xilinx.com:interface:gmii:1.0 GMII RX_ER";

ATTRIBUTE X_INTERFACE_INFO of send_pkt_header_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_header_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_EN";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_header_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_header EMPTY";

ATTRIBUTE X_INTERFACE_INFO of send_pkt_data_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_data_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_EN";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_data_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 send_pkt_data EMPTY";

ATTRIBUTE X_INTERFACE_INFO of recv_pkt_header_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_header_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_EN";

ATTRIBUTE X_INTERFACE_INFO of recv_pkt_data_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_data_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_EN";

-- Recv scratch BRAM:
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_clka125: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchWRA CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of recv_scratch_clka125: SIGNAL is "FREQ_HZ 125000000";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_clkb125: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchRDB CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of recv_scratch_clkb125: SIGNAL is "FREQ_HZ 125000000";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_ena: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchWRA EN";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_enb: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchRDB EN";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_addra: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchWRA ADDR";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchRDB ADDR";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_dina: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchWRA DIN";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchRDB DOUT";
ATTRIBUTE X_INTERFACE_INFO of recv_scratch_wea: SIGNAL is "xilinx.com:interface:bram:1.0 RecvScratchWRA WE";

type EthConfigStateType is 
(
	init, -- 0
	waitForPhyBringupComplete, -- 1
	waitForClocksLockedSGMII, -- 2
	waitForResetDelay, -- 3 -- Wait for 16 microseconds (about 4920 cycles at 300MHz)
	setConfigurationVector0, -- 4
	setConfigurationVector1, -- 5
	waitForGoodStatus, -- 6
	sendFirstPacket, -- 7
	readyState -- 8
);

type EthStateType is
(
	interPacketGapWait, -- 0
	readyForPacket, -- 1
	preambleSequence, -- 2
	SFDSequence, -- 3
	packetData, -- 4
	FCSSequence, -- 5
	minPacketSizePadding, -- 6
	recvProcessPacket, -- 7
	recvAlignPacket4 -- 8
);

type RecvFifoPushStateType is
(
	recvFifoIdle, -- 0
	waitForReadLatency0, -- 1
	pushDWORD0, -- 2
	pushDWORD1, -- 3
	pushDWORD2, -- 4
	pushRemainingData -- 5
);

type SendFifoPopStateType is
(
	sendFifoIdle, -- 0
	popWaitCycle, -- 1
	popDWORD0, -- 2
	popDWORD1, -- 3
	popDWORD2 -- 4
);

type SendPacketType is
(
	noSendType, -- 0
	normalUDPPacketSendType, -- 1
	ARPAnnouncePacketSendType, -- 2
	ARPReplyPacketSendType -- 3
);

-- The definition of the bits of the status_vector comes from the Product Guide for the
-- Xilinx 1G/2.5G Ethernet PCS/PMA or SGMII document. For more info on each of the bits,
-- go check that out!
type StatusVectorEnum is
(
	Stat_LinkStatus, -- 0
	Stat_LinkSynchronization, -- 1
	Stat_RUDI_C, -- 2
	Stat_RUDI_I, -- 3
	Stat_RUDI_INVALID, -- 4
	Stat_RXDISPERR, -- 5
	Stat_RXNOTINTABLE, -- 6
	Stat_SGMII_PhyLinkStatus, -- 7
	Stat_RemoteFaultEncodingLSB, -- 8
	Stat_RemoteFaultEncodingMSB, -- 9
	Stat_SpeedLSB, -- 10
	Stat_SpeedMSB, -- 11
	Stat_DuplexMode, -- 12
	Stat_RemoteFaultDetected, -- 13
	Stat_PauseModeLSB, -- 14
	Stat_PauseModeMSB -- 15
);

type RecvPacketHeader is record
	pktLength : unsigned(11 downto 0);
	hostMACAddress : unsigned(6*8-1 downto 0);
	hostIPv4Address : unsigned(4*8-1 downto 0);
end record;

subtype PacketBytePointerType is natural range 0 to 2047;

constant UDP_PROTOCOL_PORT_D2H_UNSIGNED : unsigned(15 downto 0) := to_unsigned(UDP_PROTOCOL_PORT_D2H, 16);
constant UDP_PROTOCOL_PORT_H2D_UNSIGNED : unsigned(15 downto 0) := to_unsigned(UDP_PROTOCOL_PORT_H2D, 16);

type SendPacketDataArray is array(0 to 59) of unsigned(7 downto 0);

-- An example complete packet looks like this:
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
	16 => X"05", -- IPv4 Packet length, high 8 bits
	17 => X"DC", -- IPv4 Packet length, low 8 bits (includes header size, minimum of 20 bytes for an empty packet with minimal header)
	18 => X"00", -- Packet ID, high 8 bits
	19 => X"00", -- Packet ID, low 8 bits. The packet ID needs to be unique for each packet, so we'll use an incrementing counter to fill this 16-bit value later.
	20 => X"40", -- Flags (top bit is reserved and must be zero, next bit is the "Don't Fragment" bit, which is set to 1, and below that is the "More Fragments" bit, which is set to 0). The remaining 5 bits are the high bits of the Fragment Offset.
	21 => X"00", -- Fragment Offset lower 8 bits. All are set to zero because we don't want to deal with packet fragmentation.
	22 => X"80", -- TTL is set to 128 by default
	23 => X"11", -- IPv4 Protocol number is set to 0x11 (this is decimal 17) to select UDP.
	24 => X"00", -- IPv4 Checksum high 8 bits
	25 => X"00", -- IPv4 Checksum low 8 bits. The checksum field is the 16 bit one's complement of the one's complement sum of all 16 bit words in the header. For purposes of computing the checksum, the value of the checksum field is zero.
	26 => X"C0", -- Source IPv4 Address (first byte)
	27 => X"A8", -- Source IPv4 Address (second byte)
	28 => X"01", -- Source IPv4 Address (third byte)
	29 => X"AB", -- Source IPv4 Address (fourth byte). Our source IP for the FPGA should always be 192.168.1.171 .
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
	38 => X"05", -- UDP Packet Length (high 8 bits)
	39 => X"C8", -- UDP Packet Length (low 8 bits). The packet length includes the 8-byte UDP header so it is always at least 8.
	40 => X"00", -- UDP Packet Checksum (high 8 bits)
	41 => X"00", -- UDP Packet Checksum (low 8 bits). Leave this as zero to signal that this UDP packet has no UDP checksum.
-- UDP Header end:

-- UDP Data Payload begin:
	42 => X"0A",
	43 => X"0B",
	44 => X"0C",
	45 => X"0D",
	46 => X"0E",
	47 => X"0F",
	48 => X"00",
	49 => X"11",
	50 => X"22",
	51 => X"33",
	52 => X"44",
	53 => X"55",
	54 => X"66",
	55 => X"77",
	56 => X"88",
	57 => X"99",
	58 => X"AA",
	59 => X"BB"
-- UDP Data Payload end

-- If our packet is less than 64 bytes between the start of the Ethernet frame header (begins with the Dest. MAC ID and ends with the UDP data payload), then here is
-- where we'll insert 00's for padding bytes until we reach 60 bytes. Then, the four FCS bytes that comprise the 32-bit CRC32 checksum will finish off our packet.
-- Padding 0
-- Padding 1
-- Padding 2 ...etc.

-- Four FCS bytes will follow the packet here in LSByte-first order!
	-- FCS3
	-- FCS2
	-- FCS1
	-- FCS0
);

constant DefaultResetDelay : unsigned(31 downto 0) := to_unsigned(125000000, 32); -- Set to 125000000 cycles (exactly 1 second at 125MHz)

constant PreambleByte : std_logic_vector(7 downto 0) := X"55"; -- This normally looks like "10101010" (0xAA) but remember that in Ethernet LSB gets transmitted first
constant SFDByte : std_logic_vector(7 downto 0) := X"D5"; -- This normally looks like "10101011" (0xAB) but remember that in Ethernet LSB gets transmitted first
constant NumPreambleBytes : positive := 7;

pure function ValidateRecvPayloadMagicByte(packetPayloadByte : unsigned(7 downto 0) ) return std_logic is
begin
	if (packetPayloadByte = unsigned(PAYLOAD_MAGIC_HEADER_BYTE) ) then
		return '1';
	else
		return '0';
	end if;
end function;

-- Determines how many DWORD's are remaining in the recv data FIFO
pure function CalcAvailableSpaceInRecvFIFO(DWORDCount : unsigned(10 downto 0) ) return unsigned is
begin
	return to_unsigned( (RECV_PKT_DATA_DWORD_CAPACITY - 1), 11) - DWORDCount;
end function;

-- Round up our packet size to the nearest DWORD
pure function GetPacketSizeInDWORDs(packetLengthBytes : unsigned(11 downto 0) ) return unsigned is
begin
	return (packetLengthBytes + 3) srl 2;
end function;

-- Calculates how many remaining bytes left over we'll have to pump our FIFO for when we're done reading normal packet data from it
pure function GetRemainingFIFOPumpBytes(packetLengthBytes : unsigned(11 downto 0) ) return unsigned is
begin
	case packetLengthBytes(1 downto 0) is
		when "00" =>
			return to_unsigned(0, 2);

		when "01" =>
			return to_unsigned(3, 2);

		when "10" =>
			return to_unsigned(2, 2);

		when "11" =>
			return to_unsigned(1, 2);
	end case;
end function;

-- Master state machine signals:
signal currentState : EthConfigStateType := init;
signal resetDelayCycles : unsigned(31 downto 0) := (others => '0');
signal controllerIsReadyForData : std_logic := '0';

-- Send process signals:
signal initialPacketSendPtr : unsigned(11 downto 0) := (others => '0');
signal sendFirstPacketComplete : std_logic := '0';
signal sendEthState : EthStateType := interPacketGapWait;
signal sendIPGCyclesRemain : unsigned(15 downto 0) := to_unsigned(TX_INTER_PACKET_GAP_BYTES, 16);
signal sendPreambleCyclesRemain : unsigned(2 downto 0) := to_unsigned(NumPreambleBytes - 1, 3);
signal sendLastPacketSize : unsigned(11 downto 0) := (others => '0');
signal sendPacketBytesRemain : unsigned(10 downto 0) := (others => '0');
signal sendPacketPaddingBytesRemain : unsigned(5 downto 0) := (others => '0');
signal sendPacketFCSBytesRemain : unsigned(1 downto 0) := (others => '1');
signal sendRunningCRC32 : unsigned(31 downto 0) := (others => '0');
signal sendExtraWaitDelay : unsigned(31 downto 0) := (others => '0');
signal sendIPv4PacketIDCounter : unsigned(15 downto 0) := (others => '0');
signal sendIPv4PacketChecksum : unsigned(15 downto 0) := (others => '0');
signal send_valid : std_logic := '0'; -- Written to by the main send process, read from by the send address data loader process when high to indicate that send_type is now valid.
signal send_type : SendPacketType := noSendType;
signal sendPacketsCount : unsigned(7 downto 0) := (others => '0');

-- Send packet header signals sourced from the output packet data FIFO:
signal sendDestMACAddress : unsigned(6*8-1 downto 0) := X"44A842FC3C93";
signal sendDestIPv4Address : unsigned(4*8-1 downto 0) := X"C0A8019E";
signal sendPacketIPv4Length : unsigned(11 downto 0) := to_unsigned(4+1+8+20, 12);
signal sendPacketUDPLength : unsigned(11 downto 0) := to_unsigned(4+1+8, 12);
signal sendPacketPayloadLength : unsigned(11 downto 0) := (others => '0');
signal sendPacketRemainingFIFOPumpBytes : unsigned(1 downto 0) := (others => '0');
signal sendPacketLastMACPtr : unsigned(11 downto 0) := to_unsigned(59, 12);

-- Send FIFO pop signals:
signal send_fifo_pop_state : SendFifoPopStateType := sendFifoIdle;

-- Recv process signals:
signal recvEthState : EthStateType := interPacketGapWait;
signal recvIPGCyclesRemain : unsigned(15 downto 0) := to_unsigned(RX_INTER_PACKET_GAP_BYTES, 16);
signal recvPacketLength : unsigned(11 downto 0) := (others => '0');
signal recvMACPacketHeader : unsigned(14*8-1 downto 0) := (others => '0');
signal recvIPv4PacketHeader : unsigned(20*8-1 downto 0) := (others => '0');
signal recvIPv4HeaderChecksum : unsigned(15 downto 0) := (others => '0');
signal recvUDPPacketHeader : unsigned(8*8-1 downto 0) := (others => '0');
signal recvRunningCRC32 : unsigned(31 downto 0) := (others => '0');
signal recvSavedCRC32_0 : unsigned(31 downto 0) := (others => '0');
signal recvSavedCRC32_1 : unsigned(31 downto 0) := (others => '0');
signal recvSavedCRC32_2 : unsigned(31 downto 0) := (others => '0');
signal recvSavedCRC32_3 : unsigned(31 downto 0) := (others => '0');
signal recvScratchAddr : unsigned(10 downto 0) := (others => '0');
signal recvPacketFCSBytesRemain : unsigned(1 downto 0) := (others => '1');
signal recvPacketFCS : unsigned(31 downto 0) := (others => '0');
signal recvPacketPaddingBytesRemain : unsigned(5 downto 0) := (others => '0');
signal recvPacketMagicByte : unsigned(7 downto 0) := (others => '0');

-- Recv valid checks:
signal recvMACFrameValid : std_logic_vector(2 downto 0) := (others => '0');
signal recvIPv4HeaderValid : std_logic_vector(5 downto 0) := (others => '0');
signal recvUDPHeaderValid : std_logic_vector(0 downto 0) := (others => '0');
signal recvPayloadHeaderValid : std_logic_vector(0 downto 0) := (others => '0');
signal recvARPHeaderValid : std_logic_vector(6 downto 0) := (others => '0');

-- ARP Reply signals:
signal recvARPReplyValid : std_logic := '0'; -- Written by the recv process, read by the send process
signal sendARPReplyAck : std_logic := '0'; -- Written by the send process, read by the recv process to know if it can clear the ARP reply values because they have been saved to registers
signal recvARPReply_SHA : unsigned(6*8-1 downto 0) := (others => '0'); -- Source Hardware Address (will be the MAC address that we send the ARP reply to)
signal recvARPReply_SPA : unsigned(4*8-1 downto 0) := (others => '0'); -- Source Protocol Address (will be the IPv4 address that we send the ARP reply to)
signal sendARPReply_SHA : unsigned(6*8-1 downto 0) := (others => '0'); -- Source Hardware Address (will be the MAC address that we send the ARP reply to)
signal sendARPReply_SPA : unsigned(4*8-1 downto 0) := (others => '0'); -- Source Protocol Address (will be the IPv4 address that we send the ARP reply to)

-- Packet recv_store signals:
signal recv_store_MACAddr : unsigned(47 downto 0) := (others => '0');
signal recv_store_IPv4Addr : unsigned(31 downto 0) := (others => '0');
signal recv_store_PktLength : unsigned(11 downto 0) := (others => '0');
signal recv_valid : std_logic := '0';

-- Recv FIFO push signals:
signal recv_fifo_push_state : RecvFifoPushStateType := recvFifoIdle;
signal recv_fifo_current_header : RecvPacketHeader := (pktLength => (others => '0'), hostMACAddress => (others => '0'), hostIPv4Address => (others => '0') );
signal recv_fifo_pkt_length_DWORDs : unsigned(11 downto 0) := (others => '0');
signal recv_fifo_current_push_DWORD : unsigned(8 downto 0) := (others => '0');

-- Stats signals
signal stat_count_send_udp_packets : unsigned(31 downto 0) := (others => '0');
signal stat_count_valid_recv_udp_packets : unsigned(31 downto 0) := (others => '0');
signal stat_count_valid_recv_arp_packets : unsigned(31 downto 0) := (others => '0');
signal stat_count_invalid_recv_packets : unsigned(31 downto 0) := (others => '0');
signal stat_count_dropped_recv_packets : unsigned(31 downto 0) := (others => '0');

-- Tell the auto-FSM encoding optimizer not to touch our state enums so that we can use them for debugging!
ATTRIBUTE FSM_ENCODING of currentState: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of sendEthState: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of recvEthState: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of recv_fifo_push_state: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of send_type: SIGNAL is "user_encoding";

begin

recv_scratch_clka125 <= clk125;
recv_scratch_clkb125 <= clk125;

STAT_CountSendUdpPackets <= std_logic_vector(stat_count_send_udp_packets);
STAT_CountValidRecvUdpPackets <= std_logic_vector(stat_count_valid_recv_udp_packets);
STAT_CountValidRecvArpPackets <= std_logic_vector(stat_count_valid_recv_arp_packets);
STAT_CountInvalidRecvPackets <= std_logic_vector(stat_count_invalid_recv_packets);
STAT_CountDroppedRecvPackets <= std_logic_vector(stat_count_dropped_recv_packets);

DBG_EthConfig_State <= std_logic_vector(to_unsigned(EthConfigStateType'pos(currentState), 5) );
DBG_EthSend_State <= std_logic_vector(to_unsigned(EthStateType'pos(sendEthState), 5) );
DBG_EthRecv_State <= std_logic_vector(to_unsigned(EthStateType'pos(recvEthState), 5) );
DBG_RecvFifoPush_State <= std_logic_vector(to_unsigned(RecvFifoPushStateType'pos(recv_fifo_push_state), 5) );

DBG_RecvValid_MAC <= recvMACFrameValid;
DBG_RecvValid_IPv4 <= recvIPv4HeaderValid;
DBG_RecvValid_UDP <= recvUDPHeaderValid;
DBG_RecvValid_Payload <= recvPayloadHeaderValid;
DBG_RecvValid_ARP <= recvARPHeaderValid;

DBG_RecvPacketFCS <= std_logic_vector(recvPacketFCS);
DBG_RecvComputedCRC32 <= std_logic_vector(recvSavedCRC32_3);
DBG_SendType <= std_logic_vector(to_unsigned(SendPacketType'pos(send_type), 2) );

DBG_Recv_pkt_header_prog_full <= recv_pkt_header_prog_full;
DBG_RecvPacketSizeDWORDs <= std_logic_vector(GetPacketSizeInDWORDs(recv_store_PktLength) );
DBG_RecvFIFOAvailableBytes <= std_logic_vector(CalcAvailableSpaceInRecvFIFO(unsigned(recv_pkt_data_count) ) );
DBG_RecvFIFOCount <= recv_pkt_data_count;
DBG_RecvFIFOCurrentPushDWORD <= std_logic_vector(recv_fifo_current_push_DWORD);
DBG_RecvFIFOPktLengthDWORDs <= std_logic_vector(recv_fifo_pkt_length_DWORDs);

DBG_SendPacketRemainingFIFOPumpBytes <= std_logic_vector(sendPacketRemainingFIFOPumpBytes);
DBG_PacketSendPtr <= std_logic_vector(initialPacketSendPtr);
DBG_SendPacketHeaderData <= send_pkt_header_rd_data;
DBG_SendPacketBodyData <= send_pkt_data_rd_data;
DBG_SendUDPPacketCount <= std_logic_vector(sendPacketsCount);

	mainStateMachine: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			case currentState is
				when init =>
					mac_address(7 downto 0) <= DEVICE_MAC_ADDRESS_OCTET_0; -- FPGA's MAC address is 00:0A:35:03:78:F1
					mac_address(15 downto 8) <= DEVICE_MAC_ADDRESS_OCTET_1;
					mac_address(23 downto 16) <= DEVICE_MAC_ADDRESS_OCTET_2;
					mac_address(31 downto 24) <= DEVICE_MAC_ADDRESS_OCTET_3;
					mac_address(39 downto 32) <= DEVICE_MAC_ADDRESS_OCTET_4;
					mac_address(47 downto 40) <= DEVICE_MAC_ADDRESS_OCTET_5;
					resetDelayCycles <= DefaultResetDelay;
					currentState <= waitForPhyBringupComplete;

				when waitForPhyBringupComplete =>
					if (phyBringupComplete = '1') then
						currentState <= waitForClocksLockedSGMII;
					end if;

				when waitForClocksLockedSGMII =>
					if (rx_locked = '1' and tx_locked = '1') then
						currentState <= waitForResetDelay;
					end if;

				when waitForResetDelay =>
					resetDelayCycles <= resetDelayCycles - 1;
					if (resetDelayCycles = 0) then
						currentState <= waitForGoodStatus;
					end if;

				when setConfigurationVector0 =>
					configuration_vector <= "00000"; -- Disable electrical isolation after power-on is completed to start the PCS/PMA core to be able to send and receive data over SGMII
					configuration_valid <= '1';
					resetDelayCycles <= DefaultResetDelay;
					currentState <= setConfigurationVector1;

				when setConfigurationVector1 =>
					-- Hold the config_valid signal high for many cycles to make sure that the PCS/PMA core has time to register the new configuration_vector
					resetDelayCycles <= resetDelayCycles - 1;
					if (resetDelayCycles = 0) then
						configuration_valid <= '0';
						resetDelayCycles <= DefaultResetDelay;
						currentState <= waitForGoodStatus;
					end if;

				when waitForGoodStatus =>
					if (status_vector(StatusVectorEnum'pos(Stat_LinkStatus) ) = '1' and -- Link Status Connected
						status_vector(StatusVectorEnum'pos(Stat_LinkSynchronization) ) = '1' and -- Link Synchronized
						status_vector(StatusVectorEnum'pos(Stat_SGMII_PhyLinkStatus) ) = '1' and -- PHY Link Status Connected
						status_vector(StatusVectorEnum'pos(Stat_DuplexMode) ) = '1' and -- Full Duplex Mode
						gmii_isolate = '0') then -- Isolate enabled (we need Isolate to be *disabled* in order to send or recv data)
						currentState <= sendFirstPacket;
					else
						resetDelayCycles <= resetDelayCycles - 1;
						if (resetDelayCycles = 0) then
							currentState <= setConfigurationVector0; -- Try resetting the configuration vector again
						end if;
					end if;

				when sendFirstPacket =>
					-- Wait for the first packet to be sent before moving on to the ready state
					if (sendFirstPacketComplete = '1') then
						currentState <= readyState;
					end if;

				when readyState =>
					controllerIsReadyForData <= '1';
					NETPKT_SendReady <= '1';
					-- Do nothing. We're ready to send and receive data now!

			end case;
		end if;
	end process mainStateMachine;

	-- This process loads the send registers with address data from either the packet header info FIFO (if it's a normal UDP packet to be sent), or from the ARP reply registers (if it's an ARP reply packet that needs to be sent)
	send_load_address_info_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			case send_fifo_pop_state is
				when sendFifoIdle =>
					send_pkt_header_rd_en <= '0';
					sendARPReplyAck <= '0';
					if (send_valid = '1') then
						case send_type is
							when noSendType =>
								-- Do nothing
								send_fifo_pop_state <= sendFifoIdle;

							when ARPAnnouncePacketSendType =>
								-- Do nothing, we're broadcasting so we aren't going to be using a dest. address anyway (we'll send to the broadcast address instead)
								sendPacketLastMACPtr <= to_unsigned(60-1, 12); -- Clamp our minimum packet size (60 bytes) to make sure that we can zero-pad correctly (ARP packets are always too small and need zero-padding)
								send_fifo_pop_state <= sendFifoIdle;

							when normalUDPPacketSendType =>
								sendPacketPayloadLength <= unsigned(send_pkt_header_rd_data(11 downto 0) );
								sendPacketRemainingFIFOPumpBytes <= GetRemainingFIFOPumpBytes(unsigned(send_pkt_header_rd_data(11 downto 0) ) );
								sendPacketUDPLength <= unsigned(send_pkt_header_rd_data(11 downto 0) ) + (8 + 1); -- Add the size of the UDP header (8 bytes) and the magic byte (1 byte) to the payload length
								sendPacketIPv4Length <= unsigned(send_pkt_header_rd_data(11 downto 0) ) + (20 + 8 + 1); -- Add the size of the IPv4 header (20 bytes), UDP header (8 bytes), and the magic byte (1 byte) to the payload length
								if (unsigned(send_pkt_header_rd_data(11 downto 0) ) < 18) then
									-- Clamp our minimum packet size (60 bytes) to make sure that we can zero-pad correctly
									sendPacketLastMACPtr <= to_unsigned(60-1, 12);
								else
									-- Add the size of the MAC header (14 bytes), IPv4 header (20 bytes), UDP header (8 bytes), and the magic byte (1 byte) to the payload length.
									-- Finally, subtract one so that we can stop at the last byte.
									sendPacketLastMACPtr <= unsigned(send_pkt_header_rd_data(11 downto 0) ) + (14 + 20 + 8 + 1 - 1);
								end if;
								sendDestMACAddress(15 downto 0) <= unsigned(send_pkt_header_rd_data(31 downto 16) );
								send_pkt_header_rd_en <= '1';
								send_fifo_pop_state <= popWaitCycle;
								stat_count_send_udp_packets <= stat_count_send_udp_packets + 1;

							when ARPReplyPacketSendType =>
								sendARPReplyAck <= '1';
								sendPacketLastMACPtr <= to_unsigned(60-1, 12); -- Clamp our minimum packet size (60 bytes) to make sure that we can zero-pad correctly (ARP packets are always too small and need zero-padding)
								send_fifo_pop_state <= sendFifoIdle;
						end case;
					end if;

					if (sendARPReplyAck = '1' and recvARPReplyValid = '1') then
						sendDestMACAddress <= recvARPReply_SHA;
						sendDestIPv4Address <= recvARPReply_SPA;
						sendARPReply_SHA <= recvARPReply_SHA;
						sendARPReply_SPA <= recvARPReply_SPA;
					end if;

				when popWaitCycle =>
					send_pkt_header_rd_en <= '1';
					send_fifo_pop_state <= popDWORD0;

				when popDWORD0 =>
					sendDestMACAddress(6*8-1 downto 2*8) <= unsigned(send_pkt_header_rd_data);
					send_pkt_header_rd_en <= '1';
					send_fifo_pop_state <= popDWORD1;

				when popDWORD1 =>
					sendDestIPv4Address <= unsigned(send_pkt_header_rd_data);
					send_pkt_header_rd_en <= '0';
					send_fifo_pop_state <= popDWORD2;

				when popDWORD2 =>
					send_pkt_header_rd_en <= '0';
					send_fifo_pop_state <= sendFifoIdle;
			end case;
		end if;
	end process send_load_address_info_process;

	-- Fields to fill in on packet send:
	--	Destination MAC address (use the MAC ID in the send packet header info FIFO)
	--	Source MAC address (use the device's MAC ID)
	--	EtherType is always 0x0800 for IPv4
	--	IPv4 version/IHL is always '4' and '5' respectively.
	--	DSCN/ECN is always all zeroes.
	--	IPv4 packet length needs to be calculated from the packet length + 1 (magic byte) + 8 (UDP header) + 20 (IPv4 header).
	--	Packet ID is always auto-incremented inside the ethernet controller.
	--	Flags has "don't fragment" bit set, other bits set to 0.
	--	Fragment Offset is always 0.
	--	TTL is set to 128 by default.
	--	IPv4 protocol number is set to 17 for UDP.
	--	IPv4 checksum is computed.
	--	Source IPv4 address is the device's IPv4 address.
	--	Dest IPv4 address comes from the send packet header info FIFO.
	--	UDP Source port / Dest port is hardcoded to 3128.
	--	UDP packet length is computed as packet length + 1 (magic byte) + 8 (UDP header).
	--	UDP packet checksum is all 0's (which means there is no checksum).
	--	The first data payload byte sent is always the magic byte (0xA5).
	--	Then the rest of the packet data comes from the send packet data FIFO.
	send_data_process: process(clk125)
		variable packetBytePointerIndex : PacketBytePointerType;
	begin
		if (rising_edge(clk125) ) then
			tx_en <= '0';
			send_pkt_data_rd_en <= '0';
			DBG_send_pkt_data_rd_en <= '0';
			case sendEthState is
				when interPacketGapWait =>
					if (sendIPGCyclesRemain /= 0) then
						sendIPGCyclesRemain <= sendIPGCyclesRemain - 1;
					else
						sendIPGCyclesRemain <= to_unsigned(TX_INTER_PACKET_GAP_BYTES, 16);
						initialPacketSendPtr <= (others => '0');
						if (currentState /= readyState) then
							sendExtraWaitDelay <= to_unsigned(125000000, 32); -- Set to 125M cycles (once per second at 125MHz)
						else
							sendExtraWaitDelay <= to_unsigned(1, 32); -- Set to 1 cycle
						end if;
						sendEthState <= readyForPacket;
					end if;

				when readyForPacket =>
					send_type <= noSendType;
					send_valid <= '0';
					if (sendExtraWaitDelay = 0) then
						if (currentState = sendFirstPacket) then
							sendPreambleCyclesRemain <= to_unsigned(NumPreambleBytes - 1, 3);
							send_type <= ARPAnnouncePacketSendType; -- For the first packet, we don't want to read from either the ARP reply registers or pop off of the empty packet header info FIFO
							send_valid <= '1';
							sendEthState <= preambleSequence;
						elsif ( (currentState = readyState) and (recvARPReplyValid = '1') ) then
							sendPreambleCyclesRemain <= to_unsigned(NumPreambleBytes - 1, 3);
							send_type <= ARPReplyPacketSendType;
							send_valid <= '1';
							sendEthState <= preambleSequence;
						elsif ( (currentState = readyState) and (send_pkt_header_empty = '0') ) then
							sendPreambleCyclesRemain <= to_unsigned(NumPreambleBytes - 1, 3);
							send_type <= normalUDPPacketSendType;
							send_valid <= '1';
							sendEthState <= preambleSequence;
						end if;
					else
						sendExtraWaitDelay <= sendExtraWaitDelay - 1;
					end if;

				when preambleSequence =>
					send_valid <= '0'; -- Pulse this off after one clock cycle
					tx_data <= PreambleByte;
					tx_en <= '1';
					if (sendPreambleCyclesRemain = 0) then
						sendEthState <= SFDSequence;
					else
						sendPreambleCyclesRemain <= sendPreambleCyclesRemain - 1;
					end if;

				when SFDSequence =>
					sendLastPacketSize <= to_unsigned(60, 12);
					tx_data <= SFDByte;
					tx_en <= '1';
					sendRunningCRC32 <= (others => '1'); -- Clear our running CRC32 to the default value (all one's or 0xFFFFFFFF)

					-- Calculate our IPv4 header checksum using our new IPv4 packet ID:
					sendIPv4PacketChecksum <= CalcIPv4HeaderSendChecksum(sendIPv4PacketIDCounter, sendPacketIPv4Length, sendDestIPv4Address, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0 & DEVICE_IPv4_ADDRESS_OCTET_1 & DEVICE_IPv4_ADDRESS_OCTET_2 & DEVICE_IPv4_ADDRESS_OCTET_3) );
					sendEthState <= packetData;

				when packetData =>

					packetBytePointerIndex := PacketBytePointerType(to_integer(initialPacketSendPtr) );
					case send_type is
						when ARPAnnouncePacketSendType => -- First packet - do an ARP Announce
							case packetBytePointerIndex is
								when 0 => -- Destination MAC Address, first octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 1 => -- Destination MAC Address, second octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 2 => -- Destination MAC Address, third octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 3 => -- Destination MAC Address, fourth octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 4 => -- Destination MAC Address, fifth octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 5 => -- Destination MAC Address, sixth octet
									tx_data <= X"FF";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"FF");
								when 6 => -- Source MAC Address, first octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_0) );
								when 7 => -- Source MAC Address, second octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_1) );
								when 8 => -- Source MAC Address, third octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_2) );
								when 9 => -- Source MAC Address, fourth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_3) );
								when 10 => -- Source MAC Address, fifth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_4;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_4) );
								when 11 => -- Source MAC Address, sixth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_5;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_5) );
								when 12 => -- EtherType, high byte
									tx_data <= X"08";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"08");
								when 13 => -- EtherType, low byte
									tx_data <= X"06";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"06");
								when 14 => -- Hardware type, high byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 15 => -- Hardware type, low byte
									tx_data <= std_logic_vector(to_unsigned(eHTYPE'pos(ARP_HTYPE_ETHERNET), 8) ); -- X"0001" for Ethernet
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, to_unsigned(eHTYPE'pos(ARP_HTYPE_ETHERNET), 8) );
								when 16 => -- Protocol type, high byte
									tx_data <= X"08";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"08");
								when 17 => -- Protocol type, low byte
									tx_data <= X"00"; -- X"0800" matches the IPv4 EtherType
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 18 => -- Hardware address length
									tx_data <= std_logic_vector(ARP_MAC_ADDRESS_SIZE); -- MAC addresses are 6 bytes in length
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, ARP_MAC_ADDRESS_SIZE);
								when 19 => -- Protocol address length
									tx_data <= std_logic_vector(ARP_IPv4_ADDRESS_SIZE); -- IPv4 addresses are 4 bytes in length
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, ARP_IPv4_ADDRESS_SIZE);
								when 20 => -- ARP Opcode, high byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 21 => -- ARP Opcode, low byte
									tx_data <= std_logic_vector(to_unsigned(eARPOpcode'pos(ARP_OP_REQUEST), 8) ); -- Opcode 0x0001 is "request" (which is used for this ARP Announce)
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, to_unsigned(eARPOpcode'pos(ARP_OP_REQUEST), 8) );
								when 22 => -- Sender hardware address (SHA) is the device's MAC address, first byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_0) );
								when 23 => -- Sender hardware address (SHA) is the device's MAC address, second byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_1) );
								when 24 => -- Sender hardware address (SHA) is the device's MAC address, third byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_2) );
								when 25 => -- Sender hardware address (SHA) is the device's MAC address, fourth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_3) );
								when 26 => -- Sender hardware address (SHA) is the device's MAC address, fifth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_4;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_4) );
								when 27 => -- Sender hardware address (SHA) is the device's MAC address, sixth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_5;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_5) );
								when 28 => -- Sender protocol address (SPA) is the device's IPv4 address, first byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0) );
								when 29 => -- Sender protocol address (SPA) is the device's IPv4 address, second byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_1) );
								when 30 => -- Sender protocol address (SPA) is the device's IPv4 address, third byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_2) );
								when 31 => -- Sender protocol address (SPA) is the device's IPv4 address, fourth byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_3) );
								when 32 => -- Target hardware address (THA) is an unused MAC address for an ARP request, first byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 33 => -- Target hardware address (THA) is an unused MAC address for an ARP request, second byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 34 => -- Target hardware address (THA) is an unused MAC address for an ARP request, third byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 35 => -- Target hardware address (THA) is an unused MAC address for an ARP request, fourth byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 36 => -- Target hardware address (THA) is an unused MAC address for an ARP request, fifth byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 37 => -- Target hardware address (THA) is an unused MAC address for an ARP request, sixth byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 38 => -- Target protocol address (TPA) is the same as the source IP address for this ARP announce, first byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0) );
								when 39 => -- Target protocol address (TPA) is the same as the source IP address for this ARP announce, second byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_1) );
								when 40 => -- Target protocol address (TPA) is the same as the source IP address for this ARP announce, third byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_2) );
								when 41 => -- Target protocol address (TPA) is the same as the source IP address for this ARP announce, fourth byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_3) );
								when others => -- Pad the remainder of our Ethernet frame with zeroes in order to pad out the packet to the minimum packet size of 64 bytes
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
							end case;

						when ARPReplyPacketSendType => -- ARP reply packet
							case packetBytePointerIndex is
								when 0 => -- Destination MAC Address, first octet
									tx_data <= std_logic_vector(sendARPReply_SHA(1*8-1 downto 0*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(1*8-1 downto 0*8) );
								when 1 => -- Destination MAC Address, second octet
									tx_data <= std_logic_vector(sendARPReply_SHA(2*8-1 downto 1*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(2*8-1 downto 1*8) );
								when 2 => -- Destination MAC Address, third octet
									tx_data <= std_logic_vector(sendARPReply_SHA(3*8-1 downto 2*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(3*8-1 downto 2*8) );
								when 3 => -- Destination MAC Address, fourth octet
									tx_data <= std_logic_vector(sendARPReply_SHA(4*8-1 downto 3*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(4*8-1 downto 3*8) );
								when 4 => -- Destination MAC Address, fifth octet
									tx_data <= std_logic_vector(sendARPReply_SHA(5*8-1 downto 4*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(5*8-1 downto 4*8) );
								when 5 => -- Destination MAC Address, sixth octet
									tx_data <= std_logic_vector(sendARPReply_SHA(6*8-1 downto 5*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(6*8-1 downto 5*8) );
								when 6 => -- Source MAC Address, first octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_0) );
								when 7 => -- Source MAC Address, second octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_1) );
								when 8 => -- Source MAC Address, third octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_2) );
								when 9 => -- Source MAC Address, fourth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_3) );
								when 10 => -- Source MAC Address, fifth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_4;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_4) );
								when 11 => -- Source MAC Address, sixth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_5;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_5) );
								when 12 => -- EtherType, high byte
									tx_data <= X"08";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"08");
								when 13 => -- EtherType, low byte
									tx_data <= X"06";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"06");
								when 14 => -- Hardware type, high byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 15 => -- Hardware type, low byte
									tx_data <= std_logic_vector(to_unsigned(eHTYPE'pos(ARP_HTYPE_ETHERNET), 8) ); -- X"0001" for Ethernet
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, to_unsigned(eHTYPE'pos(ARP_HTYPE_ETHERNET), 8) );
								when 16 => -- Protocol type, high byte
									tx_data <= X"08";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"08");
								when 17 => -- Protocol type, low byte
									tx_data <= X"00"; -- X"0800" matches the IPv4 EtherType
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 18 => -- Hardware address length
									tx_data <= std_logic_vector(ARP_MAC_ADDRESS_SIZE); -- MAC addresses are 6 bytes in length
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, ARP_MAC_ADDRESS_SIZE);
								when 19 => -- Protocol address length
									tx_data <= std_logic_vector(ARP_IPv4_ADDRESS_SIZE); -- IPv4 addresses are 4 bytes in length
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, ARP_IPv4_ADDRESS_SIZE);
								when 20 => -- ARP Opcode, high byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 21 => -- ARP Opcode, low byte
									tx_data <= std_logic_vector(to_unsigned(eARPOpcode'pos(ARP_OP_REPLY), 8) ); -- Opcode 0x0002 is "reply"
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, to_unsigned(eARPOpcode'pos(ARP_OP_REPLY), 8) );
								when 22 => -- Sender hardware address (SHA) is the device's MAC address, first byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_0) );
								when 23 => -- Sender hardware address (SHA) is the device's MAC address, second byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_1) );
								when 24 => -- Sender hardware address (SHA) is the device's MAC address, third byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_2) );
								when 25 => -- Sender hardware address (SHA) is the device's MAC address, fourth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_3) );
								when 26 => -- Sender hardware address (SHA) is the device's MAC address, fifth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_4;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_4) );
								when 27 => -- Sender hardware address (SHA) is the device's MAC address, sixth byte
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_5;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_5) );
								when 28 => -- Sender protocol address (SPA) is the device's IPv4 address, first byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0) );
								when 29 => -- Sender protocol address (SPA) is the device's IPv4 address, second byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_1) );
								when 30 => -- Sender protocol address (SPA) is the device's IPv4 address, third byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_2) );
								when 31 => -- Sender protocol address (SPA) is the device's IPv4 address, fourth byte
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_3) );
								when 32 => -- Target hardware address (THA) is the MAC address to reply to, first byte
									tx_data <= std_logic_vector(sendARPReply_SHA(1*8-1 downto 0*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(1*8-1 downto 0*8) );
								when 33 => -- Target hardware address (THA) is the MAC address to reply to, second byte
									tx_data <= std_logic_vector(sendARPReply_SHA(2*8-1 downto 1*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(2*8-1 downto 1*8) );
								when 34 => -- Target hardware address (THA) is the MAC address to reply to, third byte
									tx_data <= std_logic_vector(sendARPReply_SHA(3*8-1 downto 2*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(3*8-1 downto 2*8) );
								when 35 => -- Target hardware address (THA) is the MAC address to reply to, fourth byte
									tx_data <= std_logic_vector(sendARPReply_SHA(4*8-1 downto 3*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(4*8-1 downto 3*8) );
								when 36 => -- Target hardware address (THA) is the MAC address to reply to, fifth byte
									tx_data <= std_logic_vector(sendARPReply_SHA(5*8-1 downto 4*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(5*8-1 downto 4*8) );
								when 37 => -- Target hardware address (THA) is the MAC address to reply to, sixth byte
									tx_data <= std_logic_vector(sendARPReply_SHA(6*8-1 downto 5*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SHA(6*8-1 downto 5*8) );
								when 38 => -- Target protocol address (TPA) is the IPv4 address to reply to, first byte
									tx_data <= std_logic_vector(sendARPReply_SPA(1*8-1 downto 0*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SPA(1*8-1 downto 0*8) );
								when 39 => -- Target protocol address (TPA) is the IPv4 address to reply to, second byte
									tx_data <= std_logic_vector(sendARPReply_SPA(2*8-1 downto 1*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SPA(2*8-1 downto 1*8) );
								when 40 => -- Target protocol address (TPA) is the IPv4 address to reply to, third byte
									tx_data <= std_logic_vector(sendARPReply_SPA(3*8-1 downto 2*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SPA(3*8-1 downto 2*8) );
								when 41 => -- Target protocol address (TPA) is the IPv4 address to reply to, fourth byte
									tx_data <= std_logic_vector(sendARPReply_SPA(4*8-1 downto 3*8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendARPReply_SPA(4*8-1 downto 3*8) );
								when others => -- Pad the remainder of our Ethernet frame with zeroes in order to pad out the packet to the minimum packet size of 64 bytes
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
							end case;

						when normalUDPPacketSendType => -- Not first packet - do a regular IPv4 data send:
							case packetBytePointerIndex is
								when 0 => -- Destination MAC Address, first octet
									tx_data <= std_logic_vector(sendDestMACAddress(47 downto 40) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(47 downto 40) );
								when 1 => -- Destination MAC Address, second octet
									tx_data <= std_logic_vector(sendDestMACAddress(39 downto 32) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(39 downto 32) );
								when 2 => -- Destination MAC Address, third octet
									tx_data <= std_logic_vector(sendDestMACAddress(31 downto 24) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(31 downto 24) );
								when 3 => -- Destination MAC Address, fourth octet
									tx_data <= std_logic_vector(sendDestMACAddress(23 downto 16) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(23 downto 16) );
								when 4 => -- Destination MAC Address, fifth octet
									tx_data <= std_logic_vector(sendDestMACAddress(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(15 downto 8) );
								when 5 => -- Destination MAC Address, sixth octet
									tx_data <= std_logic_vector(sendDestMACAddress(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestMACAddress(7 downto 0) );
								when 6 => -- Source MAC Address, first octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_0) );
								when 7 => -- Source MAC Address, second octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_1) );
								when 8 => -- Source MAC Address, third octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_2) );
								when 9 => -- Source MAC Address, fourth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_3) );
								when 10 => -- Source MAC Address, fifth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_4;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_4) );
								when 11 => -- Source MAC Address, sixth octet
									tx_data <= DEVICE_MAC_ADDRESS_OCTET_5;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_MAC_ADDRESS_OCTET_5) );
								when 12 => -- EtherType, high byte
									tx_data <= X"08";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"08");
								when 13 => -- EtherType, low byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 14 => -- IPv4 version and IHL byte
									tx_data <= X"45";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"45");
								when 15 => -- DSCN and ECN byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 16 => -- IPv4 Packet length, high byte
									tx_data <= "0000" & std_logic_vector(sendPacketIPv4Length(11 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, "0000" & sendPacketIPv4Length(11 downto 8) );
								when 17 => -- IPv4 Packet length, low byte
									tx_data <= std_logic_vector(sendPacketIPv4Length(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendPacketIPv4Length(7 downto 0) );
								when 18 => -- Packet ID, high byte
									tx_data <= std_logic_vector(sendIPv4PacketIDCounter(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendIPv4PacketIDCounter(15 downto 8) );
								when 19 => -- Packet ID, low byte
									tx_data <= std_logic_vector(sendIPv4PacketIDCounter(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendIPv4PacketIDCounter(7 downto 0) );
								when 20 => -- Flags and upper 5 bits of Fragment Offset
									tx_data <= X"40";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"40");
								when 21 => -- Lower 8 bits of Fragment Offset
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 22 => -- TTL
									tx_data <= X"80";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"80");
								when 23 => -- IPv4 Protocol
									tx_data <= X"11";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"11");
								when 24 => -- IPv4 Header Checksum, high byte
									tx_data <= std_logic_vector(sendIPv4PacketChecksum(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendIPv4PacketChecksum(15 downto 8) );
								when 25 => -- IPv4 Header Checksum, low byte
									tx_data <= std_logic_vector(sendIPv4PacketChecksum(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendIPv4PacketChecksum(7 downto 0) );
								when 26 => -- Source IPv4 Address, first octet
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_0;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0) );
								when 27 => -- Source IPv4 Address, second octet
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_1;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_1) );
								when 28 => -- Source IPv4 Address, third octet
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_2;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_2) );
								when 29 => -- Source IPv4 Address, fourth octet
									tx_data <= DEVICE_IPv4_ADDRESS_OCTET_3;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(DEVICE_IPv4_ADDRESS_OCTET_3) );
								when 30 => -- Dest IPv4 Address, first octet
									tx_data <= std_logic_vector(sendDestIPv4Address(31 downto 24) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestIPv4Address(31 downto 24) );
								when 31 => -- Dest IPv4 Address, second octet
									tx_data <= std_logic_vector(sendDestIPv4Address(23 downto 16) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestIPv4Address(23 downto 16) );
								when 32 => -- Dest IPv4 Address, third octet
									tx_data <= std_logic_vector(sendDestIPv4Address(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestIPv4Address(15 downto 8) );
								when 33 => -- Dest IPv4 Address, fourth octet
									tx_data <= std_logic_vector(sendDestIPv4Address(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendDestIPv4Address(7 downto 0) );
								when 34 => -- UDP Source Port, high byte
									tx_data <= std_logic_vector(UDP_PROTOCOL_PORT_H2D_UNSIGNED(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, UDP_PROTOCOL_PORT_H2D_UNSIGNED(15 downto 8) );
								when 35 => -- UDP Source Port, low byte
									tx_data <= std_logic_vector(UDP_PROTOCOL_PORT_H2D_UNSIGNED(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, UDP_PROTOCOL_PORT_H2D_UNSIGNED(7 downto 0) );
								when 36 => -- UDP Dest Port, high byte
									tx_data <= std_logic_vector(UDP_PROTOCOL_PORT_D2H_UNSIGNED(15 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, UDP_PROTOCOL_PORT_D2H_UNSIGNED(15 downto 8) );
								when 37 => -- UDP Dest Port, low byte
									tx_data <= std_logic_vector(UDP_PROTOCOL_PORT_D2H_UNSIGNED(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, UDP_PROTOCOL_PORT_D2H_UNSIGNED(7 downto 0) );
								when 38 => -- UDP Packet Length, high byte
									tx_data <= "0000" & std_logic_vector(sendPacketUDPLength(11 downto 8) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, "0000" & sendPacketUDPLength(11 downto 8) );
								when 39 => -- UDP Packet Length, low byte
									tx_data <= std_logic_vector(sendPacketUDPLength(7 downto 0) );
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, sendPacketUDPLength(7 downto 0) );
								when 40 => -- UDP Checksum, high byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 41 => -- UDP Checksum, low byte
									tx_data <= X"00";
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
								when 42 => -- UDP Packet payload first byte is the "magic" byte (0xA5)
									tx_data <= PAYLOAD_MAGIC_HEADER_BYTE;
									sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(PAYLOAD_MAGIC_HEADER_BYTE) );
									send_pkt_data_rd_en <= '1';
									DBG_send_pkt_data_rd_en <= '1';
								when others => -- These bytes may need zero padding if our packet is too small
									if ( (initialPacketSendPtr - 43) < sendPacketPayloadLength) then
										tx_data <= send_pkt_data_rd_data;
										sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, unsigned(send_pkt_data_rd_data) );

										-- Need to fix an issue where we're reading off of the send_pkt_data FIFO one too many times at the end of a data packet
										if ( (initialPacketSendPtr - 43) < sendPacketPayloadLength - 1) then
											send_pkt_data_rd_en <= '1';
										else
											send_pkt_data_rd_en <= '0';
										end if;
										DBG_send_pkt_data_rd_en <= '1';
									else
										tx_data <= X"00";
										sendRunningCRC32 <= EthernetCRC32(sendRunningCRC32, X"00");
										send_pkt_data_rd_en <= '0';
										DBG_send_pkt_data_rd_en <= '0';
									end if;
							end case;

						when others =>
							-- Should never be here!
					end case; -- case send_type is

					tx_en <= '1';
					if (initialPacketSendPtr < sendPacketLastMACPtr) then
						initialPacketSendPtr <= initialPacketSendPtr + 1;
					else
						sendPacketFCSBytesRemain <= (others => '1');

						if (send_type = normalUDPPacketSendType) then
							sendPacketsCount <= sendPacketsCount + 1;
						end if;

						sendEthState <= FCSSequence;
					end if;

				when FCSSequence =>
					-- Unlike the other fields, the FCS is transmitted in little endian byte order, so we need to send the bytes LSByte first/MSByte last:
					case sendPacketFCSBytesRemain is
						when "00" =>
							send_pkt_data_rd_en <= '0';
							DBG_send_pkt_data_rd_en <= '0';
							tx_data <= std_logic_vector(not (sendRunningCRC32(31 downto 24) ) );
						when "01" =>
							if (sendPacketRemainingFIFOPumpBytes >= 1) then
								send_pkt_data_rd_en <= '1';
								DBG_send_pkt_data_rd_en <= '1';
							else
								send_pkt_data_rd_en <= '0';
								DBG_send_pkt_data_rd_en <= '0';
							end if;
							tx_data <= std_logic_vector(not (sendRunningCRC32(23 downto 16) ) );
						when "10" =>
							if (sendPacketRemainingFIFOPumpBytes >= 2) then
								send_pkt_data_rd_en <= '1';
								DBG_send_pkt_data_rd_en <= '1';
							else
								send_pkt_data_rd_en <= '0';
								DBG_send_pkt_data_rd_en <= '0';
							end if;
							tx_data <= std_logic_vector(not (sendRunningCRC32(15 downto 8) ) );
						when others => -- when "11" =>
							if (sendPacketRemainingFIFOPumpBytes = 3) then
								send_pkt_data_rd_en <= '1';
								DBG_send_pkt_data_rd_en <= '1';
							else
								send_pkt_data_rd_en <= '0';
								DBG_send_pkt_data_rd_en <= '0';
							end if;
							tx_data <= std_logic_vector(not (sendRunningCRC32(7 downto 0) ) );
					end case;
					tx_en <= '1';
					if (sendPacketFCSBytesRemain /= 0) then
						sendPacketFCSBytesRemain <= sendPacketFCSBytesRemain - 1;
					else
						sendIPv4PacketIDCounter <= sendIPv4PacketIDCounter + 1;

						if (sendLastPacketSize < 46) then
							sendPacketPaddingBytesRemain <= to_unsigned(to_integer(46 - sendLastPacketSize), 6);
							sendEthState <= minPacketSizePadding;
						else
							sendIPGCyclesRemain <= to_unsigned(TX_INTER_PACKET_GAP_BYTES, 16);
							sendFirstPacketComplete <= '1';
							sendEthState <= interPacketGapWait;
						end if;
					end if;

				when others => --when minPacketSizePadding =>
					tx_data <= (others => '0');
					tx_en <= '1';
					if (sendPacketPaddingBytesRemain /= 0) then
						sendPacketPaddingBytesRemain <= sendPacketPaddingBytesRemain - 1;
					else
						sendIPGCyclesRemain <= to_unsigned(TX_INTER_PACKET_GAP_BYTES, 16);
						sendFirstPacketComplete <= '1';
						sendEthState <= interPacketGapWait;
					end if;
			end case;
		end if;
	end process send_data_process;

	recv_validation_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			if (recvEthState = readyForPacket) then
				-- Reset our packet valid bits when the recv process is in the "readyForPacket" state:
				recvIPv4HeaderChecksum <= (others => '0');
				recvMACFrameValid <= (others => '0');
				recvIPv4HeaderValid <= (others => '0');
				recvUDPHeaderValid <= (others => '0');
				recvPayloadHeaderValid <= (others => '0');
				recvARPHeaderValid <= (others => '0');
			else
				recvIPv4HeaderChecksum <= CalcIPv4HeaderRecvChecksum(recvIPv4PacketHeader);

				if (RX_DISABLE_MAC_ADDR_FILTERING = false) then
					recvMACFrameValid(0) <= ValidateRecvMACAddress(recvMACPacketHeader, unsigned(DEVICE_MAC_ADDRESS_OCTET_5 & DEVICE_MAC_ADDRESS_OCTET_4 & DEVICE_MAC_ADDRESS_OCTET_3 & DEVICE_MAC_ADDRESS_OCTET_2 & DEVICE_MAC_ADDRESS_OCTET_1 & DEVICE_MAC_ADDRESS_OCTET_0) );
				else
					recvMACFrameValid(0) <= '1';
				end if;
				recvMACFrameValid(1) <= ValidateRecvMACEtherType(recvMACPacketHeader);
				if (RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES = false) then
					recvMACFrameValid(2) <= ValidateRecvMACPacketCRC32(recvPacketFCS, recvSavedCRC32_3);
				else
					recvMACFrameValid(2) <= '1';
				end if;

				recvIPv4HeaderValid(0) <= ValidateRecvIPv4HeaderVersion(recvIPv4PacketHeader);
				recvIPv4HeaderValid(1) <= ValidateRecvIPv4HeaderIHL(recvIPv4PacketHeader);
				recvIPv4HeaderValid(2) <= ValidateRecvIPv4HeaderProto(recvIPv4PacketHeader);
				recvIPv4HeaderValid(3) <= ValidateRecvIPv4HeaderNoFragment(recvIPv4PacketHeader);
				if (RX_DISABLE_IPv4_ADDR_FILTERING = false) then
					recvIPv4HeaderValid(4) <= ValidateRecvIPv4HeaderDestIP(recvIPv4PacketHeader, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0 & DEVICE_IPv4_ADDRESS_OCTET_1 & DEVICE_IPv4_ADDRESS_OCTET_2 & DEVICE_IPv4_ADDRESS_OCTET_3) );
				else
					recvIPv4HeaderValid(4) <= '1';
				end if;
				if (RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES = false) then
					recvIPv4HeaderValid(5) <= ValidateRecvIPv4HeaderChecksum(recvIPv4PacketHeader, recvIPv4HeaderChecksum);
				else
					recvIPv4HeaderValid(5) <= '1';
				end if;

				recvUDPHeaderValid(0) <= ValidateRecvUDPPort(recvUDPPacketHeader, to_unsigned(UDP_PROTOCOL_PORT_H2D, 16) );

				recvPayloadHeaderValid(0) <= ValidateRecvPayloadMagicByte(recvPacketMagicByte);

				-- Validate ARP header here:
				recvARPHeaderValid(0) <= ValidateRecvARPHeaderHTYPE(recvUDPPacketHeader & recvIPv4PacketHeader);
				recvARPHeaderValid(1) <= ValidateRecvARPHeaderPTYPE(recvUDPPacketHeader & recvIPv4PacketHeader);
				recvARPHeaderValid(2) <= ValidateRecvARPHeaderHSIZE(recvUDPPacketHeader & recvIPv4PacketHeader);
				recvARPHeaderValid(3) <= ValidateRecvARPHeaderPSIZE(recvUDPPacketHeader & recvIPv4PacketHeader);
				recvARPHeaderValid(4) <= ValidateRecvARPHeaderOpcode(recvUDPPacketHeader & recvIPv4PacketHeader);
				recvARPHeaderValid(5) <= ValidateRecvARPHeaderTargetMAC(recvUDPPacketHeader & recvIPv4PacketHeader, unsigned(DEVICE_MAC_ADDRESS_OCTET_5 & DEVICE_MAC_ADDRESS_OCTET_4 & DEVICE_MAC_ADDRESS_OCTET_3 & DEVICE_MAC_ADDRESS_OCTET_2 & DEVICE_MAC_ADDRESS_OCTET_1 & DEVICE_MAC_ADDRESS_OCTET_0) );
				recvARPHeaderValid(6) <= ValidateRecvARPHeaderTargetIPv4(recvUDPPacketHeader & recvIPv4PacketHeader, unsigned(DEVICE_IPv4_ADDRESS_OCTET_0 & DEVICE_IPv4_ADDRESS_OCTET_1 & DEVICE_IPv4_ADDRESS_OCTET_2 & DEVICE_IPv4_ADDRESS_OCTET_3) );

				DBG_ARPPacketTPA <= std_logic_vector(GetARPHeaderTargetIPv4(recvUDPPacketHeader & recvIPv4PacketHeader) );
				DBG_DeviceTPA <= std_logic_vector(unsigned(DEVICE_IPv4_ADDRESS_OCTET_0 & DEVICE_IPv4_ADDRESS_OCTET_1 & DEVICE_IPv4_ADDRESS_OCTET_2 & DEVICE_IPv4_ADDRESS_OCTET_3) );
			end if;
		end if;
	end process;

	recv_data_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			if (recvARPReplyValid = '1' and sendARPReplyAck = '1') then
				recvARPReplyValid <= '0';
			end if;

			case recvEthState is
				when interPacketGapWait =>
					recv_valid <= '0';
					if (recvIPGCyclesRemain /= 0) then
						recvIPGCyclesRemain <= recvIPGCyclesRemain - 1;
					else
						recvIPGCyclesRemain <= to_unsigned(RX_INTER_PACKET_GAP_BYTES, 16);
						recvEthState <= readyForPacket;
					end if;

				when readyForPacket =>
					-- Pulse the recv_valid signals off
					recv_valid <= '0';

					-- Clear our packet data from the last packet:
					recvMACPacketHeader <= (others => '0');
					recvIPv4PacketHeader <= (others => '0');
					recvUDPPacketHeader <= (others => '0');
					recvPacketMagicByte <= (others => '0');
					recvPacketFCS <= (others => '0');
					recvScratchAddr <= (others => '0');
					recvRunningCRC32 <= (others => '1'); -- Remember that the CRC32 always clears to all 1's

					if (currentState = sendFirstPacket or currentState = readyState) then -- Wait for our "go" signal
						if (rx_dv = '1' and rx_data = PreambleByte) then
							recvEthState <= preambleSequence;
						elsif (rx_dv = '1' and rx_data = SFDByte) then
							recvEthState <= SFDSequence; -- Note that we have to check for the possibility of the SFD here, because it *is* legal for the PCS to drop any or all of the preamble bytes!
						end if;
					end if;

				when preambleSequence =>
					if (rx_dv = '1' and rx_data = SFDByte) then
						recvEthState <= SFDSequence; -- Note that we have to check for the possibility of the SFD here, because it *is* legal for the PCS to drop any or all of the preamble bytes!
					elsif(rx_dv = '0') then
						recvEthState <= readyForPacket;
					end if;

				when SFDSequence =>
					if (rx_dv = '1') then
						if (currentState = readyState) then
							NETPKT_RecvReady <= '1';
						end if;

						-- Start processing our first byte of packet data:
						recvMACPacketHeader(7 downto 0) <= unsigned(rx_data);
						recvPacketFCS(7 downto 0) <= unsigned(rx_data);
						recvRunningCRC32 <= EthernetCRC32(recvRunningCRC32, unsigned(rx_data) );
						recvPacketLength <= to_unsigned(1, 12);
						recvEthState <= packetData;
					else
						recvEthState <= readyForPacket;
					end if;

				when packetData =>
					if (rx_dv = '1') then
						recvPacketFCS(31 downto 24) <= recvPacketFCS(23 downto 16);
						recvPacketFCS(23 downto 16) <= recvPacketFCS(15 downto 8);
						recvPacketFCS(15 downto 8) <= recvPacketFCS(7 downto 0);
						recvPacketFCS(7 downto 0) <= unsigned(rx_data);
						recvSavedCRC32_3 <= recvSavedCRC32_2;
						recvSavedCRC32_2 <= recvSavedCRC32_1;
						recvSavedCRC32_1 <= recvSavedCRC32_0;
						recvSavedCRC32_0 <= not recvRunningCRC32;
						recvRunningCRC32 <= EthernetCRC32(recvRunningCRC32, unsigned(rx_data) );
						recv_scratch_ena <= '0';
						recv_scratch_wea <= "0";

						case recvPacketLength is
							-- MAC header:
							when X"001" => recvMACPacketHeader(2*8-1 downto 1*8) <= unsigned(rx_data);
							when X"002" => recvMACPacketHeader(3*8-1 downto 2*8) <= unsigned(rx_data);
							when X"003" => recvMACPacketHeader(4*8-1 downto 3*8) <= unsigned(rx_data);
							when X"004" => recvMACPacketHeader(5*8-1 downto 4*8) <= unsigned(rx_data);
							when X"005" => recvMACPacketHeader(6*8-1 downto 5*8) <= unsigned(rx_data);
							when X"006" => recvMACPacketHeader(7*8-1 downto 6*8) <= unsigned(rx_data);
							when X"007" => recvMACPacketHeader(8*8-1 downto 7*8) <= unsigned(rx_data);
							when X"008" => recvMACPacketHeader(9*8-1 downto 8*8) <= unsigned(rx_data);
							when X"009" => recvMACPacketHeader(10*8-1 downto 9*8) <= unsigned(rx_data);
							when X"00A" => recvMACPacketHeader(11*8-1 downto 10*8) <= unsigned(rx_data);
							when X"00B" => recvMACPacketHeader(12*8-1 downto 11*8) <= unsigned(rx_data);
							when X"00C" => recvMACPacketHeader(13*8-1 downto 12*8) <= unsigned(rx_data);
							when X"00D" => recvMACPacketHeader(14*8-1 downto 13*8) <= unsigned(rx_data);

							-- IPv4 header:
							when X"00E" => recvIPv4PacketHeader(1*8-1 downto 0*8) <= unsigned(rx_data);
							when X"00F" => recvIPv4PacketHeader(2*8-1 downto 1*8) <= unsigned(rx_data);
							when X"010" => recvIPv4PacketHeader(3*8-1 downto 2*8) <= unsigned(rx_data);
							when X"011" => recvIPv4PacketHeader(4*8-1 downto 3*8) <= unsigned(rx_data);
							when X"012" => recvIPv4PacketHeader(5*8-1 downto 4*8) <= unsigned(rx_data);
							when X"013" => recvIPv4PacketHeader(6*8-1 downto 5*8) <= unsigned(rx_data);
							when X"014" => recvIPv4PacketHeader(7*8-1 downto 6*8) <= unsigned(rx_data);
							when X"015" => recvIPv4PacketHeader(8*8-1 downto 7*8) <= unsigned(rx_data);
							when X"016" => recvIPv4PacketHeader(9*8-1 downto 8*8) <= unsigned(rx_data);
							when X"017" => recvIPv4PacketHeader(10*8-1 downto 9*8) <= unsigned(rx_data);
							when X"018" => recvIPv4PacketHeader(11*8-1 downto 10*8) <= unsigned(rx_data);
							when X"019" => recvIPv4PacketHeader(12*8-1 downto 11*8) <= unsigned(rx_data);
							when X"01A" => recvIPv4PacketHeader(13*8-1 downto 12*8) <= unsigned(rx_data);
							when X"01B" => recvIPv4PacketHeader(14*8-1 downto 13*8) <= unsigned(rx_data);
							when X"01C" => recvIPv4PacketHeader(15*8-1 downto 14*8) <= unsigned(rx_data);
							when X"01D" => recvIPv4PacketHeader(16*8-1 downto 15*8) <= unsigned(rx_data);
							when X"01E" => recvIPv4PacketHeader(17*8-1 downto 16*8) <= unsigned(rx_data);
							when X"01F" => recvIPv4PacketHeader(18*8-1 downto 17*8) <= unsigned(rx_data);
							when X"020" => recvIPv4PacketHeader(19*8-1 downto 18*8) <= unsigned(rx_data);
							when X"021" => recvIPv4PacketHeader(20*8-1 downto 19*8) <= unsigned(rx_data);

							-- UDP header:
							when X"022" => recvUDPPacketHeader(1*8-1 downto 0*8) <= unsigned(rx_data);
							when X"023" => recvUDPPacketHeader(2*8-1 downto 1*8) <= unsigned(rx_data);
							when X"024" => recvUDPPacketHeader(3*8-1 downto 2*8) <= unsigned(rx_data);
							when X"025" => recvUDPPacketHeader(4*8-1 downto 3*8) <= unsigned(rx_data);
							when X"026" => recvUDPPacketHeader(5*8-1 downto 4*8) <= unsigned(rx_data);
							when X"027" => recvUDPPacketHeader(6*8-1 downto 5*8) <= unsigned(rx_data);
							when X"028" => recvUDPPacketHeader(7*8-1 downto 6*8) <= unsigned(rx_data);
							when X"029" => recvUDPPacketHeader(8*8-1 downto 7*8) <= unsigned(rx_data);

							-- Magic byte:
							when X"02A" => recvPacketMagicByte <= unsigned(rx_data);

							-- Data payload:
							when others =>
								recv_scratch_dina <= rx_data;
								recv_scratch_addra <= std_logic_vector(recvScratchAddr);
								recvScratchAddr <= recvScratchAddr + 1;
								recv_scratch_ena <= '1';
								recv_scratch_wea <= "1";
						end case;

						recvPacketLength <= recvPacketLength + 1;
					else
						if (recvScratchAddr(1 downto 0) = "00") then
							recv_scratch_ena <= '0';
							recv_scratch_wea <= "0";
							recvEthState <= recvProcessPacket;
						else
							recv_scratch_ena <= '1';
							recv_scratch_wea <= "1";
							recvScratchAddr <= recvScratchAddr + 1;
							recv_scratch_addra <= std_logic_vector(recvScratchAddr);
							recv_scratch_dina <= (others => '0');
							recvEthState <= recvAlignPacket4;
						end if;
					end if;

				when recvAlignPacket4 =>
					if (recvScratchAddr(1 downto 0) = "00") then
						recv_scratch_ena <= '0';
						recv_scratch_wea <= "0";
						recvEthState <= recvProcessPacket;
					else
						recv_scratch_ena <= '1';
						recv_scratch_wea <= "1";
						recvScratchAddr <= recvScratchAddr + 1;
						recv_scratch_addra <= std_logic_vector(recvScratchAddr);
						recv_scratch_dina <= (others => '0');
					end if;

				when FCSSequence =>
					if (rx_dv = '1') then
						case recvPacketFCSBytesRemain is
							when "00" =>
								recvPacketFCS(7 downto 0) <= unsigned(rx_data);
							when "01" =>
								recvPacketFCS(15 downto 8) <= unsigned(rx_data);
							when "10" =>
								recvPacketFCS(23 downto 16) <= unsigned(rx_data);
							when others => -- when "11" =>
								recvPacketFCS(31 downto 24) <= unsigned(rx_data);
						end case;
						if (recvPacketFCSBytesRemain /= 0) then
							recvPacketFCSBytesRemain <= recvPacketFCSBytesRemain - 1;
						else
							if (recvPacketLength < 46) then
								recvPacketPaddingBytesRemain <= to_unsigned(to_integer(46 - recvPacketLength), 6);
								recvEthState <= minPacketSizePadding;
							else
								recvIPGCyclesRemain <= to_unsigned(RX_INTER_PACKET_GAP_BYTES, 16);
								recvEthState <= interPacketGapWait;
							end if;
						end if;
					else
						recvIPGCyclesRemain <= to_unsigned(RX_INTER_PACKET_GAP_BYTES, 16);
						recvEthState <= interPacketGapWait;
					end if;

				when minPacketSizePadding =>
					if (rx_dv = '1' and recvPacketPaddingBytesRemain /= 0) then
						recvPacketPaddingBytesRemain <= recvPacketPaddingBytesRemain - 1;
					else
						recvIPGCyclesRemain <= to_unsigned(RX_INTER_PACKET_GAP_BYTES, 16);
						recvEthState <= interPacketGapWait;
					end if;

				when recvProcessPacket =>
					-- If all validation checks pass, then this is a valid packet and can be replied to!
					recv_valid <= '0';
					if (recvMACFrameValid = "111") then
						-- IPv4 UDP packet:
						if (recvIPv4HeaderValid = "111111" and
							recvUDPHeaderValid = "1" and
							recvPayloadHeaderValid = "1") then
							recv_store_MACAddr <= GetMACHeaderSourceAddress(recvMACPacketHeader);
							recv_store_IPv4Addr <= GetIPv4HeaderSourceIPAddr(recvIPv4PacketHeader);
							recv_store_PktLength <= GetUDPHeaderLength12b(recvUDPPacketHeader) - (8 + 1); -- Subtract off the UDP header size (8 bytes) and the magic byte size (1 byte) to get the logical packet size
							stat_count_valid_recv_udp_packets <= stat_count_valid_recv_udp_packets + 1;
							recv_valid <= '1';
						elsif (recvARPHeaderValid = "1111111") then -- ARP packet:
							recv_store_MACAddr <= GetMACHeaderSourceAddress(recvMACPacketHeader);
							recvARPReply_SHA <= GetARPHeaderSenderMAC(recvUDPPacketHeader & recvIPv4PacketHeader);
							recvARPReply_SPA <= HToNL(GetARPHeaderSenderIPv4(recvUDPPacketHeader & recvIPv4PacketHeader) );
							stat_count_valid_recv_arp_packets <= stat_count_valid_recv_arp_packets + 1;
							recvARPReplyValid <= '1';
						else
							stat_count_invalid_recv_packets <= stat_count_invalid_recv_packets + 1;
						end if;
					else
						stat_count_invalid_recv_packets <= stat_count_invalid_recv_packets + 1;
					end if;
					recvEthState <= interPacketGapWait;
			end case;
		end if;
	end process recv_data_process;

	recv_fifo_push_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			case recv_fifo_push_state is
				when recvFifoIdle =>
					recv_pkt_header_wr_en <= '0';
					recv_pkt_data_wr_en <= '0';
					recv_scratch_enb <= '0';

					if (recv_valid = '1') then
						-- First check to see if we can fit this new packet into our recv FIFOs:
						if (recv_pkt_header_prog_full = '0' and 
							GetPacketSizeInDWORDs(recv_store_PktLength) <= CalcAvailableSpaceInRecvFIFO(unsigned(recv_pkt_data_count) ) ) then
							-- Update our header struct with the latest incoming packet header info:
							recv_fifo_current_header.pktLength <= recv_store_PktLength;
							recv_fifo_current_header.hostMACAddress <= recv_store_MACAddr;
							recv_fifo_current_header.hostIPv4Address <= NToHL(recv_store_IPv4Addr);

							recv_fifo_pkt_length_DWORDs <= GetPacketSizeInDWORDs(recv_store_PktLength);
							recv_fifo_current_push_DWORD <= (others => '0');

							-- Start reading our first DWORD from the scratch recv FIFO:
							recv_scratch_addrb <= std_logic_vector(to_unsigned(0, 9) );
							recv_scratch_enb <= '1';

							recv_fifo_push_state <= waitForReadLatency0;
						else
							-- Drop our packet since we don't have enough space in the FIFO's to store it!
							-- Don't worry, the protocol is based on UDP and retransmits automatically. So if we don't have space now, we'll have space for it later.
							stat_count_dropped_recv_packets <= stat_count_dropped_recv_packets + 1;
						end if;
					end if;

					-- We need another cycle of latency here to wait for the read to come back
				when waitForReadLatency0 =>
					if (recv_fifo_pkt_length_DWORDs > 0) then
						recv_scratch_addrb <= std_logic_vector(to_unsigned(1, 9) );
						recv_fifo_current_push_DWORD <= to_unsigned(1, 9);
						recv_scratch_enb <= '1';
					end if;

					recv_fifo_push_state <= pushDWORD0;

				when pushDWORD0 =>
					recv_pkt_header_wr_data <= std_logic_vector(recv_fifo_current_header.hostMACAddress(15 downto 0) ) & "0000" & std_logic_vector(recv_fifo_current_header.pktLength);
					recv_pkt_header_wr_en <= '1';

					if (recv_fifo_pkt_length_DWORDs > 1) then
						recv_pkt_data_wr_data <= recv_scratch_doutb;
						recv_pkt_data_wr_en <= '1';

						recv_scratch_addrb <= std_logic_vector(to_unsigned(2, 9) );
						recv_fifo_current_push_DWORD <= to_unsigned(2, 9);
						recv_scratch_enb <= '1';
					else
						recv_pkt_data_wr_en <= '0';
					end if;

					recv_fifo_push_state <= pushDWORD1;

				when pushDWORD1 =>
					recv_pkt_header_wr_data <= std_logic_vector(recv_fifo_current_header.hostMACAddress(6*8-1 downto 2*8) );
					recv_pkt_header_wr_en <= '1';

					if (recv_fifo_pkt_length_DWORDs > 1) then
						recv_pkt_data_wr_data <= recv_scratch_doutb;
						recv_pkt_data_wr_en <= '1';

						recv_scratch_addrb <= std_logic_vector(to_unsigned(3, 9) );
						recv_fifo_current_push_DWORD <= to_unsigned(3, 9);
						recv_scratch_enb <= '1';
					else
						recv_pkt_data_wr_en <= '0';
					end if;
					
					recv_fifo_push_state <= pushDWORD2;

				when pushDWORD2 =>
					recv_pkt_header_wr_data <= std_logic_vector(recv_fifo_current_header.hostIPv4Address(31 downto 0) );
					recv_pkt_header_wr_en <= '1';

					if (recv_fifo_pkt_length_DWORDs > 2) then
						recv_pkt_data_wr_data <= recv_scratch_doutb;
						recv_pkt_data_wr_en <= '1';

						recv_scratch_addrb <= std_logic_vector(to_unsigned(4, 9) );
						recv_fifo_current_push_DWORD <= to_unsigned(4, 9);
						recv_scratch_enb <= '1';
					else
						recv_pkt_data_wr_en <= '0';
					end if;

					if (recv_fifo_pkt_length_DWORDs > 3) then
						recv_fifo_push_state <= pushRemainingData;
					else
						recv_fifo_push_state <= recvFifoIdle;
					end if;

				when pushRemainingData =>
					recv_pkt_header_wr_en <= '0';

					recv_pkt_data_wr_data <= recv_scratch_doutb;
					recv_pkt_data_wr_en <= '1';

					if (recv_fifo_current_push_DWORD = recv_fifo_pkt_length_DWORDs) then
						recv_scratch_enb <= '0';
						recv_fifo_push_state <= recvFifoIdle;
					else
						recv_scratch_addrb <= std_logic_vector(recv_fifo_current_push_DWORD + 1);
						recv_scratch_enb <= '1';
						recv_fifo_current_push_DWORD <= recv_fifo_current_push_DWORD + 1;
					end if;

			end case;
		end if;
	end process recv_fifo_push_process;

end Behavioral;
