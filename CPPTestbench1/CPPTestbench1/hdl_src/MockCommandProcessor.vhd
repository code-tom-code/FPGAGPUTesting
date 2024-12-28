library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet types library so we can access all of the shared enums and struct definitions in there
library work;
use work.PacketType.all;

entity MockCommandProcessor is
	Generic (
		NET_PROTOCOL_MAJOR_VERSION : natural range 0 to 255 := 1;
		NET_PROTOCOL_MINOR_VERSION : natural range 0 to 255 := 0;

		SEND_PKT_DATA_CAPACITY_DWORDS : positive range 16 to 131072 := 2048
	);
	Port (
	-- 333.25MHz Main clock domain interfaces:
		clk333_250 : in STD_LOGIC;

	-- Command Processor FIFO's
		-- Valid packets FIFO inputs to the Command Processor from the host:
        validPacketsFIFO_rd_data : in STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
        validPacketsFIFO_empty : in STD_LOGIC;
        validPacketsFIFO_rd_en : out STD_LOGIC := '0';

		-- Return packet FIFO outputs from the Command Processor to the host:
		returnPacketsFIFO_full : in STD_LOGIC;
		returnPacketsFIFO_wr_data : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
		returnPacketsFIFO_wr_en : out STD_LOGIC := '0'
	-- End Command Processor FIFO's
		);
end MockCommandProcessor;

architecture Behavioral of MockCommandProcessor is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE FSM_ENCODING : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk333_250: SIGNAL is "xilinx.com:signal:clock:1.0 clk333_250 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk333_250: SIGNAL is "FREQ_HZ 333333333"; -- Remember to change this back when we use a real 333.250MHz clock in the actual design

ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO EMPTY";

ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO FULL";

begin

	mainStateMachine: process(clk333_250)
	begin
		if (rising_edge(clk333_250) ) then
			validPacketsFIFO_rd_en <= '0';
			if (validPacketsFIFO_empty = '0') then
				validPacketsFIFO_rd_en <= '1';
			end if;
		end if;
	end process mainStateMachine;

end Behavioral;
