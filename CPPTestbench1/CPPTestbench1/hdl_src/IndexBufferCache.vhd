
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity IndexBufferCache is
    Port (clk : in STD_LOGIC;	

	-- Vertex Batch Builder interfaces begin
		VBB_ReadEnable : in STD_LOGIC;
		VBB_ReadAddr : in STD_LOGIC_VECTOR(29 downto 0);
		VBB_ReadData : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		VBB_ReadReady : out STD_LOGIC := '0';
	-- Vertex Batch Builder interfaces end

	-- Memory controller interfaces begin
		IBCReadRequestsFIFO_full : in STD_LOGIC;
		IBCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30-1 downto 0) := (others => '0');
		IBCReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		IBCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(30+256-1 downto 0);
        IBCReadResponsesFIFO_empty : in STD_LOGIC;
        IBCReadResponsesFIFO_rd_en : out STD_LOGIC := '0'
	-- Memory controller interfaces end
		);
end IndexBufferCache;

architecture Behavioral of IndexBufferCache is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN";
ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests FULL";

ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses EMPTY";

type eCacheState is
(
	initState, -- 0

	readyState, -- 1

	waitForMemReadState -- 2
);

signal currentState : eCacheState := initState;

signal currentCache0BaseAddr : unsigned(24 downto 0) := (others => '0');
signal currentCache1BaseAddr : unsigned(24 downto 0) := (others => '0');
signal currentCache2BaseAddr : unsigned(24 downto 0) := (others => '0');
signal currentCache3BaseAddr : unsigned(24 downto 0) := (others => '0');
signal currentCache0Data : unsigned(255 downto 0) := (others => '0');
signal currentCache1Data : unsigned(255 downto 0) := (others => '0');
signal currentCache2Data : unsigned(255 downto 0) := (others => '0');
signal currentCache3Data : unsigned(255 downto 0) := (others => '0');
signal nextCacheLineWrite : unsigned(1 downto 0) := (others => '0');

pure function IsAddressInCurrentCache(addr : unsigned(24 downto 0); cache0BaseAddr : unsigned(24 downto 0); cache1BaseAddr : unsigned(24 downto 0); cache2BaseAddr : unsigned(24 downto 0); cache3BaseAddr : unsigned(24 downto 0) ) return std_logic is
begin
	if (cache0BaseAddr = addr) then
		return '1';
	elsif (cache1BaseAddr = addr) then
		return '1';
	elsif (cache2BaseAddr = addr) then
		return '1';
	elsif (cache3BaseAddr = addr) then
		return '1';
	else
		return '0';
	end if;
end function;

-- Do not call this function unless it is known that the requested address lies within the base address
pure function GetCurrentCacheIndexForAddress(addr : unsigned(24 downto 0); cache0BaseAddr : unsigned(24 downto 0); cache1BaseAddr : unsigned(24 downto 0); cache2BaseAddr : unsigned(24 downto 0); cache3BaseAddr : unsigned(24 downto 0) ) return unsigned is
begin
	if (cache1BaseAddr = addr) then
		return to_unsigned(1, 2);
	elsif (cache2BaseAddr = addr) then
		return to_unsigned(2, 2);
	elsif (cache3BaseAddr = addr) then
		return to_unsigned(3, 2);
	else
		return to_unsigned(0, 2);
	end if;
end function;

pure function ReadDataFromCacheLine(addr : unsigned(4 downto 0); cacheData : unsigned(255 downto 0) ) return unsigned is
	variable ret : unsigned(31 downto 0);
