# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DEVICE_IPv4_ADDRESS_OCTET_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_IPv4_ADDRESS_OCTET_1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_IPv4_ADDRESS_OCTET_2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_IPv4_ADDRESS_OCTET_3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEVICE_MAC_ADDRESS_OCTET_5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PAYLOAD_MAGIC_HEADER_BYTE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RECV_PKT_DATA_DWORD_CAPACITY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_DISABLE_IPv4_ADDR_FILTERING" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_DISABLE_MAC_ADDR_FILTERING" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_INTER_PACKET_GAP_BYTES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TX_INTER_PACKET_GAP_BYTES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "UDP_PROTOCOL_PORT" -parent ${Page_0}


}

proc update_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 } {
	# Procedure called to update DEVICE_IPv4_ADDRESS_OCTET_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 } {
	# Procedure called to validate DEVICE_IPv4_ADDRESS_OCTET_0
	return true
}

proc update_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 } {
	# Procedure called to update DEVICE_IPv4_ADDRESS_OCTET_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 } {
	# Procedure called to validate DEVICE_IPv4_ADDRESS_OCTET_1
	return true
}

proc update_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 } {
	# Procedure called to update DEVICE_IPv4_ADDRESS_OCTET_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 } {
	# Procedure called to validate DEVICE_IPv4_ADDRESS_OCTET_2
	return true
}

proc update_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 } {
	# Procedure called to update DEVICE_IPv4_ADDRESS_OCTET_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 { PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 } {
	# Procedure called to validate DEVICE_IPv4_ADDRESS_OCTET_3
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_0
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_1
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_2
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_3
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_4
	return true
}

proc update_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 } {
	# Procedure called to update DEVICE_MAC_ADDRESS_OCTET_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 { PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 } {
	# Procedure called to validate DEVICE_MAC_ADDRESS_OCTET_5
	return true
}

proc update_PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE { PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE } {
	# Procedure called to update PAYLOAD_MAGIC_HEADER_BYTE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE { PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE } {
	# Procedure called to validate PAYLOAD_MAGIC_HEADER_BYTE
	return true
}

proc update_PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY { PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY } {
	# Procedure called to update RECV_PKT_DATA_DWORD_CAPACITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY { PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY } {
	# Procedure called to validate RECV_PKT_DATA_DWORD_CAPACITY
	return true
}

proc update_PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES { PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES } {
	# Procedure called to update RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES { PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES } {
	# Procedure called to validate RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES
	return true
}

proc update_PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES { PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES } {
	# Procedure called to update RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES { PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES } {
	# Procedure called to validate RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES
	return true
}

proc update_PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING { PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING } {
	# Procedure called to update RX_DISABLE_IPv4_ADDR_FILTERING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING { PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING } {
	# Procedure called to validate RX_DISABLE_IPv4_ADDR_FILTERING
	return true
}

proc update_PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING { PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING } {
	# Procedure called to update RX_DISABLE_MAC_ADDR_FILTERING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING { PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING } {
	# Procedure called to validate RX_DISABLE_MAC_ADDR_FILTERING
	return true
}

proc update_PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES { PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to update RX_INTER_PACKET_GAP_BYTES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES { PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to validate RX_INTER_PACKET_GAP_BYTES
	return true
}

proc update_PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES { PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to update TX_INTER_PACKET_GAP_BYTES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES { PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to validate TX_INTER_PACKET_GAP_BYTES
	return true
}

proc update_PARAM_VALUE.UDP_PROTOCOL_PORT { PARAM_VALUE.UDP_PROTOCOL_PORT } {
	# Procedure called to update UDP_PROTOCOL_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.UDP_PROTOCOL_PORT { PARAM_VALUE.UDP_PROTOCOL_PORT } {
	# Procedure called to validate UDP_PROTOCOL_PORT
	return true
}


proc update_MODELPARAM_VALUE.TX_INTER_PACKET_GAP_BYTES { MODELPARAM_VALUE.TX_INTER_PACKET_GAP_BYTES PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TX_INTER_PACKET_GAP_BYTES}] ${MODELPARAM_VALUE.TX_INTER_PACKET_GAP_BYTES}
}

proc update_MODELPARAM_VALUE.RX_INTER_PACKET_GAP_BYTES { MODELPARAM_VALUE.RX_INTER_PACKET_GAP_BYTES PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_INTER_PACKET_GAP_BYTES}] ${MODELPARAM_VALUE.RX_INTER_PACKET_GAP_BYTES}
}

proc update_MODELPARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE { MODELPARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE}] ${MODELPARAM_VALUE.PAYLOAD_MAGIC_HEADER_BYTE}
}

proc update_MODELPARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES { MODELPARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES}] ${MODELPARAM_VALUE.RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES}
}

proc update_MODELPARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES { MODELPARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES}] ${MODELPARAM_VALUE.RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES}
}

proc update_MODELPARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING { MODELPARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING}] ${MODELPARAM_VALUE.RX_DISABLE_MAC_ADDR_FILTERING}
}

proc update_MODELPARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING { MODELPARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING}] ${MODELPARAM_VALUE.RX_DISABLE_IPv4_ADDR_FILTERING}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_0}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_1}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_2}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_3}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_4}
}

proc update_MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 { MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5}] ${MODELPARAM_VALUE.DEVICE_MAC_ADDRESS_OCTET_5}
}

proc update_MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 { MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0}] ${MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_0}
}

proc update_MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 { MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1}] ${MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_1}
}

proc update_MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 { MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2}] ${MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_2}
}

proc update_MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 { MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3}] ${MODELPARAM_VALUE.DEVICE_IPv4_ADDRESS_OCTET_3}
}

proc update_MODELPARAM_VALUE.UDP_PROTOCOL_PORT { MODELPARAM_VALUE.UDP_PROTOCOL_PORT PARAM_VALUE.UDP_PROTOCOL_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UDP_PROTOCOL_PORT}] ${MODELPARAM_VALUE.UDP_PROTOCOL_PORT}
}

proc update_MODELPARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY { MODELPARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY}] ${MODELPARAM_VALUE.RECV_PKT_DATA_DWORD_CAPACITY}
}

