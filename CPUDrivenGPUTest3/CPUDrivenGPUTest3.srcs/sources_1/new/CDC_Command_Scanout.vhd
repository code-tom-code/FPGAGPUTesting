library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library xpm;
use xpm.vcomponents.all;

entity CDC_Command_Scanout is
    Port (
	-- Command Processor interface begin
		cmd_clk	: in std_logic;
		CMD_VSync : out STD_LOGIC := '0';
		CMD_RenderTargetBaseAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_ScanEnable : in STD_LOGIC;
		CMD_InvertOutputColor : in STD_LOGIC;
		CMD_OutputColorChannels : in STD_LOGIC_VECTOR(8 downto 0);
	-- Command Processor interface end

	-- Scanout interface begin
		scanout_clk : in std_logic;
		SCANOUT_VSync : in STD_LOGIC;
		SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		SCANOUT_ScanEnable : out STD_LOGIC := '0';
		SCANOUT_InvertOutputColor : out STD_LOGIC := '0';
		SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0')
	-- Scanout interface end
		);
end CDC_Command_Scanout;

architecture Behavioral of CDC_Command_Scanout is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of cmd_clk: SIGNAL is "xilinx.com:signal:clock:1.0 cmd_clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of cmd_clk: SIGNAL is "FREQ_HZ 333250000";

	ATTRIBUTE X_INTERFACE_INFO of scanout_clk: SIGNAL is "xilinx.com:signal:clock:1.0 scanout_clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of scanout_clk: SIGNAL is "FREQ_HZ 251750000";

	type scanoutSendState is record
		RenderTargetBaseAddr : STD_LOGIC_VECTOR(29 downto 0);
		ScanEnable : STD_LOGIC;
		InvertOutputColor : STD_LOGIC;
		OutputColorChannels : STD_LOGIC_VECTOR(8 downto 0);
	end record scanoutSendState;

	constant DefaultScanoutSendState : scanoutSendState := (RenderTargetBaseAddr => (others => '0'), ScanEnable => '0', InvertOutputColor => '0', OutputColorChannels => (others => '0') );

	signal VSync_Signal_Pipeline0 : std_logic := '0';
	signal VSync_Signal_Pipeline1 : std_logic := '0';
	signal VSync_Signal_Pipeline2 : std_logic := '0';

	signal CMD_SendState0 : scanoutSendState := DefaultScanoutSendState;
	signal CMD_SendState1 : scanoutSendState := DefaultScanoutSendState;
	signal CMD_SendState2 : scanoutSendState := DefaultScanoutSendState;

begin
	-- Send our scanout output state across to the scanout clock domain using XPM CDC (Clock Domain Crossing) IP's:
	cdcScanEnableLogic : xpm_cdc_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1 ) port map ( dest_out => SCANOUT_ScanEnable, dest_clk => scanout_clk, src_clk => cmd_clk, src_in => CMD_SendState2.ScanEnable);
	cdcRenderTargetBaseAddrLogicVector : xpm_cdc_array_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1, WIDTH => 30 ) port map ( dest_out => SCANOUT_RenderTargetBaseAddr, dest_clk => scanout_clk, src_clk => cmd_clk, src_in => CMD_SendState2.RenderTargetBaseAddr);
	cdcInvertOutputColorLogic : xpm_cdc_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1 ) port map ( dest_out => SCANOUT_InvertOutputColor, dest_clk => scanout_clk, src_clk => cmd_clk, src_in => CMD_SendState2.InvertOutputColor);
	cdcOutputColorChannelsLogicVector : xpm_cdc_array_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1, WIDTH => 9 ) port map ( dest_out => SCANOUT_OutputColorChannels, dest_clk => scanout_clk, src_clk => cmd_clk, src_in => CMD_SendState2.OutputColorChannels);

	-- Receive our scanout vsync state from the scanout domain to the command processor domain:
	cdcVSyncLogic : xpm_cdc_single generic map ( DEST_SYNC_FF => 4, INIT_SYNC_FF => 0, SIM_ASSERT_CHK => 0, SRC_INPUT_REG => 1 ) port map ( dest_out => VSync_Signal_Pipeline0, dest_clk => cmd_clk, src_clk => scanout_clk, src_in => SCANOUT_VSync);

	process(cmd_clk)
	begin
		if (rising_edge(cmd_clk) ) then
			CMD_VSync <= VSync_Signal_Pipeline2;
			VSync_Signal_Pipeline2 <= VSync_Signal_Pipeline1;
			VSync_Signal_Pipeline1 <= VSync_Signal_Pipeline0;

			CMD_SendState2 <= CMD_SendState1;
			CMD_SendState1 <= CMD_SendState0;
			CMD_SendState0.RenderTargetBaseAddr <= CMD_RenderTargetBaseAddr;
			CMD_SendState0.ScanEnable <= CMD_ScanEnable;
			CMD_SendState0.InvertOutputColor <= CMD_InvertOutputColor;
			CMD_SendState0.OutputColorChannels <= CMD_OutputColorChannels;
		end if;
	end process;

end Behavioral;
