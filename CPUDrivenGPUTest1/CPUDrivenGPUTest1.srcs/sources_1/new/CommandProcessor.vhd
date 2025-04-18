library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

entity CommandProcessor is
	generic (
	-- Width of address bus. 
		ADDR_WIDTH_BITS	: integer range 8 to 32 := 30;
		-- Width of M_AXI data bus. 
    -- The master issues write data and accept read data where the width of the data bus is DATA_WIDTH_BITS
		DATA_WIDTH_BITS	: integer range 16 to 1024 := 256
	);
    Port ( 
		clk	: in std_logic;

		-- active low reset signal
		resetn	: in std_logic;

	-- Packet processor interfaces begin
		-- Valid packets FIFO inputs:
        validPacketsFIFO_rd_data : in STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0);
        validPacketsFIFO_empty : in STD_LOGIC;
        validPacketsFIFO_rd_en : out STD_LOGIC := '0';

		-- Return packet FIFO outputs:
		returnPacketsFIFO_full : in STD_LOGIC;
		returnPacketsFIFO_wr_data : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
		returnPacketsFIFO_wr_en : out STD_LOGIC := '0';
	-- Packet processor interfaces end

	-- Memory controller interfaces begin
		-- DRAM read requests FIFO:
		CommandProcReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(ADDR_WIDTH_BITS-1 downto 0) := (others => '0');
        CommandProcReadRequestsFIFO_full : in STD_LOGIC;
        CommandProcReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		CommandProcReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(ADDR_WIDTH_BITS+DATA_WIDTH_BITS-1 downto 0);
        CommandProcReadResponsesFIFO_empty : in STD_LOGIC;
        CommandProcReadResponsesFIFO_rd_en : out STD_LOGIC := '0';

		-- DRAM write requests FIFO:
		CommandProcWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(ADDR_WIDTH_BITS+DATA_WIDTH_BITS+DATA_WIDTH_BITS/32-1 downto 0) := (others => '0');
        CommandProcWriteRequestsFIFO_full : in STD_LOGIC;
        CommandProcWriteRequestsFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory controller interfaces end

	-- Idle signals from the various systems begin
		CMD_IA_Idle : in STD_LOGIC;
		CMD_Rasterizer_Idle : in STD_LOGIC;
		CMD_VSync : in STD_LOGIC;
		CMD_TexSampler_Idle : in STD_LOGIC;
		CMD_ClearBlock_Idle : in STD_LOGIC;
		CMD_ROP_Idle : in STD_LOGIC;
		CMD_MemController_Idle : in STD_LOGIC;
	-- Idle signals from the various systems end

	-- Input Assembler interfaces begin
		-- Draw interfaces:
		IA_DrawReady : in STD_LOGIC;
		IA_LaunchDrawSignal : out STD_LOGIC := '0';
		IA_DrawIsIndexed : out STD_LOGIC := '1';
		IA_DrawIndexCount : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		-- Load vertex/index buffers to cache interfaces:
		IA_LoadBufferReady : in STD_LOGIC;
		IA_LoadBufferEnable : out STD_LOGIC := '0';
		IA_LoadBufferAddress : out STD_LOGIC_VECTOR(ADDR_WIDTH_BITS-1 downto 0) := (others => '0');
		IA_LoadBufferType : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		IA_LoadBufferElementCount : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		IA_LoadAllElementsIdentical : out STD_LOGIC := '0';

		-- Set state interfaces:
		IA_SetStateReady : in STD_LOGIC;
		IA_SetStateEnable : out STD_LOGIC := '0';
		IA_StateCullMode : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		IA_StatePrimTopology : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		IA_StateStripCutType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		IA_StateIndexFormat : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	-- Input Assembler interfaces end

	-- Texture sampler interfaces begin
		TEXSAMP_LoadTexCacheBeginSignal : out STD_LOGIC := '0';
		TEXSAMP_LoadTexCacheAckSignal : in STD_LOGIC;
		TEXSAMP_LoadTexCacheAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		TEXSAMP_LoadTexCacheFormat : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		TEXSAMP_LoadTexCacheTexelCount : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_LoadTexCacheTexelWidth : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		TEXSAMP_LoadTexCacheTexelHeight : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

		TEXSAMP_SetTextureStateBeginSignal : out STD_LOGIC := '0';
		TEXSAMP_SetTextureStateAckSignal : in STD_LOGIC;
		TEXSAMP_SetTextureStateUseBilinear : out STD_LOGIC := '0';
		TEXSAMP_SetTextureStateCombinerModeColor : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		TEXSAMP_SetTextureStateCombinerModeAlpha : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	-- Texture sampler interfaces end

	-- ROP interfaces begin
		ROP_SetBlendStateBeginSignal : out STD_LOGIC := '0';
		ROP_SetBlendStateSigAck : in STD_LOGIC;

		ROP_SetClearColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ROP_ClearSignal : out STD_LOGIC := '0';
		ROP_ClearSignalAck : in STD_LOGIC;

		ROP_FlushCacheSignal : out STD_LOGIC := '0';
		ROP_FlushCacheAck : in STD_LOGIC;

		ROP_SetRenderTargetBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		ROP_SetBlendMask : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		ROP_SetBlendMode : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		ROP_SetAlphaTestEnabled : out STD_LOGIC := '0';
		ROP_SetAlphaTestRefVal : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		ROP_SetAlphaTestFunc : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	-- ROP interfaces begin

	-- Scanout interfaces begin
		SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		SCANOUT_ScanEnable : out STD_LOGIC := '0';
	-- Scanout interfaces end

	-- Clear Block interfaces begin
		CLEAR_ClearBlockBeginSignal : out STD_LOGIC := '0';
		CLEAR_BaseRenderTargetAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		CLEAR_ClearColorRGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLEAR_ClearDRAMLineCount : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Clear Block interfaces end

	-- Stats interface begin
		STAT_PresentSignal : out STD_LOGIC := '0';
		STAT_WriteFrameStatsAddress : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		STAT_StatsSaveComplete : in STD_LOGIC;

		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_CMDPACKETSTATE : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

		DBG_LAST_IN_PACKET : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');
		DBG_LAST_OUT_PACKET : out STD_LOGIC_VECTOR(PACKET_SIZE_IN_BYTES*8-1 downto 0) := (others => '0');

		DBG_LAST_READ_DATA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		DBG_LAST_WRITE_ADDR : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_LAST_WRITE_DATA : out STD_LOGIC_VECTOR(DATA_WIDTH_BITS-1 downto 0) := (others => '0');

		DBG_IdleSignalsVector : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0')
		);
