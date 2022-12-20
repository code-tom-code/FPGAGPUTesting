library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity EthernetMDIOController is
	Generic (
		-- Uses the newer (possibly less compatible) Clause 45 packet format. This allows access to
		-- 65535 16-bit registers rather than the original Clause 22 format which only supported 31 registers.
		USE_CLAUSE_45_PACKETS : boolean := false
	);
	Port (
	-- Begin MDIO PHY Interface
	-- 2.5MHz Ethernet MDIO clock:
	-- Although newer chips support higher clock rates, for compatability we're going to stick to the original limit of 2.5MHz for this clock rate.
		clkin25 : in STD_LOGIC;

		mdio_clk : out STD_LOGIC := '0';
		mdio_i : out STD_LOGIC := '0';
		mdio_o : in STD_LOGIC;
		mdio_t : in STD_LOGIC; -- NC?
		mdio_t_ctrl : out STD_LOGIC := '0'; -- '0' means to drive the tri-state line using mdio_o and '1' means to read the line into 'mdio_i'
	-- End MDIO PHY Interface

	-- Packet interface
		registerReadData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		registerReadReady : out STD_LOGIC := '0';
		registerWriteComplete : out STD_LOGIC := '0';

		newRequestPHYAddress : in STD_LOGIC_VECTOR(4 downto 0);
		newRequestDevTypeRegister : in STD_LOGIC_VECTOR(4 downto 0); -- If we are using Clause 22 mode, then this is the register index. If we are in Clause 45 mode, then this is the device type.
		newRequestRegister : in STD_LOGIC_VECTOR(15 downto 0); -- This port is only used for Clause 45 mode.
		newRequestData : in STD_LOGIC_VECTOR(15 downto 0);
		newRequestIsWrite : in STD_LOGIC;
		newRequestStart : in STD_LOGIC;
	-- End packet interface

	-- Debug signals
		DBG_BitsRemaining : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_InProgressRead : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_EthMDIO_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0')
		);
end EthernetMDIOController;

architecture Behavioral of EthernetMDIOController is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clkin25: SIGNAL is "xilinx.com:signal:clock:1.0 clkin25 CLK";
--ATTRIBUTE X_INTERFACE_PARAMETER of clkin25: SIGNAL is "FREQ_HZ 25000000";

ATTRIBUTE X_INTERFACE_INFO of mdio_clk: SIGNAL is "xilinx.com:interface:mdio:1.0 MDIO MDC";
ATTRIBUTE X_INTERFACE_INFO of mdio_i: SIGNAL is "xilinx.com:interface:mdio:1.0 MDIO MDIO_I";
ATTRIBUTE X_INTERFACE_INFO of mdio_o: SIGNAL is "xilinx.com:interface:mdio:1.0 MDIO MDIO_O";
ATTRIBUTE X_INTERFACE_INFO of mdio_t: SIGNAL is "xilinx.com:interface:mdio:1.0 MDIO MDIO_T";
ATTRIBUTE X_INTERFACE_PARAMETER of mdio_clk: SIGNAL is "FREQ_HZ 25000000";

type EthMDIOStateType is
(
	initState, -- 0
	waitForNewRequestState, -- 1
	sendPreambleState, -- 2
	sendStartFieldState, -- 3
	sendOpcodeState, -- 4
	sendPHYAddrState, -- 5
	sendRegAddrState, -- 6
	sendTurnAroundState, -- 7
	sendDataState, -- 8
	recvDataState, -- 9
	finishPacketState -- 10
);

type StartCodes is
(
	start45, -- 00 means "start in Clause 45 mode"
	start22, -- 01 means "start in Clause 22 mode"
	invalidStart2, -- 10 is an invalid start code
	invalidStart3 -- 11 is an invalid start code
);

type OpCodes22 is
(
	opcode22_invalid0, -- 00 is an invalid opcode for Clause 22 mode
	opcode22_writeReg, -- 01 is the "write register" opcode
	opcode22_readReg, -- 10 is the "read register" opcode
	opcode22_invalid3 -- 11 is an invalid opcode for Clause 22 mode
);

