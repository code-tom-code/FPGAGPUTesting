// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:19:13 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_1/design_1_blk_mem_gen_0_1_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_1,blk_mem_gen_v8_4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_1
   (clka,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  input regcea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire regcea;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "14" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.442974 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "1" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16384" *) 
  (* C_READ_DEPTH_B = "16384" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "1" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16384" *) 
  (* C_WRITE_DEPTH_B = "16384" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  design_1_blk_mem_gen_0_1_blk_mem_gen_v8_4_1 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
        .regcea(regcea),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

(* ADDR_WIDTH_A = "14" *) (* ADDR_WIDTH_B = "14" *) (* AUTO_SLEEP_TIME = "0" *) 
(* BYTE_WRITE_WIDTH_A = "32" *) (* BYTE_WRITE_WIDTH_B = "32" *) (* CLOCKING_MODE = "0" *) 
(* ECC_MODE = "0" *) (* MAX_NUM_CHAR = "0" *) (* MEMORY_INIT_FILE = "none" *) 
(* MEMORY_INIT_PARAM = "" *) (* MEMORY_OPTIMIZATION = "true" *) (* MEMORY_PRIMITIVE = "3" *) 
(* MEMORY_SIZE = "524288" *) (* MEMORY_TYPE = "0" *) (* MESSAGE_CONTROL = "0" *) 
(* NUM_CHAR_LOC = "0" *) (* ORIG_REF_NAME = "xpm_memory_base" *) (* P_ECC_MODE = "no_ecc" *) 
(* P_ENABLE_BYTE_WRITE_A = "0" *) (* P_ENABLE_BYTE_WRITE_B = "0" *) (* P_MAX_DEPTH_DATA = "16384" *) 
(* P_MEMORY_OPT = "yes" *) (* P_MEMORY_PRIMITIVE = "ultra" *) (* P_MIN_WIDTH_DATA = "32" *) 
(* P_MIN_WIDTH_DATA_A = "32" *) (* P_MIN_WIDTH_DATA_B = "32" *) (* P_MIN_WIDTH_DATA_ECC = "32" *) 
(* P_MIN_WIDTH_DATA_LDW = "4" *) (* P_MIN_WIDTH_DATA_SHFT = "32" *) (* P_NUM_COLS_WRITE_A = "1" *) 
(* P_NUM_COLS_WRITE_B = "1" *) (* P_NUM_ROWS_READ_A = "1" *) (* P_NUM_ROWS_READ_B = "1" *) 
(* P_NUM_ROWS_WRITE_A = "1" *) (* P_NUM_ROWS_WRITE_B = "1" *) (* P_SDP_WRITE_MODE = "yes" *) 
(* P_WIDTH_ADDR_LSB_READ_A = "0" *) (* P_WIDTH_ADDR_LSB_READ_B = "0" *) (* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) 
(* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) (* P_WIDTH_ADDR_READ_A = "14" *) (* P_WIDTH_ADDR_READ_B = "14" *) 
(* P_WIDTH_ADDR_WRITE_A = "14" *) (* P_WIDTH_ADDR_WRITE_B = "14" *) (* P_WIDTH_COL_WRITE_A = "32" *) 
(* P_WIDTH_COL_WRITE_B = "32" *) (* READ_DATA_WIDTH_A = "32" *) (* READ_DATA_WIDTH_B = "32" *) 
(* READ_LATENCY_A = "2" *) (* READ_LATENCY_B = "2" *) (* READ_RESET_VALUE_A = "0" *) 
(* READ_RESET_VALUE_B = "0" *) (* USE_EMBEDDED_CONSTRAINT = "0" *) (* USE_MEM_INIT = "1" *) 
(* VERSION = "0" *) (* WAKEUP_TIME = "0" *) (* WRITE_DATA_WIDTH_A = "32" *) 
(* WRITE_DATA_WIDTH_B = "32" *) (* WRITE_MODE_A = "2" *) (* WRITE_MODE_B = "2" *) 
(* XPM_MODULE = "TRUE" *) 
module design_1_blk_mem_gen_0_1_xpm_memory_base
   (sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    injectsbiterra,
    injectdbiterra,
    douta,
    sbiterra,
    dbiterra,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    injectsbiterrb,
    injectdbiterrb,
    doutb,
    sbiterrb,
    dbiterrb);
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [31:0]dina;
  input injectsbiterra;
  input injectdbiterra;
  output [31:0]douta;
  output sbiterra;
  output dbiterra;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [13:0]addrb;
  input [31:0]dinb;
  input injectsbiterrb;
  input injectdbiterrb;
  output [31:0]doutb;
  output sbiterrb;
  output dbiterrb;

  wire \<const0> ;
  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [31:0]\gen_rd_a.douta_reg ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_100 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_101 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_102 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_103 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_104 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_105 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_106 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_107 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_108 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_109 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_110 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_111 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_112 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_113 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_114 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_115 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_116 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_117 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_118 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_119 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_120 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_121 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_122 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_123 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_124 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_125 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_126 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_127 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_128 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_129 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_130 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_131 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_132 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_133 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_134 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_135 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_140 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_141 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_142 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_143 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_144 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_145 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_146 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_147 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_148 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_149 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_150 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_151 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_152 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_153 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_154 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_155 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_156 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_157 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_158 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_159 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_16 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_160 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_161 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_162 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_163 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_164 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_165 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_166 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_167 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_168 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_169 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_17 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_170 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_171 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_172 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_173 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_174 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_175 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_176 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_177 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_178 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_179 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_18 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_180 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_181 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_182 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_183 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_184 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_185 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_186 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_187 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_188 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_189 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_19 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_190 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_191 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_192 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_193 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_194 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_195 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_196 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_197 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_198 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_199 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_2 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_20 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_200 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_201 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_202 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_203 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_204 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_205 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_206 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_207 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_208 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_209 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_21 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_210 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_211 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_212 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_213 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_214 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_215 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_216 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_217 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_218 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_219 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_22 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_220 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_221 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_222 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_223 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_224 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_225 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_226 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_227 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_228 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_229 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_23 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_230 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_231 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_232 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_233 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_234 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_235 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_236 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_237 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_238 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_239 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_24 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_240 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_241 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_242 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_243 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_244 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_245 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_246 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_247 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_248 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_249 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_25 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_250 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_251 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_252 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_253 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_254 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_255 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_256 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_257 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_258 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_259 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_26 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_260 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_261 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_262 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_263 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_264 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_265 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_266 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_267 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_268 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_269 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_27 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_270 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_271 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_272 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_273 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_274 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_275 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_276 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_277 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_278 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_279 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_28 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_280 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_281 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_282 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_283 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_284 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_285 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_286 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_287 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_288 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_289 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_29 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_290 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_291 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_292 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_293 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_294 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_295 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_296 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_297 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_298 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_299 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_3 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_30 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_300 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_301 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_302 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_303 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_304 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_305 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_306 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_307 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_308 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_309 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_31 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_310 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_311 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_312 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_313 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_314 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_315 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_316 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_317 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_318 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_319 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_32 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_320 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_321 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_322 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_323 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_324 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_325 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_326 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_327 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_328 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_329 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_33 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_330 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_331 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_332 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_333 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_334 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_335 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_336 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_337 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_338 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_339 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_34 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_340 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_341 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_342 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_343 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_344 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_345 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_346 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_347 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_348 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_349 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_35 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_4 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_494 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_495 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_496 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_497 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_498 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_499 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_5 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_500 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_501 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_502 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_503 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_504 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_505 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_506 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_507 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_508 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_509 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_510 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_511 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_6 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_68 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_69 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_7 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_70 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_71 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_72 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_73 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_74 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_75 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_76 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_77 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_78 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_79 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_8 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_80 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_81 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_82 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_83 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_84 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_85 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_86 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_87 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_88 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_89 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_9 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_90 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_91 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_92 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_93 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_94 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_95 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_96 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_97 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_98 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_99 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_100 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_101 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_102 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_103 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_104 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_105 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_106 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_107 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_108 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_109 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_110 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_111 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_112 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_113 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_114 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_115 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_116 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_117 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_118 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_119 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_120 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_121 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_122 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_123 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_124 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_125 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_126 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_127 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_128 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_129 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_130 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_131 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_132 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_133 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_134 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_135 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_140 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_141 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_142 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_143 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_144 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_145 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_146 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_147 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_148 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_149 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_150 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_151 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_152 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_153 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_154 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_155 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_156 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_157 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_158 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_159 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_16 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_160 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_161 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_162 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_163 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_164 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_165 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_166 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_167 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_168 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_169 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_17 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_170 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_171 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_172 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_173 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_174 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_175 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_176 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_177 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_178 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_179 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_18 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_180 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_181 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_182 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_183 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_184 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_185 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_186 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_187 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_188 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_189 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_19 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_190 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_191 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_192 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_193 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_194 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_195 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_196 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_197 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_198 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_199 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_2 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_20 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_200 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_201 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_202 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_203 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_204 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_205 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_206 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_207 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_208 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_209 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_21 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_210 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_211 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_212 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_213 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_214 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_215 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_216 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_217 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_218 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_219 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_22 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_220 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_221 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_222 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_223 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_224 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_225 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_226 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_227 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_228 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_229 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_23 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_230 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_231 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_232 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_233 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_234 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_235 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_236 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_237 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_238 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_239 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_24 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_240 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_241 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_242 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_243 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_244 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_245 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_246 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_247 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_248 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_249 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_25 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_250 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_251 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_252 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_253 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_254 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_255 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_256 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_257 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_258 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_259 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_26 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_260 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_261 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_262 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_263 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_264 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_265 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_266 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_267 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_268 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_269 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_27 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_270 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_271 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_272 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_273 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_274 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_275 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_276 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_277 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_278 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_279 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_28 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_280 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_281 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_282 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_283 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_284 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_285 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_286 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_287 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_288 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_289 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_29 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_290 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_291 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_292 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_293 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_294 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_295 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_296 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_297 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_298 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_299 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_3 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_30 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_300 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_301 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_302 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_303 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_304 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_305 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_306 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_307 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_308 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_309 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_31 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_310 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_311 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_312 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_313 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_314 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_315 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_316 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_317 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_318 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_319 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_32 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_320 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_321 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_322 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_323 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_324 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_325 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_326 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_327 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_328 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_329 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_33 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_330 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_331 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_332 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_333 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_334 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_335 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_336 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_337 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_338 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_339 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_34 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_340 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_341 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_342 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_343 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_344 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_345 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_346 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_347 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_348 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_349 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_35 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_4 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_494 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_495 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_496 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_497 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_498 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_499 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_5 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_500 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_501 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_502 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_503 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_504 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_505 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_506 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_507 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_508 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_509 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_510 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_511 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_6 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_68 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_69 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_7 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_70 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_71 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_72 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_73 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_74 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_75 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_76 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_77 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_78 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_79 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_8 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_80 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_81 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_82 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_83 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_84 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_85 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_86 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_87 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_88 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_89 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_9 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_90 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_91 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_92 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_93 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_94 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_95 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_96 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_97 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_98 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_99 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_100 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_101 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_102 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_103 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_104 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_105 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_106 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_107 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_108 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_109 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_110 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_111 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_112 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_113 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_114 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_115 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_116 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_117 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_118 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_119 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_120 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_121 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_122 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_123 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_124 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_125 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_126 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_127 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_128 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_129 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_130 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_131 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_132 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_133 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_134 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_135 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_140 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_141 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_142 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_143 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_144 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_145 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_146 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_147 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_148 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_149 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_150 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_151 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_152 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_153 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_154 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_155 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_156 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_157 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_158 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_159 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_16 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_160 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_161 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_162 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_163 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_164 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_165 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_166 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_167 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_168 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_169 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_17 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_170 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_171 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_172 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_173 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_174 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_175 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_176 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_177 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_178 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_179 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_18 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_180 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_181 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_182 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_183 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_184 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_185 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_186 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_187 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_188 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_189 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_19 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_190 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_191 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_192 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_193 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_194 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_195 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_196 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_197 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_198 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_199 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_2 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_20 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_200 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_201 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_202 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_203 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_204 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_205 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_206 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_207 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_208 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_209 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_21 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_210 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_211 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_212 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_213 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_214 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_215 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_216 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_217 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_218 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_219 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_22 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_220 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_221 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_222 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_223 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_224 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_225 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_226 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_227 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_228 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_229 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_23 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_230 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_231 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_232 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_233 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_234 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_235 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_236 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_237 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_238 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_239 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_24 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_240 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_241 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_242 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_243 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_244 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_245 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_246 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_247 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_248 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_249 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_25 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_250 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_251 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_252 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_253 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_254 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_255 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_256 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_257 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_258 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_259 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_26 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_260 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_261 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_262 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_263 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_264 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_265 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_266 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_267 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_268 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_269 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_27 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_270 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_271 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_272 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_273 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_274 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_275 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_276 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_277 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_278 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_279 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_28 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_280 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_281 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_282 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_283 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_284 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_285 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_286 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_287 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_288 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_289 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_29 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_290 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_291 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_292 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_293 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_294 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_295 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_296 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_297 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_298 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_299 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_3 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_30 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_300 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_301 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_302 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_303 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_304 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_305 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_306 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_307 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_308 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_309 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_31 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_310 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_311 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_312 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_313 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_314 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_315 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_316 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_317 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_318 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_319 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_32 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_320 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_321 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_322 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_323 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_324 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_325 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_326 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_327 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_328 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_329 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_33 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_330 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_331 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_332 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_333 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_334 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_335 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_336 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_337 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_338 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_339 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_34 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_340 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_341 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_342 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_343 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_344 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_345 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_346 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_347 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_348 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_349 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_35 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_4 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_494 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_495 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_496 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_497 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_498 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_499 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_5 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_500 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_501 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_502 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_503 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_504 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_505 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_506 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_507 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_508 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_509 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_510 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_511 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_6 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_68 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_69 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_7 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_70 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_71 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_72 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_73 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_74 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_75 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_76 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_77 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_78 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_79 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_8 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_80 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_81 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_82 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_83 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_84 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_85 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_86 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_87 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_88 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_89 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_9 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_90 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_91 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_92 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_93 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_94 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_95 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_96 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_97 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_98 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_99 ;
  wire regcea;
  wire rsta;
  wire sleep;
  wire [0:0]wea;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_ADDR_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DIN_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_ADDR_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DIN_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_B_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_A_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_ADDR_B_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_A_UNCONNECTED ;
  wire [22:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_B_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_A_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_B_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DIN_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DIN_B_UNCONNECTED ;
  wire [71:32]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_A_UNCONNECTED ;
  wire [71:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_B_UNCONNECTED ;

  assign dbiterra = \<const0> ;
  assign dbiterrb = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign sbiterra = \<const0> ;
  assign sbiterrb = \<const0> ;
  GND GND
       (.G(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][0] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [0]),
        .Q(douta[0]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][10] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [10]),
        .Q(douta[10]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][11] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [11]),
        .Q(douta[11]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][12] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [12]),
        .Q(douta[12]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][13] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [13]),
        .Q(douta[13]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][14] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [14]),
        .Q(douta[14]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][15] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [15]),
        .Q(douta[15]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][16] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [16]),
        .Q(douta[16]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][17] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [17]),
        .Q(douta[17]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][18] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [18]),
        .Q(douta[18]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][19] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [19]),
        .Q(douta[19]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][1] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [1]),
        .Q(douta[1]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][20] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [20]),
        .Q(douta[20]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][21] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [21]),
        .Q(douta[21]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][22] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [22]),
        .Q(douta[22]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][23] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [23]),
        .Q(douta[23]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][24] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [24]),
        .Q(douta[24]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][25] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [25]),
        .Q(douta[25]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][26] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [26]),
        .Q(douta[26]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][27] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [27]),
        .Q(douta[27]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][28] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [28]),
        .Q(douta[28]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][29] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [29]),
        .Q(douta[29]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][2] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [2]),
        .Q(douta[2]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][30] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [30]),
        .Q(douta[30]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][31] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [31]),
        .Q(douta[31]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][3] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [3]),
        .Q(douta[3]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][4] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [4]),
        .Q(douta[4]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][5] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [5]),
        .Q(douta[5]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][6] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [6]),
        .Q(douta[6]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][7] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [7]),
        .Q(douta[7]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][8] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [8]),
        .Q(douta[8]),
        .R(rsta));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_a.gen_douta_pipe.douta_pipe_reg[0][9] 
       (.C(clka),
        .CE(regcea),
        .D(\gen_rd_a.douta_reg [9]),
        .Q(douta[9]),
        .R(rsta));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "gen_wr_a.gen_word_narrow.mem" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INTERLEAVED"),
    .BWE_MODE_B("PARITY_INTERLEAVED"),
    .CASCADE_ORDER_A("FIRST"),
    .CASCADE_ORDER_B("FIRST"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B4_M0"),
    .NUM_UNIQUE_SELF_ADDR_A(4),
    .NUM_UNIQUE_SELF_ADDR_B(4),
    .NUM_URAM_IN_MATRIX(4),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h000),
    .SELF_ADDR_B(11'h000),
    .SELF_MASK_A(11'h7FC),
    .SELF_MASK_B(11'h7FC),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_0 
       (.ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra}),
        .ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BWE_A({1'b1,wea,wea,wea,wea,wea,wea,wea,wea}),
        .BWE_B({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CAS_IN_ADDR_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_ADDR_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_BWE_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DBITERR_A(1'b0),
        .CAS_IN_DBITERR_B(1'b0),
        .CAS_IN_DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DIN_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_DOUT_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CAS_IN_EN_A(1'b0),
        .CAS_IN_EN_B(1'b0),
        .CAS_IN_RDACCESS_A(1'b0),
        .CAS_IN_RDACCESS_B(1'b0),
        .CAS_IN_RDB_WR_A(1'b0),
        .CAS_IN_RDB_WR_B(1'b0),
        .CAS_IN_SBITERR_A(1'b0),
        .CAS_IN_SBITERR_B(1'b0),
        .CAS_OUT_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_38 }),
        .CAS_OUT_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_61 }),
        .CAS_OUT_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_502 }),
        .CAS_OUT_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_511 }),
        .CAS_OUT_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_0 ),
        .CAS_OUT_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_1 ),
        .CAS_OUT_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_133 }),
        .CAS_OUT_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_205 }),
        .CAS_OUT_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_277 }),
        .CAS_OUT_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_349 }),
        .CAS_OUT_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_2 ),
        .CAS_OUT_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_3 ),
        .CAS_OUT_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_4 ),
        .CAS_OUT_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_5 ),
        .CAS_OUT_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_6 ),
        .CAS_OUT_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_7 ),
        .CAS_OUT_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_8 ),
        .CAS_OUT_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_9 ),
        .CLK(clka),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DBITERR_B_UNCONNECTED ),
        .DIN_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIN_B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_A_UNCONNECTED [71:0]),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(ena),
        .EN_B(1'b0),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(wea),
        .RDB_WR_B(1'b0),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_0_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "gen_wr_a.gen_word_narrow.mem" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INTERLEAVED"),
    .BWE_MODE_B("PARITY_INTERLEAVED"),
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B4_M0"),
    .NUM_UNIQUE_SELF_ADDR_A(4),
    .NUM_UNIQUE_SELF_ADDR_B(4),
    .NUM_URAM_IN_MATRIX(4),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h001),
    .SELF_ADDR_B(11'h001),
    .SELF_MASK_A(11'h7FC),
    .SELF_MASK_B(11'h7FC),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_1 
       (.ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_ADDR_A_UNCONNECTED [22:0]),
        .ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_ADDR_B_UNCONNECTED [22:0]),
        .BWE_A({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .BWE_B({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CAS_IN_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_38 }),
        .CAS_IN_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_61 }),
        .CAS_IN_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_502 }),
        .CAS_IN_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_511 }),
        .CAS_IN_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_0 ),
        .CAS_IN_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_1 ),
        .CAS_IN_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_133 }),
        .CAS_IN_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_205 }),
        .CAS_IN_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_277 }),
        .CAS_IN_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_349 }),
        .CAS_IN_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_2 ),
        .CAS_IN_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_3 ),
        .CAS_IN_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_4 ),
        .CAS_IN_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_5 ),
        .CAS_IN_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_6 ),
        .CAS_IN_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_7 ),
        .CAS_IN_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_8 ),
        .CAS_IN_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_0_n_9 ),
        .CAS_OUT_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_38 }),
        .CAS_OUT_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_61 }),
        .CAS_OUT_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_502 }),
        .CAS_OUT_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_511 }),
        .CAS_OUT_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_0 ),
        .CAS_OUT_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_1 ),
        .CAS_OUT_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_133 }),
        .CAS_OUT_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_205 }),
        .CAS_OUT_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_277 }),
        .CAS_OUT_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_349 }),
        .CAS_OUT_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_2 ),
        .CAS_OUT_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_3 ),
        .CAS_OUT_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_4 ),
        .CAS_OUT_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_5 ),
        .CAS_OUT_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_6 ),
        .CAS_OUT_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_7 ),
        .CAS_OUT_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_8 ),
        .CAS_OUT_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_9 ),
        .CLK(clka),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DBITERR_B_UNCONNECTED ),
        .DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DIN_A_UNCONNECTED [71:0]),
        .DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DIN_B_UNCONNECTED [71:0]),
        .DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_A_UNCONNECTED [71:0]),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(1'b1),
        .EN_B(1'b1),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(1'b1),
        .RDB_WR_B(1'b1),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_1_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "gen_wr_a.gen_word_narrow.mem" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INTERLEAVED"),
    .BWE_MODE_B("PARITY_INTERLEAVED"),
    .CASCADE_ORDER_A("MIDDLE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B4_M0"),
    .NUM_UNIQUE_SELF_ADDR_A(4),
    .NUM_UNIQUE_SELF_ADDR_B(4),
    .NUM_URAM_IN_MATRIX(4),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h002),
    .SELF_ADDR_B(11'h002),
    .SELF_MASK_A(11'h7FC),
    .SELF_MASK_B(11'h7FC),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_2 
       (.ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_ADDR_A_UNCONNECTED [22:0]),
        .ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_ADDR_B_UNCONNECTED [22:0]),
        .BWE_A({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .BWE_B({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CAS_IN_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_38 }),
        .CAS_IN_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_61 }),
        .CAS_IN_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_502 }),
        .CAS_IN_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_511 }),
        .CAS_IN_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_0 ),
        .CAS_IN_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_1 ),
        .CAS_IN_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_133 }),
        .CAS_IN_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_205 }),
        .CAS_IN_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_277 }),
        .CAS_IN_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_349 }),
        .CAS_IN_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_2 ),
        .CAS_IN_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_3 ),
        .CAS_IN_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_4 ),
        .CAS_IN_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_5 ),
        .CAS_IN_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_6 ),
        .CAS_IN_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_7 ),
        .CAS_IN_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_8 ),
        .CAS_IN_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_1_n_9 ),
        .CAS_OUT_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_38 }),
        .CAS_OUT_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_61 }),
        .CAS_OUT_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_502 }),
        .CAS_OUT_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_511 }),
        .CAS_OUT_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_0 ),
        .CAS_OUT_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_1 ),
        .CAS_OUT_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_133 }),
        .CAS_OUT_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_205 }),
        .CAS_OUT_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_277 }),
        .CAS_OUT_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_349 }),
        .CAS_OUT_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_2 ),
        .CAS_OUT_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_3 ),
        .CAS_OUT_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_4 ),
        .CAS_OUT_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_5 ),
        .CAS_OUT_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_6 ),
        .CAS_OUT_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_7 ),
        .CAS_OUT_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_8 ),
        .CAS_OUT_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_9 ),
        .CLK(clka),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DBITERR_B_UNCONNECTED ),
        .DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DIN_A_UNCONNECTED [71:0]),
        .DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DIN_B_UNCONNECTED [71:0]),
        .DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_A_UNCONNECTED [71:0]),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(1'b1),
        .EN_B(1'b1),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(1'b1),
        .RDB_WR_B(1'b1),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_2_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "524288" *) 
  (* RTL_RAM_NAME = "gen_wr_a.gen_word_narrow.mem" *) 
  URAM288 #(
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INTERLEAVED"),
    .BWE_MODE_B("PARITY_INTERLEAVED"),
    .CASCADE_ORDER_A("LAST"),
    .CASCADE_ORDER_B("LAST"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(1'b0),
    .IS_EN_A_INVERTED(1'b0),
    .IS_EN_B_INVERTED(1'b0),
    .IS_RDB_WR_A_INVERTED(1'b0),
    .IS_RDB_WR_B_INVERTED(1'b0),
    .IS_RST_A_INVERTED(1'b0),
    .IS_RST_B_INVERTED(1'b0),
    .MATRIX_ID("gen_wr_a.gen_word_narrow.mem_reg_B4_M0"),
    .NUM_UNIQUE_SELF_ADDR_A(4),
    .NUM_UNIQUE_SELF_ADDR_B(4),
    .NUM_URAM_IN_MATRIX(4),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(11'h003),
    .SELF_ADDR_B(11'h003),
    .SELF_MASK_A(11'h7FC),
    .SELF_MASK_B(11'h7FC),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")) 
    \gen_wr_a.gen_word_narrow.mem_reg_uram_3 
       (.ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_ADDR_A_UNCONNECTED [22:0]),
        .ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_ADDR_B_UNCONNECTED [22:0]),
        .BWE_A({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .BWE_B({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CAS_IN_ADDR_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_16 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_17 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_18 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_19 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_20 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_21 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_22 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_23 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_24 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_25 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_26 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_27 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_28 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_29 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_30 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_31 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_32 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_33 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_34 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_35 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_38 }),
        .CAS_IN_ADDR_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_61 }),
        .CAS_IN_BWE_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_494 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_495 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_496 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_497 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_498 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_499 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_500 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_501 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_502 }),
        .CAS_IN_BWE_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_503 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_504 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_505 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_506 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_507 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_508 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_509 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_510 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_511 }),
        .CAS_IN_DBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_0 ),
        .CAS_IN_DBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_1 ),
        .CAS_IN_DIN_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_67 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_68 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_69 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_70 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_71 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_72 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_73 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_74 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_75 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_76 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_77 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_78 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_79 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_80 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_81 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_82 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_83 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_84 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_85 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_86 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_87 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_88 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_89 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_90 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_91 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_92 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_93 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_94 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_95 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_96 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_97 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_98 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_99 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_131 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_132 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_133 }),
        .CAS_IN_DIN_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_134 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_135 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_139 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_140 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_141 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_142 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_143 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_147 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_148 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_149 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_150 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_151 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_152 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_153 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_154 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_155 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_156 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_157 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_158 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_159 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_160 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_161 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_162 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_163 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_164 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_165 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_166 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_167 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_168 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_169 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_170 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_171 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_172 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_173 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_174 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_175 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_176 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_177 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_178 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_179 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_180 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_181 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_182 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_183 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_184 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_185 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_186 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_187 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_188 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_189 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_190 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_191 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_192 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_193 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_194 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_195 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_196 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_197 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_198 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_199 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_200 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_201 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_202 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_203 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_204 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_205 }),
        .CAS_IN_DOUT_A({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_206 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_207 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_208 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_209 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_210 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_211 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_212 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_213 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_214 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_215 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_216 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_217 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_218 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_219 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_220 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_221 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_222 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_223 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_224 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_225 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_226 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_227 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_228 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_229 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_230 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_231 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_232 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_233 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_234 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_235 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_236 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_237 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_238 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_239 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_240 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_241 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_242 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_243 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_244 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_245 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_246 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_247 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_248 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_249 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_250 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_251 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_252 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_253 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_254 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_255 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_256 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_257 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_258 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_259 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_260 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_261 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_262 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_263 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_264 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_265 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_266 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_267 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_268 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_269 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_270 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_271 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_272 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_273 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_274 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_275 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_276 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_277 }),
        .CAS_IN_DOUT_B({\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_278 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_279 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_280 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_281 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_282 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_283 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_284 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_285 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_286 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_287 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_288 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_289 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_290 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_291 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_292 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_293 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_294 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_295 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_296 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_297 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_298 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_299 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_300 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_301 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_302 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_303 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_304 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_305 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_306 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_307 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_308 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_309 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_310 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_311 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_312 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_313 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_314 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_315 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_316 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_317 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_318 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_319 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_320 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_321 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_322 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_323 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_324 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_325 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_326 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_327 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_328 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_329 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_330 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_331 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_332 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_333 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_334 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_335 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_336 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_337 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_338 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_339 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_340 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_341 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_342 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_343 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_344 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_345 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_346 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_347 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_348 ,\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_349 }),
        .CAS_IN_EN_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_2 ),
        .CAS_IN_EN_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_3 ),
        .CAS_IN_RDACCESS_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_4 ),
        .CAS_IN_RDACCESS_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_5 ),
        .CAS_IN_RDB_WR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_6 ),
        .CAS_IN_RDB_WR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_7 ),
        .CAS_IN_SBITERR_A(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_8 ),
        .CAS_IN_SBITERR_B(\gen_wr_a.gen_word_narrow.mem_reg_uram_2_n_9 ),
        .CAS_OUT_ADDR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_A_UNCONNECTED [22:0]),
        .CAS_OUT_ADDR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_ADDR_B_UNCONNECTED [22:0]),
        .CAS_OUT_BWE_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_A_UNCONNECTED [8:0]),
        .CAS_OUT_BWE_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_BWE_B_UNCONNECTED [8:0]),
        .CAS_OUT_DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_A_UNCONNECTED ),
        .CAS_OUT_DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DBITERR_B_UNCONNECTED ),
        .CAS_OUT_DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_A_UNCONNECTED [71:0]),
        .CAS_OUT_DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DIN_B_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_A_UNCONNECTED [71:0]),
        .CAS_OUT_DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_DOUT_B_UNCONNECTED [71:0]),
        .CAS_OUT_EN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_A_UNCONNECTED ),
        .CAS_OUT_EN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_EN_B_UNCONNECTED ),
        .CAS_OUT_RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_A_UNCONNECTED ),
        .CAS_OUT_RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDACCESS_B_UNCONNECTED ),
        .CAS_OUT_RDB_WR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_A_UNCONNECTED ),
        .CAS_OUT_RDB_WR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_RDB_WR_B_UNCONNECTED ),
        .CAS_OUT_SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_A_UNCONNECTED ),
        .CAS_OUT_SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_CAS_OUT_SBITERR_B_UNCONNECTED ),
        .CLK(clka),
        .DBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_A_UNCONNECTED ),
        .DBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DBITERR_B_UNCONNECTED ),
        .DIN_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DIN_A_UNCONNECTED [71:0]),
        .DIN_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DIN_B_UNCONNECTED [71:0]),
        .DOUT_A({\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_A_UNCONNECTED [71:32],\gen_rd_a.douta_reg }),
        .DOUT_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_DOUT_B_UNCONNECTED [71:0]),
        .EN_A(1'b1),
        .EN_B(1'b1),
        .INJECT_DBITERR_A(1'b0),
        .INJECT_DBITERR_B(1'b0),
        .INJECT_SBITERR_A(1'b0),
        .INJECT_SBITERR_B(1'b0),
        .OREG_CE_A(1'b1),
        .OREG_CE_B(1'b1),
        .OREG_ECC_CE_A(1'b1),
        .OREG_ECC_CE_B(1'b1),
        .RDACCESS_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_A_UNCONNECTED ),
        .RDACCESS_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_RDACCESS_B_UNCONNECTED ),
        .RDB_WR_A(1'b1),
        .RDB_WR_B(1'b1),
        .RST_A(1'b0),
        .RST_B(1'b0),
        .SBITERR_A(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_A_UNCONNECTED ),
        .SBITERR_B(\NLW_gen_wr_a.gen_word_narrow.mem_reg_uram_3_SBITERR_B_UNCONNECTED ),
        .SLEEP(1'b0));
endmodule

(* ORIG_REF_NAME = "xpm_memory_spram" *) 
module design_1_blk_mem_gen_0_1_xpm_memory_spram
   (douta,
    sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina);
  output [31:0]douta;
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [31:0]dina;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire regcea;
  wire rsta;
  wire sleep;
  wire [0:0]wea;
  wire NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED;
  wire NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED;
  wire NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED;
  wire NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED;
  wire [31:0]NLW_xpm_memory_base_inst_doutb_UNCONNECTED;

  (* ADDR_WIDTH_A = "14" *) 
  (* ADDR_WIDTH_B = "14" *) 
  (* AUTO_SLEEP_TIME = "0" *) 
  (* BYTE_WRITE_WIDTH_A = "32" *) 
  (* BYTE_WRITE_WIDTH_B = "32" *) 
  (* CLOCKING_MODE = "0" *) 
  (* ECC_MODE = "0" *) 
  (* MAX_NUM_CHAR = "0" *) 
  (* MEMORY_INIT_FILE = "none" *) 
  (* MEMORY_INIT_PARAM = "" *) 
  (* MEMORY_OPTIMIZATION = "true" *) 
  (* MEMORY_PRIMITIVE = "3" *) 
  (* MEMORY_SIZE = "524288" *) 
  (* MEMORY_TYPE = "0" *) 
  (* MESSAGE_CONTROL = "0" *) 
  (* NUM_CHAR_LOC = "0" *) 
  (* P_ECC_MODE = "no_ecc" *) 
  (* P_ENABLE_BYTE_WRITE_A = "0" *) 
  (* P_ENABLE_BYTE_WRITE_B = "0" *) 
  (* P_MAX_DEPTH_DATA = "16384" *) 
  (* P_MEMORY_OPT = "yes" *) 
  (* P_MEMORY_PRIMITIVE = "ultra" *) 
  (* P_MIN_WIDTH_DATA = "32" *) 
  (* P_MIN_WIDTH_DATA_A = "32" *) 
  (* P_MIN_WIDTH_DATA_B = "32" *) 
  (* P_MIN_WIDTH_DATA_ECC = "32" *) 
  (* P_MIN_WIDTH_DATA_LDW = "4" *) 
  (* P_MIN_WIDTH_DATA_SHFT = "32" *) 
  (* P_NUM_COLS_WRITE_A = "1" *) 
  (* P_NUM_COLS_WRITE_B = "1" *) 
  (* P_NUM_ROWS_READ_A = "1" *) 
  (* P_NUM_ROWS_READ_B = "1" *) 
  (* P_NUM_ROWS_WRITE_A = "1" *) 
  (* P_NUM_ROWS_WRITE_B = "1" *) 
  (* P_SDP_WRITE_MODE = "yes" *) 
  (* P_WIDTH_ADDR_LSB_READ_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) 
  (* P_WIDTH_ADDR_READ_A = "14" *) 
  (* P_WIDTH_ADDR_READ_B = "14" *) 
  (* P_WIDTH_ADDR_WRITE_A = "14" *) 
  (* P_WIDTH_ADDR_WRITE_B = "14" *) 
  (* P_WIDTH_COL_WRITE_A = "32" *) 
  (* P_WIDTH_COL_WRITE_B = "32" *) 
  (* READ_DATA_WIDTH_A = "32" *) 
  (* READ_DATA_WIDTH_B = "32" *) 
  (* READ_LATENCY_A = "2" *) 
  (* READ_LATENCY_B = "2" *) 
  (* READ_RESET_VALUE_A = "0" *) 
  (* READ_RESET_VALUE_B = "0" *) 
  (* USE_EMBEDDED_CONSTRAINT = "0" *) 
  (* USE_MEM_INIT = "1" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WRITE_DATA_WIDTH_A = "32" *) 
  (* WRITE_DATA_WIDTH_B = "32" *) 
  (* WRITE_MODE_A = "2" *) 
  (* WRITE_MODE_B = "2" *) 
  (* XPM_MODULE = "TRUE" *) 
  design_1_blk_mem_gen_0_1_xpm_memory_base xpm_memory_base_inst
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterra(NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED),
        .dbiterrb(NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_xpm_memory_base_inst_doutb_UNCONNECTED[31:0]),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterra(1'b0),
        .injectdbiterrb(1'b0),
        .injectsbiterra(1'b0),
        .injectsbiterrb(1'b0),
        .regcea(regcea),
        .regceb(1'b0),
        .rsta(rsta),
        .rstb(1'b0),
        .sbiterra(NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED),
        .sbiterrb(NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED),
        .sleep(sleep),
        .wea(wea),
        .web(1'b0));
endmodule

(* C_ADDRA_WIDTH = "14" *) (* C_ADDRB_WIDTH = "14" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "1" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "14" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.442974 mW" *) 
(* C_FAMILY = "kintexuplus" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "1" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "NONE" *) 
(* C_INIT_FILE_NAME = "no_coe_file_loaded" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "0" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "16384" *) (* C_READ_DEPTH_B = "16384" *) (* C_READ_WIDTH_A = "32" *) 
(* C_READ_WIDTH_B = "32" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "0" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "1" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "16384" *) (* C_WRITE_DEPTH_B = "16384" *) (* C_WRITE_MODE_A = "NO_CHANGE" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) 
(* C_XDEVICEFAMILY = "kintexuplus" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
module design_1_blk_mem_gen_0_1_blk_mem_gen_v8_4_1
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [13:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [13:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [13:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire regcea;
  wire rsta;
  wire sleep;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[13] = \<const0> ;
  assign rdaddrecc[12] = \<const0> ;
  assign rdaddrecc[11] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[13] = \<const0> ;
  assign s_axi_rdaddrecc[12] = \<const0> ;
  assign s_axi_rdaddrecc[11] = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_blk_mem_gen_0_1_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .regcea(regcea),
        .rsta(rsta),
        .sleep(sleep),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module design_1_blk_mem_gen_0_1_blk_mem_gen_v8_4_1_synth
   (douta,
    sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina);
  output [31:0]douta;
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [31:0]dina;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire regcea;
  wire rsta;
  wire sleep;
  wire [0:0]wea;

  design_1_blk_mem_gen_0_1_xpm_memory_spram \gnuram_without_32bit_addr.uram_sp.xpm_memory_spram_inst 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .regcea(regcea),
        .rsta(rsta),
        .sleep(sleep),
        .wea(wea));
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
