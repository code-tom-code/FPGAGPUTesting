// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:04 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ConstantBuffer_0_0/MainDesign_ConstantBuffer_0_0_sim_netlist.v
// Design      : MainDesign_ConstantBuffer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "ConstantBuffer,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_ConstantBuffer_0_0
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ConstBufferBRAM, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input enable;
  input writeMode;
  input [7:0]regIndex;
  input [1:0]regComponent;
  output [31:0]readOutData;
  input [31:0]writeInData;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR" *) (* x_interface_mode = "master ConstBufferBRAM" *) (* x_interface_parameter = "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [9:0]ConstBufferBRAM_addra;
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
