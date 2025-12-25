// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:13 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_1/MainDesign_blk_mem_gen_0_1_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_1
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [8:0]addra;
  wire clka;
  wire [63:0]dina;
  wire [63:0]douta;
  wire ena;
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
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.864752 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
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
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
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
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_blk_mem_gen_0_1_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
        .regcea(1'b1),
        .regceb(1'b1),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 44944)
`pragma protect data_block
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
eEWGZ59DR8qJilU7GXCePNhQmfSJWxziU70ADw==
`pragma protect end_protected
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
