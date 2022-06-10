library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eShaderCMDPacket enum type defined in there
library work;
use work.PacketType.all;

entity TestShaderCoreDriver is
    Port (clk : in STD_LOGIC;

		-- External signals so that our IP doesn't get all optimized away:
		EXT_Cmd : in STD_LOGIC_VECTOR(7 downto 0);
		EXT_Cmd_Out : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		
		-- Command processor signals:
		CMD_IsReadyForCommand : in STD_LOGIC;
		CMD_InCommand : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- 000 = do nothing; 010 = LoadProgram; 001 = SetConstant; 011 = SetVertexStream; 100 = BeginShading
		CMD_LoadProgramAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		CMD_LoadProgramLen : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- The length of the instruction stream for this shader, in instruction tokens (QWORD's in this case)
		CMD_SetConstantIndex : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		CMD_SetConstantData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		CMD_SetNumVertexStreams : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		CMD_SetVertexStreamID : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		CMD_SetVertexStreamDWORDCount : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		CMD_SetVertexStreamIsD3DCOLOR : out STD_LOGIC := '0';
		CMD_SetVertexStreamShaderRegIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		CMD_SetVertexStreamDWORDStride : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0'); -- Number of DWORD's between consecutive vertex stream elements (may be 0)
		CMD_SetVertexStreamDWORDOffset : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0'); -- Number of DWORD's offset from the start of the vertex to this element

		-- Vertex Batch Builder (VBB) signals:
		VBB_Done : out STD_LOGIC := '0'; -- Set to 1 when there's no more pending work to push into the FIFO. Shading is complete when this is 1 and VERTBATCH_FIFO_empty is 1 at the same time.
		VERTBATCH_FIFO_wr_data : out STD_LOGIC_VECTOR(287 downto 0) := (others => '0');
		VERTBATCH_FIFO_wr_en : out STD_LOGIC := '0';
		VERTBATCH_FIFO_full : in STD_LOGIC;

		-- Vertex Batch Output (VBO) signals:
		VBO_Pushed : in STD_LOGIC; -- Set to 1 when we've completed pushing our next fully shaded batch of output verts
		VBO_BatchStartingIndex : in STD_LOGIC_VECTOR(15 downto 0);
		VBO_BatchEndingIndex : in STD_LOGIC_VECTOR(15 downto 0);
		VBO_Ready : out STD_LOGIC := '0';
		VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(127 downto 0);
		VERTOUT_FIFO_rd_en : out STD_LOGIC := '0';
		VERTOUT_FIFO_empty : in STD_LOGIC;

		-- DRAM FIFO signals:
		DRAM_ReadRequests_rd_data : in STD_LOGIC_VECTOR(29 downto 0);
		DRAM_ReadRequests_rd_en : out STD_LOGIC := '0';
		DRAM_ReadRequests_empty : in STD_LOGIC;

		DRAM_ReadResponses_wr_data : out STD_LOGIC_VECTOR(285 downto 0) := (others => '0');
		DRAM_ReadResponses_wr_en : out STD_LOGIC := '0';
		DRAM_ReadResponses_full : in STD_LOGIC
		);
end TestShaderCoreDriver;

architecture Behavioral of TestShaderCoreDriver is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTBATCH_InputFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTBATCH_InputFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTBATCH_InputFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO EMPTY";

ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadRequests_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DRAM_ReadRequests RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadRequests_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DRAM_ReadRequests RD_EN";
ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadRequests_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DRAM_ReadRequests EMPTY";

ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadResponses_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DRAM_ReadResponses WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadResponses_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DRAM_ReadResponses WR_EN";
ATTRIBUTE X_INTERFACE_INFO of DRAM_ReadResponses_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DRAM_ReadResponses FULL";

type eTestDriverState is
(
	initState, -- 0

	readyState, -- 1

	setConstant0, -- 2
	setConstant1, -- 3
	setConstant2, -- 4
	setConstant3, -- 5

	setVertexStream0, -- 6
	setVertexStream1, -- 7
	setVertexStream2, -- 8
	setVertexStream3, -- 9

	fillVertexBatches0, -- 10
	fillVertexBatches1, -- 11
	waitForShadingComplete, -- 12
	verifyResults0, -- 13
	verifyResults1, -- 14
	verifyResults2, -- 15
	verifyResults3, -- 16
	verifyResults4, -- 17
	verifyResults5, -- 18
	verifyResults6, -- 19
	verifyResults7 -- 20
);

type eTestDRAMState is
(
	DRAM_InitState, -- 0

	DRAM_ReadyState -- 1
);

type InstructionDataArrayType is array(20 downto 0) of unsigned(255 downto 0);
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
X"00000414880210830000021484020883000000148002008300000602C4022883",
X"00000001400A0291000006148802108200000214840208820000001480020082",
X"00000001480611920000000144060992000000014006019200000001440A0A91",
X"00000001400280C000000001440208900000000140020090000000014C061992",
X"0000000000000000000000000000000000000001400280DF00000001400280C0"
);

