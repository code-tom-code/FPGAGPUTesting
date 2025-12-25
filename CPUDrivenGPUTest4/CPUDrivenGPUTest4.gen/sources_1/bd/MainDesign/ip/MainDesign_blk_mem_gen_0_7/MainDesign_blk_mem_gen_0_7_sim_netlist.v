// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:03 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_7/MainDesign_blk_mem_gen_0_7_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_7
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_7,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_7
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
  wire clkb;
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
  (* C_COMMON_CLK = "0" *) 
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
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_blk_mem_gen_0_7_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22480)
`pragma protect data_block
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
cA0+G0Us0MKBpL2V3o2JmQqKE19dDQ==
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
