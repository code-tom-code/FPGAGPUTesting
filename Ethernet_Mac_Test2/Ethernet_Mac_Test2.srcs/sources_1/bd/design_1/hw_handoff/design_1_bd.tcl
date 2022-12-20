
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
# ClockDivider4_1, CounterSignal, EthernetController3, EthernetMDIOController, MockCommandProcessor, NetProtoPacketProcessor, SGMII_PHY_Bringup_MDIO

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
  set default_sysclk1_300 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_sysclk1_300 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $default_sysclk1_300
  set mdio_mdc [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_mdc ]
  set sgmii_lvds [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:sgmii_rtl:1.0 sgmii_lvds ]
  set sgmii_phyclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sgmii_phyclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {625000000} \
   ] $sgmii_phyclk

  # Create ports

  # Create instance: ClockDivider4_1_0, and set properties
  set block_name ClockDivider4_1
  set block_cell_name ClockDivider4_1_0
  if { [catch {set ClockDivider4_1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ClockDivider4_1_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: CounterSignal_0, and set properties
  set block_name CounterSignal
  set block_cell_name CounterSignal_0
  if { [catch {set CounterSignal_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CounterSignal_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: EthernetController3_0, and set properties
  set block_name EthernetController3
  set block_cell_name EthernetController3_0
  if { [catch {set EthernetController3_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $EthernetController3_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.DEVICE_IPv4_ADDRESS_OCTET_0 {0xC0} \
   CONFIG.DEVICE_IPv4_ADDRESS_OCTET_1 {0xA8} \
   CONFIG.DEVICE_IPv4_ADDRESS_OCTET_2 {0x01} \
   CONFIG.DEVICE_IPv4_ADDRESS_OCTET_3 {0xAA} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_0 {0x00} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_1 {0x0A} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_2 {0x35} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_3 {0x03} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_4 {0x78} \
   CONFIG.DEVICE_MAC_ADDRESS_OCTET_5 {0xF1} \
   CONFIG.PAYLOAD_MAGIC_HEADER_BYTE {0xA5} \
 ] $EthernetController3_0

  # Create instance: EthernetMDIOControll_0, and set properties
  set block_name EthernetMDIOController
  set block_cell_name EthernetMDIOControll_0
  if { [catch {set EthernetMDIOControll_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $EthernetMDIOControll_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.USE_CLAUSE_45_PACKETS {false} \
 ] $EthernetMDIOControll_0

  # Create instance: MockCommandProcessor_0, and set properties
  set block_name MockCommandProcessor
  set block_cell_name MockCommandProcessor_0
  if { [catch {set MockCommandProcessor_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MockCommandProcessor_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: NetProtoPacketProces_0, and set properties
  set block_name NetProtoPacketProcessor
  set block_cell_name NetProtoPacketProces_0
  if { [catch {set NetProtoPacketProces_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $NetProtoPacketProces_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SGMII_PHY_Bringup_MD_0, and set properties
  set block_name SGMII_PHY_Bringup_MDIO
  set block_cell_name SGMII_PHY_Bringup_MD_0
  if { [catch {set SGMII_PHY_Bringup_MD_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $SGMII_PHY_Bringup_MD_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.PHY_Address {3} \
 ] $SGMII_PHY_Bringup_MD_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
   CONFIG.CLKOUT1_DRIVES {Buffer} \
   CONFIG.CLKOUT1_JITTER {203.128} \
   CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} \
   CONFIG.CLKOUT2_DRIVES {Buffer} \
   CONFIG.CLKOUT2_JITTER {148.677} \
   CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {Buffer} \
   CONFIG.CLKOUT3_JITTER {103.274} \
   CONFIG.CLKOUT3_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {333.25} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_DRIVES {Buffer} \
   CONFIG.CLKOUT5_DRIVES {Buffer} \
   CONFIG.CLKOUT6_DRIVES {Buffer} \
   CONFIG.CLKOUT7_DRIVES {Buffer} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {default_sysclk1_300} \
   CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {100.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {20} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {3} \
   CONFIG.MMCM_COMPENSATION {AUTO} \
   CONFIG.MMCM_DIVCLK_DIVIDE {3} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIMITIVE {MMCM} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.USE_BOARD_FLOW {true} \
   CONFIG.USE_LOCKED {false} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: gig_ethernet_pcs_pma_0, and set properties
  set gig_ethernet_pcs_pma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:gig_ethernet_pcs_pma:16.1 gig_ethernet_pcs_pma_0 ]
  set_property -dict [ list \
   CONFIG.Auto_Negotiation {true} \
   CONFIG.DIFFCLK_BOARD_INTERFACE {sgmii_phyclk} \
   CONFIG.ETHERNET_BOARD_INTERFACE {sgmii_lvds} \
   CONFIG.Ext_Management_Interface {true} \
   CONFIG.LvdsRefClk {625} \
   CONFIG.MDIO_BOARD_INTERFACE {mdio_mdc} \
   CONFIG.Management_Interface {true} \
   CONFIG.Physical_Interface {LVDS} \
   CONFIG.SGMII_PHY_Mode {false} \
   CONFIG.Standard {SGMII} \
   CONFIG.SupportLevel {Include_Shared_Logic_in_Core} \
   CONFIG.TxLane0_Placement {DIFF_PAIR_2} \
   CONFIG.Tx_In_Upper_Nibble {0} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $gig_ethernet_pcs_pma_0

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {15} \
   CONFIG.C_PROBE0_WIDTH {5} \
   CONFIG.C_PROBE12_WIDTH {32} \
   CONFIG.C_PROBE14_WIDTH {64} \
   CONFIG.C_PROBE1_WIDTH {5} \
   CONFIG.C_PROBE2_WIDTH {5} \
   CONFIG.C_PROBE6_WIDTH {32} \
   CONFIG.C_PROBE9_WIDTH {32} \
 ] $ila_0

  # Create instance: ila_25, and set properties
  set ila_25 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_25 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {17} \
   CONFIG.C_PROBE10_WIDTH {16} \
   CONFIG.C_PROBE11_WIDTH {6} \
   CONFIG.C_PROBE12_WIDTH {16} \
   CONFIG.C_PROBE15_WIDTH {5} \
   CONFIG.C_PROBE16_WIDTH {16} \
   CONFIG.C_PROBE2_WIDTH {5} \
   CONFIG.C_PROBE4_WIDTH {5} \
   CONFIG.C_PROBE5_WIDTH {5} \
   CONFIG.C_PROBE7_WIDTH {16} \
   CONFIG.C_PROBE8_WIDTH {5} \
   CONFIG.C_PROBE9_WIDTH {5} \
 ] $ila_25

  # Create instance: ila_125, and set properties
  set ila_125 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_125 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {31} \
   CONFIG.C_PROBE0_WIDTH {5} \
   CONFIG.C_PROBE13_WIDTH {3} \
   CONFIG.C_PROBE14_WIDTH {6} \
   CONFIG.C_PROBE17_WIDTH {32} \
   CONFIG.C_PROBE18_WIDTH {32} \
   CONFIG.C_PROBE19_WIDTH {7} \
   CONFIG.C_PROBE1_WIDTH {5} \
   CONFIG.C_PROBE20_WIDTH {32} \
   CONFIG.C_PROBE21_WIDTH {32} \
   CONFIG.C_PROBE22_WIDTH {2} \
   CONFIG.C_PROBE23_WIDTH {5} \
   CONFIG.C_PROBE25_WIDTH {12} \
   CONFIG.C_PROBE26_WIDTH {11} \
   CONFIG.C_PROBE27_WIDTH {11} \
   CONFIG.C_PROBE28_WIDTH {9} \
   CONFIG.C_PROBE2_WIDTH {5} \
   CONFIG.C_PROBE30_WIDTH {32} \
   CONFIG.C_PROBE3_WIDTH {8} \
   CONFIG.C_PROBE6_WIDTH {8} \
   CONFIG.C_PROBE9_WIDTH {16} \
 ] $ila_125

  # Create instance: pkt_recv_scratch_mem, and set properties
  set pkt_recv_scratch_mem [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 pkt_recv_scratch_mem ]
  set_property -dict [ list \
   CONFIG.Assume_Synchronous_Clk {true} \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Operating_Mode_B {READ_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Read_Width_A {8} \
   CONFIG.Read_Width_B {32} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {2048} \
   CONFIG.Write_Width_A {8} \
   CONFIG.Write_Width_B {32} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $pkt_recv_scratch_mem

  # Create instance: recv_pkt_data_fifo, and set properties
  set recv_pkt_data_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 recv_pkt_data_fifo ]
  set_property -dict [ list \
   CONFIG.Data_Count {false} \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Empty_Threshold_Assert_Value {4} \
   CONFIG.Empty_Threshold_Negate_Value {5} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM} \
   CONFIG.Full_Threshold_Assert_Value {2047} \
   CONFIG.Full_Threshold_Negate_Value {2046} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {2048} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Data_Count_Width {11} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count {true} \
   CONFIG.Write_Data_Count_Width {11} \
 ] $recv_pkt_data_fifo

  # Create instance: recv_pkt_header_fifo, and set properties
  set recv_pkt_header_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 recv_pkt_header_fifo ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {509} \
   CONFIG.Full_Threshold_Negate_Value {508} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Programmable_Full_Type {Single_Programmable_Full_Threshold_Constant} \
   CONFIG.Read_Clock_Frequency {333} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Write_Clock_Frequency {125} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $recv_pkt_header_fifo

  # Create instance: returnPacketsFIFO, and set properties
  set returnPacketsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 returnPacketsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {4} \
   CONFIG.Empty_Threshold_Negate_Value {5} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {88} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {88} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $returnPacketsFIFO

  # Create instance: send_pkt_data_fifo, and set properties
  set send_pkt_data_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 send_pkt_data_fifo ]
  set_property -dict [ list \
   CONFIG.Data_Count {false} \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Empty_Threshold_Assert_Value {4} \
   CONFIG.Empty_Threshold_Negate_Value {5} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM} \
   CONFIG.Full_Threshold_Assert_Value {2045} \
   CONFIG.Full_Threshold_Negate_Value {2044} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {8} \
   CONFIG.Output_Depth {8192} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Data_Count_Width {13} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count {true} \
   CONFIG.Write_Data_Count_Width {11} \
   CONFIG.asymmetric_port_width {true} \
 ] $send_pkt_data_fifo

  # Create instance: send_pkt_header_fifo, and set properties
  set send_pkt_header_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 send_pkt_header_fifo ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {6} \
   CONFIG.Empty_Threshold_Negate_Value {7} \
   CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Programmable_Full_Type {Single_Programmable_Full_Threshold_Constant} \
   CONFIG.Read_Clock_Frequency {125} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Write_Clock_Frequency {333} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $send_pkt_header_fifo

  # Create instance: validPacketsFIFO, and set properties
  set validPacketsFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 validPacketsFIFO ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {9} \
   CONFIG.Empty_Threshold_Assert_Value {4} \
   CONFIG.Empty_Threshold_Negate_Value {5} \
   CONFIG.Full_Threshold_Assert_Value {511} \
   CONFIG.Full_Threshold_Negate_Value {510} \
   CONFIG.Input_Data_Width {88} \
   CONFIG.Input_Depth {512} \
   CONFIG.Output_Data_Width {88} \
   CONFIG.Output_Depth {512} \
   CONFIG.Performance_Options {First_Word_Fall_Through} \
   CONFIG.Read_Data_Count_Width {9} \
   CONFIG.Use_Embedded_Registers {false} \
   CONFIG.Write_Data_Count_Width {9} \
 ] $validPacketsFIFO

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net EthernetController3_0_GMII [get_bd_intf_pins EthernetController3_0/GMII] [get_bd_intf_pins gig_ethernet_pcs_pma_0/gmii_pcs_pma_0]
  connect_bd_intf_net -intf_net EthernetController3_0_RecvScratchRDB [get_bd_intf_pins EthernetController3_0/RecvScratchRDB] [get_bd_intf_pins pkt_recv_scratch_mem/BRAM_PORTB]
  connect_bd_intf_net -intf_net EthernetController3_0_RecvScratchWRA [get_bd_intf_pins EthernetController3_0/RecvScratchWRA] [get_bd_intf_pins pkt_recv_scratch_mem/BRAM_PORTA]
  connect_bd_intf_net -intf_net EthernetController3_0_recv_pkt_data [get_bd_intf_pins EthernetController3_0/recv_pkt_data] [get_bd_intf_pins recv_pkt_data_fifo/FIFO_WRITE]
  connect_bd_intf_net -intf_net EthernetController3_0_recv_pkt_header [get_bd_intf_pins EthernetController3_0/recv_pkt_header] [get_bd_intf_pins recv_pkt_header_fifo/FIFO_WRITE]
  connect_bd_intf_net -intf_net EthernetController3_0_send_pkt_data [get_bd_intf_pins EthernetController3_0/send_pkt_data] [get_bd_intf_pins send_pkt_data_fifo/FIFO_READ]
  connect_bd_intf_net -intf_net EthernetController3_0_send_pkt_header [get_bd_intf_pins EthernetController3_0/send_pkt_header] [get_bd_intf_pins send_pkt_header_fifo/FIFO_READ]
  connect_bd_intf_net -intf_net EthernetMDIOControll_0_MDIO [get_bd_intf_pins EthernetMDIOControll_0/MDIO] [get_bd_intf_pins gig_ethernet_pcs_pma_0/mdio_pcs_pma_0]
  connect_bd_intf_net -intf_net MockCommandProcessor_0_returnPacketsFIFO [get_bd_intf_pins MockCommandProcessor_0/returnPacketsFIFO] [get_bd_intf_pins returnPacketsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net MockCommandProcessor_0_validPacketsFIFO [get_bd_intf_pins MockCommandProcessor_0/validPacketsFIFO] [get_bd_intf_pins validPacketsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_recv_pkt_data [get_bd_intf_pins NetProtoPacketProces_0/recv_pkt_data] [get_bd_intf_pins recv_pkt_data_fifo/FIFO_READ]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_recv_pkt_header [get_bd_intf_pins NetProtoPacketProces_0/recv_pkt_header] [get_bd_intf_pins recv_pkt_header_fifo/FIFO_READ]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_returnPacketsFIFO [get_bd_intf_pins NetProtoPacketProces_0/returnPacketsFIFO] [get_bd_intf_pins returnPacketsFIFO/FIFO_READ]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_send_pkt_data [get_bd_intf_pins NetProtoPacketProces_0/send_pkt_data] [get_bd_intf_pins send_pkt_data_fifo/FIFO_WRITE]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_send_pkt_header [get_bd_intf_pins NetProtoPacketProces_0/send_pkt_header] [get_bd_intf_pins send_pkt_header_fifo/FIFO_WRITE]
  connect_bd_intf_net -intf_net NetProtoPacketProces_0_validPacketsFIFO [get_bd_intf_pins NetProtoPacketProces_0/validPacketsFIFO] [get_bd_intf_pins validPacketsFIFO/FIFO_WRITE]
  connect_bd_intf_net -intf_net default_sysclk1_300_1 [get_bd_intf_ports default_sysclk1_300] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net gig_ethernet_pcs_pma_0_ext_mdio_pcs_pma_0 [get_bd_intf_ports mdio_mdc] [get_bd_intf_pins gig_ethernet_pcs_pma_0/ext_mdio_pcs_pma_0]
  connect_bd_intf_net -intf_net gig_ethernet_pcs_pma_0_sgmii_0 [get_bd_intf_ports sgmii_lvds] [get_bd_intf_pins gig_ethernet_pcs_pma_0/sgmii_0]
  connect_bd_intf_net -intf_net sgmii_phyclk_1 [get_bd_intf_ports sgmii_phyclk] [get_bd_intf_pins gig_ethernet_pcs_pma_0/refclk625_in]

  # Create port connections
  connect_bd_net -net ClockDivider4_1_0_clkout25 [get_bd_pins ClockDivider4_1_0/clkout25] [get_bd_pins EthernetMDIOControll_0/clkin25] [get_bd_pins SGMII_PHY_Bringup_MD_0/clkin25]
  connect_bd_net -net CounterSignal_0_readySignal [get_bd_pins CounterSignal_0/readySignal] [get_bd_pins ila_25/probe3]
  connect_bd_net -net EthernetController3_0_DBG_ARPPacketTPA [get_bd_pins EthernetController3_0/DBG_ARPPacketTPA] [get_bd_pins ila_125/probe20]
  connect_bd_net -net EthernetController3_0_DBG_DeviceTPA [get_bd_pins EthernetController3_0/DBG_DeviceTPA] [get_bd_pins ila_125/probe21]
  connect_bd_net -net EthernetController3_0_DBG_EthConfig_State [get_bd_pins EthernetController3_0/DBG_EthConfig_State] [get_bd_pins ila_125/probe0]
  connect_bd_net -net EthernetController3_0_DBG_EthRecv_State [get_bd_pins EthernetController3_0/DBG_EthRecv_State] [get_bd_pins ila_125/probe2]
  connect_bd_net -net EthernetController3_0_DBG_EthSend_State [get_bd_pins EthernetController3_0/DBG_EthSend_State] [get_bd_pins ila_125/probe1]
  connect_bd_net -net EthernetController3_0_DBG_RecvComputedCRC32 [get_bd_pins EthernetController3_0/DBG_RecvComputedCRC32] [get_bd_pins ila_125/probe18]
  connect_bd_net -net EthernetController3_0_DBG_RecvFIFOAvailableBytes [get_bd_pins EthernetController3_0/DBG_RecvFIFOAvailableBytes] [get_bd_pins ila_125/probe26]
  connect_bd_net -net EthernetController3_0_DBG_RecvFIFOCount [get_bd_pins EthernetController3_0/DBG_RecvFIFOCount] [get_bd_pins ila_125/probe27]
  connect_bd_net -net EthernetController3_0_DBG_RecvFifoPush_State [get_bd_pins EthernetController3_0/DBG_RecvFifoPush_State] [get_bd_pins ila_125/probe23]
  connect_bd_net -net EthernetController3_0_DBG_RecvPacketFCS [get_bd_pins EthernetController3_0/DBG_RecvPacketFCS] [get_bd_pins ila_125/probe17]
  connect_bd_net -net EthernetController3_0_DBG_RecvPacketSizeDWORDs [get_bd_pins EthernetController3_0/DBG_RecvPacketSizeDWORDs] [get_bd_pins ila_125/probe25]
  connect_bd_net -net EthernetController3_0_DBG_RecvValid_ARP [get_bd_pins EthernetController3_0/DBG_RecvValid_ARP] [get_bd_pins ila_125/probe19]
  connect_bd_net -net EthernetController3_0_DBG_RecvValid_IPv4 [get_bd_pins EthernetController3_0/DBG_RecvValid_IPv4] [get_bd_pins ila_125/probe14]
  connect_bd_net -net EthernetController3_0_DBG_RecvValid_MAC [get_bd_pins EthernetController3_0/DBG_RecvValid_MAC] [get_bd_pins ila_125/probe13]
  connect_bd_net -net EthernetController3_0_DBG_RecvValid_Payload [get_bd_pins EthernetController3_0/DBG_RecvValid_Payload] [get_bd_pins ila_125/probe16]
  connect_bd_net -net EthernetController3_0_DBG_RecvValid_UDP [get_bd_pins EthernetController3_0/DBG_RecvValid_UDP] [get_bd_pins ila_125/probe15]
  connect_bd_net -net EthernetController3_0_DBG_Recv_pkt_header_prog_full [get_bd_pins EthernetController3_0/DBG_Recv_pkt_header_prog_full] [get_bd_pins ila_125/probe24]
  connect_bd_net -net EthernetController3_0_DBG_SendType [get_bd_pins EthernetController3_0/DBG_SendType] [get_bd_pins ila_125/probe22]
  connect_bd_net -net EthernetController3_0_NETPKT_RecvReady [get_bd_pins EthernetController3_0/NETPKT_RecvReady] [get_bd_pins NetProtoPacketProces_0/ETHCTRL_RecvReady]
  connect_bd_net -net EthernetController3_0_NETPKT_SendReady [get_bd_pins EthernetController3_0/NETPKT_SendReady] [get_bd_pins NetProtoPacketProces_0/ETHCTRL_SendReady]
  connect_bd_net -net EthernetController3_0_an_adv_config_val [get_bd_pins EthernetController3_0/an_adv_config_val] [get_bd_pins gig_ethernet_pcs_pma_0/an_adv_config_val_0]
  connect_bd_net -net EthernetController3_0_an_adv_config_vector [get_bd_pins EthernetController3_0/an_adv_config_vector] [get_bd_pins gig_ethernet_pcs_pma_0/an_adv_config_vector_0]
  connect_bd_net -net EthernetController3_0_an_restart_config [get_bd_pins EthernetController3_0/an_restart_config] [get_bd_pins gig_ethernet_pcs_pma_0/an_restart_config_0]
  connect_bd_net -net EthernetController3_0_configuration_valid [get_bd_pins EthernetController3_0/configuration_valid] [get_bd_pins gig_ethernet_pcs_pma_0/configuration_valid_0]
  connect_bd_net -net EthernetController3_0_configuration_vector [get_bd_pins EthernetController3_0/configuration_vector] [get_bd_pins gig_ethernet_pcs_pma_0/configuration_vector_0]
  connect_bd_net -net EthernetController3_0_pcs_rst_out [get_bd_pins EthernetController3_0/pcs_rst_out] [get_bd_pins gig_ethernet_pcs_pma_0/reset]
  connect_bd_net -net EthernetController3_0_phyaddr [get_bd_pins EthernetController3_0/phyaddr] [get_bd_pins gig_ethernet_pcs_pma_0/phyaddr_0]
  connect_bd_net -net EthernetController3_0_recv_scratch_addrb [get_bd_pins EthernetController3_0/recv_scratch_addrb] [get_bd_pins ila_125/probe28] [get_bd_pins pkt_recv_scratch_mem/addrb]
  connect_bd_net -net EthernetController3_0_recv_scratch_clkb125 [get_bd_pins EthernetController3_0/recv_scratch_clkb125] [get_bd_pins pkt_recv_scratch_mem/clkb]
  connect_bd_net -net EthernetController3_0_recv_scratch_enb [get_bd_pins EthernetController3_0/recv_scratch_enb] [get_bd_pins ila_125/probe29] [get_bd_pins pkt_recv_scratch_mem/enb]
  connect_bd_net -net EthernetController3_0_riu_prsnt_1 [get_bd_pins EthernetController3_0/riu_prsnt_1] [get_bd_pins gig_ethernet_pcs_pma_0/riu_prsnt_1]
  connect_bd_net -net EthernetController3_0_riu_prsnt_2 [get_bd_pins EthernetController3_0/riu_prsnt_2] [get_bd_pins gig_ethernet_pcs_pma_0/riu_prsnt_2]
  connect_bd_net -net EthernetController3_0_riu_prsnt_3 [get_bd_pins EthernetController3_0/riu_prsnt_3] [get_bd_pins gig_ethernet_pcs_pma_0/riu_prsnt_3]
  connect_bd_net -net EthernetController3_0_riu_rddata_1 [get_bd_pins EthernetController3_0/riu_rddata_1] [get_bd_pins gig_ethernet_pcs_pma_0/riu_rddata_1]
  connect_bd_net -net EthernetController3_0_riu_rddata_2 [get_bd_pins EthernetController3_0/riu_rddata_2] [get_bd_pins gig_ethernet_pcs_pma_0/riu_rddata_2]
  connect_bd_net -net EthernetController3_0_riu_rddata_3 [get_bd_pins EthernetController3_0/riu_rddata_3] [get_bd_pins gig_ethernet_pcs_pma_0/riu_rddata_3]
  connect_bd_net -net EthernetController3_0_riu_valid_1 [get_bd_pins EthernetController3_0/riu_valid_1] [get_bd_pins gig_ethernet_pcs_pma_0/riu_valid_1]
  connect_bd_net -net EthernetController3_0_riu_valid_2 [get_bd_pins EthernetController3_0/riu_valid_2] [get_bd_pins gig_ethernet_pcs_pma_0/riu_valid_2]
  connect_bd_net -net EthernetController3_0_riu_valid_3 [get_bd_pins EthernetController3_0/riu_valid_3] [get_bd_pins gig_ethernet_pcs_pma_0/riu_valid_3]
  connect_bd_net -net EthernetController3_0_rx_dly_rdy_1 [get_bd_pins EthernetController3_0/rx_dly_rdy_1] [get_bd_pins gig_ethernet_pcs_pma_0/rx_dly_rdy_1]
  connect_bd_net -net EthernetController3_0_rx_dly_rdy_2 [get_bd_pins EthernetController3_0/rx_dly_rdy_2] [get_bd_pins gig_ethernet_pcs_pma_0/rx_dly_rdy_2]
  connect_bd_net -net EthernetController3_0_rx_dly_rdy_3 [get_bd_pins EthernetController3_0/rx_dly_rdy_3] [get_bd_pins gig_ethernet_pcs_pma_0/rx_dly_rdy_3]
  connect_bd_net -net EthernetController3_0_rx_vtc_rdy_1 [get_bd_pins EthernetController3_0/rx_vtc_rdy_1] [get_bd_pins gig_ethernet_pcs_pma_0/rx_vtc_rdy_1]
  connect_bd_net -net EthernetController3_0_rx_vtc_rdy_2 [get_bd_pins EthernetController3_0/rx_vtc_rdy_2] [get_bd_pins gig_ethernet_pcs_pma_0/rx_vtc_rdy_2]
  connect_bd_net -net EthernetController3_0_rx_vtc_rdy_3 [get_bd_pins EthernetController3_0/rx_vtc_rdy_3] [get_bd_pins gig_ethernet_pcs_pma_0/rx_vtc_rdy_3]
  connect_bd_net -net EthernetController3_0_signal_detect [get_bd_pins EthernetController3_0/signal_detect] [get_bd_pins gig_ethernet_pcs_pma_0/signal_detect_0]
  connect_bd_net -net EthernetController3_0_speed_is_100 [get_bd_pins EthernetController3_0/speed_is_100] [get_bd_pins gig_ethernet_pcs_pma_0/speed_is_100_0]
  connect_bd_net -net EthernetController3_0_speed_is_10_100 [get_bd_pins EthernetController3_0/speed_is_10_100] [get_bd_pins gig_ethernet_pcs_pma_0/speed_is_10_100_0]
  connect_bd_net -net EthernetController3_0_tx_data [get_bd_pins EthernetController3_0/tx_data] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_txd_0] [get_bd_pins ila_125/probe3]
  connect_bd_net -net EthernetController3_0_tx_dly_rdy_1 [get_bd_pins EthernetController3_0/tx_dly_rdy_1] [get_bd_pins gig_ethernet_pcs_pma_0/tx_dly_rdy_1]
  connect_bd_net -net EthernetController3_0_tx_dly_rdy_2 [get_bd_pins EthernetController3_0/tx_dly_rdy_2] [get_bd_pins gig_ethernet_pcs_pma_0/tx_dly_rdy_2]
  connect_bd_net -net EthernetController3_0_tx_dly_rdy_3 [get_bd_pins EthernetController3_0/tx_dly_rdy_3] [get_bd_pins gig_ethernet_pcs_pma_0/tx_dly_rdy_3]
  connect_bd_net -net EthernetController3_0_tx_en [get_bd_pins EthernetController3_0/tx_en] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_tx_en_0] [get_bd_pins ila_125/probe4]
  connect_bd_net -net EthernetController3_0_tx_er [get_bd_pins EthernetController3_0/tx_er] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_tx_er_0] [get_bd_pins ila_125/probe5]
  connect_bd_net -net EthernetController3_0_tx_vtc_rdy_1 [get_bd_pins EthernetController3_0/tx_vtc_rdy_1] [get_bd_pins gig_ethernet_pcs_pma_0/tx_vtc_rdy_1]
  connect_bd_net -net EthernetController3_0_tx_vtc_rdy_2 [get_bd_pins EthernetController3_0/tx_vtc_rdy_2] [get_bd_pins gig_ethernet_pcs_pma_0/tx_vtc_rdy_2]
  connect_bd_net -net EthernetController3_0_tx_vtc_rdy_3 [get_bd_pins EthernetController3_0/tx_vtc_rdy_3] [get_bd_pins gig_ethernet_pcs_pma_0/tx_vtc_rdy_3]
  connect_bd_net -net EthernetMDIOControll_0_DBG_BitsRemaining [get_bd_pins EthernetMDIOControll_0/DBG_BitsRemaining] [get_bd_pins ila_25/probe11]
  connect_bd_net -net EthernetMDIOControll_0_DBG_EthMDIO_State [get_bd_pins EthernetMDIOControll_0/DBG_EthMDIO_State] [get_bd_pins ila_25/probe2]
  connect_bd_net -net EthernetMDIOControll_0_DBG_InProgressRead [get_bd_pins EthernetMDIOControll_0/DBG_InProgressRead] [get_bd_pins ila_25/probe12]
  connect_bd_net -net EthernetMDIOControll_0_mdio_i [get_bd_pins EthernetMDIOControll_0/mdio_i] [get_bd_pins gig_ethernet_pcs_pma_0/mdio_i_0] [get_bd_pins ila_25/probe0]
  connect_bd_net -net EthernetMDIOControll_0_mdio_t_ctrl [get_bd_pins EthernetMDIOControll_0/mdio_t_ctrl] [get_bd_pins gig_ethernet_pcs_pma_0/mdio_t_in_0] [get_bd_pins ila_25/probe1]
  connect_bd_net -net EthernetMDIOControll_0_registerReadData [get_bd_pins EthernetMDIOControll_0/registerReadData] [get_bd_pins SGMII_PHY_Bringup_MD_0/registerReadData] [get_bd_pins ila_25/probe7]
  connect_bd_net -net EthernetMDIOControll_0_registerReadReady [get_bd_pins EthernetMDIOControll_0/registerReadReady] [get_bd_pins SGMII_PHY_Bringup_MD_0/registerReadReady] [get_bd_pins ila_25/probe6]
  connect_bd_net -net EthernetMDIOControll_0_registerWriteComplete [get_bd_pins EthernetMDIOControll_0/registerWriteComplete] [get_bd_pins SGMII_PHY_Bringup_MD_0/registerWriteComplete]
  connect_bd_net -net Net [get_bd_pins MockCommandProcessor_0/clk333_250] [get_bd_pins NetProtoPacketProces_0/clk333_250] [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins ila_0/clk] [get_bd_pins recv_pkt_data_fifo/rd_clk] [get_bd_pins recv_pkt_header_fifo/rd_clk] [get_bd_pins returnPacketsFIFO/clk] [get_bd_pins send_pkt_data_fifo/wr_clk] [get_bd_pins send_pkt_header_fifo/wr_clk] [get_bd_pins validPacketsFIFO/clk]
  connect_bd_net -net NetProtoPacketProces_0_DBG_NetPkt_State [get_bd_pins NetProtoPacketProces_0/DBG_NetPkt_State] [get_bd_pins ila_0/probe0]
  connect_bd_net -net NetProtoPacketProces_0_DBG_RecvFIFOState [get_bd_pins NetProtoPacketProces_0/DBG_RecvFIFOState] [get_bd_pins ila_0/probe2]
  connect_bd_net -net NetProtoPacketProces_0_DBG_SendFIFOState [get_bd_pins NetProtoPacketProces_0/DBG_SendFIFOState] [get_bd_pins ila_0/probe1]
  connect_bd_net -net NetProtoPacketProces_0_DBG_recvPacketData [get_bd_pins NetProtoPacketProces_0/DBG_recvPacketData] [get_bd_pins ila_0/probe14]
  connect_bd_net -net NetProtoPacketProces_0_DBG_recvSendReplyPacket [get_bd_pins NetProtoPacketProces_0/DBG_recvSendReplyPacket] [get_bd_pins ila_0/probe3]
  connect_bd_net -net NetProtoPacketProces_0_DBG_sendHandlingReply [get_bd_pins NetProtoPacketProces_0/DBG_sendHandlingReply] [get_bd_pins ila_0/probe5]
  connect_bd_net -net NetProtoPacketProces_0_DBG_sendReplyAck [get_bd_pins NetProtoPacketProces_0/DBG_sendReplyAck] [get_bd_pins ila_0/probe4]
  connect_bd_net -net NetProtoPacketProces_0_recv_pkt_data_rd_en [get_bd_pins NetProtoPacketProces_0/recv_pkt_data_rd_en] [get_bd_pins ila_0/probe10] [get_bd_pins recv_pkt_data_fifo/rd_en]
  connect_bd_net -net NetProtoPacketProces_0_recv_pkt_header_rd_en [get_bd_pins NetProtoPacketProces_0/recv_pkt_header_rd_en] [get_bd_pins ila_0/probe7] [get_bd_pins recv_pkt_header_fifo/rd_en]
  connect_bd_net -net NetProtoPacketProces_0_send_pkt_header_wr_data [get_bd_pins NetProtoPacketProces_0/send_pkt_header_wr_data] [get_bd_pins ila_0/probe12] [get_bd_pins send_pkt_header_fifo/din]
  connect_bd_net -net NetProtoPacketProces_0_send_pkt_header_wr_en [get_bd_pins NetProtoPacketProces_0/send_pkt_header_wr_en] [get_bd_pins ila_0/probe13] [get_bd_pins send_pkt_header_fifo/wr_en]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_DBG_Bringup_State [get_bd_pins SGMII_PHY_Bringup_MD_0/DBG_Bringup_State] [get_bd_pins ila_25/probe8]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadData [get_bd_pins SGMII_PHY_Bringup_MD_0/DBG_RegPCSPMAReadData] [get_bd_pins ila_25/probe16]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadIndex [get_bd_pins SGMII_PHY_Bringup_MD_0/DBG_RegPCSPMAReadIndex] [get_bd_pins ila_25/probe15]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_DBG_RegReadData [get_bd_pins SGMII_PHY_Bringup_MD_0/DBG_RegReadData] [get_bd_pins ila_25/probe10]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_DBG_RegReadIndex [get_bd_pins SGMII_PHY_Bringup_MD_0/DBG_RegReadIndex] [get_bd_pins ila_25/probe9]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestData [get_bd_pins EthernetMDIOControll_0/newRequestData] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestData]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestDevTypeRegister [get_bd_pins EthernetMDIOControll_0/newRequestDevTypeRegister] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestDevTypeRegister] [get_bd_pins ila_25/probe4]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestIsWrite [get_bd_pins EthernetMDIOControll_0/newRequestIsWrite] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestIsWrite]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestPHYAddress [get_bd_pins EthernetMDIOControll_0/newRequestPHYAddress] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestPHYAddress] [get_bd_pins ila_25/probe5]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestRegister [get_bd_pins EthernetMDIOControll_0/newRequestRegister] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestRegister]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_newRequestStart [get_bd_pins EthernetMDIOControll_0/newRequestStart] [get_bd_pins SGMII_PHY_Bringup_MD_0/newRequestStart]
  connect_bd_net -net SGMII_PHY_Bringup_MD_0_phyBringupComplete [get_bd_pins EthernetController3_0/phyBringupComplete] [get_bd_pins SGMII_PHY_Bringup_MD_0/phyBringupComplete]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins ClockDivider4_1_0/clkin100] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins ila_25/clk]
  connect_bd_net -net gig_ethernet_pcs_pma_0_clk125_out [get_bd_pins CounterSignal_0/clkin] [get_bd_pins EthernetController3_0/clk125] [get_bd_pins gig_ethernet_pcs_pma_0/clk125_out] [get_bd_pins ila_125/clk] [get_bd_pins recv_pkt_data_fifo/wr_clk] [get_bd_pins recv_pkt_header_fifo/wr_clk] [get_bd_pins send_pkt_data_fifo/rd_clk] [get_bd_pins send_pkt_header_fifo/rd_clk]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_isolate_0 [get_bd_pins EthernetController3_0/gmii_isolate] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_isolate_0] [get_bd_pins ila_125/probe10]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rx_dv_0 [get_bd_pins EthernetController3_0/rx_dv] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rx_dv_0] [get_bd_pins ila_125/probe7]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rx_er_0 [get_bd_pins EthernetController3_0/rx_er] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rx_er_0] [get_bd_pins ila_125/probe8]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rxd_0 [get_bd_pins EthernetController3_0/rx_data] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rxd_0] [get_bd_pins ila_125/probe6]
  connect_bd_net -net gig_ethernet_pcs_pma_0_mdio_o_0 [get_bd_pins EthernetMDIOControll_0/mdio_o] [get_bd_pins gig_ethernet_pcs_pma_0/mdio_o_0] [get_bd_pins ila_25/probe13]
  connect_bd_net -net gig_ethernet_pcs_pma_0_rx_locked [get_bd_pins EthernetController3_0/rx_locked] [get_bd_pins gig_ethernet_pcs_pma_0/rx_locked] [get_bd_pins ila_125/probe11]
  connect_bd_net -net gig_ethernet_pcs_pma_0_sgmii_clk_en_0 [get_bd_pins gig_ethernet_pcs_pma_0/sgmii_clk_en_0] [get_bd_pins ila_25/probe14]
  connect_bd_net -net gig_ethernet_pcs_pma_0_status_vector_0 [get_bd_pins EthernetController3_0/status_vector] [get_bd_pins gig_ethernet_pcs_pma_0/status_vector_0] [get_bd_pins ila_125/probe9]
  connect_bd_net -net gig_ethernet_pcs_pma_0_tx_locked [get_bd_pins EthernetController3_0/tx_locked] [get_bd_pins gig_ethernet_pcs_pma_0/tx_locked] [get_bd_pins ila_125/probe12]
  connect_bd_net -net pkt_recv_scratch_mem_doutb [get_bd_pins EthernetController3_0/recv_scratch_doutb] [get_bd_pins ila_125/probe30] [get_bd_pins pkt_recv_scratch_mem/doutb]
  connect_bd_net -net recv_pkt_data_fifo_dout [get_bd_pins NetProtoPacketProces_0/recv_pkt_data_rd_data] [get_bd_pins ila_0/probe9] [get_bd_pins recv_pkt_data_fifo/dout]
  connect_bd_net -net recv_pkt_data_fifo_empty [get_bd_pins NetProtoPacketProces_0/recv_pkt_data_empty] [get_bd_pins ila_0/probe11] [get_bd_pins recv_pkt_data_fifo/empty]
  connect_bd_net -net recv_pkt_data_fifo_wr_data_count [get_bd_pins EthernetController3_0/recv_pkt_data_count] [get_bd_pins recv_pkt_data_fifo/wr_data_count]
  connect_bd_net -net recv_pkt_header_fifo_dout [get_bd_pins NetProtoPacketProces_0/recv_pkt_header_rd_data] [get_bd_pins ila_0/probe6] [get_bd_pins recv_pkt_header_fifo/dout]
  connect_bd_net -net recv_pkt_header_fifo_empty [get_bd_pins NetProtoPacketProces_0/recv_pkt_header_empty] [get_bd_pins ila_0/probe8] [get_bd_pins recv_pkt_header_fifo/empty]
  connect_bd_net -net recv_pkt_header_fifo_prog_full [get_bd_pins EthernetController3_0/recv_pkt_header_prog_full] [get_bd_pins recv_pkt_header_fifo/prog_full]
  connect_bd_net -net send_pkt_data_fifo_wr_data_count [get_bd_pins NetProtoPacketProces_0/send_pkt_data_count] [get_bd_pins send_pkt_data_fifo/wr_data_count]
  connect_bd_net -net send_pkt_header_fifo_prog_full [get_bd_pins NetProtoPacketProces_0/send_pkt_header_prog_full] [get_bd_pins send_pkt_header_fifo/prog_full]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins SGMII_PHY_Bringup_MD_0/dbgRst] [get_bd_pins recv_pkt_header_fifo/srst] [get_bd_pins returnPacketsFIFO/srst] [get_bd_pins send_pkt_header_fifo/srst] [get_bd_pins validPacketsFIFO/srst] [get_bd_pins xlconstant_0/dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


