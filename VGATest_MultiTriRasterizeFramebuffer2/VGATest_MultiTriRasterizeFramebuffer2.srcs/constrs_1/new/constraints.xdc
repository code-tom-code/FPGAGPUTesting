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
set_property  PACKAGE_PIN    A14               [get_ports "vsync"] ; ## PMOD0 port 0
set_property  IOSTANDARD     LVCMOS33          [get_ports "vsync"] ;

## HSync uses PMOD0 port 1
set_property  PACKAGE_PIN    B14               [get_ports "hsync"] ; ## PMOD0 port 1
set_property  IOSTANDARD     LVCMOS33          [get_ports "hsync"] ;

## Red uses PMOD0 ports 2, 3, 4, 5, and 6
set_property  PACKAGE_PIN    A12               [get_ports "port_r[4]"] ; ## PMOD0 port 2
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r[4]"] ;
set_property  PACKAGE_PIN    A13               [get_ports "port_r[3]"] ; ## PMOD0 port 3
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r[3]"] ;
set_property  PACKAGE_PIN    B12               [get_ports "port_r[2]"] ; ## PMOD0 port 4
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r[2]"] ;
set_property  PACKAGE_PIN    C12               [get_ports "port_r[1]"] ; ## PMOD0 port 5
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r[1]"] ;
set_property  PACKAGE_PIN    C13               [get_ports "port_r[0]"] ; ## PMOD0 port 6
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_r[0]"] ;

## Green uses PMOD0 port 7, and also PMOD1 ports 0, 1, 2, and 3
set_property  PACKAGE_PIN    C14               [get_ports "port_g[4]"] ; ## PMOD0 port 7
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g[4]"] ;
set_property  PACKAGE_PIN    D13               [get_ports "port_g[3]"] ; ## PMOD1 port 0
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g[3]"] ;
set_property  PACKAGE_PIN    D14               [get_ports "port_g[2]"] ; ## PMOD1 port 1
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g[2]"] ;
set_property  PACKAGE_PIN    E12               [get_ports "port_g[1]"] ; ## PMOD1 port 2
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g[1]"] ;
set_property  PACKAGE_PIN    E13               [get_ports "port_g[0]"] ; ## PMOD1 port 3
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_g[0]"] ;

## Blue uses PMOD1 ports 4, 5, 6, and 7
set_property  PACKAGE_PIN    F13               [get_ports "port_b[3]"] ; ## PMOD1 port 4
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_b[3]"] ;
set_property  PACKAGE_PIN    F14               [get_ports "port_b[2]"] ; ## PMOD1 port 5
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_b[2]"] ;
set_property  PACKAGE_PIN    J14               [get_ports "port_b[1]"] ; ## PMOD1 port 6
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_b[1]"] ;
set_property  PACKAGE_PIN    J15               [get_ports "port_b[0]"] ; ## PMOD1 port 7
set_property  IOSTANDARD     LVCMOS33          [get_ports "port_b[0]"] ;
