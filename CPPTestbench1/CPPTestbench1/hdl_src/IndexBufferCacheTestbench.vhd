
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity IndexBufferCacheTestbench is
    Port (clk : in STD_LOGIC;	

	-- Vertex Batch Builder interfaces begin
		VBB_ReadEnable : out STD_LOGIC := '0';
		VBB_ReadAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		VBB_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		VBB_ReadReady : in STD_LOGIC;
	-- Vertex Batch Builder interfaces end

		locked : in STD_LOGIC;

	-- Memory controller interfaces begin
		IBCReadRequestsFIFO_empty : in STD_LOGIC;
		IBCReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(30-1 downto 0);
		IBCReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

		IBCReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(30+256-1 downto 0) := (others => '0');
        IBCReadResponsesFIFO_full : in STD_LOGIC;
        IBCReadResponsesFIFO_wr_en : out STD_LOGIC := '0'
	-- Memory controller interfaces end
		);
end IndexBufferCacheTestbench;

architecture Behavioral of IndexBufferCacheTestbench is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333251231";

ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests RD_EN";
ATTRIBUTE X_INTERFACE_INFO of IBCReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IBCacheReadRequests EMPTY";

ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses WR_EN";
ATTRIBUTE X_INTERFACE_INFO of IBCReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IBCacheReadResponses FULL";

type ConstMemory is array(2 downto 0) of unsigned(255 downto 0);

constant IndexBuffer : ConstMemory := (
0 => (X"0006000600050007000200000006000600000004000300010002000200010000"),
1 => (X"0007000300060007000200000005000400050001000700070001000300040005"),
2 => (X"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC7FFFBFB70001000500000002")
);

signal index : unsigned(5 downto 0) := (others => '0');
signal asserted : std_logic := '0';

begin

MemoryProcess: process(clk)
begin
	if (rising_edge(clk) ) then
		if (IBCReadRequestsFIFO_empty = '0' and IBCReadResponsesFIFO_full = '0') then
			IBCReadResponsesFIFO_wr_data(285 downto 256) <= IBCReadRequestsFIFO_rd_data;
			IBCReadResponsesFIFO_wr_data(255 downto 0) <= std_logic_vector(IndexBuffer(to_integer(unsigned(IBCReadRequestsFIFO_rd_data(6 downto 5) ) ) ) );
			IBCReadRequestsFIFO_rd_en <= '1';
			IBCReadResponsesFIFO_wr_en <= '1';
		else
			IBCReadRequestsFIFO_rd_en <= '0';
			IBCReadResponsesFIFO_wr_en <= '0';
		end if;
	end if;
end process MemoryProcess;

TestProcess: process(clk)
begin
	if (rising_edge(clk) ) then
		if (locked = '1') then
			if (asserted = '0') then
				VBB_ReadAddr <= std_logic_vector(to_unsigned(16384, 30) + index);
				VBB_ReadEnable <= '1';

				if (VBB_ReadReady = '1') then
					asserted <= '1';
					VBB_ReadEnable <= '0';
					--assert (VBB_ReadData(15 downto 0) = X"0000") report "Error" severity Error;
				end if;
			else
				VBB_ReadEnable <= '0';
				if (VBB_ReadReady = '1') then
					asserted <= '0';
					index <= index + 2;
				end if;
			end if;
		end if;
	end if;
end process TestProcess;

end Behavioral;
