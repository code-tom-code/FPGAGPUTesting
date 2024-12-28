library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity SimpleFIFO is
	Generic ( FIFO_Depth : positive := 4;
			FIFO_Bit_Width : positive := 16
	);
	Port ( clk : in STD_LOGIC;

		FIFO_NextElementDataRd : out STD_LOGIC_VECTOR(FIFO_Bit_Width-1 downto 0) := (others => '0');
		FIFO_IsEmpty : out STD_LOGIC := '1';
		FIFO_PopLastElement : in STD_LOGIC;

		FIFO_IsFull : out STD_LOGIC := '0';
		FIFO_NewElementDataWr : in STD_LOGIC_VECTOR(FIFO_Bit_Width-1 downto 0);
		FIFO_PushNewElement : in STD_LOGIC
		);
end SimpleFIFO;

architecture Behavioral of SimpleFIFO is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type ArrayType is array(FIFO_Depth-1 downto 0) of STD_LOGIC_VECTOR(FIFO_Bit_Width-1 downto 0);

pure function quick_log2 (x : positive) return natural is
	variable i : natural;
begin
	i := 0;
	while (2**i < x) and i < 31 loop
		i := i + 1;
	end loop;
	return i;
end function;

signal DataArray : ArrayType := (others => (others => '0') );
signal CurrentSize : unsigned(quick_log2(FIFO_Depth)-1 downto 0) := (others => '0');
constant LimitSize : unsigned(quick_log2(FIFO_Depth)-1 downto 0) := (others => '1');
constant EmptySize : unsigned(quick_log2(FIFO_Depth)-1 downto 0) := (others => '0');
signal CurrentRdPtr : unsigned(quick_log2(FIFO_Depth)-1 downto 0) := (others => '0');
signal CurrentWrPtr : unsigned(quick_log2(FIFO_Depth)-1 downto 0) := (others => '0');

begin

	FIFO_IsFull <= '1' when (CurrentSize = LimitSize) else '0';
	FIFO_IsEmpty <= '1' when (CurrentSize = EmptySize) else '0';
	FIFO_NextElementDataRd <= DataArray(to_integer(CurrentRdPtr) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (FIFO_PushNewElement = '1' and FIFO_PopLastElement = '0') then
				CurrentSize <= CurrentSize + 1;
			elsif (FIFO_PushNewElement = '0' and FIFO_PopLastElement = '1') then
				CurrentSize <= CurrentSize - 1;
			end if;

			if (FIFO_PushNewElement = '1') then
				DataArray(to_integer(CurrentWrPtr) ) <= FIFO_NewElementDataWr;
				CurrentWrPtr <= CurrentWrPtr + 1;
			end if;

			if (FIFO_PopLastElement = '1') then
				CurrentRdPtr <= CurrentRdPtr + 1;
			end if;
		end if;
	end process;

end Behavioral;
