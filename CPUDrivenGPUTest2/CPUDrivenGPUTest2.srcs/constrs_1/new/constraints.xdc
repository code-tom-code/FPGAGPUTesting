## Since we're using R5G5B4 color here, we'll lay things out like this so that we can
## utilize all 16 GPIO PMOD pins for VGA (we need VSync and HSync and the rest of the
## pins can be for RGB).
## Each PMOD connector has 8 GPIO pins, so using PMOD0 and PMOD1 together we can have 16 total.
## PMOD0 port 0 -> vsync
## PMOD0 port 1 -> hsync
## PMOD0 ports 23456 -> R5
## PMOD0 port 7 -> G0
## PMOD1 ports 0123 -> G4
## PMOD2 ports 4567 -> B4

## VSync uses PMOD0 port 0
set_property PACKAGE_PIN A14 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

## HSync uses PMOD0 port 1
set_property PACKAGE_PIN B14 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]

## Red uses PMOD0 ports 2, 3, 4, 5, and 6
set_property PACKAGE_PIN A12 [get_ports {red[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[4]}]
set_property PACKAGE_PIN A13 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
set_property PACKAGE_PIN B12 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property PACKAGE_PIN C12 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property PACKAGE_PIN C13 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]

## Green uses PMOD0 port 7, and also PMOD1 ports 0, 1, 2, and 3
set_property PACKAGE_PIN C14 [get_ports {green[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[4]}]
set_property PACKAGE_PIN D13 [get_ports {green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
set_property PACKAGE_PIN D14 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property PACKAGE_PIN E12 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property PACKAGE_PIN E13 [get_ports {green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]

## Blue uses PMOD1 ports 4, 5, 6, and 7
set_property PACKAGE_PIN F13 [get_ports {blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
set_property PACKAGE_PIN F14 [get_ports {blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property PACKAGE_PIN J14 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property PACKAGE_PIN J15 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_txd]
set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_rxd]





current_instance design_1_i/MemorySystem/ddr4_0/inst
set_property LOC MMCM_X0Y3 [get_cells -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst}]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]

current_instance -quiet
set_output_delay -clock [get_clocks design_1_i/ScanoutSystem/scanout_clk_25_175_x8/inst/clk_in1] 1.000 [get_ports {{blue[0]} {blue[1]} {blue[2]} {blue[3]} {green[0]} {green[1]} {green[2]} {green[3]} {green[4]} hsync {red[0]} {red[1]} {red[2]} {red[3]} {red[4]} vsync}]
set_false_path -from [get_clocks clk_out1_design_1_clk_wiz_0_0] -to [get_clocks mmcm_clkout0]



current_instance design_1_i/MemorySystem/ddr4_0/inst
set_property LOC MMCM_X0Y3 [get_cells -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst}]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins -hier -filter {NAME =~ */u_ddr4_infrastructure/gen_mmcme*.u_mmcme_adv_inst/CLKIN1}]
current_instance -quiet
set_property INTERNAL_VREF 0.84 [get_iobanks 67]

create_pblock pblock_ScanoutSystem

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
