// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_3 -prefix
//               MainDesign_SDP_BRAM0_3_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_3
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
  MainDesign_SDP_BRAM0_3_blk_mem_gen_v8_4_12 U0
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
VSNZyt8=
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
