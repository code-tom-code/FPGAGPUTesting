library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet types library so we can access all of the shared enums and struct definitions in there
library work;
use work.NetProtoHelpers_Core.all;
use work.PacketType.all;

entity NetProtoPacketProcessor is
	Generic (
		-- This is the major and minor version of the network protocol. If the major version does not match with the host's major version, then
		-- a connection will not be established!
		NET_PROTOCOL_MAJOR_VERSION : natural range 0 to 255 := 1;
		NET_PROTOCOL_MINOR_VERSION : natural range 0 to 255 := 0;

		-- How many DWORD's of capacity does the Send Packet Data FIFO have?
		SEND_PKT_DATA_CAPACITY_DWORDS : positive range 16 to 131072 := 2048
	);
	Port (
	-- 333.25MHz Main clock domain interfaces:
		clk333_250 : in STD_LOGIC;

	-- IO Data FIFO's
		recv_pkt_header_empty : in STD_LOGIC;
		recv_pkt_header_rd_data : in STD_LOGIC_VECTOR(31 downto 0);
		recv_pkt_header_rd_en : out STD_LOGIC := '0';

		recv_pkt_data_empty : in STD_LOGIC;
		recv_pkt_data_rd_data : in STD_LOGIC_VECTOR(31 downto 0);
		recv_pkt_data_rd_en : out STD_LOGIC := '0';

		send_pkt_header_prog_full : in STD_LOGIC;
		send_pkt_header_wr_data : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		send_pkt_header_wr_en : out STD_LOGIC := '0';

		send_pkt_data_count : in STD_LOGIC_VECTOR(10 downto 0);
		send_pkt_data_wr_data : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		send_pkt_data_wr_en : out STD_LOGIC := '0';
	-- End IO Data FIFO's

	-- Ethernet Controller interface:
		ETHCTRL_SendReady : in STD_LOGIC; -- Set to '1' when we are ready to send packets over the network, '0' otherwise.
		ETHCTRL_RecvReady : in STD_LOGIC; -- Set to '1' when we are ready to receive packets from the network, '0' otherwise.
	-- End Ethernet Controller interface

	-- Command Processor FIFO's
		-- Valid packets FIFO inputs to the Command Processor from the host:
        validPacketsFIFO_wr_data : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
        validPacketsFIFO_full : in STD_LOGIC;
        validPacketsFIFO_wr_en : out STD_LOGIC := '0';

		-- Return packet FIFO outputs from the Command Processor to the host:
		returnPacketsFIFO_empty : in STD_LOGIC;
		returnPacketsFIFO_rd_data : in STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
		returnPacketsFIFO_rd_en : out STD_LOGIC := '0';
	-- End Command Processor FIFO's

	-- Debug signals
		DBG_NetPkt_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_SendFIFOState : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_RecvFIFOState : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');

		DBG_recvSendReplyPacket : out STD_LOGIC := '0';
		DBG_sendReplyAck : out STD_LOGIC := '0';
		DBG_sendHandlingReply : out STD_LOGIC := '0';
		DBG_recvPacketData : out STD_LOGIC_VECTOR(8*8-1 downto 0)
		);
end NetProtoPacketProcessor;

architecture Behavioral of NetProtoPacketProcessor is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE FSM_ENCODING : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk333_250: SIGNAL is "xilinx.com:signal:clock:1.0 clk333_250 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk333_250: SIGNAL is "FREQ_HZ 333333333"; -- Remember to change this back when we use a real 333.250MHz clock in the actual design

ATTRIBUTE X_INTERFACE_INFO of recv_pkt_header_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_header_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_EN";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_header_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header EMPTY";

ATTRIBUTE X_INTERFACE_INFO of recv_pkt_data_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_data_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_EN";
ATTRIBUTE X_INTERFACE_INFO of recv_pkt_data_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data EMPTY";

ATTRIBUTE X_INTERFACE_INFO of send_pkt_header_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_header_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_EN";

ATTRIBUTE X_INTERFACE_INFO of send_pkt_data_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of send_pkt_data_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_EN";

ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO EMPTY";

type NetPktStateType is 
(
	init, -- 0
	waitForNetSystemReady, -- 1
	unconnectedSendingNonSessionBroadcasts, -- 2
	sessionConnectedReady -- 3
);

