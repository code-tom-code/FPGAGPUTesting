# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Use_HDMI" -parent ${Page_0}


}

proc update_PARAM_VALUE.Use_HDMI { PARAM_VALUE.Use_HDMI } {
	# Procedure called to update Use_HDMI when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Use_HDMI { PARAM_VALUE.Use_HDMI } {
	# Procedure called to validate Use_HDMI
	return true
}


proc update_MODELPARAM_VALUE.Use_HDMI { MODELPARAM_VALUE.Use_HDMI PARAM_VALUE.Use_HDMI } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Use_HDMI}] ${MODELPARAM_VALUE.Use_HDMI}
}

