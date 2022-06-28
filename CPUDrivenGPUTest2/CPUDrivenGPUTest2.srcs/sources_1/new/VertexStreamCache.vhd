
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity VertexStreamCache is
    Port (clk : in STD_LOGIC;	

	-- Vertex Shader Core interfaces begin
		VSC_ReadEnable : in STD_LOGIC;
		VSC_ReadStreamIndex : in STD_LOGIC_VECTOR(2 downto 0);
		VSC_ReadDWORDAddr : in STD_LOGIC_VECTOR(21 downto 0);
		VSC_ReadData : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		VSC_ReadReady : out STD_LOGIC := '0';

		VSC_SetStreamVBAddress : in STD_LOGIC;
		VSC_StreamIndex : in STD_LOGIC_VECTOR(2 downto 0);
		VSC_StreamVBAddress : in STD_LOGIC_VECTOR(29 downto 0);

		VSC_InvalidateCache : in STD_LOGIC;
	-- Vertex Shader Core interfaces end

	-- BRAM interface begin
		VertexCache_clk : out STD_LOGIC := '0';
		VertexCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VertexCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- TODO: Change this to use a 64-bit BRAM interface instead of a 32-bit BRAM in the future. It consumes the same number of BRAM36k blocks while running at twice the bandwidth
		VertexCache_douta : in STD_LOGIC_VECTOR(31 downto 0);
		VertexCache_ena : out STD_LOGIC := '0';
		VertexCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- BRAM interface end

	-- Memory controller interfaces begin
		VSCReadRequestsFIFO_full : in STD_LOGIC;
		VSCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30-1 downto 0) := (others => '0');
		VSCReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		VSCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(30+256-1 downto 0);
        VSCReadResponsesFIFO_empty : in STD_LOGIC;
        VSCReadResponsesFIFO_rd_en : out STD_LOGIC := '0'
	-- Memory controller interfaces end
		);
end VertexStreamCache;

architecture Behavioral of VertexStreamCache is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests FULL";

ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses EMPTY";

ATTRIBUTE X_INTERFACE_INFO of VertexCache_clk: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache CLK";
ATTRIBUTE X_INTERFACE_INFO of VertexCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache EN";
ATTRIBUTE X_INTERFACE_INFO of VertexCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VertexCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VertexCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache WE";
ATTRIBUTE X_INTERFACE_INFO of VertexCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBCache ADDR";

type eCacheState is
(
	initState, -- 0

	readyState, -- 1

	cacheMissState, -- 2

	waitForMemReadState, -- 3

	waitForBRAMReadState, -- 4
	waitForBRAMReadState2 -- 5
);

type structCacheEntry is record
	vertStreamIndex : unsigned(2 downto 0); -- The vertex stream index (0-7) of this cache entry (will always be 0 for interleaved vertices and for DrawPrimitiveUP() calls)
	readLineIndex : unsigned(13 downto 0); -- The DRAM line index starting from the vertex buffer address for this vertex stream
end record structCacheEntry;

type structCacheSet is record -- This is a 4-way set associative cache, so each cache set has 4 entries:
	entry0 : structCacheEntry;
	entry1 : structCacheEntry;
	entry2 : structCacheEntry;
	entry3 : structCacheEntry;
	cacheRotationOffset : unsigned(1 downto 0);
end record structCacheSet;

type cacheLines_t is array(31 downto 0) of structCacheSet;

type vertexStreamAddresses_t is array(7 downto 0) of unsigned(29 downto 0);

signal cacheLines : cacheLines_t;

signal vertexStreamAddresses : vertexStreamAddresses_t;

signal currentState : eCacheState := initState;

signal writeCacheLineDWORD : unsigned(2 downto 0) := (others => '0');

pure function GetCacheSetIndexFromDWORDAddr(DWORDAddr : unsigned(21 downto 0); requestStreamIndex : unsigned(2 downto 0) ) return unsigned is
begin
	-- The bottom 3 bits of the DWORD addr are for the 32-byte (8 DWORD) length cache line, so use the next 5 bits because we have 32 cache sets.
	-- Offset our cache set index by the streamIndex * 4 (because we have 32 cache sets and 8 streams, so that evenly divides to equal 4).
	return DWORDAddr(7 downto 3) + (requestStreamIndex & "00");
