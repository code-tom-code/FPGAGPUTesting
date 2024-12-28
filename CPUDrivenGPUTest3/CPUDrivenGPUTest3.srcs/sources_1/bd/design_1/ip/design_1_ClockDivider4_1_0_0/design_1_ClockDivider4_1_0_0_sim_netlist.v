// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:54:14 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClockDivider4_1_0_0/design_1_ClockDivider4_1_0_0_sim_netlist.v
// Design      : design_1_ClockDivider4_1_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ClockDivider4_1_0_0,ClockDivider4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "ClockDivider4_1,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_ClockDivider4_1_0_0
   (clkin100,
    clkout25);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin100 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin100, FREQ_HZ 10000000, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_1_clk_out1" *) input clkin100;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkout25 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clkout25, FREQ_HZ 2500000, PHASE 0.000, CLK_DOMAIN design_1_ClockDivider4_1_0_0_clkout25" *) output clkout25;

  wire clkin100;
  wire clkout25;

  design_1_ClockDivider4_1_0_0_ClockDivider4_1 U0
       (.clkin100(clkin100),
        .clkout25(clkout25));
endmodule

(* ORIG_REF_NAME = "ClockDivider4_1" *) 
module design_1_ClockDivider4_1_0_0_ClockDivider4_1
   (clkout25,
    clkin100);
  output clkout25;
  input clkin100;

  wire clkin100;
  wire clkout25;
  wire \currentClk_reg[3]_srl3_n_0 ;

  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkout25 CLK" *) 
  (* x_interface_parameter = "FREQ_HZ 2500000" *) 
  FDRE #(
    .INIT(1'b1)) 
    \currentClk_reg[0] 
       (.C(clkin100),
        .CE(1'b1),
        .D(\currentClk_reg[3]_srl3_n_0 ),
        .Q(clkout25),
        .R(1'b0));
  (* srl_bus_name = "\U0/currentClk_reg " *) 
  (* srl_name = "\U0/currentClk_reg[3]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0001)) 
    \currentClk_reg[3]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clkin100),
        .D(clkout25),
        .Q(\currentClk_reg[3]_srl3_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
