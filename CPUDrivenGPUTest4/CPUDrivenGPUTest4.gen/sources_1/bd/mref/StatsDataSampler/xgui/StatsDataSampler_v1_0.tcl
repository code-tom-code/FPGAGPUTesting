# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BRAMAddrBitWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DataBitWidth" -parent ${Page_0}


}

proc update_PARAM_VALUE.BRAMAddrBitWidth { PARAM_VALUE.BRAMAddrBitWidth } {
	# Procedure called to update BRAMAddrBitWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BRAMAddrBitWidth { PARAM_VALUE.BRAMAddrBitWidth } {
	# Procedure called to validate BRAMAddrBitWidth
	return true
}

proc update_PARAM_VALUE.DataBitWidth { PARAM_VALUE.DataBitWidth } {
	# Procedure called to update DataBitWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DataBitWidth { PARAM_VALUE.DataBitWidth } {
	# Procedure called to validate DataBitWidth
	return true
}


proc update_MODELPARAM_VALUE.DataBitWidth { MODELPARAM_VALUE.DataBitWidth PARAM_VALUE.DataBitWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DataBitWidth}] ${MODELPARAM_VALUE.DataBitWidth}
}

proc update_MODELPARAM_VALUE.BRAMAddrBitWidth { MODELPARAM_VALUE.BRAMAddrBitWidth PARAM_VALUE.BRAMAddrBitWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BRAMAddrBitWidth}] ${MODELPARAM_VALUE.BRAMAddrBitWidth}
}