end function;

pure function IsAddressInCurrentCache(requestStreamIndex : unsigned(2 downto 0); requestDRAMLine : unsigned(13 downto 0); currentCacheSet : structCacheSet) return std_logic is
begin
	if ( ( (requestStreamIndex = currentCacheSet.entry0.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry0.readLineIndex) ) or
	( (requestStreamIndex = currentCacheSet.entry1.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry1.readLineIndex) ) or
	( (requestStreamIndex = currentCacheSet.entry2.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry2.readLineIndex) ) or
	( (requestStreamIndex = currentCacheSet.entry3.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry3.readLineIndex) ) ) then
		return '1';
	else
		return '0';
	end if;
end function;

-- This function assumes that we already have a known cache hit and we just want to retrieve the index of the hit
pure function GetCacheHitIndex(requestStreamIndex : unsigned(2 downto 0); requestDRAMLine : unsigned(13 downto 0); currentCacheSet : structCacheSet) return unsigned is
begin
	if ( (requestStreamIndex = currentCacheSet.entry0.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry0.readLineIndex) ) then
		return "00" + currentCacheSet.cacheRotationOffset;
	elsif ( (requestStreamIndex = currentCacheSet.entry1.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry1.readLineIndex) ) then
		return "01" + currentCacheSet.cacheRotationOffset;
	elsif ( (requestStreamIndex = currentCacheSet.entry2.vertStreamIndex) and (requestDRAMLine = currentCacheSet.entry2.readLineIndex) ) then
		return "10" + currentCacheSet.cacheRotationOffset;
	else
		return "11" + currentCacheSet.cacheRotationOffset;
	end if;
end function;

pure function GetBRAMAddress(cacheSetIndex : unsigned(4 downto 0); cacheHitEntryIndex : unsigned(1 downto 0); readDWORDAddr : unsigned(21 downto 0) ) return unsigned is
begin
	return cacheSetIndex & cacheHitEntryIndex & readDWORDAddr(2 downto 0);
end function;

signal addressIsInCurrentCache : STD_LOGIC := '0';
signal selectedCacheSetIndex : unsigned(4 downto 0) := (others => '0');

begin

VertexCache_clk <= clk;
selectedCacheSetIndex <= GetCacheSetIndexFromDWORDAddr(unsigned(VSC_ReadDWORDAddr), unsigned(VSC_ReadStreamIndex) );
addressIsInCurrentCache <= IsAddressInCurrentCache(unsigned(VSC_ReadStreamIndex), unsigned(VSC_ReadDWORDAddr(21 downto 8) ), cacheLines(to_integer(GetCacheSetIndexFromDWORDAddr(unsigned(VSC_ReadDWORDAddr), unsigned(VSC_ReadStreamIndex) ) ) ) );

