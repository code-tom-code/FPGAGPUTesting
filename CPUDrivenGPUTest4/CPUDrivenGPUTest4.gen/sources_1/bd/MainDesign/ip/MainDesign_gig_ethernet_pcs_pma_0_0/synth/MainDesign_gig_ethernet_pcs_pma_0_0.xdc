

## timing for MDIO interface
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *MDIO_INTERFACE_*/MDIO_OUT_reg}] -filter {REF_PIN_NAME =~ C}]
set_max_delay 6.000 -datapath_only -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *MDIO_INTERFACE_*/MDIO_TRI_reg}] -filter {REF_PIN_NAME =~ C}]

###############################################
##Rx Elastic Buffer Constraints 
###############################################
set_max_delay -from [get_cells -hier -filter {name =~ *rx_elastic_buffer_inst/wr_addr_*_reg[*]}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reclock_wr_addrgray[*].sync_wr_addrgray/data_sync*}] -filter {REF_PIN_NAME =~ D}] 8 -datapath_only
set_max_delay -from [get_cells -hier -filter {name =~ *rx_elastic_buffer_inst/rd_addr_*_reg[*]}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reclock_rd_addrgray[*].sync_rd_addrgray/data_sync*}] -filter {REF_PIN_NAME =~ D}] 8 -datapath_only
set_false_path -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *rx_elastic_buffer_inst/initialize_ram_complete_reg*}] -filter {REF_PIN_NAME =~ C}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *rx_elastic_buffer_inst/sync_initialize_ram_comp/data_sync_reg*}] -filter {REF_PIN_NAME =~ D}]

set_false_path -quiet -from [get_clocks -of_objects  [get_cells -hier -filter {name =~ */rx_elastic_buffer_inst/wr_addr_*_reg[*]}]] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *rx_elastic_buffer_inst/rd_data_reg[*]}] -filter {REF_PIN_NAME =~ D}]


# false path constraints to async inputs coming directly to synchronizer
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *SYNC_*/data_sync*}] -filter {REF_PIN_NAME =~ D}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *SYNC_*/reset_sync*}] -filter {REF_PIN_NAME =~ PRE}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reset_sync_*/*}] -filter {REF_PIN_NAME =~ PRE}]


set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *IntActTx_TByteinPip_reg[0]}] -filter {REF_PIN_NAME =~ D}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gen_io_logic/IntActTx_TByteinPip_reg[*]}] -filter {REF_PIN_NAME =~ CLR}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *BaseX_Byte_I_Tx_Nibble/Gen_1.Nibble_I_BitsliceCntrl}] -filter {REF_PIN_NAME =~ TBYTE_IN[*]}]

set_false_path -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *ram_inst*/RAM*}] -filter {REF_PIN_NAME =~ CLK}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gb_out_inst/DataOut_reg[*]}] -filter {REF_PIN_NAME =~ D}]
set_false_path -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *ram_inst*/RAM*}] -filter {REF_PIN_NAME =~ CLK}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gb_out_inst/IntLastOut_reg[*]}] -filter {REF_PIN_NAME =~ D}]
set_false_path -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gb_out_inst/IntRdEna_reg*}] -filter {REF_PIN_NAME =~ C}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gb_out_inst/IntRdEna_Sync_reg[*]}] -filter {REF_PIN_NAME =~ D}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gb_out_inst/Reset_Sync_reg[*]}] -filter {REF_PIN_NAME =~ PRE}]



set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *sync_speed_10*/data_sync*}] -filter {REF_PIN_NAME =~ D}]

set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gen_lvds_transceiver.gen_lvds_transceiver_logic[*].lvds_transceiver_inst/serdes_1_to_10_i/IntRx_BtVal_reg[*]}] -filter {REF_PIN_NAME =~ D}]

create_waiver -internal -scope  -type CDC -id {CDC-1} -user "gig_ethernet_pcs_pma" -tags "11999" -desc "The CDC-1 warning is waived as this is within the LVDS_transiver module and safe to ignore"\
 -from [get_pins -of [get_cells -hier -filter {name =~ */RAM*}] -filter {name =~ *CLK}]\
 -to [get_pins -of [get_cells -hier -filter {name =~ */*x_elastic_buffer_inst/rd_data_reg[*]*}] -filter {name =~ *D}]

create_waiver -internal -scope  -type CDC -id {CDC-10} -user "gig_ethernet_pcs_pma" -tags "11999" -desc "The CDC-10 warning is waived as this is within the LVDS_transiver module and safe to ignore"\
 -from [get_pins -of [get_cells -hier -filter {name =~ */USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg*}] -filter {name =~ *C}]\
 -to [get_pins -of [get_cells -hier -filter {name =~ */reset_sync1*}] -filter {name =~ *PRE}]

