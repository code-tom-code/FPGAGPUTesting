library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library xpm;
use xpm.vcomponents.all;

entity CDC_EthernetController_NetPktProcessor is
    Port (
	-- NetProtoPacketProcessor interface begin
		Out_clk333	: in std_logic;
		Out_Signal : out STD_LOGIC := '0';
	-- NetProtoPacketProcessor interface end

	-- EthernetController interface begin
		In_clk125 : in std_logic;
		In_Signal : in STD_LOGIC
	-- EthernetController interface end
		);
end CDC_EthernetController_NetPktProcessor;

architecture Behavioral of CDC_EthernetController_NetPktProcessor is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of Out_clk333: SIGNAL is "xilinx.com:signal:clock:1.0 Out_clk_333 CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of Out_clk333: SIGNAL is "FREQ_HZ 333250000";

	ATTRIBUTE X_INTERFACE_INFO of In_clk125: SIGNAL is "xilinx.com:signal:clock:1.0 In_clk_125 CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of In_clk125: SIGNAL is "FREQ_HZ 125000000";

	signal Signal_Pipeline0 : std_logic := '0';
	signal Signal_Pipeline1 : std_logic := '0';
	signal Signal_Pipeline2 : std_logic := '0';

begin
	-- Receive our ready state from the EthernetController domain to the NetProtoPacketProcessor domain:
	cdcVSyncLogic : xpm_cdc_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1 ) port map ( dest_out => Signal_Pipeline0, dest_clk => Out_clk333, src_clk => In_clk125, src_in => In_Signal);

	process(Out_clk333)
	begin
		if (rising_edge(Out_clk333) ) then
			Out_Signal <= Signal_Pipeline2;
			Signal_Pipeline2 <= Signal_Pipeline1;
			Signal_Pipeline1 <= Signal_Pipeline0;
		end if;
	end process;

end Behavioral;
