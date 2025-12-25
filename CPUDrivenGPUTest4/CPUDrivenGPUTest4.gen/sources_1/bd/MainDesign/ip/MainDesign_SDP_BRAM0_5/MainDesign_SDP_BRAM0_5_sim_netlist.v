// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_5 -prefix
//               MainDesign_SDP_BRAM0_5_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_5
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
  MainDesign_SDP_BRAM0_5_blk_mem_gen_v8_4_12 U0
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
AHtA/4U=
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
