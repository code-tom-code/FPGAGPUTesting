// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:04 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_SDP_BRAM0_1/MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_1
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
  MainDesign_SDP_BRAM0_1_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28736)
`pragma protect data_block
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
Ks5td3L0fqQ=
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
