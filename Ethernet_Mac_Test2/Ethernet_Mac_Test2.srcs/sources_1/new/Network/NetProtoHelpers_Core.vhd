library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.all;

-- Core network protocol helpers that are available to all protocols
package NetProtoHelpers_Core is

	constant ETHERTYPE_IPv4 : unsigned := to_unsigned(16#0800#, 16);
	constant ETHERTYPE_ARP : unsigned := to_unsigned(16#0806#, 16);

	-- Reverses the bytes in a 32-bit DWORD to go from little endian device byte ordering to big endian network byte order
	pure function HToNL(dwordLittleEndian : unsigned(31 downto 0) ) return unsigned;

	-- Reverses the bytes in a 32-bit DWORD to go from big endian network byte ordering to little endian device byte order
	pure function NToHL(dwordBigEndian : unsigned(31 downto 0) ) return unsigned;

	-- Reverses the bytes in a 16-bit WORD to go from little endian device byte ordering to big endian network byte order
	pure function HToNS(dwordLittleEndian : unsigned(15 downto 0) ) return unsigned;

	-- Reverses the bytes in a 16-bit WORD to go from big endian network byte ordering to little endian device byte order
	pure function NToHS(dwordBigEndian : unsigned(15 downto 0) ) return unsigned;

end package NetProtoHelpers_Core;

package body NetProtoHelpers_Core is

	-- Reverses the bytes in a 32-bit DWORD to go from little endian device byte ordering to big endian network byte order
	pure function HToNL(dwordLittleEndian : unsigned(31 downto 0) ) return unsigned is
	begin
		return (dwordLittleEndian(7 downto 0) ) & (dwordLittleEndian(15 downto 8) ) & (dwordLittleEndian(23 downto 16) ) & (dwordLittleEndian(31 downto 24) );
	end function;

	-- Reverses the bytes in a 32-bit DWORD to go from big endian network byte ordering to little endian device byte order
	pure function NToHL(dwordBigEndian : unsigned(31 downto 0) ) return unsigned is
	begin
		return (dwordBigEndian(7 downto 0) ) & (dwordBigEndian(15 downto 8) ) & (dwordBigEndian(23 downto 16) ) & (dwordBigEndian(31 downto 24) );
	end function;

	-- Reverses the bytes in a 16-bit WORD to go from little endian device byte ordering to big endian network byte order
	pure function HToNS(dwordLittleEndian : unsigned(15 downto 0) ) return unsigned is
	begin
		return (dwordLittleEndian(7 downto 0) ) & (dwordLittleEndian(15 downto 8) );
	end function;

	-- Reverses the bytes in a 16-bit WORD to go from big endian network byte ordering to little endian device byte order
	pure function NToHS(dwordBigEndian : unsigned(15 downto 0) ) return unsigned is
	begin
		return (dwordBigEndian(7 downto 0) ) & (dwordBigEndian(15 downto 8) );
	end function;

end package body NetProtoHelpers_Core;
