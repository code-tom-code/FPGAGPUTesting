// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:34 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_7/MainDesign_blk_mem_gen_0_7_sim_netlist.v
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
PY2gOPkgmOni/q0kXiwtRDR+wbrZvQ==
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
