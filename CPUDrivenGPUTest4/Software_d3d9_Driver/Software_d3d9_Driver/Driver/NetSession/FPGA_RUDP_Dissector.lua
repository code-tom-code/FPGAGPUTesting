-- Custom Wireshark Lua Protocol Dissector
-- Decodes both H2D and D2H packets using the custom Reliable UDP ("RUDP") protocol for Wireshark (authored for Wireshark 4.4.0).
-- 
-- Installation instructions:
-- Simply copy and paste this lua script into your Wireshark Plugins directory. For example, mine is located at: C:\Program Files\Wireshark\plugins\
--
-- Huge thanks to the tutorial at: https://mika-s.github.io/wireshark/lua/dissector/2017/11/04/creating-a-wireshark-dissector-in-lua-1.html
-- 

fpga_protocol = Proto("FPGA", "FPGA RUDP Protocol")

header_magic							= ProtoField.uint8("fpgarudp.header_magic",							"Magic",						base.HEX)
header_packettype						= ProtoField.uint8("fpgarudp.header_packettype",					"PacketType",					base.DEC)

broadcast_netProtoVersionMajorDevice	= ProtoField.uint8("fpgarudp.broadcast_netprotoversionmajordevice",	"NetProtoVersionMajorDevice",	base.DEC)
broadcast_netProtoVersionMinorDevice	= ProtoField.uint8("fpgarudp.broadcast_netprotoversionminordevice",	"NetProtoVersionMinorDevice",	base.DEC)
broadcast_deviceMACAddress				= ProtoField.ether("fpgarudp.broadcast_devicemacaddress",			"DeviceMACAddress",				base.HEX)
broadcast_deviceIPv4Address				= ProtoField.ipv4("fpgarudp.broadcast_deviceipv4address",			"DeviceIPv4Address",			base.DEC)
broadcast_numBroadcastsSinceReset		= ProtoField.uint16("fpgarudp.broadcast_numbroadcastssincereset",	"NumBroadcastsSinceReset",		base.DEC)
broadcast_hasLostSession				= ProtoField.uint8("fpgarudp.broadcast_haslostsession",				"HasLostSession",				base.DEC)

connrequest_netProtoVersionMajorHost	= ProtoField.uint8("fpgarudp.connrequest_netprotoversionmajorhost",	"NetProtoVersionMajorHost",		base.DEC)
connrequest_netProtoVersionMinorHost	= ProtoField.uint8("fpgarudp.connrequest_netprotoversionminorhost",	"NetProtoVersionMinorHost",		base.DEC)
connrequest_unusedPaddingByte			= ProtoField.uint8("fpgarudp.connrequest_unusedpaddingbyte",		"UnusedPaddingByte",			base.HEX)
connrequest_hostIPv4Address				= ProtoField.ipv4("fpgarudp.connrequest_hostipv4address",			"HostIPv4Address",				base.DEC)

connresponse_status						= ProtoField.uint8("fpgarudp.connresponse_status", 					"Status",						base.DEC)

disconnect_senderIPv4Address			= ProtoField.ipv4("fpgarudp.disconnect_senderipv4address",			"SenderIPv4Address",			base.DEC)
disconnect_unusedPaddingBytes			= ProtoField.uint16("fpgarudp.disconnect_unusedpaddingbytes",		"UnusedPaddingBytes",			base.HEX)
disconnect_disconnectReason				= ProtoField.uint8("fpgarudp.disconnect_disconnectreason",			"DisconnectReason",				base.DEC)

session_packetID						= ProtoField.uint16("fpgarudp.session_packetid",					"PacketID",						base.DEC)
session_lastAckedPacketID				= ProtoField.uint16("fpgarudp.session_lastackedpacketid",			"LastAckedPacketID",			base.DEC)
session_packetChecksum					= ProtoField.uint8("fpgarudp.session_packetchecksum",				"PacketChecksum",				base.HEX)
session_packetFlags						= ProtoField.uint8("fpgarudp.session_packetflags",					"PacketFlags",					base.HEX)
session_subpacketCount					= ProtoField.uint8("fpgarudp.session_subpacketcount",				"SubpacketCount",				base.DEC)

