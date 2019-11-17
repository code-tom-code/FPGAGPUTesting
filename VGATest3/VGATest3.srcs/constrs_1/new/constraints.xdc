#PMOD
#PMOD0
set_property  PACKAGE_PIN    A14               [get_ports "vsync"] ;
set_property  IOSTANDARD     LVCMOS33          [get_ports "vsync"] ;
set_property  PACKAGE_PIN    B14               [get_ports "hsync"] ;
set_property  IOSTANDARD     LVCMOS33          [get_ports "hsync"] ;
set_property  PACKAGE_PIN    A12               [get_ports "port_r"] ;
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r"] ;
set_property  PACKAGE_PIN    A13               [get_ports "port_g"] ;
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g"] ;
set_property  PACKAGE_PIN    B12               [get_ports "port_b"] ;
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_b"] ;
set_property BOARD_PIN {sysclk1_300_p} [get_ports clk_in1_p]
set_property BOARD_PIN {sysclk1_300_n} [get_ports clk_in1_n]