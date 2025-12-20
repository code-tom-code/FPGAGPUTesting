// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_SDP_BRAM0_1/MainDesign_SDP_BRAM0_1_sim_netlist.v
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
PpyBGLs2JdY=
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