subpacket_packetType					= ProtoField.uint8("fpgarudp.subpacket_packettype",					"SubpacketType",				base.DEC)
subpacket_payload0						= ProtoField.uint32("fpgarudp.subpacket_payload0", 					"Payload0",						base.HEX)
subpacket_payload1						= ProtoField.uint32("fpgarudp.subpacket_payload1",					"Payload1",						base.HEX)

fpga_protocol.fields = 
{
	header_magic, header_packettype, -- Header
	broadcast_netProtoVersionMajorDevice, broadcast_netProtoVersionMinorDevice, broadcast_deviceMACAddress, broadcast_deviceIPv4Address, broadcast_numBroadcastsSinceReset, broadcast_hasLostSession, -- PT_CONNBROADCAST
	connrequest_netProtoVersionMajorHost, connrequest_netProtoVersionMinorHost, connrequest_unusedPaddingByte, connrequest_hostIPv4Address, -- PT_CONNREQUEST
	connresponse_status, -- PT_CONNRESPONSE
	disconnect_senderIPv4Address, disconnect_unusedPaddingBytes, disconnect_disconnectReason, -- PT_DISCONNECT
	session_packetID, session_lastAckedPacketID, session_packetChecksum, session_packetFlags, session_subpacketCount, -- PT_SESSIONCOMBOPACKET
	subpacket_packetType, subpacket_payload0, subpacket_payload1 -- PT_SESSIONCOMBOPACKET (Subpackets)
}

ef_bad_magic = ProtoExpert.new("fpgarudp.bad_magic.expert", "Bad Magic Byte", expert.group.MALFORMED, expert.severity.ERROR)
ef_broadcast_sequence = ProtoExpert.new("fpgarudp.broadcast_sequence.expert", "Broadcast Sequence", expert.group.SEQUENCE, expert.severity.NOTE)
ef_connresponse_responsecode = ProtoExpert.new("fpgarudp.connresponse_responsecode.expert", "Response Code", expert.group.RESPONSE_CODE, expert.severity.NOTE)
ef_disconnect_disconnectreason = ProtoExpert.new("fpgarudp.disconnect_disconnectreason.expert", "Disconnect Reason", expert.group.RESPONSE_CODE, expert.severity.NOTE)
ef_session_checksum = ProtoExpert.new("fpgarudp.session_checksum.expert", "Packet Header Checksum", expert.group.CHECKSUM, expert.severity.NOTE)
ef_session_packetid = ProtoExpert.new("fpgarudp.session_packetid.expert", "Packet ID", expert.group.SEQUENCE, expert.severity.NOTE)
ef_session_lastackedpacketid = ProtoExpert.new("fpgarudp.session_lastackedpacketid.expert", "Last Acked Packet ID", expert.group.SEQUENCE, expert.severity.NOTE)

fpga_protocol.experts =
{
	ef_bad_magic, -- Header
	ef_broadcast_sequence, -- PT_CONNBROADCAST
	ef_connresponse_responsecode, -- PT_CONNRESPONSE
	ef_disconnect_disconnectreason, -- PT_DISCONNECT
	ef_session_checksum, ef_session_packetid, ef_session_lastackedpacketid -- PT_SESSIONCOMBOPACKET
}

function get_header_magic_validity(testmagicval)
	local MAGIC_BYTE = 0xA5 -- Our MAGIC_BYTE must be equal to this value, otherwise the whole packet is invalid!
	return testmagicval == MAGIC_BYTE
end

function get_header_magic_validity_string(testmagicval)
	if get_header_magic_validity(testmagicval) then
		return "VALID"
	else
		return "INVALID"
	end
end

