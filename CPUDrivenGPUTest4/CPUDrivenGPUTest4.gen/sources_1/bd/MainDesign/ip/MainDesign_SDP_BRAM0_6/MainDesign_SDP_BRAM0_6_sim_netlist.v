// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_6 -prefix
//               MainDesign_SDP_BRAM0_6_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_6
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
  MainDesign_SDP_BRAM0_6_blk_mem_gen_v8_4_12 U0
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
kLMhB6k=
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
