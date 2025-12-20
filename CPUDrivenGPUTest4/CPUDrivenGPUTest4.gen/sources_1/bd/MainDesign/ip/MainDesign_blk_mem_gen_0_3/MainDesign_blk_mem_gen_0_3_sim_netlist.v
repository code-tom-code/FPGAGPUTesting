// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:41 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_3/MainDesign_blk_mem_gen_0_3_sim_netlist.v
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
2XEghouYkzsMvotBQxYBililHCQ=
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