function get_packettype_string(packettype)
	local packettype_string = "UNKNOWN"

	local stringtable = {}
	stringtable[0] = "PT_DONOTHING" -- DONOTHING is meant as a no-op packet that does nothing
	stringtable[1] = "PT_WRITEMEM"
	stringtable[2] = "PT_READMEM"
	stringtable[3] = "PT_READMEMRESPONSE"
	stringtable[4] = "PT_CLEARMEM"
	stringtable[5] = "PT_CLEARBACKBUFFER"
	stringtable[6] = "PT_CLEARZSTENCILBUFFER"
	stringtable[7] = "PT_LOADVERTSTREAMDATA" -- Note that this packet is executed with an implicit "wait for IA idle", since it cannot load new vertex data while the IA is still using it
	stringtable[8] = "PT_LOADTEXCACHEDATA"
	stringtable[9] = "PT_SETALPHATESTANDRTADDRESSSTATE"
	stringtable[10] = "PT_SETTEXTURESTATE"
	stringtable[11] = "PT_WAITFORDEVICEIDLE"
	stringtable[12] = "PT_WAITRESPONSE"
	stringtable[13] = "PT_DRAWINDEXED"
	stringtable[14] = "PT_SETSCANOUTPOINTER"
	stringtable[15] = "PT_SETIASTATE"
	stringtable[16] = "PT_FLUSHROPCACHE"
	stringtable[17] = "PT_ENDFRAMESTATS"
	stringtable[18] = "PT_ENDFRAME"
	stringtable[19] = "PT_RUNCOMMANDLIST"
	stringtable[20] = "PT_LOADSHADERINSTRUCTIONS"
	stringtable[21] = "PT_SETSHADERCONSTANT"
	stringtable[22] = "PT_SETVERTEXSTREAMDATA"
	stringtable[23] = "PT_SETSTATSEVENTCONFIG"
	stringtable[24] = "PT_SETSHADERCONSTANTSPECIAL"
	stringtable[25] = "PT_SETSHADERSTARTADDRESS"
	stringtable[26] = "PT_DEBUGSHADERNEXTDRAWCALL"
	stringtable[27] = "PT_SETDEPTHSTATE"
	stringtable[28] = "PT_SETBLENDSTATE"
	stringtable[29] = "PT_CONNBROADCAST"
	stringtable[30] = "PT_CONNREQUEST"
	stringtable[31] = "PT_CONNRESPONSE"
	stringtable[32] = "PT_SESSIONCOMBOPACKET"
	stringtable[33] = "PT_DISCONNECT"
	stringtable[34] = "PT_SETCLIPSTATE"
	stringtable[35] = "PT_ISSUEQUERY"
	stringtable[36] = "PT_SETVIEWPORTPARAMS0"
	stringtable[37] = "PT_SETVIEWPORTPARAMS1"
	stringtable[38] = "PT_SETSCISSORRECT"
	stringtable[39] = "PT_SETINTERPOLATORSTATE"
	stringtable[40] = "PT_WRITEMEMBATCHCONFIG"
	stringtable[41] = "PT_WRITEMEMBATCH0"
	stringtable[42] = "PT_WRITEMEMBATCH1"
	stringtable[43] = "PT_WRITEMEMBATCH2"
	stringtable[44] = "PT_WRITEMEMBATCH3WRITE"
	stringtable[45] = "PT_SETSTENCILSTATE"

	if packettype < 46 then
		packettype_string = stringtable[packettype]
	end

	return packettype_string
end

function get_connresponse_status_string(status)
	local connresponse_status_string = "UNKNOWN"
	
	local stringtable = {}
	stringtable[0] = "acceptNewSesssion" -- Success! We have a new session!
	
	-- Error codes follow:
	stringtable[1] = "errInvalidRequestLength" -- The length of the host's "request session connect" packet was not valid.
	stringtable[2] = "errInvalidNetProtoMajorVer" -- The major net proto version doesn't match between the host and device.
	stringtable[3] = "errInvalidPacketType" -- The only packet type allowed from a host before a session is established is the "request session connect" packet.
	stringtable[4] = "errInvalidIPv4Addr" -- The host used an invalid IPv4 address (0x00000000 or 0xFFFFFFFF are both considered "invalid")
	stringtable[5] = "errMismatchIPv4Addr" -- The IPv4 address that the host used doesn't match the IPv4 address of the sent packet.
	stringtable[6] = "errInvalidMagic" -- The magic byte at the start of the packet is not valid.
	
	if status < 7 then
		connresponse_status_string = stringtable[status]
	end
	
	return connresponse_status_string
