library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetProtoHelpers_Core.all;

-- Core network protocol helpers that for the IPv4 protocols
package NetProtoHelpers_UDP is

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderSourcePort(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderDestPort(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian (device) byte order (16 bit return type version)
	pure function GetUDPHeaderLength(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian (device) byte order (12 bit return type version)
	pure function GetUDPHeaderLength12b(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderChecksum(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned;

	pure function ValidateRecvUDPPort(udpHeaderBytes : unsigned(8*8-1 downto 0); udpProtocolPort : unsigned(15 downto 0) ) return std_logic;

end package NetProtoHelpers_UDP;

package body NetProtoHelpers_UDP is

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderSourcePort(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(udpHeaderBytes(2*8-1 downto 0*8) );
	end function;

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderDestPort(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(udpHeaderBytes(4*8-1 downto 2*8) );
	end function;

	-- Returns the result in little-endian (device) byte order (16 bit return type version)
	pure function GetUDPHeaderLength(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(udpHeaderBytes(6*8-1 downto 4*8) );
	end function;

	-- Returns the result in little-endian (device) byte order (12 bit return type version)
	pure function GetUDPHeaderLength12b(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return udpHeaderBytes(5*8-5 downto 4*8) & udpHeaderBytes(6*8-1 downto 5*8);
	end function;

	-- Returns the result in little-endian (device) byte order
	pure function GetUDPHeaderChecksum(udpHeaderBytes : unsigned(8*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(udpHeaderBytes(8*8-1 downto 6*8) );
	end function;

	pure function ValidateRecvUDPPort(udpHeaderBytes : unsigned(8*8-1 downto 0); udpProtocolPort : unsigned(15 downto 0) ) return std_logic is
	begin
		if (GetUDPHeaderDestPort(udpHeaderBytes) = udpProtocolPort) then
			return '1';
		else
			return '0';
		end if;
	end function;

end package body NetProtoHelpers_UDP;
