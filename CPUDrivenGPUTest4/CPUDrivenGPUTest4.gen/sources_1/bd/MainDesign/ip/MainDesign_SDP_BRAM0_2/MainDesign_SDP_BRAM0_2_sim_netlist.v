// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_2 -prefix
//               MainDesign_SDP_BRAM0_2_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_2
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
  MainDesign_SDP_BRAM0_2_blk_mem_gen_v8_4_12 U0
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
KjdT1aM=
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