end

function get_disconnect_reason_string(reason)
	local disconnect_reason_string = "UNKNOWN"
	
	local stringtable = {}
	stringtable[0] = "errUserRequestedClose" -- User requested session close
	stringtable[1] = "errShutdown" -- The program is shutting down, so we're trying to close the session gracefully.
	stringtable[2] = "errSessionError" -- Session Error
	stringtable[3] = "errWindowOverrun" -- Send Window Overrun - too many packets sent without any acks received. Session gets closed rather than unbounded memory leak.
	stringtable[4] = "errARPLost" -- ARP Lost - packets can no longer be delivered due to the entry falling out of our ARP table
	stringtable[5] = "errTimeout" -- We haven't received a packet from the other end in too long of a time. It probably locked up or hung somehow, or the router inbetween us stopped responding.
	stringtable[6] = "errOther" -- Some other error has resulted in this disconnect
	
	if reason < 7 then
		disconnect_reason_string = stringtable[reason]
	end
	
	return disconnect_reason_string
end

function get_netproto_version_string(majorver, minorver)
	return "v" .. majorver .. "." .. minorver
end

function fpga_protocol.dissector(buffer, pinfo, tree)
	length = buffer:len()
	if length == 0 then
		return
	end

	pinfo.cols.protocol = fpga_protocol.name

	-- TODO: Fill in the pinfo.in_error_pkt field and append to the pinfo.cols.info column

	local main_tree = tree:add(fpga_protocol, buffer(), "FPGA RUDP Protocol")
	local header_subtree = main_tree:add(fpga_protocol, buffer(0, 2), "Header")
	local packet_subtree = main_tree:add(fpga_protocol, buffer(2), "Packet Body")
	
	-- Packet Header	
	local headermagic_val = buffer(0, 1):le_uint()
	local headermagic_valid_string = get_header_magic_validity_string(headermagic_val)

	local packettype_val = buffer(1, 1):le_uint()
	local packettype_string = get_packettype_string(packettype_val)

	local header_magic_treeitem = header_subtree:add_le(header_magic, buffer(0, 1) )
	header_magic_treeitem:append_text(" (" .. headermagic_valid_string .. ")")
	if (get_header_magic_validity(headermagic_val) == false) then -- Validate our magic byte
		header_magic_treeitem:add_proto_expert_info(ef_bad_magic)
	end
	
	header_subtree:add_le(header_packettype, buffer(1, 1) ):append_text(" (" .. packettype_string .. ")")
	
	-- Packet payload
	if packettype_val == 0 then -- PT_DONOTHING
	elseif packettype_val == 29 then -- PT_CONNBROADCAST
		local netproto_version_major_val = buffer(2, 1):le_uint()
		local netproto_version_minor_val = buffer(3, 1):le_uint()
		local netproto_version_string = get_netproto_version_string(netproto_version_major_val, netproto_version_minor_val)
		packet_subtree:add_le(broadcast_netProtoVersionMajorDevice, netproto_version_major_val):append_text(" (" .. netproto_version_string .. ")")
		packet_subtree:add_le(broadcast_netProtoVersionMinorDevice, netproto_version_minor_val)
		packet_subtree:add_le(broadcast_deviceMACAddress, buffer(4, 6) )
		packet_subtree:add(broadcast_deviceIPv4Address, buffer(10, 4) )
		packet_subtree:add_le(broadcast_numBroadcastsSinceReset, buffer(14, 2) ):add_proto_expert_info(ef_broadcast_sequence)
		packet_subtree:add_le(broadcast_hasLostSession, buffer(16, 1) )
	elseif packettype_val == 30 then -- PT_CONNREQUEST
		local netproto_version_major_val = buffer(2, 1):le_uint()
		local netproto_version_minor_val = buffer(3, 1):le_uint()
		local netproto_version_string = get_netproto_version_string(netproto_version_major_val, netproto_version_minor_val)
		packet_subtree:add_le(connrequest_netProtoVersionMajorHost, netproto_version_major_val):append_text(" (" .. netproto_version_string .. ")")
		packet_subtree:add_le(connrequest_netProtoVersionMinorHost, netproto_version_minor_val)
		packet_subtree:add_le(connrequest_unusedPaddingByte, buffer(4, 1) )
		packet_subtree:add_le(connrequest_hostIPv4Address, buffer(5, 4) )
	elseif packettype_val == 31 then -- PT_CONNRESPONSE
		local response_status_val = buffer(2, 1):le_uint()
		local response_status_string = get_connresponse_status_string(response_status_val)
		packet_subtree:add_le(connresponse_status, buffer(2, 1) ):append_text(" (" .. response_status_string .. ")"):add_proto_expert_info(ef_connresponse_responsecode)
	elseif packettype_val == 33 then -- PT_DISCONNECT
		local disconnect_reason_val = buffer(8, 1):le_uint()
		local disconnect_reason_string = get_disconnect_reason_string(disconnect_reason_val)
		packet_subtree:add_le(disconnect_senderIPv4Address, buffer(2, 4) ) -- TODO: Is this little endian or big endian?
		packet_subtree:add_le(disconnect_unusedPaddingBytes, buffer(6, 2) )
		packet_subtree:add_le(disconnect_disconnectReason, buffer(8, 1) ):append_text(" (" .. disconnect_reason_string .. ")"):add_proto_expert_info(ef_disconnect_disconnectreason)
	elseif packettype_val == 32 then -- PT_SESSIONCOMBOPACKET
		local session_subpacketcount_val = buffer(8, 1):le_uint()
		packet_subtree:add_le(session_packetID, buffer(2, 2) ):add_proto_expert_info(ef_session_packetid)
		packet_subtree:add_le(session_lastAckedPacketID, buffer(4, 2) ):add_proto_expert_info(ef_session_lastackedpacketid)
		packet_subtree:add_le(session_packetChecksum, buffer(6, 1) ):add_proto_expert_info(ef_session_checksum)
		packet_subtree:add_le(session_packetFlags, buffer(7, 1) )
		packet_subtree:add_le(session_subpacketCount, buffer(8, 1) )
		
		-- Decode subpackets also:
		local subpackets_subtree = main_tree:add(fpga_protocol, buffer(9), "Subpackets")
		if session_subpacketcount_val > 0 then
			local subpacket_index = 0
			for subpacket_index = 0, session_subpacketcount_val - 1, 1
			do
				local subpacket_begin_offset = 9 + (subpacket_index * 9);
				local subpacket_type_val = buffer(subpacket_begin_offset, 1):le_uint()
				local subpacket_type_string = get_packettype_string(subpacket_type_val)
				local subpacket_subtree = subpackets_subtree:add(fpga_protocol, buffer(subpacket_begin_offset, 9), "Subpacket #" .. subpacket_index .. ": " .. subpacket_type_string)
				subpacket_subtree:add_le(subpacket_packetType, buffer(subpacket_begin_offset, 1) ):append_text(" (" .. subpacket_type_string .. ")")
				subpacket_subtree:add_le(subpacket_payload0, buffer(subpacket_begin_offset + 1, 4) )
				subpacket_subtree:add_le(subpacket_payload1, buffer(subpacket_begin_offset + 5, 4) )
			end
		end
	end
end

local udp_port = DissectorTable.get("udp.port")
udp_port:add(3128, fpga_protocol) -- Device (FPGA) to Host (PC) port ("D2H port") is 3128
udp_port:add(3129, fpga_protocol) -- Host (PC) to Device (FPGA) port ("H2D port") is 3129
