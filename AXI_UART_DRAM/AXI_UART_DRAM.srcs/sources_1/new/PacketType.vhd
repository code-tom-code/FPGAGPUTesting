----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2021 01:09:26 AM
-- Design Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;

package PacketType is

	constant MAGIC_PACKET_BYTE_VALUE : integer := 67; -- This is 'C' in ASCII

	constant PACKET_SIZE_IN_BYTES : integer := 11; -- Make sure to update this if the packet size increases on the C++ side

	type packetBytesArray is array (PACKET_SIZE_IN_BYTES-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);

	-- Be sure that if the C++ side enum changes to update this here too! Unknown packet types will simply get dropped!
	type packetType is
	(
		PT_DONOTHING, -- 0
		PT_WRITEMEM, -- 1
		PT_READMEM, -- 2
		PT_READMEMRESPONSE, -- 3

		PT_MAX_PACKET_TYPES -- Must always be last!
	);

	-- Computes the packet checksum byte
	pure function ComputePacketChecksum(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return unsigned;

	 -- Returns '1' if the packet is valid and should be processed, or '0' if the packet should be discarded
	 pure function IsPacketDataValid(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetChecksum : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return std_logic;

	type genericPacket is record
		magicByte : unsigned(7 downto 0); -- Must always be equal to ASCII 'C' (decimal 67, hex 0x43) or else packet gets discarded
		checksum : unsigned(7 downto 0); -- Sum of the whole packet (including the magicByte and the checksum field as if it were set to 0x00)
		packetTypeByte : unsigned(7 downto 0); -- Determines the packet's type (use the packetType enum)
		payload0 : unsigned(31 downto 0); -- Use depends upon the type of this packet
		payload1 : unsigned(31 downto 0); -- Use depends upon the type of this packet
	end record genericPacket;

end package PacketType;

package body PacketType is

	pure function ComputePacketChecksum(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return unsigned is
		variable retVal : unsigned(7 downto 0) := (others => '0');
		variable tempByte : unsigned(7 downto 0) := (others => '0');
	begin
		retVal := unsigned(packetMagicHeader);
		retVal := retVal + unsigned(packetTypeByte);
		tempByte := unsigned(packetData0(7 downto 0) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(15 downto 8) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(23 downto 16) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(31 downto 24) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(7 downto 0) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(15 downto 8) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(23 downto 16) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(31 downto 24) );
		retVal := retVal + tempByte;
		return retVal and X"FF";
	end;

	-- Returns '1' if the packet is valid and should be processed, or '0' if the packet should be discarded
	pure function IsPacketDataValid(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetChecksum : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return std_logic is
		variable magicByteMatch : std_logic := '0';
		variable checksumMatch : std_logic := '0';
		variable packetTypeInRange : std_logic := '0';
	begin
		if (unsigned(packetMagicHeader) = to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8) ) then
			magicByteMatch := '1';
		end if;
		if (ComputePacketChecksum(packetMagicHeader, packetTypeByte, packetData0, packetData1) = unsigned(packetChecksum) ) then
			checksumMatch := '1';
		end if;
		if (unsigned(packetTypeByte) < packetType'pos(PT_MAX_PACKET_TYPES) ) then
			packetTypeInRange := '1';
		end if;

		return magicByteMatch and checksumMatch and packetTypeInRange;
	end;

end package body PacketType;
