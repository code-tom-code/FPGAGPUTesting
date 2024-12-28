// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:52:32 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_CDC_EthernetControll_1_0/design_1_CDC_EthernetControll_1_0_sim_netlist.v
// Design      : design_1_CDC_EthernetControll_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_CDC_EthernetControll_1_0,CDC_EthernetController_NetPktProcessor,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "CDC_EthernetController_NetPktProcessor,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_CDC_EthernetControll_1_0
   (Out_clk333,
    Out_Signal,
    In_clk125,
    In_Signal);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 Out_clk_333 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME Out_clk_333, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input Out_clk333;
  output Out_Signal;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 In_clk_125 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME In_clk_125, FREQ_HZ 125000000, PHASE 0, CLK_DOMAIN design_1_gig_ethernet_pcs_pma_0_0_clk125_out" *) input In_clk125;
  input In_Signal;

  wire In_Signal;
  wire In_clk125;
  wire Out_Signal;
  wire Out_clk333;

  design_1_CDC_EthernetControll_1_0_CDC_EthernetController_NetPktProcessor U0
       (.In_Signal(In_Signal),
        .In_clk125(In_clk125),
        .Out_Signal(Out_Signal),
        .Out_clk333(Out_clk333));
endmodule

(* ORIG_REF_NAME = "CDC_EthernetController_NetPktProcessor" *) 
module design_1_CDC_EthernetControll_1_0_CDC_EthernetController_NetPktProcessor
   (Out_Signal,
    In_clk125,
    In_Signal,
    Out_clk333);
  output Out_Signal;
  input In_clk125;
  input In_Signal;
  input Out_clk333;

  wire In_Signal;
  wire In_clk125;
  wire Out_Signal;
  wire Out_clk333;
  wire Signal_Pipeline2_reg_srl2_n_0;
  wire dest_out;

  FDRE #(
    .INIT(1'b0)) 
    Out_Signal_reg
       (.C(Out_clk333),
        .CE(1'b1),
        .D(Signal_Pipeline2_reg_srl2_n_0),
        .Q(Out_Signal),
        .R(1'b0));
  (* srl_name = "\U0/Signal_Pipeline2_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    Signal_Pipeline2_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(Out_clk333),
        .D(dest_out),
        .Q(Signal_Pipeline2_reg_srl2_n_0));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_CDC_EthernetControll_1_0_xpm_cdc_single cdcVSyncLogic
       (.dest_clk(Out_clk333),
        .dest_out(dest_out),
        .src_clk(In_clk125),
        .src_in(In_Signal));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* xpm_cdc = "SINGLE" *) 
module design_1_CDC_EthernetControll_1_0_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_clk;
  wire src_ff;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  FDRE src_ff_reg
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(src_ff),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_ff),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
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
