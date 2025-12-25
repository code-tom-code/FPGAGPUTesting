// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:02:36 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_6/MainDesign_blk_mem_gen_0_6_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_6
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_6,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_6
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.899088 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  MainDesign_blk_mem_gen_0_6_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30816)
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
