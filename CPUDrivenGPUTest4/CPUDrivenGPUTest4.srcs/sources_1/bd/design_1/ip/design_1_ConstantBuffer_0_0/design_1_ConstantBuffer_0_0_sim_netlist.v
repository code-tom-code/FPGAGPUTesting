// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:36:02 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ConstantBuffer_0_0/design_1_ConstantBuffer_0_0_sim_netlist.v
// Design      : design_1_ConstantBuffer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ConstantBuffer_0_0,ConstantBuffer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "ConstantBuffer,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_ConstantBuffer_0_0
   (clk,
    enable,
    writeMode,
    regIndex,
    regComponent,
    readOutData,
    writeInData,
    ConstBufferBRAM_addra,
    ConstBufferBRAM_clka,
    ConstBufferBRAM_dina,
    ConstBufferBRAM_douta,
    ConstBufferBRAM_ena,
    ConstBufferBRAM_wea);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  input enable;
  input writeMode;
  input [7:0]regIndex;
  input [1:0]regComponent;
  output [31:0]readOutData;
  input [31:0]writeInData;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output [9:0]ConstBufferBRAM_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK" *) output ConstBufferBRAM_clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN" *) output [31:0]ConstBufferBRAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT" *) input [31:0]ConstBufferBRAM_douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN" *) output ConstBufferBRAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE" *) output [0:0]ConstBufferBRAM_wea;

  wire [31:0]ConstBufferBRAM_douta;
  wire clk;
  wire enable;
  wire [1:0]regComponent;
  wire [7:0]regIndex;
  wire [31:0]writeInData;
  wire writeMode;

  assign ConstBufferBRAM_addra[9:2] = regIndex;
  assign ConstBufferBRAM_addra[1:0] = regComponent;
  assign ConstBufferBRAM_clka = clk;
  assign ConstBufferBRAM_dina[31:0] = writeInData;
  assign ConstBufferBRAM_ena = enable;
  assign ConstBufferBRAM_wea[0] = writeMode;
  assign readOutData[31:0] = ConstBufferBRAM_douta;
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
