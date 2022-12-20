library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetProtoHelpers_Core.all;

package NetProtoHelpers_ARP is

	constant ARP_MAC_ADDRESS_SIZE : unsigned(7 downto 0) := to_unsigned(6, 8);
	constant ARP_IPv4_ADDRESS_SIZE : unsigned(7 downto 0) := to_unsigned(4, 8);

	type eHTYPE is
	(
		ARP_HTYPE_RESERVED, -- 0
		ARP_HTYPE_ETHERNET, -- 1
		ARP_HTYPE_EXPERIMENTAL_ETHERNET, -- 2
		ARP_HTYPE_AMATEUR_RADIO_AX25, -- 3
		ARP_HTYPE_PROTEON_PRONET_TOKEN_RING, -- 4
		ARP_HTYPE_CHAOS, -- 5
		ARP_HTYPE_IEEE_802_NETWORKS -- 6

		-- There are other HTYPE's, I just didn't type them all out
	);

	type eARPOpcode is
	(
		ARP_OP_RESERVED, -- 0
		ARP_OP_REQUEST, -- 1
		ARP_OP_REPLY, -- 2
		ARP_OP_REQUEST_REVERSE, -- 3
		ARP_OP_REPLY_REVERSE, -- 4
		ARP_OP_DRARP_REQUEST, -- 5
		ARP_OP_DRARP_REPLY, -- 6
		ARP_OP_DRARP_ERROR, -- 7
		ARP_OP_INARP_REQUEST, -- 8
		ARP_OP_INARP_REPLY, -- 9
		ARP_OP_NAK -- 10

		-- There are some other opcodes but they are less commonly used
	);

	-- Returns the Hardware Type (HTYPE) in little-endian (device) byte order
	pure function GetARPHeaderHardwareType(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the Protocol Type (PTYPE) in little-endian (device) byte order
	pure function GetARPHeaderProtocolType(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	pure function GetARPHeaderHardwareAddressLength(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	pure function GetARPHeaderProtocolAddressLength(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the ARP Opcode (OPER) in little-endian (device) byte order
	pure function GetARPHeaderOpcode(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the Sender Hardware Address (SHA) in little-endian (device) byte order
	pure function GetARPHeaderSenderMAC(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the Sender Protocol Address (SPA) in little-endian (device) byte order
	pure function GetARPHeaderSenderIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the Target Hardware Address (THA) in little-endian (device) byte order
	pure function GetARPHeaderTargetMAC(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	-- Returns the Target Protocol Address (TPA) in little-endian (device) byte order
	pure function GetARPHeaderTargetIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned;

	pure function ValidateRecvARPHeaderHTYPE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderPTYPE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderHSIZE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderPSIZE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderOpcode(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderTargetMAC(arpHeaderBytes : unsigned(28*8-1 downto 0); deviceMACAddress : unsigned(6*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvARPHeaderTargetIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0); deviceIPv4Address : unsigned(31 downto 0) ) return std_logic;

end package NetProtoHelpers_ARP;

package body NetProtoHelpers_ARP is

	-- Returns the Hardware Type (HTYPE) in little-endian (device) byte order
	pure function GetARPHeaderHardwareType(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return NToHS(arpHeaderBytes(2*8-1 downto 0*8) );
	end function;

	-- Returns the Protocol Type (PTYPE) in little-endian (device) byte order
	pure function GetARPHeaderProtocolType(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return NToHS(arpHeaderBytes(4*8-1 downto 2*8) );
	end function;

	pure function GetARPHeaderHardwareAddressLength(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return arpHeaderBytes(5*8-1 downto 4*8);
	end function;

	pure function GetARPHeaderProtocolAddressLength(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return arpHeaderBytes(6*8-1 downto 5*8);
	end function;

	-- Returns the ARP Opcode (OPER) in little-endian (device) byte order
	pure function GetARPHeaderOpcode(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return NToHS(arpHeaderBytes(8*8-1 downto 6*8) );
	end function;

	-- Returns the Sender Hardware Address (SHA) in little-endian (device) byte order
	pure function GetARPHeaderSenderMAC(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return arpHeaderBytes(14*8-1 downto 13*8) & arpHeaderBytes(13*8-1 downto 12*8) & arpHeaderBytes(12*8-1 downto 11*8) & arpHeaderBytes(11*8-1 downto 10*8) & arpHeaderBytes(10*8-1 downto 9*8) & arpHeaderBytes(9*8-1 downto 8*8);
	end function;

	-- Returns the Sender Protocol Address (SPA) in little-endian (device) byte order
	pure function GetARPHeaderSenderIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return NToHL(arpHeaderBytes(18*8-1 downto 14*8) );
	end function;

	-- Returns the Target Hardware Address (THA) in little-endian (device) byte order
	pure function GetARPHeaderTargetMAC(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return arpHeaderBytes(24*8-1 downto 23*8) & arpHeaderBytes(23*8-1 downto 22*8) & arpHeaderBytes(22*8-1 downto 21*8) & arpHeaderBytes(21*8-1 downto 20*8) & arpHeaderBytes(20*8-1 downto 19*8) & arpHeaderBytes(19*8-1 downto 18*8);
	end function;

	-- Returns the Target Protocol Address (TPA) in little-endian (device) byte order
	pure function GetARPHeaderTargetIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return unsigned is
	begin
		return NToHL(arpHeaderBytes(28*8-1 downto 24*8) );
	end function;

	pure function ValidateRecvARPHeaderHTYPE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic is
	begin
		if (GetARPHeaderHardwareType(arpHeaderBytes) = eHTYPE'pos(ARP_HTYPE_ETHERNET) ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderPTYPE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic is
	begin
		if (GetARPHeaderProtocolType(arpHeaderBytes) = ETHERTYPE_IPv4) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderHSIZE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic is
	begin
		if (GetARPHeaderHardwareAddressLength(arpHeaderBytes) = ARP_MAC_ADDRESS_SIZE) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderPSIZE(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic is
	begin
		if (GetARPHeaderProtocolAddressLength(arpHeaderBytes) = ARP_IPv4_ADDRESS_SIZE) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderOpcode(arpHeaderBytes : unsigned(28*8-1 downto 0) ) return std_logic is
	begin
		-- The standard "REQUEST" ARP opcode is the only one that we can accept as an incoming packet
		if (GetARPHeaderOpcode(arpHeaderBytes) = eARPOpcode'pos(ARP_OP_REQUEST) ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderTargetMAC(arpHeaderBytes : unsigned(28*8-1 downto 0); deviceMACAddress : unsigned(6*8-1 downto 0) ) return std_logic is
	begin
		if ( (GetARPHeaderTargetMAC(arpHeaderBytes) = deviceMACAddress) or
			(GetARPHeaderTargetMAC(arpHeaderBytes) = X"000000000000") or
			(GetARPHeaderTargetMAC(arpHeaderBytes) = X"FFFFFFFFFFFF") ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvARPHeaderTargetIPv4(arpHeaderBytes : unsigned(28*8-1 downto 0); deviceIPv4Address : unsigned(31 downto 0) ) return std_logic is
	begin
		-- Note that here we are not allowed to listen for the 255.255.255.255 broadcast address or any other IP address than our own
		if (GetARPHeaderTargetIPv4(arpHeaderBytes) = deviceIPv4Address) then
			return '1';
		else
			return '0';
		end if;
	end function;

end package body NetProtoHelpers_ARP;
