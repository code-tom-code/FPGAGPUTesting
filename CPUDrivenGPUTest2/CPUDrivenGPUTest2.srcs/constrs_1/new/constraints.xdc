## We'll wire up DVI-D/HDMI through the first PMOD port.
## DVI-D/HDMI takes 4 differential pairs (8 pins) broken up
## into TMDS groups. There's one for blue, green, red, and clock (in that order).

## It's very important that the TMDS pairs are wired up in BGRC order and not
## in the usual RGBC order! This is because the 0th B channel is the one that carries
## the HSYNC and VSYNC signals within it!

## Blue_P: PMOD0 port 0
set_property PACKAGE_PIN A14 [get_ports tmds_blue_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_blue_n]

## Blue_N: PMOD0 port 1
set_property PACKAGE_PIN B14 [get_ports tmds_blue_p]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_blue_p]

## Green_P: PMOD0 port 2
set_property PACKAGE_PIN A12 [get_ports tmds_green_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_green_n]

## Green_N: PMOD0 port 3
set_property PACKAGE_PIN A13 [get_ports tmds_green_p]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_green_p]

## Red_P: PMOD0 port 4
set_property PACKAGE_PIN B12 [get_ports tmds_red_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_red_n]

## Red_N: PMOD0 port 5
set_property PACKAGE_PIN C12 [get_ports tmds_red_p]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_red_p]

## Clock_P: PMOD0 port 6
set_property PACKAGE_PIN C13 [get_ports tmds_cl_n]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_cl_n]

## Clock_N: PMOD0 port 7
set_property PACKAGE_PIN C14 [get_ports tmds_cl_p]
set_property IOSTANDARD DIFF_HSTL_I [get_ports tmds_cl_p]


set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_txd]
set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_rxd]





current_instance design_1_i/MemorySystem/ddr4_0/inst
set_property LOC MMCM_X0Y3 [get_cells -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst}]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]

current_instance -quiet
set_output_delay -clock [get_clocks design_1_i/ScanoutSystem/scanout_clk_25_175_x10/inst/clk_in1] 1.000 [get_ports {tmds_blue_n tmds_blue_p tmds_green_n tmds_green_p tmds_red_n tmds_red_p tmds_cl_n tmds_cl_p}]



current_instance design_1_i/MemorySystem/ddr4_0/inst
set_property LOC MMCM_X0Y3 [get_cells -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst}]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]
current_instance -quiet
set_property INTERNAL_VREF 0.84 [get_iobanks 67]

create_pblock pblock_ScanoutSystem

set_property C_CLK_INPUT_FREQ_HZ 333250000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
