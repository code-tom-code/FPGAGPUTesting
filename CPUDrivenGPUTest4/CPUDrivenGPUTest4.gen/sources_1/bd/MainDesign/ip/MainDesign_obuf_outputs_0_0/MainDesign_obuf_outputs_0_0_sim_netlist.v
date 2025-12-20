// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:00 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_obuf_outputs_0_0/MainDesign_obuf_outputs_0_0_sim_netlist.v
// Design      : MainDesign_obuf_outputs_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_obuf_outputs_0_0,obuf_outputs,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "obuf_outputs,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_obuf_outputs_0_0
   (red_s,
    green_s,
    blue_s,
    cl_s,
    out_red_p,
    out_red_n,
    out_green_p,
    out_green_n,
    out_blue_p,
    out_blue_n,
    out_cl_p,
    out_cl_n);
  input red_s;
  input green_s;
  input blue_s;
  input cl_s;
  output out_red_p;
  output out_red_n;
  output out_green_p;
  output out_green_n;
  output out_blue_p;
  output out_blue_n;
  output out_cl_p;
  output out_cl_n;

  (* SLEW = "SLOW" *) wire blue_s;
  (* SLEW = "SLOW" *) wire cl_s;
  (* SLEW = "SLOW" *) wire green_s;
  (* SLEW = "SLOW" *) wire out_blue_n;
  (* SLEW = "SLOW" *) wire out_blue_p;
  (* SLEW = "SLOW" *) wire out_cl_n;
  (* SLEW = "SLOW" *) wire out_cl_p;
  (* SLEW = "SLOW" *) wire out_green_n;
  (* SLEW = "SLOW" *) wire out_green_p;
  (* SLEW = "SLOW" *) wire out_red_n;
  (* SLEW = "SLOW" *) wire out_red_p;
  (* SLEW = "SLOW" *) wire red_s;

  MainDesign_obuf_outputs_0_0_obuf_outputs U0
       (.blue_s(blue_s),
        .cl_s(cl_s),
        .green_s(green_s),
        .out_blue_n(out_blue_n),
        .out_blue_p(out_blue_p),
        .out_cl_n(out_cl_n),
        .out_cl_p(out_cl_p),
        .out_green_n(out_green_n),
        .out_green_p(out_green_p),
        .out_red_n(out_red_n),
        .out_red_p(out_red_p),
        .red_s(red_s));
endmodule

(* ORIG_REF_NAME = "obuf_outputs" *) 
module MainDesign_obuf_outputs_0_0_obuf_outputs
   (out_red_p,
    out_red_n,
    out_green_p,
    out_green_n,
    out_blue_p,
    out_blue_n,
    out_cl_p,
    out_cl_n,
    red_s,
    green_s,
    blue_s,
    cl_s);
  output out_red_p;
  output out_red_n;
  output out_green_p;
  output out_green_n;
  output out_blue_p;
  output out_blue_n;
  output out_cl_p;
  output out_cl_n;
  input red_s;
  input green_s;
  input blue_s;
  input cl_s;

  wire blue_s;
  wire cl_s;
  wire green_s;
  wire out_blue_n;
  wire out_blue_p;
  wire out_cl_n;
  wire out_cl_p;
  wire out_green_n;
  wire out_green_p;
  wire out_red_n;
  wire out_red_p;
  wire red_s;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_blue
       (.I(blue_s),
        .O(out_blue_p),
        .OB(out_blue_n));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_cl
       (.I(cl_s),
        .O(out_cl_p),
        .OB(out_cl_n));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_green
       (.I(green_s),
        .O(out_green_p),
        .OB(out_green_n));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_red
       (.I(red_s),
        .O(out_red_p),
        .OB(out_red_n));
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