type OpCodes45 is
(
	opcode45_setReg, -- 00 is the "set register" opcode for Clause 45 mode
	opcode45_writeReg, -- 01 is the "write register" opcode for Clause 45 mode
	opcode45_readIncReg, -- 10 is the "read and increment register" opcode for Clause 45 mode
	opcode45_readReg -- 11 is the "read register" opcode for Clause 45 mode
);

constant NumPreambleBits : positive := 32;
constant PreambleValue : std_logic := '1';
constant NumStartCodeBits : positive := 2;
constant NumOpCodeBits : positive := 2;
constant NumPHYAddrBits : positive := 5;
constant NumRegAddrBits : positive := 5;
constant NumTurnAroundBits : positive := 2;
constant NumDataBits : positive := 16;

pure function GetStartCodeBits(UseClause45 : boolean) return unsigned is
begin
	if (UseClause45 = true) then
		return to_unsigned(StartCodes'pos(start45), NumStartCodeBits);
	else
		return to_unsigned(StartCodes'pos(start22), NumStartCodeBits);
	end if;
end function;

pure function GetStartCodeBit(UseClause45 : boolean; BitIndex : unsigned(1 downto 0) ) return std_logic is
begin
	return GetStartCodeBits(UseClause45)(to_integer(BitIndex) );
end function;

pure function IsPacketWritingData(UseClause45 : boolean; Clause45SetRegisterMode : std_logic; RequestWriteMode : std_logic) return boolean is
begin
	if (UseClause45) then
		return (Clause45SetRegisterMode = '1') or (RequestWriteMode = '1');
	else
		return (RequestWriteMode = '1');
	end if;
end function;

-- Master state machine signals:
signal currentState : EthMDIOStateType := initState;
signal bitsRemaining : unsigned(5 downto 0) := (others => '0');
signal opcodeValue : unsigned(NumOpCodeBits-1 downto 0) := (others => '0');

-- Note that this register is one bit longer than it actually needs to be. This extra "dummy" bit will be used for
-- simplifying the reading logic later on.
signal readInData : unsigned(NumDataBits downto 0) := (others => '0');

signal clause45SetRegisterMode : std_logic := '0';

begin

mdio_clk <= clkin25;

DBG_EthMDIO_State <= std_logic_vector(to_unsigned(EthMDIOStateType'pos(currentState), 5) );
DBG_InProgressRead <= std_logic_vector(readInData(15 downto 0) );
DBG_BitsRemaining <= std_logic_vector(bitsRemaining);

	mainStateMachine: process(clkin25)
	begin
		if (rising_edge(clkin25) ) then
			case currentState is
				when initState =>
					mdio_i <= not PreambleValue;
					mdio_t_ctrl <= '0';
					currentState <= waitForNewRequestState;

				when waitForNewRequestState =>
					mdio_i <= not PreambleValue;
					mdio_t_ctrl <= '0';
					readInData <= (others => '0');
					registerWriteComplete <= '0';
					registerReadReady <= '0';
					if (newRequestStart = '1') then
						if (USE_CLAUSE_45_PACKETS = true) then
							opcodeValue <= to_unsigned(OpCodes45'pos(opcode45_setReg), NumOpCodeBits);
							clause45SetRegisterMode <= '1';
						else
							clause45SetRegisterMode <= '0';
							if (newRequestIsWrite = '1') then
								opcodeValue <= to_unsigned(OpCodes22'pos(opcode22_writeReg), NumOpCodeBits);
							else
								opcodeValue <= to_unsigned(OpCodes22'pos(opcode22_readReg), NumOpCodeBits);
							end if;
						end if;

						bitsRemaining <= to_unsigned(NumPreambleBits - 1, 6);
						currentState <= sendPreambleState;
					end if;

				when sendPreambleState =>
					mdio_i <= PreambleValue;

					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumStartCodeBits - 1, 6);
						currentState <= sendStartFieldState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendStartFieldState =>
					mdio_i <= GetStartCodeBit(USE_CLAUSE_45_PACKETS, bitsRemaining(1 downto 0) );
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumOpCodeBits - 1, 6);
						currentState <= sendOpcodeState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendOpcodeState =>
					mdio_i <= std_logic(opcodeValue(to_integer(bitsRemaining) ) );
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumPHYAddrBits - 1, 6);
						currentState <= sendPHYAddrState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendPHYAddrState =>
					mdio_i <= newRequestPHYAddress(to_integer(bitsRemaining) );
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumRegAddrBits - 1, 6);
						currentState <= sendRegAddrState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendRegAddrState =>
					mdio_i <= newRequestDevTypeRegister(to_integer(bitsRemaining) );
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumTurnAroundBits - 1, 6);
						if IsPacketWritingData(USE_CLAUSE_45_PACKETS, clause45SetRegisterMode, newRequestIsWrite) then
							opcodeValue <= "10"; -- This is the "write" turn-around value
						else
							opcodeValue <= "00"; -- There isn't really a "read" turn-around value. The MAC is really supposed to put the pin into a tri-state mode as soon as possible.
						end if;
						currentState <= sendTurnAroundState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendTurnAroundState =>
					mdio_i <= std_logic(opcodeValue(to_integer(bitsRemaining) ) );
					if IsPacketWritingData(USE_CLAUSE_45_PACKETS, clause45SetRegisterMode, newRequestIsWrite) then
						mdio_t_ctrl <= '0';
					else
						mdio_t_ctrl <= '1';
					end if;

					if (bitsRemaining = 0) then
						if (newRequestIsWrite = '1') then
							bitsRemaining <= to_unsigned(NumDataBits - 1, 6);
							currentState <= sendDataState;
						else
							-- This is a little bit of a "hack", but because of how VHDL (and Verilog) work, we can only ever read
							-- the current cycle's data, and write the next cycle's data. In this particular case, we need to align
							-- our read to start on the next cycle, so we need to delay the start of the read by +1 cycle and have a
							-- dummy extra bit in our read register. That's also why we're not using NumDataBits - 1 for this case:
							bitsRemaining <= to_unsigned(NumDataBits, 6);
							currentState <= recvDataState;
						end if;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when sendDataState =>
					if (USE_CLAUSE_45_PACKETS = true and clause45SetRegisterMode = '1') then
						mdio_i <= newRequestRegister(to_integer(bitsRemaining) );
					else
						mdio_i <= newRequestData(to_integer(bitsRemaining) );
					end if;
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumDataBits - 1, 6);
						currentState <= finishPacketState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when recvDataState =>
					mdio_i <= '0';
					readInData(to_integer(bitsRemaining) ) <= mdio_o;
					if (bitsRemaining = 0) then
						bitsRemaining <= to_unsigned(NumDataBits - 1, 6);
						currentState <= finishPacketState;
					else
						bitsRemaining <= bitsRemaining - 1;
					end if;

				when finishPacketState =>
					mdio_i <= not PreambleValue;
					if (newRequestIsWrite = '0' and clause45SetRegisterMode = '0') then
						registerReadData <= std_logic_vector(readInData(15 downto 0) );
						registerReadReady <= '1';
					end if;

					if (USE_CLAUSE_45_PACKETS = true and clause45SetRegisterMode = '1') then
						clause45SetRegisterMode <= '0';
						if (newRequestIsWrite = '1') then
							opcodeValue <= to_unsigned(OpCodes45'pos(opcode45_writeReg), NumOpCodeBits);
						else
							opcodeValue <= to_unsigned(OpCodes45'pos(opcode45_readReg), NumOpCodeBits);
						end if;
						bitsRemaining <= to_unsigned(NumPreambleBits - 1, 6);
						currentState <= sendPreambleState;
					else
						currentState <= waitForNewRequestState;
						registerWriteComplete <= '1';
					end if;

			end case;
		end if;
	end process mainStateMachine;

end Behavioral;
