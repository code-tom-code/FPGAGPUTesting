# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NET_PROTOCOL_MAJOR_VERSION" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NET_PROTOCOL_MINOR_VERSION" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SEND_PKT_DATA_CAPACITY_DWORDS" -parent ${Page_0}


}

proc update_PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION { PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION } {
	# Procedure called to update NET_PROTOCOL_MAJOR_VERSION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION { PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION } {
	# Procedure called to validate NET_PROTOCOL_MAJOR_VERSION
	return true
}

proc update_PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION { PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION } {
	# Procedure called to update NET_PROTOCOL_MINOR_VERSION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION { PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION } {
	# Procedure called to validate NET_PROTOCOL_MINOR_VERSION
	return true
}

proc update_PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS { PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS } {
	# Procedure called to update SEND_PKT_DATA_CAPACITY_DWORDS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS { PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS } {
	# Procedure called to validate SEND_PKT_DATA_CAPACITY_DWORDS
	return true
}


proc update_MODELPARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION { MODELPARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION}] ${MODELPARAM_VALUE.NET_PROTOCOL_MAJOR_VERSION}
}

proc update_MODELPARAM_VALUE.NET_PROTOCOL_MINOR_VERSION { MODELPARAM_VALUE.NET_PROTOCOL_MINOR_VERSION PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NET_PROTOCOL_MINOR_VERSION}] ${MODELPARAM_VALUE.NET_PROTOCOL_MINOR_VERSION}
}

proc update_MODELPARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS { MODELPARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS}] ${MODELPARAM_VALUE.SEND_PKT_DATA_CAPACITY_DWORDS}
}