type VertexDataArrayType is array(40 downto 0) of unsigned(255 downto 0);
constant vertexStreamData : VertexDataArrayType := (
X"0000000000000000BF8000000000000000000000BF800000BF800000BF800000",
X"00000000BF80000000000000000000003F800000BF800000BF800000FF000000",
X"BF8000003F800000000000003F8000003F800000BF800000FF0000FF00000000",
X"3F8000003F800000BF8000003F8000003F800000FF00FFFF0000000000000000",
X"00000000BF800000BF800000BF800000FFFFFF00BF8000000000000000000000",
X"BF8000003F800000BF800000FF000000BF800000000000000000000000000000",
X"BF8000003F800000FF00FF00BF80000000000000000000003F80000000000000",
X"BF800000FFFF00FF00000000BF80000000000000000000003F8000003F800000",
X"FF00000000000000BF800000000000000000000000000000BF800000BF800000",
X"00000000BF80000000000000000000003F800000BF800000BF8000003F800000",
X"00000000000000003F8000003F800000BF8000003F8000003F800000FFFF0000",
X"00000000000000003F800000BF800000BF8000003F800000FFFFFF00BF800000",
X"0000000000000000BF800000BF800000BF800000FFFF0000BF80000000000000",
X"00000000BF800000BF800000BF800000FF000000BF8000000000000000000000",
X"3F8000003F800000BF800000FF0000000000000000000000BF80000000000000",
X"3F800000BF800000FF00FFFF0000000000000000BF8000003F80000000000000",
X"3F800000FF00FF000000000000000000BF8000003F80000000000000BF800000",
X"FFFF00FF00000000BF80000000000000000000003F8000003F800000BF800000",
X"00000000BF8000000000000000000000000000003F800000BF800000BF800000",
X"BF800000000000000000000000000000BF800000BF800000BF800000FF0000FF",
X"000000003F800000000000003F8000003F800000BF800000FF00000000000000",
X"00000000000000003F800000BF800000BF800000FF00FFFF3F80000000000000",
X"3F8000003F800000BF8000003F800000FF0000FF3F8000000000000000000000",
X"3F8000003F8000003F800000FFFF00FF3F800000000000000000000000000000",
X"BF8000003F800000FFFFFFFF00000000000000003F8000003F8000003F800000",
X"3F800000FFFF000000000000000000003F800000000000003F800000BF800000",
X"FFFFFF0000000000000000003F8000003F8000003F800000BF8000003F800000",
X"00000000000000003F800000000000003F800000BF800000BF8000003F800000",
X"000000003F8000003F8000003F8000003F8000003F8000003F800000FFFF0000",
X"3F800000000000003F8000003F800000BF8000003F800000FFFFFFFF00000000",
X"3F8000003F8000003F8000003F8000003F800000FFFF00FF0000000000000000",
X"3F800000BF8000003F8000003F800000FFFFFFFF000000003F80000000000000",
X"BF8000003F800000BF800000FFFFFF00000000003F800000000000003F800000",
X"3F8000003F800000FF00FF00000000003F800000000000003F80000000000000",
X"BF800000FFFFFFFF000000003F800000000000003F8000003F8000003F800000",
X"FF00FF00000000003F800000000000003F80000000000000BF8000003F800000",
X"000000003F800000000000003F800000000000003F8000003F800000BF800000",
X"00000000000000003F8000003F8000003F8000003F8000003F800000FF00FFFF",
X"000000003F800000000000003F8000003F800000BF800000FFFFFFFF3F800000",
X"000000003F8000003F800000BF8000003F800000FF00FFFF3F80000000000000",
X"3E2CC1AD3E2CC6193DCB4835BF3C492EFFFF00FF3F8000000000000000000000"
);

