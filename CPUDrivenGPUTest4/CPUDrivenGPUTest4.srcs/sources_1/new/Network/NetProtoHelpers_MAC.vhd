library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetProtoHelpers_Core.all;

-- Core network protocol helpers that for the MAC / Ethernet protocols
package NetProtoHelpers_MAC is

	pure function ReverseMACAddress(macAddr : unsigned(6*8-1 downto 0) ) return unsigned;

	pure function GetMACHeaderDestAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned;

	pure function GetMACHeaderSourceAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned;

	-- Returns the result in little-endian byte order
	pure function GetMACHeaderEtherType(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned;

	pure function ValidateRecvMACAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0); deviceMacAddress : unsigned(6*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvMACEtherType(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return std_logic;

	pure function ValidateRecvMACPacketCRC32(packetDataFCS : unsigned(31 downto 0); recvComputedCRC32 : unsigned(31 downto 0) ) return std_logic;

	pure function EthernetCRC32(crcIn : unsigned(31 downto 0); data : unsigned(7 downto 0) ) return unsigned;

end package NetProtoHelpers_MAC;

package body NetProtoHelpers_MAC is

	pure function ReverseMACAddress(macAddr : unsigned(6*8-1 downto 0) ) return unsigned is
	begin
		return macAddr(1*8-1 downto 0*8) & macAddr(2*8-1 downto 1*8) & macAddr(3*8-1 downto 2*8) & macAddr(4*8-1 downto 3*8) & macAddr(5*8-1 downto 4*8) & macAddr(6*8-1 downto 5*8);
	end function;

	pure function GetMACHeaderDestAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned is
	begin
		return macPacketHeaderBytes(6*8-1 downto 0);
	end function;

	pure function GetMACHeaderSourceAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned is
	begin
		return ReverseMACAddress(macPacketHeaderBytes(12*8-1 downto 6*8) );
	end function;

	-- Returns the result in little-endian byte order
	pure function GetMACHeaderEtherType(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return unsigned is
	begin
		-- Reverse the order to convert from network byte order (big endian) to device order (little endian)
		return NToHS(macPacketHeaderBytes(14*8-1 downto 12*8) );
	end function;

	pure function ValidateRecvMACAddress(macPacketHeaderBytes : unsigned(14*8-1 downto 0); deviceMacAddress : unsigned(6*8-1 downto 0) ) return std_logic is
	begin
		if (GetMACHeaderDestAddress(macPacketHeaderBytes) = deviceMacAddress or
			GetMACHeaderDestAddress(macPacketHeaderBytes) = X"FFFFFFFFFFFF") then -- Our local device MAC ID, or the broadcast MAC address (FF:FF:FF:FF:FF:FF) are both acceptable
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvMACEtherType(macPacketHeaderBytes : unsigned(14*8-1 downto 0) ) return std_logic is
	begin
		-- IPv4 and ARP are the only EtherType's that we care about!
		if (GetMACHeaderEtherType(macPacketHeaderBytes) = ETHERTYPE_IPv4 or -- 0x0800 is the EtherType for "IPv4 packet"
			GetMACHeaderEtherType(macPacketHeaderBytes) = ETHERTYPE_ARP) then -- 0x0806 is the EtherType for "ARP packet"
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function ValidateRecvMACPacketCRC32(packetDataFCS : unsigned(31 downto 0); recvComputedCRC32 : unsigned(31 downto 0) ) return std_logic is
	begin
		-- packetDataFCS is in big endian byte order, and recvComputedCRC32 is in little endian byte order, so we need to
		-- swap the order of one of them in order to match the other!
		if (packetDataFCS(7 downto 0) = recvComputedCRC32(31 downto 24) and
			packetDataFCS(15 downto 8) = recvComputedCRC32(23 downto 16) and
			packetDataFCS(23 downto 16) = recvComputedCRC32(15 downto 8) and
			packetDataFCS(31 downto 24) = recvComputedCRC32(7 downto 0) ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	-- THIS FUNCTION IS GENERATED VHDL CODE.
	-- https://bues.ch/h/crcgen
	-- 
	-- This code is Public Domain.
	-- Permission to use, copy, modify, and/or distribute this software for any
	-- purpose with or without fee is hereby granted.
	-- 
	-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
	-- WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
	-- MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
	-- SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
	-- RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
	-- NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
	-- USE OR PERFORMANCE OF THIS SOFTWARE.

	-- CRC polynomial coefficients: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
	--                              0xEDB88320 (hex)
	-- CRC width:                   32 bits
	-- CRC shift direction:         right (little endian)
	-- Input word width:            8 bits
	pure function EthernetCRC32(crcIn : unsigned(31 downto 0); data : unsigned(7 downto 0)) return unsigned is
		variable crcOut : unsigned(31 downto 0);
	begin
		crcOut(0) := (crcIn(2) xor crcIn(8) xor data(2));
		crcOut(1) := (crcIn(0) xor crcIn(3) xor crcIn(9) xor data(0) xor data(3));
		crcOut(2) := (crcIn(0) xor crcIn(1) xor crcIn(4) xor crcIn(10) xor data(0) xor data(1) xor data(4));
		crcOut(3) := (crcIn(1) xor crcIn(2) xor crcIn(5) xor crcIn(11) xor data(1) xor data(2) xor data(5));
		crcOut(4) := (crcIn(0) xor crcIn(2) xor crcIn(3) xor crcIn(6) xor crcIn(12) xor data(0) xor data(2) xor data(3) xor data(6));
		crcOut(5) := (crcIn(1) xor crcIn(3) xor crcIn(4) xor crcIn(7) xor crcIn(13) xor data(1) xor data(3) xor data(4) xor data(7));
		crcOut(6) := (crcIn(4) xor crcIn(5) xor crcIn(14) xor data(4) xor data(5));
		crcOut(7) := (crcIn(0) xor crcIn(5) xor crcIn(6) xor crcIn(15) xor data(0) xor data(5) xor data(6));
		crcOut(8) := (crcIn(1) xor crcIn(6) xor crcIn(7) xor crcIn(16) xor data(1) xor data(6) xor data(7));
		crcOut(9) := (crcIn(7) xor crcIn(17) xor data(7));
		crcOut(10) := (crcIn(2) xor crcIn(18) xor data(2));
		crcOut(11) := (crcIn(3) xor crcIn(19) xor data(3));
		crcOut(12) := (crcIn(0) xor crcIn(4) xor crcIn(20) xor data(0) xor data(4));
		crcOut(13) := (crcIn(0) xor crcIn(1) xor crcIn(5) xor crcIn(21) xor data(0) xor data(1) xor data(5));
		crcOut(14) := (crcIn(1) xor crcIn(2) xor crcIn(6) xor crcIn(22) xor data(1) xor data(2) xor data(6));
		crcOut(15) := (crcIn(2) xor crcIn(3) xor crcIn(7) xor crcIn(23) xor data(2) xor data(3) xor data(7));
		crcOut(16) := (crcIn(0) xor crcIn(2) xor crcIn(3) xor crcIn(4) xor crcIn(24) xor data(0) xor data(2) xor data(3) xor data(4));
		crcOut(17) := (crcIn(0) xor crcIn(1) xor crcIn(3) xor crcIn(4) xor crcIn(5) xor crcIn(25) xor data(0) xor data(1) xor data(3) xor data(4) xor data(5));
		crcOut(18) := (crcIn(0) xor crcIn(1) xor crcIn(2) xor crcIn(4) xor crcIn(5) xor crcIn(6) xor crcIn(26) xor data(0) xor data(1) xor data(2) xor data(4) xor data(5) xor data(6));
		crcOut(19) := (crcIn(1) xor crcIn(2) xor crcIn(3) xor crcIn(5) xor crcIn(6) xor crcIn(7) xor crcIn(27) xor data(1) xor data(2) xor data(3) xor data(5) xor data(6) xor data(7));
		crcOut(20) := (crcIn(3) xor crcIn(4) xor crcIn(6) xor crcIn(7) xor crcIn(28) xor data(3) xor data(4) xor data(6) xor data(7));
		crcOut(21) := (crcIn(2) xor crcIn(4) xor crcIn(5) xor crcIn(7) xor crcIn(29) xor data(2) xor data(4) xor data(5) xor data(7));
		crcOut(22) := (crcIn(2) xor crcIn(3) xor crcIn(5) xor crcIn(6) xor crcIn(30) xor data(2) xor data(3) xor data(5) xor data(6));
		crcOut(23) := (crcIn(3) xor crcIn(4) xor crcIn(6) xor crcIn(7) xor crcIn(31) xor data(3) xor data(4) xor data(6) xor data(7));
		crcOut(24) := (crcIn(0) xor crcIn(2) xor crcIn(4) xor crcIn(5) xor crcIn(7) xor data(0) xor data(2) xor data(4) xor data(5) xor data(7));
		crcOut(25) := (crcIn(0) xor crcIn(1) xor crcIn(2) xor crcIn(3) xor crcIn(5) xor crcIn(6) xor data(0) xor data(1) xor data(2) xor data(3) xor data(5) xor data(6));
		crcOut(26) := (crcIn(0) xor crcIn(1) xor crcIn(2) xor crcIn(3) xor crcIn(4) xor crcIn(6) xor crcIn(7) xor data(0) xor data(1) xor data(2) xor data(3) xor data(4) xor data(6) xor data(7));
		crcOut(27) := (crcIn(1) xor crcIn(3) xor crcIn(4) xor crcIn(5) xor crcIn(7) xor data(1) xor data(3) xor data(4) xor data(5) xor data(7));
		crcOut(28) := (crcIn(0) xor crcIn(4) xor crcIn(5) xor crcIn(6) xor data(0) xor data(4) xor data(5) xor data(6));
		crcOut(29) := (crcIn(0) xor crcIn(1) xor crcIn(5) xor crcIn(6) xor crcIn(7) xor data(0) xor data(1) xor data(5) xor data(6) xor data(7));
		crcOut(30) := (crcIn(0) xor crcIn(1) xor crcIn(6) xor crcIn(7) xor data(0) xor data(1) xor data(6) xor data(7));
		crcOut(31) := (crcIn(1) xor crcIn(7) xor data(1) xor data(7));
		return crcOut;
	end function;

end package body NetProtoHelpers_MAC;
