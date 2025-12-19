library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


-- Documentation for this block come from Xilinx article #000026641: 69494 - VCU118 / KCU116 - How to bring up the SGMII PHY
-- https://support.xilinx.com/s/article/69494?language=en_US
-- This is for configuring the TI DP83867ISRGZ chip that comes with the KCU116 dev board.

entity SGMII_PHY_Bringup_MDIO is
	Generic (
		-- What is the PHY address that we are talking to?
		-- For the KCU116 board, the PHY address is 3. The KCU116 board guide says "The U12 Ethernet PHY address is 11000" but it neglects to mention that this binary value is in LSB-first bit order.
		PHY_Address : natural := 3;


		-- Address of the PCS/PMA on the MDIO bus:
		PCS_Address : natural := 1
	);
	Port (
	-- 2.5MHz Ethernet MDIO clock:
	-- Although newer chips support higher clock rates, for compatability we're going to stick to the original limit of 2.5MHz for this clock rate.
		clkin25 : in STD_LOGIC;

		-- Debug reset
		dbgRst : in STD_LOGIC;

	-- Packet interface
		registerReadData : in STD_LOGIC_VECTOR(15 downto 0);
		registerReadReady : in STD_LOGIC;
		registerWriteComplete : in STD_LOGIC;

		newRequestPHYAddress : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		newRequestDevTypeRegister : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0'); -- If we are using Clause 22 mode, then this is the register index. If we are in Clause 45 mode, then this is the device type.
		newRequestRegister : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- This port is only used for Clause 45 mode.
		newRequestData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		newRequestIsWrite : out STD_LOGIC := '0';
		newRequestStart : out STD_LOGIC := '0';
	-- End packet interface

	-- Interface to Ethernet controller
		phyBringupComplete : out STD_LOGIC := '0';
	-- End Ethernet controller interface

	-- Debug signals
		DBG_RegReadIndex : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_RegReadData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		DBG_RegPCSPMAReadIndex : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_RegPCSPMAReadData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		DBG_Bringup_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0')
		);
end SGMII_PHY_Bringup_MDIO;

architecture Behavioral of SGMII_PHY_Bringup_MDIO is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clkin25: SIGNAL is "xilinx.com:signal:clock:1.0 clkin25 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clkin25: SIGNAL is "FREQ_HZ 2500000";

type EthBringupStateType is
(
	initState, -- 0
	SGMII_clock_enable, -- 1
	writeExtendedRegister_REGCRSetAddr, -- 2
	writeExtendedRegister_ADDARSetAddr, -- 3
	writeExtendedRegister_REGCRWriteMode, -- 4
	writeExtendedRegister_ADDARWriteData, -- 5
	writeExtendedRegister_WaitForWriteComplete, -- 6
	configBMCR, -- 7
	configCFG2, -- 8
	disableRGMII, -- 9
	disableIntTestMode1, -- 10
	disableForceLinkGood, -- 11
	waitForLinkBringup, -- 12
	doneState -- 13
);

-- Master state machine signals:
signal currentState : EthBringupStateType := initState;
signal writeExtendedRegisterAddr : unsigned(15 downto 0) := (others => '0');
signal writeExtendedRegisterData : unsigned(15 downto 0) := (others => '0');
signal writeExtendedRegisterNextState : EthBringupStateType := initState;
signal waitFinishNextState : EthBringupStateType := initState;

type registersArrayT is array(31 downto 0) of unsigned(15 downto 0);
signal specRegisters : registersArrayT := (others => (others => '0') );
signal specRegistersPCSPMA : registersArrayT := (others => (others => '0') );
signal currentReadRegister : unsigned(4 downto 0) := (others => '0');
signal debugReadRegister : unsigned(4 downto 0) := (others => '0');
signal debugReadRegisterPCSPMA : unsigned(4 downto 0) := (others => '0');

	procedure WriteExtendedRegisterProc(signal newRegisterAddr : out unsigned(15 downto 0);
										signal newRegisterData : out unsigned(15 downto 0);
										signal newNextState : out EthBringupStateType;
										constant extRegisterAddr : in unsigned(15 downto 0);
										constant extRegisterData : in unsigned(15 downto 0);
										signal currState : out EthBringupStateType;
										constant nextState : in EthBringupStateType) is
	begin
		newRegisterAddr <= extRegisterAddr;
		newRegisterData <= extRegisterData;
		newNextState <= nextState;
		currState <= writeExtendedRegister_REGCRSetAddr;
	end procedure;

begin

