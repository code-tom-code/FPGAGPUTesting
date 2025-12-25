## We'll wire up DVI-D/HDMI through the first PMOD port.
## DVI-D/HDMI takes 4 differential pairs (8 pins) broken up
## into TMDS groups. There's one for blue, green, red, and clock (in that order).

## It's very important that the TMDS pairs are wired up in BGRC order and not
## in the usual RGBC order! This is because the 0th B channel is the one that carries
## the HSYNC and VSYNC signals within it!

## Blue_P: PMOD0 port 0
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_blue_n]

## Blue_N: PMOD0 port 1
set_property PACKAGE_PIN B14 [get_ports tmds_blue_p]
set_property PACKAGE_PIN A14 [get_ports tmds_blue_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_blue_p]

## Green_P: PMOD0 port 2
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_green_n]

## Green_N: PMOD0 port 3
set_property PACKAGE_PIN A13 [get_ports tmds_green_p]
set_property PACKAGE_PIN A12 [get_ports tmds_green_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_green_p]

## Red_P: PMOD0 port 4
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_red_n]

## Red_N: PMOD0 port 5
set_property PACKAGE_PIN C12 [get_ports tmds_red_p]
set_property PACKAGE_PIN B12 [get_ports tmds_red_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_red_p]

## Clock_P: PMOD0 port 6
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_cl_n]

## Clock_N: PMOD0 port 7
set_property PACKAGE_PIN C14 [get_ports tmds_cl_p]
set_property PACKAGE_PIN C13 [get_ports tmds_cl_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_cl_p]

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets MainDesign_i/MemorySystem/ddr4_0/inst/u_ddr4_infrastructure/addn_ui_clkout1]


####################################################################################
# Constraints from file : 'MainDesign_ddr4_0_0_board.xdc'
####################################################################################

set fwclk        MainDesign_i/ScanoutSystem/scanout_clk_25_175_x10/inst/clk_in1;     # forwarded clock name (generated using create_generated_clock at output clock port)        
set tsu_r        0.5958291956305858987090367428004;            # destination device setup time requirement for rising edge
set thd_r        1.3902681231380337636544190665343;            # destination device hold time requirement for rising edge
set tsu_f        0.5958291956305858987090367428004;            # destination device setup time requirement for falling edge
set thd_f        1.3902681231380337636544190665343;            # destination device hold time requirement for falling edge
set trce_dly_max 0.000;            # maximum board trace delay
set trce_dly_min 0.000;            # minimum board trace delay
set output_ports {tmds_blue_n tmds_blue_p tmds_green_n tmds_green_p tmds_red_n tmds_red_p tmds_cl_n tmds_cl_p};   # list of output ports

# Output Delay Constraints
set_output_delay -clock $fwclk -max [expr $trce_dly_max + $tsu_r] [get_ports $output_ports];
set_output_delay -clock $fwclk -min [expr $trce_dly_min - $thd_r] [get_ports $output_ports];
set_output_delay -clock $fwclk -max [expr $trce_dly_max + $tsu_f] [get_ports $output_ports] -clock_fall -add_delay;
set_output_delay -clock $fwclk -min [expr $trce_dly_min - $thd_f] [get_ports $output_ports] -clock_fall -add_delay;

set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]

set_property LOC MMCM_X0Y3 [get_cells -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst}]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]
current_instance -quiet
set_property INTERNAL_VREF 0.84 [get_iobanks 67]
create_generated_clock -name MainDesign_i/NetworkPacketSystem/ClockDividerx4_10_to_2_5/U0/clkout25 -source [get_pins MainDesign_i/NetworkPacketSystem/clk_333_250_to_10_0/inst/mmcme4_adv_inst/CLKOUT0] -divide_by 4 [get_pins {MainDesign_i/NetworkPacketSystem/ClockDividerx4_10_to_2_5/U0/currentClk_reg[0]/Q}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