-- DBG_State <= std_logic_vector(to_unsigned(eCacheState'pos(currentState), 2) );

-- Use a separate process to handle writing the new vertex buffer stream addresses to keep things a little cleaner:
process(clk)
begin
	if (rising_edge(clk) ) then
		if (VSC_SetStreamVBAddress = '1') then
			vertexStreamAddresses(to_integer(unsigned(VSC_StreamIndex) ) ) <= unsigned(VSC_StreamVBAddress);
		end if;
	end if;
end process;

process(clk)
	procedure InvalidateCacheEntries(constant cacheSetIndex : integer) is
	begin
		cacheLines(cacheSetIndex).entry0.vertStreamIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry0.readLineIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry1.vertStreamIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry1.readLineIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry2.vertStreamIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry2.readLineIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry3.vertStreamIndex <= (others => '1');
		cacheLines(cacheSetIndex).entry3.readLineIndex <= (others => '1');
		cacheLines(cacheSetIndex).cacheRotationOffset <= (others => '0');
	end InvalidateCacheEntries;

	variable selectedCacheSet : structCacheSet;
	variable selectedCacheSetIndexInt : natural range 0 to 31;
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				currentState <= readyState;

			when readyState =>
				VSCReadResponsesFIFO_rd_en <= '0';
				VSC_ReadReady <= '0';
				VertexCache_wea <= (others => '0');
				VertexCache_ena <= '0';

				if (VSC_InvalidateCache = '1') then
					for iter in 0 to 31 loop
						InvalidateCacheEntries(iter);
					end loop;
				elsif (VSC_ReadEnable = '1') then
					selectedCacheSetIndexInt := to_integer(selectedCacheSetIndex);
					selectedCacheSet := cacheLines(selectedCacheSetIndexInt);
					if (addressIsInCurrentCache = '1') then -- Cache hit
						VertexCache_addra <= std_logic_vector(GetBRAMAddress(selectedCacheSetIndex, GetCacheHitIndex(unsigned(VSC_ReadStreamIndex), unsigned(VSC_ReadDWORDAddr(21 downto 8) ), selectedCacheSet), unsigned(VSC_ReadDWORDAddr) ) );
						VertexCache_ena <= '1';
						currentState <= waitForBRAMReadState;
					else -- Cache miss
						VSCReadRequestsFIFO_wr_data <= std_logic_vector(resize(vertexStreamAddresses(to_integer(unsigned(VSC_ReadStreamIndex) ) ) + (unsigned(VSC_ReadDWORDAddr) sll 2), 30) );
						VSCReadRequestsFIFO_wr_en <= '1';

						currentState <= cacheMissState;
					end if;
				end if;

			when cacheMissState =>
				selectedCacheSetIndexInt := to_integer(selectedCacheSetIndex);

				-- Shift down the cache lines to make room for a new entry:
				cacheLines(selectedCacheSetIndexInt).entry3 <= cacheLines(selectedCacheSetIndexInt).entry2;
				cacheLines(selectedCacheSetIndexInt).entry2 <= cacheLines(selectedCacheSetIndexInt).entry1;
				cacheLines(selectedCacheSetIndexInt).entry1 <= cacheLines(selectedCacheSetIndexInt).entry0;
				cacheLines(selectedCacheSetIndexInt).cacheRotationOffset <= cacheLines(selectedCacheSetIndexInt).cacheRotationOffset - 1;

				-- Write our new cache line entry:
				cacheLines(selectedCacheSetIndexInt).entry0.vertStreamIndex <= unsigned(VSC_ReadStreamIndex);
				cacheLines(selectedCacheSetIndexInt).entry0.readLineIndex <= unsigned(VSC_ReadDWORDAddr(21 downto 8) );

				writeCacheLineDWORD <= (others => '0');
				currentState <= waitForMemReadState;

			when waitForMemReadState =>
				selectedCacheSetIndexInt := to_integer(selectedCacheSetIndex);
				selectedCacheSet := cacheLines(selectedCacheSetIndexInt);
				VertexCache_addra <= std_logic_vector(GetBRAMAddress(selectedCacheSetIndex, GetCacheHitIndex(unsigned(VSC_ReadStreamIndex), unsigned(VSC_ReadDWORDAddr(21 downto 8) ), selectedCacheSet), unsigned(VSC_ReadDWORDAddr) + writeCacheLineDWORD) );
				VSCReadRequestsFIFO_wr_en <= '0';
				if (VSCReadResponsesFIFO_empty = '0') then
					VertexCache_wea <= (others => '1');
					VertexCache_ena <= '1';

					case writeCacheLineDWORD is
						when "000" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*1-1 downto 32*0);
						when "001" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*2-1 downto 32*1);
						when "010" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*3-1 downto 32*2);
						when "011" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*4-1 downto 32*3);
						when "100" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*5-1 downto 32*4);
						when "101" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*6-1 downto 32*5);
						when "110" =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*7-1 downto 32*6);
						when others =>
							VertexCache_dina <= VSCReadResponsesFIFO_rd_data(32*8-1 downto 32*7);
					end case;

					if (writeCacheLineDWORD = "111") then
						VSCReadResponsesFIFO_rd_en <= '1';
						currentState <= readyState;
					end if;

					writeCacheLineDWORD <= writeCacheLineDWORD + 1;
				end if;

			when waitForBRAMReadState =>
				VertexCache_ena <= '0';
				currentState <= waitForBRAMReadState2;

			when waitForBRAMReadState2 =>
				VertexCache_ena <= '0';
				VSC_ReadData <= VertexCache_douta;
				VSC_ReadReady <= '1';
				currentState <= readyState;

			when others =>
		end case;
	end if;
end process;

end Behavioral;
