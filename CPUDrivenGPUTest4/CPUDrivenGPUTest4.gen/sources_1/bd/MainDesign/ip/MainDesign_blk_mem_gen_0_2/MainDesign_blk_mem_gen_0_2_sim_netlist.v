// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:50:53 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_2/MainDesign_blk_mem_gen_0_2_sim_netlist.v
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
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
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
