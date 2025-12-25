library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library xpm;
use xpm.vcomponents.all;

entity CDC_MDIOController_EthernetController is
    Port (
	-- EthernetController interface begin
		Out_clk125	: in std_logic;
		Out_Signal : out STD_LOGIC := '0';
	-- EthernetController interface end

	-- MDIO interface begin
		In_clk2_5 : in std_logic;
		In_Signal : in STD_LOGIC
	-- MDIO interface end
		);
end CDC_MDIOController_EthernetController;

architecture Behavioral of CDC_MDIOController_EthernetController is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of Out_clk125: SIGNAL is "xilinx.com:signal:clock:1.0 Out_clk125 CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of Out_clk125: SIGNAL is "FREQ_HZ 125000000";

	ATTRIBUTE X_INTERFACE_INFO of In_clk2_5: SIGNAL is "xilinx.com:signal:clock:1.0 In_clk2_5 CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of In_clk2_5: SIGNAL is "FREQ_HZ 2500000";

	signal Signal_Pipeline0 : std_logic := '0';
	signal Signal_Pipeline1 : std_logic := '0';
	signal Signal_Pipeline2 : std_logic := '0';

begin
	-- Receive our ready state from the MDIO domain to the EthernetController domain:
	cdcVSyncLogic : xpm_cdc_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1 ) port map ( dest_out => Signal_Pipeline0, dest_clk => Out_clk125, src_clk => In_clk2_5, src_in => In_Signal);

	process(Out_clk125)
	begin
		if (rising_edge(Out_clk125) ) then
			Out_Signal <= Signal_Pipeline2;
			Signal_Pipeline2 <= Signal_Pipeline1;
			Signal_Pipeline1 <= Signal_Pipeline0;
		end if;
	end process;

end Behavioral;
