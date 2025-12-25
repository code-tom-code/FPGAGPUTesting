// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:08 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_3/MainDesign_blk_mem_gen_0_3_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_3,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_3
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.983213 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
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
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_blk_mem_gen_0_3_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29888)
`pragma protect data_block
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
FgmrbnC9+/K3x/lp5QzkbgHklUI=
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
