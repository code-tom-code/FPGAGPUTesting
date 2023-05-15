library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity StatsEventTracker is
	Port ( clk : in STD_LOGIC;

		STAGE_CurrentEventID : in STD_LOGIC_VECTOR(15 downto 0);
		STAT_CurrentTimestamp : in STD_LOGIC_VECTOR(31 downto 0);
		STAT_WriteIsReady : out STD_LOGIC := '0';
		STAT_WriteDRAMLine : out STD_LOGIC_VECTOR(255 downto 0);
		STAT_FlushWrite : in STD_LOGIC;
		STAT_AckWrite : in STD_LOGIC
		);
end StatsEventTracker;

architecture Behavioral of StatsEventTracker is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type TimestampBufferType is array(0 to 7) of unsigned(31 downto 0);
type DoubleBufferedTimestampBuffers is array (0 to 1) of TimestampBufferType;

signal stageCurrentEventID : unsigned(15 downto 0) := (others => '0');
signal doubleBufferWriteIndex : unsigned(0 downto 0) := "0";
signal doubleBufferReadIndex : unsigned(0 downto 0) := "1";
signal dataBuffers : DoubleBufferedTimestampBuffers := (others => (others => (others => '0') ) );
signal currentBufferOffset : unsigned(2 downto 0) := (others => '0');

begin

	STAT_WriteDRAMLine <= std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(7) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(6) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(5) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(4) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(3) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(2) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(1) ) 
		& std_logic_vector(dataBuffers(to_integer(doubleBufferReadIndex) )(0) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (STAT_AckWrite = '1') then
				STAT_WriteIsReady <= '0';
			end if;

			if (stageCurrentEventID /= STAGE_CurrentEventID) then
				dataBuffers(to_integer(doubleBufferWriteIndex) )(to_integer(currentBufferOffset) ) <= STAT_CurrentTimestamp;

				if (currentBufferOffset = "111") then
					STAT_WriteIsReady <= '1';
					doubleBufferReadIndex <= doubleBufferWriteIndex;
					doubleBufferWriteIndex <= not doubleBufferWriteIndex;
				end if;
				currentBufferOffset <= currentBufferOffset + 1;
				stageCurrentEventID <= STAGE_CurrentEventID;
			elsif (STAT_FlushWrite = '1') then
				STAT_WriteIsReady <= '1';
				currentBufferOffset <= (others => '0');
				doubleBufferReadIndex <= doubleBufferWriteIndex;
				doubleBufferWriteIndex <= not doubleBufferWriteIndex;
			end if;
		end if;
	end process;

end Behavioral;
