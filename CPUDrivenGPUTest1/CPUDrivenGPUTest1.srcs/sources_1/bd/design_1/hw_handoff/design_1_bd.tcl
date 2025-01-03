
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# AttrInterpolator, ClearBlock, CommandProcessor, InputAssembler, Reciprocal, ROP, Rasterizer, ResetN_UntilClockLocked, StatsCollector, TexSample, Reciprocal, TriSetup, TriWorkCache, MemoryController, R8G8B8Quantizer, ScanOut, PacketProcessor

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku5p-ffvb676-2-e
   set_property BOARD_PART xilinx.com:kcu116:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: SerialPacketSystem
proc create_hier_cell_SerialPacketSystem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_SerialPacketSystem() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart

  # Create pins
  create_bd_pin -dir I -type clk rd_clk
  create_bd_pin -dir I reset
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: PacketProcessor_0, and set properties
  set block_name PacketProcessor
  set block_cell_name PacketProcessor_0
  if { [catch {set PacketProcessor_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PacketProcessor_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.MAX_BURST_LENGTH {1} \
 ] [get_bd_intf_pins /SerialPacketSystem/PacketProcessor_0/M_AXI]

  # Create instance: ReturnOutputPacketsFIFO, and set properties
  set ReturnOutputPacketsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ReturnOutputPacketsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {88} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {88} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {250} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ReturnOutputPacketsFIFO

  # Create instance: ValidIncomingPacketsFIFO, and set properties
  set ValidIncomingPacketsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ValidIncomingPacketsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {88} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {88} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {true} \
   CONFIG.Write_Clock_Frequency {250} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ValidIncomingPacketsFIFO

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {921600} \
   CONFIG.C_ODD_PARITY {1} \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {250000000} \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ_d {250} \
   CONFIG.C_USE_PARITY {1} \
   CONFIG.PARITY {Odd} \
   CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: ila_250, and set properties
  set ila_250 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_250 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {2} \
   CONFIG.C_PROBE0_TYPE {1} \
   CONFIG.C_PROBE0_WIDTH {8} \
   CONFIG.C_PROBE1_TYPE {1} \
   CONFIG.C_PROBE1_WIDTH {88} \
 ] $ila_250

  # Create interface connections
  connect_bd_intf_net -intf_net CommandProcessor_0_returnPacketsFIFO [get_bd_intf_pins FIFO_WRITE] [get_bd_intf_pins ReturnOutputPacketsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net CommandProcessor_0_validPacketsFIFO [get_bd_intf_pins FIFO_READ] [get_bd_intf_pins ValidIncomingPacketsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net PacketProcessor_0_FIFO_IN_RETURN_PACKETS [get_bd_intf_pins PacketProcessor_0/FIFO_IN_RETURN_PACKETS] [get_bd_intf_pins ReturnOutputPacketsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net PacketProcessor_0_FIFO_OUT_VALID_PACKETS [get_bd_intf_pins PacketProcessor_0/FIFO_OUT_VALID_PACKETS] [get_bd_intf_pins ValidIncomingPacketsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net PacketProcessor_0_M_AXI [get_bd_intf_pins PacketProcessor_0/M_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]

  # Create port connections
  connect_bd_net -net PacketProcessor_0_DBG_INCPACKETBUFFER [get_bd_pins PacketProcessor_0/DBG_INCPACKETBUFFER] [get_bd_pins ila_250/probe1]
  connect_bd_net -net PacketProcessor_0_DBG_PACKETSTATE [get_bd_pins PacketProcessor_0/DBG_PACKETSTATE] [get_bd_pins ila_250/probe0]
  connect_bd_net -net ResetN_UntilClockLoc_0_resetn [get_bd_pins s_axi_aresetn] [get_bd_pins PacketProcessor_0/M_AXI_ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn]
  connect_bd_net -net ddr4_0_addn_ui_clkout1 [get_bd_pins s_axi_aclk] [get_bd_pins PacketProcessor_0/M_AXI_ACLK] [get_bd_pins ReturnOutputPacketsFIFO/rd_clk] [get_bd_pins ValidIncomingPacketsFIFO/wr_clk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins ila_250/clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins rd_clk] [get_bd_pins ReturnOutputPacketsFIFO/wr_clk] [get_bd_pins ValidIncomingPacketsFIFO/rd_clk]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins ReturnOutputPacketsFIFO/srst] [get_bd_pins ValidIncomingPacketsFIFO/srst]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ScanoutSystem
proc create_hier_cell_ScanoutSystem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ScanoutSystem() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:fifo_write_rtl:1.0 ScanoutReadRequestsFIFO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:fifo_read_rtl:1.0 ScanoutReadResponses

  # Create pins
  create_bd_pin -dir I -from 29 -to 0 CMD_BaseRenderTargetAddr
  create_bd_pin -dir I CMD_ScanoutEnable
  create_bd_pin -dir O -from 3 -to 0 blue
  create_bd_pin -dir I -type clk clk_in1
  create_bd_pin -dir O -type clk clk_out1
  create_bd_pin -dir O -from 4 -to 0 green
  create_bd_pin -dir O hsync
  create_bd_pin -dir O -from 4 -to 0 red
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir O vsync

  # Create instance: R8G8B8Quantizer_0, and set properties
  set block_name R8G8B8Quantizer
  set block_cell_name R8G8B8Quantizer_0
  if { [catch {set R8G8B8Quantizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $R8G8B8Quantizer_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ScanOut_0, and set properties
  set block_name ScanOut
  set block_cell_name ScanOut_0
  if { [catch {set ScanOut_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ScanOut_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: scanout_clk_25_175_x8, and set properties
  set scanout_clk_25_175_x8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 scanout_clk_25_175_x8 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {109.744} \
   CONFIG.CLKOUT1_PHASE_ERROR {115.734} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {201.4} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {17.375} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.750} \
   CONFIG.MMCM_DIVCLK_DIVIDE {5} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_LOCKED {false} \
   CONFIG.USE_RESET {true} \
 ] $scanout_clk_25_175_x8

  # Create interface connections
  connect_bd_intf_net -intf_net ScanOut_0_ScanoutReadRequestsFIFO [get_bd_intf_pins ScanoutReadRequestsFIFO] [get_bd_intf_pins ScanOut_0/ScanoutReadRequestsFIFO]
  connect_bd_intf_net -intf_net ScanOut_0_ScanoutReadResponses [get_bd_intf_pins ScanoutReadResponses] [get_bd_intf_pins ScanOut_0/ScanoutReadResponses]

  # Create port connections
  connect_bd_net -net CMD_ScanoutEnable_1 [get_bd_pins CMD_ScanoutEnable] [get_bd_pins ScanOut_0/CMD_ScanoutEnable]
  connect_bd_net -net CommandProcessor_0_SCANOUT_RenderTargetBaseAddr [get_bd_pins CMD_BaseRenderTargetAddr] [get_bd_pins ScanOut_0/CMD_BaseRenderTargetAddr]
  connect_bd_net -net R8G8B8Quantizer_0_outBlueBits [get_bd_pins blue] [get_bd_pins R8G8B8Quantizer_0/outBlueBits]
  connect_bd_net -net R8G8B8Quantizer_0_outGreenBits [get_bd_pins green] [get_bd_pins R8G8B8Quantizer_0/outGreenBits]
  connect_bd_net -net R8G8B8Quantizer_0_outRedBits [get_bd_pins red] [get_bd_pins R8G8B8Quantizer_0/outRedBits]
  connect_bd_net -net ScanOut_0_hsync [get_bd_pins hsync] [get_bd_pins ScanOut_0/hsync]
  connect_bd_net -net ScanOut_0_outB [get_bd_pins R8G8B8Quantizer_0/inBlue8] [get_bd_pins ScanOut_0/outB]
  connect_bd_net -net ScanOut_0_outG [get_bd_pins R8G8B8Quantizer_0/inGreen8] [get_bd_pins ScanOut_0/outG]
  connect_bd_net -net ScanOut_0_outR [get_bd_pins R8G8B8Quantizer_0/inRed8] [get_bd_pins ScanOut_0/outR]
  connect_bd_net -net ScanOut_0_vsync [get_bd_pins vsync] [get_bd_pins ScanOut_0/vsync]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_out1] [get_bd_pins ScanOut_0/clk] [get_bd_pins scanout_clk_25_175_x8/clk_out1]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins clk_in1] [get_bd_pins scanout_clk_25_175_x8/clk_in1]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins scanout_clk_25_175_x8/reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: MemorySystem
proc create_hier_cell_MemorySystem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_MemorySystem() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ2
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ3
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_read_rtl:1.0 FIFO_READ4
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE2
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE3
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE4
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE5
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE6
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE7
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:fifo_write_rtl:1.0 FIFO_WRITE8
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_sysclk1_300

  # Create pins
  create_bd_pin -dir O CMD_MemoryControllerIsIdle
  create_bd_pin -dir O -from 29 -to 0 DBG_LastReadAddress
  create_bd_pin -dir O -from 2 -to 0 DBG_LastReadMemoryClientIndex
  create_bd_pin -dir O -from 29 -to 0 DBG_LastWriteAddress
  create_bd_pin -dir O -from 255 -to 0 DBG_LastWriteData
  create_bd_pin -dir O -from 7 -to 0 DBG_LastWriteDataDWORDEnables
  create_bd_pin -dir O -from 2 -to 0 DBG_LastWriteMemoryClientIndex
  create_bd_pin -dir O DBG_NewReadDataReady
  create_bd_pin -dir O DBG_NewReadEnable
  create_bd_pin -dir O -from 3 -to 0 DBG_ReadControlState
  create_bd_pin -dir O -from 3 -to 0 DBG_ReadState
  create_bd_pin -dir O DBG_ReadyForNewRead
  create_bd_pin -dir O DBG_ScanoutReadRequests_Empty
  create_bd_pin -dir O DBG_ScanoutReadRequests_rd_en
  create_bd_pin -dir O DBG_ScanoutReadResponses_Full
  create_bd_pin -dir O -from 3 -to 0 DBG_WriteControlState
  create_bd_pin -dir O -from 3 -to 0 DBG_WriteState
  create_bd_pin -dir I -type rst M_AXI_ARESETN
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCountBytesTransferred
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCountNonScanoutBytesTransferred
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCountNonScanoutTransactions
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCountTransactions
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCyclesIdle
  create_bd_pin -dir O -from 31 -to 0 STAT_MemReadCyclesSpentWorking
  create_bd_pin -dir O -from 31 -to 0 STAT_MemWriteCountBytesTransferred
  create_bd_pin -dir O -from 31 -to 0 STAT_MemWriteCountTransactions
  create_bd_pin -dir O -from 31 -to 0 STAT_MemWriteCyclesIdle
  create_bd_pin -dir O -from 31 -to 0 STAT_MemWriteCyclesSpentWorking
  create_bd_pin -dir O -type clk addn_ui_clkout1
  create_bd_pin -dir O -type clk c0_ddr4_ui_clk
  create_bd_pin -dir I -type clk rd_clk
  create_bd_pin -dir I -type rst reset

  # Create instance: ClearBlockWriteRequestsFIFO, and set properties
  set ClearBlockWriteRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ClearBlockWriteRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {294} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {294} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ClearBlockWriteRequestsFIFO

  # Create instance: CommandProcReadRequestsFIFO, and set properties
  set CommandProcReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 CommandProcReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $CommandProcReadRequestsFIFO

  # Create instance: CommandProcReadResponsesFIFO, and set properties
  set CommandProcReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 CommandProcReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $CommandProcReadResponsesFIFO

  # Create instance: CommandProcWriteRequestsFIFO, and set properties
  set CommandProcWriteRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 CommandProcWriteRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {294} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {294} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $CommandProcWriteRequestsFIFO

  # Create instance: IAReadRequestsFIFO, and set properties
  set IAReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 IAReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $IAReadRequestsFIFO

  # Create instance: IAReadResponsesFIFO, and set properties
  set IAReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 IAReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $IAReadResponsesFIFO

  # Create instance: MemoryController_0, and set properties
  set block_name MemoryController
  set block_cell_name MemoryController_0
  if { [catch {set MemoryController_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MemoryController_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ROPReadRequestsFIFO, and set properties
  set ROPReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ROPReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ROPReadRequestsFIFO

  # Create instance: ROPReadResponsesFIFO, and set properties
  set ROPReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ROPReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ROPReadResponsesFIFO

  # Create instance: ROPWriteRequestsFIFO, and set properties
  set ROPWriteRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ROPWriteRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {294} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {294} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ROPWriteRequestsFIFO

  # Create instance: ScanoutReadRequestsFIFO, and set properties
  set ScanoutReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ScanoutReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {201} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ScanoutReadRequestsFIFO

  # Create instance: ScanoutReadResponsesFIFO, and set properties
  set ScanoutReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ScanoutReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {201} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ScanoutReadResponsesFIFO

  # Create instance: StatsWriteRequestsFIFO, and set properties
  set StatsWriteRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 StatsWriteRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {294} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {294} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {true} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $StatsWriteRequestsFIFO

  # Create instance: TexFetchReadRequestsFIFO, and set properties
  set TexFetchReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 TexFetchReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $TexFetchReadRequestsFIFO

  # Create instance: TexFetchReadResponsesFIFO, and set properties
  set TexFetchReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 TexFetchReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $TexFetchReadResponsesFIFO

  # Create instance: ZStencilReadRequestsFIFO, and set properties
  set ZStencilReadRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ZStencilReadRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {30} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {30} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ZStencilReadRequestsFIFO

  # Create instance: ZStencilReadResponsesFIFO, and set properties
  set ZStencilReadResponsesFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ZStencilReadResponsesFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {286} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {286} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ZStencilReadResponsesFIFO

  # Create instance: ZStencilWriteRequestsFIFO, and set properties
  set ZStencilWriteRequestsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 ZStencilWriteRequestsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {294} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {294} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $ZStencilWriteRequestsFIFO

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.ADDN_UI_CLKOUT1_FREQ_HZ {250} \
   CONFIG.C0.BANK_GROUP_WIDTH {1} \
   CONFIG.C0.DDR4_AxiAddressWidth {30} \
   CONFIG.C0.DDR4_AxiDataWidth {256} \
   CONFIG.C0.DDR4_AxiNarrowBurst {false} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {3} \
   CONFIG.C0.DDR4_DataWidth {32} \
   CONFIG.C0.DDR4_InputClockPeriod {3334} \
   CONFIG.C0.DDR4_MemoryPart {MT40A256M16GE-075E} \
   CONFIG.C0_CLOCK_BOARD_INTERFACE {default_sysclk1_300} \
   CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram_c1} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
 ] $ddr4_0

  # Create instance: rst_ddr4_0_333M, and set properties
  set rst_ddr4_0_333M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ddr4_0_333M ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins FIFO_WRITE] [get_bd_intf_pins CommandProcReadRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins FIFO_READ] [get_bd_intf_pins CommandProcReadResponsesFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins FIFO_WRITE1] [get_bd_intf_pins CommandProcWriteRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins FIFO_WRITE2] [get_bd_intf_pins IAReadRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins FIFO_READ1] [get_bd_intf_pins IAReadResponsesFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins FIFO_WRITE3] [get_bd_intf_pins TexFetchReadRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins FIFO_READ2] [get_bd_intf_pins TexFetchReadResponsesFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins FIFO_WRITE4] [get_bd_intf_pins ROPReadRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn9 [get_bd_intf_pins FIFO_READ3] [get_bd_intf_pins ROPReadResponsesFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn10 [get_bd_intf_pins FIFO_WRITE5] [get_bd_intf_pins ROPWriteRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn11 [get_bd_intf_pins FIFO_WRITE6] [get_bd_intf_pins ScanoutReadRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn12 [get_bd_intf_pins FIFO_READ4] [get_bd_intf_pins ScanoutReadResponsesFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net Conn13 [get_bd_intf_pins FIFO_WRITE7] [get_bd_intf_pins ClearBlockWriteRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net Conn14 [get_bd_intf_pins FIFO_WRITE8] [get_bd_intf_pins StatsWriteRequestsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MemoryController_0_ClearBlockWriteRequests [get_bd_intf_pins ClearBlockWriteRequestsFIFO/FIFO_READ] [get_bd_intf_pins MemoryController_0/ClearBlockWriteRequests]
  connect_bd_intf_net -intf_net MemoryController_0_CommandProcReadRequests [get_bd_intf_pins CommandProcReadRequestsFIFO/FIFO_READ] [get_bd_intf_pins MemoryController_0/CommandProcReadRequests]
  connect_bd_intf_net -intf_net MemoryController_0_CommandProcReadResponses [get_bd_intf_pins CommandProcReadResponsesFIFO/FIFO_WRITE] [get_bd_intf_pins MemoryController_0/CommandProcReadResponses]
  connect_bd_intf_net -intf_net MemoryController_0_CommandProcWriteRequests [get_bd_intf_pins CommandProcWriteRequestsFIFO/FIFO_READ] [get_bd_intf_pins MemoryController_0/CommandProcWriteRequests]
  connect_bd_intf_net -intf_net MemoryController_0_IAReadRequests [get_bd_intf_pins IAReadRequestsFIFO/FIFO_READ] [get_bd_intf_pins MemoryController_0/IAReadRequests]
  connect_bd_intf_net -intf_net MemoryController_0_IAReadResponses [get_bd_intf_pins IAReadResponsesFIFO/FIFO_WRITE] [get_bd_intf_pins MemoryController_0/IAReadResponses]
  connect_bd_intf_net -intf_net MemoryController_0_M_AXI [get_bd_intf_pins MemoryController_0/M_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net MemoryController_0_ROPReadRequests [get_bd_intf_pins MemoryController_0/ROPReadRequests] [get_bd_intf_pins ROPReadRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_ROPReadResponses [get_bd_intf_pins MemoryController_0/ROPReadResponses] [get_bd_intf_pins ROPReadResponsesFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MemoryController_0_ROPWriteRequests [get_bd_intf_pins MemoryController_0/ROPWriteRequests] [get_bd_intf_pins ROPWriteRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_ScanoutReadRequests [get_bd_intf_pins MemoryController_0/ScanoutReadRequests] [get_bd_intf_pins ScanoutReadRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_ScanoutReadResponses [get_bd_intf_pins MemoryController_0/ScanoutReadResponses] [get_bd_intf_pins ScanoutReadResponsesFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MemoryController_0_StatsWriteRequests [get_bd_intf_pins MemoryController_0/StatsWriteRequests] [get_bd_intf_pins StatsWriteRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_TexFetchReadRequests [get_bd_intf_pins MemoryController_0/TexFetchReadRequests] [get_bd_intf_pins TexFetchReadRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_TexFetchReadResponses [get_bd_intf_pins MemoryController_0/TexFetchReadResponses] [get_bd_intf_pins TexFetchReadResponsesFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MemoryController_0_ZStencilReadRequests [get_bd_intf_pins MemoryController_0/ZStencilReadRequests] [get_bd_intf_pins ZStencilReadRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net MemoryController_0_ZStencilReadResponses [get_bd_intf_pins MemoryController_0/ZStencilReadResponses] [get_bd_intf_pins ZStencilReadResponsesFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MemoryController_0_ZStencilWriteRequests [get_bd_intf_pins MemoryController_0/ZStencilWriteRequests] [get_bd_intf_pins ZStencilWriteRequestsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_pins ddr4_sdram_c1] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net default_sysclk1_300_1 [get_bd_intf_pins default_sysclk1_300] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]

  # Create port connections
  connect_bd_net -net MemoryController_0_CMD_MemoryControllerIsIdle [get_bd_pins CMD_MemoryControllerIsIdle] [get_bd_pins MemoryController_0/CMD_MemoryControllerIsIdle]
  connect_bd_net -net MemoryController_0_DBG_LastReadAddress [get_bd_pins DBG_LastReadAddress] [get_bd_pins MemoryController_0/DBG_LastReadAddress]
  connect_bd_net -net MemoryController_0_DBG_LastReadMemoryClientIndex [get_bd_pins DBG_LastReadMemoryClientIndex] [get_bd_pins MemoryController_0/DBG_LastReadMemoryClientIndex]
  connect_bd_net -net MemoryController_0_DBG_LastWriteAddress [get_bd_pins DBG_LastWriteAddress] [get_bd_pins MemoryController_0/DBG_LastWriteAddress]
  connect_bd_net -net MemoryController_0_DBG_LastWriteData [get_bd_pins DBG_LastWriteData] [get_bd_pins MemoryController_0/DBG_LastWriteData]
  connect_bd_net -net MemoryController_0_DBG_LastWriteDataDWORDEnables [get_bd_pins DBG_LastWriteDataDWORDEnables] [get_bd_pins MemoryController_0/DBG_LastWriteDataDWORDEnables]
  connect_bd_net -net MemoryController_0_DBG_LastWriteMemoryClientIndex [get_bd_pins DBG_LastWriteMemoryClientIndex] [get_bd_pins MemoryController_0/DBG_LastWriteMemoryClientIndex]
  connect_bd_net -net MemoryController_0_DBG_NewReadDataReady [get_bd_pins DBG_NewReadDataReady] [get_bd_pins MemoryController_0/DBG_NewReadDataReady]
  connect_bd_net -net MemoryController_0_DBG_NewReadEnable [get_bd_pins DBG_NewReadEnable] [get_bd_pins MemoryController_0/DBG_NewReadEnable]
  connect_bd_net -net MemoryController_0_DBG_ReadControlState [get_bd_pins DBG_ReadControlState] [get_bd_pins MemoryController_0/DBG_ReadControlState]
  connect_bd_net -net MemoryController_0_DBG_ReadState [get_bd_pins DBG_ReadState] [get_bd_pins MemoryController_0/DBG_ReadState]
  connect_bd_net -net MemoryController_0_DBG_ReadyForNewRead [get_bd_pins DBG_ReadyForNewRead] [get_bd_pins MemoryController_0/DBG_ReadyForNewRead]
  connect_bd_net -net MemoryController_0_DBG_ScanoutReadRequests_Empty [get_bd_pins DBG_ScanoutReadRequests_Empty] [get_bd_pins MemoryController_0/DBG_ScanoutReadRequests_Empty]
  connect_bd_net -net MemoryController_0_DBG_ScanoutReadRequests_rd_en [get_bd_pins DBG_ScanoutReadRequests_rd_en] [get_bd_pins MemoryController_0/DBG_ScanoutReadRequests_rd_en]
  connect_bd_net -net MemoryController_0_DBG_ScanoutReadResponses_Full [get_bd_pins DBG_ScanoutReadResponses_Full] [get_bd_pins MemoryController_0/DBG_ScanoutReadResponses_Full]
  connect_bd_net -net MemoryController_0_DBG_WriteControlState [get_bd_pins DBG_WriteControlState] [get_bd_pins MemoryController_0/DBG_WriteControlState]
  connect_bd_net -net MemoryController_0_DBG_WriteState [get_bd_pins DBG_WriteState] [get_bd_pins MemoryController_0/DBG_WriteState]
  connect_bd_net -net MemoryController_0_STAT_MemReadCountBytesTransferred [get_bd_pins STAT_MemReadCountBytesTransferred] [get_bd_pins MemoryController_0/STAT_MemReadCountBytesTransferred]
  connect_bd_net -net MemoryController_0_STAT_MemReadCountNonScanoutBytesTransferred [get_bd_pins STAT_MemReadCountNonScanoutBytesTransferred] [get_bd_pins MemoryController_0/STAT_MemReadCountNonScanoutBytesTransferred]
  connect_bd_net -net MemoryController_0_STAT_MemReadCountNonScanoutTransactions [get_bd_pins STAT_MemReadCountNonScanoutTransactions] [get_bd_pins MemoryController_0/STAT_MemReadCountNonScanoutTransactions]
  connect_bd_net -net MemoryController_0_STAT_MemReadCountTransactions [get_bd_pins STAT_MemReadCountTransactions] [get_bd_pins MemoryController_0/STAT_MemReadCountTransactions]
  connect_bd_net -net MemoryController_0_STAT_MemReadCyclesIdle [get_bd_pins STAT_MemReadCyclesIdle] [get_bd_pins MemoryController_0/STAT_MemReadCyclesIdle]
  connect_bd_net -net MemoryController_0_STAT_MemReadCyclesSpentWorking [get_bd_pins STAT_MemReadCyclesSpentWorking] [get_bd_pins MemoryController_0/STAT_MemReadCyclesSpentWorking]
  connect_bd_net -net MemoryController_0_STAT_MemWriteCountBytesTransferred [get_bd_pins STAT_MemWriteCountBytesTransferred] [get_bd_pins MemoryController_0/STAT_MemWriteCountBytesTransferred]
  connect_bd_net -net MemoryController_0_STAT_MemWriteCountTransactions [get_bd_pins STAT_MemWriteCountTransactions] [get_bd_pins MemoryController_0/STAT_MemWriteCountTransactions]
  connect_bd_net -net MemoryController_0_STAT_MemWriteCyclesIdle [get_bd_pins STAT_MemWriteCyclesIdle] [get_bd_pins MemoryController_0/STAT_MemWriteCyclesIdle]
  connect_bd_net -net MemoryController_0_STAT_MemWriteCyclesSpentWorking [get_bd_pins STAT_MemWriteCyclesSpentWorking] [get_bd_pins MemoryController_0/STAT_MemWriteCyclesSpentWorking]
  connect_bd_net -net ResetN_UntilClockLoc_0_resetn [get_bd_pins M_AXI_ARESETN] [get_bd_pins MemoryController_0/M_AXI_ARESETN]
  connect_bd_net -net ddr4_0_addn_ui_clkout1 [get_bd_pins addn_ui_clkout1] [get_bd_pins ddr4_0/addn_ui_clkout1]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins c0_ddr4_ui_clk] [get_bd_pins ClearBlockWriteRequestsFIFO/rd_clk] [get_bd_pins ClearBlockWriteRequestsFIFO/wr_clk] [get_bd_pins CommandProcReadRequestsFIFO/rd_clk] [get_bd_pins CommandProcReadRequestsFIFO/wr_clk] [get_bd_pins CommandProcReadResponsesFIFO/rd_clk] [get_bd_pins CommandProcReadResponsesFIFO/wr_clk] [get_bd_pins CommandProcWriteRequestsFIFO/rd_clk] [get_bd_pins CommandProcWriteRequestsFIFO/wr_clk] [get_bd_pins IAReadRequestsFIFO/rd_clk] [get_bd_pins IAReadRequestsFIFO/wr_clk] [get_bd_pins IAReadResponsesFIFO/rd_clk] [get_bd_pins IAReadResponsesFIFO/wr_clk] [get_bd_pins MemoryController_0/M_AXI_ACLK] [get_bd_pins ROPReadRequestsFIFO/rd_clk] [get_bd_pins ROPReadRequestsFIFO/wr_clk] [get_bd_pins ROPReadResponsesFIFO/rd_clk] [get_bd_pins ROPReadResponsesFIFO/wr_clk] [get_bd_pins ROPWriteRequestsFIFO/rd_clk] [get_bd_pins ROPWriteRequestsFIFO/wr_clk] [get_bd_pins ScanoutReadRequestsFIFO/rd_clk] [get_bd_pins ScanoutReadResponsesFIFO/wr_clk] [get_bd_pins StatsWriteRequestsFIFO/rd_clk] [get_bd_pins StatsWriteRequestsFIFO/wr_clk] [get_bd_pins TexFetchReadRequestsFIFO/rd_clk] [get_bd_pins TexFetchReadRequestsFIFO/wr_clk] [get_bd_pins TexFetchReadResponsesFIFO/rd_clk] [get_bd_pins TexFetchReadResponsesFIFO/wr_clk] [get_bd_pins ZStencilReadRequestsFIFO/rd_clk] [get_bd_pins ZStencilReadRequestsFIFO/wr_clk] [get_bd_pins ZStencilReadResponsesFIFO/rd_clk] [get_bd_pins ZStencilReadResponsesFIFO/wr_clk] [get_bd_pins ZStencilWriteRequestsFIFO/rd_clk] [get_bd_pins ZStencilWriteRequestsFIFO/wr_clk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins rst_ddr4_0_333M/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins rst_ddr4_0_333M/ext_reset_in]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins MemoryController_0/c0_init_calib_complete] [get_bd_pins ddr4_0/c0_init_calib_complete]
  connect_bd_net -net rd_clk_1 [get_bd_pins rd_clk] [get_bd_pins ScanoutReadRequestsFIFO/wr_clk] [get_bd_pins ScanoutReadResponsesFIFO/rd_clk]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins ddr4_0/sys_rst]
  connect_bd_net -net rst_ddr4_0_333M_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins rst_ddr4_0_333M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_sdram_c1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c1 ]
  set default_sysclk1_300 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_sysclk1_300 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $default_sysclk1_300
  set rs232_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart ]

  # Create ports
  set blue [ create_bd_port -dir O -from 3 -to 0 -type data blue ]
  set green [ create_bd_port -dir O -from 4 -to 0 -type data green ]
  set hsync [ create_bd_port -dir O -type data hsync ]
  set red [ create_bd_port -dir O -from 4 -to 0 -type data red ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set vsync [ create_bd_port -dir O -type data vsync ]

  # Create instance: AttrInterpolator_0, and set properties
  set block_name AttrInterpolator
  set block_cell_name AttrInterpolator_0
  if { [catch {set AttrInterpolator_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AttrInterpolator_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ClearBlock_0, and set properties
  set block_name ClearBlock
  set block_cell_name ClearBlock_0
  if { [catch {set ClearBlock_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ClearBlock_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CommandProcessor_0, and set properties
  set block_name CommandProcessor
  set block_cell_name CommandProcessor_0
  if { [catch {set CommandProcessor_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CommandProcessor_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ILA_AttrInterpolator, and set properties
  set ILA_AttrInterpolator [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ILA_AttrInterpolator ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {11} \
   CONFIG.C_PROBE0_WIDTH {16} \
   CONFIG.C_PROBE10_WIDTH {3} \
   CONFIG.C_PROBE11_WIDTH {1} \
   CONFIG.C_PROBE12_WIDTH {1} \
   CONFIG.C_PROBE13_WIDTH {1} \
   CONFIG.C_PROBE14_WIDTH {1} \
   CONFIG.C_PROBE15_WIDTH {1} \
   CONFIG.C_PROBE16_WIDTH {1} \
   CONFIG.C_PROBE1_WIDTH {16} \
   CONFIG.C_PROBE2_WIDTH {32} \
   CONFIG.C_PROBE3_WIDTH {16} \
   CONFIG.C_PROBE4_WIDTH {16} \
   CONFIG.C_PROBE5_WIDTH {24} \
   CONFIG.C_PROBE6_WIDTH {6} \
   CONFIG.C_PROBE7_WIDTH {32} \
   CONFIG.C_PROBE8_WIDTH {32} \
   CONFIG.C_PROBE9_WIDTH {32} \
 ] $ILA_AttrInterpolator

  # Create instance: ILA_IA, and set properties
  set ILA_IA [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ILA_IA ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU {true} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {20} \
   CONFIG.C_PROBE0_TYPE {0} \
   CONFIG.C_PROBE0_WIDTH {16} \
   CONFIG.C_PROBE10_WIDTH {16} \
   CONFIG.C_PROBE11_WIDTH {16} \
   CONFIG.C_PROBE12_WIDTH {16} \
   CONFIG.C_PROBE13_WIDTH {16} \
   CONFIG.C_PROBE14_WIDTH {16} \
   CONFIG.C_PROBE15_WIDTH {6} \
   CONFIG.C_PROBE16_WIDTH {16} \
   CONFIG.C_PROBE17_WIDTH {16} \
   CONFIG.C_PROBE18_WIDTH {16} \
   CONFIG.C_PROBE19_WIDTH {16} \
   CONFIG.C_PROBE1_TYPE {0} \
   CONFIG.C_PROBE1_WIDTH {16} \
   CONFIG.C_PROBE2_TYPE {0} \
   CONFIG.C_PROBE2_WIDTH {24} \
   CONFIG.C_PROBE3_TYPE {0} \
   CONFIG.C_PROBE3_WIDTH {16} \
   CONFIG.C_PROBE4_TYPE {0} \
   CONFIG.C_PROBE4_WIDTH {16} \
   CONFIG.C_PROBE5_TYPE {0} \
   CONFIG.C_PROBE5_WIDTH {32} \
   CONFIG.C_PROBE6_WIDTH {16} \
   CONFIG.C_PROBE7_WIDTH {16} \
   CONFIG.C_PROBE8_WIDTH {32} \
   CONFIG.C_PROBE9_WIDTH {16} \
 ] $ILA_IA

  # Create instance: ILA_TexSampler, and set properties
  set ILA_TexSampler [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ILA_TexSampler ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {11} \
   CONFIG.C_PROBE0_WIDTH {6} \
   CONFIG.C_PROBE10_WIDTH {3} \
   CONFIG.C_PROBE1_WIDTH {8} \
   CONFIG.C_PROBE2_WIDTH {8} \
   CONFIG.C_PROBE3_WIDTH {8} \
   CONFIG.C_PROBE4_WIDTH {8} \
   CONFIG.C_PROBE5_WIDTH {32} \
   CONFIG.C_PROBE6_WIDTH {32} \
   CONFIG.C_PROBE7_WIDTH {14} \
   CONFIG.C_PROBE8_WIDTH {3} \
   CONFIG.C_PROBE9_WIDTH {3} \
 ] $ILA_TexSampler

  # Create instance: ILA_TriSetup, and set properties
  set ILA_TriSetup [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ILA_TriSetup ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {42} \
   CONFIG.C_PROBE0_WIDTH {24} \
   CONFIG.C_PROBE10_WIDTH {32} \
   CONFIG.C_PROBE11_WIDTH {32} \
   CONFIG.C_PROBE12_WIDTH {32} \
   CONFIG.C_PROBE13_WIDTH {16} \
   CONFIG.C_PROBE14_WIDTH {16} \
   CONFIG.C_PROBE15_WIDTH {16} \
   CONFIG.C_PROBE16_WIDTH {16} \
   CONFIG.C_PROBE17_WIDTH {32} \
   CONFIG.C_PROBE18_WIDTH {32} \
   CONFIG.C_PROBE19_WIDTH {32} \
   CONFIG.C_PROBE1_WIDTH {24} \
   CONFIG.C_PROBE23_WIDTH {16} \
   CONFIG.C_PROBE24_WIDTH {16} \
   CONFIG.C_PROBE25_WIDTH {16} \
   CONFIG.C_PROBE26_WIDTH {16} \
   CONFIG.C_PROBE27_WIDTH {16} \
   CONFIG.C_PROBE28_WIDTH {16} \
   CONFIG.C_PROBE2_WIDTH {24} \
   CONFIG.C_PROBE30_WIDTH {8} \
   CONFIG.C_PROBE31_WIDTH {16} \
   CONFIG.C_PROBE32_WIDTH {16} \
   CONFIG.C_PROBE33_WIDTH {16} \
   CONFIG.C_PROBE34_WIDTH {16} \
   CONFIG.C_PROBE35_WIDTH {16} \
   CONFIG.C_PROBE36_WIDTH {16} \
   CONFIG.C_PROBE37_WIDTH {16} \
   CONFIG.C_PROBE38_WIDTH {16} \
   CONFIG.C_PROBE39_WIDTH {32} \
   CONFIG.C_PROBE3_WIDTH {24} \
   CONFIG.C_PROBE40_WIDTH {32} \
   CONFIG.C_PROBE41_WIDTH {32} \
   CONFIG.C_PROBE4_WIDTH {16} \
   CONFIG.C_PROBE5_WIDTH {16} \
   CONFIG.C_PROBE6_WIDTH {16} \
   CONFIG.C_PROBE7_WIDTH {16} \
   CONFIG.C_PROBE8_WIDTH {16} \
   CONFIG.C_PROBE9_WIDTH {16} \
 ] $ILA_TriSetup

  # Create instance: IndexBufferCache, and set properties
  set IndexBufferCache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 IndexBufferCache ]
  set_property -dict [ list \
   CONFIG.Algorithm {Minimum_Area} \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Fill_Remaining_Memory_Locations {true} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {2048} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $IndexBufferCache

  # Create instance: InputAssembler_0, and set properties
  set block_name InputAssembler
  set block_cell_name InputAssembler_0
  if { [catch {set InputAssembler_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $InputAssembler_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: InterpolatorRecip, and set properties
  set block_name Reciprocal
  set block_cell_name InterpolatorRecip
  if { [catch {set InterpolatorRecip [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $InterpolatorRecip eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MemorySystem
  create_hier_cell_MemorySystem [current_bd_instance .] MemorySystem

  # Create instance: ROP_0, and set properties
  set block_name ROP
  set block_cell_name ROP_0
  if { [catch {set ROP_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ROP_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Rasterizer_0, and set properties
  set block_name Rasterizer
  set block_cell_name Rasterizer_0
  if { [catch {set Rasterizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Rasterizer_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ResetN_UntilClockLoc_0, and set properties
  set block_name ResetN_UntilClockLocked
  set block_cell_name ResetN_UntilClockLoc_0
  if { [catch {set ResetN_UntilClockLoc_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ResetN_UntilClockLoc_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ScanoutSystem
  create_hier_cell_ScanoutSystem [current_bd_instance .] ScanoutSystem

  # Create instance: SerialPacketSystem
  create_hier_cell_SerialPacketSystem [current_bd_instance .] SerialPacketSystem

  # Create instance: StatsCollector_0, and set properties
  set block_name StatsCollector
  set block_cell_name StatsCollector_0
  if { [catch {set StatsCollector_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $StatsCollector_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TexSample_0, and set properties
  set block_name TexSample
  set block_cell_name TexSample_0
  if { [catch {set TexSample_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $TexSample_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TextureCache_128x128x32bits, and set properties
  set TextureCache_128x128x32bits [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 TextureCache_128x128x32bits ]
  set_property -dict [ list \
   CONFIG.Assume_Synchronous_Clk {true} \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {Single_Port_RAM} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.PRIM_type_to_Implement {URAM} \
   CONFIG.Port_B_Clock {0} \
   CONFIG.Port_B_Enable_Rate {0} \
   CONFIG.Port_B_Write_Rate {0} \
   CONFIG.Read_Width_A {32} \
   CONFIG.Read_Width_B {32} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_REGCEA_Pin {false} \
   CONFIG.Use_REGCEB_Pin {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {16384} \
   CONFIG.Write_Width_A {32} \
   CONFIG.Write_Width_B {32} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $TextureCache_128x128x32bits

  # Create instance: TriSetupRecip, and set properties
  set block_name Reciprocal
  set block_cell_name TriSetupRecip
  if { [catch {set TriSetupRecip [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $TriSetupRecip eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TriSetup_0, and set properties
  set block_name TriSetup
  set block_cell_name TriSetup_0
  if { [catch {set TriSetup_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $TriSetup_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TriWorkCache_0, and set properties
  set block_name TriWorkCache
  set block_cell_name TriWorkCache_0
  if { [catch {set TriWorkCache_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $TriWorkCache_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: constant_always_locked, and set properties
  set constant_always_locked [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 constant_always_locked ]

  # Create instance: ila_333_250, and set properties
  set ila_333_250 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_333_250 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {39} \
   CONFIG.C_PROBE0_TYPE {0} \
   CONFIG.C_PROBE0_WIDTH {8} \
   CONFIG.C_PROBE10_TYPE {0} \
   CONFIG.C_PROBE10_WIDTH {4} \
   CONFIG.C_PROBE11_TYPE {0} \
   CONFIG.C_PROBE11_WIDTH {4} \
   CONFIG.C_PROBE12_TYPE {0} \
   CONFIG.C_PROBE12_WIDTH {4} \
   CONFIG.C_PROBE13_TYPE {0} \
   CONFIG.C_PROBE13_WIDTH {4} \
   CONFIG.C_PROBE14_TYPE {0} \
   CONFIG.C_PROBE14_WIDTH {4} \
   CONFIG.C_PROBE15_TYPE {0} \
   CONFIG.C_PROBE16_TYPE {0} \
   CONFIG.C_PROBE17_TYPE {0} \
   CONFIG.C_PROBE18_TYPE {0} \
   CONFIG.C_PROBE19_TYPE {0} \
   CONFIG.C_PROBE1_TYPE {0} \
   CONFIG.C_PROBE1_WIDTH {88} \
   CONFIG.C_PROBE20_TYPE {0} \
   CONFIG.C_PROBE21_TYPE {0} \
   CONFIG.C_PROBE21_WIDTH {294} \
   CONFIG.C_PROBE22_TYPE {0} \
   CONFIG.C_PROBE22_WIDTH {30} \
   CONFIG.C_PROBE23_TYPE {0} \
   CONFIG.C_PROBE23_WIDTH {256} \
   CONFIG.C_PROBE24_TYPE {0} \
   CONFIG.C_PROBE24_WIDTH {8} \
   CONFIG.C_PROBE25_TYPE {0} \
   CONFIG.C_PROBE25_WIDTH {3} \
   CONFIG.C_PROBE26_TYPE {0} \
   CONFIG.C_PROBE26_WIDTH {30} \
   CONFIG.C_PROBE27_TYPE {0} \
   CONFIG.C_PROBE27_WIDTH {3} \
   CONFIG.C_PROBE28_TYPE {0} \
   CONFIG.C_PROBE28_WIDTH {7} \
   CONFIG.C_PROBE29_TYPE {0} \
   CONFIG.C_PROBE29_WIDTH {16} \
   CONFIG.C_PROBE2_TYPE {0} \
   CONFIG.C_PROBE2_WIDTH {88} \
   CONFIG.C_PROBE30_TYPE {0} \
   CONFIG.C_PROBE30_WIDTH {16} \
   CONFIG.C_PROBE31_TYPE {0} \
   CONFIG.C_PROBE31_WIDTH {16} \
   CONFIG.C_PROBE32_TYPE {0} \
   CONFIG.C_PROBE32_WIDTH {16} \
   CONFIG.C_PROBE33_TYPE {0} \
   CONFIG.C_PROBE33_WIDTH {16} \
   CONFIG.C_PROBE34_TYPE {0} \
   CONFIG.C_PROBE34_WIDTH {16} \
   CONFIG.C_PROBE35_WIDTH {30} \
   CONFIG.C_PROBE37_WIDTH {32} \
   CONFIG.C_PROBE38_WIDTH {4} \
   CONFIG.C_PROBE39_WIDTH {1} \
   CONFIG.C_PROBE3_TYPE {0} \
   CONFIG.C_PROBE3_WIDTH {32} \
   CONFIG.C_PROBE40_WIDTH {1} \
   CONFIG.C_PROBE41_WIDTH {1} \
   CONFIG.C_PROBE4_TYPE {0} \
   CONFIG.C_PROBE4_WIDTH {6} \
   CONFIG.C_PROBE5_TYPE {0} \
   CONFIG.C_PROBE5_WIDTH {8} \
   CONFIG.C_PROBE6_TYPE {0} \
   CONFIG.C_PROBE6_WIDTH {4} \
   CONFIG.C_PROBE7_TYPE {0} \
   CONFIG.C_PROBE7_WIDTH {6} \
   CONFIG.C_PROBE8_TYPE {0} \
   CONFIG.C_PROBE8_WIDTH {6} \
   CONFIG.C_PROBE9_TYPE {0} \
   CONFIG.C_PROBE9_WIDTH {4} \
 ] $ila_333_250

  # Create instance: no_reset, and set properties
  set no_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 no_reset ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $no_reset

  # Create instance: placeholder_texcfg, and set properties
  set placeholder_texcfg [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 placeholder_texcfg ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $placeholder_texcfg

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
 ] $proc_sys_reset_0

  # Create instance: rast_out_fifo, and set properties
  set rast_out_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 rast_out_fifo ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {4} \
   CONFIG.Empty_Threshold_Negate_Value {5} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {128} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {128} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {true} \
   CONFIG.Write_Data_Count_Width {9} \
   CONFIG.asymmetric_port_width {false} \
 ] $rast_out_fifo

  # Create instance: texcoordX_cache, and set properties
  set texcoordX_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 texcoordX_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $texcoordX_cache

  # Create instance: texcoordY_cache, and set properties
  set texcoordY_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 texcoordY_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $texcoordY_cache

  # Create instance: vertColor_cache, and set properties
  set vertColor_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 vertColor_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $vertColor_cache

  # Create instance: vertPosInvZ_cache, and set properties
  set vertPosInvZ_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 vertPosInvZ_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $vertPosInvZ_cache

  # Create instance: vertPosX_cache, and set properties
  set vertPosX_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 vertPosX_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $vertPosX_cache

  # Create instance: vertPosY_cache, and set properties
  set vertPosY_cache [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 vertPosY_cache ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {1024} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $vertPosY_cache

  # Create interface connections
  connect_bd_intf_net -intf_net AttrInterpolator_0_RASTOUT_FIFO [get_bd_intf_pins AttrInterpolator_0/RASTOUT_FIFO] [get_bd_intf_pins rast_out_fifo/FIFO_READ]
  connect_bd_intf_net -intf_net ClearBlock_0_ClearBlockWriteRequestsFIFO [get_bd_intf_pins ClearBlock_0/ClearBlockWriteRequestsFIFO] [get_bd_intf_pins MemorySystem/FIFO_WRITE7]
  connect_bd_intf_net -intf_net CommandProcessor_0_CommandProcReadRequestsFIFO [get_bd_intf_pins CommandProcessor_0/CommandProcReadRequestsFIFO] [get_bd_intf_pins MemorySystem/FIFO_WRITE]
  connect_bd_intf_net -intf_net CommandProcessor_0_CommandProcReadResponses [get_bd_intf_pins CommandProcessor_0/CommandProcReadResponses] [get_bd_intf_pins MemorySystem/FIFO_READ]
  connect_bd_intf_net -intf_net CommandProcessor_0_CommandProcWriteRequests [get_bd_intf_pins CommandProcessor_0/CommandProcWriteRequests] [get_bd_intf_pins MemorySystem/FIFO_WRITE1]
  connect_bd_intf_net -intf_net CommandProcessor_0_returnPacketsFIFO [get_bd_intf_pins CommandProcessor_0/returnPacketsFIFO] [get_bd_intf_pins SerialPacketSystem/FIFO_WRITE]
  connect_bd_intf_net -intf_net CommandProcessor_0_validPacketsFIFO [get_bd_intf_pins CommandProcessor_0/validPacketsFIFO] [get_bd_intf_pins SerialPacketSystem/FIFO_READ]
  connect_bd_intf_net -intf_net InputAssembler_0_IAReadRequests [get_bd_intf_pins InputAssembler_0/IAReadRequests] [get_bd_intf_pins MemorySystem/FIFO_WRITE2]
  connect_bd_intf_net -intf_net InputAssembler_0_IAReadResponses [get_bd_intf_pins InputAssembler_0/IAReadResponses] [get_bd_intf_pins MemorySystem/FIFO_READ1]
  connect_bd_intf_net -intf_net InputAssembler_0_IBCache [get_bd_intf_pins IndexBufferCache/BRAM_PORTA] [get_bd_intf_pins InputAssembler_0/IBCache]
  connect_bd_intf_net -intf_net InputAssembler_0_VBColorCache [get_bd_intf_pins InputAssembler_0/VBColorCache] [get_bd_intf_pins vertColor_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net InputAssembler_0_VBInvZPosCache [get_bd_intf_pins InputAssembler_0/VBInvZPosCache] [get_bd_intf_pins vertPosInvZ_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net InputAssembler_0_VBTexXCache [get_bd_intf_pins InputAssembler_0/VBTexXCache] [get_bd_intf_pins texcoordX_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net InputAssembler_0_VBTexYCache [get_bd_intf_pins InputAssembler_0/VBTexYCache] [get_bd_intf_pins texcoordY_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net InputAssembler_0_VBXPosCache [get_bd_intf_pins InputAssembler_0/VBXPosCache] [get_bd_intf_pins vertPosX_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net InputAssembler_0_VBYPosCache [get_bd_intf_pins InputAssembler_0/VBYPosCache] [get_bd_intf_pins vertPosY_cache/BRAM_PORTA]
  connect_bd_intf_net -intf_net ROP_0_ROPReadRequestsFIFO [get_bd_intf_pins MemorySystem/FIFO_WRITE4] [get_bd_intf_pins ROP_0/ROPReadRequestsFIFO]
  connect_bd_intf_net -intf_net ROP_0_ROPReadResponses [get_bd_intf_pins MemorySystem/FIFO_READ3] [get_bd_intf_pins ROP_0/ROPReadResponses]
  connect_bd_intf_net -intf_net ROP_0_ROPWriteRequestsFIFO [get_bd_intf_pins MemorySystem/FIFO_WRITE5] [get_bd_intf_pins ROP_0/ROPWriteRequestsFIFO]
  connect_bd_intf_net -intf_net Rasterizer_0_RASTOUT_FIFO [get_bd_intf_pins Rasterizer_0/RASTOUT_FIFO] [get_bd_intf_pins rast_out_fifo/FIFO_WRITE]
  connect_bd_intf_net -intf_net ScanOut_0_ScanoutReadRequestsFIFO [get_bd_intf_pins MemorySystem/FIFO_WRITE6] [get_bd_intf_pins ScanoutSystem/ScanoutReadRequestsFIFO]
  connect_bd_intf_net -intf_net ScanOut_0_ScanoutReadResponses [get_bd_intf_pins MemorySystem/FIFO_READ4] [get_bd_intf_pins ScanoutSystem/ScanoutReadResponses]
  connect_bd_intf_net -intf_net SerialPacketSystem_rs232_uart [get_bd_intf_ports rs232_uart] [get_bd_intf_pins SerialPacketSystem/rs232_uart]
  connect_bd_intf_net -intf_net StatsCollector_0_StatsWriteRequestsFIFO [get_bd_intf_pins MemorySystem/FIFO_WRITE8] [get_bd_intf_pins StatsCollector_0/StatsWriteRequestsFIFO]
  connect_bd_intf_net -intf_net TexSample_0_TexCache [get_bd_intf_pins TexSample_0/TexCache] [get_bd_intf_pins TextureCache_128x128x32bits/BRAM_PORTA]
  connect_bd_intf_net -intf_net TexSample_0_TexSampReadRequestsFIFO [get_bd_intf_pins MemorySystem/FIFO_WRITE3] [get_bd_intf_pins TexSample_0/TexSampReadRequestsFIFO]
  connect_bd_intf_net -intf_net TexSample_0_TexSampReadResponses [get_bd_intf_pins MemorySystem/FIFO_READ2] [get_bd_intf_pins TexSample_0/TexSampReadResponses]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_sdram_c1] [get_bd_intf_pins MemorySystem/ddr4_sdram_c1]
  connect_bd_intf_net -intf_net default_sysclk1_300_1 [get_bd_intf_ports default_sysclk1_300] [get_bd_intf_pins MemorySystem/default_sysclk1_300]

  # Create port connections
  connect_bd_net -net AttrInterpolator_0_DBG_AttrInterpolator_State [get_bd_pins AttrInterpolator_0/DBG_AttrInterpolator_State] [get_bd_pins ILA_AttrInterpolator/probe6] [get_bd_pins ila_333_250/probe7]
  connect_bd_net -net AttrInterpolator_0_DBG_RastBarycentricA [get_bd_pins AttrInterpolator_0/DBG_RastBarycentricA] [get_bd_pins ILA_AttrInterpolator/probe7]
  connect_bd_net -net AttrInterpolator_0_DBG_RastBarycentricB [get_bd_pins AttrInterpolator_0/DBG_RastBarycentricB] [get_bd_pins ILA_AttrInterpolator/probe8]
  connect_bd_net -net AttrInterpolator_0_DBG_RastBarycentricC [get_bd_pins AttrInterpolator_0/DBG_RastBarycentricC] [get_bd_pins ILA_AttrInterpolator/probe9]
  connect_bd_net -net AttrInterpolator_0_RECIP_InputVal [get_bd_pins AttrInterpolator_0/RECIP_InputVal] [get_bd_pins InterpolatorRecip/inU24]
  connect_bd_net -net AttrInterpolator_0_RECIP_NewInputValIsValid [get_bd_pins AttrInterpolator_0/RECIP_NewInputValIsValid] [get_bd_pins InterpolatorRecip/inNewValueIsValid]
  connect_bd_net -net AttrInterpolator_0_RECIP_ReadyForValOut [get_bd_pins AttrInterpolator_0/RECIP_ReadyForValOut] [get_bd_pins InterpolatorRecip/inReadyForOutValue]
  connect_bd_net -net AttrInterpolator_0_STAT_CyclesIdle [get_bd_pins AttrInterpolator_0/STAT_CyclesIdle] [get_bd_pins StatsCollector_0/INTERP_CyclesIdle]
  connect_bd_net -net AttrInterpolator_0_STAT_CyclesSpentWorking [get_bd_pins AttrInterpolator_0/STAT_CyclesSpentWorking] [get_bd_pins StatsCollector_0/INTERP_CyclesSpentWorking]
  connect_bd_net -net AttrInterpolator_0_STAT_CyclesWaitingForOutput [get_bd_pins AttrInterpolator_0/STAT_CyclesWaitingForOutput] [get_bd_pins StatsCollector_0/INTERP_CyclesWaitingForOutput]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outInterpolatedColorRGBA [get_bd_pins AttrInterpolator_0/TEXSAMP_outInterpolatedColorRGBA] [get_bd_pins ILA_AttrInterpolator/probe2] [get_bd_pins TexSample_0/INTERP_inInterpolatedVertColorRGBA] [get_bd_pins ila_333_250/probe37]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outInterpolatedTexcoordX [get_bd_pins AttrInterpolator_0/TEXSAMP_outInterpolatedTexcoordX] [get_bd_pins ILA_AttrInterpolator/probe0] [get_bd_pins TexSample_0/INTERP_inInterpolatedTexcoordX]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outInterpolatedTexcoordY [get_bd_pins AttrInterpolator_0/TEXSAMP_outInterpolatedTexcoordY] [get_bd_pins ILA_AttrInterpolator/probe1] [get_bd_pins TexSample_0/INTERP_inInterpolatedTexcoordY]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outPixelInterpolatedDepth [get_bd_pins AttrInterpolator_0/TEXSAMP_outPixelInterpolatedDepth] [get_bd_pins ILA_AttrInterpolator/probe5]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outPixelX [get_bd_pins AttrInterpolator_0/TEXSAMP_outPixelX] [get_bd_pins ILA_AttrInterpolator/probe3] [get_bd_pins TexSample_0/INTERP_pixelX]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_outPixelY [get_bd_pins AttrInterpolator_0/TEXSAMP_outPixelY] [get_bd_pins ILA_AttrInterpolator/probe4] [get_bd_pins TexSample_0/INTERP_pixelY]
  connect_bd_net -net AttrInterpolator_0_TEXSAMP_writeIsValid [get_bd_pins AttrInterpolator_0/TEXSAMP_writeIsValid] [get_bd_pins TexSample_0/INTERP_writeStrobe]
  connect_bd_net -net AttrInterpolator_0_TRICACHE_CurrentSlotIndex [get_bd_pins AttrInterpolator_0/TRICACHE_CurrentSlotIndex] [get_bd_pins TriWorkCache_0/INTERP_CurrentSlotIndex]
  connect_bd_net -net AttrInterpolator_0_TRICACHE_SignalSlotComplete [get_bd_pins AttrInterpolator_0/TRICACHE_SignalSlotComplete] [get_bd_pins TriWorkCache_0/INTERP_SignalSlotComplete]
  connect_bd_net -net ClearBlock_0_CMD_ClearBlockIsIdle [get_bd_pins ClearBlock_0/CMD_ClearBlockIsIdle] [get_bd_pins CommandProcessor_0/CMD_ClearBlock_Idle]
  connect_bd_net -net ClearBlock_0_DBG_ClearBlock_State [get_bd_pins ClearBlock_0/DBG_ClearBlock_State] [get_bd_pins ila_333_250/probe10]
  connect_bd_net -net ClearBlock_0_DBG_LastWrittenClearData [get_bd_pins ClearBlock_0/DBG_LastWrittenClearData] [get_bd_pins ila_333_250/probe21]
  connect_bd_net -net CommandProcessor_0_CLEAR_BaseRenderTargetAddr [get_bd_pins ClearBlock_0/CMD_BaseRenderTargetAddr] [get_bd_pins CommandProcessor_0/CLEAR_BaseRenderTargetAddr]
  connect_bd_net -net CommandProcessor_0_CLEAR_ClearBlockBeginSignal [get_bd_pins ClearBlock_0/CMD_ClearBlockBeginSignal] [get_bd_pins CommandProcessor_0/CLEAR_ClearBlockBeginSignal]
  connect_bd_net -net CommandProcessor_0_CLEAR_ClearColorRGBA [get_bd_pins ClearBlock_0/CMD_ClearColorRGBA] [get_bd_pins CommandProcessor_0/CLEAR_ClearColorRGBA]
  connect_bd_net -net CommandProcessor_0_CLEAR_ClearDRAMLineCount [get_bd_pins ClearBlock_0/CMD_ClearDRAMLineCount] [get_bd_pins CommandProcessor_0/CLEAR_ClearDRAMLineCount]
  connect_bd_net -net CommandProcessor_0_DBG_IdleSignalsVector [get_bd_pins CommandProcessor_0/DBG_IdleSignalsVector] [get_bd_pins ila_333_250/probe28]
  connect_bd_net -net CommandProcessor_0_DBG_LAST_IN_PACKET [get_bd_pins CommandProcessor_0/DBG_LAST_IN_PACKET] [get_bd_pins ila_333_250/probe1]
  connect_bd_net -net CommandProcessor_0_DBG_LAST_OUT_PACKET [get_bd_pins CommandProcessor_0/DBG_LAST_OUT_PACKET] [get_bd_pins ila_333_250/probe2]
  connect_bd_net -net CommandProcessor_0_DBG_LAST_READ_DATA [get_bd_pins CommandProcessor_0/DBG_LAST_READ_DATA] [get_bd_pins ila_333_250/probe3]
  connect_bd_net -net CommandProcessor_0_DBG_PACKETSTATE [get_bd_pins CommandProcessor_0/DBG_CMDPACKETSTATE] [get_bd_pins ila_333_250/probe0]
  connect_bd_net -net CommandProcessor_0_IA_DrawIndexCount [get_bd_pins CommandProcessor_0/IA_DrawIndexCount] [get_bd_pins InputAssembler_0/CMD_DrawIndexCount]
  connect_bd_net -net CommandProcessor_0_IA_DrawIsIndexed [get_bd_pins CommandProcessor_0/IA_DrawIsIndexed] [get_bd_pins InputAssembler_0/CMD_DrawIsIndexed]
  connect_bd_net -net CommandProcessor_0_IA_LaunchDrawSignal [get_bd_pins CommandProcessor_0/IA_LaunchDrawSignal] [get_bd_pins InputAssembler_0/CMD_LaunchDrawSignal]
  connect_bd_net -net CommandProcessor_0_IA_LoadAllElementsIdentical [get_bd_pins CommandProcessor_0/IA_LoadAllElementsIdentical] [get_bd_pins InputAssembler_0/CMD_LoadAllElementsIdentical]
  connect_bd_net -net CommandProcessor_0_IA_LoadBufferAddress [get_bd_pins CommandProcessor_0/IA_LoadBufferAddress] [get_bd_pins InputAssembler_0/CMD_LoadBufferAddress]
  connect_bd_net -net CommandProcessor_0_IA_LoadBufferElementCount [get_bd_pins CommandProcessor_0/IA_LoadBufferElementCount] [get_bd_pins InputAssembler_0/CMD_LoadBufferElementCount]
  connect_bd_net -net CommandProcessor_0_IA_LoadBufferEnable [get_bd_pins CommandProcessor_0/IA_LoadBufferEnable] [get_bd_pins InputAssembler_0/CMD_LoadBufferEnable]
  connect_bd_net -net CommandProcessor_0_IA_LoadBufferType [get_bd_pins CommandProcessor_0/IA_LoadBufferType] [get_bd_pins InputAssembler_0/CMD_LoadBufferType]
  connect_bd_net -net CommandProcessor_0_IA_SetStateEnable [get_bd_pins CommandProcessor_0/IA_SetStateEnable] [get_bd_pins InputAssembler_0/CMD_SetStateEnable]
  connect_bd_net -net CommandProcessor_0_IA_StateCullMode [get_bd_pins CommandProcessor_0/IA_StateCullMode] [get_bd_pins InputAssembler_0/CMD_StateCullMode]
  connect_bd_net -net CommandProcessor_0_IA_StateIndexFormat [get_bd_pins CommandProcessor_0/IA_StateIndexFormat] [get_bd_pins InputAssembler_0/CMD_StateIndexFormat]
  connect_bd_net -net CommandProcessor_0_IA_StatePrimTopology [get_bd_pins CommandProcessor_0/IA_StatePrimTopology] [get_bd_pins InputAssembler_0/CMD_StatePrimTopology]
  connect_bd_net -net CommandProcessor_0_IA_StateStripCutType [get_bd_pins CommandProcessor_0/IA_StateStripCutType] [get_bd_pins InputAssembler_0/CMD_StateStripCutType]
  connect_bd_net -net CommandProcessor_0_ROP_ClearSignal [get_bd_pins CommandProcessor_0/ROP_ClearSignal] [get_bd_pins ROP_0/CMD_ClearSignal]
  connect_bd_net -net CommandProcessor_0_ROP_FlushCacheSignal [get_bd_pins CommandProcessor_0/ROP_FlushCacheSignal] [get_bd_pins ROP_0/CMD_FlushCacheSignal]
  connect_bd_net -net CommandProcessor_0_ROP_SetAlphaTestEnabled [get_bd_pins CommandProcessor_0/ROP_SetAlphaTestEnabled] [get_bd_pins ROP_0/CMD_SetAlphaTestEnabled]
  connect_bd_net -net CommandProcessor_0_ROP_SetAlphaTestFunc [get_bd_pins CommandProcessor_0/ROP_SetAlphaTestFunc] [get_bd_pins ROP_0/CMD_SetAlphaTestFunc]
  connect_bd_net -net CommandProcessor_0_ROP_SetAlphaTestRefVal [get_bd_pins CommandProcessor_0/ROP_SetAlphaTestRefVal] [get_bd_pins ROP_0/CMD_SetAlphaTestRefVal]
  connect_bd_net -net CommandProcessor_0_ROP_SetBlendMask [get_bd_pins CommandProcessor_0/ROP_SetBlendMask] [get_bd_pins ROP_0/CMD_SetBlendMask]
  connect_bd_net -net CommandProcessor_0_ROP_SetBlendMode [get_bd_pins CommandProcessor_0/ROP_SetBlendMode] [get_bd_pins ROP_0/CMD_SetBlendMode]
  connect_bd_net -net CommandProcessor_0_ROP_SetBlendStateBeginSignal [get_bd_pins CommandProcessor_0/ROP_SetBlendStateBeginSignal] [get_bd_pins ROP_0/CMD_SetBlendStateSignal]
  connect_bd_net -net CommandProcessor_0_ROP_SetClearColor [get_bd_pins CommandProcessor_0/ROP_SetClearColor] [get_bd_pins ROP_0/CMD_SetClearColor]
  connect_bd_net -net CommandProcessor_0_ROP_SetRenderTargetBaseAddr [get_bd_pins CommandProcessor_0/ROP_SetRenderTargetBaseAddr] [get_bd_pins ROP_0/CMD_SetRenderTargetBaseAddr]
  connect_bd_net -net CommandProcessor_0_SCANOUT_RenderTargetBaseAddr [get_bd_pins CommandProcessor_0/SCANOUT_RenderTargetBaseAddr] [get_bd_pins ScanoutSystem/CMD_BaseRenderTargetAddr]
  connect_bd_net -net CommandProcessor_0_SCANOUT_ScanEnable [get_bd_pins CommandProcessor_0/SCANOUT_ScanEnable] [get_bd_pins ScanoutSystem/CMD_ScanoutEnable]
  connect_bd_net -net CommandProcessor_0_STAT_CyclesIdle [get_bd_pins CommandProcessor_0/STAT_CyclesIdle] [get_bd_pins StatsCollector_0/CMD_CyclesIdle]
  connect_bd_net -net CommandProcessor_0_STAT_CyclesSpentWorking [get_bd_pins CommandProcessor_0/STAT_CyclesSpentWorking] [get_bd_pins StatsCollector_0/CMD_CyclesSpentWorking]
  connect_bd_net -net CommandProcessor_0_STAT_PresentSignal [get_bd_pins CommandProcessor_0/STAT_PresentSignal] [get_bd_pins StatsCollector_0/CMD_PresentSignal]
  connect_bd_net -net CommandProcessor_0_STAT_WriteFrameStatsAddress [get_bd_pins CommandProcessor_0/STAT_WriteFrameStatsAddress] [get_bd_pins StatsCollector_0/CMD_WriteFrameStatsAddress]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheAddr [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheAddr] [get_bd_pins TexSample_0/CMD_LoadTexCacheAddr]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheBeginSignal [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheBeginSignal] [get_bd_pins TexSample_0/CMD_LoadTexCacheBeginSignal]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheFormat [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheFormat] [get_bd_pins ILA_TexSampler/probe10] [get_bd_pins TexSample_0/CMD_LoadTexCacheFormat]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheTexelCount [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheTexelCount] [get_bd_pins TexSample_0/CMD_LoadTexCacheTexelCount]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheTexelHeight [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheTexelHeight] [get_bd_pins ILA_TexSampler/probe9] [get_bd_pins TexSample_0/CMD_LoadTexCacheTexelHeight]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_LoadTexCacheTexelWidth [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheTexelWidth] [get_bd_pins ILA_TexSampler/probe8] [get_bd_pins TexSample_0/CMD_LoadTexCacheTexelWidth]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_SetTextureStateBeginSignal [get_bd_pins CommandProcessor_0/TEXSAMP_SetTextureStateBeginSignal] [get_bd_pins TexSample_0/CMD_SetTextureStateBeginSignal]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_SetTextureStateCombinerModeAlpha [get_bd_pins CommandProcessor_0/TEXSAMP_SetTextureStateCombinerModeAlpha] [get_bd_pins TexSample_0/CMD_SetTextureStateCombinerModeAlpha]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_SetTextureStateCombinerModeColor [get_bd_pins CommandProcessor_0/TEXSAMP_SetTextureStateCombinerModeColor] [get_bd_pins TexSample_0/CMD_SetTextureStateCombinerModeColor]
  connect_bd_net -net CommandProcessor_0_TEXSAMP_SetTextureStateUseBilinear [get_bd_pins CommandProcessor_0/TEXSAMP_SetTextureStateUseBilinear] [get_bd_pins TexSample_0/CMD_SetTextureStateUseBilinear]
  connect_bd_net -net InputAssembler_0_CMD_DrawReady [get_bd_pins CommandProcessor_0/IA_DrawReady] [get_bd_pins InputAssembler_0/CMD_DrawReady]
  connect_bd_net -net InputAssembler_0_CMD_IA_Idle [get_bd_pins CommandProcessor_0/CMD_IA_Idle] [get_bd_pins InputAssembler_0/CMD_IA_Idle]
  connect_bd_net -net InputAssembler_0_CMD_LoadBufferReady [get_bd_pins CommandProcessor_0/IA_LoadBufferReady] [get_bd_pins InputAssembler_0/CMD_LoadBufferReady]
  connect_bd_net -net InputAssembler_0_CMD_SetStateReady [get_bd_pins CommandProcessor_0/IA_SetStateReady] [get_bd_pins InputAssembler_0/CMD_SetStateReady]
  connect_bd_net -net InputAssembler_0_DBG_IA_State [get_bd_pins ILA_IA/probe15] [get_bd_pins InputAssembler_0/DBG_IA_State] [get_bd_pins ila_333_250/probe4]
  connect_bd_net -net InputAssembler_0_DBG_LastReadVertexXPos [get_bd_pins ILA_IA/probe9] [get_bd_pins InputAssembler_0/DBG_LastReadVertexXPos]
  connect_bd_net -net InputAssembler_0_DBG_LastReadVertexXPosCacheIndex [get_bd_pins ILA_IA/probe10] [get_bd_pins InputAssembler_0/DBG_LastReadVertexXPosCacheIndex]
  connect_bd_net -net InputAssembler_0_DBG_LastWrittenVertexXPos [get_bd_pins ILA_IA/probe8] [get_bd_pins InputAssembler_0/DBG_LastWrittenVertexXPos]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndex0 [get_bd_pins ILA_IA/probe6] [get_bd_pins InputAssembler_0/DBG_VertexIndex0]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndex1 [get_bd_pins ILA_IA/probe7] [get_bd_pins InputAssembler_0/DBG_VertexIndex1]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndex2 [get_bd_pins ILA_IA/probe16] [get_bd_pins InputAssembler_0/DBG_VertexIndex2]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndexVal0 [get_bd_pins ILA_IA/probe17] [get_bd_pins InputAssembler_0/DBG_VertexIndexVal0]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndexVal1 [get_bd_pins ILA_IA/probe18] [get_bd_pins InputAssembler_0/DBG_VertexIndexVal1]
  connect_bd_net -net InputAssembler_0_DBG_VertexIndexVal2 [get_bd_pins ILA_IA/probe19] [get_bd_pins InputAssembler_0/DBG_VertexIndexVal2]
  connect_bd_net -net InputAssembler_0_STAT_CyclesIdle [get_bd_pins InputAssembler_0/STAT_CyclesIdle] [get_bd_pins StatsCollector_0/IA_CyclesIdle]
  connect_bd_net -net InputAssembler_0_STAT_CyclesLoadingDataToCache [get_bd_pins InputAssembler_0/STAT_CyclesLoadingDataToCache] [get_bd_pins StatsCollector_0/IA_CyclesLoadingDataToCache]
  connect_bd_net -net InputAssembler_0_STAT_CyclesSpentWorking [get_bd_pins InputAssembler_0/STAT_CyclesSpentWorking] [get_bd_pins StatsCollector_0/IA_CyclesSpentWorking]
  connect_bd_net -net InputAssembler_0_STAT_CyclesWaitingForOutput [get_bd_pins InputAssembler_0/STAT_CyclesWaitingForOutput] [get_bd_pins StatsCollector_0/IA_CyclesWaitingForOutput]
  connect_bd_net -net InputAssembler_0_TRISETUP_newTriBegin [get_bd_pins InputAssembler_0/TRISETUP_newTriBegin] [get_bd_pins TriSetup_0/IA_newTriBegin]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex0_X [get_bd_pins ILA_IA/probe3] [get_bd_pins InputAssembler_0/TRISETUP_tex0_X] [get_bd_pins TriSetup_0/IA_t0_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex0_Y [get_bd_pins ILA_IA/probe4] [get_bd_pins InputAssembler_0/TRISETUP_tex0_Y] [get_bd_pins TriSetup_0/IA_t0_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex1_X [get_bd_pins InputAssembler_0/TRISETUP_tex1_X] [get_bd_pins TriSetup_0/IA_t1_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex1_Y [get_bd_pins InputAssembler_0/TRISETUP_tex1_Y] [get_bd_pins TriSetup_0/IA_t1_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex2_X [get_bd_pins InputAssembler_0/TRISETUP_tex2_X] [get_bd_pins TriSetup_0/IA_t2_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_tex2_Y [get_bd_pins InputAssembler_0/TRISETUP_tex2_Y] [get_bd_pins TriSetup_0/IA_t2_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_v0PosInvZ [get_bd_pins ILA_IA/probe2] [get_bd_pins InputAssembler_0/TRISETUP_v0PosInvZ] [get_bd_pins TriSetup_0/IA_v0_in_invZ]
  connect_bd_net -net InputAssembler_0_TRISETUP_v0PosX [get_bd_pins ILA_IA/probe0] [get_bd_pins InputAssembler_0/TRISETUP_v0PosX] [get_bd_pins TriSetup_0/IA_v0_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_v0PosY [get_bd_pins ILA_IA/probe1] [get_bd_pins InputAssembler_0/TRISETUP_v0PosY] [get_bd_pins TriSetup_0/IA_v0_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_v1PosInvZ [get_bd_pins InputAssembler_0/TRISETUP_v1PosInvZ] [get_bd_pins TriSetup_0/IA_v1_in_invZ]
  connect_bd_net -net InputAssembler_0_TRISETUP_v1PosX [get_bd_pins ILA_IA/probe11] [get_bd_pins InputAssembler_0/TRISETUP_v1PosX] [get_bd_pins TriSetup_0/IA_v1_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_v1PosY [get_bd_pins ILA_IA/probe12] [get_bd_pins InputAssembler_0/TRISETUP_v1PosY] [get_bd_pins TriSetup_0/IA_v1_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_v2PosInvZ [get_bd_pins InputAssembler_0/TRISETUP_v2PosInvZ] [get_bd_pins TriSetup_0/IA_v2_in_invZ]
  connect_bd_net -net InputAssembler_0_TRISETUP_v2PosX [get_bd_pins ILA_IA/probe13] [get_bd_pins InputAssembler_0/TRISETUP_v2PosX] [get_bd_pins TriSetup_0/IA_v2_in_x]
  connect_bd_net -net InputAssembler_0_TRISETUP_v2PosY [get_bd_pins ILA_IA/probe14] [get_bd_pins InputAssembler_0/TRISETUP_v2PosY] [get_bd_pins TriSetup_0/IA_v2_in_y]
  connect_bd_net -net InputAssembler_0_TRISETUP_vertColor0_RGBA [get_bd_pins ILA_IA/probe5] [get_bd_pins InputAssembler_0/TRISETUP_vertColor0_RGBA] [get_bd_pins TriSetup_0/IA_v0_in_RGBA]
  connect_bd_net -net InputAssembler_0_TRISETUP_vertColor1_RGBA [get_bd_pins InputAssembler_0/TRISETUP_vertColor1_RGBA] [get_bd_pins TriSetup_0/IA_v1_in_RGBA]
  connect_bd_net -net InputAssembler_0_TRISETUP_vertColor2_RGBA [get_bd_pins InputAssembler_0/TRISETUP_vertColor2_RGBA] [get_bd_pins TriSetup_0/IA_v2_in_RGBA]
  connect_bd_net -net InterpolatorRecip_outInv24 [get_bd_pins AttrInterpolator_0/RECIP_OutputVal] [get_bd_pins InterpolatorRecip/outInv24]
  connect_bd_net -net InterpolatorRecip_outNewOutValueIsValid [get_bd_pins AttrInterpolator_0/RECIP_NewOutValIsValid] [get_bd_pins InterpolatorRecip/outNewOutValueIsValid]
  connect_bd_net -net InterpolatorRecip_outReadyForNewValue [get_bd_pins AttrInterpolator_0/RECIP_ReadyForNewInput] [get_bd_pins InterpolatorRecip/outReadyForNewValue]
  connect_bd_net -net MemorySystem_CMD_MemoryControllerIsIdle [get_bd_pins CommandProcessor_0/CMD_MemController_Idle] [get_bd_pins MemorySystem/CMD_MemoryControllerIsIdle]
  connect_bd_net -net MemorySystem_DBG_LastReadAddress [get_bd_pins MemorySystem/DBG_LastReadAddress] [get_bd_pins ila_333_250/probe26]
  connect_bd_net -net MemorySystem_DBG_LastReadMemoryClientIndex [get_bd_pins MemorySystem/DBG_LastReadMemoryClientIndex] [get_bd_pins ila_333_250/probe27]
  connect_bd_net -net MemorySystem_DBG_LastWriteAddress [get_bd_pins MemorySystem/DBG_LastWriteAddress] [get_bd_pins ila_333_250/probe22]
  connect_bd_net -net MemorySystem_DBG_LastWriteData [get_bd_pins MemorySystem/DBG_LastWriteData] [get_bd_pins ila_333_250/probe23]
  connect_bd_net -net MemorySystem_DBG_LastWriteDataDWORDEnables [get_bd_pins MemorySystem/DBG_LastWriteDataDWORDEnables] [get_bd_pins ila_333_250/probe24]
  connect_bd_net -net MemorySystem_DBG_LastWriteMemoryClientIndex [get_bd_pins MemorySystem/DBG_LastWriteMemoryClientIndex] [get_bd_pins ila_333_250/probe25]
  connect_bd_net -net MemorySystem_DBG_NewReadDataReady [get_bd_pins MemorySystem/DBG_NewReadDataReady] [get_bd_pins ila_333_250/probe16]
  connect_bd_net -net MemorySystem_DBG_NewReadEnable [get_bd_pins MemorySystem/DBG_NewReadEnable] [get_bd_pins ila_333_250/probe15]
  connect_bd_net -net MemorySystem_DBG_ReadControlState [get_bd_pins MemorySystem/DBG_ReadControlState] [get_bd_pins ila_333_250/probe13]
  connect_bd_net -net MemorySystem_DBG_ReadState [get_bd_pins MemorySystem/DBG_ReadState] [get_bd_pins ila_333_250/probe11]
  connect_bd_net -net MemorySystem_DBG_ReadyForNewRead [get_bd_pins MemorySystem/DBG_ReadyForNewRead] [get_bd_pins ila_333_250/probe17]
  connect_bd_net -net MemorySystem_DBG_ScanoutReadRequests_Empty [get_bd_pins MemorySystem/DBG_ScanoutReadRequests_Empty] [get_bd_pins ila_333_250/probe18]
  connect_bd_net -net MemorySystem_DBG_ScanoutReadRequests_rd_en [get_bd_pins MemorySystem/DBG_ScanoutReadRequests_rd_en] [get_bd_pins ila_333_250/probe20]
  connect_bd_net -net MemorySystem_DBG_ScanoutReadResponses_Full [get_bd_pins MemorySystem/DBG_ScanoutReadResponses_Full] [get_bd_pins ila_333_250/probe19]
  connect_bd_net -net MemorySystem_DBG_WriteControlState [get_bd_pins MemorySystem/DBG_WriteControlState] [get_bd_pins ila_333_250/probe14]
  connect_bd_net -net MemorySystem_DBG_WriteState [get_bd_pins MemorySystem/DBG_WriteState] [get_bd_pins ila_333_250/probe12]
  connect_bd_net -net MemorySystem_STAT_MemReadCountBytesTransferred [get_bd_pins MemorySystem/STAT_MemReadCountBytesTransferred] [get_bd_pins StatsCollector_0/MEM_MemReadCountBytesTransferred]
  connect_bd_net -net MemorySystem_STAT_MemReadCountNonScanoutBytesTransferred [get_bd_pins MemorySystem/STAT_MemReadCountNonScanoutBytesTransferred] [get_bd_pins StatsCollector_0/MEM_MemReadCountNonScanoutBytesTransferred]
  connect_bd_net -net MemorySystem_STAT_MemReadCountNonScanoutTransactions [get_bd_pins MemorySystem/STAT_MemReadCountNonScanoutTransactions] [get_bd_pins StatsCollector_0/MEM_MemReadCountNonScanoutTransactions]
  connect_bd_net -net MemorySystem_STAT_MemReadCountTransactions [get_bd_pins MemorySystem/STAT_MemReadCountTransactions] [get_bd_pins StatsCollector_0/MEM_MemReadCountTransactions]
  connect_bd_net -net MemorySystem_STAT_MemReadCyclesIdle [get_bd_pins MemorySystem/STAT_MemReadCyclesIdle] [get_bd_pins StatsCollector_0/MEM_ReadCyclesIdle]
  connect_bd_net -net MemorySystem_STAT_MemReadCyclesSpentWorking [get_bd_pins MemorySystem/STAT_MemReadCyclesSpentWorking] [get_bd_pins StatsCollector_0/MEM_ReadCyclesSpentWorking]
  connect_bd_net -net MemorySystem_STAT_MemWriteCountBytesTransferred [get_bd_pins MemorySystem/STAT_MemWriteCountBytesTransferred] [get_bd_pins StatsCollector_0/MEM_MemWriteCountBytesTransferred]
  connect_bd_net -net MemorySystem_STAT_MemWriteCountTransactions [get_bd_pins MemorySystem/STAT_MemWriteCountTransactions] [get_bd_pins StatsCollector_0/MEM_MemWriteCountTransactions]
  connect_bd_net -net MemorySystem_STAT_MemWriteCyclesIdle [get_bd_pins MemorySystem/STAT_MemWriteCyclesIdle] [get_bd_pins StatsCollector_0/MEM_WriteCyclesIdle]
  connect_bd_net -net MemorySystem_STAT_MemWriteCyclesSpentWorking [get_bd_pins MemorySystem/STAT_MemWriteCyclesSpentWorking] [get_bd_pins StatsCollector_0/MEM_WriteCyclesSpentWorking]
  connect_bd_net -net R8G8B8Quantizer_0_outBlueBits [get_bd_ports blue] [get_bd_pins ScanoutSystem/blue]
  connect_bd_net -net R8G8B8Quantizer_0_outGreenBits [get_bd_ports green] [get_bd_pins ScanoutSystem/green]
  connect_bd_net -net R8G8B8Quantizer_0_outRedBits [get_bd_ports red] [get_bd_pins ScanoutSystem/red]
  connect_bd_net -net ROP_0_CMD_ClearSignalAck [get_bd_pins CommandProcessor_0/ROP_ClearSignalAck] [get_bd_pins ROP_0/CMD_ClearSignalAck]
  connect_bd_net -net ROP_0_CMD_FlushCacheAck [get_bd_pins CommandProcessor_0/ROP_FlushCacheAck] [get_bd_pins ROP_0/CMD_FlushCacheAck]
  connect_bd_net -net ROP_0_CMD_ROPIsIdle [get_bd_pins CommandProcessor_0/CMD_ROP_Idle] [get_bd_pins ROP_0/CMD_ROPIsIdle]
  connect_bd_net -net ROP_0_CMD_SetBlendStateSigAck [get_bd_pins CommandProcessor_0/ROP_SetBlendStateSigAck] [get_bd_pins ROP_0/CMD_SetBlendStateSigAck]
  connect_bd_net -net ROP_0_DBG_CurrentPixelAddr [get_bd_pins ROP_0/DBG_CurrentPixelAddr] [get_bd_pins ila_333_250/probe35]
  connect_bd_net -net ROP_0_DBG_ROP_State [get_bd_pins ROP_0/DBG_ROP_State] [get_bd_pins ila_333_250/probe9]
  connect_bd_net -net ROP_0_DBG_ReadRequestFIFOFull [get_bd_pins ROP_0/DBG_ReadRequestFIFOFull] [get_bd_pins ila_333_250/probe36]
  connect_bd_net -net ROP_0_STAT_CountCacheHits [get_bd_pins ROP_0/STAT_CountCacheHits] [get_bd_pins StatsCollector_0/ROP_CountCacheHits]
  connect_bd_net -net ROP_0_STAT_CountCacheMisses [get_bd_pins ROP_0/STAT_CountCacheMisses] [get_bd_pins StatsCollector_0/ROP_CountCacheMisses]
  connect_bd_net -net ROP_0_STAT_CyclesIdle [get_bd_pins ROP_0/STAT_CyclesIdle] [get_bd_pins StatsCollector_0/ROP_CyclesIdle]
  connect_bd_net -net ROP_0_STAT_CyclesSpentWorking [get_bd_pins ROP_0/STAT_CyclesSpentWorking] [get_bd_pins StatsCollector_0/ROP_CyclesSpentWorking]
  connect_bd_net -net ROP_0_STAT_CyclesWaitingForMemoryRead [get_bd_pins ROP_0/STAT_CyclesWaitingForMemoryRead] [get_bd_pins StatsCollector_0/ROP_CyclesWaitingForMemoryRead]
  connect_bd_net -net ROP_0_STAT_CyclesWaitingForOutput [get_bd_pins ROP_0/STAT_CyclesWaitingForOutput] [get_bd_pins StatsCollector_0/ROP_CyclesWaitingForOutput]
  connect_bd_net -net ROP_0_TEXSAMP_writeAck [get_bd_pins ROP_0/TEXSAMP_writeAck] [get_bd_pins TexSample_0/ROP_writeAck]
  connect_bd_net -net Rasterizer_0_CMD_Rasterizer_Idle [get_bd_pins CommandProcessor_0/CMD_Rasterizer_Idle] [get_bd_pins Rasterizer_0/CMD_Rasterizer_Idle]
  connect_bd_net -net Rasterizer_0_DBG_LineNumber [get_bd_pins Rasterizer_0/DBG_LineNumber] [get_bd_pins ila_333_250/probe30]
  connect_bd_net -net Rasterizer_0_DBG_MaxX [get_bd_pins Rasterizer_0/DBG_MaxX] [get_bd_pins ila_333_250/probe32]
  connect_bd_net -net Rasterizer_0_DBG_MaxY [get_bd_pins Rasterizer_0/DBG_MaxY] [get_bd_pins ila_333_250/probe34]
  connect_bd_net -net Rasterizer_0_DBG_MinX [get_bd_pins Rasterizer_0/DBG_MinX] [get_bd_pins ila_333_250/probe31]
  connect_bd_net -net Rasterizer_0_DBG_MinY [get_bd_pins Rasterizer_0/DBG_MinY] [get_bd_pins ila_333_250/probe33]
  connect_bd_net -net Rasterizer_0_DBG_PixelNumber [get_bd_pins Rasterizer_0/DBG_PixelNumber] [get_bd_pins ila_333_250/probe29]
  connect_bd_net -net Rasterizer_0_DBG_Rasterizer_State [get_bd_pins Rasterizer_0/DBG_Rasterizer_State] [get_bd_pins ila_333_250/probe6]
  connect_bd_net -net Rasterizer_0_STAT_CyclesIdle [get_bd_pins Rasterizer_0/STAT_CyclesIdle] [get_bd_pins StatsCollector_0/RAST_CyclesIdle]
  connect_bd_net -net Rasterizer_0_STAT_CyclesSpentWorking [get_bd_pins Rasterizer_0/STAT_CyclesSpentWorking] [get_bd_pins StatsCollector_0/RAST_CyclesSpentWorking]
  connect_bd_net -net Rasterizer_0_STAT_CyclesWaitingForOutput [get_bd_pins Rasterizer_0/STAT_CyclesWaitingForOutput] [get_bd_pins StatsCollector_0/RAST_CyclesWaitingForOutput]
  connect_bd_net -net Rasterizer_0_STAT_CyclesWaitingForTriWorkCache [get_bd_pins Rasterizer_0/STAT_CyclesWaitingForTriWorkCache] [get_bd_pins StatsCollector_0/RAST_CyclesWaitingForTriWorkCache]
  connect_bd_net -net Rasterizer_0_TRICACHE_BarycentricInverse [get_bd_pins Rasterizer_0/TRICACHE_BarycentricInverse] [get_bd_pins TriWorkCache_0/RAST_inBarycentricInverse]
  connect_bd_net -net Rasterizer_0_TRICACHE_DrawCallID [get_bd_pins Rasterizer_0/TRICACHE_DrawCallID] [get_bd_pins TriWorkCache_0/RAST_inDrawCallID]
  connect_bd_net -net Rasterizer_0_TRICACHE_InvZ0 [get_bd_pins Rasterizer_0/TRICACHE_InvZ0] [get_bd_pins TriWorkCache_0/RAST_inInvZ0]
  connect_bd_net -net Rasterizer_0_TRICACHE_InvZ1 [get_bd_pins Rasterizer_0/TRICACHE_InvZ1] [get_bd_pins TriWorkCache_0/RAST_inInvZ1]
  connect_bd_net -net Rasterizer_0_TRICACHE_InvZ2 [get_bd_pins Rasterizer_0/TRICACHE_InvZ2] [get_bd_pins TriWorkCache_0/RAST_inInvZ2]
  connect_bd_net -net Rasterizer_0_TRICACHE_PrimitiveID [get_bd_pins Rasterizer_0/TRICACHE_PrimitiveID] [get_bd_pins TriWorkCache_0/RAST_inPrimitiveID]
  connect_bd_net -net Rasterizer_0_TRICACHE_RequestNewTriSlot [get_bd_pins Rasterizer_0/TRICACHE_RequestNewTriSlot] [get_bd_pins TriWorkCache_0/RAST_RequestNewTriSlot]
  connect_bd_net -net Rasterizer_0_TRICACHE_TX0 [get_bd_pins Rasterizer_0/TRICACHE_TX0] [get_bd_pins TriWorkCache_0/RAST_inT0X]
  connect_bd_net -net Rasterizer_0_TRICACHE_TX1 [get_bd_pins Rasterizer_0/TRICACHE_TX1] [get_bd_pins TriWorkCache_0/RAST_inT1X]
  connect_bd_net -net Rasterizer_0_TRICACHE_TX2 [get_bd_pins Rasterizer_0/TRICACHE_TX2] [get_bd_pins TriWorkCache_0/RAST_inT2X]
  connect_bd_net -net Rasterizer_0_TRICACHE_TY0 [get_bd_pins Rasterizer_0/TRICACHE_TY0] [get_bd_pins TriWorkCache_0/RAST_inT0Y]
  connect_bd_net -net Rasterizer_0_TRICACHE_TY1 [get_bd_pins Rasterizer_0/TRICACHE_TY1] [get_bd_pins TriWorkCache_0/RAST_inT1Y]
  connect_bd_net -net Rasterizer_0_TRICACHE_TY2 [get_bd_pins Rasterizer_0/TRICACHE_TY2] [get_bd_pins TriWorkCache_0/RAST_inT2Y]
  connect_bd_net -net Rasterizer_0_TRICACHE_VFACE [get_bd_pins Rasterizer_0/TRICACHE_VFACE] [get_bd_pins TriWorkCache_0/RAST_inVFACE]
  connect_bd_net -net Rasterizer_0_TRICACHE_VertColor0 [get_bd_pins Rasterizer_0/TRICACHE_VertColor0] [get_bd_pins TriWorkCache_0/RAST_inColorRGBA0]
  connect_bd_net -net Rasterizer_0_TRICACHE_VertColor1 [get_bd_pins Rasterizer_0/TRICACHE_VertColor1] [get_bd_pins TriWorkCache_0/RAST_inColorRGBA1]
  connect_bd_net -net Rasterizer_0_TRICACHE_VertColor2 [get_bd_pins Rasterizer_0/TRICACHE_VertColor2] [get_bd_pins TriWorkCache_0/RAST_inColorRGBA2]
  connect_bd_net -net Rasterizer_0_TRISETUP_readyForNewTri [get_bd_pins Rasterizer_0/TRISETUP_readyForNewTri] [get_bd_pins TriSetup_0/RAST_readyForTriSetupData]
  connect_bd_net -net ResetN_UntilClockLoc_0_resetn [get_bd_pins CommandProcessor_0/resetn] [get_bd_pins MemorySystem/M_AXI_ARESETN] [get_bd_pins ResetN_UntilClockLoc_0/resetn] [get_bd_pins SerialPacketSystem/s_axi_aresetn]
  connect_bd_net -net ScanOut_0_hsync [get_bd_ports hsync] [get_bd_pins ScanoutSystem/hsync]
  connect_bd_net -net ScanOut_0_vsync [get_bd_ports vsync] [get_bd_pins CommandProcessor_0/CMD_VSync] [get_bd_pins ScanoutSystem/vsync]
  connect_bd_net -net StatsCollector_0_CMD_StatsSaveComplete [get_bd_pins CommandProcessor_0/STAT_StatsSaveComplete] [get_bd_pins StatsCollector_0/CMD_StatsSaveComplete]
  connect_bd_net -net StatsCollector_0_DBG_CurrentState [get_bd_pins StatsCollector_0/DBG_CurrentState] [get_bd_pins ila_333_250/probe38]
  connect_bd_net -net TexSample_0_CMD_LoadTexCacheAckSignal [get_bd_pins CommandProcessor_0/TEXSAMP_LoadTexCacheAckSignal] [get_bd_pins TexSample_0/CMD_LoadTexCacheAckSignal]
  connect_bd_net -net TexSample_0_CMD_SetTextureStateAckSignal [get_bd_pins CommandProcessor_0/TEXSAMP_SetTextureStateAckSignal] [get_bd_pins TexSample_0/CMD_SetTextureStateAckSignal]
  connect_bd_net -net TexSample_0_CMD_TexSampleIsIdle [get_bd_pins CommandProcessor_0/CMD_TexSampler_Idle] [get_bd_pins TexSample_0/CMD_TexSampleIsIdle]
  connect_bd_net -net TexSample_0_DBG_TexCache_addra [get_bd_pins ILA_TexSampler/probe7] [get_bd_pins TexSample_0/DBG_TexCache_addra]
  connect_bd_net -net TexSample_0_DBG_TexCache_dina [get_bd_pins ILA_TexSampler/probe5] [get_bd_pins TexSample_0/DBG_TexCache_dina]
  connect_bd_net -net TexSample_0_DBG_TexCache_douta [get_bd_pins ILA_TexSampler/probe6] [get_bd_pins TexSample_0/DBG_TexCache_douta]
  connect_bd_net -net TexSample_0_DBG_TexSample_State [get_bd_pins ILA_TexSampler/probe0] [get_bd_pins TexSample_0/DBG_TexSample_State] [get_bd_pins ila_333_250/probe8]
  connect_bd_net -net TexSample_0_INTERP_readyForNewWrite [get_bd_pins AttrInterpolator_0/TEXSAMP_readyForWrite] [get_bd_pins TexSample_0/INTERP_readyForNewWrite]
  connect_bd_net -net TexSample_0_ROP_outA [get_bd_pins ILA_TexSampler/probe4] [get_bd_pins ROP_0/TEXSAMP_outA] [get_bd_pins TexSample_0/ROP_outA]
  connect_bd_net -net TexSample_0_ROP_outB [get_bd_pins ILA_TexSampler/probe3] [get_bd_pins ROP_0/TEXSAMP_outB] [get_bd_pins TexSample_0/ROP_outB]
  connect_bd_net -net TexSample_0_ROP_outG [get_bd_pins ILA_TexSampler/probe2] [get_bd_pins ROP_0/TEXSAMP_outG] [get_bd_pins TexSample_0/ROP_outG]
  connect_bd_net -net TexSample_0_ROP_outPixelX [get_bd_pins ROP_0/TEXSAMP_outPixelX] [get_bd_pins TexSample_0/ROP_outPixelX]
  connect_bd_net -net TexSample_0_ROP_outPixelY [get_bd_pins ROP_0/TEXSAMP_outPixelY] [get_bd_pins TexSample_0/ROP_outPixelY]
  connect_bd_net -net TexSample_0_ROP_outR [get_bd_pins ILA_TexSampler/probe1] [get_bd_pins ROP_0/TEXSAMP_outR] [get_bd_pins TexSample_0/ROP_outR]
  connect_bd_net -net TexSample_0_ROP_writeIsValid [get_bd_pins ROP_0/TEXSAMP_writeIsValid] [get_bd_pins TexSample_0/ROP_writeIsValid]
  connect_bd_net -net TexSample_0_STAT_CyclesIdle [get_bd_pins StatsCollector_0/TEXSAMP_CyclesIdle] [get_bd_pins TexSample_0/STAT_CyclesIdle]
  connect_bd_net -net TexSample_0_STAT_CyclesSpentWorking [get_bd_pins StatsCollector_0/TEXSAMP_CyclesSpentWorking] [get_bd_pins TexSample_0/STAT_CyclesSpentWorking]
  connect_bd_net -net TexSample_0_STAT_CyclesWaitingCacheLoad [get_bd_pins StatsCollector_0/TEXSAMP_CyclesWaitingCacheLoad] [get_bd_pins TexSample_0/STAT_CyclesWaitingCacheLoad]
  connect_bd_net -net TexSample_0_STAT_CyclesWaitingForOutput [get_bd_pins StatsCollector_0/TEXSAMP_CyclesWaitingForOutput] [get_bd_pins TexSample_0/STAT_CyclesWaitingForOutput]
  connect_bd_net -net TriSetupRecip_outInv24 [get_bd_pins TriSetupRecip/outInv24] [get_bd_pins TriSetup_0/RECIP_OutputVal]
  connect_bd_net -net TriSetupRecip_outNewOutValueIsValid [get_bd_pins TriSetupRecip/outNewOutValueIsValid] [get_bd_pins TriSetup_0/RECIP_NewOutValIsValid]
  connect_bd_net -net TriSetupRecip_outReadyForNewValue [get_bd_pins TriSetupRecip/outReadyForNewValue] [get_bd_pins TriSetup_0/RECIP_ReadyForNewInput]
  connect_bd_net -net TriSetup_0_DBG_MaxX [get_bd_pins ILA_TriSetup/probe32] [get_bd_pins TriSetup_0/DBG_MaxX]
  connect_bd_net -net TriSetup_0_DBG_MaxY [get_bd_pins ILA_TriSetup/probe34] [get_bd_pins TriSetup_0/DBG_MaxY]
  connect_bd_net -net TriSetup_0_DBG_MinX [get_bd_pins ILA_TriSetup/probe31] [get_bd_pins TriSetup_0/DBG_MinX]
  connect_bd_net -net TriSetup_0_DBG_MinY [get_bd_pins ILA_TriSetup/probe33] [get_bd_pins TriSetup_0/DBG_MinY]
  connect_bd_net -net TriSetup_0_DBG_TriSetup_State [get_bd_pins ILA_TriSetup/probe30] [get_bd_pins TriSetup_0/DBG_TriSetup_State] [get_bd_pins ila_333_250/probe5]
  connect_bd_net -net TriSetup_0_DBG_TwiceTriArea [get_bd_pins ILA_TriSetup/probe41] [get_bd_pins TriSetup_0/DBG_TwiceTriArea]
  connect_bd_net -net TriSetup_0_DBG_XProdProd0 [get_bd_pins ILA_TriSetup/probe39] [get_bd_pins TriSetup_0/DBG_XProdProd0]
  connect_bd_net -net TriSetup_0_DBG_XProdProd1 [get_bd_pins ILA_TriSetup/probe40] [get_bd_pins TriSetup_0/DBG_XProdProd1]
  connect_bd_net -net TriSetup_0_DBG_XProdSub0 [get_bd_pins ILA_TriSetup/probe35] [get_bd_pins TriSetup_0/DBG_XProdSub0]
  connect_bd_net -net TriSetup_0_DBG_XProdSub1 [get_bd_pins ILA_TriSetup/probe36] [get_bd_pins TriSetup_0/DBG_XProdSub1]
  connect_bd_net -net TriSetup_0_DBG_XProdSub2 [get_bd_pins ILA_TriSetup/probe37] [get_bd_pins TriSetup_0/DBG_XProdSub2]
  connect_bd_net -net TriSetup_0_DBG_XProdSub3 [get_bd_pins ILA_TriSetup/probe38] [get_bd_pins TriSetup_0/DBG_XProdSub3]
  connect_bd_net -net TriSetup_0_IA_readyForNewTri [get_bd_pins InputAssembler_0/TRISETUP_readyForNewTri] [get_bd_pins TriSetup_0/IA_readyForNewTri]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricInverse [get_bd_pins ILA_TriSetup/probe0] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricInverse] [get_bd_pins TriSetup_0/RAST_outBarycentricInverse]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricXDeltaA [get_bd_pins ILA_TriSetup/probe23] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricXDeltaA] [get_bd_pins TriSetup_0/RAST_outBarycentricXDeltaA]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricXDeltaB [get_bd_pins ILA_TriSetup/probe24] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricXDeltaB] [get_bd_pins TriSetup_0/RAST_outBarycentricXDeltaB]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricXDeltaC [get_bd_pins ILA_TriSetup/probe25] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricXDeltaC] [get_bd_pins TriSetup_0/RAST_outBarycentricXDeltaC]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricYDeltaA [get_bd_pins ILA_TriSetup/probe26] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricYDeltaA] [get_bd_pins TriSetup_0/RAST_outBarycentricYDeltaA]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricYDeltaB [get_bd_pins ILA_TriSetup/probe27] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricYDeltaB] [get_bd_pins TriSetup_0/RAST_outBarycentricYDeltaB]
  connect_bd_net -net TriSetup_0_RAST_outBarycentricYDeltaC [get_bd_pins ILA_TriSetup/probe28] [get_bd_pins Rasterizer_0/TRISETUP_inBarycentricYDeltaC] [get_bd_pins TriSetup_0/RAST_outBarycentricYDeltaC]
  connect_bd_net -net TriSetup_0_RAST_outInitialBarycentricRowResetA [get_bd_pins ILA_TriSetup/probe17] [get_bd_pins Rasterizer_0/TRISETUP_inInitialBarycentricRowResetA] [get_bd_pins TriSetup_0/RAST_outInitialBarycentricRowResetA]
  connect_bd_net -net TriSetup_0_RAST_outInitialBarycentricRowResetB [get_bd_pins ILA_TriSetup/probe18] [get_bd_pins Rasterizer_0/TRISETUP_inInitialBarycentricRowResetB] [get_bd_pins TriSetup_0/RAST_outInitialBarycentricRowResetB]
  connect_bd_net -net TriSetup_0_RAST_outInitialBarycentricRowResetC [get_bd_pins ILA_TriSetup/probe19] [get_bd_pins Rasterizer_0/TRISETUP_inInitialBarycentricRowResetC] [get_bd_pins TriSetup_0/RAST_outInitialBarycentricRowResetC]
  connect_bd_net -net TriSetup_0_RAST_outIsTopLeftEdgeA [get_bd_pins ILA_TriSetup/probe20] [get_bd_pins Rasterizer_0/TRISETUP_inIsTopLeftEdgeA] [get_bd_pins TriSetup_0/RAST_outIsTopLeftEdgeA]
  connect_bd_net -net TriSetup_0_RAST_outIsTopLeftEdgeB [get_bd_pins ILA_TriSetup/probe21] [get_bd_pins Rasterizer_0/TRISETUP_inIsTopLeftEdgeB] [get_bd_pins TriSetup_0/RAST_outIsTopLeftEdgeB]
  connect_bd_net -net TriSetup_0_RAST_outIsTopLeftEdgeC [get_bd_pins ILA_TriSetup/probe22] [get_bd_pins Rasterizer_0/TRISETUP_inIsTopLeftEdgeC] [get_bd_pins TriSetup_0/RAST_outIsTopLeftEdgeC]
  connect_bd_net -net TriSetup_0_RAST_outMaxX [get_bd_pins ILA_TriSetup/probe14] [get_bd_pins Rasterizer_0/TRISETUP_inMaxX] [get_bd_pins TriSetup_0/RAST_outMaxX]
  connect_bd_net -net TriSetup_0_RAST_outMaxY [get_bd_pins ILA_TriSetup/probe16] [get_bd_pins Rasterizer_0/TRISETUP_inMaxY] [get_bd_pins TriSetup_0/RAST_outMaxY]
  connect_bd_net -net TriSetup_0_RAST_outMinX [get_bd_pins ILA_TriSetup/probe13] [get_bd_pins Rasterizer_0/TRISETUP_inMinX] [get_bd_pins TriSetup_0/RAST_outMinX]
  connect_bd_net -net TriSetup_0_RAST_outMinY [get_bd_pins ILA_TriSetup/probe15] [get_bd_pins Rasterizer_0/TRISETUP_inMinY] [get_bd_pins TriSetup_0/RAST_outMinY]
  connect_bd_net -net TriSetup_0_RAST_t0_out_x [get_bd_pins ILA_TriSetup/probe4] [get_bd_pins Rasterizer_0/TRISETUP_inTX0] [get_bd_pins TriSetup_0/RAST_t0_out_x]
  connect_bd_net -net TriSetup_0_RAST_t0_out_y [get_bd_pins ILA_TriSetup/probe5] [get_bd_pins Rasterizer_0/TRISETUP_inTY0] [get_bd_pins TriSetup_0/RAST_t0_out_y]
  connect_bd_net -net TriSetup_0_RAST_t1_out_x [get_bd_pins ILA_TriSetup/probe6] [get_bd_pins Rasterizer_0/TRISETUP_inTX1] [get_bd_pins TriSetup_0/RAST_t1_out_x]
  connect_bd_net -net TriSetup_0_RAST_t1_out_y [get_bd_pins ILA_TriSetup/probe7] [get_bd_pins Rasterizer_0/TRISETUP_inTY1] [get_bd_pins TriSetup_0/RAST_t1_out_y]
  connect_bd_net -net TriSetup_0_RAST_t2_out_x [get_bd_pins ILA_TriSetup/probe8] [get_bd_pins Rasterizer_0/TRISETUP_inTX2] [get_bd_pins TriSetup_0/RAST_t2_out_x]
  connect_bd_net -net TriSetup_0_RAST_t2_out_y [get_bd_pins ILA_TriSetup/probe9] [get_bd_pins Rasterizer_0/TRISETUP_inTY2] [get_bd_pins TriSetup_0/RAST_t2_out_y]
  connect_bd_net -net TriSetup_0_RAST_triSetupDataIsValid [get_bd_pins ILA_TriSetup/probe29] [get_bd_pins Rasterizer_0/TRISETUP_newTriBegin] [get_bd_pins TriSetup_0/RAST_triSetupDataIsValid]
  connect_bd_net -net TriSetup_0_RAST_v0_out_colorRGBA [get_bd_pins ILA_TriSetup/probe10] [get_bd_pins Rasterizer_0/TRISETUP_inVertColor0] [get_bd_pins TriSetup_0/RAST_v0_out_colorRGBA]
  connect_bd_net -net TriSetup_0_RAST_v0_out_invZ [get_bd_pins ILA_TriSetup/probe1] [get_bd_pins Rasterizer_0/TRISETUP_inInvZ0] [get_bd_pins TriSetup_0/RAST_v0_out_invZ]
  connect_bd_net -net TriSetup_0_RAST_v1_out_colorRGBA [get_bd_pins ILA_TriSetup/probe11] [get_bd_pins Rasterizer_0/TRISETUP_inVertColor1] [get_bd_pins TriSetup_0/RAST_v1_out_colorRGBA]
  connect_bd_net -net TriSetup_0_RAST_v1_out_invZ [get_bd_pins ILA_TriSetup/probe2] [get_bd_pins Rasterizer_0/TRISETUP_inInvZ1] [get_bd_pins TriSetup_0/RAST_v1_out_invZ]
  connect_bd_net -net TriSetup_0_RAST_v2_out_colorRGBA [get_bd_pins ILA_TriSetup/probe12] [get_bd_pins Rasterizer_0/TRISETUP_inVertColor2] [get_bd_pins TriSetup_0/RAST_v2_out_colorRGBA]
  connect_bd_net -net TriSetup_0_RAST_v2_out_invZ [get_bd_pins ILA_TriSetup/probe3] [get_bd_pins Rasterizer_0/TRISETUP_inInvZ2] [get_bd_pins TriSetup_0/RAST_v2_out_invZ]
  connect_bd_net -net TriSetup_0_RECIP_InputVal [get_bd_pins TriSetupRecip/inU24] [get_bd_pins TriSetup_0/RECIP_InputVal]
  connect_bd_net -net TriSetup_0_RECIP_NewInputValIsValid [get_bd_pins TriSetupRecip/inNewValueIsValid] [get_bd_pins TriSetup_0/RECIP_NewInputValIsValid]
  connect_bd_net -net TriSetup_0_RECIP_ReadyForValOut [get_bd_pins TriSetupRecip/inReadyForOutValue] [get_bd_pins TriSetup_0/RECIP_ReadyForValOut]
  connect_bd_net -net TriSetup_0_STAT_CyclesIdle [get_bd_pins StatsCollector_0/TRISETUP_CyclesIdle] [get_bd_pins TriSetup_0/STAT_CyclesIdle]
  connect_bd_net -net TriSetup_0_STAT_CyclesSpentWorking [get_bd_pins StatsCollector_0/TRISETUP_CyclesSpentWorking] [get_bd_pins TriSetup_0/STAT_CyclesSpentWorking]
  connect_bd_net -net TriSetup_0_STAT_CyclesWaitingForOutput [get_bd_pins StatsCollector_0/TRISETUP_CyclesWaitingForOutput] [get_bd_pins TriSetup_0/STAT_CyclesWaitingForOutput]
  connect_bd_net -net TriWorkCache_0_DBG_NumActiveTriangles [get_bd_pins ILA_AttrInterpolator/probe10] [get_bd_pins TriWorkCache_0/DBG_NumActiveTriangles]
  connect_bd_net -net TriWorkCache_0_INTERP_outBarycentricInverse [get_bd_pins AttrInterpolator_0/TRICACHE_inBarycentricInverse] [get_bd_pins TriWorkCache_0/INTERP_outBarycentricInverse]
  connect_bd_net -net TriWorkCache_0_INTERP_outColorRGBA0 [get_bd_pins AttrInterpolator_0/TRICACHE_inColorRGBA0] [get_bd_pins TriWorkCache_0/INTERP_outColorRGBA0]
  connect_bd_net -net TriWorkCache_0_INTERP_outColorRGBA1 [get_bd_pins AttrInterpolator_0/TRICACHE_inColorRGBA1] [get_bd_pins TriWorkCache_0/INTERP_outColorRGBA1]
  connect_bd_net -net TriWorkCache_0_INTERP_outColorRGBA2 [get_bd_pins AttrInterpolator_0/TRICACHE_inColorRGBA2] [get_bd_pins TriWorkCache_0/INTERP_outColorRGBA2]
  connect_bd_net -net TriWorkCache_0_INTERP_outInvZ0 [get_bd_pins AttrInterpolator_0/TRICACHE_inInvZ0] [get_bd_pins TriWorkCache_0/INTERP_outInvZ0]
  connect_bd_net -net TriWorkCache_0_INTERP_outInvZ1 [get_bd_pins AttrInterpolator_0/TRICACHE_inInvZ1] [get_bd_pins TriWorkCache_0/INTERP_outInvZ1]
  connect_bd_net -net TriWorkCache_0_INTERP_outInvZ2 [get_bd_pins AttrInterpolator_0/TRICACHE_inInvZ2] [get_bd_pins TriWorkCache_0/INTERP_outInvZ2]
  connect_bd_net -net TriWorkCache_0_INTERP_outT0X [get_bd_pins AttrInterpolator_0/TRICACHE_inT0X] [get_bd_pins TriWorkCache_0/INTERP_outT0X]
  connect_bd_net -net TriWorkCache_0_INTERP_outT0Y [get_bd_pins AttrInterpolator_0/TRICACHE_inT0Y] [get_bd_pins TriWorkCache_0/INTERP_outT0Y]
  connect_bd_net -net TriWorkCache_0_INTERP_outT1X [get_bd_pins AttrInterpolator_0/TRICACHE_inT1X] [get_bd_pins TriWorkCache_0/INTERP_outT1X]
  connect_bd_net -net TriWorkCache_0_INTERP_outT1Y [get_bd_pins AttrInterpolator_0/TRICACHE_inT1Y] [get_bd_pins TriWorkCache_0/INTERP_outT1Y]
  connect_bd_net -net TriWorkCache_0_INTERP_outT2X [get_bd_pins AttrInterpolator_0/TRICACHE_inT2X] [get_bd_pins TriWorkCache_0/INTERP_outT2X]
  connect_bd_net -net TriWorkCache_0_INTERP_outT2Y [get_bd_pins AttrInterpolator_0/TRICACHE_inT2Y] [get_bd_pins TriWorkCache_0/INTERP_outT2Y]
  connect_bd_net -net TriWorkCache_0_RAST_NewTriSlotIndex [get_bd_pins Rasterizer_0/TRICACHE_NewTriSlotIndex] [get_bd_pins TriWorkCache_0/RAST_NewTriSlotIndex]
  connect_bd_net -net TriWorkCache_0_RAST_NewTriSlotIndexValid [get_bd_pins Rasterizer_0/TRICACHE_NewTriSlotIndexValid] [get_bd_pins TriWorkCache_0/RAST_NewTriSlotIndexValid]
  connect_bd_net -net ddr4_0_addn_ui_clkout1 [get_bd_pins MemorySystem/addn_ui_clkout1] [get_bd_pins SerialPacketSystem/s_axi_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins AttrInterpolator_0/clk] [get_bd_pins ClearBlock_0/clk] [get_bd_pins CommandProcessor_0/clk] [get_bd_pins ILA_AttrInterpolator/clk] [get_bd_pins ILA_IA/clk] [get_bd_pins ILA_TexSampler/clk] [get_bd_pins ILA_TriSetup/clk] [get_bd_pins IndexBufferCache/clka] [get_bd_pins InputAssembler_0/clk] [get_bd_pins InterpolatorRecip/clk] [get_bd_pins MemorySystem/c0_ddr4_ui_clk] [get_bd_pins ROP_0/clk] [get_bd_pins Rasterizer_0/clk] [get_bd_pins ScanoutSystem/clk_in1] [get_bd_pins SerialPacketSystem/rd_clk] [get_bd_pins StatsCollector_0/clk] [get_bd_pins TexSample_0/clk] [get_bd_pins TextureCache_128x128x32bits/clka] [get_bd_pins TriSetupRecip/clk] [get_bd_pins TriSetup_0/clk] [get_bd_pins TriWorkCache_0/clk] [get_bd_pins ila_333_250/clk] [get_bd_pins rast_out_fifo/clk] [get_bd_pins texcoordX_cache/clka] [get_bd_pins texcoordY_cache/clka] [get_bd_pins vertColor_cache/clka] [get_bd_pins vertPosInvZ_cache/clka] [get_bd_pins vertPosX_cache/clka] [get_bd_pins vertPosY_cache/clka]
  connect_bd_net -net no_reset_dout [get_bd_pins no_reset/dout] [get_bd_pins rast_out_fifo/srst]
  connect_bd_net -net placeholder_texcfg_dout [get_bd_pins TriSetup_0/TEXCFG_nointerpolation] [get_bd_pins placeholder_texcfg/dout]
  connect_bd_net -net rd_clk_1 [get_bd_pins MemorySystem/rd_clk] [get_bd_pins ScanoutSystem/clk_out1]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins MemorySystem/reset] [get_bd_pins ResetN_UntilClockLoc_0/reset] [get_bd_pins ScanoutSystem/reset] [get_bd_pins SerialPacketSystem/reset] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins ResetN_UntilClockLoc_0/locked] [get_bd_pins constant_always_locked/dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces MemorySystem/MemoryController_0/M_AXI] [get_bd_addr_segs MemorySystem/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_ddr4_0_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00001000 -offset 0x00000000 [get_bd_addr_spaces SerialPacketSystem/PacketProcessor_0/M_AXI] [get_bd_addr_segs SerialPacketSystem/axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


