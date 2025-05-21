library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity StatsDataSampler is
	GENERIC(
		DataBitWidth : integer := 32;
		BRAMAddrBitWidth : integer := 10
	);
	Port ( clk : in STD_LOGIC;

	-- BRAM interface begin
		SamplingCache_clk : out STD_LOGIC := '0';
		SamplingCache_addra : out STD_LOGIC_VECTOR(BRAMAddrBitWidth-1 downto 0) := (others => '0');
		SamplingCache_dina : out STD_LOGIC_VECTOR(DataBitWidth-1 downto 0) := (others => '0');
		SamplingCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- BRAM interface end

		STAT_SamplingIntervalCycles : in STD_LOGIC_VECTOR(31 downto 0);
		STAT_SampleData : in STD_LOGIC_VECTOR(DataBitWidth-1 downto 0);
		STAT_CurrentWriteIndex : out STD_LOGIC_VECTOR(BRAMAddrBitWidth-1 downto 0) := (others => '0');
		STAT_Reset : in STD_LOGIC
		);
end StatsDataSampler;

architecture Behavioral of StatsDataSampler is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of SamplingCache_clk: SIGNAL is "xilinx.com:interface:bram:1.0 SamplingCache CLK";
ATTRIBUTE X_INTERFACE_INFO of SamplingCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 SamplingCache DIN";
ATTRIBUTE X_INTERFACE_INFO of SamplingCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 SamplingCache WE";
ATTRIBUTE X_INTERFACE_INFO of SamplingCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 SamplingCache ADDR";

signal samplingInterval_cycles : unsigned(31 downto 0) := to_unsigned(333250, 32); -- Sample once every 333250 cycles by default (this is exactly 1000Hz at 333.250MHz)
signal currentCycle : unsigned(31 downto 0) := (others => '0');
signal currentWriteIndex : unsigned(BRAMAddrBitWidth-1 downto 0) := (others => '0');

begin

	SamplingCache_clk <= clk;
	SamplingCache_dina <= STAT_SampleData;
	SamplingCache_addra <= std_logic_vector(currentWriteIndex);
	STAT_CurrentWriteIndex <= std_logic_vector(currentWriteIndex);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			SamplingCache_wea <= "0";
			if (STAT_Reset = '1') then
				samplingInterval_cycles <= unsigned(STAT_SamplingIntervalCycles);
				currentWriteIndex <= (others => '0');
				currentCycle <= (others => '0');
			else
				if (currentCycle = samplingInterval_cycles) then
					currentCycle <= (others => '0');
					SamplingCache_wea <= "1";
					currentWriteIndex <= currentWriteIndex + 1;
				else
					currentCycle <= currentCycle + 1;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
