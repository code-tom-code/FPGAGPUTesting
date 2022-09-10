library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Include our packet types library so we can access all of the shared enums and struct definitions in there
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
		CMD_Depth_Idle : in STD_LOGIC;
	-- Idle signals from the various systems end

	-- Shader Core interfaces begin
		SHADER_IsReadyForCommand : in STD_LOGIC;
		SHADER_InCommand : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- 000 = do nothing; 010 = LoadProgram; 001 = SetConstant; 011 = SetVertexStream; 100 = BeginShading
		SHADER_LoadProgramAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		SHADER_LoadProgramLen : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- The length of the instruction stream for this shader, in instruction tokens (QWORD's in this case)
		SHADER_SetConstantIndex : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		SHADER_SetConstantData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		SHADER_SetNumVertexStreams : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		SHADER_SetVertexStreamID : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		SHADER_SetVertexStreamDWORDCount : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		SHADER_SetVertexStreamIsD3DCOLOR : out STD_LOGIC := '0';
		SHADER_SetVertexStreamShaderRegIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		SHADER_SetVertexStreamDWORDStride : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0'); -- Number of DWORD's between consecutive vertex stream elements (may be 0)
		SHADER_SetVertexStreamDWORDOffset : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0'); -- Number of DWORD's offset from the start of the vertex to this element
		SHADER_ReadRegisterOutRequest : out STD_LOGIC := '0';
		SHADER_ReadRegisterOutDataReady : in STD_LOGIC;
		SHADER_ReadRegisterOutData : in STD_LOGIC_VECTOR(127 downto 0);
	-- Shader Core interfaces end

	-- Input Assembler interfaces begin
		-- Draw interfaces:
		IA_DrawReady : in STD_LOGIC;

		-- Set state interfaces:
		IA_SetStateReady : in STD_LOGIC;
		IA_SetStateEnable : out STD_LOGIC := '0';
		IA_IndexBufferBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		IA_StateCullMode : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		IA_StatePrimTopology : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		IA_StateStripCutType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		IA_StateIndexFormat : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
	-- Input Assembler interfaces end

	-- Vertex Batch Builder interfaces begin
		VBB_SendCommand : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		VBB_CommandArg0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- Used for our index buffer address (SetIndexBuffer), as well as our primitive count (DrawPrimitive/DrawIndexedPrimitive)
		VBB_CommandArg1 : out STD_LOGIC_VECTOR(19 downto 0) := (others => '0'); -- Used for our uint StartIndex
		VBB_CommandArg2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Used for our signed short BaseVertexIndex
		VBB_CommandArgType : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- Transmits our PrimitiveType
		VBB_ReadyState : in STD_LOGIC;
	-- Vertex Batch Builder interfaces end

	-- Depth Buffer interfaces begin
		DEPTH_ClearDepthBuffer : out STD_LOGIC := '0';
		DEPTH_ClearDepthValue : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DEPTH_DepthWriteEnable : out STD_LOGIC := '0';
		DEPTH_DepthFunction : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_SetDepthParams : out STD_LOGIC := '0';
	-- Depth Buffer interfaces end

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
		ROP_SetBaseAddrAndAlphaTestSignal : out STD_LOGIC := '0';
		ROP_SetBaseAddrAndAlphaTestSignalAck : in STD_LOGIC;

		ROP_SetClearColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ROP_ClearSignal : out STD_LOGIC := '0';
		ROP_ClearSignalAck : in STD_LOGIC;

		ROP_FlushCacheSignal : out STD_LOGIC := '0';
		ROP_FlushCacheAck : in STD_LOGIC;

		ROP_SetRenderTargetBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		ROP_SetWriteMask : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		ROP_SetAlphaTestEnabled : out STD_LOGIC := '0';
		ROP_SetAlphaTestRefVal : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		ROP_SetAlphaTestFunc : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

		ROP_SetBlendStateSignal : out STD_LOGIC := '0';
		ROP_SetBlendStateSigAck : in STD_LOGIC;
		ROP_SetAlphaBlendEnable : out STD_LOGIC := '0';
		ROP_SetAlphaBlendFactor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ROP_SetAlphaBlendStateBlock : out STD_LOGIC_VECTOR(21 downto 0) := (others => '0');
	-- ROP interfaces begin

	-- Scanout interfaces begin
		SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		SCANOUT_ScanEnable : out STD_LOGIC := '0';
		SCANOUT_InvertOutputColor : out STD_LOGIC := '0';
		SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
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

		DBG_IdleSignalsVector : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		);
