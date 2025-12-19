# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "PCS_Address" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PHY_Address" -parent ${Page_0}


}

proc update_PARAM_VALUE.PCS_Address { PARAM_VALUE.PCS_Address } {
	# Procedure called to update PCS_Address when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCS_Address { PARAM_VALUE.PCS_Address } {
	# Procedure called to validate PCS_Address
	return true
}

proc update_PARAM_VALUE.PHY_Address { PARAM_VALUE.PHY_Address } {
	# Procedure called to update PHY_Address when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PHY_Address { PARAM_VALUE.PHY_Address } {
	# Procedure called to validate PHY_Address
	return true
}


proc update_MODELPARAM_VALUE.PHY_Address { MODELPARAM_VALUE.PHY_Address PARAM_VALUE.PHY_Address } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PHY_Address}] ${MODELPARAM_VALUE.PHY_Address}
}

proc update_MODELPARAM_VALUE.PCS_Address { MODELPARAM_VALUE.PCS_Address PARAM_VALUE.PCS_Address } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCS_Address}] ${MODELPARAM_VALUE.PCS_Address}
}