end CommandProcessor;

architecture Behavioral of CommandProcessor is

	ATTRIBUTE X_INTERFACE_INFO : STRING;

	ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of validPacketsFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of returnPacketsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO FULL";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO FULL";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses EMPTY";

	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_DATA";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_EN";
	ATTRIBUTE X_INTERFACE_INFO of CommandProcWriteRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests FULL";

	-- Packet state machine states:
	type packetState is ( PACKETINITSTATE, -- 0
						READ_NEXT_PACKET_FROM_FIFO, -- 1
						DECODE_NEW_PACKET, -- 2

						DONOTHING_PACKET, -- 3

						WRITEMEM_PACKET, -- 4
						WRITEMEM_DEASSERT_WRITE, -- 5

						CLEARMEM_PACKET, -- 6
						CLEARMEM_LOOP, -- 7
						CLEARMEM_DEASSERT_WRITE, -- 8

						READMEM_PACKET, -- 9
						READMEM_WAIT_FOR_READ_DATA, -- 10
						READMEM_PUSH_TO_OUT_FIFO, -- 11
						READMEM_DEASSERT_FIFO, -- 12

						LOAD_VERTSTREAM_DATA, -- 13
						LOAD_TEXTURE_DATA, -- 14

						WAIT_FOR_IDLE, -- 15
						WAIT_FOR_IDLE_SIGNAL_BACK, -- 16
						WAIT_FOR_IDLE_SIGNAL_BACK_DEASSERT_FIFO, -- 17

						SET_TEXTURE_STATE, -- 18
						SET_BLEND_STATE, -- 19
						SET_SCANOUT_POINTER, -- 20
						SET_IA_STATE, -- 21

						ISSUE_CLEARBLOCK, -- 22
						ISSUE_CLEARBLOCK_DEASSERT, -- 23
						CLEARBLOCK_SYNC_ROP, -- 24

						FLUSH_ROP_CACHE, -- 25

						SIGNAL_END_OF_FRAME_STATS, -- 26

						DRAW_COMMAND, -- 27

						BEGIN_EXECUTE_COMMAND_LIST, -- 28
						COMMAND_LIST_LOAD_NEXT_DRAM_LINE, -- 29
						COMMAND_LIST_WAIT_FOR_NEXT_DRAM_LINE, -- 30
						COMMAND_LIST_FINISH_DRAM_READ -- 31
						);

	type commandListExecState is record
		currentReadAddress : unsigned(29 downto 0);
		numRemainingCommands : unsigned(15 downto 0);
		numCommandsThisDRAMRead : unsigned(1 downto 0);
		currentPacketMemoryDRAMLine : unsigned(215 downto 0);
	end record commandListExecState;

	signal mst_packet_state : packetState := PACKETINITSTATE;
	signal has_new_read_data : std_logic := '0';
	signal writer_has_consumed_data : std_logic := '0';
	signal lastReadData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	signal localIncomingPacket : genericPacket; -- Incoming request packet from the CPU to the FPGA
	signal localOutgoingPacket : genericPacket; -- Outgoing response packet to the CPU from the FPGA

	signal newWriteAck : std_logic := '0'; -- Written to by the AXI write process, read by the packet processor process
	signal newWriteAddr : unsigned(ADDR_WIDTH_BITS-1 downto 0) := to_unsigned(0, ADDR_WIDTH_BITS); -- Written to by the packet processor process, read from by the AXI write process
	signal clearMemLines : unsigned(15 downto 0) := to_unsigned(0, 16); -- Written to by the packet processor process, and also read by that same process
	signal readyForNewWrite : std_logic := '0'; -- Written to by the AXI write process when it's ready for another new write, read from by the packet processor process

	signal newReadEnable : std_logic := '0'; -- Written to by the packet processor process, read from by the AXI read process
	signal newReadAddr : unsigned(31 downto 0) := to_unsigned(0, 32); -- Written to by the packet processor process, read from by the AXI read process
	signal newReadDWORDSelect : unsigned(2 downto 0) := to_unsigned(0, 3); -- Written to by the packet processor process, read from by the AXI read process
	signal newReadData : std_logic_vector(31 downto 0) := (others => '0'); -- Written to by the AXI read process, read from by the packet processor process
	signal newReadDataReady : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process
	signal readyForNewRead : std_logic := '0'; -- Written to by the AXI read process, read from by the packet processor process

	signal newWriteData : std_logic_vector(DATA_WIDTH_BITS-1 downto 0) := (others => '0');
	signal newWriteDWORDEnable : std_logic_vector(DATA_WIDTH_BITS/32-1 downto 0) := (others => '1');
	signal loadIABufferEnable : std_logic := '0';
	signal loadTexDataEnable : std_logic := '0';
	signal setTexStateEnable : std_logic := '0';
	signal setBlendStateEnable : std_logic := '0';
	signal setIAStateEnable : std_logic := '0';
	signal setROPClearEnable : std_logic := '0';
	signal flushROPCache : std_logic := '0';
	signal launchDrawSignalIA : std_logic := '0';

	signal commandListState : commandListExecState;

	-- Idle signal registers
	signal IAIdleSig : STD_LOGIC := '0';
	signal RasterizerIdleSig : STD_LOGIC := '0';
	signal VSyncSig : STD_LOGIC := '0';
	signal VSyncSigM1 : STD_LOGIC := '0';
	signal VSyncResolvedSig : STD_LOGIC := '0';
	signal TexSamplerIdleSig : STD_LOGIC := '0';
	signal ClearBlockIdleSig : STD_LOGIC := '0';
	signal ROPIdleSig : STD_LOGIC := '0';
	signal MemControllerIdleSig : STD_LOGIC := '0';
	
	signal CombinedIdleSignals : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');

	signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
	signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');

	pure function GetTexSizeLog2(texSize : unsigned(7 downto 0) ) return unsigned is
	begin
		if (texSize(7) = '1') then
			return to_unsigned(7, 3);
		elsif (texSize(6) = '1') then
			return to_unsigned(6, 3);
		elsif (texSize(5) = '1') then
			return to_unsigned(5, 3);
		elsif (texSize(4) = '1') then
			return to_unsigned(4, 3);
		elsif (texSize(3) = '1') then
			return to_unsigned(3, 3);
		elsif (texSize(2) = '1') then
			return to_unsigned(2, 3);
		elsif (texSize(1) = '1') then
			return to_unsigned(1, 3);
		else
			return to_unsigned(0, 3);
		end if;
	end function;