type SessionConnectRequestReplyStatus is
(
	-- Success! We have a new session!
	acceptNewSession, -- 0

	-- Error status codes follow:
	errInvalidRequestLength, -- 1 -- The length of the host's "request session connect" packet was not valid.
	errInvalidNetProtoMajorVer, -- 2 -- The major net proto version doesn't match between the host and device.
	errInvalidPacketType, -- 3 -- The only packet type allowed from a host before a session is established is the "request session connect" packet.
	errInvalidIPv4Addr, -- 4 -- The host used an invalid IPv4 address (0x00000000 or 0xFFFFFFFF are both considered "invalid")
	errMismatchIPv4Addr -- 5 -- The IPv4 address that the host used doesn't match the IPv4 address of the sent packet.
);

type FIFOAccessState is
(
	accessIdle, -- 0
	accessDWORD0, -- 1 -- The first DWORD contains the packet length (low 2 bytes), as well as the first two bytes of the host's MAC address (high 2 bytes)
	accessDWORD1, -- 2 -- The second DWORD contains the final 4 bytes of the host's MAC address
	accessDWORD2, -- 3 -- The third DWORD contains the 4 bytes of the host's IPv4 address
	accessRemainingData -- 4 -- This is used if our packet length is greater than 12 bytes. It's used to push/pop one DWORD at a time of packet data on the packet data FIFO.
);

type SessionState is record
	hostMACAddress : unsigned(6*8-1 downto 0);
	hostIPv4Address : unsigned(4*8-1 downto 0);
	hostAckedFirstPacket : std_logic;
end record;

-- This struct represents required header info passed to/from the ethernet controller.
-- Size is 12 bytes
type EthernetPacketHeaderInfo is record
	-- The packet length is the number of bytes in the UDP data payload (not counting the UDP header size, IPv4 header size, MAC header size, or protocol magic byte) and how many bytes are in the data stream FIFO.
	packetLength : unsigned(15 downto 0);

	-- For recv packets, this is the MAC addr and IPv4 addr of the host who sent us this packet.
	-- For send packets, this is the MAC addr and IPv4 addr of the host who we're sending the packet to.
	hostMACAddress : unsigned(6*8-1 downto 0);
	hostIPv4Address : unsigned(4*8-1 downto 0);
end record;

-- PacketLength is 16 bytes, packet is D2H (broadcast)
type NetNonSessionBroadcastPacket is record
	packetType : unsigned(7 downto 0); -- The packet type is always "PT_CONNBROADCAST"

	-- The version of the network protocol that the sending device uses to communicate.
	netProtoVersionMajorDevice : unsigned(7 downto 0); -- The host and device may establish a session only if their MAJOR network protocol versions match.
	netProtoVersionMinorDevice : unsigned(7 downto 0); -- The minor version of the network protocol is allowed to differ between the host and device.

	deviceMACAddress : unsigned(6*8-1 downto 0); -- The MAC address of the broadcasting device
	deviceIPv4Address : unsigned(4*8-1 downto 0); -- The IPv4 address of the broadcasting device
	numBroadcastsSinceReset : unsigned(15 downto 0); -- The number of broadcasts that this device has emitted since power-on, or since the last host disconnected (wraps around to 0 on overflow)
	hasLostSession : unsigned(7 downto 0); -- 0 if this device has just powered on, or 1 if this device has previously lost a session with a host.
end record;

-- PacketLength is 8 bytes, packet is H2D
type NetHostRequestConnectSessionPacket is record
	packetType : unsigned(7 downto 0); -- The packet type is always "PT_CONNREQUEST"

	-- The version of the network protocol that the sending host uses to communicate.
	netProtoVersionMajorHost : unsigned(7 downto 0); -- The host and device may establish a session only if their MAJOR network protocol versions match.
	netProtoVersionMinorHost : unsigned(7 downto 0); -- The minor version of the network protocol is allowed to differ between the host and device.

	unusedPadding : unsigned(7 downto 0); -- This byte is currently unused, and just pads the packet payload to 8 bytes

	hostIPv4Address : unsigned(4*8-1 downto 0); -- The IPv4 address of the connecting host. This is checked against the actual IPv4 address that the packet comes in on to make sure it matches.
end record;

-- PacketLength is 2 bytes, packet is D2H
type NetDeviceConnectSessionResponsePacket is record
	packetType : unsigned(7 downto 0); -- The packet type is always "PT_CONNRESPONSE"

	sessionStatus : unsigned(7 downto 0); -- Status can be "0" which means that the session is accepted, or it can be a nonzero error code status value that explains why the session failed to be created.
end record;

