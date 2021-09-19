# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "B_OUTPUT_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_OUTPUT_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "R_OUTPUT_BITS" -parent ${Page_0}


}

proc update_PARAM_VALUE.B_OUTPUT_BITS { PARAM_VALUE.B_OUTPUT_BITS } {
	# Procedure called to update B_OUTPUT_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.B_OUTPUT_BITS { PARAM_VALUE.B_OUTPUT_BITS } {
	# Procedure called to validate B_OUTPUT_BITS
	return true
}

proc update_PARAM_VALUE.G_OUTPUT_BITS { PARAM_VALUE.G_OUTPUT_BITS } {
	# Procedure called to update G_OUTPUT_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_OUTPUT_BITS { PARAM_VALUE.G_OUTPUT_BITS } {
	# Procedure called to validate G_OUTPUT_BITS
	return true
}

proc update_PARAM_VALUE.R_OUTPUT_BITS { PARAM_VALUE.R_OUTPUT_BITS } {
	# Procedure called to update R_OUTPUT_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.R_OUTPUT_BITS { PARAM_VALUE.R_OUTPUT_BITS } {
	# Procedure called to validate R_OUTPUT_BITS
	return true
}


proc update_MODELPARAM_VALUE.R_OUTPUT_BITS { MODELPARAM_VALUE.R_OUTPUT_BITS PARAM_VALUE.R_OUTPUT_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.R_OUTPUT_BITS}] ${MODELPARAM_VALUE.R_OUTPUT_BITS}
}

proc update_MODELPARAM_VALUE.G_OUTPUT_BITS { MODELPARAM_VALUE.G_OUTPUT_BITS PARAM_VALUE.G_OUTPUT_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_OUTPUT_BITS}] ${MODELPARAM_VALUE.G_OUTPUT_BITS}
}

proc update_MODELPARAM_VALUE.B_OUTPUT_BITS { MODELPARAM_VALUE.B_OUTPUT_BITS PARAM_VALUE.B_OUTPUT_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.B_OUTPUT_BITS}] ${MODELPARAM_VALUE.B_OUTPUT_BITS}
}

