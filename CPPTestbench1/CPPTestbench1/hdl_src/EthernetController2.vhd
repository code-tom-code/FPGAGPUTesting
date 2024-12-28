library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eCmpFunc enum type defined in there
library work;
use work.PacketType.all;

entity EthernetController2 is
	Port (
	-- 125MHz Ethernet MAC interfaces:
		clk125 : in STD_LOGIC;

		mac_address : out STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
		speed_override : out STD_LOGIC_VECTOR(1 downto 0) := "10"; -- Default to 1000M

		-- Data FIFO's:
		tx_data : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		tx_wr_en : out STD_LOGIC := '0';
		tx_full : in STD_LOGIC;

		rx_data : in STD_LOGIC_VECTOR(7 downto 0);
		rx_rd_en : out STD_LOGIC := '0';
		rx_empty : in STD_LOGIC;
	-- End 125MHz Ethernet MAC interface

	-- Misc. interfaces:
		signal_detect : out STD_LOGIC := '0';

		speed_is_10_100 : out STD_LOGIC := '0';
		speed_is_100 : out STD_LOGIC := '0';
		pcs_rst_out : out STD_LOGIC := '0';
		configuration_vector : out STD_LOGIC_VECTOR(4 downto 0) := "00000";
		an_adv_config_vector : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		an_restart_config : out STD_LOGIC := '0';

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
end EthernetController2;

architecture Behavioral of EthernetController2 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk125: SIGNAL is "xilinx.com:signal:clock:1.0 clk125 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk125: SIGNAL is "FREQ_HZ 125000000";

type EthStateType is 
(
	init, -- 0
	waitForResetDelay, -- 1 -- Wait for 16 microseconds (about 4920 cycles at 300MHz)
	sendFirstPacket, -- 2
	readyState -- 3
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

-- Send process signals:
signal initialPacketSendPtr : unsigned(4 downto 0) := (others => '0');
signal sendFirstPacketComplete : std_logic := '0';

begin

DBG_Eth_State <= std_logic_vector(to_unsigned(EthStateType'pos(currentState), 5) );

	mainStateMachine: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			case currentState is
				when init =>
					mac_address(7 downto 0) <= X"00"; -- FPGA's MAC address is 00:0A:35:03:78:F1
					mac_address(15 downto 8) <= X"0A";
					mac_address(23 downto 16) <= X"35";
					mac_address(31 downto 24) <= X"03";
					mac_address(39 downto 32) <= X"78";
					mac_address(47 downto 40) <= X"F1";
					currentState <= waitForResetDelay;

				when waitForResetDelay =>
					resetDelayCycles <= resetDelayCycles - 1;
					if (resetDelayCycles = 0) then
						currentSetRegister <= (others => '0');
						currentState <= sendFirstPacket;
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
	end process mainStateMachine;

	send_data_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			tx_wr_en <= '0';
			if (controllerIsReadyForData = '1') then
			elsif (currentState = sendFirstPacket) then
				if (initialPacketSendPtr < 52 and tx_full = '0') then
					tx_data <= std_logic_vector(InitialSendPacket(to_integer(initialPacketSendPtr) ) );
					tx_wr_en <= '1';

					initialPacketSendPtr <= initialPacketSendPtr + 1; -- Advance one byte at a time
				else
					sendFirstPacketComplete <= '1';
				end if;
			end if;
		end if;
	end process send_data_process;

	recv_data_process: process(clk125)
	begin
		if (rising_edge(clk125) ) then
			rx_rd_en <= '0';
			if (controllerIsReadyForData = '1') then
				if (rx_empty = '0') then
					rx_rd_en <= '1'; -- Blindly receive packet data and then do nothing with it
				end if;
			end if;
		end if;
	end process recv_data_process;

end Behavioral;
