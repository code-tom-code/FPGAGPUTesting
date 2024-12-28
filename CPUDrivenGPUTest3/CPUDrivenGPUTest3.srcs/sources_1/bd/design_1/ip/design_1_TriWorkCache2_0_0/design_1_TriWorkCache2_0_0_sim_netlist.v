// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 01:02:55 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TriWorkCache2_0_0/design_1_TriWorkCache2_0_0_sim_netlist.v
// Design      : design_1_TriWorkCache2_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_TriWorkCache2_0_0,TriWorkCache2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "TriWorkCache2,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_TriWorkCache2_0_0
   (clk,
    DINTERP_outBarycentricInverse,
    DINTERP_outZ0,
    DINTERP_outZ10,
    DINTERP_outZ20,
    DINTERP_outInvW0,
    DINTERP_outInvW10,
    DINTERP_outInvW20,
    DINTERP_PopTriangleSlot,
    INTERP_outT0X,
    INTERP_outT0Y,
    INTERP_outT10X,
    INTERP_outT10Y,
    INTERP_outT20X,
    INTERP_outT20Y,
    INTERP_outColorRGBA0,
    INTERP_outColorRGBA10,
    INTERP_outColorRGBA20,
    INTERP_PopTriangleSlot,
    RAST_inBarycentricInverse,
    RAST_inZ0,
    RAST_inZ10,
    RAST_inZ20,
    RAST_inInvW0,
    RAST_inInvW10,
    RAST_inInvW20,
    RAST_inT0X,
    RAST_inT0Y,
    RAST_inT10X,
    RAST_inT10Y,
    RAST_inT20X,
    RAST_inT20Y,
    RAST_inColorRGBA0,
    RAST_inColorRGBA10,
    RAST_inColorRGBA20,
    RAST_PushNewTriData,
    RAST_IsFull,
    DINTERP_TRIDATA_FIFO_empty,
    DINTERP_TRIDATA_FIFO_rd_data,
    DINTERP_TRIDATA_FIFO_rd_en,
    DINTERP_TRIDATA_FIFO_full,
    DINTERP_TRIDATA_FIFO_wr_data,
    DINTERP_TRIDATA_FIFO_wr_en,
    INTERP_TRIDATA_FIFO_empty,
    INTERP_TRIDATA_FIFO_rd_data,
    INTERP_TRIDATA_FIFO_rd_en,
    INTERP_TRIDATA_FIFO_full,
    INTERP_TRIDATA_FIFO_wr_data,
    INTERP_TRIDATA_FIFO_wr_en);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  output [31:0]DINTERP_outBarycentricInverse;
  output [31:0]DINTERP_outZ0;
  output [31:0]DINTERP_outZ10;
  output [31:0]DINTERP_outZ20;
  output [31:0]DINTERP_outInvW0;
  output [31:0]DINTERP_outInvW10;
  output [31:0]DINTERP_outInvW20;
  input DINTERP_PopTriangleSlot;
  output [31:0]INTERP_outT0X;
  output [31:0]INTERP_outT0Y;
  output [31:0]INTERP_outT10X;
  output [31:0]INTERP_outT10Y;
  output [31:0]INTERP_outT20X;
  output [31:0]INTERP_outT20Y;
  output [127:0]INTERP_outColorRGBA0;
  output [127:0]INTERP_outColorRGBA10;
  output [127:0]INTERP_outColorRGBA20;
  input INTERP_PopTriangleSlot;
  input [31:0]RAST_inBarycentricInverse;
  input [31:0]RAST_inZ0;
  input [31:0]RAST_inZ10;
  input [31:0]RAST_inZ20;
  input [31:0]RAST_inInvW0;
  input [31:0]RAST_inInvW10;
  input [31:0]RAST_inInvW20;
  input [31:0]RAST_inT0X;
  input [31:0]RAST_inT0Y;
  input [31:0]RAST_inT10X;
  input [31:0]RAST_inT10Y;
  input [31:0]RAST_inT20X;
  input [31:0]RAST_inT20Y;
  input [127:0]RAST_inColorRGBA0;
  input [127:0]RAST_inColorRGBA10;
  input [127:0]RAST_inColorRGBA20;
  input RAST_PushNewTriData;
  output RAST_IsFull;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY" *) input DINTERP_TRIDATA_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA" *) input [223:0]DINTERP_TRIDATA_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN" *) output DINTERP_TRIDATA_FIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL" *) input DINTERP_TRIDATA_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA" *) output [223:0]DINTERP_TRIDATA_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN" *) output DINTERP_TRIDATA_FIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY" *) input INTERP_TRIDATA_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA" *) input [575:0]INTERP_TRIDATA_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN" *) output INTERP_TRIDATA_FIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL" *) input INTERP_TRIDATA_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA" *) output [575:0]INTERP_TRIDATA_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN" *) output INTERP_TRIDATA_FIFO_wr_en;

  wire DINTERP_PopTriangleSlot;
  wire DINTERP_TRIDATA_FIFO_full;
  wire [223:0]DINTERP_TRIDATA_FIFO_rd_data;
  wire INTERP_PopTriangleSlot;
  wire INTERP_TRIDATA_FIFO_full;
  wire [575:0]INTERP_TRIDATA_FIFO_rd_data;
  wire RAST_IsFull;
  wire RAST_PushNewTriData;
  wire [31:0]RAST_inBarycentricInverse;
  wire [127:0]RAST_inColorRGBA0;
  wire [127:0]RAST_inColorRGBA10;
  wire [127:0]RAST_inColorRGBA20;
  wire [31:0]RAST_inInvW0;
  wire [31:0]RAST_inInvW10;
  wire [31:0]RAST_inInvW20;
  wire [31:0]RAST_inT0X;
  wire [31:0]RAST_inT0Y;
  wire [31:0]RAST_inT10X;
  wire [31:0]RAST_inT10Y;
  wire [31:0]RAST_inT20X;
  wire [31:0]RAST_inT20Y;
  wire [31:0]RAST_inZ0;
  wire [31:0]RAST_inZ10;
  wire [31:0]RAST_inZ20;

  assign DINTERP_TRIDATA_FIFO_rd_en = DINTERP_PopTriangleSlot;
  assign DINTERP_TRIDATA_FIFO_wr_data[223:192] = RAST_inInvW20;
  assign DINTERP_TRIDATA_FIFO_wr_data[191:160] = RAST_inInvW10;
  assign DINTERP_TRIDATA_FIFO_wr_data[159:128] = RAST_inInvW0;
  assign DINTERP_TRIDATA_FIFO_wr_data[127:96] = RAST_inZ20;
  assign DINTERP_TRIDATA_FIFO_wr_data[95:64] = RAST_inZ10;
  assign DINTERP_TRIDATA_FIFO_wr_data[63:32] = RAST_inZ0;
  assign DINTERP_TRIDATA_FIFO_wr_data[31:0] = RAST_inBarycentricInverse;
  assign DINTERP_TRIDATA_FIFO_wr_en = RAST_PushNewTriData;
  assign DINTERP_outBarycentricInverse[31:0] = DINTERP_TRIDATA_FIFO_rd_data[31:0];
  assign DINTERP_outInvW0[31:0] = DINTERP_TRIDATA_FIFO_rd_data[159:128];
  assign DINTERP_outInvW10[31:0] = DINTERP_TRIDATA_FIFO_rd_data[191:160];
  assign DINTERP_outInvW20[31:0] = DINTERP_TRIDATA_FIFO_rd_data[223:192];
  assign DINTERP_outZ0[31:0] = DINTERP_TRIDATA_FIFO_rd_data[63:32];
  assign DINTERP_outZ10[31:0] = DINTERP_TRIDATA_FIFO_rd_data[95:64];
  assign DINTERP_outZ20[31:0] = DINTERP_TRIDATA_FIFO_rd_data[127:96];
  assign INTERP_TRIDATA_FIFO_rd_en = INTERP_PopTriangleSlot;
  assign INTERP_TRIDATA_FIFO_wr_data[575:448] = RAST_inColorRGBA20;
  assign INTERP_TRIDATA_FIFO_wr_data[447:320] = RAST_inColorRGBA10;
  assign INTERP_TRIDATA_FIFO_wr_data[319:192] = RAST_inColorRGBA0;
  assign INTERP_TRIDATA_FIFO_wr_data[191:160] = RAST_inT20Y;
  assign INTERP_TRIDATA_FIFO_wr_data[159:128] = RAST_inT10Y;
  assign INTERP_TRIDATA_FIFO_wr_data[127:96] = RAST_inT0Y;
  assign INTERP_TRIDATA_FIFO_wr_data[95:64] = RAST_inT20X;
  assign INTERP_TRIDATA_FIFO_wr_data[63:32] = RAST_inT10X;
  assign INTERP_TRIDATA_FIFO_wr_data[31:0] = RAST_inT0X;
  assign INTERP_TRIDATA_FIFO_wr_en = RAST_PushNewTriData;
  assign INTERP_outColorRGBA0[127:0] = INTERP_TRIDATA_FIFO_rd_data[319:192];
  assign INTERP_outColorRGBA10[127:0] = INTERP_TRIDATA_FIFO_rd_data[447:320];
  assign INTERP_outColorRGBA20[127:0] = INTERP_TRIDATA_FIFO_rd_data[575:448];
  assign INTERP_outT0X[31:0] = INTERP_TRIDATA_FIFO_rd_data[31:0];
  assign INTERP_outT0Y[31:0] = INTERP_TRIDATA_FIFO_rd_data[127:96];
  assign INTERP_outT10X[31:0] = INTERP_TRIDATA_FIFO_rd_data[63:32];
  assign INTERP_outT10Y[31:0] = INTERP_TRIDATA_FIFO_rd_data[159:128];
  assign INTERP_outT20X[31:0] = INTERP_TRIDATA_FIFO_rd_data[95:64];
  assign INTERP_outT20Y[31:0] = INTERP_TRIDATA_FIFO_rd_data[191:160];
  LUT2 #(
    .INIT(4'hE)) 
    RAST_IsFull_INST_0
       (.I0(DINTERP_TRIDATA_FIFO_full),
        .I1(INTERP_TRIDATA_FIFO_full),
        .O(RAST_IsFull));
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