DBG_Bringup_State <= std_logic_vector(to_unsigned(EthBringupStateType'pos(currentState), 5) );
DBG_RegReadIndex <= std_logic_vector(debugReadRegister);
DBG_RegReadData <= std_logic_vector(specRegisters(to_integer(debugReadRegister) ) );
DBG_RegPCSPMAReadIndex <= std_logic_vector(debugReadRegisterPCSPMA);
DBG_RegPCSPMAReadData <= std_logic_vector(specRegisters(to_integer(debugReadRegisterPCSPMA) ) );

	mainStateMachine: process(clkin25)
	begin
		if (rising_edge(clkin25) ) then
			if (dbgRst = '1') then
				currentState <= initState;
			else
				case currentState is
					when initState =>
						newRequestPHYAddress <= STD_LOGIC_VECTOR(to_unsigned(PHY_Address, 5) );
						newRequestDevTypeRegister <= (others => '0');
						newRequestData <= (others => '0');
						writeExtendedRegisterAddr <= (others => '0');
						writeExtendedRegisterData <= (others => '0');
						writeExtendedRegisterNextState <= initState;
						waitFinishNextState <= initState;
						newRequestIsWrite <= '0';
						newRequestStart <= '0';
						phyBringupComplete <= '0';
						currentState <= SGMII_clock_enable;

						-- Enable the SGMII clock:
					when SGMII_clock_enable =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "The SGMII clock needs to be enabled, by writing 0x4000 to register 0xD3."
						WriteExtendedRegisterProc(writeExtendedRegisterAddr, writeExtendedRegisterData, writeExtendedRegisterNextState, X"00D3", X"4000", currentState, configBMCR);

					when writeExtendedRegister_REGCRSetAddr =>
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#000D#, 5) );
						newRequestData <= X"001F";
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= writeExtendedRegister_ADDARSetAddr;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

					when writeExtendedRegister_WaitForWriteComplete =>
						newRequestStart <= '0';
						if (registerWriteComplete = '1') then
							currentState <= waitFinishNextState;
						end if;

					when writeExtendedRegister_ADDARSetAddr =>
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#000E#, 5) );
						newRequestData <= std_logic_vector(writeExtendedRegisterAddr);
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= writeExtendedRegister_REGCRWriteMode;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

					when writeExtendedRegister_REGCRWriteMode =>
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#000D#, 5) );
						newRequestData <= X"401F";
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= writeExtendedRegister_ADDARWriteData;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

					when writeExtendedRegister_ADDARWriteData =>
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#000E#, 5) );
						newRequestData <= std_logic_vector(writeExtendedRegisterData);
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= writeExtendedRegisterNextState;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

						-- Configure the BMCR ("Basic Mode Control Register") register:
					when configBMCR =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "In the Control Register (Register 0), Enable Auto-negotiation and configure link speed and duplex settings."
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#0000#, 5) );

						-- Comment out one of these two lines to either enable or disable loopback testing mode:
						--newRequestData <= X"5340"; Enable MII loopback mode for testing purposes
						newRequestData <= X"1340"; -- No-loopback mode

						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= configCFG2;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

						-- Configure the CFG2 register:
					when configCFG2 =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "In the Configuration Register 2 (CFG2), Address 0x0014, Configure interrupt polarity, enable auto negotiation, Enable Speed Optimization."
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#0014#, 5) );
						newRequestData <= X"2BC7";
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= disableRGMII;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

						-- Disable RGMII because we're going to be using SGMII instead:
					when disableRGMII =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "RGMII must be disabled, by writing 0cx0 to register 0x32."
						WriteExtendedRegisterProc(writeExtendedRegisterAddr, writeExtendedRegisterData, writeExtendedRegisterNextState, X"0032", X"0050", currentState, disableIntTestMode1);

						-- Disable "Internal Test Mode 1":
					when disableIntTestMode1 =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "In Register 31, clear Bit 7 and set Bit 8 and bits [6:5]"
						WriteExtendedRegisterProc(writeExtendedRegisterAddr, writeExtendedRegisterData, writeExtendedRegisterNextState, X"0031", X"0170", currentState, disableForceLinkGood);

					when disableForceLinkGood =>
						-- This wasn't mentioned in the Xilinx bring-up article, but for some reason I'm seeing the register 0x0010 "FORCE_LINK_GOOD" bit asserted even though I never set it.
						-- So this is just to disable that bit, since it seems that the bit might be causing problems with autonegotiation according to this: https://e2e.ti.com/support/interface-group/interface/f/interface-forum/914583/dp83867cr-force-link-good-bit-was-asserted-why
						newRequestDevTypeRegister <= std_logic_vector(to_unsigned(16#0010#, 5) );
						newRequestData <= X"5848";
						newRequestIsWrite <= '1';
						newRequestStart <= '1';
						waitFinishNextState <= waitForLinkBringup;
						currentState <= writeExtendedRegister_WaitForWriteComplete;

					when waitForLinkBringup =>
						-- Xilinx's KCU116/VCU118 SGMII bring-up article says: "Then wait for Link up by reading the link partner ability register (Register 5) poll for bit 14 to be set."
						newRequestDevTypeRegister <= std_logic_vector(currentReadRegister);
						newRequestData <= (others => '0');
						newRequestIsWrite <= '0';
						newRequestStart <= '1';
						debugReadRegister <= debugReadRegister + 1;
						debugReadRegisterPCSPMA <= debugReadRegisterPCSPMA + 1;
						if (registerReadReady = '1') then
							specRegisters(to_integer(currentReadRegister) ) <= unsigned(registerReadData);
							currentReadRegister <= currentReadRegister + 1;
							newRequestDevTypeRegister <= std_logic_vector(currentReadRegister + 1);
							if (currentReadRegister = 31 and specRegisters(5)(14) = '1') then
								currentState <= doneState;
							end if;
						end if;

					when doneState =>
						newRequestPHYAddress <= STD_LOGIC_VECTOR(to_unsigned(PCS_Address, 5) );
						phyBringupComplete <= '1';
						debugReadRegister <= debugReadRegister + 1;
						debugReadRegisterPCSPMA <= debugReadRegisterPCSPMA + 1;
						newRequestIsWrite <= '0';
						newRequestStart <= '0';
						-- We're done!

						if (registerReadReady = '1') then
							specRegistersPCSPMA(to_integer(currentReadRegister) ) <= unsigned(registerReadData);
							currentReadRegister <= currentReadRegister + 1;
							newRequestDevTypeRegister <= std_logic_vector(currentReadRegister + 1);
						end if;
				
				end case;
			end if;
		end if;
	end process mainStateMachine;

end Behavioral;
