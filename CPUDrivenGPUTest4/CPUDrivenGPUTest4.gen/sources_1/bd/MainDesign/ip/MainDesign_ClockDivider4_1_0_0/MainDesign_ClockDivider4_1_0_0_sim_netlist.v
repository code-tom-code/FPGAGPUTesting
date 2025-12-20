// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:11 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider4_1_0_0/MainDesign_ClockDivider4_1_0_0_sim_netlist.v
// Design      : MainDesign_ClockDivider4_1_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_ClockDivider4_1_0_0,ClockDivider4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "ClockDivider4_1,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_ClockDivider4_1_0_0
   (clkin100,
    clkout25);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin100 CLK" *) (* x_interface_mode = "slave clkin100" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin100, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_1_clk_out10_0, INSERT_VIP 0" *) input clkin100;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkout25 CLK" *) (* x_interface_mode = "master clkout25" *) (* x_interface_parameter = "XIL_INTERFACENAME clkout25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) output clkout25;

  wire clkin100;
  wire clkout25;

  MainDesign_ClockDivider4_1_0_0_ClockDivider4_1 U0
       (.clkin100(clkin100),
        .clkout25(clkout25));
endmodule

(* ORIG_REF_NAME = "ClockDivider4_1" *) 
module MainDesign_ClockDivider4_1_0_0_ClockDivider4_1
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
  (* srl_bus_name = "\\U0/currentClk_reg " *) 
  (* srl_name = "\\U0/currentClk_reg[3]_srl3 " *) 
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
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
