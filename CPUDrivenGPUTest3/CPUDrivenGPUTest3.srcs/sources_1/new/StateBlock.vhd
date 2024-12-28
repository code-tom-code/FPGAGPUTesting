library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity StateBlock is
	Generic ( StateBitsCount : positive := 32 
	);
	Port ( clk : in STD_LOGIC;

	-- Command Processor interface begin
		CMD_SetNewState : in STD_LOGIC;
		CMD_EndFrameReset : in STD_LOGIC;
		CMD_NumFreeSlots : out STD_LOGIC_VECTOR(2 downto 0) := (others => '1');
		CMD_NewStateBits : in STD_LOGIC_VECTOR(StateBitsCount-1 downto 0);
		CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);
	-- Command Processor interface end

	-- Stage interface begin
		STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR(StateBitsCount-1 downto 0) := (others => '0');
		STAGE_NextDrawID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		STAGE_StateIsValid : out STD_LOGIC := '0';
		STAGE_ConsumeStateSlot : in STD_LOGIC;
	-- Stage interface end

	-- Debug signals begin
		DBG_SlotsValid : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		DBG_Slot0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_Slot1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_Slot2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_Slot3 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
		);
end StateBlock;

architecture Behavioral of StateBlock is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

subtype SlotDataType is unsigned(StateBitsCount-1 downto 0);

type SlotType is record
	SlotData : SlotDataType;
	SlotDrawEventID : unsigned(15 downto 0);
	SlotIsValid : std_logic;
end record SlotType;

constant DefaultSlotType : SlotType := (SlotData => (others => '0'), SlotDrawEventID => (others => '0'), SlotIsValid => '0');

type SlotsArray is array(0 to 3) of SlotType;

signal currentReadSlot : unsigned(1 downto 0) := (others => '0');
signal currentWriteSlot : unsigned(1 downto 0) := (others => '0');
signal slotsData : SlotsArray := (others => DefaultSlotType);

pure function GetFreeSlotsCount(currentSlots : SlotsArray) return unsigned is
	variable counter : unsigned(2 downto 0);
begin
	counter := (others => '0');
	if (currentSlots(0).SlotIsValid = '0') then
		counter := counter + 1;
	end if;
	if (currentSlots(1).SlotIsValid = '0') then
		counter := counter + 1;
	end if;
	if (currentSlots(2).SlotIsValid = '0') then
		counter := counter + 1;
	end if;
	if (currentSlots(3).SlotIsValid = '0') then
		counter := counter + 1;
	end if;
	return counter;
end function;

begin

	CMD_NumFreeSlots <= std_logic_vector(GetFreeSlotsCount(slotsData) );

	STAGE_NextDrawID <= std_logic_vector(slotsData(to_integer(currentReadSlot) ).SlotDrawEventID);
	STAGE_StateBitsAtDrawID <= std_logic_vector(slotsData(to_integer(currentReadSlot) ).SlotData);
	STAGE_StateIsValid <= slotsData(to_integer(currentReadSlot) ).SlotIsValid;
	DBG_CurrentReadSlotIndex <= std_logic_vector(currentReadSlot);
	DBG_CurrentWriteSlotIndex <= std_logic_vector(currentWriteSlot);
	DBG_SlotsValid <= slotsData(3).SlotIsValid & slotsData(2).SlotIsValid & slotsData(1).SlotIsValid & slotsData(0).SlotIsValid;
	DBG_Slot0 <= std_logic_vector(slotsData(0).SlotDrawEventID);
	DBG_Slot1 <= std_logic_vector(slotsData(1).SlotDrawEventID);
	DBG_Slot2 <= std_logic_vector(slotsData(2).SlotDrawEventID);
	DBG_Slot3 <= std_logic_vector(slotsData(3).SlotDrawEventID);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (CMD_EndFrameReset = '1') then
				slotsData(0) <= DefaultSlotType;
				slotsData(1) <= DefaultSlotType;
				slotsData(2) <= DefaultSlotType;
				slotsData(3) <= DefaultSlotType;
				currentWriteSlot <= (others => '0');
				currentReadSlot <= (others => '0');
			else
				if (STAGE_ConsumeStateSlot = '1') then
					slotsData(to_integer(currentReadSlot) ).SlotIsValid <= '0';
					slotsData(to_integer(currentReadSlot) ).SlotDrawEventID <= (others => '0');
					currentReadSlot <= currentReadSlot + 1;
				end if;

				if (CMD_SetNewState = '1') then
					slotsData(to_integer(currentWriteSlot) ).SlotData <= unsigned(CMD_NewStateBits);
					slotsData(to_integer(currentWriteSlot) ).SlotDrawEventID <= unsigned(CMD_NewStateDrawEventID);
					slotsData(to_integer(currentWriteSlot) ).SlotIsValid <= '1';
					currentWriteSlot <= currentWriteSlot + 1;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
