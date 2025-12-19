library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity DbgPixelMessages is
	generic (
		C_MAX_NUM_MESSAGES : integer range 4 to 256 := 64
	);
	Port (clk : in STD_LOGIC;
	
		CMD_EndFrameReset : in STD_LOGIC;
		
		DBG_BeginDump : in STD_LOGIC;
		
		STAGE_Message : in STD_LOGIC_VECTOR(15 downto 0);
		STAGE_MessageData : in STD_LOGIC_VECTOR(15 downto 0);
		STAGE_NewMessage : in STD_LOGIC;
		
		DBG_IsDumping : out STD_LOGIC := '0';
		DBG_MessageIndex : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_Message : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MessageData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
		);
end DbgPixelMessages;

architecture Behavioral of DbgPixelMessages is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE X_INTERFACE_MODE : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";

-- We're using the ASSOCIATED_BUSIF parameter here to associate these other interfaces' clocks with the main clock (which is this module's primary driving clock for everything).
-- Doing this fixes the following IPI import warning: WARNING: [IP_Flow 19-11886] Bus Interface 'clk' is not associated with any clock interface
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type messageElement_t is array(C_MAX_NUM_MESSAGES-1 downto 0) of unsigned(15 downto 0);
signal elements : messageElement_t := (others => (others => '0') );
signal elementsData : messageElement_t := (others => (others => '0') );
signal currentWriteElementIndex : unsigned(7 downto 0) := (others => '0');
signal currentReadElementIndex : unsigned(7 downto 0) := (others => '0');
signal currentIsDumping : std_logic := '0';
signal endDumpingDebounce : std_logic := '0';

begin

	DBG_MessageIndex <= std_logic_vector(currentReadElementIndex);
	DBG_Message <= std_logic_vector(elements(to_integer(currentReadElementIndex) ) );
	DBG_MessageData <= std_logic_vector(elementsData(to_integer(currentReadElementIndex) ) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (STAGE_NewMessage = '1' and STAGE_Message(15) = '1') then -- We only care about "special" messages where the high bit (sign bit) is set
				elements(to_integer(currentWriteElementIndex) ) <= unsigned(STAGE_Message);
				elementsData(to_integer(currentWriteElementIndex) ) <= unsigned(STAGE_MessageData);
				currentWriteElementIndex <= currentWriteElementIndex + 1;
			end if;
			if (CMD_EndFrameReset = '1') then
				currentWriteElementIndex <= (others => '0');
			end if;
			if (currentIsDumping = '1') then
				currentReadElementIndex <= currentReadElementIndex + 1;
				if (currentReadElementIndex = currentWriteElementIndex) then
					currentIsDumping <= '0';
					endDumpingDebounce <= '1';
				end if;
			else
				currentReadElementIndex <= (others => '0');
			end if;
			
			if (DBG_BeginDump = '1' and endDumpingDebounce = '0' and currentIsDumping = '0') then
				 currentIsDumping <= '1';
			elsif (DBG_BeginDump = '0' and endDumpingDebounce = '1' and currentIsDumping = '0') then
				endDumpingDebounce <= '0';
			end if;
		end if;
	end process;

end Behavioral;