end CommandProcessor;

architecture Behavioral of CommandProcessor is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

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

						Removed13, -- LOAD_VERTSTREAM_DATA, -- 13
						LOAD_TEXTURE_DATA, -- 14

						WAIT_FOR_IDLE, -- 15
						WAIT_FOR_IDLE_SIGNAL_BACK, -- 16
						WAIT_FOR_IDLE_SIGNAL_BACK_DEASSERT_FIFO, -- 17

						SET_TEXTURE_STATE, -- 18
						SET_ALPHATEST_AND_RENDERTARGET_STATE, -- 19
						SET_SCANOUT_POINTER, -- 20
						SET_IA_STATE, -- 21

						ISSUE_CLEARBLOCK, -- 22
						ISSUE_CLEARBLOCK_DEASSERT, -- 23
						CLEARBLOCK_SYNC_ROP, -- 24

						FLUSH_ROP_CACHE, -- 25

						SIGNAL_END_OF_FRAME_STATS, -- 26

						DRAW_COMMAND, -- 27
						DRAW_COMMAND2, -- 28

						BEGIN_EXECUTE_COMMAND_LIST, -- 29
						COMMAND_LIST_LOAD_NEXT_DRAM_LINE, -- 30
						COMMAND_LIST_WAIT_FOR_NEXT_DRAM_LINE, -- 31
						COMMAND_LIST_FINISH_DRAM_READ, -- 32

						LOAD_SHADER_INSTRUCTIONS, -- 33
						SET_SHADER_CONSTANT, -- 34
						SET_SHADER_CONSTANT2, -- 35
						SET_SHADER_CONSTANT_WAIT_FOR_MEMORY, -- 36
						SET_SHADER_CONSTANT_WAIT_FOR_MEMORY_COOLDOWN, -- 37
						SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER, -- 38
						SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER_COOLDOWN, -- 39
						SET_VERTEX_STREAM_DATA, -- 40
						SET_INDEX_BUFFER, -- 41
						SET_SHADER_CONSTANT_SPECIAL, -- 42
						SET_SHADER_START_ADDRESS, -- 43

						SET_DEPTH_STATE, -- 44
						INITIATE_DEPTH_BUFFER_CLEAR, -- 45

						DBG_SHADER_NEXT_DRAW_CALL, -- 46
						DBG_DUMP_SHADER_REGISTERS, -- 47
						DBG_DUMP_SHADER_REGISTERS_HIGH, -- 48
						DBG_DUMP_SHADER_REGISTERS_MEMWRITE, -- 49

						SET_BLEND_STATE -- 50
						);

	type commandListExecState is record
		currentReadAddress : unsigned(29 downto 0);
		numRemainingCommands : unsigned(15 downto 0);
		numCommandsThisDRAMRead : unsigned(1 downto 0);
		currentPacketMemoryDRAMLine : unsigned(215 downto 0);
	end record commandListExecState;

	type scanoutSendState is record
		RenderTargetBaseAddr : STD_LOGIC_VECTOR(29 downto 0);
		ScanEnable : STD_LOGIC;
		InvertOutputColor : STD_LOGIC;
		OutputColorChannels : STD_LOGIC_VECTOR(8 downto 0);
	end record scanoutSendState;

	constant DefaultScanoutSendState : scanoutSendState := (RenderTargetBaseAddr => (others => '0'), ScanEnable => '0', InvertOutputColor => '0', OutputColorChannels => "010001000" );

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
	signal loadTexDataEnable : std_logic := '0';
	signal setTexStateEnable : std_logic := '0';
	signal setAlphaTestAndRenderTargetStateEnable : std_logic := '0';
	signal setBlendStateEnable : std_logic := '0';
	signal setIAStateEnable : std_logic := '0';
	signal setROPClearEnable : std_logic := '0';
	signal flushROPCache : std_logic := '0';
	signal shaderStartAddress : unsigned(8 downto 0) := (others => '0');

	signal debugShaderRegistersSet : std_logic := '0';
	signal debugShaderRegistersTransactionsCount : unsigned(9 downto 0) := (others => '0');
	signal debugShaderRegistersDumpAddr : unsigned(29 downto 0) := (others => '0');
	signal debugShaderRegistersData : unsigned(255 downto 0) := (others => '0');

	signal constantBufferLoadAddr : unsigned(29 downto 0) := (others => '0');
	signal constantBufferLoadRegisterIndex : unsigned(7 downto 0) := (others => '0');
	signal constantBufferLoadRemainingRegs : unsigned(7 downto 0) := (others => '0');

	signal currentScanoutSendState : scanoutSendState := DefaultScanoutSendState;

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
	signal DepthBufferIdleSig : STD_LOGIC := '0';
	
	signal CombinedIdleSignals : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

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

	pure function DecodeSpecialConstantToFloat32(isNegative : std_logic; isPow2 : std_logic; isSpecValue : std_logic; index : unsigned(3 downto 0) ) return unsigned is
	begin
		if (isPow2 = '1') then
			return isNegative & (to_unsigned(120, 8) + index) & "00000000000000000000000"; -- Calculate the power of 2 as a float and return that
		else -- Assuming that isSpecValue must be true here
			case index is
				when X"1" =>
					return isNegative & "100" & X"0490FDB"; -- This is pi
				when X"2" =>
					return isNegative & "100" & X"02DF854"; -- This is e
				when X"3" =>
					return isNegative & "100" & X"0C90FDB"; -- This is 2pi
				when X"4" =>
					return isNegative & "100" & X"37F0000"; -- This is 255.0f
				when X"5" =>
					return isNegative & "010" & X"B808081"; -- This is 1.0f/255.0f
				when others => --when 0 =>
					return isNegative & "0000000000000000000000000000000"; -- Return +/- 0.0f
			end case;
		end if;
	end function;

	pure function DecodeSpecialConstantBitsToFloat32(specialConstantBits : unsigned(6 downto 0) ) return unsigned is
	begin
		return DecodeSpecialConstantToFloat32(specialConstantBits(0), specialConstantBits(1), specialConstantBits(2), specialConstantBits(6 downto 3) );
	end function;