begin
	case addr(4 downto 2) is
		when "000" =>
			ret := cacheData(32*1-1 downto 32*0);
		when "001" =>
			ret := cacheData(32*2-1 downto 32*1);
		when "010" =>
			ret := cacheData(32*3-1 downto 32*2);
		when "011" =>
			ret := cacheData(32*4-1 downto 32*3);
		when "100" =>
			ret := cacheData(32*5-1 downto 32*4);
		when "101" =>
			ret := cacheData(32*6-1 downto 32*5);
		when "110" =>
			ret := cacheData(32*7-1 downto 32*6);
		when "111" =>
			ret := cacheData(32*8-1 downto 32*7);
	end case;
	case addr(1 downto 0) is
		when "00" =>
		when "01" =>
			ret := ret srl 8;
		when "10" =>
			ret := ret srl 16;
		when "11" =>
			ret := ret srl 24;
	end case;
	return ret;
end function;

begin

-- DBG_State <= std_logic_vector(to_unsigned(eCacheState'pos(currentState), 2) );

process(clk)
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				currentState <= readyState;

			when readyState =>
				IBCReadResponsesFIFO_rd_en <= '0';
				if (VBB_ReadEnable = '1') then
					if (IsAddressInCurrentCache(unsigned(VBB_ReadAddr(29 downto 5) ), currentCache0BaseAddr, currentCache1BaseAddr, currentCache2BaseAddr, currentCache3BaseAddr) = '1') then
						case GetCurrentCacheIndexForAddress(unsigned(VBB_ReadAddr(29 downto 5) ), currentCache0BaseAddr, currentCache1BaseAddr, currentCache2BaseAddr, currentCache3BaseAddr ) is
							when "00" =>
								VBB_ReadData <= std_logic_vector(ReadDataFromCacheLine(unsigned(VBB_ReadAddr(4 downto 0) ), currentCache0Data) );
							when "01" =>
								VBB_ReadData <= std_logic_vector(ReadDataFromCacheLine(unsigned(VBB_ReadAddr(4 downto 0) ), currentCache1Data) );
							when "10" =>
								VBB_ReadData <= std_logic_vector(ReadDataFromCacheLine(unsigned(VBB_ReadAddr(4 downto 0) ), currentCache2Data) );
							when "11" =>
								VBB_ReadData <= std_logic_vector(ReadDataFromCacheLine(unsigned(VBB_ReadAddr(4 downto 0) ), currentCache3Data) );
						end case;
						VBB_ReadReady <= '1';
					else
						VBB_ReadReady <= '0';
						if (IBCReadRequestsFIFO_full = '0') then
							IBCReadRequestsFIFO_wr_data <= VBB_ReadAddr(29 downto 5) & "00000";
							IBCReadRequestsFIFO_wr_en <= '1';
							currentState <= waitForMemReadState;
						else
							IBCReadRequestsFIFO_wr_en <= '0';
						end if;
					end if;
				else
					VBB_ReadReady <= '0';
				end if;

			when waitForMemReadState =>
				IBCReadRequestsFIFO_wr_en <= '0';
				if (IBCReadResponsesFIFO_empty = '0') then
					IBCReadResponsesFIFO_rd_en <= '1';
					case nextCacheLineWrite is
						when "00" =>
							currentCache0Data <= unsigned(IBCReadResponsesFIFO_rd_data(255 downto 0) );
							currentCache0BaseAddr <= unsigned(VBB_ReadAddr(29 downto 5) );
						when "01" =>
							currentCache1Data <= unsigned(IBCReadResponsesFIFO_rd_data(255 downto 0) );
							currentCache1BaseAddr <= unsigned(VBB_ReadAddr(29 downto 5) );
						when "10" =>
							currentCache2Data <= unsigned(IBCReadResponsesFIFO_rd_data(255 downto 0) );
							currentCache2BaseAddr <= unsigned(VBB_ReadAddr(29 downto 5) );
						when "11" =>
							currentCache3Data <= unsigned(IBCReadResponsesFIFO_rd_data(255 downto 0) );
							currentCache3BaseAddr <= unsigned(VBB_ReadAddr(29 downto 5) );
						when others =>
					end case;
					nextCacheLineWrite <= nextCacheLineWrite + 1;
					currentState <= readyState;
				end if;

			when others =>
		end case;
	end if;
end process;

end Behavioral;