-- This same struct is used for both sending and receiving packet data *after* a valid session is accepted and established by the device.
-- PacketLength is 8 bytes + subpacketCount * sizeof(SimplifiedCommandListPacket), packets may be either H2D or D2H
type NetSessionPacketHeader is record
	-- IPv4 header (20 bytes without any options)

	-- UDP header (8 bytes)

	-- magicProtoValue : unsigned(7 downto 0); -- The "magic" byte always comes first, and is always 0xA5, and it's automatically inserted by the Ethernet controller, so we don't need to transmit it in the FIFO header info.

	packetType : unsigned(7 downto 0);

	thisPacketID : unsigned(15 downto 0); -- This current packet's packet ID (monotonically incrementing integer)
	lastAckedPacketID : unsigned(15 downto 0); -- Packet ID of the most recently received packet
	packetChecksum : unsigned(7 downto 0); -- Doesn't need to necessarily be a sum, but this should validate that the (header? all data?) of this packet is not corrupted
	packetFlags : unsigned(7 downto 0); -- 0 = Normal network packet, 1 = Part of a large multi-packet data stream. Other flags values currently reserved for future use.
	subpacketCount : unsigned(7 downto 0); -- How many subpackets are stuffed into this network packet (invalid for this to be less than 1 or greater than 1472/sizeof(SimplifiedCommandListPacket) = 163)

	-- Subpacket data follows the header (see PacketType.vhd for more info)
end record;

constant ResetSessionState : SessionState := (hostMACAddress => (others => '0'), hostIPv4Address => (others => '0'), hostAckedFirstPacket => '0');

constant DefaultPacketHeaderInfo : EthernetPacketHeaderInfo := (packetLength => (others => '0'), hostMACAddress => (others => '0'), hostIPv4Address => (others => '0') );

constant ClocksBetweenBroadcasts : unsigned(31 downto 0) := to_unsigned(333250000, 32);

constant NetNonSessionBroadcastPacketLength : positive := 16;
constant NetHostRequestConnectSessionPacketLength : positive := 8;
constant NetDeviceConnectSessionResponsePacketLength : positive := 2;
constant NetSessionPacketHeaderMinPacketLength : positive := 8;

pure function GetEthernetPacketHeaderInfoFirstDWORD(packetHeaderInfo : EthernetPacketHeaderInfo) return unsigned is
begin
	return packetHeaderInfo.hostMACAddress(2*8-1 downto 0) & packetHeaderInfo.packetLength;
end function;

pure function GetEthernetPacketHeaderInfoSecondDWORD(packetHeaderInfo : EthernetPacketHeaderInfo) return unsigned is
begin
	return packetHeaderInfo.hostMACAddress(6*8-1 downto 2*8);
end function;

pure function GetEthernetPacketHeaderInfoThirdDWORD(packetHeaderInfo : EthernetPacketHeaderInfo) return unsigned is
begin
	return packetHeaderInfo.hostIPv4Address;
end function;

procedure LoadPacketHeaderInfoFirstDWORD(
	signal packetHeaderInfo : out EthernetPacketHeaderInfo;
	constant DWORDFromFIFO : in unsigned(31 downto 0) ) is
begin
	packetHeaderInfo.packetLength <= DWORDFromFIFO(15 downto 0);
	packetHeaderInfo.hostMACAddress(2*8-1 downto 0) <= DWORDFromFIFO(31 downto 16);
end procedure;

procedure LoadPacketHeaderInfoSecondDWORD(
	signal packetHeaderInfo : out EthernetPacketHeaderInfo;
	constant DWORDFromFIFO : in unsigned(31 downto 0) ) is
begin
	packetHeaderInfo.hostMACAddress(6*8-1 downto 2*8) <= DWORDFromFIFO;
end procedure;

procedure LoadPacketHeaderInfoThirdDWORD(
	signal packetHeaderInfo : out EthernetPacketHeaderInfo;
	constant DWORDFromFIFO : in unsigned(31 downto 0) ) is
begin
	packetHeaderInfo.hostIPv4Address <= DWORDFromFIFO;
end procedure;

pure function ConstructSendBroadcastPacket(broadcastsSinceReset : unsigned(15 downto 0) ) return NetNonSessionBroadcastPacket is
	variable retPacket : NetNonSessionBroadcastPacket;