begin
	TEXSAMP_LoadTexCacheBeginSignal <= loadTexDataEnable;
	TEXSAMP_SetTextureStateBeginSignal <= setTexStateEnable;
	ROP_SetBaseAddrAndAlphaTestSignal <= setAlphaTestAndRenderTargetStateEnable;
	ROP_SetBlendStateSignal <= setBlendStateEnable;
	ROP_ClearSignal <= setROPClearEnable;
	ROP_FlushCacheSignal <= flushROPCache;
	IA_SetStateEnable <= setIAStateEnable;

	SCANOUT_ScanEnable <= currentScanoutSendState.ScanEnable;
	SCANOUT_RenderTargetBaseAddr <= currentScanoutSendState.RenderTargetBaseAddr;
	SCANOUT_InvertOutputColor <= currentScanoutSendState.InvertOutputColor;
	SCANOUT_OutputColorChannels <= currentScanoutSendState.OutputColorChannels;

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

	process(clk)
	begin
		if (rising_edge(clk) ) then
			CombinedIdleSignals <= DepthBufferIdleSig & MemControllerIdleSig & ROPIdleSig & ClearBlockIdleSig & TexSamplerIdleSig & VSyncResolvedSig & RasterizerIdleSig & IAIdleSig;

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
			DepthBufferIdleSig <= CMD_Depth_Idle;
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
						-- Deassert these signals after one clock cycle
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(DoNothingCommand), 3) );
						VBB_SendCommand <= std_logic_vector(to_unsigned(eVBB_CMDPacket'pos(NoCommand), 2) );
						DEPTH_SetDepthParams <= '0';
						DEPTH_ClearDepthBuffer <= '0';
						CommandProcReadResponsesFIFO_rd_en <= '0';

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

						case (ePacketType'val(to_integer(unsigned(localIncomingPacket.packetTypeByte) ) ) ) is
							when PT_WRITEMEM =>
								mst_packet_state <= WRITEMEM_PACKET;

							when PT_READMEM =>
								mst_packet_state <= READMEM_PACKET;

							when PT_CLEARMEM =>
								mst_packet_state <= CLEARMEM_PACKET;

							when PT_CLEARBACKBUFFER =>
								mst_packet_state <= ISSUE_CLEARBLOCK;

							when PT_CLEARZSTENCILBUFFER =>
								mst_packet_state <= INITIATE_DEPTH_BUFFER_CLEAR;

							when PT_LOADTEXCACHEDATA =>
								mst_packet_state <= LOAD_TEXTURE_DATA;

							when PT_SETALPHATESTANDRTADDRESSSTATE =>
								mst_packet_state <= SET_ALPHATEST_AND_RENDERTARGET_STATE;

							when PT_SETTEXTURESTATE =>
								mst_packet_state <= SET_TEXTURE_STATE;

							when PT_WAITFORDEVICEIDLE =>
								mst_packet_state <= WAIT_FOR_IDLE;

							when PT_DRAWINDEXED =>
								mst_packet_state <= DRAW_COMMAND;

							when PT_SETSCANOUTPOINTER =>
								mst_packet_state <= SET_SCANOUT_POINTER;

							when PT_SETIASTATE =>
								mst_packet_state <= SET_IA_STATE;

							when PT_FLUSHROPCACHE =>
								mst_packet_state <= FLUSH_ROP_CACHE;

							when PT_ENDFRAME =>
								mst_packet_state <= SIGNAL_END_OF_FRAME_STATS;

							when PT_RUNCOMMANDLIST =>
								mst_packet_state <= BEGIN_EXECUTE_COMMAND_LIST;

							when PT_LOADSHADERINSTRUCTIONS =>
								mst_packet_state <= LOAD_SHADER_INSTRUCTIONS;

							when PT_SETSHADERCONSTANT =>
								mst_packet_state <= SET_SHADER_CONSTANT;

							when PT_SETVERTEXSTREAMDATA =>
								mst_packet_state <= SET_VERTEX_STREAM_DATA;

							when PT_SETINDEXBUFFER =>
								mst_packet_state <= SET_INDEX_BUFFER;

							when PT_SETSHADERCONSTANTSPECIAL =>
								mst_packet_state <= SET_SHADER_CONSTANT_SPECIAL;

							when PT_SETSHADERSTARTADDRESS =>
								mst_packet_state <= SET_SHADER_START_ADDRESS;

							when PT_DEBUGSHADERNEXTDRAWCALL =>
								mst_packet_state <= DBG_SHADER_NEXT_DRAW_CALL;

							when PT_SETDEPTHSTATE =>
								mst_packet_state <= SET_DEPTH_STATE;

							when PT_SETBLENDSTATE =>
								mst_packet_state <= SET_BLEND_STATE;

							when others => --when PT_DONOTHING =>
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
						-- The wait is completed when ( (waitFlags & waitSignals) == waitFlags):
						if ( (localIncomingPacket.payload0(7 downto 0) and 
							unsigned(CombinedIdleSignals) ) = localIncomingPacket.payload0(7 downto 0) ) then
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

					when SET_ALPHATEST_AND_RENDERTARGET_STATE =>
						if (setAlphaTestAndRenderTargetStateEnable = '1' and ROP_SetBaseAddrAndAlphaTestSignalAck = '1') then
							setAlphaTestAndRenderTargetStateEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setAlphaTestAndRenderTargetStateEnable <= '1';

							ROP_SetRenderTargetBaseAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
							ROP_SetWriteMask <= std_logic_vector(localIncomingPacket.payload1(3 downto 0) );
							ROP_SetAlphaTestEnabled <= localIncomingPacket.payload1(10);
							ROP_SetAlphaTestRefVal <= std_logic_vector(localIncomingPacket.payload1(23 downto 16) );
							ROP_SetAlphaTestFunc <= std_logic_vector(localIncomingPacket.payload1(26 downto 24) );
						end if;

					when SET_BLEND_STATE =>
						if (setBlendStateEnable = '1' and ROP_SetBlendStateSigAck = '1') then
							setBlendStateEnable <= '0'; -- Deassert after one clock cycle
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							setBlendStateEnable <= '1';

							ROP_SetAlphaBlendEnable <= std_logic(localIncomingPacket.payload0(31) );
							ROP_SetAlphaBlendStateBlock <= std_logic_vector(localIncomingPacket.payload0(21 downto 0) );
							ROP_SetAlphaBlendFactor <= std_logic_vector(localIncomingPacket.payload1);
						end if;

					when DRAW_COMMAND =>
						-- Wait for the whole IA system (VBB, ShaderCore, and IA) to be ready before we kick off a new draw call:
						if (IA_DrawReady = '1' and VBB_ReadyState = '1' and SHADER_IsReadyForCommand = '1') then
							
							-- Signal to the VBB to begin collecting vertices and batching them up for our draw call:
							if (localIncomingPacket.payload0(24) = '1') then
								VBB_SendCommand <= std_logic_vector(to_unsigned(eVBB_CMDPacket'pos(DrawIndexedPrimitive), 2) );
								VBB_CommandArg2 <= std_logic_vector(localIncomingPacket.payload1(28 downto 13) );
							else
								VBB_SendCommand <= std_logic_vector(to_unsigned(eVBB_CMDPacket'pos(DrawPrimitive), 2) );
								VBB_CommandArg2 <= (others => '0');
							end if;
							VBB_CommandArg0 <= "00000000" & std_logic_vector(localIncomingPacket.payload0(23 downto 0) );
							VBB_CommandArg1 <= std_logic_vector(localIncomingPacket.payload0(31 downto 25) ) & std_logic_vector(localIncomingPacket.payload1(12 downto 0) );
							VBB_CommandArgType <= std_logic_vector(localIncomingPacket.payload1(31 downto 29) );
							mst_packet_state <= DRAW_COMMAND2;
						end if;

					when DRAW_COMMAND2 =>
						-- Signal to the shader core to begin shading
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(StartShadingWorkCommand), 3) );
						SHADER_LoadProgramAddr <= "000000000000000000000" & std_logic_vector(shaderStartAddress); -- Start from our shader start address
						if (debugShaderRegistersSet = '1') then
							debugShaderRegistersTransactionsCount <= to_unsigned(512, 10);
							mst_packet_state <= DBG_DUMP_SHADER_REGISTERS;
						else
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when SET_SCANOUT_POINTER =>
						currentScanoutSendState.RenderTargetBaseAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
						currentScanoutSendState.ScanEnable <= localIncomingPacket.payload1(0);
						currentScanoutSendState.InvertOutputColor <= localIncomingPacket.payload1(1);
						currentScanoutSendState.OutputColorChannels <= std_logic_vector(localIncomingPacket.payload1(16 downto 8) );
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
							IA_IndexBufferBaseAddr <= std_logic_vector(localIncomingPacket.payload1(29 downto 0) );
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

					when LOAD_SHADER_INSTRUCTIONS =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (SHADER_IsReadyForCommand = '1') then
							SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(LoadProgramCommand), 3) );
							SHADER_LoadProgramAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
							SHADER_LoadProgramLen <= std_logic_vector(localIncomingPacket.payload1(15 downto 0) );
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when SET_SHADER_CONSTANT =>
							if (localIncomingPacket.payload1(15 downto 8) = 0) then
								mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
							else
								if (CommandProcReadRequestsFIFO_full = '0') then
									constantBufferLoadAddr <= localIncomingPacket.payload0(29 downto 0);
									constantBufferLoadRemainingRegs <= localIncomingPacket.payload1(15 downto 8);
									constantBufferLoadRegisterIndex <= localIncomingPacket.payload1(7 downto 0);
									mst_packet_state <= SET_SHADER_CONSTANT2;
								end if;
							end if;

					when SET_SHADER_CONSTANT2 =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (constantBufferLoadRemainingRegs = 0) then
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						else
							if (CommandProcReadRequestsFIFO_full = '0') then
								CommandProcReadRequestsFIFO_wr_data <= std_logic_vector(constantBufferLoadAddr);
								CommandProcReadRequestsFIFO_wr_en <= '1';
								mst_packet_state <= SET_SHADER_CONSTANT_WAIT_FOR_MEMORY;
							end if;
						end if;

					when SET_SHADER_CONSTANT_WAIT_FOR_MEMORY =>
						CommandProcReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(DoNothingCommand), 3) );
						if (CommandProcReadResponsesFIFO_empty = '0') then
							if (SHADER_IsReadyForCommand = '1') then
								SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(SetShaderConstantFCommand), 3) );
								SHADER_SetConstantIndex <= std_logic_vector(constantBufferLoadRegisterIndex);
								constantBufferLoadRegisterIndex <= constantBufferLoadRegisterIndex + 1;
								SHADER_SetConstantData <= CommandProcReadResponsesFIFO_rd_data(127 downto 0);
								CommandProcReadResponsesFIFO_rd_en <= '1';
								if (constantBufferLoadRemainingRegs > 1) then
									constantBufferLoadRemainingRegs <= constantBufferLoadRemainingRegs - 1;
									mst_packet_state <= SET_SHADER_CONSTANT_WAIT_FOR_MEMORY_COOLDOWN;
								else
									mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
								end if;
							end if;
						end if;

					when SET_SHADER_CONSTANT_WAIT_FOR_MEMORY_COOLDOWN =>
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(DoNothingCommand), 3) );
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (SHADER_IsReadyForCommand = '1' and CommandProcReadRequestsFIFO_full = '0') then
							constantBufferLoadAddr <= constantBufferLoadAddr + 32;
							mst_packet_state <= SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER;
						end if;

					when SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(DoNothingCommand), 3) );
						if (SHADER_IsReadyForCommand = '1' and CommandProcReadRequestsFIFO_full = '0') then
							SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(SetShaderConstantFCommand), 3) );
							SHADER_SetConstantIndex <= std_logic_vector(constantBufferLoadRegisterIndex);
							SHADER_SetConstantData <= CommandProcReadResponsesFIFO_rd_data(255 downto 128);
							CommandProcReadResponsesFIFO_rd_en <= '1';
							if (constantBufferLoadRemainingRegs > 1) then
								constantBufferLoadRegisterIndex <= constantBufferLoadRegisterIndex + 1;
								constantBufferLoadRemainingRegs <= constantBufferLoadRemainingRegs - 1;
								CommandProcReadRequestsFIFO_wr_data <= std_logic_vector(constantBufferLoadAddr);
								CommandProcReadRequestsFIFO_wr_en <= '1';
								mst_packet_state <= SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER_COOLDOWN;
							else
								mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
							end if;
						end if;

					when SET_SHADER_CONSTANT_WAIT_FOR_SEND_HIGH_REGISTER_COOLDOWN =>
						CommandProcReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(DoNothingCommand), 3) );
						if (SHADER_IsReadyForCommand = '1' and CommandProcReadResponsesFIFO_empty = '0') then
							mst_packet_state <= SET_SHADER_CONSTANT_WAIT_FOR_MEMORY;
						end if;

					when SET_SHADER_CONSTANT_SPECIAL =>
						if (SHADER_IsReadyForCommand = '1') then
							SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(SetShaderConstantFCommand), 3) );
							SHADER_SetConstantIndex <= std_logic_vector(localIncomingPacket.payload0(7 downto 0) );
							SHADER_SetConstantData(31 downto 0) <= std_logic_vector(DecodeSpecialConstantBitsToFloat32(localIncomingPacket.payload0(14 downto 8) ) );
							SHADER_SetConstantData(63 downto 32) <= std_logic_vector(DecodeSpecialConstantBitsToFloat32(localIncomingPacket.payload0(31 downto 25) ) );
							SHADER_SetConstantData(95 downto 64) <= std_logic_vector(DecodeSpecialConstantBitsToFloat32(localIncomingPacket.payload1(6 downto 0) ) );
							SHADER_SetConstantData(127 downto 96) <= std_logic_vector(DecodeSpecialConstantBitsToFloat32(localIncomingPacket.payload1(31 downto 25) ) );
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when SET_VERTEX_STREAM_DATA =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (SHADER_IsReadyForCommand = '1') then
							SHADER_InCommand <= std_logic_vector(to_unsigned(eShaderCMDPacket'pos(IASetVertexStreamCommand), 3) );
							SHADER_SetVertexStreamID <= std_logic_vector(localIncomingPacket.payload1(2 downto 0) );
							SHADER_LoadProgramAddr <= std_logic_vector(localIncomingPacket.payload0(29 downto 0) );
							SHADER_SetNumVertexStreams <= std_logic_vector(localIncomingPacket.payload1(21 downto 19) );
							SHADER_SetVertexStreamDWORDCount <= std_logic_vector( ('0' & localIncomingPacket.payload0(31 downto 30) ) + 1);
							SHADER_SetVertexStreamIsD3DCOLOR <= std_logic(localIncomingPacket.payload1(3) );
							SHADER_SetVertexStreamShaderRegIndex <= std_logic_vector(localIncomingPacket.payload1(6 downto 4) );
							SHADER_SetVertexStreamDWORDStride <= std_logic_vector(localIncomingPacket.payload1(12 downto 7) );
							SHADER_SetVertexStreamDWORDOffset <= std_logic_vector(localIncomingPacket.payload1(18 downto 13) );

							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when SET_INDEX_BUFFER =>
						CommandProcReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
						if (VBB_ReadyState = '1') then
							VBB_SendCommand <= std_logic_vector(to_unsigned(eVBB_CMDPacket'pos(SetIndexBuffer), 2) );
							VBB_CommandArg0 <= std_logic_vector(localIncomingPacket.payload0);
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when SET_SHADER_START_ADDRESS =>
						shaderStartAddress <= localIncomingPacket.payload0(8 downto 0);
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when DBG_SHADER_NEXT_DRAW_CALL =>
						debugShaderRegistersSet <= '1';
						debugShaderRegistersDumpAddr <= localIncomingPacket.payload0(29 downto 0);
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

					when DBG_DUMP_SHADER_REGISTERS =>
						debugShaderRegistersSet <= '0';
						CommandProcWriteRequestsFIFO_wr_en <= '0';
						if (debugShaderRegistersTransactionsCount = to_unsigned(0, 10) ) then
							SHADER_ReadRegisterOutRequest <= '0';
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						elsif (SHADER_ReadRegisterOutDataReady = '1') then
							debugShaderRegistersData(127 downto 0) <= unsigned(SHADER_ReadRegisterOutData);
							debugShaderRegistersTransactionsCount <= debugShaderRegistersTransactionsCount - 1;
							SHADER_ReadRegisterOutRequest <= '1';
							mst_packet_state <= DBG_DUMP_SHADER_REGISTERS_HIGH;
						else
							SHADER_ReadRegisterOutRequest <= '1';
						end if;

					when DBG_DUMP_SHADER_REGISTERS_HIGH =>
						if (SHADER_ReadRegisterOutDataReady = '1') then
							SHADER_ReadRegisterOutRequest <= '0';
							debugShaderRegistersData(255 downto 128) <= unsigned(SHADER_ReadRegisterOutData);
							debugShaderRegistersTransactionsCount <= debugShaderRegistersTransactionsCount - 1;
							mst_packet_state <= DBG_DUMP_SHADER_REGISTERS_MEMWRITE;
						else
							SHADER_ReadRegisterOutRequest <= '1';
						end if;

					when DBG_DUMP_SHADER_REGISTERS_MEMWRITE =>
						if (CommandProcWriteRequestsFIFO_full = '0') then
							CommandProcWriteRequestsFIFO_wr_en <= '1';
							CommandProcWriteRequestsFIFO_wr_data <= std_logic_vector(debugShaderRegistersDumpAddr) & std_logic_vector(debugShaderRegistersData) & "11111111";
							debugShaderRegistersDumpAddr <= debugShaderRegistersDumpAddr + 32;
							mst_packet_state <= DBG_DUMP_SHADER_REGISTERS;
						else
							CommandProcWriteRequestsFIFO_wr_en <= '0';
						end if;

					when SET_DEPTH_STATE =>
						if (DepthBufferIdleSig = '1' and CMD_Depth_Idle = '1') then
							DEPTH_SetDepthParams <= '1';
							DEPTH_DepthFunction <= std_logic_vector(localIncomingPacket.payload0(2 downto 0) );
							DEPTH_DepthWriteEnable <= localIncomingPacket.payload0(8);
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					when INITIATE_DEPTH_BUFFER_CLEAR =>
						if (DepthBufferIdleSig = '1' and CMD_Depth_Idle = '1') then
							DEPTH_ClearDepthBuffer <= '1';
							DEPTH_ClearDepthValue <= '1' & std_logic_vector(localIncomingPacket.payload0(22 downto 0) );
							mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;
						end if;

					-- Removed! May repurpose this case
					when Removed13 =>
						mst_packet_state <= READ_NEXT_PACKET_FROM_FIFO;

				end case;
			end if;
		end if;
	end process;                                                                                                                    

end Behavioral;
