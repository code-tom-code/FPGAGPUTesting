// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_4 -prefix
//               MainDesign_SDP_BRAM0_4_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_4
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
  MainDesign_SDP_BRAM0_4_blk_mem_gen_v8_4_12 U0
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
PjHQXW4=
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