begin
	retPacket.packetType := to_unsigned(ePacketType'pos(PT_CONNBROADCAST), 8);
	retPacket.netProtoVersionMajorDevice := to_unsigned(NET_PROTOCOL_MAJOR_VERSION, 8);
	retPacket.netProtoVersionMinorDevice := to_unsigned(NET_PROTOCOL_MINOR_VERSION, 8);

	-- Device's MAC ID: 00:0A:35:03:78:F1
	retPacket.deviceMACAddress(1*8-1 downto 0*8) := to_unsigned(16#00#, 8); -- TODO: Don't hardcode this
	retPacket.deviceMACAddress(2*8-1 downto 1*8) := to_unsigned(16#0A#, 8);
	retPacket.deviceMACAddress(3*8-1 downto 2*8) := to_unsigned(16#35#, 8);
	retPacket.deviceMACAddress(4*8-1 downto 3*8) := to_unsigned(16#03#, 8);
	retPacket.deviceMACAddress(5*8-1 downto 4*8) := to_unsigned(16#78#, 8);
	retPacket.deviceMACAddress(6*8-1 downto 5*8) := to_unsigned(16#F1#, 8);

	-- Device's IP address: 192.168.1.170
	retPacket.deviceIPv4Address(1*8-1 downto 0*8) := to_unsigned(192, 8); -- TODO: Don't hardcode this
	retPacket.deviceIPv4Address(2*8-1 downto 1*8) := to_unsigned(168, 8);
	retPacket.deviceIPv4Address(3*8-1 downto 2*8) := to_unsigned(1, 8);
	retPacket.deviceIPv4Address(4*8-1 downto 3*8) := to_unsigned(170, 8);

	retPacket.numBroadcastsSinceReset := broadcastsSinceReset;

	retPacket.hasLostSession := X"00"; -- Not yet implemented

	return retPacket;
end function;

procedure SerializeSendBroadcastPacketData(
	constant broadcastPacket : in NetNonSessionBroadcastPacket;
	signal packetDataBuffer : out unsigned(16*8-1 downto 0) ) is
begin
	packetDataBuffer(1*8-1 downto 0*8) <= broadcastPacket.packetType;
	packetDataBuffer(2*8-1 downto 1*8) <= broadcastPacket.netProtoVersionMajorDevice;
	packetDataBuffer(3*8-1 downto 2*8) <= broadcastPacket.netProtoVersionMinorDevice;
	packetDataBuffer(4*8-1 downto 3*8) <= broadcastPacket.deviceMACAddress(1*8-1 downto 0*8);
	packetDataBuffer(5*8-1 downto 4*8) <= broadcastPacket.deviceMACAddress(2*8-1 downto 1*8);
	packetDataBuffer(6*8-1 downto 5*8) <= broadcastPacket.deviceMACAddress(3*8-1 downto 2*8);
	packetDataBuffer(7*8-1 downto 6*8) <= broadcastPacket.deviceMACAddress(4*8-1 downto 3*8);
	packetDataBuffer(8*8-1 downto 7*8) <= broadcastPacket.deviceMACAddress(5*8-1 downto 4*8);
	packetDataBuffer(9*8-1 downto 8*8) <= broadcastPacket.deviceMACAddress(6*8-1 downto 5*8);
	packetDataBuffer(10*8-1 downto 9*8) <= broadcastPacket.deviceIPv4Address(1*8-1 downto 0*8);
	packetDataBuffer(11*8-1 downto 10*8) <= broadcastPacket.deviceIPv4Address(2*8-1 downto 1*8);
	packetDataBuffer(12*8-1 downto 11*8) <= broadcastPacket.deviceIPv4Address(3*8-1 downto 2*8);
	packetDataBuffer(13*8-1 downto 12*8) <= broadcastPacket.deviceIPv4Address(4*8-1 downto 3*8);
	packetDataBuffer(15*8-1 downto 13*8) <= broadcastPacket.numBroadcastsSinceReset;
	packetDataBuffer(16*8-1 downto 15*8) <= broadcastPacket.hasLostSession;
end procedure;

-- Function returns true if the given packet header info has valid MAC and IPv4 addresses
pure function ValidateRecvPacketAddresses(recvPacketHeaderInfo : EthernetPacketHeaderInfo) return boolean is
begin
	if (recvPacketHeaderInfo.hostMACAddress = X"000000000000" or recvPacketHeaderInfo.hostMACAddress = X"FFFFFFFFFFFF") then
		return false;
	elsif (recvPacketHeaderInfo.hostIPv4Address = X"00000000" or recvPacketHeaderInfo.hostIPv4Address = X"FFFFFFFF") then
		return false;
	else
		return true;
	end if;
end function;

pure function DeserializeNetHostRequestConnectSessionPacket(recvPacketDataBuffer : unsigned(NetHostRequestConnectSessionPacketLength*8-1 downto 0) ) return NetHostRequestConnectSessionPacket is
	variable retPacket : NetHostRequestConnectSessionPacket;
begin
	retPacket.packetType := recvPacketDataBuffer(8*1-1 downto 8*0);
	retPacket.netProtoVersionMajorHost := recvPacketDataBuffer(8*2-1 downto 8*1);
	retPacket.netProtoVersionMinorHost := recvPacketDataBuffer(8*3-1 downto 8*2);
	retPacket.unusedPadding := recvPacketDataBuffer(8*4-1 downto 8*3);
	retPacket.hostIPv4Address := recvPacketDataBuffer(8*8-1 downto 8*4);
	return retPacket;
end function;

-- Reverses the bytes in a 32-bit DWORD to go from little endian byte ordering to big endian (network byte order)
pure function HToNL(dwordLittleEndian : unsigned(31 downto 0) ) return unsigned is
begin
	return (dwordLittleEndian(7 downto 0) ) & (dwordLittleEndian(15 downto 8) ) & (dwordLittleEndian(23 downto 16) ) & (dwordLittleEndian(31 downto 24) );
end function;

pure function GetDWORDCountFromPacketLength(packetLengthBytes : unsigned(15 downto 0) ) return natural is
begin
	return natural(to_integer( (packetLengthBytes + 3) srl 2) );
end function;

pure function GetDWORDCountFromKnownLength(packetLengthBytes : positive) return natural is
begin
	return natural( (packetLengthBytes + 3) / 4);
end function;

-- Master state machine signals:
signal currentState : NetPktStateType := init;
signal currentSessionState : SessionState := ResetSessionState;

-- Packet send state machine signals:
signal sendLastAckedPacketID : unsigned(15 downto 0) := (others => '0'); -- What is the packetID of the packet that the host has last ack'd?
signal sendLastSendPacketID : unsigned(15 downto 0) := (others => '0'); -- We need to keep resending packets with ID's between sendLastSendPacketID and sendLastAckedPacketID
signal sendClocksBetweenBroadcastsWait : unsigned(31 downto 0) := ClocksBetweenBroadcasts;
signal sendNumBroadcastsSinceReset : unsigned(15 downto 0) := (others => '0');
signal sendFIFOAccess : FIFOAccessState := accessIdle;
signal sendCurrentPacket : EthernetPacketHeaderInfo := DefaultPacketHeaderInfo;
signal sendPacketHeaderBuffer : unsigned(16*8-1 downto 0) := (others => '0');
signal sendReplyAck : std_logic := '0'; -- Ack to the recv process that we've received and copied off the packet header info and response data
signal sendHandlingReply : std_logic := '0';
signal sendHasRepliedSuccessfulConnection : std_logic := '0';

-- Packet recv state machine signals:
signal recvLastAckedPacketID : unsigned(15 downto 0) := (others => '0');
signal recvFIFOAccess : FIFOAccessState := accessIdle;
signal recvCurrentPacket : EthernetPacketHeaderInfo := DefaultPacketHeaderInfo;
signal recvPacketHeaderBuffer : unsigned(8*8-1 downto 0) := (others => '0');
signal recvCurrentSubpacketBuffer : unsigned(8*9-1 downto 0) := (others => '0');
signal recvPumpFIFO : std_logic := '0';
signal recvSendReplyPacket : std_logic := '0';
signal recvReplyStatus : SessionConnectRequestReplyStatus := acceptNewSession;

-- Tell the auto-FSM encoding optimizer not to touch our state enums so that we can use them for debugging!
ATTRIBUTE FSM_ENCODING of currentState: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of sendFIFOAccess: SIGNAL is "user_encoding";
ATTRIBUTE FSM_ENCODING of recvFIFOAccess: SIGNAL is "user_encoding";

begin

DBG_NetPkt_State <= std_logic_vector(to_unsigned(NetPktStateType'pos(currentState), 5) );
DBG_SendFIFOState <= std_logic_vector(to_unsigned(FIFOAccessState'pos(sendFIFOAccess), 5) );
DBG_RecvFIFOState <= std_logic_vector(to_unsigned(FIFOAccessState'pos(recvFIFOAccess), 5) );

DBG_recvSendReplyPacket <= recvSendReplyPacket;
DBG_sendReplyAck <= sendReplyAck;
DBG_sendHandlingReply <= sendHandlingReply;

DBG_recvPacketData <= std_logic_vector(recvPacketHeaderBuffer);

	mainStateMachine: process(clk333_250)
	begin
		if (rising_edge(clk333_250) ) then
			case currentState is
				when init =>
					-- Reset our last acked packet ID's:
					sendLastAckedPacketID <= (others => '0');
					sendLastSendPacketID <= (others => '0');
					recvLastAckedPacketID <= (others => '0');

					-- Reset our session state:
					currentSessionState <= ResetSessionState;

					currentState <= waitForNetSystemReady;

				when waitForNetSystemReady =>
					if (ETHCTRL_SendReady = '1' and ETHCTRL_RecvReady = '1') then
						currentState <= unconnectedSendingNonSessionBroadcasts;
					end if;

				when unconnectedSendingNonSessionBroadcasts =>
					if (sendHasRepliedSuccessfulConnection = '1') then
						currentState <= sessionConnectedReady;
					end if;

				when sessionConnectedReady =>

			end case;
		end if;
	end process mainStateMachine;

	send_data_process: process(clk333_250)
	begin
		if (rising_edge(clk333_250) ) then
			send_pkt_header_wr_en <= '0';
			send_pkt_data_wr_en <= '0';

			case currentState is
				when init =>
					sendClocksBetweenBroadcastsWait <= ClocksBetweenBroadcasts;
					sendNumBroadcastsSinceReset <= (others => '0');
					sendFIFOAccess <= accessIdle;
					sendReplyAck <= '0';
					sendHandlingReply <= '0';
					sendHasRepliedSuccessfulConnection <= '0';

				when waitForNetSystemReady =>
					-- Do nothing while we wait for the net system to be ready.

				when unconnectedSendingNonSessionBroadcasts =>
					sendReplyAck <= '0';
					if (sendHandlingReply = '1') then
						case sendFIFOAccess is
							when accessIdle => -- 0
								if ( (send_pkt_header_prog_full = '0') and 
									(to_integer(unsigned(send_pkt_data_count) ) + GetDWORDCountFromKnownLength(NetDeviceConnectSessionResponsePacketLength) < SEND_PKT_DATA_CAPACITY_DWORDS) ) then
									sendCurrentPacket.packetLength <= to_unsigned(NetDeviceConnectSessionResponsePacketLength, 16);
									sendFIFOAccess <= accessDWORD0;
								end if;

							when accessDWORD0 => -- 1
								send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoFirstDWORD(sendCurrentPacket) );
								send_pkt_header_wr_en <= '1';
								send_pkt_data_wr_data <= std_logic_vector(sendPacketHeaderBuffer(31 downto 0) );
								send_pkt_data_wr_en <= '1';
								sendFIFOAccess <= accessDWORD1;

							when accessDWORD1 => -- 2
								send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoSecondDWORD(sendCurrentPacket) );
								send_pkt_header_wr_en <= '1';
								send_pkt_data_wr_en <= '0';
								sendFIFOAccess <= accessDWORD2;

							when accessDWORD2 => -- 3
								send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoThirdDWORD(sendCurrentPacket) );
								send_pkt_header_wr_en <= '1';
								send_pkt_data_wr_en <= '0';
								sendFIFOAccess <= accessRemainingData;

							when accessRemainingData => -- 4
								send_pkt_header_wr_en <= '0';
								send_pkt_data_wr_en <= '0';
								sendHandlingReply <= '0'; -- We're done handling the reply!
								sendReplyAck <= '1'; -- Make sure to ack to the recv process so it knows that we've sent its reply
								if (sendPacketHeaderBuffer(15 downto 8) = to_unsigned(SessionConnectRequestReplyStatus'pos(acceptNewSession), 8) ) then
									sendHasRepliedSuccessfulConnection <= '1'; -- If we replied with the success status, then mark our new session as established!
								end if;
								sendFIFOAccess <= accessIdle;
						end case;
					else
						if (recvSendReplyPacket = '1' and sendReplyAck = '0') then
							sendCurrentPacket <= recvCurrentPacket;
							sendPacketHeaderBuffer(7 downto 0) <= to_unsigned(ePacketType'pos(PT_CONNRESPONSE), 8);
							sendPacketHeaderBuffer(15 downto 8) <= to_unsigned(SessionConnectRequestReplyStatus'pos(recvReplyStatus), 8);
							sendPacketHeaderBuffer(23 downto 16) <= to_unsigned(SessionConnectRequestReplyStatus'pos(recvReplyStatus), 8);
							sendPacketHeaderBuffer(31 downto 24) <= to_unsigned(ePacketType'pos(PT_CONNRESPONSE), 8);
							sendHandlingReply <= '1';
							sendClocksBetweenBroadcastsWait <= ClocksBetweenBroadcasts; -- Reset our broadcast counter if we need to send out a reply packet
						else
							if (sendClocksBetweenBroadcastsWait = 0) then

								-- Fill in our to-send packet buffer with data:
								SerializeSendBroadcastPacketData(ConstructSendBroadcastPacket(sendNumBroadcastsSinceReset), sendPacketHeaderBuffer);
								case sendFIFOAccess is
									when accessIdle => -- 0
										send_pkt_header_wr_en <= '0';
										send_pkt_data_wr_en <= '0';
										if ( (send_pkt_header_prog_full = '0') and 
											(to_integer(unsigned(send_pkt_data_count) ) + GetDWORDCountFromKnownLength(NetNonSessionBroadcastPacketLength) < SEND_PKT_DATA_CAPACITY_DWORDS) ) then
											sendCurrentPacket.hostMACAddress <= X"FFFFFFFFFFFF"; -- Send this packet to Broadcast (FF:FF:FF:FF:FF:FF)
											sendCurrentPacket.hostIPv4Address <= X"FFFFFFFF"; -- Send this packet to Broadcast (255.255.255.255)
											sendCurrentPacket.packetLength <= to_unsigned(NetNonSessionBroadcastPacketLength, 16);
											sendFIFOAccess <= accessDWORD0;
										end if;

									when accessDWORD0 => -- 1
										send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoFirstDWORD(sendCurrentPacket) );
										send_pkt_header_wr_en <= '1';
										send_pkt_data_wr_data <= std_logic_vector(HToNL(sendPacketHeaderBuffer(31 downto 0) ) );
										send_pkt_data_wr_en <= '1';
										sendFIFOAccess <= accessDWORD1;

									when accessDWORD1 => -- 2
										send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoSecondDWORD(sendCurrentPacket) );
										send_pkt_header_wr_en <= '1';
										send_pkt_data_wr_data <= std_logic_vector(HToNL(sendPacketHeaderBuffer(63 downto 32) ) );
										send_pkt_data_wr_en <= '1';
										sendFIFOAccess <= accessDWORD2;

									when accessDWORD2 => -- 3
										send_pkt_header_wr_data <= std_logic_vector(GetEthernetPacketHeaderInfoThirdDWORD(sendCurrentPacket) );
										send_pkt_header_wr_en <= '1';
										send_pkt_data_wr_data <= std_logic_vector(HToNL(sendPacketHeaderBuffer(95 downto 64) ) );
										send_pkt_data_wr_en <= '1';
										sendFIFOAccess <= accessRemainingData;

									when accessRemainingData => -- 4
										send_pkt_header_wr_en <= '0';
										send_pkt_data_wr_data <= std_logic_vector(HToNL(sendPacketHeaderBuffer(127 downto 96) ) );
										send_pkt_data_wr_en <= '1';
										sendHandlingReply <= '0'; -- We're done handling the reply!
										sendReplyAck <= '1'; -- Make sure to ack to the recv process so it knows that we've sent its reply
										if (sendPacketHeaderBuffer(15 downto 8) = to_unsigned(SessionConnectRequestReplyStatus'pos(acceptNewSession), 8) ) then
											sendHasRepliedSuccessfulConnection <= '1'; -- If we replied with the success status, then mark our new session as established!
										end if;
										sendNumBroadcastsSinceReset <= sendNumBroadcastsSinceReset + 1; -- Increment our number of sent broadcast packets since we last reset or entered the lost-session state
										sendClocksBetweenBroadcastsWait <= ClocksBetweenBroadcasts; -- Reset our clocks counter
										sendFIFOAccess <= accessIdle;
								end case;
							else
								sendClocksBetweenBroadcastsWait <= sendClocksBetweenBroadcastsWait - 1;
							end if;
						end if;
					end if;

				when sessionConnectedReady =>
					-- TODO: Send normal sessioned packets
					sendNumBroadcastsSinceReset <= (others => '0');
			end case;
		end if;
	end process send_data_process;

	recv_data_process: process(clk333_250)
	begin
		if (rising_edge(clk333_250) ) then
			case currentState is
				when init =>
					recvFIFOAccess <= accessIdle;
					recvPacketHeaderBuffer <= (others => '0');
					recvCurrentSubpacketBuffer <= (others => '0');
					recvPumpFIFO <= '0';
					recv_pkt_header_rd_en <= '0';
					recv_pkt_data_rd_en <= '0';
					recvSendReplyPacket <= '0';

				when waitForNetSystemReady =>
					-- Do nothing while we wait for the net system to be ready.

				-- The recv process needs to be listening for requestConnectSession packets from the host when we're in the "unconnected" session state:
				when unconnectedSendingNonSessionBroadcasts =>
					if (recvPumpFIFO = '1') then
						recv_pkt_header_rd_en <= '0';
						recv_pkt_data_rd_en <= '0';
						recvPumpFIFO <= '0';
					else
						if (recvSendReplyPacket = '1') then
							if (sendReplyAck = '1') then
								recvSendReplyPacket <= '0';
							end if;
						else
							case recvFIFOAccess is
								when accessIdle => -- 0
									recv_pkt_header_rd_en <= '0';
									recv_pkt_data_rd_en <= '0';
									if (recv_pkt_header_empty = '0' and recv_pkt_data_empty = '0') then
										recvFIFOAccess <= accessDWORD0;
									end if;

								when accessDWORD0 => -- 1
									if (recv_pkt_header_empty = '0' and recv_pkt_data_empty = '0') then
										LoadPacketHeaderInfoFirstDWORD(recvCurrentPacket, unsigned(recv_pkt_header_rd_data) );
										recvPacketHeaderBuffer(4*8-1 downto 0) <= unsigned(recv_pkt_data_rd_data);
										recv_pkt_header_rd_en <= '1';
										recv_pkt_data_rd_en <= '1';
										recvPumpFIFO <= '1';
										recvFIFOAccess <= accessDWORD1;
									end if;

								when accessDWORD1 => -- 2
									if (recv_pkt_header_empty = '0' and recv_pkt_data_empty = '0') then
										LoadPacketHeaderInfoSecondDWORD(recvCurrentPacket, unsigned(recv_pkt_header_rd_data) );
										recvPacketHeaderBuffer(8*8-1 downto 4*8) <= unsigned(recv_pkt_data_rd_data);
										recv_pkt_header_rd_en <= '1';
										recv_pkt_data_rd_en <= '1';
										recvPumpFIFO <= '1';
										recvFIFOAccess <= accessDWORD2;
									end if;

								when accessDWORD2 => -- 3
									if (recv_pkt_header_empty = '0') then
										LoadPacketHeaderInfoThirdDWORD(recvCurrentPacket, unsigned(recv_pkt_header_rd_data) );
										recv_pkt_header_rd_en <= '1';
										recvPumpFIFO <= '1';
										recvFIFOAccess <= accessRemainingData;
									end if;

								when accessRemainingData => -- 4
									recv_pkt_header_rd_en <= '0';
									if (recvCurrentPacket.packetLength /= NetHostRequestConnectSessionPacketLength) then
										recvReplyStatus <= errInvalidRequestLength;
										recvSendReplyPacket <= '1';
									elsif (ValidateRecvPacketAddresses(recvCurrentPacket) = false) then
										-- We can't actually send a reply with an error status message in this case because
										-- we know that the packet came from an invalid IPv4 or MAC address, so the reply
										-- packet would be underliverable. Just drop the packet in this case.
									elsif (DeserializeNetHostRequestConnectSessionPacket(recvPacketHeaderBuffer).packetType /= ePacketType'pos(PT_CONNREQUEST) ) then
										recvReplyStatus <= errInvalidPacketType;
										recvSendReplyPacket <= '1';
									elsif (DeserializeNetHostRequestConnectSessionPacket(recvPacketHeaderBuffer).netProtoVersionMajorHost /= NET_PROTOCOL_MAJOR_VERSION) then
										recvReplyStatus <= errInvalidNetProtoMajorVer;
										recvSendReplyPacket <= '1';
									elsif (DeserializeNetHostRequestConnectSessionPacket(recvPacketHeaderBuffer).hostIPv4Address = X"00000000" or 
										DeserializeNetHostRequestConnectSessionPacket(recvPacketHeaderBuffer).hostIPv4Address = X"FFFFFFFF") then
										recvReplyStatus <= errInvalidIPv4Addr;
										recvSendReplyPacket <= '1';
									elsif (DeserializeNetHostRequestConnectSessionPacket(recvPacketHeaderBuffer).hostIPv4Address /= recvCurrentPacket.hostIPv4Address) then
										recvReplyStatus <= errMismatchIPv4Addr;
										recvSendReplyPacket <= '1';
									else
										recvReplyStatus <= acceptNewSession;
										recvSendReplyPacket <= '1';
									end if;

									recvFIFOAccess <= accessIdle;
							end case;
						end if;
					end if;

				when sessionConnectedReady =>
					-- TODO: Recv normal sessioned packets
			end case;
		end if;
	end process recv_data_process;

end Behavioral;
