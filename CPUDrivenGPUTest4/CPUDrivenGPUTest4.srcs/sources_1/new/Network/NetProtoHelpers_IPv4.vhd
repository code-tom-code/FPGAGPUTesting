library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetProtoHelpers_Core.all;

-- Core network protocol helpers that for the IPv4 protocols
package NetProtoHelpers_IPv4 is

	constant IPv4HEADER_VERSION : unsigned(3 downto 0) := to_unsigned(4, 4);

	constant IPv4MIN_HEADER_LEN_NOOPTIONS : unsigned(3 downto 0) := to_unsigned(5, 4);

	constant IPv4DEFAULT_TTL : unsigned(7 downto 0) := to_unsigned(128, 8);

	constant IPPROTO_TCP : unsigned(7 downto 0) := to_unsigned(6, 8);
	constant IPPROTO_UDP : unsigned(7 downto 0) := to_unsigned(17, 8);

	pure function GetIPv4HeaderVersion(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderIHL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderLength(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderTTL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderProtocol(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderPacketID(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderFlags(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderFragmentOffset(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderSourceIPAddr(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function GetIPv4HeaderDestIPAddr(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

	pure function ValidateRecvIPv4HeaderVersion(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvIPv4HeaderIHL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvIPv4HeaderProto(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvIPv4HeaderNoFragment(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvIPv4HeaderChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0); ipv4HeaderChecksum : unsigned(15 downto 0) ) return std_logic;

	pure function ValidateRecvIPv4HeaderDestIP(ipv4HeaderBytes : unsigned(20*8-1 downto 0); deviceLocalIPv4Addr : unsigned(4*8-1 downto 0) ) return std_logic;

	-- This is for sending packets
	pure function CalcIPv4HeaderSendChecksum(packetID : unsigned(15 downto 0); packetIPv4LengthBytes : unsigned(11 downto 0); destIPv4 : unsigned(31 downto 0); deviceIPv4 : unsigned(31 downto 0) ) return unsigned;

	-- This is for receiving packets
	pure function CalcIPv4HeaderRecvChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned;

end package NetProtoHelpers_IPv4;

package body NetProtoHelpers_IPv4 is

	pure function GetIPv4HeaderVersion(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(7 downto 4);
	end function;

	pure function GetIPv4HeaderIHL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(3 downto 0);
	end function;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderLength(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(ipv4HeaderBytes(4*8-1 downto 2*8) );
	end function;

	pure function GetIPv4HeaderTTL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(9*8-1 downto 8*8);
	end function;

	pure function GetIPv4HeaderProtocol(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(10*8-1 downto 9*8);
	end function;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderPacketID(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		-- -- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(ipv4HeaderBytes(6*8-1 downto 4*8) );
	end function;

	pure function GetIPv4HeaderFlags(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(50 downto 48);
	end function;

	pure function GetIPv4HeaderFragmentOffset(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(63 downto 51);
	end function;

	-- Returns the result in little-endian byte order
	pure function GetIPv4HeaderChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(ipv4HeaderBytes(12*8-1 downto 10*8) );
	end function;

	pure function GetIPv4HeaderSourceIPAddr(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(16*8-1 downto 12*8);
	end function;

	pure function GetIPv4HeaderDestIPAddr(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
	begin
		return ipv4HeaderBytes(20*8-1 downto 16*8);
	end function;

	pure function ValidateRecvIPv4HeaderVersion(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic is
	begin
		if (GetIPv4HeaderVersion(ipv4HeaderBytes) = IPv4HEADER_VERSION) then -- The IPv4 header version number must be 4 or else it is not a valid IPv4 packet!
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvIPv4HeaderIHL(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic is
	begin
		if (GetIPv4HeaderIHL(ipv4HeaderBytes) = IPv4MIN_HEADER_LEN_NOOPTIONS) then -- IHL of 5 means "default header size (4*5=20 bytes), no options"
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvIPv4HeaderProto(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic is
	begin
		if (GetIPv4HeaderProtocol(ipv4HeaderBytes) = IPPROTO_UDP) then -- Protocol 0x11 (17 dec) is UDP
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvIPv4HeaderNoFragment(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return std_logic is
	begin
		if (ipv4HeaderBytes(48) = '1') then -- Fail due to the reserved zero bit not being set to zero
			return '0';
		elsif (ipv4HeaderBytes(50) = '1') then -- Fail due to the MF ("More Fragments") bit not being set to zero
			return '0';
		elsif (GetIPv4HeaderFragmentOffset(ipv4HeaderBytes) /= 0) then -- Fail due to the Fragment Offset not being set to zero
			return '0';
		else -- Success! This is a valid, non-fragmented packet!
			return '1';
		end if;
	end function;

	pure function ValidateRecvIPv4HeaderChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0); ipv4HeaderChecksum : unsigned(15 downto 0) ) return std_logic is
	begin
		if (GetIPv4HeaderChecksum(ipv4HeaderBytes) = ipv4HeaderChecksum) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvIPv4HeaderDestIP(ipv4HeaderBytes : unsigned(20*8-1 downto 0); deviceLocalIPv4Addr : unsigned(4*8-1 downto 0) ) return std_logic is
	begin
		if (GetIPv4HeaderDestIPAddr(ipv4HeaderBytes) = X"FFFFFFFF" or -- Dest. IP address should be either the broadcast address (255.255.255.255) or our local IP (192.168.1.170)
			GetIPv4HeaderDestIPAddr(ipv4HeaderBytes) = HToNL(deviceLocalIPv4Addr) ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	-- This is for sending packets
	pure function CalcIPv4HeaderSendChecksum(packetID : unsigned(15 downto 0); packetIPv4LengthBytes : unsigned(11 downto 0); destIPv4 : unsigned(31 downto 0); deviceIPv4 : unsigned(31 downto 0) ) return unsigned is
		variable sum : unsigned(22 downto 0);
	begin
		sum := ("0000000" & IPv4HEADER_VERSION & IPv4MIN_HEADER_LEN_NOOPTIONS & "000000" & "00") + -- Version (always 4), IHL (always 5), DSCP (always 0), and ECN (always 0) settings
			("0000000" & "0000" & packetIPv4LengthBytes) + -- Total IPv4 packet length (including IPv4 header bytes)
			("0000000" & packetID) + -- Skip the packet ID in the data and use the passed-in packet ID
			("0000000" & "010" & "0000000000000") + -- Flags and Fragment Offset (flags are always "010" for "don't fragment", and fragment offset is always all 0)
			("0000000" & IPv4DEFAULT_TTL & IPPROTO_UDP) + -- TTL and Protocol number (always TTL=128 and proto=0x11 for UDP)
			-- Skip the IPv4 header checksum field since we're going to be overwriting it
			("0000000" & deviceIPv4(31 downto 24) & deviceIPv4(23 downto 16) ) + -- First half of the source IPv4 address (always 192.168), in network byte order
			("0000000" & deviceIPv4(15 downto 8) & deviceIPv4(7 downto 0) ) + -- Second half of the source IPv4 address (always 1.170), in network byte order
			("0000000" & destIPv4(31 downto 24) & destIPv4(23 downto 16) ) + -- First half of the destination IPv4 address, in network byte order
			("0000000" & destIPv4(15 downto 8) & destIPv4(7 downto 0) ); -- Second half of the destination IPv4 address, in network byte order

		sum := (sum srl 16) + ("0000000" & sum(15 downto 0) ); -- Add the upper bits to the lower 16 bits
		sum := (sum srl 16) + ("0000000" & sum(15 downto 0) ); -- Do it once more just in case we had an overflow that first time
		return not sum(15 downto 0); -- Take the one's compliment of the result
	end function;

	-- This is for receiving packets
	pure function CalcIPv4HeaderRecvChecksum(ipv4HeaderBytes : unsigned(20*8-1 downto 0) ) return unsigned is
		variable sum : unsigned(22 downto 0);
	begin
		sum := ("0000000" & ipv4HeaderBytes(1*8-1 downto 0*8) & ipv4HeaderBytes(2*8-1 downto 1*8) ) + -- Version, IHL, DSCP, and ECN settings
			("0000000" & GetIPv4HeaderLength(ipv4HeaderBytes) ) + -- Total IPv4 packet length (including IPv4 header bytes)
			("0000000" & GetIPv4HeaderPacketID(ipv4HeaderBytes) ) + -- Packet ID
			("0000000" & ipv4HeaderBytes(7*8-1 downto 6*8) & ipv4HeaderBytes(8*8-1 downto 7*8) ) + -- Flags and Fragment Offset
			("0000000" & GetIPv4HeaderTTL(ipv4HeaderBytes) & GetIPv4HeaderProtocol(ipv4HeaderBytes) ) + -- TTL and Protocol number
			-- Skip the IPv4 header checksum field since we're going to be overwriting it
			("0000000" & ipv4HeaderBytes(13*8-1 downto 12*8) & ipv4HeaderBytes(14*8-1 downto 13*8) ) + -- First half of the source IPv4 address (in network byte order)
			("0000000" & ipv4HeaderBytes(15*8-1 downto 14*8) & ipv4HeaderBytes(16*8-1 downto 15*8) ) + -- Second half of the source IPv4 address (in network byte order)
			("0000000" & ipv4HeaderBytes(17*8-1 downto 16*8) & ipv4HeaderBytes(18*8-1 downto 17*8) ) + -- First half of the destination IPv4 address (in network byte order)
			("0000000" & ipv4HeaderBytes(19*8-1 downto 18*8) & ipv4HeaderBytes(20*8-1 downto 19*8) ); -- Second half of the destination IPv4 address (in network byte order)

		sum := (sum srl 16) + ("0000000" & sum(15 downto 0) ); -- Add the upper bits to the lower 16 bits
		sum := (sum srl 16) + ("0000000" & sum(15 downto 0) ); -- Do it once more just in case we had an overflow that first time
		return not sum(15 downto 0); -- Take the one's compliment of the result
	end function;

end package body NetProtoHelpers_IPv4;