begin
	IA_LoadBufferEnable <= loadIABufferEnable;
	TEXSAMP_LoadTexCacheBeginSignal <= loadTexDataEnable;
	TEXSAMP_SetTextureStateBeginSignal <= setTexStateEnable;
	ROP_SetBlendStateBeginSignal <= setBlendStateEnable;
	ROP_ClearSignal <= setROPClearEnable;
	ROP_FlushCacheSignal <= flushROPCache;
	IA_SetStateEnable <= setIAStateEnable;
	IA_LaunchDrawSignal <= launchDrawSignalIA;

	STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
	STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);

	DBG_IdleSignalsVector <= CombinedIdleSignals;
	DBG_CMDPACKETSTATE <= std_logic_vector(to_unsigned(packetState'pos(mst_packet_state), 8) );
	DBG_LAST_IN_PACKET <= std_logic_vector(localIncomingPacket.magicByte) & std_logic_vector(localIncomingPacket.checksum) & std_logic_vector(localIncomingPacket.packetTypeByte) & std_logic_vector(localIncomingPacket.payload0) & std_logic_vector(localIncomingPacket.payload1);
	DBG_LAST_OUT_PACKET <= std_logic_vector(localOutgoingPacket.magicByte) & std_logic_vector(localOutgoingPacket.checksum) & std_logic_vector(localOutgoingPacket.packetTypeByte) & std_logic_vector(localOutgoingPacket.payload0) & std_logic_vector(localOutgoingPacket.payload1);
	DBG_LAST_READ_DATA <= newReadData;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case mst_packet_state is
				when READ_NEXT_PACKET_FROM_FIFO =>
					statCyclesIdle <= statCyclesIdle + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	-- Packet state machine
	process(clk)
		variable writeDataTemp : std_logic_vector(DATA_WIDTH_BITS-1 downto 0) := (others => '0');
		variable writeDWORDEnableTemp : std_logic_vector(DATA_WIDTH_BITS/32-1 downto 0) := (others => '1');
	begin
		if (rising_edge(clk) ) then
			if (resetn = '0' ) then
				mst_packet_state <= PACKETINITSTATE;
			else
				case (mst_packet_state) is
					when PACKETINITSTATE =>
						validPacketsFIFO_rd_en <= '0';
						returnPacketsFIFO_wr_en <= '0';
						returnPacketsFIFO_wr_data <= (others => '0');
						clearMemLines <= (others => '0');
						newReadEnable <= '0';

						CommandProcReadRequestsFIFO_wr_data <= (others => '0');
						CommandProcReadRequestsFIFO_wr_en <= '0';
						CommandProcReadResponsesFIFO_rd_en <= '0';
						CommandProcWriteRequestsFIFO_wr_data <= (others => '0');
						CommandProcWriteRequestsFIFO_wr_en <= '0';

						commandListState.currentReadAddress <= (others => '0');
						commandListState.numRemainingCommands <= (others => '0');
						commandListState.numCommandsThisDRAMRead <= (others => '0');
						commandListState.currentPacketMemoryDRAMLine <= (others => '0');

						localIncomingPacket.magicByte <= X"00";
						localIncomingPacket.checksum <= X"00";
						localIncomingPacket.packetTypeByte <= X"00";
						localIncomingPacket.payload0 <= X"00000000";
						localIncomingPacket.payload1 <= X"00000000";

						localOutgoingPacket.magicByte <= X"00";
						localOutgoingPacket.checksum <= X"00";
						localOutgoingPacket.packetTypeByte <= X"00";
						localOutgoingPacket.payload0 <= X"00000000";
						localOutgoingPacket.payload1 <= X"00000000";

						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when READ_NEXT_PACKET_FROM_FIFO =>
						if (commandListState.numRemainingCommands > 0) then -- If we're executing a command list from memory:
							if (commandListState.numCommandsThisDRAMRead > 0) then
								commandListState.numRemainingCommands <= commandListState.numRemainingCommands - 1;
								commandListState.numCommandsThisDRAMRead <= commandListState.numCommandsThisDRAMRead - 1;
								commandListState.currentPacketMemoryDRAMLine <= commandListState.currentPacketMemoryDRAMLine srl (SIMPLIFIED_PACKET_SIZE_IN_BYTES * 8);
								localIncomingPacket.magicByte <= to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8); -- Synthesize the magic byte
								localIncomingPacket.checksum <= (others => '0'); -- Synthesize our checksum
								localIncomingPacket.packetTypeByte <= commandListState.currentPacketMemoryDRAMLine(8*1-1 downto 8*0);
								localIncomingPacket.payload0 <= unsigned(commandListState.currentPacketMemoryDRAMLine(8*5-1 downto 8*4) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*4-1 downto 8*3) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*3-1 downto 8*2) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*2-1 downto 8*1) );
								localIncomingPacket.payload1 <= unsigned(commandListState.currentPacketMemoryDRAMLine(8*9-1 downto 8*8) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*8-1 downto 8*7) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*7-1 downto 8*6) ) & unsigned(commandListState.currentPacketMemoryDRAMLine(8*6-1 downto 8*5) );

								mst_packet_state <= DECODE_NEW_PACKET;
							else -- Else, we have to go and fetch a new DRAM line in order to read more command buffer packets
								commandListState.currentReadAddress <= commandListState.currentReadAddress + 32;
								mst_packet_state <= COMMAND_LIST_LOAD_NEXT_DRAM_LINE;
							end if;
						else -- Else if we're just reading single packets at a time from the packet FIFO:
							if (validPacketsFIFO_empty = '0') then
								localIncomingPacket.magicByte <= unsigned(validPacketsFIFO_rd_data(8*1-1 downto 8*0) );
								localIncomingPacket.checksum <= unsigned(validPacketsFIFO_rd_data(8*2-1 downto 8*1) );
								localIncomingPacket.packetTypeByte <= unsigned(validPacketsFIFO_rd_data(8*3-1 downto 8*2) );
								localIncomingPacket.payload0 <= unsigned(validPacketsFIFO_rd_data(8*7-1 downto 8*6) ) & unsigned(validPacketsFIFO_rd_data(8*6-1 downto 8*5) ) & unsigned(validPacketsFIFO_rd_data(8*5-1 downto 8*4) ) & unsigned(validPacketsFIFO_rd_data(8*4-1 downto 8*3) );
								localIncomingPacket.payload1 <= unsigned(validPacketsFIFO_rd_data(8*11-1 downto 8*10) ) & unsigned(validPacketsFIFO_rd_data(8*10-1 downto 8*9) ) & unsigned(validPacketsFIFO_rd_data(8*9-1 downto 8*8) ) & unsigned(validPacketsFIFO_rd_data(8*8-1 downto 8*7) );

								validPacketsFIFO_rd_en <= '1';

								mst_packet_state <= DECODE_NEW_PACKET;
							end if;
						end if;

					when DECODE_NEW_PACKET =>
						validPacketsFIFO_rd_en <= '0';

						case (localIncomingPacket.packetTypeByte) is
							when to_unsigned(ePacketType'pos(PT_WRITEMEM), 8) =>
								mst_packet_state <= WRITEMEM_PACKET;

							when to_unsigned(ePacketType'pos(PT_READMEM), 8) =>
								mst_packet_state <= READMEM_PACKET;

							when to_unsigned(ePacketType'pos(PT_CLEARMEM), 8) =>
								mst_packet_state <= CLEARMEM_PACKET;

							when to_unsigned(ePacketType'pos(PT_CLEARBACKBUFFER), 8) =>
								mst_packet_state <= ISSUE_CLEARBLOCK;

							when to_unsigned(ePacketType'pos(PT_CLEARZSTENCILBUFFER), 8) =>
								mst_packet_state <= DONOTHING_PACKET; -- TODO: Implement this!

							when to_unsigned(ePacketType'pos(PT_LOADVERTSTREAMDATA), 8) =>
								mst_packet_state <= LOAD_VERTSTREAM_DATA;

							when to_unsigned(ePacketType'pos(PT_LOADTEXCACHEDATA), 8) =>
								mst_packet_state <= LOAD_TEXTURE_DATA;

							when to_unsigned(ePacketType'pos(PT_SETBLENDSTATE), 8) =>
								mst_packet_state <= SET_BLEND_STATE;

							when to_unsigned(ePacketType'pos(PT_SETTEXTURESTATE), 8) =>
								mst_packet_state <= SET_TEXTURE_STATE;

							when to_unsigned(ePacketType'pos(PT_WAITFORDEVICEIDLE), 8) =>
								mst_packet_state <= WAIT_FOR_IDLE;

							when to_unsigned(ePacketType'pos(PT_DRAWINDEXED), 8) =>
								mst_packet_state <= DRAW_COMMAND;

							when to_unsigned(ePacketType'pos(PT_SETSCANOUTPOINTER), 8) =>
								mst_packet_state <= SET_SCANOUT_POINTER;

							when to_unsigned(ePacketType'pos(PT_SETIASTATE), 8) =>
								mst_packet_state <= SET_IA_STATE;

							when to_unsigned(ePacketType'pos(PT_FLUSHROPCACHE), 8) =>
								mst_packet_state <= FLUSH_ROP_CACHE;

							when to_unsigned(ePacketType'pos(PT_ENDFRAME), 8) =>
								mst_packet_state <= SIGNAL_END_OF_FRAME_STATS;

							when to_unsigned(ePacketType'pos(PT_RUNCOMMANDLIST), 8) =>
								mst_packet_state <= BEGIN_EXECUTE_COMMAND_LIST;

							when others => --when to_unsigned(ePacketType'pos(PT_DONOTHING), 8) =>
								mst_packet_state <= DONOTHING_PACKET;
						end case;

					when DONOTHING_PACKET =>
						-- Do nothing, just return to the "get next packet" state. This is meant as a no-op sort of packet that does nothing.
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when WRITEMEM_PACKET =>
						if (CommandProcWriteRequestsFIFO_full = '0') then
							-- For write packets, the first payload val is the address
							newWriteAddr <= localIncomingPacket.payload0(ADDR_WIDTH_BITS-1 downto 5) & "00000"; -- Zero out the bottommost 5 bits so we're always writing at a DRAM-aligned boundary
							case localIncomingPacket.payload0(4 downto 2) is
								when "111" =>
									writeDataTemp := std_logic_vector(localIncomingPacket.payload1) & x"00000000000000000000000000000000000000000000000000000000";
									writeDWORDEnableTemp := "10000000";
								when "110" =>
									writeDataTemp := x"00000000" & std_logic_vector(localIncomingPacket.payload1) & x"000000000000000000000000000000000000000000000000";
									writeDWORDEnableTemp := "01000000";
								when "101" =>
									writeDataTemp := x"0000000000000000" & std_logic_vector(localIncomingPacket.payload1) & x"0000000000000000000000000000000000000000";
									writeDWORDEnableTemp := "00100000";
								when "100" =>
									writeDataTemp := x"000000000000000000000000" & std_logic_vector(localIncomingPacket.payload1) & x"00000000000000000000000000000000";
									writeDWORDEnableTemp := "00010000";
								when "011" =>
									writeDataTemp := x"00000000000000000000000000000000" & std_logic_vector(localIncomingPacket.payload1) & x"000000000000000000000000";
									writeDWORDEnableTemp := "00001000";
								when "010" =>
									writeDataTemp := x"0000000000000000000000000000000000000000" & std_logic_vector(localIncomingPacket.payload1) & x"0000000000000000";
									writeDWORDEnableTemp := "00000100";
								when "001" =>
									writeDataTemp := x"000000000000000000000000000000000000000000000000" & std_logic_vector(localIncomingPacket.payload1) & x"00000000";
									writeDWORDEnableTemp := "00000010";
								when others => --when "000" => 
									writeDataTemp := x"00000000000000000000000000000000000000000000000000000000" & std_logic_vector(localIncomingPacket.payload1);
									writeDWORDEnableTemp := "00000001";
							end case;

							CommandProcWriteRequestsFIFO_wr_data <= std_logic_vector(localIncomingPacket.payload0(ADDR_WIDTH_BITS-1 downto 0) ) & writeDataTemp & writeDWORDEnableTemp;

							CommandProcWriteRequestsFIFO_wr_en <= '1';
							mst_packet_state <= WRITEMEM_DEASSERT_WRITE;
						end if;

					when WRITEMEM_DEASSERT_WRITE =>
						CommandProcWriteRequestsFIFO_wr_en <= '0';
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when CLEARMEM_PACKET =>
						if (localIncomingPacket.payload1(15 downto 0) > 0) then
							-- For clear packets, the first padding val is the address
							newWriteAddr <= localIncomingPacket.payload0(ADDR_WIDTH_BITS-1 downto 0); -- For clear packets, the address is in the first payload val

							-- For clear packets, the first two bytes of the second DWORD payload val are the clear-length (in 32-byte DRAM lines)
							clearMemLines <= localIncomingPacket.payload1(15 downto 0);

							-- For clear packets, the clear type is in the third byte of the second DWORD payload val
							case localIncomingPacket.payload1(17 downto 16) is
								when "11" => newWriteData <= x"00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF"; -- Transparent White: float4(1.0f, 1.0f, 1.0f, 0.0f)
								when "10" => newWriteData <= x"FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000"; -- Opaque Black: float4(0.0f, 0.0f, 0.0f, 1.0f)
								when "01" => newWriteData <= (others => '1'); -- Opaque White: float4(1.0f, 1.0f, 1.0f, 1.0f)
								when others => newWriteData <= (others => '0'); -- when "00" -- Transparent Black: float4(0.0f, 0.0f, 0.0f, 0.0f)
							end case;
							newWriteDWORDEnable <= "11111111"; -- Enable all DWORD's in this strobe
							mst_packet_state <= CLEARMEM_LOOP;
						else
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO; -- Skip the whole CLEARMEM_LOOP if the clear size is zero
						end if;

					when CLEARMEM_LOOP =>
						if (CommandProcWriteRequestsFIFO_full = '0') then
							clearMemLines <= clearMemLines - 1;
							CommandProcWriteRequestsFIFO_wr_data <= std_logic_vector(newWriteAddr) & newWriteData & newWriteDWORDEnable;
							CommandProcWriteRequestsFIFO_wr_en <= '1';
							mst_packet_state <= CLEARMEM_DEASSERT_WRITE;
						end if;

					when CLEARMEM_DEASSERT_WRITE =>
						CommandProcWriteRequestsFIFO_wr_en <= '0';
						newWriteAddr <= newWriteAddr + 32; -- Increment address by 32 bytes (sizeof(DRAM_LINE) )

						if (clearMemLines > 0) then
							mst_packet_state <= CLEARMEM_LOOP;
						else
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when READMEM_PACKET =>
						if (CommandProcReadRequestsFIFO_full = '0') then
							newReadDWORDSelect <= localIncomingPacket.payload1(2 downto 0);
							-- For read packets, the first payload val is the address
							CommandProcReadRequestsFIFO_wr_data <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
							CommandProcReadRequestsFIFO_wr_en <= '1';
							mst_packet_state <= READMEM_WAIT_FOR_READ_DATA;
						end if;

					when READMEM_WAIT_FOR_READ_DATA =>
						CommandProcReadRequestsFIFO_wr_en <= '0'; -- Deassert after one cycle
						if (CommandProcReadResponsesFIFO_empty = '0') then
							
							CommandProcReadResponsesFIFO_rd_en <= '1';

							localOutgoingPacket.magicByte <= to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8);
							localOutgoingPacket.packetTypeByte <= to_unsigned(ePacketType'pos(PT_READMEMRESPONSE), 8);
							localOutgoingPacket.payload0 <= "00" & unsigned(CommandProcReadResponsesFIFO_rd_data(ADDR_WIDTH_BITS+DATA_WIDTH_BITS-1 downto DATA_WIDTH_BITS) );

							case newReadDWORDSelect is
								when "111" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*8-1 downto 32*7) );
								when "110" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*7-1 downto 32*6) );
								when "101" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*6-1 downto 32*5) );
								when "100" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*5-1 downto 32*4) );
								when "011" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*4-1 downto 32*3) );
								when "010" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*3-1 downto 32*2) );
								when "001" => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*2-1 downto 32*1) );
								when others => localOutgoingPacket.payload1 <= unsigned(CommandProcReadResponsesFIFO_rd_data(32*1-1 downto 32*0) ); --when "000"
							end case;

							mst_packet_state <= READMEM_PUSH_TO_OUT_FIFO;
						end if;

					when READMEM_PUSH_TO_OUT_FIFO =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (returnPacketsFIFO_full = '0') then
							returnPacketsFIFO_wr_data <= std_logic_vector(localOutgoingPacket.payload1) & std_logic_vector(localOutgoingPacket.payload0) & std_logic_vector(localOutgoingPacket.packetTypeByte) & std_logic_vector(localOutgoingPacket.checksum) & std_logic_vector(localOutgoingPacket.magicByte);
							returnPacketsFIFO_wr_en <= '1';
							mst_packet_state <= READMEM_DEASSERT_FIFO;
						end if;

					when READMEM_DEASSERT_FIFO =>
						returnPacketsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when LOAD_VERTSTREAM_DATA =>
						if (loadIABufferEnable = '1' and IA_LoadBufferReady = '1') then
							loadIABufferEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							loadIABufferEnable <= '1';
							IA_LoadBufferAddress <= std_logic_vector(localIncomingPacket.payload0(ADDR_WIDTH_BITS-1 downto 0) );
							IA_LoadBufferType <= std_logic_vector(localIncomingPacket.payload1(2 downto 0) );
							IA_LoadBufferElementCount <= std_logic_vector(localIncomingPacket.payload1(23 downto 8) );
							IA_LoadAllElementsIdentical <= std_logic(localIncomingPacket.payload1(24) );
							mst_packet_state <= LOAD_VERTSTREAM_DATA;
						end if;

					when LOAD_TEXTURE_DATA =>
						if (loadTexDataEnable = '1' and TEXSAMP_LoadTexCacheAckSignal = '1') then
							loadTexDataEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							loadTexDataEnable <= '1';

							TEXSAMP_LoadTexCacheAddr <= std_logic_vector(localIncomingPacket.payload0(ADDR_WIDTH_BITS-1 downto 0) );
							TEXSAMP_LoadTexCacheFormat <= std_logic_vector(localIncomingPacket.payload1(2 downto 0) );
							TEXSAMP_LoadTexCacheTexelCount <= std_logic_vector(localIncomingPacket.payload1(23 downto 8) );

							mst_packet_state <= LOAD_TEXTURE_DATA;
						end if;

					when WAIT_FOR_IDLE =>
						-- Sample the idle flags into registers to be read next cycle:
						IAIdleSig <= CMD_IA_Idle;
						RasterizerIdleSig <= CMD_Rasterizer_Idle;
						VSyncSigM1 <= VSyncSig; -- VSync needs two signal registers that get AND'd together because it's running on a different 
						VSyncSig <= CMD_VSync; -- clock domain from the rest of the pipeline
						VSyncResolvedSig <= VSyncSigM1 and VSyncSig;
						TexSamplerIdleSig <= CMD_TexSampler_Idle;
						ClearBlockIdleSig <= CMD_ClearBlock_Idle;
						ROPIdleSig <= CMD_ROP_Idle;
						MemControllerIdleSig <= CMD_MemController_Idle;

						CombinedIdleSignals <= MemControllerIdleSig & ROPIdleSig & ClearBlockIdleSig & TexSamplerIdleSig & VSyncResolvedSig & RasterizerIdleSig & IAIdleSig;

						-- The wait is completed when ( (waitFlags & waitSignals) == waitFlags):
						if ( (localIncomingPacket.payload0(7 downto 0) and 
							('1' & MemControllerIdleSig & ROPIdleSig & ClearBlockIdleSig &
							TexSamplerIdleSig & VSyncResolvedSig & RasterizerIdleSig & IAIdleSig) ) = localIncomingPacket.payload0(7 downto 0) ) then
							if (localIncomingPacket.payload0(8) = '0') then -- Send back a DWORD (from payload1) after wait completes or not?
								mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
							else
								localOutgoingPacket.magicByte <= to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8);
								localOutgoingPacket.packetTypeByte <= to_unsigned(ePacketType'pos(PT_WAITRESPONSE), 8);
								localOutgoingPacket.payload0 <= localIncomingPacket.payload1;
								localOutgoingPacket.payload1 <= (others => '0'); -- This second payload DWORD is unused for now
								mst_packet_state <= WAIT_FOR_IDLE_SIGNAL_BACK;
							end if;
						end if;

					when WAIT_FOR_IDLE_SIGNAL_BACK =>
						if (returnPacketsFIFO_full = '0') then
							returnPacketsFIFO_wr_data <= std_logic_vector(localOutgoingPacket.payload1) & std_logic_vector(localOutgoingPacket.payload0) & std_logic_vector(localOutgoingPacket.packetTypeByte) & std_logic_vector(localOutgoingPacket.checksum) & std_logic_vector(localOutgoingPacket.magicByte);
							returnPacketsFIFO_wr_en <= '1';
							mst_packet_state <= WAIT_FOR_IDLE_SIGNAL_BACK_DEASSERT_FIFO;
						end if;
					
					when WAIT_FOR_IDLE_SIGNAL_BACK_DEASSERT_FIFO =>
						returnPacketsFIFO_wr_en <= '0';
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when SET_TEXTURE_STATE =>
						if (setTexStateEnable = '1' and TEXSAMP_SetTextureStateAckSignal = '1') then
							setTexStateEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setTexStateEnable <= '1';

							TEXSAMP_SetTextureStateUseBilinear <= localIncomingPacket.payload0(16);
							TEXSAMP_LoadTexCacheTexelWidth <= std_logic_vector(GetTexSizeLog2(localIncomingPacket.payload0(7 downto 0) ) );
							TEXSAMP_LoadTexCacheTexelHeight <= std_logic_vector(GetTexSizeLog2(localIncomingPacket.payload0(15 downto 8) ) );
							TEXSAMP_LoadTexCacheAddr <= std_logic_vector(resize(localIncomingPacket.payload1(15 downto 0), ADDR_WIDTH_BITS) ); -- Set the channel swizzles up
							TEXSAMP_SetTextureStateCombinerModeColor <= std_logic_vector(localIncomingPacket.payload1(26 downto 24) );
							TEXSAMP_SetTextureStateCombinerModeAlpha <= std_logic_vector(localIncomingPacket.payload1(18 downto 16) );

							mst_packet_state <= SET_TEXTURE_STATE;
						end if;

					when SET_BLEND_STATE =>
						if (setBlendStateEnable = '1' and ROP_SetBlendStateSigAck = '1') then
							setBlendStateEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setBlendStateEnable <= '1';

							ROP_SetRenderTargetBaseAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
							ROP_SetBlendMode <= std_logic_vector(localIncomingPacket.payload0(31 downto 30) );
							ROP_SetBlendMask <= std_logic_vector(localIncomingPacket.payload1(3 downto 0) );
							ROP_SetAlphaTestEnabled <= localIncomingPacket.payload1(10);
							ROP_SetAlphaTestRefVal <= std_logic_vector(localIncomingPacket.payload1(23 downto 16) );
							ROP_SetAlphaTestFunc <= std_logic_vector(localIncomingPacket.payload1(26 downto 24) );

							mst_packet_state <= SET_BLEND_STATE;
						end if;

					when DRAW_COMMAND =>
						if (IA_DrawReady = '1' and launchDrawSignalIA = '1') then
							launchDrawSignalIA <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							launchDrawSignalIA <= '1';
							IA_DrawIndexCount <= std_logic_vector(localIncomingPacket.payload0(15 downto 0) );
							IA_DrawIsIndexed <= std_logic(localIncomingPacket.payload1(0) );
							mst_packet_state <= DRAW_COMMAND;
						end if;

					when SET_SCANOUT_POINTER =>
						SCANOUT_RenderTargetBaseAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
						SCANOUT_ScanEnable <= localIncomingPacket.payload1(0);
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when SET_IA_STATE =>
						if (IA_SetStateReady = '1' and setIAStateEnable = '1') then
							setIAStateEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setIAStateEnable <= '1';
							IA_StateCullMode <= std_logic_vector(localIncomingPacket.payload0(1 downto 0) );
							IA_StatePrimTopology <= std_logic_vector(localIncomingPacket.payload0(10 downto 8) );
							IA_StateStripCutType <= std_logic_vector(localIncomingPacket.payload0(17 downto 16) );
							IA_StateIndexFormat <= std_logic_vector(localIncomingPacket.payload0(25 downto 24) );
						end if;

					when ISSUE_CLEARBLOCK =>
						if (CMD_ClearBlock_Idle = '1') then
							CLEAR_BaseRenderTargetAddr <= std_logic_vector(localIncomingPacket.payload1(29 downto 0) );
							CLEAR_ClearColorRGBA <= std_logic_vector(localIncomingPacket.payload0);
							CLEAR_ClearDRAMLineCount <= std_logic_vector(to_unsigned(640*480*4/32, 16) );
							CLEAR_ClearBlockBeginSignal <= '1';
							mst_packet_state <= ISSUE_CLEARBLOCK_DEASSERT;
						end if;

					when ISSUE_CLEARBLOCK_DEASSERT =>
						CLEAR_ClearBlockBeginSignal <= '0';
						mst_packet_state <= CLEARBLOCK_SYNC_ROP;

					when CLEARBLOCK_SYNC_ROP =>
						ROP_SetClearColor <= std_logic_vector(localIncomingPacket.payload0);
						if (setROPClearEnable = '1' and ROP_ClearSignalAck = '1') then
							setROPClearEnable <= '0';
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setROPClearEnable <= '1';
						end if;

					when FLUSH_ROP_CACHE =>
						if (flushROPCache = '1' and ROP_FlushCacheAck = '1') then
							flushROPCache <= '0';
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							flushROPCache <= '1';
						end if;

					when SIGNAL_END_OF_FRAME_STATS =>
						if (STAT_StatsSaveComplete = '1') then
							STAT_PresentSignal <= '0';
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							STAT_PresentSignal <= '1';
							STAT_WriteFrameStatsAddress <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
						end if;

					when BEGIN_EXECUTE_COMMAND_LIST =>
						commandListState.currentReadAddress <= localIncomingPacket.payload0(29 downto 0);
						commandListState.numRemainingCommands <= localIncomingPacket.payload1(15 downto 0);
						commandListState.numCommandsThisDRAMRead <= (others => '0');
						mst_packet_state <= COMMAND_LIST_LOAD_NEXT_DRAM_LINE;

					when COMMAND_LIST_LOAD_NEXT_DRAM_LINE =>
						if (CommandProcReadRequestsFIFO_full = '0') then
							CommandProcReadRequestsFIFO_wr_data <= std_logic_vector(commandListState.currentReadAddress);
							CommandProcReadRequestsFIFO_wr_en <= '1';
							mst_packet_state <= COMMAND_LIST_WAIT_FOR_NEXT_DRAM_LINE;
						end if;

					when COMMAND_LIST_WAIT_FOR_NEXT_DRAM_LINE =>
						CommandProcReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
						if (CommandProcReadResponsesFIFO_empty = '0') then
							CommandProcReadResponsesFIFO_rd_en <= '1';
							commandListState.numCommandsThisDRAMRead <= to_unsigned(SIMPLIFIED_PACKETS_PER_DRAM_ROW, 2);
							commandListState.currentPacketMemoryDRAMLine <= unsigned(CommandProcReadResponsesFIFO_rd_data(215 downto 0) );
							mst_packet_state <= COMMAND_LIST_FINISH_DRAM_READ;
						else
							CommandProcReadResponsesFIFO_rd_en <= '0';
						end if;

					when COMMAND_LIST_FINISH_DRAM_READ =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

				end case;
			end if;
		end if;
	end process;                                                                                                                    

end Behavioral;
