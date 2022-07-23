-- 10-bit BRAM for cache space (4KBytes, 1024 DWORD's, 128 DRAM lines)
-- 32 cache sets of 4 cache entries each = 128 cache entries
-- 
-- VertexStreamCache takes a 22-bit DWORD address
-- D = Index in DRAM line
-- S = Bits used for finding the cache set (5 bits = 32 cache sets)
-- X = Read line index (cache key address)
-- XXXXXXXXXXXXXXSSSSSDDD


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity VertexStreamCacheTestDriver is
    Port (clk : in STD_LOGIC;	

	-- Vertex Shader Core interfaces begin
		VSC_ReadEnable : out STD_LOGIC := '0'; -- Note: ReadEnable *must* be kept held high until ReadReady is '1'. You cannot pulse this for a single cycle.
		VSC_ReadStreamIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		VSC_ReadDWORDAddr : out STD_LOGIC_VECTOR(21 downto 0) := (others => '0');
		VSC_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		VSC_ReadReady : in STD_LOGIC;

		VSC_SetStreamVBAddress : out STD_LOGIC := '0';
		VSC_StreamIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		VSC_StreamVBAddress : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');

		VSC_InvalidateCache : out STD_LOGIC := '0';
	-- Vertex Shader Core interfaces end

	-- Other interfaces begin
		clk_locked : in STD_LOGIC;
		beginTestSignal : in STD_LOGIC;
	-- Other interfaces end

	-- Memory controller interfaces begin
		VSCReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR(30-1 downto 0);
        VSCReadRequestsFIFO_empty : in STD_LOGIC;
        VSCReadRequestsFIFO_rd_en : out STD_LOGIC := '0';

		VSCReadResponsesFIFO_full : in STD_LOGIC;
		VSCReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR(30+256-1 downto 0) := (others => '0');
		VSCReadResponsesFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory controller interfaces end

	-- Debug interfaces begin
		DBG_DriverCurrentState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_InstructionPointer : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
		DBG_CurrentInstruction : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0')
	-- Debug interfaces end
		);
end VertexStreamCacheTestDriver;

architecture Behavioral of VertexStreamCacheTestDriver is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests RD_EN";
ATTRIBUTE X_INTERFACE_INFO of VSCReadRequestsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VBCacheReadRequests EMPTY";

ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VSCReadResponsesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VBCacheReadResponses FULL";

constant instructionDataBaseAddress : unsigned(29 downto 0) := to_unsigned(320, 30);
type InstructionDataArrayType is array(0 to 20) of unsigned(255 downto 0);
constant instructionData : InstructionDataArrayType := (
X"0000060284009803000004028400900300000202840088030000000284008003",
X"0000060080009843000004008000904300000200800088430000000080008043",
X"000006000C019802000004000801900200000200040188020000000000018002",
X"0000060488009843000004048800904300000204880088430000000488008043",
X"000006000C019802000004000801900200000200040188020000000000018002",
X"000006068C001882000004068800108200000206840008820000000680000082",
X"00000008800880430000040A840890030000020A840888030000000A84088003",
X"0000020004018802000000000001800200000408800890430000020880088843",
X"0000040C880890430000020C880888430000000C880880430000040008019002",
X"0000001090000043000004000801900200000200040188020000000000018002",
X"00000400C001800200000200C001804200000410980010430000021094000843",
X"000000064005800300000001400001410000020E800000040000000E80000005",
X"0000000140254101000006064005980300000406400590030000020640058803",
X"0000000200000183000000014C25590100000001482551010000000144254901",
X"0000000140048281000006020C00198300000402080011830000020204000983",
X"00000602C802108300000602C0020083000000014C0219460000000144048A81",
X"00000414880210830000021484022883000000148002008300000602C4020883",
X"00000001400A0291000006148802108200000214840208820000001480020082",
X"00000001480611920000000144060992000000014006019200000001440A0A91",
X"00000001400280C000000001440208900000000140020090000000014C061992",
X"0000000000000000000000000000000000000001400280DF00000001400280C0");

type eTestDriverState is
(
	initState, -- 0

	readyState, -- 1

	configureState, -- 2

	loadProgramStateLoopLow, -- 3
	loadProgramStateLoopLowWaitForData, -- 4
	loadProgramStateLoopHigh, -- 5
	loadProgramStateLoopHighWaitForData, -- 6
	loadProgramStateCleanup -- 7
);

type eTestDriverMemoryState is
(
	waitForRequestState, -- 0
	cooldownState -- 1
);

signal currentState : eTestDriverState := initState;
signal currentMemoryState : eTestDriverMemoryState := waitForRequestState;
signal loadProgramCurrentDWORD : unsigned(21 downto 0) := (others => '0');
signal loadProgramLen : unsigned(9 downto 0) := to_unsigned(82, 10);
signal loadProgramDWORDLow : unsigned(31 downto 0) := (others => '0');

pure function GetInstructionFromDRAMLine(DRAMLine : unsigned(255 downto 0); instructionAddrDWORD : unsigned(21 downto 0) ) return unsigned is
begin
	case instructionAddrDWORD(2 downto 1) is
		when "00" =>
			return DRAMLine(64*1-1 downto 64*0);
		when "01" =>
			return DRAMLine(64*2-1 downto 64*1);
		when "10" =>
			return DRAMLine(64*3-1 downto 64*2);
		when others =>
			return DRAMLine(64*4-1 downto 64*3);
	end case;
end function;

begin

DBG_DriverCurrentState <= std_logic_vector(to_unsigned(eTestDriverState'pos(currentState), 4) );

-- Memory process
process(clk)
	variable instructionReadAddress : unsigned(29 downto 0);
	variable shiftedInstructionDRAMLine : unsigned(29 downto 0);
	variable shiftedInstructionDRAMLineInt : integer;
	variable readInstructionData : unsigned(255 downto 0);
begin
	if (rising_edge(clk) ) then
		case currentMemoryState is
			when waitForRequestState =>
				if (VSCReadRequestsFIFO_empty = '0' and VSCReadResponsesFIFO_full = '0') then
					instructionReadAddress := unsigned(VSCReadRequestsFIFO_rd_data) - instructionDataBaseAddress;
					shiftedInstructionDRAMLine := instructionReadAddress srl 5;
					shiftedInstructionDRAMLineInt := to_integer(shiftedInstructionDRAMLine);
					readInstructionData := instructionData(shiftedInstructionDRAMLineInt);
					VSCReadResponsesFIFO_wr_data <= VSCReadRequestsFIFO_rd_data & std_logic_vector(readInstructionData);
					VSCReadResponsesFIFO_wr_en <= '1';
					VSCReadRequestsFIFO_rd_en <= '1';
					currentMemoryState <= cooldownState;
				else
					VSCReadResponsesFIFO_wr_en <= '0';
					VSCReadRequestsFIFO_rd_en <= '0';
				end if;

			when cooldownState =>
				VSCReadResponsesFIFO_wr_en <= '0';
				VSCReadRequestsFIFO_rd_en <= '0';
				currentMemoryState <= waitForRequestState;

			when others =>
		end case;
	end if;
end process;

-- Main driver process
process(clk)
	variable actualInstructionMemory : unsigned(63 downto 0);
	variable VSCCompareInstructionMemory : unsigned(63 downto 0);
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				if (clk_locked = '1') then
					currentState <= readyState;
				end if;

			when readyState =>
				if (beginTestSignal = '1') then
					VSC_InvalidateCache <= '1';
					VSC_ReadEnable <= '0';
					VSC_ReadStreamIndex <= (others => '0');
					VSC_SetStreamVBAddress <= '0';
					currentState <= configureState;
				end if;

			when configureState =>
				VSC_InvalidateCache <= '0';
				VSC_SetStreamVBAddress <= '1';
				VSC_StreamIndex <= (others => '0');
				VSC_StreamVBAddress <= std_logic_vector(instructionDataBaseAddress);
				loadProgramCurrentDWORD <= (others => '0');

				currentState <= loadProgramStateLoopLow;				

			when loadProgramStateLoopLow =>
				VSC_SetStreamVBAddress <= '0';
				if (VSC_ReadReady = '0') then
					if (loadProgramLen = 0) then
						currentState <= loadProgramStateCleanup;
					else
						VSC_ReadDWORDAddr <= std_logic_vector(loadProgramCurrentDWORD);
						VSC_ReadEnable <= '1';
						currentState <= loadProgramStateLoopLowWaitForData;
					end if;
				end if;

			when loadProgramStateLoopLowWaitForData =>
				if (VSC_ReadReady = '1') then
					VSC_ReadEnable <= '0';
					loadProgramDWORDLow <= unsigned(VSC_ReadData);
					loadProgramCurrentDWORD <= loadProgramCurrentDWORD + 1;
					currentState <= loadProgramStateLoopHigh;
				end if;

			when loadProgramStateLoopHigh =>
				if (VSC_ReadReady = '0') then
					VSC_ReadDWORDAddr <= std_logic_vector(loadProgramCurrentDWORD);
					VSC_ReadEnable <= '1';
					currentState <= loadProgramStateLoopHighWaitForData;
				end if;

			when loadProgramStateLoopHighWaitForData =>
				if (VSC_ReadReady = '1') then
					actualInstructionMemory := GetInstructionFromDRAMLine(instructionData(to_integer(loadProgramCurrentDWORD srl 3) ), loadProgramCurrentDWORD);
					VSCCompareInstructionMemory := unsigned(VSC_ReadData) & loadProgramDWORDLow;
					assert actualInstructionMemory = VSCCompareInstructionMemory;
					VSC_ReadEnable <= '0';
					DBG_InstructionPointer <= std_logic_vector(loadProgramCurrentDWORD(9 downto 1) );
					DBG_CurrentInstruction <= VSC_ReadData & std_logic_vector(loadProgramDWORDLow); -- Concat low and high DWORD's together
					loadProgramCurrentDWORD <= loadProgramCurrentDWORD + 1;
					loadProgramLen <= loadProgramLen - 1;
					currentState <= loadProgramStateLoopLow;
				end if;

			when loadProgramStateCleanup =>
				VSC_ReadEnable <= '0';
				currentState <= readyState;

			when others =>
		end case;
	end if;
end process;

end Behavioral;
