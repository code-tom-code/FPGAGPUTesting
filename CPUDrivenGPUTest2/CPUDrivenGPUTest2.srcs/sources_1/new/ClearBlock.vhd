library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity ClearBlock is
	Port (clk : in STD_LOGIC;

	-- Command Processor interfaces begin
		CMD_ClearBlockIsIdle : out STD_LOGIC := '0';

		CMD_ClearBlockBeginSignal : in STD_LOGIC;
		CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_ClearColorRGBA : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_ClearDRAMLineCount : in STD_LOGIC_VECTOR(15 downto 0);
	-- Command Processor interfaces end

	-- Memory Controller FIFO interface begin
		-- DRAM write requests FIFO:
		MEM_ClearBlockWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0');
        MEM_ClearBlockWriteRequestsFIFO_full : in STD_LOGIC;
        MEM_ClearBlockWriteRequestsFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- Debug signals
		DBG_ClearBlock_State : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_LastWrittenClearData : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0')
		);
end ClearBlock;

architecture Behavioral of ClearBlock is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of MEM_ClearBlockWriteRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ClearBlockWriteRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ClearBlockWriteRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL";

type clearBlockState is
(
	waitForCommand, -- 0
	clearLoop -- 1
);

signal clearState : clearBlockState := waitForCommand;
signal nextWriteAddr : unsigned(29 downto 0) := (others => '0');
signal clearColorRGBA : unsigned(31 downto 0) := (others => '0');
signal remainingDRAMLines : unsigned(15 downto 0) := (others => '0');
signal memWriteEnable : STD_LOGIC := '0';

constant writeEnableDWORDs : STD_LOGIC_VECTOR(7 downto 0) := "11111111"; -- Always enable all DWORD's in this DRAM line for writing

pure function SplatCopyColor(clearColorDWORD : std_logic_vector(31 downto 0) ) return std_logic_vector is
begin
	return clearColorDWORD & clearColorDWORD & clearColorDWORD & clearColorDWORD & clearColorDWORD & clearColorDWORD & clearColorDWORD & clearColorDWORD;
end function;

begin

MEM_ClearBlockWriteRequestsFIFO_wr_en <= memWriteEnable;
MEM_ClearBlockWriteRequestsFIFO_wr_data <= std_logic_vector(nextWriteAddr) & SplatCopyColor(std_logic_vector(clearColorRGBA) ) & writeEnableDWORDs;
DBG_ClearBlock_State <= std_logic_vector(to_unsigned(clearBlockState'pos(clearState), 4) );
DBG_LastWrittenClearData <= std_logic_vector(nextWriteAddr) & SplatCopyColor(std_logic_vector(clearColorRGBA) ) & writeEnableDWORDs;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case clearState is
				when waitForCommand =>
					memWriteEnable <= '0';
					if (CMD_ClearBlockBeginSignal = '1') then
						nextWriteAddr <= unsigned(CMD_BaseRenderTargetAddr);
						clearColorRGBA <= unsigned(CMD_ClearColorRGBA);
						remainingDRAMLines <= unsigned(CMD_ClearDRAMLineCount);
						CMD_ClearBlockIsIdle <= '0';
						clearState <= clearLoop;
					else
						CMD_ClearBlockIsIdle <= '1';
					end if;
				when clearLoop =>
					if (remainingDRAMLines /= 0) then
						if (MEM_ClearBlockWriteRequestsFIFO_full = '0') then
							memWriteEnable <= '1';
						else
							memWriteEnable <= '0';
						end if;

						if (MEM_ClearBlockWriteRequestsFIFO_full = '0' and memWriteEnable = '1') then
							remainingDRAMLines <= remainingDRAMLines - 1;
							nextWriteAddr <= nextWriteAddr + 32; -- Advance the memory pointer by 32 bytes (this is 256 bits or 1 DRAM line)
						end if;
					else
						memWriteEnable <= '0';
						clearState <= waitForCommand;
					end if;
			end case;
		end if;
	end process;

end Behavioral;
