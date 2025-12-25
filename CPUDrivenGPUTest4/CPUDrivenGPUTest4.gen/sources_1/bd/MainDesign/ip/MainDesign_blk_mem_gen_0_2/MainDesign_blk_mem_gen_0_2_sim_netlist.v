// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:58:30 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_2/MainDesign_blk_mem_gen_0_2_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_2,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_2
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
  MainDesign_blk_mem_gen_0_2_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 36304)
`pragma protect data_block
9ek6SFqrPZSDD8taGrhaEf4cvkShrxp0nfRDVCY2WjpUXDU8sOsto2tqBZG15J5DYEVbAVJv4iwX
JPpBrey9fFDDQgEuFv6IU6GJOZ+sWp6Xoh58x8tyf/lF0gvv/V+mAiKnb4m5QuTEc1+AFG9G4/Co
2lz4XlmIoO1T1ZB0C9Cy6aQ9TVGatVxKJlOqVjWeMxxcEktKmFQMpmrjQ7T8z3w16F21kXD9dHFu
NixVhoGIyxm2hZEA4f6/zfTFlO5wYpHe/kxOOa6Nx6sCq82outv6B+c8FUzGj0vw9HOb732Atr+P
xbMNV4SPrRTwF99n5nWeJGxypME1rbW+uBPy9S94+qB2awG7FhxCubdrIVCegQKtRRIRau6VieW6
8+UUGovMqloAeZaMyxG80gkd0V7URuD1mxDM7xNpi0A8jY10HfR4x6idtxwyA5tVh5rqOzuB61SD
c8art2yHRUWrK6fuC/nBUDyjHi+bnPzgu3qLb71/j9alwBvjJiqZcm+R+WDSudsBW24MARWFTugI
Bk3SnFER0yTrg7gvK2MbMCyySuSxYvkWAXDNkMJOX1FtZ2fTOWIy9ljgwK5T1EuBNycYePeJnR6R
X9E7vnWJohp/EjAKO8jIc9Ige6Qyd4hk2OckhrUKYiF0lim/uIPYH2a1kGjE+j0/INsRwytEw0eQ
Qa6A9byFXkjnFeyD//3s7JyW2S8WrfptkHvjebiqCySU4cSJ4DPP2+HniJTITOAYZYbPb1ahfUDr
pcpxfAh/t9f9uk0/Njh5QQL1s4DIMS/04hVx/gvxFNou3Admias0decCzM9iKb4tNvJWdDwNKdRr
Io584jDUc3vjQgMnIzxBxwwNUarZ15AltzfYYYP9HxaOW4UKTYmdi/h9TGvRGO4m7KOvaki+hvkb
D2h/8NZEFOzG27DGIHxAKLsHYzr5c98eVC7S0IMHmUqKG9IKgpkBEIHB5czUOl+iZd44mHOkwDhk
oBh/SN4ZbaQens9z7CPnWIzFw1/YLQBqTFzfsIkbMNkCvxwRj0a04dCLTR51jDq5st/ZuVNHM7zr
6N2KbY9nd9oEoS4235fXN03Uqu9s71D0n4UovAktE/luLeeK0lGCJeBANXE7iAjrSYSvQwAwJdzL
rZW8UlnPGzGGMVekB62Dbd4OgdIZBDnNtBuFF36ZyMCTzD1vTqMPzOxG1TVkC78cWPw1uPCwyvTP
grGc37BRN3at7bU0UXxo+YefzdmF8vJ4f767twBcfsxZsvQXcK80gXB1CmGxuKLHicTpnyc9VQfy
namqv/h7roHeVDXzYS8NvSL3c8kbC9VcDQY98EbewRyyC4eCGgyLke7+TddNBuqgeevEuM5nkUeU
1cPtJljfgs/8IEHGVQyoBvu+C7sqRjXiqHyjNttRONUYXm4+106LJKjn61heIgquW2pKjXhpnrsX
fh8v2AM6/jCBJPQludr5uZ4XLDBC1PQthXHhse/yfiC6/1OHEVqTOScwcVxriap2yILc9RI5nKpo
FF0CXoug1UkbP8/0nHwVcJ/IfYs7psjTV8ymlPkXgVzH26bwdB2Rju2TUWjSzO5i3fRhYU1d4tj8
59GIz/9WdeZC6EMTfx96tjmYx9t7hWlxMXLCGHeUtBbzk7IoByVKdFcopLHIk/lYv4dqvUIloacH
eFo+SemVAxAS+zUPVAIXm0k+70CNANwBZSi8FKrLjJyWPEsTEJU2c/nh6iwshdavhd5PQBB8c9sq
glIFU3M894aH5pOaMzOmiVp7UFQGDJCa19ZlLujzT/tq+qEhXr4dvkAkFBYEZbijYsdFYOEnAJ9w
TII3OnOLf/mBFUNkbFOQKOAHI6fXq2AO3mLZdzW6uV/DHi/wZIKQyGsfH4TTbbL46lDKuMuOU4qD
YujqHCZyiXblt/Biy1S0x9LP+0vPqdt0wLFO0aUadDM0a9PKIMafcDk1wLRBgqtGCH78wWI9FSvc
mBgOmZZ7bLYJBhs3nJmhcdIM7FKYKiSwjPEHPm35Rm7HCcCEn2pvpQM2vBC0CzR2ZiPT6/nMsmHn
0Mysaw7jmUcZy1IobnxaXqXbkbejT6Uwzsq4W1UnA1XfmcKbAVd+SYKnL2iS2z9Wp9TpPvdM8AaE
ZAT+SP9AOqp1vLTpmb+qZhr0HlwNSQ1ODpPv9AV9Tu/SdYJUxdM2lfFK2dJGeiRL0q0JPuEQmBXB
k4I1pwqxz5jOeGN8n8JCaaninyJU17XJ+YBzWKohNDI/5vSca7gICZXrCwDLYfHQy13fOuFX8seX
6bAm2RpyN1hnXt4IOaj/+vN7291thHSBy7pHX72Aq4qbuQCTlvUcOF+VYxocxMxcmGh/gLn5gMRS
+F4vDNQH+OCtrXMTTqZIVGTTnOIXWofOBed1gWMiOX3A38mdWmSFUCgrKaKs1WJVO0Km71ky3AKW
yYT661RoAhvfF/R0tQHUioHs86gayoraMaDaQkggDVvWLij1DuruR29PAK4RRewML1RMoEo9VSiS
Hwu9sTBxg7bywDkj8UnGSC0LViElSxDPh4zz55CLEpNXJe4zj/Nxec7YJC1BzSLDfLdmKucryAdo
uAwm1VS6nK6DxOoZk/j0kaspMNgWRY8Yoyz0OGfpO0MMsDsZcYFOfdnQ/s0PyNivRrcq9O3ZRnXl
eDaIPHtos6uAJHbEaTf1YIGp0ABr/9kSbZmCi+i7zy3S3NxijuL3MwZGDnEo2aUItvXOvQu44pvK
WUzYmPLlu8/RlfRWzR6WZalkjiCC2i3nY5wBc7/0Br/CmdHxwwo3Jmp0Otj0L9AL3HRPun0vhpwG
eGC9PkJ12STuFH+kwGqLM4ZI/Q9c4trRkKYtnznnKi/hpwI7pVnvW1D9MZDhM/z5AjLs9ZjBU3wc
cDG9s23WhkQq5KRmNLCvniPgFUV20p9+4bVr0ssixcHQSqCKfSHocouSteiglCgv7olyJTJY0uRi
YzmSvK/J0uF+25Ht+ji+hCIKiAmrjGgeGoieuYQRm4yqUfr04qAs2vbS+72SDENPUP6JD2lH9Mbn
9u/93LIS9FqqDXZqoRqvJcLIFQSm5RtE58q+iQPmLt0g7w9g+gvOw86vwY7oEHo0WtjLd9F6Jc4X
6E/ChL8QoVKKM/9Nb7g7oVFBpoM2pS+PtzKq8oofqjnXiI565LxLTG0adG45GWWZgjIK0mpnxFQ/
uVdfEbe+61EWg0HD/Q35bwy/KVy0Hs1J3eRdPqXUbcjkqteVGnNOrEUciVceN2H2LLf7MRAznP9K
TBbzgv3Edo//VhfVvj+CzZ+ZbHHM/J9dzJ/clRrsSB2vg+Elx7nfdZkNl2c7VzJ4I2lUPLtwgYZY
5pe815JL1256OdrJO7KLXH3mHdQpY9ds2m1D+ftYbSRKRs8jEcA1DTuXGpCTLXaJwaHznRi5s2Kt
yq80XFvjnqLmAJmwRMRdlBht8bvtkOT2GAnFyCA0nASrJ9wLK2vsxUbowOiQ7KEARyNaVxYY9P35
lb79csvlIZUym10kHbNgdMpOsqE9MvoN6Db138h6jhPBVNsyLOrc+8YpQXsueVC4Sxp6t0LcaGQ9
rf3QBinFvhD3pSrLTzgFoRKS21MxF1UQ043D4QtvPugzaZJLkWABPDjMlH80xCRz3Ewjwluu/H/f
sPUjIzdNG9ZGJB9z3+7boN/eMBDr7KVZy2cRlVcpOzx8jYFhSTa3arPMGjPmc+3FhLPqSkIA3Z/J
pLsF6Uh6uVkh2I5s55vuNjGlZUiRjrzoorVo0KvimjEj0FVzJo1+8aIKO9uvf4rNCt2+NzdtLjOw
NcODdMfzs0gNzHQzGy3w50q2GXb+DXOtjTpTh+BG/2Euzen/aYE8z4I+qGqPZfDfalGF/573wvcE
CnNmOKsGDgtctBUZClwncAy9NKhIJGJDM9513WYB0XiGvkesifbn8O+pbupRqwT8e7yoNAo9rsJ4
PekdyelSTC0U2sBOfwSLEFXKbwq5OYrX5pQQjZYIybtAG1AJxX7kg0C5ieEnW0YhQhoeADcTznMW
BPfwlvMdC0EURhTCG1IrpX+6CQ40vfAxZsA+XilXt5VgsNuioLepVTmdpBVG9V/MFD+nK3VuzfzZ
R9dWqITCNk0EKDd6rUuHh1e4tgy6QL6U7kxB/kc2AwYNxC36YjKsHA20pyp6ndf+GTUHux/MziCN
iyBnxJdUA0xAGDyzLxzVe1VBRT+6Hvv4UaJzuvZMCPhGBlhLEJqpcGzJvLcA+L9sxZ+EgdGh7exC
cZtzpdXBz4BvABcqRu2lMWc/6zU6rfRSdLNpEW+xkxVEkOxIrcySUsyPeKm8RhRhwILFZHLixL4L
mNJcy5ee7Vqxa4px/V6cNe60NauNySgks2m3jHd+AgisKS2yLtjcDo/sCccjl8V9Uy+zG1tAPWsq
Ii17KttWz9qINwN4jPkPZnrGdIFqVsp3O9LDRhrVw+Z8YyetttkeefXH4VhBvGKirbIPLtvQbc/P
/KYOzqk9bnXJT5L8WgqBhtI/1mpen/BwehX25k7NuhiAZrx2byNjnGNJHeu02LMoXeYMvlLUO7yQ
Hp9toS/GZ9otxWQt5qo3xkTKREnAN+zNxSDLtjB+i1K1yI9hu1/g7b5L1wAY4qZmxl/RJxcxqnka
AGCNWTFp2e1DnRm6od9AncQ/FYHfHk5dI1GLLHBv6EBNvLx4DL0/Zt2RvmpYT5HBsEePPewc+3lE
W84BaCCgTLjBuws7ygimyDeIVZkwtmqwZvZPrzt0S64ia+e5ndXkSq15Vh4zNAop2x6mvEU2ONWL
smCB1Kr0tekubcD3gXTnLZL5uPzQm6tJM3NZwlQ92LmquFewiNB7HJ48vCaDXKuUUwsSZam9C/FC
eu6oe/i/Vbub0trprHZNj7HAOqi1DY0TUU6lCI/ORErztVwxNecqKbLj/nuoyN/e9JA4y1TmBHaG
DnmauMor5uz0GW764pohcBP4Q1VO4RFfnhR7RrWQ0steHpk+eWALKO5gqeecdM6tX4g51BHki7qO
r64LKZire2i3gjOkre1LqLNHknZAJdaG02lcUnCG5ZurqtB7jqxvUAnq2dHND3x3zdKrEesWClHW
Vb8fWqKIfoQZJBlk9H8MN5elLeoDeC6mOX1JUH6PL2zEPKQ/pfRzq3kra4AgnuYbjk2k9imkPBWO
/5pRL8Rvczzm550J/7MGJDae1ZTnWyICfndXzxwcoDNrHw/z0zBkgaMUOZ7EEXWVmP5zNYE08IL8
HIWMkk0ILGO7TQWi/HX1oY3ksxtF8ws9A3hscyXnNf/+qejIYMCXvwQS+anrJGQWsj85pEjHGewb
+7CdvGFsprD5RSTcHub5XlCRJC9p6NocNZ6wHi0aLb2TKqOpeToaFesT86RRspAsA0sC1Md8pMka
NmP0Xbd2NHN0VQl5JNwN1gFfvYH+gsD41NI+hEZdDK6/MQe9tEZH9AD9+CY+MXbFTB2Ec8jfV+hr
spTsjnco/aa/s0Y8mhZ+2L9ZcbToaW5PQrSNVKCkCl4M5zVgAZEGxTwn2lsz7dAsNOXUhy8gr7UC
sg+06K3opIBGaiccslaGSch50y1pixlizuB4DQLu6fXKVJ46IZb859xSLFuus+dcUPwvm6HJAb48
vbIwrDiyvexQfRwbTMo4PxWY/u8exV4h9IvEeUN3CFgQKO/TWcs48hH0SWjXgmsCRyKr7IsIMy8k
YGdTIYWO5oHRCFw/Gj3N7TNFUi5YB0wSx/P1qD/dEKZcUNN/w4h7UwXkVdc5VzErQ/c7A18VuauG
YIeRERH7DzT0G1CUu+w8AVAPFvR0CoeA+tvM5etDAY6etSFyj8Ikm/MNGhkE9MEkw4eAdI8dH5bh
cAsCRUC3njsf+r1Wqo8RBMse3M8zs4XCQS8Ht835X6M4DPwC+9SJVeCMeizGEDk2f4KUJGypCgtg
hK5rn1gCrAyiH1t3AfW7+8Q/m8rrFLOyPjwlADk06R4B+4bFtS0Y97es4YCYOudS8+HADzJgt0+b
4zGt4qiXFKh5DiURezVwMLI0Pn/OOmKVTSWB8YDre4T2ZpEXeR9Yf180K82UFWErTor1cGipwEMS
BBKkquytloccjOtl/gvbEgeAHmuMR0wB8hBtHSp7yI1Q/90w/WEkRF1fv15C9CQayefOVM2t4m0a
VDI3H57E5oR9y2Mw1iSBQ902rh49bCJUWfdD+eCU+yWEkQP3b0jTouttNzoLwEnhG1wf7vbewBOe
PPommZJM/SdkuIaQxvbPqH1Rl0z1dcpUMtN8MePmtRcjocS4p/fPDZ4lOd2v82ums6HXctg5Rv0G
no4KL8AXkKTkfX0lHP/JSU00CRDz8CZyiYAIzse3kM8Gl5F7En4kSXWTGz/6vFwjBQVzWeCAIWPL
J3o01utN7JqxkL5qt/uG8278hwP42x7ty/AUldK2ia0xEEpeMbCKeF3A3++0PoXwJ6C8dFKGr2Kw
t0QZ4DqjddZJ3hNABl+pJf2nK6xPvcivZjobXPxejFXjuCm+0mAeN0yzRZoYkFcIrdmodEEqCvdL
5d97RolAh4NAvSHaFlEYqn2P6O5Wh0ZFREVJze4u/MM8ZvFp3fScDGsPFtrW7DxE7DUYjwJFCK6k
1KYaiZjtgkAnh6OFvqdo7Idgpk3nospXJQb2hbMiIO0xkO0ND+dVfTf3Neio93snnaJZATl1ju1z
v3qKzYi0pGvWBNYX6e8dqg6GnKV770ZWY5zHzAHAjiu/EdBN6wHbJOaIuOmv83LQDI1djcLDzwO/
F7in1LUlq+OsWHHzvC+sJ6iZXTxHK/s9G3OLO9p2n95EYJ/UJlxcFTnPXLlogZx1LES+QZ4JCYox
pxdn3dOVpDOmzejKnKKZjiJtU3pnmTDYizS3xxnNMrSrI+Ds5lLbwGpUMiE2qP+l7JQmZIECULYL
86EtwsKZU8zY4neJOgOkOtN9AykZBbZoyspQ1I0WxukgmbP/g70c152/h6rvhDizozhe/0AKdeFY
flOOWEsU526KENUCtDhCKSIrvA0rXglfuOOxY4U5PRRnHREsPc932MorHKN5Pz/5H3M7Aal8Uyiy
oGLjWaEtixHYbfpDKtYKR2p1vhrot0sXS2WqmkJxNFfJeckM9oH+wIdPNkLfK+94xxHqI7LtI4Dp
TDbQ0zLA2K1D2y5leJnhiR56YnJRnh8E0FxHsC8ZxkEgRQTEq8Oeo29cT9ISmUROY/w05JY/MPRw
jSpedvCMnCCNkeKP49g8T7rS2DAhuOF9wHuL52BqpfegoJV8qR7vJSg+yhdBfEZ3t0Eug0TQG1i4
+0WQlj+5/+Wb8FX7/b89blO02y3NQVhvsAWAPKae/L/zWt12S4IEtyuySfas1uIglfBSn5SGIpaX
l1kwxw/3Ld58xj5mfRTGcvGRiGMfJIjWukNaFNo9vVdKfck1ZutuFirWxpeAu7+bWqlq+uBfFBPf
1zDGgPSb1TMeAqueF+HwJ1Pk2c5+dL/QlzKxyTGC1IW1laJffPDtdSLW09rqVz1S5gPxfUCfSfQl
h2XLNfJVd3iOM+WD2uxUJFXkg9SqJ65OItxvgYObt96mQaNY5sdjOTrns54el9bvTaR/Cm/67YRA
unWH6xHgv3JjrfuNSRHoTEr1FQ+B2BcCuMVkdceZZgGLqNoHN2xGVO+aAe1ipT4UP+Zpin94iAHo
J7G6CGm21L3h4k0PYRgnrLNbDz2YKr8u5FSOJKR/AjMEh/S0qJh2NrFqRRG9nTmU08qDTX/Kd1i8
e3X51ejmtZo0cpOaxL8iALur8OO4thcPYgfq+SIc43ndY6zTM4U2Gh3I7yaiVYn55vIXFSyyY3cZ
g9obhP6e/4Y9Cl42J6A6KCIrZs1PvVckW+pzlmGk9sC/tnqHi/J7ZwoEL19xDcjpPxjjIsadG8qn
/gaCpGUJVu5VpUzywsr3UVbuFY7LFWZ78Gmku6tjIeMvv5KLuTCeUMdoIeu+YwNBwTLCvbQQlAl7
QFS9xU5UQ6R81m20G6aGOzOhFPD1jsv5eE2pFvn8JUq4i/kvdKSjpyI6TMyVyM7F7+6yNNiFGOmj
UzjFfc5uhUMEc74TFYqbDw0K3dTsJ7pU6GgrDCR5bnozvVhjY0IvM0dSo1gpe16ga1pKfxQiUDlh
J4RmlvYAxSa2KXP6hXWuAvBeTukxEjAt/sITOfhFnFMEN5qrreRtjjJZm1Nj+wQtNWxjKvzlb5oI
SiVitLNcBCdnOKWc2RSr+MLJFMt/6p0qj9joivrsMH2WmCsINmB0v4e8ry9YROMC5trmN+sgB551
yIvFcAZxhNVsBBGrOGNwQ6JUI3nGim4h965jLPcYpxyIpf+svA5yhzzWSSKAIPa856S7jb6Tgifs
hrECOTgL495aB5wOnnOKEcunKYe+MsT7VcQFEVyNYY5dhnTtbKcLsP1Hz7nM5pSNk/QXTq7YFKb5
H6FBnAQp4/F0KhRTepq24bQ5KfTrHRuH+aXpnmJ13fAZag7j5AzomuHdyw8K2f6fwGjTrOOQdcG4
UNtOR7TRFexW+e4RgMYkKj1Ro4Pq1h0g7jkZSfFW7dgFL+yBJKrOvO50Kwo+9CvCY5LSmm3IbeeB
Ra54rnWUI+GTrpzBPI4Ou0Wvse1aGKn+uUKd3lXBcgvddisLANl7kJ+A/2/R2tdAfV96wewrjwfs
TfgU4zRDdeLLI6I2gMvuhywHbWgSBgEQP09dlHRjyb4cdm+XC1/pvpJv7hVV24SYSj3UXM+q/yWR
9hX2qItMQPR2B8Ha0kReor7NvPfJhi9XjN/yr5yjPmPuixkCuNc3AAyjc6IL2dHz1Lt0LFXh+G0P
musH5cLGc/CbSWP1gpE5r3iuPDmQDLsqjxqB0WAG7N/Tex8B6M5v9CaI3gJO7hAe+J4G8ZpJA3UI
5BXvsCtLUZoDxNSPFMvMNWbLUPBJvqUKGo+LV2zX5b5G2Dd1gQ5+tzIB4n3svRTiRlfpj/TtIh6R
F1lnAjMUhGiHHvhwiXxW+MUVxECi47dSHulOL5LHd6QeTLfSIFQkJlEveZ9Kidd6HS0sNTEOyBQ6
FfJe36pmAO9fVmIeJuqsHPQeoHn7IyfIKkISQbou+mUN/rGPF2HeUmzk3n+XDXJiuNdT7m+WoFhQ
0odgfBkaD+5BybFlq8SeGduLIxzoRLeG4EynlSGuz47MSLKkaF/ikJc6FvBW43pgsp6TlZXi2Wpn
V3NF8V6yky01XViJHj56vKvXB6vHeURc9eL/rLyPbpz19qtEFXtdvRMFfKRe2ZYN+X0u2uKd6wNd
QMVO1imRhStFlGKG+hhbfyqw6QWVB403Ge4r/+++YyoKz7sTIwdxt3ys/USshpbqi/ifpSd8xtSd
6jx/F247BnIpqsc1X0l9B336Q0Qnx/cCkquTNUNHyxKQrf4lDUDrvPdA+vLDgVLmLI+NN0a2HDnE
mVSmVKy+go27/cic4a5UiyJmpHUODxsXPemwHfhXMnQIQmEsNwtnyRMd7eDqqVlQE8WYQl4bhB/a
QtpCD0LNPr2Lhz1VZVNhkwgeFT3Adtf+3B/aeNXjUmZ9JVc9KWr2yZY6L6wSH1TvRfIgmHVLbtfB
IYno5rI/aCpEn4ym8RXOOTduFsm+HzYbvpbDAY3DSGwQdmZyxZ77HHBHgsCLC6/OJuqfS3JdfTE6
BteI0/YVq2X2VLxRD020sXEkmOof4AMAknPoKJk93+Xc5y3FrGSOsDZlhNDrGrMwu+m1nnM3ZStq
97N3WURnzXbOOJHLHeUogXJwfcUWM8BGHUaYoRq0ax07SmEG1LPOybVrjVzZ4oS4dkgfIT083o5Q
d6yRVRPxUoaYSY12cApR/LtW9d0bDZgZZYuVN1D2D9ihWX961BLTzIiy8PfbXXBYHBXPawg3rcaR
lhVe9mmwBJkx5yPrSE4+djpw824JY85JUf833REnovftA6mZQfxvSWCPb6/nzA4ItWsu2W4kEF5Z
+wdreXZwZkGqJOYAmjhqvxYbn7BTvFCEusnL3uQrJEj7Vekw4JL3mLkLeFgLPhAh4jSFKGUzDWOM
ZPzKDFMdcntFJdE4165oNDOpFiPPwAUuzr3jXtKxcP5YvHUjK6WnrGTJw5mIAwdUtNTexjRdhhXI
SA9eXzuJpZWRumhU6AgY/KoWVAtN4AdMtalCZhHnVeBZxoEYXT7E0IJe4Zj//igWExDA8ak7zsIp
AwsautPI9oDJm6mSgwYHdMs5k7bjzbowiyYnUkV0OI2kdkVw7efKkzeier2noK8l6plJEAXvZ3iK
37JXmpyqjBFD64N8vsCj9xFW6Ih3qFc8brEpzEMFgDqLf9qVoYhdbCEZhAmbJDJaYx3QW8ixJd/R
+2ZvHSdT2CmIDKuUZkIxHXzsiZ3n4hbrbzAwf9at+Xo/Ql/oGZF+zqSZN5Bkyc3BMWnNRZSBAf7J
7PFMeDlhIyknrXxY5hkmH//wjOqEhi6rl1qTgrplUyQh3GMW6nKSw+Hz4ZLEvS5pNiCGDC/85uVj
MPCC3bD31yRsAFrW9E3C315ORCdlfg/7RMd6YjEYrdD2DY4Y4O/DaBN2t+l21oWKDf9VbMZPt06p
S64o5gebLvmeHaz7qppCJWTvZaZ1cUkTvv1Aww4AkkCkVycRTbXtNIRoM+ZflhfZBXcvq7H3HKYR
ZsYIUrklj+Q/RkuQJO6w8Kb5IT9Uj0de5J58VFaBFlcieb+BCumgdmh7b1y4HTqx/yHR0pkdsv0o
GD7VTwROTTTCcGxOlTe4PLttjCzwW5DowXX4AOKAd4eaGjEZTCgNoV74udJyjgXgknelpaCYQLir
6GadIsZYy1w5n3qfXhbfYcvxZyD9amvVpFdKw5iYe53L+QIQoSybpTunmECaGHB2AiTAG7k3hqx/
vhJeRgvONjqiZ4T0RCy5fyBIaO8A92Jchf1BDMMixWrs/zl+EZRAz39pgPwjglWkRvjucPG3h7e7
hd6WSCLstZ4nX3zfNiIsodKh6CpQl5N0XB8flL7efSmNDBz5fymag10cUmXgrx+GJ76gn7Ri2M1/
PKjQ86yBMPqekLKXtMm8Mp3sixdgEmRpsTpQDM6y5x4JYzTLmVeNlM5f0q6xv53/nOjVor0gaVwx
GVnfMKiA6SCZJGCAJO/9vJwTReHDqnBVJzr766dn/VsyQIhkmtgh2z+qzVLmiRXJPSrBzEFjZfFG
cpL4LBeUM6Q3PbOYMKrdRWGJx0JQRKMuzd03ExuMm4D1kEkSPzmTgQc79iRhOQvWR2jMjW4eCxnJ
31ULTgU3k/BNufr2lXgK6GrPcVt9nvufAN3y7rpT9q3QuLs351OCc5s77X6xUEdsxuMK2I0reV3m
KXuEJHgrs4rD7852/hP7Q7Jm7q5SOuXxKGO+SD2dGPkvDWe1iwwNBYoBY6qfeII/Kae96YcxSZqI
CiFLPJswohjkYk+RaVXHljGwO0E0+ZeD7llSEh1iVzqAYfpA7p/F0Rz+QgHJXXfPNfedhcJuNyDi
rrptUpd/cZmuaJyWs58o0VbXN4+6ZW+qIuBWGRpF9hqMQy371G4bmztG/3gntTVu3N2zPy2TZbJN
kNhr6rhYK0VbCApZx2ARf3L5wjYEi7zwsLWzqCfUlBL2bDopfN8OkqMXwJpx98SBOQ6AAXtj2FoB
5meB32ie4nvUOe7fJplGjQXLLXmKQzEOsc5G6cmqvG/Ie0hRkYaRbhKygBgnkZY+axsnbXOMvkR3
3OlmGtFI0acB11KLXwpqIgjgOeu4paQEffbfUgSQm4dTJ3Aj3agpN5dqwQyrVLGZNgOgjRu9+uZQ
aLf2zxeof2/6AOxMqU00xjoKFvzGnqBfYh4xTGc80eREOvkKkJfiwGiNjWnSsa6/spCW//oTd9WC
aG2hEb8ycZR+iHrDB6uwC/h14eZRn/Fl6/BpLpT2sDerKu0t0AZyzFrEek0o333EaG/c8mJ/Gr9a
BVS3ELG9LC/k4FddxaE7yGS9jOh4XD23X8xArNBeeZpHBE8fiJ7IFqNZBeUkT8hs9aHYNI4Yghme
1CzyjZpZTVr4Sb7gghUABo+ceaYoRu3691xXMkQh9xTsFliqy819PJu8SJWK72ASpwTsi3bL1WA9
JZOL+g8owqY6aOY1MZ/jXjBi7VahazcgAasNL9JmsRSUmLaIYMgYnG9sbEVExERe3ARJBljCoRLC
4c7wda5+8bdaTfjP7ncqVfWVIo8exDNixhc/1m865OCZ2lqeJDXAkNQdE/y3kAqF6H+Df/GCBvWf
OICljI2Di3Eahr2WMSacay7GAw1b0kKsZh1pK2rdy4Fou2sepdFdf0qnMdT5/n1ho/0xs4Ra24/H
DXAYfCUBg4NGtF1Qamb+ymBOjs+ls9/dKlG9L7nfN7OQtzrVYg0kO08A/KnBz5vVCGBFm6Z+mWx2
Bn/ANyqLa9RBxC4SIb85qc5TxLKnVfHhRQqk0VwaM+6NJy9OMBN+yr6lOWcyjvO7Xr/UiY/wJekH
T0m+IiFGejrNZNlEEVVH433FGpe6gX25CfNf0erAz7o3PhytL2nwzYJFm/rPLKESxFjvGD4CUDUY
ehPR1kcBYTYtiEp+1GdsUXzQm19nevAY7UeZitGKFOcPjL282X4spZYz1D7QJVRJQv1H1acAnNIk
Te3rGLrpE7jVRFh1vac/9jgjjH1F1zgiUEmt7YKPal3ULoZRLvLDgR638/BjXOWuicOjSA8wZznE
mn/6qGuBLm9elTN3i/KW0BBPyM6cy389lMOF+4KXiSDFGyV+hPYMQPaavn4CyUuLQEnTbvwoKd/+
05N7NvRoT/Haao5ZB+12cGveA0DI27I91FnQtKlUQnY5XxJ+SmLb+WSsSh+5eUYfyE2oiIrJEzXm
Puq4XbfEWg71bABGg/AVPG8F0iADrlTOCo/aZWAn4QDKJGNsJMY7rlAQs6yML+ppa8kiQOxJzXSQ
syBTBA7y4CWNfKo9O33o3au56RjdMH2PYzP4FIMyOOndqZCdApP5S9A6xQp4icgbL1KfUFnTR0hW
fqNA2y5N+DbEbOSQ9IuWLon0zC3chQ4+GvaZHyHQziOIKVHfHgUmD8e8WLWChUMlaoK4sAjrX1lO
VGj0JN9YU7a3KCX5wkkiHIWFdDMSWEai+SOPwyrs5VX0n0PYVQGaNKIEHqhUV9TuLQRy9j5E5NRy
3Z8wfltu39fwepZy6b4IDfzUXVzpekXNnLS4pAIa5nc5WNWUIFDg58+0QERBrb+NbrMD1ArJWjfQ
ki/LNAOstf+WMFs3YCIvn9ElMS7OY+Rr5GMLtB+BKbHYTcVcAUCMDXblrqDO1eIkypulN4CVevZQ
Zcu7cNYASymSI299kRFtcvKsq+r06w6/sSNN5JVx+JBK1YBdyze5kgJkEikKmlyeRTZSQ7xDCnHo
B37XoHnKmSBjIyMPFmLYXwwALUZmlKfR1VxJX8PqCh9CvMgWdGwkS95LBR4T/6pYMgKA3KnuNGGf
naGk8oHciwbZKEovEnMJm0YzoGRIcrJFZN5qnU+Fa8fY7FJzhpgEw4WU5zbTaTjPGkS+BBpc93EP
gImyHnNTgE9cXTBPXtU4x5fwxo5gakguWjJBdk+sVfECjFHD8AaIIezweGpYs0Qob7lwCrA8v7mo
1lhHWVe/79DAef1W8aCHORCgnUMNCe1vEbEGdprvRAAqRqduGCMUZ7pYZwmuqTn/VeHX3OIusQcw
GSphHnIrEtGSAg0el+sVvpgDCZB2fPnV4Is4wMllMrzS8cKNc3Q+dpUlh4ci1tk3XLoCF+mACRwO
jkSWBDxwYR5xdCzEyRDAQtKrObk0VbyCiHniDZLywP/hkhAoVwFp+yUMJn+cNcG02QE6xP1viw4n
pIDjuuhKCohLUozsZfXWk2Uuq1yHrsFP2E7rfe91f29Vu2Y0brsI066Xu4tLbJYJOraXqnDW7Kkq
cudpA8+cRgeRWIHIru6v/Po/ziOCsgWbcAmrkoE3hbxnjLOAWf/F7szkztCKVwrc7wXwU/nvAzS8
K6yzq7o/CJpZzPk22sa8khYHmTUq2J3uq+Ns8x3pz+RB77ataoBzA07SWwlGjpanGc6rN+6y1rGE
fRNKiqy9mwayGRs9ZV/6qyhnot9m+kl7SWgqKX1kkTGQDA+tBis+ZGBVEx5bw3veHLqjrV9Ze8rO
cOZ7oLXh8udY6PQ74AD4x62xihRsaZKUUiUk0TSe3ZAVs+nc380cMMp+VKbgUHfpj3dLvttkECjP
Wi00w/WZU6HD9CCxX2QWFhCRa327/JkHUcAOw8grWMdoXayjX6yDu+j8UEPTozdUbNUGyE+OtzpG
tYu9xXAAfv79+9iRoz9c16jZm9UIEd7VK1otTxKogiHI8lCcM+xWUrQcsmpdn5/+32RSEOeNW0Sk
zRYLTyBSsHP4p+NqS2h48dmRpHXq6uvJkL20LqBveATrBypL4kZ/SuQNz8kQlB834X4LsfkjiGj3
RmIbqJRIhSoEdFUNVkjcf1fnbsBv4dKwYor6R8i2uOZbzaCw4yyMmY4ZyT1HuaiIjO6ZvNZtlmUl
GR8Mtgm+B7puDtOfJLSqFy0gnCxO5AHnsRggwOTE9aIgXxvTEnbmj0XejD1CSaYbVQT8kbGuHnHa
FT0QFE6MeNjGLmYwB8xxfnKk7MrBH1QixJBxXn3dRuRMnWsgjScGqU3DurkX5aOAzXVWXkSLgge4
7ju1xjQzuPJdIIQD3ni0uS1mp7Q3k2qD7RWnAt6GVWbSUKxhpzaAJknYgHLWo7+r1InW5+S4/f6X
P7ruHLY7bV2xi839t2UoZHfKTEfcwhE0FxxBJwqNewXoKTtc8a7XI7plc+8DmF6BevEo5h5wP0/E
nQRGPWC+xrv9/sGyMpV3XGI3L0WuPgXZ0G2vqzGD06vxo/nPcUcZvJ0rt7XWcPlkbHW83yxt/c0R
/r2PrrZtoHJCJBsaKMXPBTtq7SBdySJo+NoZd8Lp9wRMCP+elfXKRS6rB3wD6Nn6yL+a2qwkamth
04qQvbHcjwTzrSWG2/0C6LS2Y5wpiVhsWe8LTa2+sAvGrQeYpb2FxNZonMYNO4XUbSZ+t3qBTEQP
gT/d+fJ7+VtaJkf5iLey4dXnvWYrAxC+yZD97R/5cVKgGcTWkwEw9Vs67xuPIuB1jw6j5aMdtqDG
fWpEjvRObXyWWof+dnae5F6HWQsgipc1kANSMrNHm7AnZdvVI+KUKsssvsJL34ZafmxH6dn6KBc8
OrMSpLTdNNuoKF/sodOMLn6RfeM/ID+D7rR0+yyTH+xzrt1hXe4NO7sK4o33FH2ICcIAd/qcEGKw
Y5glqX1z5EzH0dXdVe+tvsr114Xx2CKasHUM+5I575u1jprc+Ny+zazRJRZmx2cGXxuG9Q+CfziX
YEixqTaDcdTyUg2s5WTA4sNByXxaxwB765PxIQJ0fDNkn62xp63uF9MWw4C9FI/ulEgYECo+XMsK
IoIYcULarmVsRKLfDJ77WH0kCw/AF+uVzparE2o+K+Qj+vt4MHI9TGP6HuJz8M5YiILmOFFZxew6
Ej3nFpKLazPhVedYJ7fETk/u0wI6eF2h7WTXqc2fWd28n0bLZ+jhtaR13eBZ5LUBskyCRsf6hnuT
bm+XxKLjynHKgJZoD/V5g7P4F8THuKJQiSPmKuqEBVT5dQRcfyouBmq80vnZzebN5/OcNoHX1XpT
+zT+Lndar9ckPeJ7DMxo9zIGIMuMjRHsAY8If6rdal8FsZlPuG1FzAlF1w2m0DpPdjQyMFBQvOn5
aCghBHpzNrRf0iWk0o/WfSOI4+OOkoHEVj43ag08A8q7c9xth8ksCYObhOUtUHjMs1bH02yo2Bea
uCM2OQEsGPwNF2rBtydoYZqLYiU1t+VunldEWQ+Ggr2l8W07ygZAgx7AgxwPlWY0g1yh9wct0JaH
0SJ2fblCnb1TQlGScUcBg1QeNgW7e4o4trHW8FcYbiBvDVHguDfKQ8ryEZwgclpfH2YQLqVtC7HP
um5eqsY9FBMmWWw/Ynz/PDMv94qiUnAJEVMl/cddLtAlv59mlN/OwIt5+r48nf9Zcqu+cW8U67ZS
9i+ZNfyBaSwQiHs66EHH7upk24O+LxlIswp+GMPdUdcR7SyXGS8WvE/zKdxCS6BaQhE2bUD7rgMD
Z8ZSOWnDg7stPhpSZwbV4V2hOmzGW+zZDqkESzmsHKL6tlhVbqb3csSQZR08UVpMXNn+C4h60wq4
iFI+cl7xqxFIc3kVamn2UHlupSvgRm4J3xTa7lK+dV9OiMiNOQhQfXfsfJo9I4eQDRbNdB5E62Vs
ZfY/h8Ul2GkPhzJorUKxmGb12LoTsDs1JiekkvqcMjN1OCzsznXg6dm+xyyVdNSI9ggtZo/i0iJ4
xbU+5ZtYLpACZR9r7TJF1uPaWdvzm9MtaL6LOtL0Q5RgEhIBtILqkAMu1km5BzUvSaoeeRkQyreJ
xnv0BOZsXuJs4XQyh0FpSSIsjmVFdFr8w0wCFB1botYJY84J2rWZs69gsJLtuIopXN3At9OfWCR7
UYME0NE1k4J55lLYKTFmEG62t8Q6YJyIejNGXqKfBXd3NPTSewK1sVApGHy4go1RBZNXVQFHUGrN
ARoPnu3Ep5gv1WQjhUq94OpaeUV90zRG1ZXhQ/VQLMBxdofF+6u1xy126fksLlUJbD7Ol8s60Nki
49pN61n21AFrbRE6733BKm2Af0Im9Xr3veqUauyypz1p2Z4l7jrfCPhndizPG9kIDHRD2JBZKRIT
tRyLBg5226OKb4X6uYFjTPMDu0lByQcZ+y7o85wByv5YTEQmQxMds0m5uhBq1aC+r1r5lxcI+TiZ
ymCQk04AFTYw8azlFv7CXe1TVMVMAAju72ocV/RMSqkUyUz1zStHwA2jWpHJ9IcuDtNZwdHiurrV
mKWG6Eb12GCshwjslwcLvsFzUlnEaWO2UXGZKjjIO7wBTD1whmROI4JibCQaQNUMd23pmRZ7KJ3x
lQRRb9v1UvUWfFX3FFig2J1ku4f9NeI1WFqBrZB6WZZwuAHhBIDKd657Xr6sK81d3iXhQHJ1pMst
X/Qk92fwbbrYwewx7SrEmM5oVK0rTPCRwx6Pf7kuRUGHxJG3MuEPd5e0Cp8OihYxYOwZu6B0YT9h
f+11taDfo1AVcLg2iGcBDm0zgZO4R6W88gdLgomGJ91f1nxXe7LAKCIOeJKgdWCCQQeq+dCY5Z/e
aA0MSWDOpGkjs+6G2KeVIOdT5ueMAjJTbMkY8N3aYaXWak+80NE1fZxVli4WuzJ37R7bLWIClrFl
585FVWa7dQcBKFm/UYdcS2ANOFFPWZUnpoPa6cY8UEb93oryX+TNO/B7JOWjEPLzPaaumnDFfVl5
40FnCik8/vmK6DNisqAGU8oslSQwSXrIVWrdPmEESWphha2i5LQnmFswzDPWg0WpCsFxHYCpHgVu
/VyndfEu/RoI207Mpn29xCe/YBGltGQ3bR3zH9Wxg+JhZH7vuhMX14+8WyQOAe0szJqZUHNID5pQ
pX9ZIGn/AISiXZrTLusQltq6U7YSbYELXVZQQMEYGNMWLs3cGFTGSYCcJL3RuUtVol6qAY/5Tyuu
r79eU4ldnZWRVd91gfZn5d9JMWJRUHevn7CD2lV5TOk4qZ1V8QeyvTCCB4fpaOngxB8P0CG9vGEV
SKoJoYiBjxq892F5ZlLqNGE2SXM6mBFfF7Bf3nc51Fa0AKd2qL0j7wdzCL7TGIjY7GhSwBExj6rR
ibHdhE7G5YvkyQ88SyBjIBoVQilgL5xNHjvPN+bpq3XDxStINykDpS4W0sbSi6BSI9fuX29nfYHr
E9F5JYYzcgehWS0hw/e5OmDRawbUR1X1d0RhyT67WGyAjHU7u3nS8FnJqp3jGMDlm7JkJValAPOS
t2Hp+7EfPPX5zbEViVzR0Q4LIYepfwyXQx+fqgXNX4GOC9wiWLNoFFnRmzqMo3icrDJ33cTNEERd
VgVhCWaUCwBFawR5x+oAhbsl0/KuWNkCybpw+Di0ZBy+uhBjkX2xssd+sCLZVKcFvCrcMdqZOEn9
oqkNKDJfH0KuGo5VxyUaEbBvpJAXMbu1s6XKsuEGXD6Xx45X9SZurHHVDqjkqFjQcRsrPA8ZHPLi
l/ux6L9dYcozpqLzmW6bSAHY/Tq8+z6T+3OJ0Sokqtrlc9wjFAxnPx2KLgho/Raa9cCK6XGAIKKc
ajnENfYbnpRr17RXT/2YpRCPdt7Fw+KtERPWNKqBzxKIAKRb255i9hAhLqpkLRcljh6X1jgiD1py
Jnrte2QWFK8xqXdKSjcX7UZv/P1dWtOiaiP1+9XXQAgKazMG0ftOfcDNyW11tNDWw3gtO+S+uEp1
vfsRuX9I9fXteHLBfkM9KMgTpB2oXomR/hqGY3bfUZV28Mc3wNckTs0EMZpT6YfMdQjVjtKAfloM
M8NaBqHVQbXLGzb5qnY92QoUd8RbKAljmT6z0FYvTAbFrw9Wrgw1DSKogNATfmu7t7BynSPfPk+i
UAzR1iMcsVYxexPn04Ztor5s4Ey75hqB9Nn/pnhKZnRl30GCNjyslHKabuvmQqsCoCmFzm2xYa+t
naNZdS56XKek5cnoAURuUCqbhIeltRb2ahKezEVJaVXCtOPXb8AEltgqEXdEAbjqy+E8FD+UO08Y
NbfvSfd/PRq2NIO34YwX9SwmhGRESCjjhpQtpmH6XI4hqALEDE58hkeUnrKytjcMa3I85c6CchWq
kngiFVOuHNI5wQE8xjOIsK/AkNRuLFa1wyu3eSvI9+mQgABNMc5AJ8IQ2R4UdylMCk0rxCShI8+O
T3s4v6tshhvJRVHl16cMB6HZGIVajGL6udXQcQxArB253woK/76wy+aVr4fC7843bgc6Xog1gLwA
p8f/880ZzxAFM/0re0FhzVZFWJBTQxWjwque0Y/X5RXqf2GyvUlSjiLDS38NU2fDQ7R/6VhUiHkt
ZWRmnbFs3AbuROek63gL+eEb+An5wBOpOKaKI40O28IyraaBe9eHKOx6TMi9zDgxuUizoEFJDA0c
IWvLRktF2pLefBV9+ABwbnZS395QVjP0JXwj/EwKAfp7AOdQof0mMQcmU5fQGQVTrwOWFyZR9Y6l
zXeA/yA3X5XegiL6N1ZoOMQ5Z5jmMKaE+JM0OVTzsS7UynVopWJawR2rqCUFlYn35b241bgwPWTG
O09tKTdkCwBELkg7QS9gGXUiEdUG/ftaoFAkqI0EzRJ1H2K6fh7ePbRMbuSD221wz/t+6nycQTpt
fF0T5pB+yRhZlrJTv8p6b1GcAbvZ/yFTsGUoHarMkDy/g6uqE3m0t0693ygGaxm4cTKSAFz40Otd
75kcuR4wJUklPeKyqqsifz9hKStU9viXIAfzMV8eR9NvgG1pw3e1fqlb66RcGVSDPQ30FiaDUx6i
/00ayVFEdGYiQueUCLJp01tTpj1MJ6YJMLXiuTzAWuqLj2vHpuvmctQdyeoUjXQpvzTxOT0ge94o
6g9WOnYH7MxJ6F+aBJ1OdB80i3yjARg6/7yNmLxhyaiVxmeo0c28zHM3wcLiIARHmo5wkxR4OblR
Hazlt0aLctT92qG4QJfW4ByS+SuJk0/3tXa7PnFtISglOKHLLe2nvvvSNni/zVzAcIr8L/lWFF/U
/zneXUv2MdjNOaRZv5nst59Vk6vlbkz5GJAYSSU9wFpTSKO3Rzc7a4x1wAHS5L4gq8kIJvLLEZJG
N1ZPgLYkHkI0uUvIf0YiUeV0iYb0Z93df1trAEK5rxKZiEkpQQgtoIjXtYpQF/NvBlYecEyVaNgO
2ntFVPU8jRk7rMRlGPGpv++TdNONUBzPswSxDSTM9E9AnpR8NQ9sBEseZIWjrTjtDuciNPbfr8cp
pRP5FpZElUfYe5GXvJdM4UOR+4z+hkkQ9STVfj1awCmxsqEphzbMJMZa1Dh/8ethaZCfIrIUciCJ
mPx6Z18KVsAxAWemR0Z46Zsh+u5LhC5rqnMwMN/4+zOmM1gIiG/5O0U3PN3AnC0Kk7TsRRW9LUd6
EeF2HLNw/ew6rjpNqOOT5DTODt3STWKnuLJQJd012tmhMbrP+X03NCpks7J5s10AwNCnhrWpV4eu
CJEArK/dwL8NrGiNbeYP4LaYV1jx8+AyLbw7IBpnxJ/JkUVFnZ4ZvKH8+JXoWIVZvHsjs6tW0MwA
d53HFH6rrJ8ElmwlaGoMAw6aqxQAN2w/qJVYxyg1jIEqEeFJPENDznFhJPXH5+U070qO/15C3dtn
/44ML2qoicaSC20HN21X6fYUxicnC5fJxk0FKIX166nm1n3fIttmHBDeyxy9L2vYLG/Ml2ET/xhU
ov2BgRUdl14PgRg+3RMwsqElX36fPT84u1108+v94iCg7XWbveMAq+YF61SNXZ3X+cDyq9ZxIlQ7
+JnBCt7kQ/VPuuEB5n0RHyOA89pPuTfhd0n2TrALLXQQXUkbKQZ89yV1KvmOBo26sWum7ed0VQhH
GetPZ0oSJ+6T7EpLP2fER3wrxX70egcZF8RIUa9tPi9KuLEZvlU82CHWymn32X6j6JIQLQaokKMY
SuuAVyOgghd4n6PIXXDHZ1FBH+vWggPo6KCtyIYmYjGIw7ny+sGrGvN4y69wxTqWxHAh5fDThrB4
iicUm+lsOhv5Fv5MFwxyT6vhVckeyf556jNcke0wpLXH/Cq1yfyj468burY/KZHP5v9olnKItDA5
P2ytoEoqhD4TenlFJEGgk6NckEaF6Vxk6K94CrRji122a4ufDKRPyNNuQE8DA2N3pBmNnhseG2gk
w1ai6VTDA1r24Z3b3BZeQTnWTTCMc+4d1zvF+4yZkmnQm+St0ufFfB8RgLH8YplURq+4wl5U7T/h
EP4yDaGAddQgCTv8nKBD29h83skZBuJcv41eryEM3HY4M+kLoKQfOdBIY/802rFgHBNagx8DP/p1
5LDmYIa8ZXklgdL8nVOvWEoPQu/Rrcp1gdtZgRThIw3KoBVl46tgYFucnIAF1i5dhGjr+dg2zvVb
SQAnJmDg7VLj8y8deNa62NsKd12Mc7RzZlkqOsCysmHqZPy7oyy7+HcpZOkIAn0K2B1URe9CiIx1
Ai/PpNBfRoGRVU1GX/lZMtWcw+kpzoXEoAAxJ37t403hSDKFkVfUDPWjSkU/yLamEhGrH+F2rd6x
eKNDPKQroerg/GqxlVwSqjXgmuKkpB4ispazyCltu5TYGUlY7s1YBAxCTOcjs0RpFN+/IlRoQrKI
p6hROqu01/ETM4rGFAxmhlvdxV4EwcPp2noNzRaRPNcysHxTYL5s+GR5vq8KqkDZBtKqTMW3qeiZ
Ih5k/kxUx0eC32Yp9pd9nPOEUJyg+OJ7NOaAxiudlp5ohCKO054BMJ2ulUgHHuW2srIuML0LaBpy
C4KCNOtUwVMjXMKR8tP5flOYrZd9kzmxH/Gvs5gQy4ZwF7x9sXHiTIA68XzT8JJn2ij5gkRuG4Dy
Y2BMjuH1YnejLcsGC1mZQ1tyrmOdpj02YrnBoed6OovL5Yf863xQsD7Qf5NxmU5CujAy9AVuA+H2
Z7nh0SI5MDgt56+IGqgHiZF1mezXGZxcgbcwk9X6R/lrbsGiAxm7iPsd53z/TzL3YUf3c5ITizGz
ER24AKSebYxKSuRFDPTWRHmOR6YHr64ibLp8RjZ+R4kgQ1F9aKKVWHEwlrLTIfvAiwLAD0K/yJ6S
5fz9NYDGRcAmCdGOgOFUSzQUJz9ZL7Hu5sdbAcsIz/nqU4ozoGKdH7RS8x2dtru3YCbXX1IOZp/Z
c7JZmp40VB9WXIjgo9b26gBUbl/HWAb4TcwJrzYrDg9KHRO+8WgK3WH4sfZ6mHgoT35zXBuNCOiU
yTpzY2B5xvGvJlDIfTnfE3EsRL3Zn+xx0hk4f1j1XNhv34NBD4pgHLBOw/cJNjskR+JrXWatgXCx
Y9PDlBfbMxM7QPv8tMinoc0F7MK9JzVlDwFe4jVD2RJvXpHifD98CAiRgLwiJdgxFUYbR02abveE
6cT7XZWz02ctF5DMl/+DW04PqoywHFJNcwZ+pAGxmC7SvuMcqRR/L9UD9AMTZON2xsvIVzcJ7TLb
w8/Jbk4QMxV0vbPmiof2NAc0mdGpgz8j1FW3mDyYxUBfZrMc2BCRS+cPAyfHGC0RsU1by/hvgvdT
uXKYXPhTJg6195PkT8C7LsaWxUKV7iVZ/s08+sfKM3ads0W/i8/Tta683d2Ddh3NJjz2x3FH1kS8
Qh3t6m4JVRJg7HXv4wLVfY+reEDlrsocFqOnqXbvVWAOPdrn1wxp4ECNjFqheUbZLYloSSOG4IA8
+cFYE+2mYbUj7nM7j/4e91sHD0yq07ti6ETZJANqlLIlRdetBXuYn6II7dSu34vX1N843R7li7it
sNwcBUWiFG+6U8YVvf9xRKwCvbshHzhUnchIfYPNoDq3q8ylkPbSuNaniWJwGVYg9aBLLn6MyjTv
zFmjsUylgycitDxxGH/dmYtLe+HNdjXpAqrHSut0eMyxytfVwDFkH7m2zer2DN+zGrh/7bpnLDnz
/GEOfVE47jq/KvPmX67OhxWOkjaOP16OIxuN/1q/MOOIhLKNXgjEvCs4YPksbQjkda1pQ75zCUJE
imR7N0na8Nf6vCraPK6LzXUKbOnrPjEqYwP5JUdrLIGCHmXgerzfbQOf23nTqhDDhGoUngt2lvLM
wIYrYf7KSQYgRsHQAKUyd2G2lQ2HiF4Qpr8nOYwm4BlZFsH7aU+1kVI1n4AIh0xkzgQoPWuI++g4
ynVZv2keIrH5PgWcw2oUqAyYVVdiGT/pUH9rbCLTs65jeENjRlFtDUiUg2l2jqIAaTqtnGzQa9ST
zfuWp5pVmhvo/ckb3KJQIhusnqXyGfR7j1v3ks7MUoyZzn/fzjSpu22ht2eaonYXmlyBAv01VLIP
54ttly4cOfkGTLCEs8gVFHnASoATc416J10kLAXc8MWB1J1MStCGkokQrB9f5AvDM8gyIEpaUrSb
OB9YZpQwnMkrmBUU8KCihrgrSMJYwakHqGeZbEmkP7XMiWOKwFgzUes3jbQskjFSiGOJz35dWvjV
IaQYm208p8BAsABkKnjPweljE77rp4/ujSHQNWe3poE3pmUBOoNpIfTZ6URpcyPG65KsbMDY8OmY
KPJ+GGC74gP0pMqcZag5x5VDIEqDyzMuf6xQgI2+E9525ZAinbxAKJ2SYtf0FSndieRBP11mtXed
fNwENcKXjYOepjl2JqTRe2HFP2uakM92Ec2VR0Wau5PgntiR1QtxziJLn2wbaEm5EZVSYAIRSDJN
nYgiPAyILtpxuUONwMJyazbRMOQYHMfk9tPZ00OdT+3klGbr7nLYvF37GPv+ikH8zVnEwHUP4aeb
rflHYJjiu4s4MRmc+WUJ7NMuWStaesnLHWB4Dznt11WAkwXXr9filTJRlUUuKftYP7VjvnnVS1CH
+AZssKsIay8NVzZtkseQQj4XeUzdzMKmOuurY8SvR76u+LqhlIDHMY9PJm8IdevdZ/b/NyE3r2yA
CFXVi4kgcLA75DUWcu9e7z2VWBlxowuhzf8SiHWo/3ZfrSyayuEluiNQr1Q+xsqVsD8Wwbv7Or1v
E+F2ZimKTRRFYSAE/NpDxPKrRwOwTcCYuHC4FMtQaMx6MMHkAq4kHzqVby3r7bIHLi99EOW0vbZ3
cR2eSY3gyuQBYw11ll1eAzS+B4KbEHsNypQ3HonSyCgGxR2orINo8qRbxjCmR5fWAUTTF/o/BaBm
+Khkz5RdJvCGMzYaQX19+h9xSydCw76yEicaVycsSllgMdbAmUyFJfxy7sWPYSW+EWb/treyYBWi
oT/yfL+As6+hszsLhuZEwK72ICkiQDkb6saRbktSkcUuIfzJ1ALwqRIzIqK5WceP9D09FhnL/2Vi
YUn/eicAguIHeuHb64lNgnug1S8wnaXuNsaH7qAydU6LgHO50zxKJ97Z+QVWoP+MtCwrqGKWRD86
i7ucnkHkadQxYSPqUxAAGzz+UqcgI1vyhaT5Mk6lmW9HV+I7DE5gVsBJKp+UtNBmCkyPKZTvPuMX
HsjVa4gLYqboJ07hENN2hB4aBb+ZhEeWiv4n+XijcDuoNLM9IwoHE5sO5IELdfM/FHiMk/2oZtQV
EQN2m3+u6WgqJlXSsycHQHEuqNnGt0UK+ucGCUaFnS6sdQb33CGwDZopBPNNavvI3/z6h/k/CuVq
2RD1o4BDdVXBFCNV1VVW+/pZt9TaCslMkTOIFsP0f57B4Tysf2ReD9gy6E3nHS546USRltCYY8tf
saAlT8j0HJfihe7C8y84472qEkw80yQsTQxFLumg6h2ps9e9mUR/og/G690LSiRNpEiuLCJkpxKx
QYkvECmmE9YFTU53FB0NlqIbqS0afn+m1vpemoqT/3iOj4UYElMPcMfuos7SiXegzxCwDw/ZrkmM
ganwX3O7pEoGPd08WqarRjMmlWDd+PNUaQPMqHFQotGwhn28PxCZ3wzQD4d2jMvUsWocQLsokwMW
3Fb8xpXn+eaYdniad+IAVuHIAL4aujTydPDhbHaEgEZK8JzNYABh+EoDfiIUajru1f1l4/8pRS+w
Nc/U1gBsfBKxkP70TGRtDNGDXq4SUNqkOzkASLYI/0ZN6DCIwuFugsNJRpQc8omdkoohqW9wz4V9
fHHZsyKesShJlzQTX/3hUxbssqIpeWYJPX//5WR6hL5qHKLOBJLeaoLXAL/8XT7bK2Ym3Qdpo7Yb
GMcMmf2tsrVTGJh09GV6AiIOd7al+KN+t27PfDWyNEckKwgeIQqs4hcwSOoV5UidpD1f6a/Fobkc
6kA2PIvnDKGgkACKE8hlg/nnCg+r4oMkwf0sdE7LV4o9XnFmufeALvW7ihDk14vFl8OmZxNX9vsJ
C1nSFL3aDkHllaB2dUlY8gZt6Tgr98qSj6OwOZKmv0bWV/xzKloqdZbQVaFpJc/670+AKC5zwlhe
Hw27rj0a+ehh8q3JKj7LlXuI4OJSSI33ohJ8n8FnCOJsvvu+ERdRASUSQ8oZ5vvTokNlwbm9kFR8
ZtG7JFuGlC96r5jhuH8oPNzXfJM1Uk5A3WjZhTw0rziXPtNZpc5r4zDoy5UQXdPqW5R6ryEglA3V
+FjJvx98USLgDckofaOUoDvVXFgbfhkRCD3+2ba3gY5sMZgQnCief/Ml6st/RJZdii36vcvA+ct6
j/+tYzbe0uAhzAgeiyo5QyWCjtvuyL0BbLYFOxug/6FawFq0rzOrJLqU/nstnIgbcKeCoFF7w27V
MVOPYNxSYNXMMgP/3Bh+a/wCir9aYJdmXCE1LTIpOoXRm22xpCo4QgCTrwkBchcNIEFSdnc7e12E
BGj5dRVs6KTxJ+Qphdgqx8XKqu9Odq0eX0QgG1fbiJUDIxyng13wuslVpT3ohp44wKNA41lPJjet
b3b3Jxovgh6ZzugPlAleuBUBTGscm13BSJTVMMwav3sdbqP3luN2NoIAxQNQb1SMvQhBbv63LLrm
uJJ93owakH4yRgXXH2ukjzekcicB3M9GY/QEnwOn+Ewslmd1Ag6FNg0buho2JTbgWBd04ypMzldl
tCBZNJktklCyzfMuR0DWZJKCikC2V0JdPiQc9Kt/zcMTS2m1VsJCMjbL7kW1tkuX/m2SIosNF7m+
YqGHTeB/eBvxXaq6oNKWcuSsEBynr2VlzTBDi9jqZAl7XPwZxp4pr7Y/TZHoWckz017F06fdblw2
QNbrdxQIU4n7T9OYIzHLIM/Mk2mI6va7gUgievOaD+IlH5bbHqDEGCFLnRdDS6gOv30Vy9v3KmBa
eWfIBO12a7UEllrLkXL22rv92fw2SU0Tp8gu2Aj+vJIx36gNAYoySTuMXI9dW+cPYCGbYfn4cnJD
Z3FGtpYpYf+eN0u8lTGGtoHq8LsAZ6HL/dsT3dgXll04lBiN75vtoWC//f1tmjMlHMsR9p+T3Oof
7Y7POKf2bJRvwrOtkSGAbhusU1lw6IcG0Mh2+Rtw6wLQ70XNtnXJFJ55S6+k2Fu30M1axqq3AkJX
zMjYHennWdC2yW61MgUgw8qOphc6VGNytw1U1BNQqYIEFBCK39PQEst5ewkLt+Qk3PsNMiDR1uHf
VJgxg+wvL7qEbJOPTwHHeTZVim6sR3X4OQdD7TlBkIgHU9+3l8qmr21VIPwVTqg0+VaZnZesXwJm
Nr1zMMPtC7+svx6joz/pweD1S3gAVd4Dau2Bg25Dgayz/QVQgCGqlEiOhjoO5WgBq2jwRoR9WNW8
foEw/5xV/QfptHDV9D8HzOoyprUcRwpws+akrZltZW+JDfx4PYgQs6mpS9jgVoD+R3H+KxyunPp6
HrMImc+kdad6HplRFQHTZ+r95QgdFasub9rsVRU1ZROWHxHho5TfgwMhGhD7pc8VZmLLTcdZBDgG
/Y+HwuKNrrdpB1C6dwcPadLiFEBWZ2A9hNR48giEjg6v8+ct2O+3Yhv8BY8B3awmSFSjOOsxhB7z
HVa+etXw4r9NNKi3UQzmHztdZ5H/HlzEapB9+MvOtdEel6eMjnqH14OeaZQi5RBpSQGUiKMqOMXS
15KUsrpSesmAOJvv1A/n3oGlO/Y6/mS5Z6xLzLs3iGUGsfhnwqF9IERhpnHXVUFYDyNXkPzKDbPu
Ck4ohz23bLk86nk3XhRdmPjou7186zQIVRoIWOeIT2r+mZ3Tf8B/dghLZmbqOvWD9kCZAR207Sqe
29XuD4QsOntkOOSAnqzPZjlaApY7OxT+246ub5dcjQ9EdgAfskVb3eTQ0SumhvM8r6Yncy6ho3UF
0HUnR68GKpLMyaW0HdRNpmKi1/S6ix6ye4z7sBnvpOcwr1b625vis0NtBEIuGUvczCsb+h4bW8gt
7NZDb1LpyxVV9AxbCXVD9YyP9RyQTnv7hk0MS1DPt0qHPp/IakZdKt6H/QeAItB22PHGcSb7ta9G
GoGOQoxja+AmBvhh6ixVMlC/N+d7sKuSw6FfRXfaG/xTsBHRXPFrSiu+/0gUyXHQnyehCBNpf8NH
csLf8NscHvReCl8nhgJNENpUwRCmr2RgHQit5TBs3oSy0jvtzKGCtysBjGno7i9lpD2eFqx5ovJJ
14KOIRDEyBdZBAZqM5KzIkqxiFiak43fSu6FSheCJ51WuN9ifw/kO48EK4z+ZHysAssjUMKh+WxT
QGKpB5VWSfn5+6TH83TQyepcwm4Fn4sAhvwTkKiUfzYnwaV6fXKq8Mq3sPHuzbAegrIi/jBRB7AZ
BceKqHm9c7amu2FucAgEj6Rgd63Jnbl9S4ONWJj0Dyd6VXN5oGqk2EBNNcCusjZ8x7TZ5MxTzCgm
8B2ObPwxtnsq1FN9L2fSXEyEib2pXX3vh86xyNV6svXBWx8y5VwK7oWhaUfXDFzSeXQL7XtztzLa
aIlGRAIrZFRcPmlw6xKpbOucC2y7L3Az7UDRvIjXb6jlhBqbD5FJuanzVm0a4swS2kTIcf/fRysH
ELD65RKdtWMgXJiPkUNydDgaMHtrRYHHF30bRMloq4E5CCVu1+xlA5gesJGwXsoaLX1nZ+R1ltlg
Nxtue36Su0QTB84vuFOI+HFwBU8BexCiqx8a0birlqnQEvxM8v+jHgn8AtEVkZcjQu7S6e+ZsihX
ii7i7cr6VqYtrmRC2Wz6H/VsZ9CYRpGxM96+oTMrlegbi9IoIviDTsWRs7tTJ4cg0KgJi+oF0MkD
Ndv3bgU1lx5NlbM/6I3UKwp7ChVPKpzNP0icNv3+K6azXGfT7q5jVVqxcErRmqWukFsnkUwr5ZX8
vA5yw2QoeKkRKFKQqxCpUa2MAKKetC7mJjvamkpe0PBO+Qys1HMZFBj0LsPhIiDvydcymNdeRjkC
ytCBW/zHi9yWhq9Ztm0ZTobcMeirAeIPYxoiYnTI4TEE4IvtdLb5I6uDCfsKGqOxzUW5GEWsxh45
5L5tj98mjR3ss6XP+YNHrXNnHTUTmC3vUGDmJufT34GHM42sCSiHiJzJrO7/dV/yKXRGqiWWfKRN
qsBBhNn3z4BR7tT5wDO6RG9TJhlf5JwtvFvUYi8NYdmkcAfOM25LyO4pT4Ff2Er+UCGN3kdLkcDe
+TVNuYYDdBsfIQOYjE+oip9ElXp9c7yG7p/9Zd36P2EyeIrIL0y+qSWs/YjDxWdl61+ZYVasTUGQ
xIE2n6QHCGaE/jqBGdIgVBiZMr9o4pnGLiiiiXugGrkt6UtXz35ZN/zOxzQPblkah1J3v0J6Gs9K
DxKNq3lwVvL87wX4M1KcnAnfj0YZ5RH+MysOE7suN+8/z8t4CpCloqzjNZECZmniD9LQTYJ8YtqI
0v4D2zQcyb0KbV6cVVJl+r8wltq+uFc/9ntYHW/wRumf5jP/HCGQ2vnX8o9slcW+lrcBegGjA0Kb
2gHzL53MctnCppAvgwMEXdn2jModgR8rO9SFSs0EWG27/Sy+xWKed65wfDxnjc7moHRXeMVn8P3j
eMl/sH821dINjN4IbTMRjHdy+MlzLd+VpM7Y/z0JqcbVzQZSqFPZHC/8jrROIOLTb326EGyBpKtZ
XJH8LDEimaXoXPFJAqpuaDbriXNmBHZ2FJo331uGC1TriGMOErrxWM60NaKdOB1yvAVmfNiQ/hnD
5o5dlVR1T3ORc2gg2r44nEmKBzL5xN6M1YmtCPO6lb7RQrtWpcqODDIN5OeFznyDG0nlaJDHwlnC
t+q2dgGv0GVYHKT+nyJeM2iIx8QhyOtD9YxuyH/a8W+WUxz8i7Gnaf4sG8W/WHOxywhO+JGNDas6
I4NPNCNwUt2oFaSHdKLNwFoFwmhfjsHQnOz9OI8SHwvXtxmiXqXg70r3OlHcdwKLHMNhMMb7QRwS
uC8NbrqQJGiLUWRye5WSR2TLCesBU+Dg4881lUNfOKg0iUuBzG8pBFHecOayppAZHrt/jKzKGdNM
H3UWGejj2M0FR3GZtVppfd7JQqgifKPMzB84TaJoWTngjXMHVVyjPKuiz6FMbE2C3iuNivCx20lM
bcBBjGGZUgeBglEfAA1OZ6eWJTJI+LzgwpS8+15BgguR+Itujf9C+BBY2c/sviHptWTPJDSgwnG0
2WGIKnNfbD+K7/d776tbzFOGp1qi59SUa8wEJTm8xX/AJlP5wh7JQJCEbjuETTnm/809Bj8n1UKX
mRQUb5gJClqSLMFRKUcSCLm05UiXVW1BIBikCD/65f3tuNgg9sLvlWtstnvhR3HUIIrRIKDK6ASg
4vXVOy7WAco1wwYWbYtxibjjy2wXy+YaVifTvHjc+qJNQyTXYrUK0UtJpivg5ZEbAqPS9Argy0Wy
DKvDCzYQBwq5qYKeLv6OOy04W5C33P5m8hiBjYFPGg/6AhYC5P6Ls1y4r3C8O0qUr82oX+vTDggw
g4w74cdz4rDEjWm3L71mMOZcsE5TyzWT2X0mgdd2xqu3RqDnwQFx2QgyjLLmvcmb4QRPywZcsDsH
W5xyIXC5ux8bIy7zQ2sQkkHrEW04/w7CCXt0U+gV/gSTbwNf+3+hClpeOF6QylPzqZcEu2pq/Do8
Y7wSbI5xGeMFNEcPAD8erHLyxGmZFnaB449gUR5eqrv+KJ/ttmdbWFdYCtiOAQ49n+H1bHfU2jmH
HA7IZvOXufn6iB0Q3DB9jhXpsINJZ4/BpjWmnofUH4L1zEqVgRbfvrLC+E30z144EuKTNdvmpzLP
z/ElaNBJktY4p6P0FNGujkGKd3P05x79Gl9dORwhZU6mAOVd2c9pbz/QlER9VZqm5i69UzA/T+m7
jOSeCZfsXjQJTLXhuQ2OyXJonkIY1OSPDvvf8HRCf94jGmUYvSL6QlMO8tvWVaLGmhxKaTSqpN/T
JiQk6sgqnOZzR72lEIljb7MsEUOywolNobWsVeELtgWFFwI35GBV9C0V3sT0CZU8GeuQ8ZLgXDs9
7qk5gto9ySGbYaEjzU/BowaokWGBysqsadrTGyZL3fVtC5Fg2RnhDPqVtKsC7U54uBY2YJgTQaAJ
ePR3FPXlyvAIOcIGFi5uHBrRoLP4QluqTtjsVEMvMZaBuuOZb4nYDdGLup3KXUbFTN/OBp9BSup6
dGShK+g4ed9O0dQmi9k9j63pPKkDX3qFwCqL2DNGQOX62ONZuYHeG5mRRe1wkdu1VMs11EUMI4tx
YPDoYygLU8fgczbxYw3TZwMhzzaUAfMD1QlnhL/0MpoIRAS7EDkW85P5OnGtIxSrLx/qOlHKJAMt
VFWL5n3g97BUNKvk5RuOCbmsCMQZND75xwbJVS/jahN3iMtxt8tt4RRy73zc7rbRVj/QJBOqXCmb
fEVAWJD74eXwxEX10g0eXF9x6LnV4XuY5xzXI8IYF79EfBz3tAVPYRh3WVFfgOd1YIWo9tUhrouI
9P0v20Xrlx8HzVZX0RvEkHfq5+UcGPrbHesHoplzM1v5GwImBcgYmF0KQUdzWDUijAd3jiGgp8fp
2TXkIYNbiPPfMinOrUR3SGhu7jWVNhTaxE69ehgGg53PYdxqUKkXS40xqHa78UoufMcS95tHOcBN
Mh2bv7WILJ1QJ93T5Y0ssRUd4mRaRuFmMM0fX9xKNid8eAck9kTrytAyeiSHVYXPzyD6j0L40eP0
OQhkgwr+jVQ/oiChFrKQzX6AWoqMEOyJ30pN6Ta0TqehtAsjLJFeHDShMn3K2Xc+7Hv0wdJ8pv0+
tFYsj0rEVcL6pg3yYsVO46MgYqnnApy9gX8U/w6byHuT8E/EY5ZQJjFliuDveLwZtlCrZ7bGV31w
WokDGVm/4MTx9yBlqSMh6zwVWCLcvkEtcOvynQfd69LLm94wxhfBFj0rE0CNNeNM7vMRPiLXRSLj
3YpJxmxdu4jCPuDG7pNQP8hbZIse6s+1LAd1jJDYjFZ30xSbn6YUGsbk8MZefulbh1yOARukfa6x
NLXqQG3XeqwIhR11ATHYy7gbPDArXRfQOkVJDA2eaUw7RF6vFdPgqu1hUT7hSX+9SYnzoUGn+WxO
6IMDawN5WKkjBqvHpWpS8DOgtPQhzcEBiUd9j763zBhsL+3ynH/J6CFBryhz4v7BmWfGtCA0/bkW
Ti2VtE7V5rkkKJpkRk06zCYklgzgynryhCRGCx5z97ChoyxcSdXYhWOA+2v9E46WSj51E5eFPtUr
YfB5J+PeYNsprEEBq9Nb9K6pMOrFZ6LPqYEV+ErrOnX84kTtIMRYuBr6SdREhoXPiQHNcTz7mhKc
BUEokC68XPofu9/Hy+HUFhrjRSu0IbXwCAW8xb5S6IiQTZS/0aJYdSXHx/V1PecViARXNZMpLzxN
dbGiDoa+po5CZ6haeBykh8Bgv69Tpw/p7tcBVn03TXkD6Lv863Ts3w1WTi6cUVMmTitmZAbzJzZh
V/Cl/DoM9BHD2LhIU4n5Oxc+q35A0EdjmGj9fW6tcIVOQMJeGCAcUgYOKw2CbRQyBB8aX/ROdwIo
1t/813QiwHTGPJrfqkQ3hdeVNctYveQBtqwtfG3QMw03FqgbCXr9RXSYbUshqxDbmVOVEhXFLUnz
R0lwNs6CGArOtA+nMaDPhPixHbCvxWZnFrsS6s9Rxf+qWsUiYBOy8J7Wf7U5i4930t7rLOYogu4J
EIQu+L6ruN3BVMnzyy8MKIrBP9WBrFIQDW7vfFMlneqv/BCMfgeDT7t471CDWo9PGwH8eDmvjgRr
GFUknOPE+8Yp6SK7iUcHQDU/JkicH3ravTH4tcvVkGy8zHRs+ZbfdVHWsUenvuVePmF6b50hTsbB
X4wihyPquv7UArUyOMUTwOLsvvNofp2lhORlzZuy+Tz//YOi6spiV1nsmPP2W9Q1txDcoLsxR+Fw
eTR4ZxV7VB5ULIp45dABHIxGyzz7ZacN+gcIGM22B/rmucTiv55do2wwlQUXtNQ+Q2/scCF17aom
aRaYGxhll/pfTLgdUd26hHGR7QwlbUdMuSIA6bWiCzUCr0dPBcVtskIbN6Pz/sUxqpgeHkwXcEMv
bu8kmmkKxUvr4EtHzORGuLFvMCUIIyvnP7K2NePEau7nLeh/Pm4W0P+kUw6qS2s6vaRRc6VeudpZ
vx28YjcKLoizbF07Q6p4a9/FR1OJboc7YEPJzsjOWM/ndcq/lzUsEjjvJwXQGaGmU7MBrNeK/R6o
0Bi2xsvcmY8vp2QSioIaO6GOecs7awNy9tuX5MZxAW4g2X8jqZhR1R01qWD3hjGOfgFwiSMF5sYU
TSp8kG1wuq2S2tzX5UqWYqOdSQwOTkokxUf1adEKlUy7tBjV4Dd31ZBQEgeCFEYHVG5S2w6XZynB
8HWM5L8JN1K/09qJSYM6XZLIoh6Q/ZMMZgbkLYWT32Alq1WB6lj6aYzCmxF5HVw/wnQlYSEZMPIZ
UmdSucr3HcsqJ9kEAQm9+eSEtwe8eK+VrMsivj099ZJs5thWq+OIIZzuLD7woysg1H4ADSzCAQYe
s5TVrWeT6O8muEceKZuThXchbE1jrXUjjLqjQEYcruGXJyEybHr6FIb+KdIP4vOQX+zax6j1UFyd
oJwLSE5pS+kvfAA4WkqBoKx4NaFVuRHUU7Zqat5brXlfM/XRUPZy/aqMFDRLbYJ/Iu7A8Zd7JkOl
LsWjj5yxTq5rITd7zoJw/TIPmxvPiCuxr/SeHwLOuZcpSIZzvOiUDIA7tq8RdPxtiiV6D7YXE/3j
aHcbGYG074eL+esBQvqvc3F69sZ01vQi284045DcmEA79v8FjKrxL3pJEPC8kRIht9tJXwzjRaBf
mlUk+NVprgWmietgJ5GWptdTjwQ4MTkfIBBPOJBmNzwSe/a4+FDzuh78TPki+BnEFTcyjQ2djiuw
l1jxvvPODsb9kstgo+wMIKAS/GJBBNHSVkr7HzasQgDE8quDkFgat2Lj6vTRmrW50pLLtBq9FJEH
f1V1VS7w0NHJZOWl0d7XIMvw0MPY6CQ6uCxEm/Yp3UyDXEvr/Sv438+tRXIRj9PgGqzoIKYXxjR5
RzCv4SB1L8m3L6wpBrYy9OHoMkUG9gP/fEVKkk3NyG+O0HZa0NBbqcy7cGb3n1OmsIIOuZUMgY+H
eNhFRrMCJx+sQBTp2nNjoENcE3BZhEJwclEWGyJZnDVGKxRNIpq0HCpfsHZa3YvoIjjhyoY+Y03+
NbSyig8FaO6MW4YrjTA3C6EEtA/XUXc14KBb1z6ufInlt1ta7SEy0V/pJzOV3bzSQtBAP/H6oVsl
NDFetLESEdEmVNFr39LIAIkQyUgVHCm4U2VkoGMJkRUIQ0m5wWdyGFwuNI5HfpH3ngwOqAyWxytn
KVk7bAnYNafGpYAIdEmVjALduEZ62C0BzLeiGD5vGaCdLRDeGRW93i4rbz/T9W749zbNsMN8/fub
0iSLHjZ40T9rYUGuWK+9CZuSA8vgaobwtmOBzDhSTe/aHUp6XgV3zByCPyl8akWj4Txw9qxfvhiw
wq37H+c6R9efspM7i51sJCryG+Q2566eI/DKCQDR4moLky8hUNNPACI1viygO7Fm5bEE5EW4oCac
L/b2edPUoxEbPjlu6zzr684w9XRY0LfmDJEkXbfC1sc4hk3jmY5i9L7ksl0/nccASTWk2ppIcBUJ
nXPTDfzdxMlPBi5/zOR9ol2Yze70a0NAlvU/Aq9UHJmezSpdup+2MhYkY6FSFna20Q0OdeDF2a/E
qlsrvHhXggBXfBDH6+xUF8uJWvYpexPfYFIDORd4vRjLRgL+aIcX5J7Ow33zJV7NhkgGYZ+66jk/
ZqrMagmVS7v2sE64i9by+FknA1/UGYMf/q/HorfAxjxAHzGKuirBbY37vh/lWrrbEDIwu+sOg0fK
fRk0hiCY4qpau8QPe5TtGr49MPAP8IO+krtkpbWf5hDDdnbkYnz5oN6JTchDYr0EzMFpBw3abr/t
cX4/miP8eMb2tIwavFdpkyIehCXvLThJB8+Uzi0jxBRpV5ZZRQLOS4F5DgDpfhSpDjMxNDfb0kXS
AvjwdPWu+ppmQvnshfCcg/Q2wLftdZ7LdzZYQYvhRb3nx90zSE5rhuwgr8gYHxSCqZKkrGeh/aAm
7BvRE53yu03GxOo/6voAvbK+CBEbN7LRAvA1xVIyshwmfyO/xLIyWc3/9/Uv0qYGO8wLNKMAPLcj
MNnUgt9F+tKYUYLCXK15Voo72AtEBapj4RWBXCm7ZC+0m4b39kwVCYoCdrrHbn6GuPWhsjtI+NBw
tII5dmQT4qY55KC613COhRYDoe2VWN/wfW032bcdO0cs5tTny69s3oS6PcZZEPOjjKsynnTkyG9j
PPacEdY5FRaCn9UEskmAJF+pAy/R5PAaqfQRGVXL/dehBKleLzzm498h14J5lyqjM46wjQ4Ew1N1
VcGPM3ZBWfH+9CBFKU+qbtRdomfNvc1y0blCjzQg0tdzIjGRgIcW1md5z8NfC7t0paEx55PyaOTV
UupQXbYjiacW37VfkYTYt8DNi6ilwzCo23g9FBqJJj82KSWzqZJkr3u8rCps/GDhb0HrteggZnJ9
mZXwOXKAedJ+QzidoHFOAARBCbO0dJXKfpJU199GqM6bclwOBsS+q0Y6Al2m5emXicDyHgcmC+71
llfU/wYLyAT85dvAw6c51XdeebrREAs2Qyy1FsztRRfMq66KaLG31B1GtJvQb6eRsJ2HFN7CA0iw
hW9Ie0SupFnaYWlZoqgZrRlKkjv8nBerJ2knfTcuiRmRUrO8GXHovDF54DV8hFNK51YubsbN5fun
UylaUTllmwMiZSePIbd30a2Mz3H4/VgSPwc1a/BU0EstTl9B8WcFeayVBoC/F7dleB/d43+ePfZu
IcI3c69u6+wTmBiTnOgCPWS/aPcl7iTIDwJNExDnSXZSV/6r1+CFd8u9pzUP8Z7WVWe6IO5XGM8m
so/VPJKbE8b92hy0cYRmnDM2w3IeYZeb5cF2WIT2ldFjMukjyr3cNq9miYjMXLraiGTBZVXmNq2+
GM7A0+J055y3U3n/YU/X2InFwRHVm6vmY87j8nriMVgsHdL0LPim5BKROkpE7cU8RO3n6R14Wje5
TaLAotAKdeEn8yvqSgBseTuowcw5RuDXInibPMvlsa6MKVz7QkcCpNgi6qE9xQH4AFKpWn2BeIwd
WpqIWTzBrVrZcEOEgNJtzFdEFP5jwmPVu30UT3UqpGgKZLki8wp1VMEfbGb/zQRfLp1akauJgLSh
IXV5WmBEQ0Us/3T84TPqGKx+G1LJpfc9EkBy1xkgKWCbJv61r/MUIgv8qaEz8D9wHxogFzQLKO+0
IYKad1zrwWQp9nQkqApEUYe/Q0b1wqqVCKIAxby+7z6QFqLhl/+67ShPMyPzQ8KKUSxvR5wUY+jh
kFkM/nmyAIxEgZWjry8QGdp67qI0NKX60/n41GLge4w3xYb/5PZ32fSfm31KVHwexXv9CR7N8wPU
ZgXH/W/hRIZsxUHk79PyVDfuqS6XLqNKta4fBaS97SU5EXJexpDQTsX5OaIE6oBx54oQkN4qfx4E
mf/W7lRBcozXrEkvPv/J4RTQRSLertBNyZbqvibeG6zdCz7Wxj+8vK1NFlkIcGXmBxSpXGbZjy8X
A4IeLQcoYUF5EtCxx7KzYYJn97rUwu6vqPksBNRN7XMELza/EUcuTtxHN6zf4GG/FknruN1xt1Fk
Z/8uQRit7l+qPRBuKo4YlE0jjMjniLI2kd6/qvaKtKwmx1IsTCftFByW4spy5+R9QG/J/LHPzcrq
JcRANoLBgg16PvxvMyfcVjP95ZoWRZCKuHpQ0FqwukLySGwAm9BxSLtLwtZIHYZZwsWg/IbdDyhK
zB3qjufR/bfSP7za0BRmfD/7RkNvtjxjBvBbThydIZKhoAUYxwqkmHWgPrkqNdXdqcJHkhjbCoMy
mSFH12wMgAvbBSUn9wA/kiKv3/H0sd6I7qYpnMxtpytY9IQW1j1MFlJRMgJFAgO8chRWIUxH+dMW
01SSUF09b9JxUdTJcwZoCOFc8COT7BIqwXX4lX4kA6M+34Swh7Xh7IzHyNukvgA93kLl71iK1xc0
Ms2ipnDtYX3r82Ry1eFKwJXpUGXWjgTlG3biUhcw1LqCIy4t/gQWd+f+y+Izq7zQEcgJzxLrb9M2
vhWoKartY6vrQ+rG7VnHDoC/ymcVd0cNCPWpba1CZLX2+lkMi85LICJJdU8Bv6o4oSq955VzmlrU
As4KnmcX1MRtCoN5BmK5g31mqL/J/SmSxqqaB89v3741FEfy89XROoEEN2+Nrgfnh0UJy1CydAI7
pQ7KkEBGCgD945sBOqaTpy8hBArehP1BUvmTR6GRBxjb9klnTOjdoIbASHt2U0K1++QqKxFOsSyP
zfW5OVAR6BqnQtM7M0Rv36JrtJfj3RweVz6si1f37PuxvWevpkB+r7IyqDdeIwesREz9Cg07rj6R
3xJ1XbvwfbeVcbgR6yETF/oM+vIIv/E+IYI3HvQaf5bED5OifULJklKLTofq4Nu3WJlieatObe0V
CapxYjP4hTJ8Z2XxrGyiVNh57duPhHNHr/JRpLi8R3ck0Pq76PkA1pRJXe23d3sK2+sIl60OniKU
vLjF90sJUMpsMUENk8e1eQdvtNTYz52dzEEJVq8sAf4ojz09kbSYIyGEgRKaEkrzxjDRvp2YdbQf
8r7NYKcdEpIb0g7WqmlWI35NUf8dNiU+IQqXpdOHKZgJbbXkBY6gk8Rx3r4GJT7wj0zzXPw7pwvN
YsmUPBUSVFboP0xkmsIpId0wpc4AlCOLISBX/SOh1PiRKsGLlyiyMqUamzouGBDyKWB3V948HOs5
27yL5Eh0yhq0RsYEGopuiMGxRLwudPe7COkjUuSwCjmO2KdVCbEqhtQ98oOUOH0gWFXdrpoY+B0C
R6mBLCmV924XXbIMC7XQhuEJUqPgILYFlKeqL6wPmvoerze+6LUbJUVjKzSNwM9cS/onvzR0kkwY
HNAJ+rdkVQim0JFAFjQoystf/3NYTggFq7fVHgWzm6BwbgUwz921bcpBa/apK7VUBM8T8S3qA02W
W4MXcUnV2ruocOI66EOny9APt2c9bJKbXrzCzvg4hvkwhQxZbbnYPl4vkD5UD1M7WTr7+aq8dEA6
9TCRrHRWinCN4o0lwmjQoThmR70p6ifdAUZTQRJZ8kljYqTgJWyxONfPmXALIERVA+IEIAR2UNH/
xxWMYKTSuo8PAreZllEhmp3sxTpO06d+en4RBCOveS7CzUNEuF5m0AQzLDJ2AqZC1+7dvAoIEUob
JKRxftUkLC29fyPVE/W8czQvb2/H5InpTYALMUmPhpJ7Up7pnto80p/xfscBT6xCPm+d/ms8nuq4
gEjhpaWsxB2DOrn0DGnPmHHufAV15nZtSFvJlyowP8c1DUXL3MCDiFCYlWj4feCdESzYkCphVOsR
5CPEhBr8VqxaV/TWZw2QKn/7DIUjE0RYRdXyZSG4RqVGe6X79qeDoLzxIyvHOkDaVwmWgyomnYkB
M6VtqzXN1d0QnURP5rjwCdELxa83eSnVGt0SfakKk/0l+Afw4ZUjORUZp4AMiGVHjJTnX2gNsDQF
gny/ukAWOzlWwfdZ9s01iazAycx7K4vHXz+gXQ7/Ssol2gg2BRcrG06c1r2Iyy7TUGuiCgkvXnQZ
iuVkvXr0vlDSG/4AAoRBwpF4EeorFVcqndD5XLMWSF518K7IKq6ZltRN+FM4zb7znk4Adqiw2hN5
QE1tPf9zNZIYnI3m0ZbZn8imudfODV//r11ByPSzGaAVxyL+pvFm3AfMvr/FnDGLXrHi/DwzWLDq
bC71l/M8SHnjszvAJHq0v3Z7eFSID6jExMF396zno7UXmjZUx34UBP6tJk/LXpbrBY6eV/wAToUe
5EeVyooo6wZU8zYQQ1yfiBaEKb1auUHuKAX9svg1OydWjw1BTkN118r5f6Hv6QYE65EKEWNSe9Dn
vc0o5MswI72VBkGZkC/NtOxrusR7B104v+1u7vKr0ASEfpI4xgZHxIVWBmDDeqSY7iBNTrysfZw6
nkpWz6aILDLyWGN/RAZqYrj/WrVcFdaOhuITvXjVhV9I1o3M3Kcy2+AKYMdJ/4M8M+/bkM+N3/i8
qux3Oomj4Zb5v+uOWDc2SElBaYtMmqJg+IjXXdUOVhc5/bffZ+IZdOrVkgg7Wv/Sbg11EJXlKD/o
ziCyPSllTRUXEiMtkUjmEeI85Vtf38zFjF1UBJbChaB1cJHsO1KYl025NwR9KRQsA2INpM0gdQna
k79nS7LbMewOZQWEkl55Ae4jD3PZIMFrZ9vG+AfsBfZ2vZvwCIjZlHFOhxVgPDUBl7ycRZcwZZeZ
BYT8oNh21IiUqTSYvsSjQz6ZcAkf+4yXhkQdB96f1Ri+NZkmYpvQuY2FlObQtNM4ybqtW3Sk2s6T
HNG0ZWYEEGIw9E4CLDK7pS7aMSGHboqHb0NCCGc/bTt52UU7/7a6RoCBp2gr0CVZiFyvkzSat4GS
C37pwPOC1C72CqD/PXbfF69qLIWWXcMOn0z4lpfn7SG9hhWMUSincR5Jdcb57F8/GYw4+eN11/fa
lhBRVqB3K2rIm0yBK5GyFPpW1yBZihow2/gAifu2687fbXSStpY+0OV8d0wVAV96/+O269JrfZFA
JPPY1rBW5zbFYsVXPiAaDCnyYgLDAO6HsbxOOGuxJKZEQ8DaV7R7TvIfkjEAywbT4PJaLyLkPg4a
r+7hFeTrhQGnZbDnc4PSUZSi4+fr4zjAx/Un47SvZvsrTe6xMN1of7P9IdWornFYAX9iq9sOK1mN
x0zPzNP+wjiPyekmKk18Bm3PEbIxzuu0Psw9DQvVSvBBC+n+L02l32e7VVYawzKbHxccAzB/PLfn
jtXAJzinAKQSeRX1ICSKIwnGD7nrvbDLJfdmMeMdGdpMcP6zDrHsaKZntFgGRCMY/aL4hXdNrYNa
B3hnpApQfWNvKHDeP2FxugtSaF19i4xaL3hxQcwBS+eO5i9N2a5G0a+cd15L3HaTVrWiD75DXyk0
Pki6oR9MuUJtWq0MfpjJ6OsNYCehv16LW5zhjOqXemfR6JcvwfN8Hldbp1X6cNLkL3BajShZgjbd
2odEbNxW1sEhbg+8zcsdGsGZnpDSSwyP9WMPMhOQsrnwuCClzAy3oKppFiky/irnTJ4aanqbPxeD
tM8lBaBCOtP6M9KhIaQSojw5xpc4qdlHBtJ7qSF3YVh6kamYMc1pARgIykwHZCapxaK+Hyp2kYIe
CE133S6J60HAsXSyOU90Dexmn9quhahTbAYjtwbZREgE7TlpOe0dVWr9pVdAp3N2vn+fxHp1lbPL
1fcMXwXiTGomHeISM4AW4XmrrQ+gdGYO9VOTFXndLsayD5hpdGaA9wqeVODdl3nITcGWVcpNDFrk
9ymZpkMdixxXZpOG60adi8FjiSDBbVn7F+fEml4PYsLAh5X4K6JRGE9m1sosZFpTuHu8Hf0r7B+D
wePY5ik+qYY1rMy3+7KQuOoKG5/W/hG0CvaLEC13k3I+H+YnNYekfcIZ63Iy6+3e6WDvB6rV07FZ
U9ppM443h/cnvX13g0jkDxGvO4s7W/A/DGtpWLpKdsx24QP4bARP7mOkIr1Cb47kLv2Uqoum09i0
8m05LFl8a9h0Yl2wWUm43zWW/HZEUITu2OEn2cChLuH/HNAbniCu/S6KIes876LR0JDlQZUHKW7U
Mjr+VLQVKZDxkJ9rNHyBMtdxQONTVLmcYvUYO7GcRZz5UyBqFN0ktxkIhbyjDQEH+bdDqIGa7tFJ
6mShHd9gmOlZCKBe+lDgunCWPZodl6QIrEY3HvE1iHdSnDpSm1uW2hfyqHBzcZD417ZbOgNd0frA
ODXI3aSm41kpIpgqVpi3+380DIYaJuKZVImIFaeqZB5lb3LMbFEbU4W+oqZmzN0ue7MuTiCej34d
j1F9E7if8E71UdakO3ltdBJmtX5huUQjYkNHADS439r9Eaxb3tQKxWIWrHoIQEHiJIlikbuTkgxr
mVno9vgdNLiwEu5AauHK5Xz8YhgVO6uBH6tBmjdZzniG++nOHF384sT0n04vuIQ8kW+ByLYw8AL1
+ccpuCyhyBU8bgt8Ic2rXIuUd99lxDcCbuKtS+Eym8/GuR5plD1jE0uHIYGBw4dcWZxwoQjXQ5yr
T0KVA+4t4QdFi79JHG0qyy5Tpe9uvR+IplEFEa0pILOp2yWh2NApuuDZUxoifaa0d/wPCCfkFV7h
2pP4cewVui9pDllF266uNfIeyc1UXiTMtagLpBa2C2dCet9Q+q+AsS1iNJ045JUu2OOQzdVf4oeH
7bTVxVWTAqjqsfSIehiQTFlhPuaHpeJb1GytBIKIRckEFR6um2KDsKaosDUEG2gb8KwM6y35vdkw
Jn9MSeSTND3XBLQAI+oV+JUKxKLuFzQhFQUPpU6IxK+rkIREklGxEtU4Ucbnag5C2RmJ7BoqOIeo
B0PMBw/BpTKuWfysjVvMRI30IWKbpo5eKCqmBcFGsJqhIBPErIL1hSd/GGoAO8BsknACe4SI8EsW
FwPDXxjnPKAO12DfBrawnb9+4oI5K/JNFexCRN86SrW2MJpYWrQhZRP5tu8pAjnjhK1NfqIgKO1n
B+HmBi8l10sSey7CviQwRE1Dr/I8CLZj8t042AdJ1rOeasX7sK9OyM7KhbWsyW5OAZovuquXi47K
CTLKP+v+TMH19SC8y3RVFleZV3bxAQ9arX8aPK5kjqWdM6E5vuaCD2Bd655XaJqVbZogygO7cuhV
U8YytB2+fFdOFWPyqLWYPfx9SIPFFmUu2F1289Se9JCioeaQ3Y3Cd8ViFkWLJ2ZUWhnUa2pphYXJ
7myg1SYlBwJsGMZto1ogI/Oga2Mu2tZrytGwC7PQpCFntIjHcmXcO3uDK7aJhgI5RHCKgHoMIOSI
NBXVzTUma6kSfWM3+XbVYWlbXx07vRLQWlDAR38cIWKSg9xQwFi+c6AlYSd/KF9p6fp5d239KgQ/
82TFMk3+rdgVXD1nvQHTAMCSOxGiYV2KNfWx/toTwdzd1fGQzXEFJuVvVRhWi1UXZBlwvGwtNv2l
vSlDAG3SES0it5TIgqrsloL9wSMu51DB9oXd3PX8qfUNCFhzm9HIeynNOCiIs0qP36el1nrWt9ib
cBS6qhqYTeo5hK5F88M7hUxe1WMLtLeL9QzP8yBp+7/67uOZMQixp+oxFl27yZzgQ8hmisPAR8V0
+K3DS8WhAG9I11UA5QJy0WaN7QVSe3sa5dNnrXXal5XqWUtVU4SKw3a+x3wVn89M1bLMtRHy+Q9r
NxHD9CSIe8nMHdowus/KnyS8WyfB1zGbjUSkLQFV2LYHsELA5HL13Hs0rRCyOeQSB8NlmyPrN1HM
LLGXq2HKgxhx8WpOOOg9Liy2FYVLXVOmUVzcNXmF2tZWVsUATHZBJSq0zPIwXforrjsJvNW6ft8N
o5P2T17NWft+63m3pBbO7has96yEKviC496hqtbqDkuiZvam3qKUHr1Qlp6nXLnlrLlyGoGqAn6D
LzYvYCf9j3nGqW2Zf55j4ofJ5zwhGWxDJz7a2zW2k9WSHi5l6oKq1bCIBDO85XvysTyxwmm8VsK2
g/d9om+K/O2pXEK2tszlsI763AexND/F3tAcoiFSuI4b4sHN6vE9UNo4s/a7hFqeb73yovhdBHVN
roEtxPrbSh1pC6DkBA/GLsy6nOahrle0QRNtOlgAQOMvJVnP+kAyWRzYEdqWOfIgKxmgQpFfqzVL
+xO8Cana3SA5Je+6C/cyzebGxnw4ZRFGYGF0A3F4z86rahXFW6ominkPaWwKRzmY3bcj+8zHrQWM
jBFgAB8XRXLyC+ckXX9arUeNCFH17pdg2hLmw56Xo5oS7HwXpH+iiFJ3CsiKS8Sz4QLsSSjDl+2T
uHaxy+kSMM/lUPOuQ56G/dCxsFK6E4hROGKkZZ8Ee9+6PIHApSXtqUygK7fBS9FNCMegvbeQnxxL
YH3orWxAfcG8yQPA91EuRHXZm+ft4/o+tGUvxprejTtwQu0eub01u2MKFtrIRC2pkbbE72zjRbam
GlvMHi5a6W97VGXGOcuzuy0pR3Neceo+2NvnNgu4RA8iPLuVRy9HAoHwgjFYkWeOD7UHXo42xV5T
wWnfwn87TRjJ23F2xqn/jKGlYWcos+OV5J1CdRWczUVQXvn2BVKi3y/AMAi5DF6Gn/SYE/CQZDhB
tiSYR4zEKFQU9/yHI5au2eT9GhFzc/HCcT5r02cA6O6XXdbY1KJ1ruuqltSI1S852L2wmOXglmet
TE9uz0spADsS2t6DtVEj9kWo/T7aDpNYc36uX444I/E06f1x/w9D2oqbrtk7s2zx6zCXmH/ommvA
266B21UhVOSCU3gHZzekfyX5YswwcfhLEvERj8QnO01XW+mfqy4r4oUJatqukji2ppQ4rBzSM9Yb
00vunFx08j4aCGwd2wg9bN43kV4IdcAnGkyofD6CgB0ikb5SghjkeQaf4ogxMalhfL4XSYiZBTy+
x5dHOsPXkdu8KGcP5VS4EEPubWwGXE8/h0futCIjTFnt/n14Bk1hafb/0vFgMLqnQcbjJA+C4Z9f
J8CNqgiqxJT+jD9oh1E0uNva1y8pCfEEZYIaQJZzjb0LtGC2SoBfchDaRCzAYrrrpFx7cEN4dhvU
nIaFpc1Ve0RniVDcAuxExA1Sc/dYJyGmMT4vUBSgIFZQWJBpPLlgF10e0FyStCd1acSgWiwAGsL3
2g3Zc11dvqkC9k13UzQybNEwWYblpTfVTnPOWLU2MVoNkZGBe8IyC8rtk3vkmMZcOPQjSzjG0MpA
8CxFmSO7yD3snIVXisqM7j/8zIQ5RI6qaRCqKXTRzro+Vl35ejZS7tG1KD7SQwaelM8NBr+Qi8BC
0y+S9rP1cMHNO0iSBOIalZByrXLcd12uUqEvUPsI5eerLhDBakch2f4wCcmDdnnRGyBOlqC6SpIJ
nUM4lUC7FHKL9vpLwUsoPPqP0CQH24OqkgbZta4vIfKzwtqFmCT9e0UeWCMFqA17Pd0Th+Ul+mwM
lLGww7U9fjnlO+gHnLlGcE03+txCyv43r96J1PCvpc07np37D9b7L8DO6ikBArfHNj3SBidsmnfc
FS4tDYAr4DvqfZFKrrXXCITuhkmMCyZQu3eQ7dAY215oqG2IE0PM1NatfW68tfM3vgPZapujOWU+
HVFSJhN/W11qGMKVvA34aUSe7bOyj9SqtNfVD7XVLxDMnpSnaMNOzeHjnOEKOCoqabgxrNZ2w5T7
YoBF79fXl0yXsZumTWKHVRRZwqP/0EDReQFd51WdVhABN8ELeqJ11xA4SAwGvikhQ2d9MJCu36LE
MAw7iMccTX8Ojw8DNvLb7F6hFHzNJzkhaanIBa6innUNdaOtORs/ndZXydVj8OGexp/V429zkzGd
U4pR/sHvWI1svYEgUFPxrpgfwkPBvGV6PSzlmi8x/Gm7OdGw3MnZQasYaRc8A3HwF0ZGX1HBz16Z
5Zezlsr5x5Q2D85tk+MtQFk+8uHX3l4MY4HYLrUsFXSuLoNjAPT4AVEGxpnOvHB+GC0dN3JKdvzk
IZ0/OClh4avcgfjSpLWIkMKhjwU4+cyRwRtYWHfZKKlwl6IdAN9kpKR418CIyS1HBWbGSTK2rTOv
Kn7LUda2rZ27nE8+BVFmhLbMRpAgbDtClAMTOlcLwcjwFEv0Rfmpp5YCuWaEhznGyrsAaVGrbmdT
aWQ2WIKbG2BjzUqwKiQyU3A0ZeaAD0PMDk2a8m86WORgazsBHlMfFKOmBGryCBh5bnF7rW7bu+W5
MWplP/qnHqBu7LkLEXROZ0jxyNAUZx5dNckU1HiplIg61xzg564+G7pvIzD9IRJiStCr36/tm+0j
2UjNjSNKekPjhIutVq1P7bo8iq7pvbTxIAIM+g7NkMMtm93q2HtrXQLQebf01yHYbanxWBYHMh1L
YyW7CW795TWRZKluJMCiVDC1OmL6y+y5RCf/QHoJIQDvv2YRn+vCHJiTi05U9O9JhYZlH7Uv99b/
OlVdgk4mW/U19b61oEx4KCJiaDvkMMt0ih1s1pbykaXhkgWAyk4rwzpD7NyKglwkF9nsk405JZju
hNl4FTD26g7OuvVCrTRMy/u9KFqqS18n23sO+Itk0nfw+LNea3f6VwplbiTzYZYvjYOT61n4KJ7X
GX6Xvvy16Dmpmv2XHk0SNTsvLdmVE+hRTmvcbyDdzt/nNgdT5RRmC7jPemAyTpsr44cVxdLlRf0n
ggSIg8z2eqrwg3Md8XlLWXHz0VKsjEV1ACNbVJjA2+BV5gCJXhHXwXrl3HvvBsaQnbzBSNEmaC1N
sx5JRVILz7amZrYxSfyxs6i3AZ5uJpTmarqISv+LI8NfJuvCNQVQNBsQbTy7NPqTK2mi7jpbQMsO
ReXp53CsqAlJS/mHpeInR9b8FPjBf833KfQsvfqZZNJATXgArJiTKinj+t057itfQpGxCfqHLnlo
nqRLyPKoaE0ClhYbyGpxnVnAeF4cqQr7zkoBOug0AepEv2R5SkTUEetfKQlGyonhVApaXSr66J88
a/BihaOVAH35GA5sWpmgwOVvSYrdUS2qOXlkxX5u0W8hi5Xag2EOBTF25aHRnVU8NCdq8v8l9S/b
C9uTeO5fYG1/lkNlS0FiA3ZB9mKUdNvDvUsgtf2qQSIE7W2Z0nNjRDu0kyOkl3lfvHBlV6EyILEj
3O475sYRTVAKE8IChD2j0IXIDwgEGdZzPhLouxvDWLRz7XBw97vvaeE7cN2jNAAJzbKlQCN1N5wC
ls/tAEPaDgwGS5REPxm8aOPwmNKwI6rnLUKd5ulB2KamGc/+4n/S7+GFVMPjxBbd7jgXA8kcnlLG
2JEHKHPbtJEe7u+4AmD7cqN0mHC2TybJiB86OKeSeAGaCIgTQKEGx2X6I21n9MW+6Pn4mfHVopa1
w/BDUCo1Sag/utBen0mL1vKth+Gca/R8CEYaDEW0/lmBVUrD2c268aN21rX1SgBGc4Kr9X68lz5b
hTRFVd7mRSEHyu6W7pfHl5cP5489r8rF5/flaqEBt9pKnoWGsMseRrcnna/Q6j0VuEVEv3Bczzzv
bT4EmFls5+7exmbDsA1JjKJHi9Umv60OZcBtP5juzCWbabqdArQK2uAuFey+F0zMzbw8k13leklS
EweVMpQz82+iRUUBuwF3g4KeOY1VMVXVblldIrnUQF0C0M8is7PXdxkeCGB4h/CeFZmcKc7g/GFA
Hp8b73TLcx3H+v+zgu6ObK9C61nIcy2rNl7WDefkrUy8xMz0z76sMt+O7O9bgoub/5CChUg9/quy
vjsS3ecKH5ClN3fx2i69QdiTrLIOk7NgriTNn+TAnlTfHwZ8ZavHxcFWTi4EexQDFfZU7Po4QLLC
5N17eJUCBdcrJQtOY0LTGWjlzzJLr96iY0G11LlwY+1LjZH9W2s71vqHW+bp+NuwS0PSAnpbyrrl
mtaUFXbjDk17jyxTisT6WmPC1+YD538gDzxU08RMZ/UpD3FywOOSM/d/LK7x58YtVb1uQtRasG0h
pNq9xUOFrxMtUrUuGd4JsWtOQzRr68QzVe2ZN6mhZMhceOKZPBRBtCCQIuJhmIz7aasSxzSZuRo8
/rmaiob9uFp0E8OyJpWJ6IiWvqUDIeROfuE0zmZxk224OOuTe4YCo+hH4lQlzxT27MqLsfZ09SBY
X8TplKwrp4JmtV6cowPWTuNrYRh5Rz1oGDVR2vQhq28CmQjFuzomo+aWVfnEkG8bW/BZz/rKpd1B
0EWQPQkCTuC4vVZQbgilaqt7DsbbReXr8XnKi3FTDFiYQBIxQ3oNwuYfPJJL4CP55Y3ihZun8DIB
7ANDFI0LtRV9NDHPj2d3VzmJWYZWNB+dOdV/Wb7+cn67tz2ZoRdZcNtNgBgLRYgpU+F1HM71u5zM
+x/gHnspGs/nwCGYMJRe4CX/pToTLoKGCcA4zh3jPEPHQ67Y5NxqCNeoTdJ6CxSS9JlFr18Z3ZDr
RJug1nxvUPfe1ir2N2Dnwq/F7jhlVy6nKF9uCME8AJTB3AV4+KRHfIqRSW7udyEKRmiLRRisYKM9
CsuOGYlyGHyIj/jHufXHt5GERi4TlnW7uGOX0iO2g8o27mkfhuYTg3elCTG+5V7nO5a1+dpf2FYY
hiI5zzYy5idHPdziblzZvH1JyFUEfr0yTO9awOAzsGRhBGR5kh58v/16xwGLiSTJESxdr2zE0YAq
x+lE/69RPVMKPg/PyV+m8sXqYCdB2TkKFdXl1UmgoAWrDec2ZSbo5hPHUAMegcsUHwKra0tD2U4m
26p5HA0tuwX06S9QReuIzE+0WssKteE+EX5CPoHlDeCVERjxubTjCvAKf/nPZzd3MGhyDmRTcGKv
ChzMCEzpaltiwpgyYF++odSa27BzezsLx/dak5TKjrO7CvH2776v8PWnGsmQ1glYdIksSLc5JZex
3MmhO6IgNZ8Cbbu8AmEQNccpp+ofbhY3BIlGSeVT1Z+K67x7Bqn7AoV8q4dW1jBCDnDmU44uCk1t
SGrqhVsMe5yeptOtc+DbabtjZ9+kZwFUem46H6ir6mZvCFfcyjRc2MaGh9XxYsqGkJknp0m8LEnF
gCUC5vf0pfXUUPjKAbPnQLVKiziYVbflphcIgRpKCyWgWRantQRDLTC3aFLlv7O2kqI1f1qmG/v6
XHzTysgSnAEPwgZ/yXcZRDVF0D2kARFa+DPSE+2ww6wXJlqKgpMa32S4J/yEPj2Ljl85ul7VKKyD
BLoVcFtkhm8/lQuQJV/MDxdCtp04mJKqRxyBcrH8JM6mtoHh2i38OBVk7PKS3XGk5wV02+jPcMh/
0PDAXJP09fggpXA1k34M6I9zYGpy/Sbfq91EsoGgxygTr4kNXaG5keL84XFRvn4cdFruYeme4Ctv
1omhrovA0Yuky2XoYF8A81VSc0779GP1S9K5tB9DRFn8Enz4SMrIeiH9xd/HunTkaCPycPAWyEop
QONrMyt8kisZKfl2Ty60HNYwmozFXc5tqixelzjwm1PeufDmJp2A2XnIw18mpO6GbWWmls3RellF
+y0f8lv2PGIsLcxDoSTqvP2AH2iDSSVcLFPx6bcppVzAryvP9V1vBiK/RnzFYcej6MEIzL8W2s9/
cM/Tdd4kz/s1j2s+WFzNJlE42LfpIwx7DC1YXlGldeUeNUcIWQpBaEuBISUVhyWDv/X/O43FP0Vx
r81NfgRvcRZc/0t+o60f4haB8anZceWguY4aR1V8TWR3TOpCU29aZ1r71fV6vW4iz6jPki8QJGuL
W78END842k/qsHoBj7c/F7VFeJcJ5O1uVKWbzV7avSWCzovP/2slrUKTVjXvuDCmX1DtH5+HAnYm
/MTP2a0s1oH1lKyoJoOuYPkoJdnFdr8Jo/RQLlnraZWNgoNmAx0bouP9cX2FBOlEq8vXw2WTo3Yl
qgME9U69LCIkM6yKaZt4PRsBgldnboBL3RwbhqgiYCIzVSo1Ka2JKH2YAD+izfzSvIqz+d/X9a6p
YVwu3RDFU8SJjyA9YPIeON15YAzwSvidO1lhlCG6Zs9m6ERBTC6XpHLM1aNDe3yLpfN5fi/CQhqO
9EPDh7Ay2603irIpzEMUTLMGpGReNzPjjdfRKkBSKnTSsV25tuFOYOlGX5S+6N1V021mRmxdljo2
RLprTX2QCQXh9Vvy4btdPqfMrIRKxUnMdcyxYyAta8lRl00NpuZrm5DGUnt8qVavJ+l5T7uJ1Kvn
/YZetkyshXqvRqElJsmtiCEIF0lXZwc/PpLiTdkuSkzsPBkoXLAF9Sle2jIEQFhKDwr8GRlzrWWg
ASI8YJv7CaPAWGEGqcjWkm7MY/ksZqz/RacmX0Q1qReSfniJ1t/vk4h6qtnA1G/3y8NElGJA5/h6
rr78CVkJc1vARPrl7gdtz0/gsT5mPWr7u4O/Dn/1+kWEHhFRNvvPpZazaJz9cnScFyR93FXHpW81
6W34JeCXFhz0SZM8qZgbDQjXSY10wPZjtpvh/5Wo6IOAUGFAEaOQt28FMmwiKDoDLqTywb21aLSn
c7xIiEnMKmaJNSUMQ7EYXhHGHxSymiyMA6WGgURliMV9GXT5RnMFj6e3AIrpVpG5PAWZwnibKolt
Thdbiv26wZ1H2dB2ZQj0PdHDkZWS1O7y5UGk2Rn26CN2PeDbX8BlIPFWhDR/nmie4NwpXn8JxXtd
QZ8Z/GA8psMtwVkeB2xRYeXp3W79uVQWJYErjLWIEnhJF4xBWsTFH6p54PiiK4oKohuA7FLCcucD
vvQiCjWMrBMDktT4e50NPchY7unCOc1QLl8EySE+s4VaFpQkqTCdws59CviHV1d34kWLT+6FioZh
36hX1XQrYy8zovKjwbPPmrANbiH3HGU8U5LDDjEF94AQPHATGyd/Ei8QGIF8dLz1T2uW9GWSDCUf
Aqo9Len5bvBYPwzsPGrlu8o6fH8csUnCEn6G6XnN5uKo1x9HrUvwLcWB9+gftaa+zF7qLQ==
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
