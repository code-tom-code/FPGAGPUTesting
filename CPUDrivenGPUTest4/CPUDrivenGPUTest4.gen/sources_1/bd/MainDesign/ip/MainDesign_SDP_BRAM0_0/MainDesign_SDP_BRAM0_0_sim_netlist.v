// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_0 -prefix
//               MainDesign_SDP_BRAM0_0_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_0
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
  MainDesign_SDP_BRAM0_0_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28448)
`pragma protect data_block
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
3OH2NQI=
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
