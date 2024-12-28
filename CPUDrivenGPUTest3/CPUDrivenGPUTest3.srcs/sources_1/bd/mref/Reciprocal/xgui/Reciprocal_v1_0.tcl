# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Num_Newton_Raphson_Iterations" -parent ${Page_0}


}

proc update_PARAM_VALUE.Num_Newton_Raphson_Iterations { PARAM_VALUE.Num_Newton_Raphson_Iterations } {
	# Procedure called to update Num_Newton_Raphson_Iterations when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Num_Newton_Raphson_Iterations { PARAM_VALUE.Num_Newton_Raphson_Iterations } {
	# Procedure called to validate Num_Newton_Raphson_Iterations
	return true
}


proc update_MODELPARAM_VALUE.Num_Newton_Raphson_Iterations { MODELPARAM_VALUE.Num_Newton_Raphson_Iterations PARAM_VALUE.Num_Newton_Raphson_Iterations } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Num_Newton_Raphson_Iterations}] ${MODELPARAM_VALUE.Num_Newton_Raphson_Iterations}
}

