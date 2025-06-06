library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;

package PacketType is

	constant MAGIC_PACKET_BYTE_VALUE : integer := 67; -- This is 'C' in ASCII

	constant PACKET_SIZE_IN_BYTES : integer := 11; -- Make sure to update this if the packet size increases on the C++ side

	constant SIMPLIFIED_PACKET_SIZE_IN_BYTES : integer := 9; -- Make sure to update this if the packet size increases on the C++ side
	constant SIMPLIFIED_PACKETS_PER_DRAM_ROW : integer := 32 / SIMPLIFIED_PACKET_SIZE_IN_BYTES; -- Should be equal to 3

	constant PER_FRAME_STATS_COUNT : integer := 36;

	type packetBytesArray is array (PACKET_SIZE_IN_BYTES-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);

	-- Be sure that if the C++ side enum changes to update this here too! Unknown packet types will simply get dropped!
	type ePacketType is
	(
		PT_DONOTHING, -- 0 -- DONOTHING is meant as a no-op packet that does nothing
		PT_WRITEMEM, -- 1
		PT_READMEM, -- 2
		PT_READMEMRESPONSE, -- 3
		PT_CLEARMEM, -- 4
		PT_CLEARBACKBUFFER, -- 5
		PT_CLEARZSTENCILBUFFER, -- 6
		PT_LOADVERTSTREAMDATA, -- 7 -- Note that this packet is executed with an implicit "wait for IA idle", since it cannot load new vertex data while the IA is still using it
		PT_LOADTEXCACHEDATA, -- 8
		PT_SETALPHATESTANDRTADDRESSSTATE, -- 9
		PT_SETTEXTURESTATE, -- 10
		PT_WAITFORDEVICEIDLE, -- 11
		PT_WAITRESPONSE, -- 12
		PT_DRAWINDEXED, -- 13
		PT_SETSCANOUTPOINTER, -- 14
		PT_SETIASTATE, -- 15
		PT_FLUSHROPCACHE, -- 16
		PT_ENDFRAMESTATS, -- 17
		PT_ENDFRAME, -- 18
		PT_RUNCOMMANDLIST, -- 19
		PT_LOADSHADERINSTRUCTIONS, -- 20
		PT_SETSHADERCONSTANT, -- 21
		PT_SETVERTEXSTREAMDATA, -- 22
		PT_SETSTATSEVENTCONFIG, -- 23
		PT_SETSHADERCONSTANTSPECIAL, -- 24
		PT_SETSHADERSTARTADDRESS, -- 25
		PT_DEBUGSHADERNEXTDRAWCALL, -- 26
		PT_SETDEPTHSTATE, -- 27
		PT_SETBLENDSTATE, -- 28
		PT_CONNBROADCAST, -- 29
		PT_CONNREQUEST, -- 30
		PT_CONNRESPONSE, -- 31
		PT_SESSIONCOMBOPACKET, -- 32
		PT_DISCONNECT, -- 33
		PT_SETCLIPSTATE, -- 34
		PT_ISSUEQUERY, -- 35
		PT_SETVIEWPORTPARAMS0, -- 36
		PT_SETVIEWPORTPARAMS1, -- 37
		PT_SETSCISSORRECT, -- 38
		PT_SETINTERPOLATORSTATE, -- 39
		PT_WRITEMEMBATCHCONFIG, -- 40
		PT_WRITEMEMBATCH0, -- 41
		PT_WRITEMEMBATCH1, -- 42
		PT_WRITEMEMBATCH2, -- 43
		PT_WRITEMEMBATCH3WRITE, -- 44
		PT_SETSTENCILSTATE, -- 45

		PT_MAX_PACKET_TYPES -- Must always be last!
	);

	-- Sent from the command processor to the ShaderCore
	type eShaderCMDPacket is
	(
		DoNothingCommand, -- 0 : Do nothing
		LoadProgramCommand, -- 1 : LoadProgram (uint32 prog addr, uint16 prog len)
		SetShaderConstantFCommand, -- 2 : SetShaderConstantF (uint8 constant register index c#, float4 value)
		IASetVertexStreamCommand, -- 3 : IASetVertexStream(uint3 streamID, uint32 streamBaseAddress, uint2 dwordCount, bool isD3DCOLOR, uint3 shaderRegIndex, uint6 dwordStride, uint6 dwordOffset)
		StartShadingWorkCommand -- 4 : StartShadingWork(uint9 setShaderStartAddress)
	);

	-- Sent from the command processor to the Vertex Batch Builder
	type eVBB_CMDPacket is
	(
		NoCommand, -- 0
		DrawPrimitive, -- 1
		DrawIndexedPrimitive -- 2
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type loadVertexStreamType is
	(
		VST_xPos, -- 0
		VST_yPos, -- 1
		VST_invZPos, -- 2
		VST_tx, -- 3
		VST_ty, -- 4
		VST_vertColor, -- 5
		VST_index, -- 6

		VST_MAX_TYPES -- Must always be last!
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type eCullMode is
	(
		CM_CullCCW, -- 0
		CM_CullCW, -- 1
		CM_CullNone -- 2
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type eTexcoordAddressingMode is
	(
		TAM_Wrap, -- 0
		TAM_Clamp, -- 1
		TAM_Mirror, -- 2
		TAM_BorderColor, -- 3
		TAM_MirrorOnce -- 4
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type ePrimTopology is
	(
		PRIMTOP_PointList, -- 0
		PRIMTOP_LineList, -- 1
		PRIMTOP_LineStrip, -- 2
		PRIMTOP_TriangleList, -- 3
		PRIMTOP_TriangleStrip, -- 4
		PRIMTOP_TriangleFan, -- 5
		PRIMTOP_ScreenAlignedQuad -- 6
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type eStripCutType is
	(
		SCT_CutDisabled, -- 0
		SCT_Cut0xFFFF, -- 1
		SCT_Cut0xFFFFFFFF -- 2
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type eIndexFormat is
	(
		IBFMT_NoIndices, -- 0
		IBFMT_Index8, -- 1
		IBFMT_Index16, -- 2
		IBFMT_Index32 -- 3
	);

	-- Be sure that if the C++ side enum changes to update this here too!
	type texChannelMUX is
	(
		TCM_R, -- 0
		TCM_G, -- 1
		TCM_B, -- 2
		TCM_A, -- 3
		TCM_0, -- 4
		TCM_1 -- 5
	);

	-- Note that this exactly matches the D3DCMPFUNC enum but is subtracted down by 1 to fit into 3 bits
	type eCmpFunc is
	(
		cmp_never, -- 0
		cmp_less, -- 1
		cmp_equal, -- 2
		cmp_lessequal, -- 3
		cmp_greater, -- 4
		cmp_notequal, -- 5
		cmp_greaterequal, -- 6
		cmp_always -- 7
	);

	type eCombinerMode is
	(
		cbm_allBlack, -- 0
		cbm_allWhite, -- 1
		cbm_textureOnly, -- 2
		cbm_vertexColorOnly, -- 3
		cbm_debugTexcoords, -- 4
		cbm_debugBilinearInterpolants, -- 5
		cbm_textureModulateVertexColor -- 6
	);

	type eTexFormat is
	(
		eTexFmtA8R8G8B8, -- 0
		eTexFmtX8R8G8B8, -- 1
		eTexFmtA4R4G4B4, -- 2
		eTexFmtR5G6B5, -- 3
		eTexFmtA1R5G5B5, -- 4
		eTexFmtX1R5G5B5, -- 5
		eTexFmtX4R4G4B4, -- 6
		eTexFmtA8, -- 7
		eTexFmtL8, -- 8
		eTexFmtDXT1, -- 9
		eTexFmtDXT3, -- 10
		eTexFmtDXT5, -- 11

		eTexFmtNumFormats -- This must always be last!
	);

	type eQueryType is
	(
		eQTEvent, -- 0
		eQTOcclusion, -- 1
		eQTBinaryOcclusion, -- 2
		eQTTimestamp -- 3
	);

	-- Blend mode types available for the RGB channels:
	type blendModeRGB is
	(
		blendRGB_0, -- 0
		blendRGB_srcColor, -- 1
		blendRGB_srcAlpha, -- 2
		blendRGB_destAlpha, -- 3
		blendRGB_destColor, -- 4
		blendRGB_srcAlphaSat, -- 5
		blendRGB_blendFactor -- 6
	);

	-- Blend mode types available for the alpha channel:
	type blendModeA is
	(
		blendA_0, -- 0
		blendA_srcAlpha, -- 1
		blendA_destAlpha, -- 2
		blendA_blendFactor -- 3
	);

	-- Blend ops (available for both RGB and Alpha channels):
	type blendOp is
	(
		bop_add, -- 0
		bop_subtract, -- 1
		bop_revsubtract, -- 2
		bop_min, -- 3
		bop_max -- 4
	);

	type eDepthFormat is
	(
		eDepthFmtD24,
		eDepthFmtD16,
		eDepthFmtD15
	);

	type eStencilOp is
	(
		sop_keep, -- 0
		sop_zero, -- 1
		sop_replace, -- 2
		sop_incr_sat, -- 3
		sop_decr_sat, -- 4
		sop_invert, -- 5
		sop_incr, -- 6
		sop_decr -- 7
	);

	-- Computes the packet checksum byte
	pure function ComputePacketChecksum(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return unsigned;

	 -- Returns '1' if the packet is valid and should be processed, or '0' if the packet should be discarded
	 pure function IsPacketDataValid(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetChecksum : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return std_logic;

	type genericPacket is record
		magicByte : unsigned(7 downto 0); -- Must always be equal to ASCII 'C' (decimal 67, hex 0x43) or else packet gets discarded
		checksum : unsigned(7 downto 0); -- Sum of the whole packet (including the magicByte and the checksum field as if it were set to 0x00)
		packetTypeByte : unsigned(7 downto 0); -- Determines the packet's type (use the ePacketType enum)
		payload0 : unsigned(31 downto 0); -- Use depends upon the type of this packet
		payload1 : unsigned(31 downto 0); -- Use depends upon the type of this packet
	end record genericPacket;

end package PacketType;

package body PacketType is

	pure function ComputePacketChecksum(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return unsigned is
		variable retVal : unsigned(7 downto 0) := (others => '0');
		variable tempByte : unsigned(7 downto 0) := (others => '0');
	begin
		retVal := unsigned(packetMagicHeader);
		retVal := retVal + unsigned(packetTypeByte);
		tempByte := unsigned(packetData0(7 downto 0) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(15 downto 8) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(23 downto 16) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData0(31 downto 24) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(7 downto 0) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(15 downto 8) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(23 downto 16) );
		retVal := retVal + tempByte;
		tempByte := unsigned(packetData1(31 downto 24) );
		retVal := retVal + tempByte;
		return retVal and X"FF";
	end function;

	-- Returns '1' if the packet is valid and should be processed, or '0' if the packet should be discarded
	pure function IsPacketDataValid(packetMagicHeader : STD_LOGIC_VECTOR(7 downto 0);
										packetChecksum : STD_LOGIC_VECTOR(7 downto 0);
										packetTypeByte : STD_LOGIC_VECTOR(7 downto 0);
										packetData0 : STD_LOGIC_VECTOR(31 downto 0);
										packetData1 : STD_LOGIC_VECTOR(31 downto 0) ) return std_logic is
		variable magicByteMatch : std_logic := '0';
		variable checksumMatch : std_logic := '0';
		variable packetTypeInRange : std_logic := '0';
	begin
		if (unsigned(packetMagicHeader) = to_unsigned(MAGIC_PACKET_BYTE_VALUE, 8) ) then
			magicByteMatch := '1';
		end if;
		if (ComputePacketChecksum(packetMagicHeader, packetTypeByte, packetData0, packetData1) = unsigned(packetChecksum) ) then
			checksumMatch := '1';
		end if;
		if (unsigned(packetTypeByte) < ePacketType'pos(PT_MAX_PACKET_TYPES) ) then
			packetTypeInRange := '1';
		end if;

		return magicByteMatch and checksumMatch and packetTypeInRange;
	end function;

end package body PacketType;