-- The current state of the shader core test driver
signal currentState : eTestDriverState := initState;
signal currentDRAMState : eTestDRAMState := DRAM_InitState;

signal EXTRegisterA0 : STD_LOGIC := '0';
signal EXTRegisterA1 : STD_LOGIC := '0';
signal EXTRegisterA2 : STD_LOGIC := '0';
signal EXTRegisterA3 : STD_LOGIC := '0';
signal EXTRegisterB0 : STD_LOGIC := '0';
signal EXTRegisterB1 : STD_LOGIC := '0';
signal EXTRegisterB2 : STD_LOGIC := '0';
signal EXTRegisterB3 : STD_LOGIC := '0';
signal BatchStartingIndex0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal BatchStartingIndex1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal BatchStartingIndex2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal BatchEndingIndex0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal BatchEndingIndex1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal BatchEndingIndex2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal VertOutData0 : STD_LOGIC_VECTOR(127 downto 0);
signal VertOutData1 : STD_LOGIC_VECTOR(127 downto 0);
signal VertOutData2 : STD_LOGIC_VECTOR(127 downto 0);
signal XORSums : unsigned(7 downto 0) := (others => '0');

begin

VBO_Ready <= '1'; -- VBO is always ready to receive new output transformed vertex batches

-- Main state machine process:
process(clk)
	variable xorSum : std_logic;
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				CMD_InCommand <= (others => '0');
				CMD_LoadProgramLen <= (others => '0');
				CMD_SetConstantIndex <= (others => '0');
				CMD_SetConstantData <= (others => '0');
				VERTBATCH_FIFO_wr_en <= '0';
				currentState <= readyState;

			when readyState =>
				CMD_InCommand <= "000";
				CMD_SetConstantIndex <= (others => '0');
				CMD_SetConstantData <= (others => '0');
				CMD_SetNumVertexStreams <= (others => '0');
				CMD_SetVertexStreamID <= (others => '0');
				CMD_SetVertexStreamDWORDCount <= (others => '0');
				CMD_SetVertexStreamIsD3DCOLOR <= '0';
				CMD_SetVertexStreamShaderRegIndex <= (others => '0');
				CMD_SetVertexStreamDWORDStride <= (others => '0');
				CMD_SetVertexStreamDWORDOffset <= (others => '0');
				VERTOUT_FIFO_rd_en <= '0';

				if (EXT_Cmd = "00000001" and CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "010"; -- LoadProgram
					CMD_LoadProgramAddr <= (others => '0');
					CMD_LoadProgramLen <= std_logic_vector(to_unsigned(82, 16) );
				elsif (EXT_Cmd = "00000010" and CMD_IsReadyForCommand = '1') then
					currentState <= setConstant0;
				elsif (EXT_Cmd = "00000011" and CMD_IsReadyForCommand = '1') then
					currentState <= setVertexStream0;
				elsif (EXT_Cmd = "00000100" and CMD_IsReadyForCommand = '1') then
					currentState <= fillVertexBatches0;
				end if;

			when setConstant0 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "001"; -- SetConstant
					CMD_SetConstantIndex <= std_logic_vector(to_unsigned(0, 8) );
					CMD_SetConstantData <= X"3e2cc1ad3e2cc6193dcb4835bf3c492e";
					currentState <= setConstant1;
				end if;

			when setConstant1 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "001"; -- SetConstant
					CMD_SetConstantIndex <= std_logic_vector(to_unsigned(1, 8) );
					CMD_SetConstantData <= X"bf01d0d1bf01d4243f5ca4eb00000000";
					currentState <= setConstant2;
				end if;

			when setConstant2 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "001"; -- SetConstant
					CMD_SetConstantIndex <= std_logic_vector(to_unsigned(2, 8) );
					CMD_SetConstantData <= X"3f5860433f5865cd3efe9be33e165440";
					currentState <= setConstant3;
				end if;

			when setConstant3 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "001"; -- SetConstant
					CMD_SetConstantIndex <= std_logic_vector(to_unsigned(3, 8) );
					CMD_SetConstantData <= X"402d166c4026b44bbf3ab2ee3e969e00";
					currentState <= readyState;
				end if;

			when setVertexStream0 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "011"; -- SetVertexStream
					CMD_SetNumVertexStreams <= std_logic_vector(to_unsigned(4, 3) );
					CMD_SetVertexStreamID <= std_logic_vector(to_unsigned(0, 3) ); -- Stream 0 is our float3 xyz positions stream
					CMD_SetVertexStreamDWORDCount <= std_logic_vector(to_unsigned(3, 3) );
					CMD_SetVertexStreamIsD3DCOLOR <= '0';
					CMD_SetVertexStreamShaderRegIndex <= std_logic_vector(to_unsigned(0, 3) );
					CMD_SetVertexStreamDWORDStride <= std_logic_vector(to_unsigned(9, 6) );
					CMD_SetVertexStreamDWORDOffset <= std_logic_vector(to_unsigned(0, 6) );
					currentState <= setVertexStream1;
				end if;

			when setVertexStream1 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "011"; -- SetVertexStream
					CMD_SetNumVertexStreams <= std_logic_vector(to_unsigned(4, 3) );
					CMD_SetVertexStreamID <= std_logic_vector(to_unsigned(1, 3) ); -- Stream 1 is our float2 texcoord stream
					CMD_SetVertexStreamDWORDCount <= std_logic_vector(to_unsigned(2, 3) );
					CMD_SetVertexStreamIsD3DCOLOR <= '0';
					CMD_SetVertexStreamShaderRegIndex <= std_logic_vector(to_unsigned(1, 3) );
					CMD_SetVertexStreamDWORDStride <= std_logic_vector(to_unsigned(9, 6) );
					CMD_SetVertexStreamDWORDOffset <= std_logic_vector(to_unsigned(3, 6) );
					currentState <= setVertexStream2;
				end if;

			when setVertexStream2 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "011"; -- SetVertexStream
					CMD_SetNumVertexStreams <= std_logic_vector(to_unsigned(4, 3) );
					CMD_SetVertexStreamID <= std_logic_vector(to_unsigned(2, 3) ); -- Stream 2 is our float3 normal stream
					CMD_SetVertexStreamDWORDCount <= std_logic_vector(to_unsigned(3, 3) );
					CMD_SetVertexStreamIsD3DCOLOR <= '0';
					CMD_SetVertexStreamShaderRegIndex <= std_logic_vector(to_unsigned(2, 3) );
					CMD_SetVertexStreamDWORDStride <= std_logic_vector(to_unsigned(9, 6) );
					CMD_SetVertexStreamDWORDOffset <= std_logic_vector(to_unsigned(5, 6) );
					currentState <= setVertexStream3;
				end if;

			when setVertexStream3 =>
				CMD_InCommand <= "000";
				if (CMD_IsReadyForCommand = '1') then
					CMD_InCommand <= "011"; -- SetVertexStream
					CMD_SetNumVertexStreams <= std_logic_vector(to_unsigned(4, 3) );
					CMD_SetVertexStreamID <= std_logic_vector(to_unsigned(3, 3) ); -- Stream 3 is our D3DCOLOR diffuse color stream
					CMD_SetVertexStreamDWORDCount <= std_logic_vector(to_unsigned(1, 3) );
					CMD_SetVertexStreamIsD3DCOLOR <= '1';
					CMD_SetVertexStreamShaderRegIndex <= std_logic_vector(to_unsigned(3, 3) );
					CMD_SetVertexStreamDWORDStride <= std_logic_vector(to_unsigned(9, 6) );
					CMD_SetVertexStreamDWORDOffset <= std_logic_vector(to_unsigned(8, 6) );
					currentState <= readyState;
				end if;

			when fillVertexBatches0 =>
				VERTBATCH_FIFO_wr_en <= '0';
				VBB_Done <= '0';
				if (VERTBATCH_FIFO_full = '0') then
					VERTBATCH_FIFO_wr_data <= X"0000000F0000000100020003000400050006000700080009000A000B000C000D000E000F";
					VERTBATCH_FIFO_wr_en <= '1';
					currentState <= fillVertexBatches1;
				end if;

			when fillVertexBatches1 =>
				VERTBATCH_FIFO_wr_en <= '0';
				VBB_Done <= '0';
				if (VERTBATCH_FIFO_full = '0' and CMD_IsReadyForCommand = '1') then
					VERTBATCH_FIFO_wr_data <= X"0010001F0010001100120013001400150016001700180019001A001B001C001D001E001F";
					VERTBATCH_FIFO_wr_en <= '1';

					CMD_InCommand <= "100"; -- BeginShading
					currentState <= waitForShadingComplete;
				end if;

			when waitForShadingComplete =>
				VERTBATCH_FIFO_wr_en <= '0'; -- Deassert after one cycle
				VBB_Done <= '1';
				CMD_InCommand <= (others => '0');
				if (VBO_Pushed = '1') then
					currentState <= verifyResults0;
				end if;

			when verifyResults0 =>
				VERTOUT_FIFO_rd_en <= '0';
				if (VERTOUT_FIFO_empty = '0') then
					currentState <= verifyResults1;
					VertOutData0 <= VERTOUT_FIFO_rd_data;
					VERTOUT_FIFO_rd_en <= '1';
				end if;

			when verifyResults1 =>
				VERTOUT_FIFO_rd_en <= '0'; -- Deassert after one clock cycle
				BatchStartingIndex1 <= BatchStartingIndex0;
				BatchEndingIndex1 <= BatchEndingIndex0;
				VertOutData1 <= VertOutData0;
				currentState <= verifyResults2;

			when verifyResults2 =>
				BatchStartingIndex2 <= BatchStartingIndex1;
				BatchEndingIndex2 <= BatchEndingIndex1;
				VertOutData2 <= VertOutData1;
				currentState <= verifyResults3;

			when verifyResults3 =>
				for v in 0 to 7 loop
					xorSum := '0';
					for i in 0 to 15 loop
						xorSum := xorSum xor VertOutData2(v * 16 + i);
					end loop;
					XORSums(v) <= xorSum;
				end loop;

				currentState <= verifyResults4;

			when verifyResults4 =>
				if (unsigned(BatchStartingIndex2) < unsigned(BatchEndingIndex2) ) then
					EXTRegisterA1 <= '0';
				else
					EXTRegisterA1 <= '1';
				end if;
				xorSum := '0';
				for i in 0 to 7 loop
					xorSum := xorSum xor XORSums(i);
				end loop;
				EXTRegisterB1 <= xorSum;
				currentState <= verifyResults5;

			when verifyResults5 =>
				EXTRegisterA2 <= EXTRegisterA1;
				EXTRegisterB2 <= EXTRegisterB1;
				currentState <= verifyResults6;

			when verifyResults6 =>
				EXTRegisterA3 <= EXTRegisterA2;
				EXTRegisterB3 <= EXTRegisterB2;
				currentState <= verifyResults7;

			when verifyResults7 =>
				EXT_Cmd_Out(0) <= EXTRegisterA3;
				EXT_Cmd_Out(1) <= EXTRegisterB3;
				currentState <= readyState;

			when others =>
		end case;
	end if;
end process;

-- DRAM process:
process(clk)
begin
	if (rising_edge(clk) ) then
		DRAM_ReadRequests_rd_en <= '0'; -- Deassert after one cycle
		DRAM_ReadResponses_wr_en <= '0'; -- Deassert after one cycle

		case currentDRAMState is 
			when DRAM_InitState =>
				currentDRAMState <= DRAM_ReadyState;

			when DRAM_ReadyState =>
				if (DRAM_ReadRequests_empty = '0' and DRAM_ReadResponses_full = '0') then
					DRAM_ReadRequests_rd_en <= '1';
					DRAM_ReadResponses_wr_en <= '1';

					if (DRAM_ReadRequests_rd_data(29) = '1') then -- Instruction ROM
						DRAM_ReadResponses_wr_data <= DRAM_ReadRequests_rd_data & std_logic_vector(instructionData(to_integer(unsigned(DRAM_ReadRequests_rd_data(14 downto 6) ) ) ) );
					else -- Vertex data ROM
						DRAM_ReadResponses_wr_data <= DRAM_ReadRequests_rd_data & std_logic_vector(vertexStreamData(to_integer(unsigned(DRAM_ReadRequests_rd_data(14 downto 6) ) ) ) );
					end if;
				end if;
		end case;
	end if;
end process;

end Behavioral;
