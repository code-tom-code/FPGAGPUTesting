// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:48 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_1/MainDesign_blk_mem_gen_0_1_sim_netlist.v
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
h1QqT93idz5xgSevfelasj8+9nWZd4GwCSyOog==
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
