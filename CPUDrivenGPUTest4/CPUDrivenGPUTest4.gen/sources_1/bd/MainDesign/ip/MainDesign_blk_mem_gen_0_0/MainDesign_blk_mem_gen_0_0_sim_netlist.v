// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_blk_mem_gen_0_0 -prefix
//               MainDesign_blk_mem_gen_0_0_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE WRITE_ONLY, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire ena;
  wire enb;
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
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.375111 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "1" *) 
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
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
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
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_blk_mem_gen_0_0_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28496)
`pragma protect data_block
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
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
