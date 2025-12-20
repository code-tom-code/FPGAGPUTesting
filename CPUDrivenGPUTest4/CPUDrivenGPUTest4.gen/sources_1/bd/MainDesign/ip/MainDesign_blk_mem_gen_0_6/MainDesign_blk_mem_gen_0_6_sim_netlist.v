// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:24 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_6/MainDesign_blk_mem_gen_0_6_sim_netlist.v
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
FObIQDDUGLLDxWwuPffN6QTSme+dBe+EtUg2M7mqE04xx00rwkkTOM9nf2l/HBQ1wPXZsgF8Vt58
l1F9yRh+SjcG6aXo8TY48yLVfrGMcd19to7TOnABSjGmI+mCqEgTqbKI+a/eeKHuQApNLROPRKig
uYZouGfVkqR6DzzKJkgh2l8EkH0AiKi+CzytP8vYes+mEDSzwLD6ELJrlge8fNpdtmbJ7QdsjULw
Z23P4ZD7HnJc2K4pv/+Mo9RMI4/kaZdkX81n4XUyx/dwfcI0V6ANCFBs99CQJ8tf4mksIy+LjL6x
vHtXzAKKZw1ZDyhgzYZN/fKe0wTo8t+HD4TiJop3WKrZYyqokPhyRHkuf/aEexXvUztMgPqXVK/K
Mt0gGjZ/bvu5IOr/663nJJG/xe08dAWtQRWokuLmtZiT7QeBZHMTLalxV5DwXTdbIxcMkR4f/ZtF
CpZWAq3FDX2e7xxx9mjADOl/ijxA5TypPLbAN0gFwD2H/g9NakI5f7aPYbRHPi6XSBVlZKUr2FAf
V4kvtAUD7NVCswP6sK0+qKXNc/8A/f8q2xPchFNjIr/i63wb2oWIVip2NZf+ISQbmSJvE0vTqJpB
ucrZGUSBF5DZgVWgWUiwAiqmXj+dFpJjfLMHaM32VDVpbF3Op0bP9YoZQ+tcClLf3KfJyDEfGOho
aq7kd3VAPuU7Trv6edsq4nUVka6cmLGPoNVTX7ctHbcdCUMiQdpdYdBf6IpvYduGcwiz4Yz+xinZ
XkgLLreBW70+XZWdSfpBHIz42RV0Aiyk+cvdknueoyICuHc6z+perJ8x/fFA1YY/T+h3vhSrJZLK
lbWVShCSU2e3xr8e3UBnZgUJ2RqQ8gAdA48FBcMpwGbIFkqlSnMNLztTvpEOcsotI8EwUnjhKO1A
AysRzY3Nyb/ANg0RTd70a2gJPmqR3b6kd1CeuLGd/3DjQ9MvAHwhFbtUtHW4kmcvxM+z6nqVS9y6
uTfcCrB6MdSGpLk7iMnh8mY5+JMm3QyEZ159dWCEBklfpWuJB95z3vBT6xhR0KORuB/7bYOb6DBF
8kg3E9zsBSlMhXTcSv4DFqhZLVmvjQu89Z1zs8x8wWNytXLZXjz3YADyDBFD0xQ9Pk8je2Y8ccDw
aLJeCRAxACpJCPlice7NLWYpSAUs9x1YtEStj59s/bbnM1miaNOAPM3onEKp4yZcHOmfdbL1M89G
FbK4MUmjTqcfPpQmfQgPeUcoNDqLYw5Fenqcxb3DxYrGjNKJ7w0X+rPTPj75qbJGXQsPFKvB3qYp
j+PLwCv+4K7ERhqj8NToq4hLrc+82lHs6KXDYMHAt3P0urAIn6yGDOuKezulPLNiIebxGQ3cX0tW
XCu0yd8gm6mFkhJpdeBzXyTfNPKnlJhdJZY2gyUxUarTKdZCsAhrGim8QOgFQ2koolTQyM5f/DbW
sRFuEhInJ24xdQ2iARiO5K3LXyJQZjO7aNDTVGzjZUqiMHoFhbw5BK+MzQJefLqRFoXIspO7jOP5
NOphGKD6uf7Em7xY2w1gieeJCVjWu5B9r+NfbajTNO+KttcsD5+zHpj2MUExw8WuHClCu6oGGmFp
gZpMeo97dGRmoHwC33fKC7tjxn5dCnix6KwjHcicSWaCOVOxnMmy9DVwq+cfXP5ucr2Les4osG+n
LEWUIh8a+2o1spqDr9tWvQdVeZpuIpC95p6FPDakCV9+w0vtFevhjX3nBceVOpJuQ4iVGiuPQGL1
6h0XAdGlbhL5zfl0AmD5S1+4NnS6vmgxa9WLcv3ZQAO0AWZhn6j99D3RcyFUWAC7QBf1waA2SGp9
1J1lTunjx8YSB8x0WPuBGTJi5i61CKqAB7/qlpW8fg/usR41Tz9PLmqLh5vBIijG8Q1axKXU8rCQ
8t4pA+P3pB/uXgXFogqW9Q2oKHxOuOLxhLUhNSM5T/xon6eu3ixVtCBFh63T4AYRt7Vjn/ZYhDBq
sMFarchWzvVcqMamEfVb6NedoX6uQW3UX1maDwxKpu3FO6CbB2zDk6mXrECExvE69+wgYp50Z1rK
wAh1JYwo2vbgNSsngyutGusMJqmSibn9kEe7IzdPeANMQ7sK9xe/jwIbFMyyMHiGIfidHoFCP0fq
p5ssjgJ43E0x0ace1jJSkxDPgENJixHKB54RAV4XgtI17VyVmI9PZ4MsUYB6pPLNXbABlhdqBhjO
a4a91+Si5qdJXBRNGg/fxwGicbBC524ODvtI1s96sy5PzqKCaxyM2Psq8Fdc1vHUp5vXlqVS06Ps
gLe3k76jlh5YYCr//hx1d8o8M6lES+xF7uEcTYo9g+YLVwFLzSwv21w+LfjFbGMvyBazAn01XoR2
OQYaaKOCywOfmK8+blh41M6vYJPmN1q67mvyMYQVo++X67fCxDwT6ClvN7DzCtiH8wKSRdClOGsZ
U3hC8njRMCKRj8sKlh7RdWFDE51K7wnUJGrqx36JiFWU3Kr7acb79OFRHJRyLVC8R3LIEWcpRJCw
2A7JcvzGBgkLsCtHJU2/UWbT3lnlt/3ww9snGwpZi+ypNFSdQRM3miAaoREo5T5iBo+y+kazWMO+
tKTqLJR3DADiSVsLDD24Xmch1xxphYyHQwsz1W48DFuaLnf6cIX6+5OZfSSH7mVpWfCJAlOPHJw2
cMqTF/h3rDcpTWa29JKOObwtZ2ZwCJ6+zB7tgtyTl4Je3RBCA+UCEznvZBUp5NSROMv3huNAiS9O
V3iScIAEfYBhk2MGzijowqjpjTTZPT18cnn+pmTt7WmlzQ0qDs+olQfwLcMvDCJGNRUDxZy5r26x
bYs6m6lFJ9nan5+DiG2xgr+WGVTwAHfq4zz+0UgFcVqHRUaI98UZ8JaWrobYQvj+UuaMuum2c7M1
o6Ac14p/K+ox7CyKyBCgwyyWWYbkMkErBsXCplKUQJi9Xm15VGECNPlEYnT+ApISP9XAO8LY0epY
2wp/Z1rigD4g59IixQkCk7XFEbbyU2p07VVzmBVen/wIxpLWYUotyHBrPKLx4iOwuobRhR6N/QSx
8Ph2SrTmS8/rEQk3D54J6MgxrOqvz/XQfQAk5REOPaybvYsoBPxX4euQKp4PvASrj5WJE+Z0y7y3
/xC3IU4ojJGYQZlg/AP3+FfVEMNVPZfo5/A5Jj5yG1sgqPIreoUzbflAEGCjRkKbfAaWcDBYCC6H
vhusl+kCaxevP4/BORf//grdGGchAZTZAVMWTRTSNodylQwgMJBAFwihzHPxszkyvwcopbT9xbro
iS5oUB3F9l8Yq9WjYhKi4JMQ9lXbhz7/QfrKJhGj8R5sl7Q7jFjCqdLOKjTgaoKVNpy4rOYs5pra
vbgucP8CKeQHT2NWk8/WPPFVDoNVHWJlDqtsR0vUcZ7JybJap80bfmtRQ7XhKYUKgDmX4KaQkrxZ
NU5USfXpuSRgUfBHlpiCKVf5sLSKIIwqhp1oyGF122BT03jjYyDbwpzhz/NPEMLo4EJijZ0fnP5v
4hXgiywASw5GK/so7BJc/x62+8NUeauRNdPzwzJL/0XYEybw4EeL10cs7lT9O6taYHPsai4z+8WS
6kgLTRL6RmENgHdHqgei9ZirqthQnPCI7Ng4jQedv5KXfRY6aw6ddbVM0JO68dDsU/yfBuWpwyqW
+kHJi9TJNYD+yeBESBXmSHqh8sW/Vs/tm4WzzGevRfSA8Yn8+IAxg78GduDG9R5dxVeu8PT//SJg
QMwFSJP6oLLbjvGnyqFor2sUNfFJCBzVR04dYatF4eYqmmnMxYzxrRHDP4/M7njYrRJVdBllAqTP
FZq8IpMg44qyjJC35KLtjiNLCfP3Ae5W0NZ8FqF8mDpYMNbRjlrAXAQB+RXwDMPMHvhKMIVYtIZD
yjoHDv0Y0wmHT99N8Oleb/IqYvNCbVPLViAugG0cVHLpzb0os1PtNsw2Ns4/n100fIgEm4XHWfRl
k2wdltEeP6HLv7S2UOWiAVeBDHNJ9VA0TOVhmgPw0i62CxiAT416VcJDXeoI52iXLDD7QcQUpDHS
yag5T2pzTojm/U4//NNwOgjo5ip5KUnJFonFh+JLRQDZTAjFXDNvTg67lqlR5mPQa5xBOhie3DHu
fREJqCsHo5AazuthGMkzVOuNEvExdkrl0aqSiKjSuxVWFwBKdAr6z48G0gibdxrxJ9xvKGz/1U9N
MoQ63rguG9hD4TMLB0793kVL9tU+TcWrLW5LZmd5cJWUV7ta/fVZicvmfeRmJ6wyfmAztA201cwq
5J1n6QEtJ8Bp4OEteDIoQ/Q4/R0h+zGagUaAoeEGstlV+dMLwMuAZIVaViH4oHxNJ5M62hhfxBIO
eYfCg1vWD8wWKUbXvMRFqrH4nJs40s3RvH7JGnlZv63HYREoixpejQKvFNlI+QrwYHvEQFQwHjBj
sneHLJry7idLaahtR9BSaSwFuBTtcq/LzUHN+a/ZC8l19S4kO+w30epqTqSeNIbqdGEI0DBqtv2Z
z5CUZc9BR1td7VQHSfkTiFGX7+ZNBBUgHBfsqow8P7H2NJpHrGBpWdOcbAtiXjEX+zuPM8965i5o
NKt0md2MhN9uWrBuaiVzcCZQ+MjZqo/7VhI1gJrQw0xRK7mMDiCexI8qfD5vPOjBcruG+vhmO6cU
sHJxBpd/Tjdgmg9GSH4GmqWm7iq3DsYnUBc3h8QGr9HNwe6g+/g2KRmlG1VIB68kSdKY/kPaTEAw
azsNoct4es7L37ZB712940TEVyCP470kugEYatIKWUli0cOtvBzneB9PmRyGe4QY8HGZ4TjCS69w
dKWALGWPX9Wpwl99nfjnceYyG6LUC1+UUt2BJHV8LL45NkeBcsNXOmNIPINEy0KoACN1FPRV8eWA
y3YLZ8UslpydzBW7UbSfr8C8yU/MTGusTaOM7jdzQyX6s57u6CTVt+xg5OqoWk12N1u2dbARj2Do
Qdpimcg0E7IdOOlAOWl2ifkk3AAwXet6khbqFXfkr+t9az8gJMCLkhv9wmQcfY4azqSjzlrMqWWt
1FJceegrDjywgmnBanMP2wRIiGDhhJzKUDXKMsVUFrOz/kbZ/S62882nO31h28puqerrzxcUX4iR
xiAaIFaqo7t+29qotRybe+egOebfN55nCOg7XCDy/8VxMjN4lCdzvRen0w2AuR787GC0TPrMdihg
veuzU0xoPui9hrs1exmZ9bv7YUqHUIzhVoaRXBeDcfHFuCvLPjzkHVhpTsHQyH/n3Zltl42hwdoP
eHoV+GQvrPZ/U8JEBY69n73Dh5BZplm7y3wyLh+/EBw7S70vCgrWLr9YIvlsfZ9AH4t/diMCTew3
zayi4n9lXkC7TMuHnT90sE2UxWLKwb6AZ7GKMnmE22powrXyF3+2w6VH/AspA4KNjiQquvwLU85/
bV4t2FNKnk3k5ll2+6ghX0rvIO9O1z/SXxfPUKwAk1EDiY5yA0MjSEE4xoCH6Bp89LCPgXivjCo1
QdC6c1vPaCr7hJt+nlFnV3qxfzYmwoB3e1HrS0G1uQWTCx3jFBB5GytNXSAfka5l2EyjcgJv/AIK
HcSU5DLArkvOXhz2cYHkM2DXjuHsfFxkLzQA2dnMAoeuYd9tUfSE9mQdCuar4Qwry+VMDLXyEBN7
e7QkrgIQ0KoscGt0cUxhoXrAGteVOyfRYK7RCcDQ2g4dQNbEZ24N7jl+g8K2Lcsx+vAl4gToPY0W
h325cdYkW38wSn3hS46uAkQpkLakTV9WzlYNTXa3+EGmp2Shi5gb7jpKYHBME1encC/AdqBZ/jEK
9J5qE76pBR0kUZQSt9onPkYyEMH6cZo1kqpml7T1gsAUnPc0AAGjrI9EjkA4Fm2wscVzCld5whrU
AKZx2nI9HLSofJbtmmu6TiLojkazcUwjl0qn0X0GB0ESuxAtHZZEMuE0bpk/df+N2uuqkbnTsvFU
dhTGwtJu/s3hezDrbDIISm9UUhmsVKFj+k7qbILIIFdajnWjX65vDwInlWBM0T0F0yUN8AYPHLky
qemx5Cp4vZZ8fyMaZcDRxEkFXysBnIiMk/7R8PIVnrj0uMnzYPV4KLZu/W1QmFw0JFtp0UIUUKyW
Ml70kLDp8lwLVCwzzhZ2WmDfLPqnSi/4cThHUH/gPBQhf7dLg0qeEkyKy7+2oHJdvG7Xr5Zg6Y5F
+GyO6vPzy1uCylnEJiGTSImslcsXuVsI9YYWLOj5U0LhsCT0VAbgE0eLC+TnOjwX8JNGPNK8sv+o
cirl5JVlVdTuyg30+wxyw99asNYgZoJIwScfEA370fayLFMF6FH5deG9IDtMi6LkFooMfOWwnaYB
nRNXVxUumylwHyDBOlBA8NiIaNj4piGQgbGXeBNwHyVuwLi8zCuA/i/UADBbTsZaT7qycI2cSMgJ
S3rp0UmHoD51uwb/WYid+L447M8i0RUrYsXMuMmpWHmKzXshvMIEo3+8ZugrsOqh93SFp3Ef0Gx1
K794IZEuYVYlBYx6Jx18/CRSLMSYPwXfw+DGYAnBcKATZ0h1jONNKJz8JtrTn3FAU4w99SNV0uCy
snMCLSLP/1E5GhKvAoFTzPu136/pYo4u5ubxbnDh2HVvbNPziX2OAsAc9uuBEa+94ivvxtNOscJ7
zmudZBxcvnHroMfaM0tX38K1Jhyd/VYFGzJ99ABMSwW3Xu92GHoPMdk6C227WcgWb3DNXAjF11UE
B3kWatd7EEfuNpQJ2v60pWmzSd+qSuLDIeA/vQsaHgvrbizmtjRjFQ2z1cxd3V/ee1+g/W/jeURH
gaPQwwHIJflJZVuv9PssrSJeSRDxU9QZkuH6E7v9ARJy/iHgi5T5SaXfIXkWsvVmKyf/FmUAIpLi
8gP1BRzQAQ9J3mSuac+zVHiJm8QDTJhm1YmzDfuAtxx9Rb/jtrCKKr0gSiKEgWzAEgE3ea7it052
9KXbacvVp/VN6rYNkTrRGg+eLnK5STyTXxAUEIuF4sfBgNnkeUHssbn1FsGmKfBERHpC624HG5wg
BZkDmY59OKfKDzZfXsZs0Kv23CsRlgMFW6rqN9v23gaOan5dQp+0OB5acQtYpUp9PL0HCN8+pLz2
k2f0rM5S+moqtQRoeWl/bwSgy2tXsn5FTyrbeVmjdEgzkKKyCiuEbdtHV/eIONzHHxV8ewV5JxNQ
Ux1Y9M6mb9tD6ObSuU/arNCXCyviJLereBNMQDHorK4nye/JRiD8p+J2RkwIA20RindzcwOkmfWA
IbysR9eOSXHMgzJLg9SS5+u5jiHwuT28rnnJ1MfgKInMPrM/fHyNYsmExrdFLIQ+REhiSypADlAQ
vLrn3zTtskf4zc/IUVkf+KjndtIf30K6UzPSzFEYqUCtSi/UFgkZLalrpTGqfnNyr7dw9s+tXz/Q
BaaFxEG/snVKqL7e/z1LdQUzzRPvDk2Mzv2hRwbJlgAG6THtpm5SgTVfK7KwMEs4x4ryIJ7T/t9g
arQ/JF2nzA1rBv/x30Ej0x6QGT9edSVG0raoqZgF2jm7cdn+7l6A8aanw97d61iTt+MAPJIIKh0h
1asJQbJKIDfixXjUCnpSCRRQab23R5yKVgtdNqsx30ks+rbG77KNO9ROqByl8HnyQTo+mlhTacPH
jJcRX7nZE/K7IJ60gzWSu5Swomkv7FbQBr6ewazPDkzOCCbCtL23g8jGjaz+H277qN46a0EHXyvm
Ct9nwcG2jjaUCM6aNUtPNz48wapzd+6/fJYRzTr/MuRxo6Y6tLmCFhsuhtnHqxB23hCtAeAk+hV3
3WswKGrpFVu4xMzKLG2EX5c7jo0E7My7A13iGNEiY//T08rZnzgx6dHnj82+etpmhLMHlmrnob7i
6Er99/Qlu84qAew95ZDOIJxN7RW3z7Su+b3KstkGaD2pQnZR/6Z1GCxzcKFqNoXtlOPH5ZwQ+lsM
IxBWDALpIX3lsrETtYi2pWC4yQeLSrl30nK9K/9+kpUh4DCUgFspiLryaNU/mezGHlbpLZmtZkQY
abYF6UWbGDQUbE1W7bfBDNRau2G8fe1KNXcx//2qBrbKipweNmP2yNNfzZfyhgkAzsJfbk65coD3
7+kv54M4i6Vz/f2kAKitL3SCskpftmGb3LdsaV9mxDz8Ns51/CQRsCTfAz3ateVMrSnMvFDSxM84
SxHy2a7PlG9w3rwwWK+vAKDdjtCfAa6FQ3QAE7orU+QDE2WpGfBeYn4rUuu7jvTvO6XhQqceBj96
6Zof5FG0JvCpj1HsT42Lgzqm1HjCqDVE24ctEdAxoQ9vw3YLnMrSk+7U1ooMibAylbrQTUPrvA5V
tbvoiCdKyTNoM+HiShWg9yaSYeQBSW435e6qKM+yPPIxt/IdjuxILVUzztBXWGFocH1o1maX7Q5E
1H/LjuoM0I/P3s2iQGB5iuI+Uktph8CFG8xHsTwXQW+7CPL6zfU9iiMbsq9M10wmCH1f0+BIm/jX
971wW3tJRBaVymgYrgGz6A18BH4BDkSRsziDKae70VDY/cU9wbtVAJmrZAAp0mx6n29X4+lsa5qB
VJvrHdYmS11dRq0SgfMVIy5RZ4RiPT4F6oB5grBd23Um+FJrnmcTeOgA/nIsoEdiz2MDUI2moA+a
gZHIHTh+8gKgIhHeVsYElnl+X8QwsyLKxIJI6HPWUSPfb27vfBehlMk3Khkyxxot9H8u2gsfDebV
HQ9p5ptv9+PR2QoXKt7DLaUrS7R99Xzck11/Io3ewOtepUqRH++MSBsXNugVba8Xf8fgh0Aiw62G
yQ1X7EzsW7mw3kKKjzs9S5KqrGcXkyhEQC/mpMs86layQQcuKcNb75SoReJPrMzWMe5fAnFeb4nY
gIxq2faD117pMxN6xd2Jot/BXyEDQ3fIjiXgNQqdP5/+u7XbnLdqzOqOkh1nM+UHbRFKaRzwjqff
ewxF68209uvJOYRKBLse2X64GgUsD9tKZSeU/8KZ8vh1Lq6iLxdPqI7v2Mho1Qu1frtaMfUgc60b
0NT3Z+7G3baeIkVQAcLPboNRG/Qs6Rd2mhWT9K1RseQETxmqmqCU8KEUHN2yQtgXEI+rrmIzaG8E
TspbPJ3zIEISNVvBb7qZ0g3y4RI1HEfkZwgxuG+dhp8N40AtNx0YMS4v5hZDg0918UeWKrtt/fK1
tMnkk52WwC2RZjTns2xwWNOJo9nqIS+yj32MRI6D9IaRaZt4HulE3nyMzpjzUxK0qAc0zNWSRKqq
QVdGwLEkncH72Vk0dYxI4gHpmDpZFcSt8sHMq6EcLl+evRALrHbrIzeY/+Q5jraAlvvbDnYSXS7F
nZWbifpAmg8OsBmpD1kv6PlFmufDLbsgbOzaRpNc9is4nkB/zbYqZ9y2cgW/CW9ALrlhvjHBNHxl
USF5/bWIidu3JacGcZ/EHohkHEKgLJu+NGQDs1oC6qCq3GEkDDP8kRyl1eDuoPyU/SiLbv8SKQAQ
HkWk49uuQrbZEzD5PsX4DPv1fmOebj06FyZ2k9znQllVBfUfmjXF2oEAOJ8eyUEcQPq8+nBtoAN+
iKkY2+H/Oj5t75ASUejSvqWwwObEPnX1V360RRGlg/QzOHGWpuYwVer5pML+vtYjJ0mAoJ3Wcgtn
NSV/tgxErM0Nwb4kuZPwntsUsM5SYmtofNWaIOh5yiTFtO/IAwiR8QtxYGr/DLFbailPv+KgtBro
4V8q002bCOo495vUx8pS42WJmIbaL5vC7S5+rbmzufpNGrYokKJxLOlSA7GvbXjnTy24Q5QWLDVI
u5OsfWerWYNGbGxR/50II04A1dxblwY84GlpTTWvnjNS0D2YRUlygdW/ubEhuacVl5fs6xGaaHj/
RF0o/sNVAdQJoodpxDmS3ndufrqavVT9U/twkdsKTc8OSJKeB4mYh6wjWMKDoJqGa1Pee0TA0pDR
n/EtkgGW+l56lUHs4HRpvJupn1/M8vhORruPxfj1tGg/+9PYJwXEMLLWQankk48xsx8UDguTYa5/
Pj+hop7nxEyruc4PHM7+M/SCWdtT65DHcvOWLQLA2kdO1jp7ONegg4d4rbzQUgYUwIgEjupSrYqw
/clN5hBlBydDOGiNnBUbRknzGu8zojM6osBF7RWeFwybmQG7xPDESS4dCdWtx5V+Z91Y1yWedHQW
H/BkgiTZnsPVHef4r/AAydrMbR0G2zDnm0m5odW7MWYzw+KahlBF9M+UjH2TKeU0IGCZ9qwa8zcM
MJ4nowYKrosOv7sjQxTegUxUKp4qW3+lDVV4k4hG8kM62SCob1TvgYMRORNeuOPuLLK4sWMMmdVz
67Qs47zfm1DVqYLgt98qEVBj26LG0x3arCpJUIYl8hn9NTYLzw9ju8T0RgWiM4qdEPRRJzbb2k9+
JyPa5YejyeWdzISDPBiVR/gciZ4krWgp1qKn3lSo1prvQeqjLhuunaGhAlJdbSuH1e3D2CnWucUv
yDpRxaw8nOwcf04M9noxNfih7gXpJqbJC+QTv+tEpak+6Rt2UkBL4fphV1khhmPbjuBE2LMbmNsq
NvT6cabUBi0/pculoR4HqXYf5JcjbAZ4cNFLAxy3HJRvByzgWEc+Swbib/QdqeKLb2hVAQBpsL2U
DuZpUEqX5POh3p0XVcHdAf4KJYl0/WmukKAd6iJF86uaQFwZtBlh64K320JTGp0u2+r21MIP1N/e
zxWtuGvVXaeLwbVUtrqRokO7XGeHXKUE0qVxB+ewDe5lOXD2N60f4E8gDKj2y3EnJKVXdNCV84YK
FlkonmtsNWLLmUJCuFmEEAaiEkoVLcDuWHMR4GrXk/PIcE28x++mtRedVbFDRn/JwFV6WaRfVMgj
pODw/wQLVzUgc5sil5PB1vSl9CtR/aJTwskFjvCKurBYy6C7RrB8GgvP8qAt5OHBs5YZjVn51gfy
j0JbCmxM/IoEzX2ZDEcRNUZM3ViR83HwgHMMFPiqJRXIncczH24af3jj7y+xSk746btlzQOTZfjV
e6agmrKimGq6L5JObj/KZWVEJ/Ll5dQD8qIhyUprF0x/97Lcddb2eb/rQnfrkvT0PNcOThz0lBJ/
AI+hXzmK4m9TfftMMz22Kt1nzmydlVZA58J3HLBeQGiDf573Ib00wDgfsDyG3RFaxs50bDsB8FoJ
QfvTXULSpZOr4JXbDyrU2g62KoQpuVWVHFZxKpCmwCTPprZmJtSKRZpO2q6wJHgcH4NM0SP3fLGd
gZgG93MWXZjOGLurojsu4Yq5OYQcg9rwJgZJ6Vw2Js0mnzuf5q6EehYOmBW30fhGv7hj51BRwrRB
U6GcpMSKT+hhguvx/3wa+BUCx+ZkVLrR4julg4S5DUf5ecp1kct7YXRDkurc8TyNFFpIVv6Z5DZL
yqIs+/bB6FmhaaS40kO0sXrSrzau6Pd4b/8GlqkY4Iti/9z4jbfUvpuvirtM+VbnAEzsVPnVHw6t
bV4CAqtXAeHADR0m2iAXZM9HaMFMj6IMlVPL1YhD7rxjOBhT3edJTS0DVBNsn0U5WdfxbjlDgmEo
vlJubu4ARqg+1CF5TmZ5sydqOUY77gQM//x2jrzPKFmbFV6xhXVLYeGQPy7pSy7kcsrZOhzVP5lg
/1dXvW+XQN5ihYAJRAvfCJw1y3Ie1SanAMrb0025iv0AnubW9SkdS2YihtQqSb8Xh055sRCoi+5q
tBoOH+SNwK1WjU1FsZQVlTcGCBZXKPuv+gzojtPkFuaWJPoc9qQpQOjBorQ54zS89m1aYu8Dgmrm
wyPE2WYN6N68co2swKdFpKAZdENMjSJjtax+y1ZLHhNmUujPmjMCuCTnnwYmJAHPeYkEShKAcQFt
cqY9iHGDpm2zaw5eJaChsv0RV/StS3FWQDdJOIFB+lpPtJB90tWAdCmocKURcTuD0PwgGw/P/upn
1AJ4qpWfrcdaB2yRYtnnGZ6L9JvGYbVQoPCeXX7J2wDGntEXtNRAc+/fNonrc03cXENcbN87iUkM
ujTHZbMBfruTQmzqXfR5cgVAqEvHSK0aACMS68zrZ1lSPbOL0+io6P4MzhKNAAPEbwsc+fClYlxO
Bn+pbsECegB95VcsuAOmy9VyJ2ujbK61ufEtO77R0HQR/h6ia0+QWAce08qoSDS9aciuWPCP5KHB
t/LYTl45C8c9VGYvwTYfQx5q5RslmflD1bovT2VsFhL8qUxTjXD4klSmCM5toBcMuUsGS2emahDY
Xr88PdNFk5SeSNkNpKhHFuZaUyF1YTxV/yzFR5rDqyARwM/yTAhmutwxKaS+2T15nFPetk+2AO4A
vENDYtvPOGFsO3jRT9MEp9dcbeMukyY0bRal71b3VBzOCWqMrvdy6GjRbdxilpaAibY2H2yUmwPT
qAFXxd8TRjgXqOtkjgLOm0fsynTWbKYi0TOy6jYzvoAR7NW5s8v6hOKj4ZyI3dnPTio2QpmdgWoz
qvtBYjBb3el0BsWX3KXweLtX3go26zTMjVpvp+riKNODSxU4AKNTfgQs9noOXOp7LqLEcPxT1HHp
80WxbcUSVa7QVoM/JZqnyulNYV0lKYVhPDRwgTK2WDPafsq4gq+B2GTXsCi2mPGnyvMfRbYoMx5R
h8+XXNCltMLFE++2SykHwcT8gMhjXE3VMpCIb3NDk4bvo7DLU2qT/s7CX0+c9b/iTegeyttwQfG+
13Ml4jJO/YhYPrK2b0UPnxgdEODNPwlKXhq5vp/mF9/HfsMHLQyxhWmgAfL1WTyzKGVbx8FkUHjh
hswyJm3vX4a0wqZuS3NZKjEmZIGmFEhNgpNri6xLlDjXGbH6O0NifLjXisNs+jaE6n1DBdaRGGxT
3VYnlYUhvkkBjmrgqLsVw4Lo9YtA64nNDB++8o96U/aKWxQs/dos/deLw10Tkvk62PswirBjKfvg
d3M8h5Liafhg7q6eVzZlov0k/Pyg2eXoFlVZM4sCuACvFmr+Bq7Lt0vsqVY/Cce3rfQFVu1UjwLF
L0gpDzOJObvHC/4lc+e6NfmKMXyd2GGXP7P2EzyqtE72NoHjqr7430q0AYuHWtvq/Fw4POhrKjoS
yZ4qCvBzWfN165mcBhpt+xT84xofUoeNy58hAfn19nmqb/JYjXQAqh0eFu1w7PktfnyrswIHYsMX
GM0yzww/9vR5KapO01hNxN81REidSlwS5fTfNHHPqQrPJLLkI0a3RILj5n9aBB1OKq3ItfHIQhHO
f0+5GzCHyIoalCW3n7X4RM5H1fOTzwO4+bdMpgv/i2OFg4FRphaeSeW82haSsni8cYWqQmI/XgRk
XyTOZ1h8ESUkkC4M6AbftZfUBbrY0tb/fboLM0Dpop2r8mYEpSVo6nXFQk7GWGrICAtCm+Y5v5u8
0/khwIuFZpR/8tVEKYTjfM0FsAa0ydyUO5OxYVYku+xlq3gLc9OWN50rW2L6tSH95dakL9fdcL9F
Xhwzb/LDLViZ35DQymI4cD6cp2/cpgPGFdfvxV/hLrqe8Md5MAKOe1TDvqaNVN8raMB/sYasd30E
q4ozbrgRhaw844zZIblSVdwZ+colYVGLg9jFxAOqEoU4QXErpr9LtxIgbkFBQH1euOhndhOFJmiC
Uz0VeHGpuOVX9q/gpsgYcHXIIG9kG+jUrrKQvUefMCa6mL8iamZmjQobjsQ0ScSFC+rYtTaho3FG
CkF3o43edzLoFbYU3Kz1Jvho8vqgYS2/kJ/fNsjRDLAWL7foObFW3AszRKFuyK+Hc6lz0avblCyQ
OwyG9U2QBiKBdJVkotDhw8kEf6+2R2pKjNqQT2edlU+gacxHZfgfEPS58xB2cm+6dS1cXQERFiKq
XZ+57r4ih1XgKukeh54Ds8m+1LYh6pHs0F3q7ZGLWWfscXZNDAAnmzbPy1DQR6fGqhLH2jXnstAn
FvoF7iNDY0KDQrF8JOiE3paB0wvqnksWTG0x0mwfIJ+0kIASJ7fw6qzR0j5NOirg6qLnleBQMCO4
xP8GbMRaP8vYb32l+ZkBnADqFFWK4AeL7BjoYl6i8y6+xGIZj5jL/FkRjmf5wFhkuy0hRJLnprQI
b7q8iOhExONHA/fRetOOnVxP4raGn+kqhpWYrzxzHWgV6UE7QE4xA8mmtD4IzEGOrnblOkq9dK56
eLpMIr03DEUUTDBYElbqZhLMdRMV1cFiNMjq4LNkIR+xVa4ubACNMaCgLUhf0cuuUgCQzvq1fo4g
iJB9HnmgCWYrI/LNtAJTyXpn9TEtwlEBi9Fa/pzUGKJTz2gtW04mRJi3YVvPp0ZeXHOZ6CkzzMmz
BSsBkvosdZLa/fgkCVezg3gWlDad5qMaWPEH/Yp9x1oYIQcdcDHZ6mb/I/JK51DtCgWh21IC6lBG
rHJwbFYkWdRPYlVOgKcfOfHKHbRmvc5/S51obehwneRqr1LNwxKKrJo9u1Ru7nLGcfHpmB7LTZ3L
mPzTe4JO8RpVlRZqCxTwCqU+kzhL9i34wTxT2aiCT4PThqruavNHIS4pJxMpji1xIfmvvHtY1cl9
2YOSmgpvG+YUs51R56rWQV4oFU/ZzNyibuPNFKkBE4TazE37n7oA3ne0X75J/ScjF7HZ4BTtHBLD
jdVZOFISEhtjmZh2XunvFl0PiA8zNkk6tbGT1Lyni9wQDY9lfyPvpKmF8PunUwGguzOE2wE7sq2h
ZUnyu0fpm3p1LZUFvK4AEu7mJxStvX0++PlPxwwaFWZtdwB0gB+h4VTvw7PS0nf9zp8JjZoM9R8m
xXLRuD0jrWuM2qmGv0cV9L/HowgKeBJUmGXFl8gQ2InA+BLiE7tAXT9wZo778suQLNHP10vTbw/0
dduLMQbX6Ff/ow2843PM/mCjLUolfas0uZESZCVch3RIGSE3xBv8FDokLoeiVCXF9wGXqDdE4R9j
V9S5u96Ua7BAKOdYBDR/Z/TMqtHVNm6x16XidJCjkpUCm0NgQ8I989wB71IbfGJhjKO3tuTy5+Oq
7oDM4ZkgRBpg71Zk5dv3eTau9WnkyUxPNweOvdhTtXwjLFLgXT5Gsce/0MQKpCE78RDRpb9JtQtZ
Lz6XsBK09kehFgi6+WtHjvJ4gcUZ70Sckz8eXJPzZhaEZ/4SRCghVbUllq7edK/wab5nt+Pmv2BE
wA6nMSCgUV1/d1coYoKmQM3YKcudeLdYRNIa0dsx7Ce+fSog3xm8cE2zJWzBJnj7Z6PIcw7CsGj3
MtJ+UrK4W9TNT2kvrzUPLsSM41io+SLSb2hzHKkRo/vPp3TvkG9TcTJlrGaNFoAsY/YfaJ49KPUY
rOVbc2Tm/YZc440QD2GaZ4y5vr715DLt6u4LLkDPjpELjWXVuJ17V8LYTBH2f9m3u9JsLcSRgX0J
RQkh2xvbtvQ6jnu3xHLuYZYCzb6+4D7lVmTFedlyVx/ED3amZoFZW74ilsBHb99Ex5Mg2Ieawg8E
UJLjZKeEpu0zcPqihtzluygCCsfQIcIRj7b6McXOUIQAEue64yIS5i2KZxewmVHw2iPsgVn6qczU
IRDpaD0zOZAPqgi5vBw5ket5Ci7xRMQVTxIq7rN4yXPadtTzr39peMe/YloD+s9XGEvDukl/sWeg
pbL1+CEkKGui36lt2UXD1a2vwHeHasaC2oxgZrq828T2LTawQ4tUXPwSOJqW2TDlpSYNz6zMbxh7
0qa1YEGucpDPoDO2qm3Bl8W0UvH4T4Xm8mxaF3PTCD18IRCRjFjSwKCFvGjV9b8rG38ZLdWErTzO
c6Wly8TwuTyttASnIVIbu6/ziomtEe9brEc4LC5tstkc7bMpXovSV4/KqQ6ZiiVsK4b4iRQBOlAn
OzBn0KQb8j6HtYLBMrRuRFzo4nwe+8BMptaG4Fa+4V5RYLrgBLzP2td+Wrqj3njAsVF/GtcBSwvb
YYJlEb+OAig3KZlp2XoJeWYTBvSAhefJJJgH3I59cqaZPJjioC3VOsObGiX4rb0x7kKDJhXJKsHb
ozpTv9FNznx8vaRNzELCHVMTkpATTQ5II80kaz4N+Cfg7fDyfizkoRQyXLSJaGxlgLqXZA4COVeC
o+rjwLjMlz4E7bbP4+Dbjn7Y3Hc3R2ufPpyS681/l7M2hfEncKkpDXE5fdKw2JNZgw0z0NgRtuQn
QqJnpjwPNj2gPCHaWrRPTnmlJQ3n+HNIyrR4c595b6nNqOsMd3dN/JERrnuC02qAHpoctKwO0Gao
r0Ij3/POst5Qrl/TWcn9z+NK8Ko/+OIe9RvFlj2IVgLWgZnLdwGw3GY+NoR2ry3uGrcVUj87xpyz
RM40W17ab2SqO9vngdjrv/A1nAHF6B9yvmSO94SgnlEf2U+WgRe+MFDbuef78Y4Z/8hLld5gQRWg
b2gaX8fWS8owZ6sb7atekW+DDOnMxwZ15FOZ9usPyhk0CSSbyqz2PccgNEOUsD4X3VbmHDetaJdG
tiIOnYi7aA/gK9tSKmOEpibOe7yfgHVF2xQiaikfqGhj2nu/Jxce8pwB8j0KgdCddC1huCkxp08D
FX5fguampS6GO+o9076xEK209KFm2IQSW2RXxb3o14MbDZyCVShKZWQr30XDog26Y1bwDncgQnV1
hKBgn8CzcV+WQj8U9ZgpzbRcCcp43M2u6SYNms2yWDa6wb860hIjkRzAKGehgatogjmSkTUMt/eS
hWXJN0WF2O8/msMNB7zsdnZhZTQAZslF5J/GhGi41KfXj24aOziNY5aE/s5iPofeAg5j5OcyUvUH
OZvrs22MXQjtkPowZYn35zrDilqeOIx9mMJ1nvcGeXarimVZhmmF0PlfBf4XOGR7+YrqPnYegVjN
cYCYpzoHQaBdMFVHLDSLka8mD6R9WDMwfE0V6S3eBayNDKQiVeuDZEBlNCOVpc1Zs61b4Zdz/Sf3
8c/diuYYQKJmCioJTG75u7dzMvdC8KoYStYheoPRXuKiHBX6xp75q/OCfEojeIyJMReTDrSEIuxw
Eg8oGHa2GCgs05I9hkPgi535dBKc+1aQfaWLJccRm9tjQjxkD86lQrPHlB4aChC8OJRhNRH+B9UJ
+c4dCWn80J/akrRumit3vxTET2fkT+h9b0WI0LHnnN3XYUZI44vhgXlLkWcAiZix6Halt0iYoI5C
VN8QKzhl1YvO9ckgxDJuWk/DaUDsGduB7XUqkZqLRgx4rxi3KQMDYPbG9TyOIgO3j6A8zRZJIzlg
yZZWVYAj3eNxK4ihGgOHsGMnsxyLR9FH2kYbzypMkbca8MMP46yFQSCrLm/93JhOnq4Zm4P05GIt
vI7RE6ICaCyfVCK8UC1GZyc+MhZem9MWUF0E2GC42KFycqwY+Ei3nv0Iy36S+oIul6L6mExqQk7H
8fAS9hzG0tq1BQWDfzLTveysg6qbHxdFLmOL9tUNFZU8FfCKt6TqVM4w3x/4TpMzZ6EZxbycVVe9
UeA1hDkr/YfKB/Ma3mp7iI3ddhNscQdLyBxhOukoFiNKtUWbPd9Au3vGaUD0Mqiecl436qXtG8ES
lLx9dFUz0fNjjVARC4ssVDxUEnWhWaAd+Oq3aKtxBOK+jNludKCtk0F5CNsGR1VzbYBrT6LWL0Rz
Dw3Urxq9zMqkIodx1IDtYZb+QdDCMTw/zP2GVcWaEUp3USbMLNmxeMoZQSx29w0p72PXye+j408b
BY3VuMA3JyyFs9ScjGJJd644bwBpNJ9stFn2nclCHoUaYW46Z7qR000t5Q+P/QIG4w7O0c1hz5XZ
/qdQky9QHFgSoyBcAwQtSjgLNB3FSlQHTloVFRNQeL10R52+cHhaRYxRnnqhFacUf23W4WePKeLt
lFdVwJVJhTm3NQ2pEk7HSvjOPAFnnYx7xM1Bi8S9fd0KVNGnc6U0Mx/+UKcOjD3u7kzoIjoP0SAf
Gmwm1rfFEMtEyiatGykq7T0ohUATYAHydLPvD0WF+b7byc8lDbADtTeUTnxwLOC200kjUjCaBAlp
MPi24y0sNv2Yts8FlF+BtV3LYdyib8PR42znPgko+oLc4cZCK1QBvYKms6rr2dh3EYquIMBf+LEW
6NAuxqztSXFqKOuLLHD3BzrHX7V36eTRnh+dPldggHl0WQrkPS8oW53KKHpiPXlU4v8usLjHowQu
utCs7JIOda5+cis6x1KMdmjQlMTs+suXgGfC1PbCZ9DJVRhT/scIWTbxdOE0o9f++15qY8sPktKE
gHaunPkxgXq3c+TJOkBmqFOmLXyOnx3sgiKwehkTqyhO0q3+AWOWPCY5OOa/dIeyfJoF9tOQR2hK
2bbd/pbP+WHYCSVsIcpPKvSDvZPQYPUnRpvpNzLqymVowuQ59lFw5ZIvh/CIGjtAH2shnUE1md99
pEujDBShvim56x0aUY5SJJu1ihJjk83gdWStJ8GAZ6s+mscBwAExs83hxwdWNjm7B7nnWpMmQigt
E+600ciMBeWJUgcuWHcfg9RACqsmvZmHFrv25bY0eSAT5WvSNUUSch8kuOuLip9Eo3ECj5eij6G0
hQ6UBS8bIAVlSwW0r65Xa13ox3Ui55dlbNT7fKVs7V5zPqM4vFcFLkRcfZbliOr9RjavROJZpN04
JBMBksuZZ+gYg9CPsu2qJzRukoQe4UJUa5a9dqZ/AW+wO+g9Sapp3zQl+g49jZCvoSxVUWlxHILX
RokPlI4B+EemjCyQGFMLsQvdRPENQ6g5rNy6E4g77PJdcOtcmWow4qj/8oNQEECpPbgIou87//nc
pDfZkPNM8uBpndTVyJgL6vd68Rbf8f+Ua23V8ShPb/x9Pn9KErjq1jvl/yZVyWXejJs4uMliZRRm
q1Zfn84xDQhsKdruEyC5OWrz1ioo/rPLSrM4go/RzJsgfGWyU33jLEcrfCy1qHB1bzDNtkc20+Go
g6t8asnZxN7TgGmZdgbLs41e7zsAQW1K9pznmPV1B2C1Gse94eCBIBVbUO6DRaj1P5ANce7OkI+6
SuLqbe+SlGA/L5l8Xg+MpIr8hOdbQzKDjHFefeF3pC7BZjwjKvFz27exaFKSdyb1JkQ708LJCclb
XIscwrWjWMGIeofU7ZAbFV7SnoQhm2Ngtg4OM2b9sJ/2oNEat+85yIeCxowzpTycdzB3GjQLwpHN
S6ozdLSQE8AY3NHrEmXBxujDp2aD8tvD+sBAAUY7eVXQiuBiFIjMPwJGMgWlwDkQkWr3uOhhTYeN
zf/7gAFusQ1tKnDqANxT9NNn5l0Qo1fZQyvdB9CeRC/aGETJZzP+H/pIela0MiPcsm9z/t9CcR9A
E8YXrorQt88/tPH2XodM/QizXIqZoM+EOo6Xfg4Dt/Cgaj6sNzYdCp8GTpo16TWXC7K4v+kqMVXc
mdNFwo/J+IAOPnbFdC1HuwZusmfRwAB5qrBxzUCseY3mFrp87A7ysCFmXx9qR1p0eE64yJ1nvW5Y
SBwIcyRWEm/rR1M7DUrriXSufPgS+YOdTSzxS0J0cEPXsQhCeO7Xu1PzVAlyUfBHxl0JDzNodNpi
gjq8IcB+iL8VDhcN0NdG7Rqyp4nBnpG0TkRRi2DQzee/qR4HUC0ncF1Ls/L5lCrYRy58/4JzF+02
ZnHyQK1H6Z+Nr9beU8wYgPDdo6xGFBYImTeobBJKN6bG52plh0o/Gu42wweENkBotEo93hlRENSK
Qg609MINh0cdwoavk0EMCvaH6jdbnuEWte0SanJLupQ32DZuMVgTpY+520GgHM0qDj6ZzJIIC6X7
Lqthdenqcy/L4o3ZFDpCRzlrjVfEeLolnD3cFgA0kbLHWb2FbI97krxgqDqNaTVpLBaXJCay08lq
Qd6z0cYNzpZkWh8fWukDnlh8ZFqEcXrGgJZu+TVPcxm88Jy/hwTK2CfMByoeEOKRVo5wCBt/6LE9
eoRVTXzxQPKjJC3b7ugH8bqskUwd7ZM2KiMe7cTryKg4cqceHrQhlBZJKhjPa20XD0bP/syJ2QzZ
ICojJMV2lr4XWDtTnq6UuZOwx6WARdKtc74Lzt/QV9vU6rG43uLKFPGOW74E/ZHeUxkSHs2V1f/L
5n2uBLDt+G2AbZW7Z75fx1ixZhhS67S5jbsJa18V2enHSzp3JJVTUk0vstwfzEuS/A6t8oIjtduX
C2G8e9pT/5w+FCKNMFw89TrqVH8+CcP1H9ldHubyGJ5n413wAJePqD/i2zggkzDwn5zkWl4ARPGJ
E348vwWB+2QtUmNQfmMjvSo2YiHZwMCfoYSbdaTLIlIseqfSp2G4Y3KgQGtBHihF4OO0gnVIjeue
e5YRHS1LIpz3C8TLeCNDRn5w+gQk1yZvjtTqv+R1dui01Vq72P3qDyLnl5GXMECeRVyiTktZAJzc
F5ziTxoDViJVrkJp/DIE/1lpQ0HIO4X+9htjm7g0EU8y/tFuqtdxKluL28ec+fgNiTehMdWPz3ka
cTox5lvy7xR3zNYQPbrT8s6J1dKeQpkgsJi2Z/Evxk6VdF4ma52mO2+T8B4KQBZ64CjEodWVmUZj
ctHNyWlzTzu1PaLGK2yKXRAQkGESSHYvEhaAEHlHMTKa3OEBjFPXhkV4gL2KmPE7Ixe4ilJIZVN4
5Xu3FTXYswra+Uckz21DK2AbQwQSY6/n7jARTFonEmXGIn8xjNbEQPWRt0b6XaV57Ugy1lfgr9U5
RjzH+p++PBJGurFusE/EO2a9La+xMcfjLaD7uvRuvjcP5zi+rBwuz9zoIZt+jVhz/ht3GUcGIU9h
/A1iVTPYbRlYT0oIjN8lvspysjXAfPTvQSJRlntPbM6RIO+sxhwuPs5EwjDwwo6pfnJMgDPEn9Op
KHrBeOeMAYnO9H0nOyPIzzs7FVHgWIcMN7ilaNo45akzw9jY+mlyGlxhZ3rf2+CqSxX9ma9Uph1N
JJsSO7xChivo1AUBY/+LmRHHU+hDvdqX+W+7rcFAkX8/NlsoZYXs/gGfrrDhZjUf1ceLaG49/Sv6
JWIirq7k20hRKGF2Yeuit4ZWBCYd9fR4YJSvAIXEE1Xd9Mg6rg0eg8rDleV5yV5IGx7oF1S4azgP
cYU5Lqp6TB/BTfh+hpYa2QtipIzqZmzAn+L/L2pzZhjECaHcPZ9T27cpkC1uxoydcT+sZTcV/u/t
95hZpBzqvSV6qTvssVzVJ4UluNw9uNhYRFMWmMbseEYvMDo9whQKMzNq/n/Y3B6sBJGfrWIQEZS1
e4mcYzqyf9wyaL+vjPl9p5JyEpgI1CP4KvswSSHeZYFq0c3h8eAbHkFRWFWuqJs7r1IFhuCMhFLS
WtLkNlKzi43/pKsN+HPSha9I1UDFFc2kI+qWBgqBo2RTOBv3YTNZQWEzFmMXPukgeeHPVlklU6fk
WUxiyKDtfFmERSSVFWEc+4GOyNNrS53kXIPkNynWLSQzD/muZmPKwoCT80ElOO2WxBi11tTTV+rc
0rJ6c9dmP50KNL0w1GRF/M9fwgTYP2eQkGP3CBEmnGfamO/s18QaGegmM3YWZ5WudKnAqvGo2DZQ
vVKTFErukE2Ep8PfTpsdAnn9p4D2mVtdNlA7Sd7WssW+fMjdFReVItU3X5TgiDVdmfd0/kr3cLc9
7tzioY4pPeSHnh6HMVd5GAhgDhVLJQD0Jzj1g40c2fBNG8Zjq7Jt3+JMLfB8mLFKfEqucJAhULXN
tqyiGanI+Ouq7wwz+c/G/3kY8bye1fsDwjy53kF6Y65+vjeEPtcmfFyucsDdby8kxLCZqyI1DVgg
iF5mHw+5F02GccuwTlh1PwEyh5bgByR3FufiSS2hnLILUwgDZFRvaNfK3GdlFSaEu86fif7bmFzQ
uoFJDdY4mg/taxSEj0BNEvp5WNBNnsKhHNWy2HH/ErlJhw2ygPImERtYn0BBcTkK79SLVo8hH3ZN
tO9+9LvhgH6BqDSUu39scoq65VPiFecj0adiLBJJxED/GUyh2ADNBd3stZ8prBSric7YfFw7IYL4
NEPlyiJCFjOiAfLcN8ozeRAuXO7NM+lRkvf4jD711+UPJLeABEnToJxTwDXi19DnC9gk1uWzKK88
XE01Y+SurdA9BSnk9NGku5EG7Xc6UIuQ8iDqrMDX20F39EtADsM+LDJvhXCUdW4HNeDOd4LqlH0H
fKcYRvjJGq4d85KJ2hyAiHWsLpmeva/V4DXIHI7mq7lZK34nYr5Jd9FvKZpEnpesgyoYDz8IuRkC
r9jh5IqdpX4P+hdAP/s9uLpJBbWfLo5qMeDmbHWTblkfICMX9JYiXasETS+dBciM75r5FadNDTYB
n2WJiGp6AfheC6A3Nn7l/H3LdVqc2gSxMitJcqKh/H4+nh+WVg2pbshzpuxAN39/51TyBuqYdda7
/DRNK4NSs2tqVhCLI6THfV7jYSqfeAlLF9RURDCXrmVdINAKAKtu417pecXbehC5srNzmioyhKGL
LpU4ulkPIs7RY14AHRIdPnT48LxT1DoxYiu0VnGuBuiEtxWHVGBbZyzlU2NaCMWJLC5R+hDhkPTM
X4rLt7hBLa/YOu/FSl6g4qqV8rr0PYAKRMPwNAODfw7Bt4VjRpotPszZVOLRLAeTvNjrx0brXH4Q
tXAqyb3ltWMk1pGY7EWPrTFZ1bU9y4V4X3xuXoQLSLaKgJ8ahY16hHbUNI4zqL34fjCYFLsG8oM7
os3mXr0kT3PoumsPDggQBBYYBqQK7VA4DVuVlO/HBGOXCx0870UuofwhJ5Mp4MNusHos58g31iU4
xVMB9IBLx/na2kBPCdEQ9luqTd0vytsJfYbMUpWFsYkwtqtVzAIO1AJXqYMHtEQ/guyd+4kfxyPj
pqC1XF/q4MJEdUkZQlWeFJYhx02SUDh6dV+BVTOxg/HdUihOpxeo+LwmoN2Co8pukYJyKZ3Sha0o
VyqDXF2Sq5KDGXHAr1tUcggvU7bTpLj60SdV5hkPTZu6k8p4b+wZqW9dpAUgOKdkFQvfg58PbLQo
tUTUbMOpT4rX9rpO06Yhgh9GXtvyK8g110WTPv4IzImKDZL2E5EXe4CKJg+OqLCN8K1QEps8zaGH
krk75s6Q8nW6D3COnMRfnw975Cc4kzFPnfKQop0BKsPVmgMVVv5zRb+gs0S1+8ROmdlQJ4JOR9HM
3EeRDVlnCMrc/bHbDzxoYdhYt7b/HP92WRs71h/Adu1Wvj5h28mvKyWcoEN0qm7Cpq+Cgb2XPwKZ
Oylvl1tWO07shhbW0ScgLgSp7WOhHoEj7awcNacQzjE56wZMlinsPI0LFE2uAV0hliiWEUtMXzed
PkKDFGmVrWoTOktNCTUGGGiVqMnSDhKOpVDClP/PMYqv7Vl339ULMHYablxrdlvkgwXI40EWgnLu
rr4UYRkRWH0CytP8ImbW9unoaZjHkAr4+CvFkJmAKvHjjN/2/qX4WkMj3CXpSq4DXMQK4Tmx9WUg
CF5xnvqiETO9Ye1fJWPo0amqmUO39bPVVi6BPAAhjfU9dMMX0Uthwl6LwHTBvOlMrp+uMBxBHUKF
0B+CDHRdwslI+at2XOP5hZtPfMpUSIhOF4/fspfMKbc3TKlJ4aREGzp1Dxe9MSp7rbe8RJwnRGUW
RHYfL5+xDba1m8vaCqWHWnFny10lGPUEzqA1QJ0vD4lAMtb/c2GyrZtZXWY9TNImmEJWuxeP81Vi
Q4vgetg4mGCg8b+nflWbFEXJ52G83VqWlCtikWszVPmKo0ZHdXkYKNvWvLyoGHYDNla/J7oxzPLX
jyd4jJEkjo0wP3MblzkyvOCjODVIf+CggOpoqhWLWGNkLD5vAOE5L4yo9ZAmynxUilloJ2Z+EPDc
5eH1ewVPGdKJfGm9Jbi1VDG6aKplm2ZFzrll65+plpfuP+cqHit/dvurN/PxzttX+GNzLZ9oG2Mc
AsPOR09ViPt0f3G2qrwjZmjnX4oklxXivalpjA9V9xxlup4qTf7nw2akF+emUacKpfNYy9RqBq2L
mf6IVxn1A1VUl/l6stwrt8gcy2VnOLmnuqAvesLdlWgoZ/1UWrrkxgqD8RzE5vsThoNLzG5w3wpt
whrdy/DS/vYUl+9ul05xLp8ZyF96i724h92s5/jbvK1bto7A/tkPqQFlibomBw8lZmhLToxKNYri
nJR/vYuyNjihP7TxzBdD1zTce2fvFauSZzIUm/ABrDnnWddYbfyIQVaIYg+p6nn8pJytrolYqEdN
gP+3oY2O1PHlMsf4kLMmW8VFeiZpuGsv44pcYKLRuiNgkoChsdwzew1xOuvEG3pjldPQme6yYC8s
81MYfmr59mC8aGePlLGaAI0t9kFLr6njuUgqjoW29//ExWLPTSyb4LibXMFpyJbN0D55nlLz/zNv
biiv3c+9htNFXUKmIsjqSYs0v85DdkIZOosRoAC8rcsr7QN/Q7tWFjMsnosR7kVN1L11OW3mCWy8
YKldDKSNI94qPoaBs5p0zHY/Pb2UqjyICtcjGHv9y8Okzk2bZUAAmtuIVDpXuGEuMr3ajkck4kw7
TNYj/aZy4b8rTsvS0qjO1GYt5oQpEmVaTJ/ULSt7zP81BynmG+rd8zUf7iTC8fQ+bTwIWrpfrWSL
zQxGv44dyXgfIiTbuOXSR3CUy7z1mR3dDnlguYygTQKdoxMOCCJzU7MzZJJ+vxEhRhmPwfX8MHnc
h1umoB/ZNvxWEJvnC9X9JthUTxJcbMBKGgC0zMSobSFvLd+aIeSFEhw1hgTEf0G50b4tAD4L0UfM
Zm//hOm7ge5XjekEGOvrIesAFh1XlYblwiH44wmEUs73bve34WHaakDk6Ow3Elnt/a0V7BDpIcEX
hGqvy09ZVfctoL8vk8fzqJEwLj7pF4yQgph2nyNVIlxpBqYx1oWiTnuzEy0r98fmk6KL3Ag5/ITu
fcCuByDIst9dAgy37qe0T7WEUPW7waRfHBSpo24eFgj0IsQR05z+xo66NfKZS1xx+kd7C0lurbhV
AeW9zViUV+MSLzD410mSLTBVf+KfB9/YXJp35dLCrRm4zVb+E649PIQye1IYK9u1b0C3bDnqgCqb
f19q94CJ4hgEGlNcrBvfp/hEHcvff6K/n/Qji7ZuAud0w+8RG1Otk/YcMLiR4Hsu9ucGAYuxpNgZ
5R6hLG+E3k3YRNvqM2ENvKTD8Y3/yCredqetpFiS0WYL2IPdnJwrWuxk62dC8itgUqBvV4EuHlPu
Sk6E6smUInn1FHoPF6myZywn6cdAXyDgCImmFDCv9TANYrP7VpEc/ZfgrdiIj0Q+JjzAbHh6cGhv
6ABz6KZrimOH93Hcj3XjzJxJV+AKuqKcQRSmh/R+GNMftpYOSVDeuC+Z6i2PDplHwrjGZdk+J4Hp
n/TrsF/QdIpoCgdDTiG145qMhSJ5+OmLLoNV6UUMcVJerPW3h9/mimnxALsZ69riK1w7O1U2VEqC
RgoKaRixxb9Owhj5xSAu6I15AADDXVsKjwymLVkcfTn0vhINtxtCxIqm+t/yfKr+H3x0cO75ult2
VOcbSQqIOMbs//HvzTg5oh4hg0Ya4NcHSQysK8LTEEX9Yjtj94IERmk87mSjP5KbYrSMJ3lST39L
oPrLm1dNUqpBGepXDM8hpU/MOrNlRJQkm6Ip+Y8NefiY2gfTqIoHwLI8/T6JqDWklfuHF8Rw+q6t
6V31t8Zmtn6528Pj9U/+n/Q8nKKIorjhjDT4x15+N3uGNTw0R0unZpetGp2HEk31K1bGKoC8VThX
PSACAzT7gRXWVdzhFOifAd3ZicuqrmAC9h0lQijnuFQPv1QfRoV/q70Y+an+TKOItzI6p+CZKDxr
tv+2RJG6cj/djQ9AD9D2WaOE+jFWESpNVeWo46ZvIYBHmYlJaUdGEO13kxWDx1Ed+Y97OLFy6OX2
4AlRZ4bA4XcTr4pSIPNa+6j3klO22Zmk15+UDirYhzTJavuyJsS8DSDpDEe/CFR1XBhJtNe9p1d+
B+yItP+89kMucKIUAJoauFYqpI3uSaawRU24hX0YUESkRWXsy96zaz8b20wDBYQk6D+NauH5Xy5Y
ax2JUcYgQBKPEKBWbMED3t0e7vGDoUFRQUeW1eBxaI+SC3PAXAWl7UldxJFKnKlqHWLxNAgdgMQK
jupRinfT4eiOfrVrEuFKFAKYkJjGBZx6fBzCza8afoB7pHjEXIOgUigUNSp51/Y59mxFdTkiCXDf
dGO0xlTVoZiK94NGPGHxEeI5ysv6v2Sl3OjUDzEDlBTnuZeivoc5f8EDxIEVzlgz2wxWTbzgQPf2
iQtbpswxdXviOmy06xh1feM5dcYCwXnu/DnUxVfHOwcZyzWYh7LEsQ/MGxKSt6pfod1rOAUGePsb
RNyR9uL/zxMLRbh7b+xxllLEicDd6QQMEEXRKZ7SKGlwaTze0ZPFE2G4cmxzPArjR427bJ6lnnxt
Nw3v+GIO42y2P5teCsjCSJ4gKtztTc079ZhdCMID3l/CwSAYfUcvV2EH035amssOos6HYfMcgDcz
apKqXVBTr1kgK2P6AaHV3Hxm4ks3lGOPHuSO41IQyVlzZLA3TvzPzIbzcYykrLe+o973Zfq3Wqdx
yhtjCB/64B7bl54Hs26CPSKNDa8JbWOasS6Xrq+xW3RreuIW+tswL1tfLO9ZJS+TuxV2wgdbUUAk
QSg9N2KKJ80hq+3Kwd0zdbjm1HKATln24R0wSbyWkYN/an9rOrdlagQWYqd7qQRRZ44fAEsV4Zet
aYZzhyk44SwltwLWxmjv6/bwS2vmLxFRZUohd17xjWjIJiWNHxw3Fkd9UZRN9V5eJLsk7T4BvgFR
WsqAVzP/0+tyHnAdBqm5MlZjQq1iG75jk/joZXnM/vZArYSTpy8eY7mG5zL4r6Bycr4Q7M+VDA0y
CdjaqhFkt/+2yc/epv4ZYTNzTFy8ci4RMSmM6zAAKQTHNSOqvZk09P5gQ7dHOZTuI2x8x4wBhNqT
uhu5MBzcoJ7Zp9MWEUOkJzEUktn4qKPrYzbFb0hSa9tkjftFxkG+gfqEgIjGLZDbxlD4y6BVDnPI
/QIm0FvLJABIt1zCmYJ492F38VMS/McVnUKyiFQgnucFtbQiB3nNYYMIC3Nj/0HW4nTFTlOA7kd9
wGCpW7H4AfwP4gOBIdZABDfc7BTa5QEK7EHVT4XPVTaGU09orwjyj9jnTJjmdZgHNVNx4TQ+epYY
ELKmiTy4XhBScjDXMprlHkmOZdf4B7MiiFCz5n0J08qINpq5Npi3xJ7phxVCShje5EIITWEI/04p
OD/3h6US01JWZgGkmYRP7pKwdZ4+H3RGvJciCoCQxDZvqVlO6UtLHXZe7UICAuDpqrr/Uu0QiBfb
fpH+a0ZdYX3ObVG0GhwL78zuT7fmuQ3e+DxR4Vfq66brd9R+RFL/jGd79wq9CCrfeS1+BXKuOXlx
00r3XR+1LDI3Ch6LutZuvKSv4+aq6R/HXKqbwrHDWq+Ye2/BIOPZTLjVHBfv+idl0xbXLIF6V0QE
WD9iaSwAi1X5RwAi8QUiCLVgKbV6oAzj76/KpukUmN6U05+Ka7pHcPwKR6TTKBE/fj6gbp+2jFiB
bkoFDfbq+2lbwNWWqFpNPuqJ0gwRxENsfXwUMAGIYhT5Fl3SA4TgHA7kJYeHkrdcBIezdmuIoX7t
A2ggknizTMpYsVHYvgH+BMsKy4LD/WjB3O+BCfb/irzg9aODOMngLgLvJ1FlSwhHxH9GrOO9x/6O
+DbLQNmGJ7HZFs9Z5R7UqoT5njpzhZ7R1fLTYQXozZSry8Q1RoHIsJuZug6Gw6TyyPGwfvWuI8t2
YSgmMsY5LPUGFnxXVX+uys7mvr1Mx97thjh86IxTgmq+WjeKWEb0oN8cxTmy15i1b0FfHIS+P0tM
5hbEZp0SkN5HaOvNDBHOqjrq/3izdBcA1EgfK6aBvnsxjDmffL/z9+Za6sDdo+7RYuv80AtIINQ+
LVCt0BYAD2+Cy+7HbPA114hpR1VyP5Yuy7nHhy00X0PpEO9emDYBtFySyniuAoGVmp72QDLlI0I5
2lQkcQe4UixxNYK9SasqwzA/DnYmuuWJGmE80D6hKNjkB+SAVbKbHgXoz/rLqT8996MT7upiq/Rx
76TzUOPMAAWKLo5oRYK2AfPzwil+FzR8eCczau+YHGg/ePdCx+kefLew9Yj8dHP9Vb5NEWuvmn5n
Gec7Gwt+dU4JspOxA+7rxfUL037MmFiNdiq+FgNCBPyCea5cJkDNg0G8B+QW9tTXdIy4Pq0rYVmk
lvUXJLFzf9hXvT60PyH48/UQXBt5hhIQxeNC9E7OVT5yKdxTsM9H5v+ZJSL/QdrYbHvNsFUqbN65
FIWFQRF8VJz9ClGMYJnbBQEv/Y7kMM8S1jxIp5ogPlE8gECm2iaw/+tODzgD8TRXfKnBhsFCJFRa
ktvZsw8gb7rqlZrhdqOZimKAC3aMHsXd5HJ1XMLMQeZk81AdS6GBcdS0YVrGRj8/jKIvYfv9t8r5
Jquq6SqsYAqwx/dz7CwMEiL0aK0o+uNAJfYbYaSqO9GWaxzitAaB6QgwA/cinEDpb+g6fnO+L5rp
wsjmgLXDW2CJK/EDjteiHrbpesM+kCDDg7+mq5VjQw0tT5QBS5A1G/v0xfi4KqLFWv+f6iLR6Gxe
a6/AbcHc+LcGGl2DUfwG0s53lH6euYzu+KoygrT7Xa6+af/BrlJ/7zleezkmquOG0O38HH9iosz8
k4yk54pU3i6nwRYGcMnuMaxvCSRlB9STR6RgRCBufCL5dyA5M2BLNAW7EcmQsXsTyYuTthqrnMf3
LRquJZLWrEgsZL9Mk1RKhXJii/azXdtzY7pa21ERn+lBSkUrWvYKbpoi5sENgwIS0bi2MRt3Ui4C
enjejjSWCLXdQ4A2T0hBMk4fsIMv9+CVHKFk+B8ZMclIvbZM7j0U/ywjftgyPnz3BtzykU2xX+7z
rlT2a7dh9xiQFXe59TlZVif+9zytIhByEfnL0txOPstqZbFVx9OSjeW370D9V9k6cCr3kHI4JLtD
3zxlBU8uXEWidsG3XSPmQT37aBJuU9RZ6j+LtMORW8Yieff21Wxp4/aylIANUwGIASyDex6qhRyb
jdr1IHqIFc197LmslypKBIf1N+e8SqsJ92j4OsPZ5VOv5Ajq/n3My44eTbX+B6dGnl3+yCOKELnv
8idHLIZvuAPfJkVeeq319WJUyOzAgR4ueur/EiCHfLjKQ7UdGmCnVTFSRdZ87d7hPX8kDa06cuyD
TsdwJdjNzJPeluq+ICPg/Z6JsZBRFnV+hQoM9P549EiIHf5J3XVCf05UPuDZMSBTu5DvFTAwnX4d
wXhlXH4I6qkxsIgdgbqH3lvXifIiRVxlxLgLYWshKgM9cygbdG3OHFz4rDuUPcsyYLsjylwXwbpi
SlUTcyrRnvhXj8nYV7Qapfic0v/XTeiaVxPvgk7R6dEgxsJePziufozLCRzn5DVQ8f3sVsZNNbBX
CnELg/2xM/w5XEPf3D2P6rvn+5YQC1trOlV2mSQToCgXVljrEQFltku75mWQReQoIhxTkrVWi2sh
JvlYb0cMQOohOydLkBpP1M+iIJq20jw68W/EyhcbNG1/wUlpx0BN2PRWpV/nvTBWFA/g9nwISD/F
Dk4jVEFTh0rUl6bTYBrF3gnR2ZPs/3zuZB6CLZxkwegtOC0kU2/3oUKtef56c03fCgEYnNYA7EGH
nfR4HOmwmind4rja7eSVve+PJFS1lTCaEEh4A0YRp9bOvVB1BerjXYWMjUD5sBieEr9LSvqae4Qm
kNbP7yJtkoBmWBIHjHpr3QAYriWZFgOCFQmtFq86N/PYnPpzU7LQ2XtKI5cuyIVYrjELf+Jo2PTp
LxaYRs+ywioRA4AogavDJmxQ+ZX1lE++TZDCfXvrqX26RD1RoXmj0L3zJZbp79l0lG8BZGf7+RCc
+MTYGtTSgzCSqIxmwwPgW/+F6vTT77fag0x1PS1M/mwYaJxmTjbXRCHOXEWMiqKWJKeJZqzOUAzu
kQMLQqwX4A1XVFa8WSnJLioCwIUiyNlFTNJKdR0JSSETGLZRLJyMwsYRD55uqoIKr8aaYYt5V65K
/mcE9IrBfNqB9vj1j7hvyxrlp00ODaXqBWjV2Gb6wP7qLHLu2MaNkjk8ipOTwRLYAgoSz3fAg79v
BahrecIG8urtpEaPIWxgTSQODXGwxKXZaBUyIlUhPWisUKKUQVo33dISljCdaiI9D+AsNL4t8Ysr
NhTJaD9eLCqtZdB/HLhAvu28BGXrPuJwxbjiruyU3gdu/kynlWf0G3utphReZKVvu4MA09PQyJzp
YRpnuezO65gw78XzCkRo6E6F1CEpbMIqU19hhIGJ0vqjcIoXP6ErcdRJFcqWcD8ecx4E3GqlJi7d
HUh7Kr6lgHWgCgusBz5hLioerKPwirU6/iEoPuWkianokuSnDEca50gunhuFPwQD8XlwxB9uoXRR
ZYkRiuT82FLu0M//gwV82Ww1sbYsUNTVtJugsajktuK6sjocLFesh3dzX82gkl+M5/0ZlPrJAZM8
yUDefkwHF9HATsY/TEydgjqzdHFn/tWoLogSzRSD0mP+cbgjLlXVfOVmeVl3xxfZe3PCxORAk1VT
i6uHB88D94I1S3VXisj2nnrAd+hNAW+BveTfQC/oQnhwJ9BktOJXWW/rcGTii7/cpa8clq/1Msyx
IOdlDg3owWbdqkT4iILM6hNd40Fuyy/YyC7Jup9OsJq81zMtnQi4XJiLgIhZPISH3QzK07aPSp2G
7zmH6RXKvVMWIMTRGdbNGgc6DCJV8Gu+bf9FHdqkt2R4HwNkv6TtwGGhoEIEriVeudBC3UTuX6RG
zOnHKtr+QTW+GmI5DcB5GcOmF6iXy7ZyBxr8TgSvCJxDidpk4BzV62TogkQzYqUZNaSN0XqBreiP
5m4dhGSM9vA8BzUh2QDArpV64TLgLkjrq+H1TtKFi/xLnbjWfAnSX3kPVlcMPJ4w+TdX4c2gIKS/
TAcQEs30aVohWoFGxEeX0L3XpvzS8XKxOHRK8gP/18555U4mdkBRPtAHjdflmN7CclGhdTuuDG4b
X5MJMCbTYjffJCGKP+5QIa0JkDiR1+54DyOIR1dqyUV4SI9Y9Mv63jMXu5P7epNTUHxuCGsALPkN
gkxbjpfHHniENC1cRL5qUAf423J962321y4KDGV/V4pMYHEasXohFAkfZLFmXhu1+QuAi2exaSVd
LGlPNNu2yiI5HhTIEJTVWd9R72REceWmGVA5da679vC47SkWfD3cVZPj8dQ7/8Drq9PENHvAJJfP
mnS1iF5c2aX8HE2r719BeBjOwOmUukmauTj+EWtNfDxJ3eDkRIbX2Ld1PjSgAdaNqe6j0Xxv0G7Y
D966tC/UlrG6qNaC/4QtsyJBQIiw79F6TEOHHQhHfSbAga93aYMgD+d2YsKmCurbIIVWXurPfXv3
rlJZ/MqUfBIyjeSp49KRuiDlDkk2zb9MQO0MSa8Pr8ENUgSPda5qyvIiJhd0STr1Apu9c2R2WGV7
NoA7aKL7RD3ZyLaUP/m6gRAWc6VwYJwoVUN+gPaGxgH4MZwVdlqBfzqCbKhLhO/pgAjq7gMEVeas
joVRErZF982b/QTbg6oqLAkWGQMwTPbnTv5sANlxSnVL5XsD+vUj0FsJEAyBCjWB/A0bvcjCPh97
Hgf/bEIRWLfJzt13oQJPbS6d8i4L2FKrrNdKF+8QWY1imq5Gtp6jdWtSw5Se057bGXAIvm3P/As4
4gT/lpKIB6vlO9kpQO7HgRHqUWXbuIDeGpwbPvtVBD6YpkEetpEpl+X3bPEWY1jXHLvhq81lanDH
RKS8q7IXKtnNSpeVftxpe78EYoadtr0bbKAULafwcW9jdkftD5wQb96KXnE0Vtv9bZ/OxYFvNuMy
GNlldhsEpwtM3HCdHPPlk+Fz4oRJyKf8O4hz1YA8Zt7v4tR10+0CGWzEfaDfvg6+u+c93KoVAft2
bUi6uhOW0hwYFkLRmKVquwhi9kDjPgknwtMKue/Zq1mMY/zmPsvQAXvzEKrP3sVwZOO+8n8ale6O
nC/tZY6ZzZd95sjvsqWPWUdPMKDv6YoWutspU2cLPvT9EU8Scugrc2vOlcvGI1oTRRJaNpW9hUoc
bkV8746pbGRPwVqTRG98/ENoWh3EIyyuqbWH7TZyBzdX1EDU1d8zXZzZLTECzAwDqKxe/szGCm9D
wv5+crYnedbfgmRAl7UVtkWi6cKRmKjHFCXm+LU0jFRL2JYllYkSEi+FJLHzj0br3wMYys2niAwf
4YbEM+e8rGpivSQN7JUhlIL+U0P/bnWYCB1BkIvx+akbpFM014zHa8wDzLdGNPtZJ3eLyQV4QuyX
PfBRLfbbPaIaV2jiLf/uBI8pfSHKhi+HyJYsecYv3ml17XR0ZCw6Zl5cb4ryoW2x52LSE8PXwn2x
kMHYCs/bSvV/7Vu/+HIsLSoxAS/kWCk3RcJISUhcNUZZhX3MgcHjVV6gHP0cDi1k9hg0Oms2zgV1
lj+5OYg0z8VrGZm8a9Liut0NNqP7xrju+jnmH4ENRE/gxj9Si5SD4etC5nstGniCBYubjKSDFTJT
pDQqyNLcQZoyFLW8QvHbGfiU48ELdIg8BE2dFy1lSucXnIL7UBQgXnTfoDR6lDz2ceFv6KeTKlgS
3MIeRkRFuYo47NFMZRZvj6cSGqln9pkqZNxkEVZDA1abXmRNCF8Sluelb/eyR/e/Y4F/TyQDvzGf
fA1gbZp4h5N6emTtpLJQq/fLGGyZVQAjSCGc7SVDYQZHzSp65+twr98TQDY3vc7wmMRqiMwmsvkt
05UUiTJwKjTjCGNa2ctM2fPe2fRmNYRtA7Q69bRc4tXTYcD4/WGgnMDoDx64xgxAtY5+qRLFBxgS
xwDF+h24HZTqlncMIy45wwV5FUd8X/cruWwf/uDcK84hvvZiuyFgwaZ5gO62K5SeyUbxRns2dTbU
pktp/bweGJ3mLD/sjGKzCWI31BnWosgXsTtghD6YFVJxJyxZqMoEJaf50dnIA1T8l7YCryQlFSvh
+ROaNUmvFVKAMCCdb4cCQLwxGeypwUONr4SkP0vYNDW6RZJAGu/ffVNCQ4TjUNMWrc+EWEG4/yhL
43OIzCRXN5c54KLf/fkYgjBAHcrBRm+fJDfyjyO7qGIIl7bQW+TicKaweKg464ngy8PYN1ZTgHSu
1GLSbLdaw79p6IH9FvoVN3SxcMzc8uLXScd38nfe7XKcAg3zj/EP7RShPdeVgWFSIaCiXNh7MkWo
51ebg+yuPVFQg+Yp4YPZ1tZmdTCscKSa+lJnji0lNFa01JgoqLbMAFPWdOndarlbbjS8fSdzCxVr
bbzjiB37ZxtXOv5XJerDYlvOTGtO/aGzhisKjSF6XeMLMDWugtVMy4K7C0k1onfVLnXZv8KSl4h4
vuWPzDPHw7NiaSG7xMjlLOZLqEJZtYV7dwRPqQUjaxzaWi8kMgy8bWPaeKdYz553X7ak+GS7XAX/
ORJxFQHZ5CX4G/INQKmsz8jnbGsaUJrq5zSEaIuqQvr13XLxvigk+gHl5uCSPaQiCowBvVZcbRyB
UaEpS2HMBnu8cqeJiTBuM5N5N6JLhlIdwt7kyTjVpLGhbqEnNFWLBPbfqyi0i+xil84AhkIgy3ub
c6yHzZlsFIicAVhaZuYg4L0k0sMjwoA9EdqTcbxJqTNNYgWe4zjfhTWRkNSTxU80eXzcC+9qgrO6
bBXT63webopLnHvcn2gmfRL8wK0hXCnMgMiJet70H/Zi5b9DQ56E+iJdJ3GPLpByaAdf9bcbikSY
IlDFBCfyckldJXUrv1ztsgpwqSCxtoVdShYiIIFCvnloZ4OowcQ79gEW+vKa9jYOmSTyeZKITke/
/v8vrgS8EFkVZKMxmOyNFnofCiNMV5qMMCFJHveD6j4mgAVp0t4ZGaA0KC5GWKtL/kFoGtidR4RD
qS0hm8gN7/yo61fBXzJB/t2GtgqmHRtYHOSWQtnK35Px5PPeQ7+vxHslsEriwkHoToWnBHHzMGBn
nlH1aBlnDZE0aB/eXQpmQb/oNvwwQjJKHQR/BnwRw9O/q9iKAoiFk+8xUdobhgyc91owE2WLE477
829ATpWR9UQWpG5s4tplNvxTUp9jiT4sz/f21147TwwXXDrprMwASBMmNl68zbRbGJfXaNUxt623
ZrI0dm4aIb/Jnrp5m7kmFulSrntg+vwspuuxDGwKO8WdyKqiViGXcx37ghhkhyv0m2FF8+ICOYXc
6C52gC2syB9kXzX+Y/WZ+SVffY04JrriBIEDbSlLqzNPl9bLSo136WJZS2wz9jMScgFjIg75Al+T
vx1xN4KI+DNkRcaBpfov3oOgcQ6zR75c92a6gvWpWy/Sh72XDNqd3TOezHecaOLeRq01Hg5t8ssR
WUCB0R4J5/vzPOKys49+kQXb5ZRNmJhD4bXHLkANT612gMuPwB/CYMCY7WJwkRFedMiN5KAlptVZ
U3abl/aSshEnK9pLbIkEqkAofRIAPOF6uiHvjQA+X3G3ZaC4Dl4a9OnSZR/v46EKUPi0YtKv5F+x
44T2fWFWQLoNrQiNjqIDfD7FoEPDs6RMv3efNqVfgeaumXK+ZPGNRtSJtxvNmYc4AErWC3PryHGA
cdfhEVxGMUQb5QAbWU7drl+WKHDz929hMbBBk93GGTrMWeA2Kt3L+ByrBYHkUN9UxEfuJwnkeAU5
X888uWL+eUJlrGy9N8E03Kb9+6nBGUoJlsHCxLy1Pp9D5I5W/IA3QeVjIDKSCElxjgZRVpotijaK
Y5K+Aw+6SaM9Z8jpzBpeyn4T+rMTk7XKabDv4+nZHMLCesP24AeFxDox/HZpaP+ymlXH59mXAmPq
qzRxmv/hlBEM8yHoBragjcuyA5S9Vuabwvtvnx3JD2/NwVAGCNGIvnctXDG8cqh62WkCwI8jrUja
4CR1WgIa/w40TlI5O9xAqR8zctuPlFCLmiOQ8Sg215N1KWZKI6JzoMmk45+d69Lf3np7Sa8PQuNP
riSXPgbSdSKw+FPsldONtqJEnd9BdHUa0pH/v6XwrpdYfV4qHVku34rk0cDbeMvRy1E1XUKWzxOy
Fwy30UxOM/uXQBPTDWqGRKFuO2wWjrwW/zSNRtwCmyA/ZcK1D9cuAwV8RchaqIiZRtV3nwPf0JF6
hA1xfO8vqo7CidEGVJA1ZhtFUaZkzqlhmpg6tfVuOya2ZojtIGrLD+tdB2403I0kRwJZeu2KRB0b
gwQK4whX8sUmI9q2i25FSyQypH7SUgStZxFlW9tLjBT7nIM+GzztcsK5HZoQdxLYDftoyrSbSIF9
2u0rVmBWwg3APgkWAiUMkYrblgFBYHNnvNmecMxa8On6iF8/dwWB7F92lvArCB0SPPEVaQbSSBWV
FKQO5sB7iEWzN2Gn/t22sNSmW1RZBiAlgthE2nnJAeG/D1VES3AUSeWvFjiR9rvKdCmnj8wy/soo
zUDowl/8rsDfZoRUX7QT/mooOq68bN3cBw6kFWFyR07aBe2+bs3deAPBK4McE7B+HBS9OpXg2hVg
BO/oFDVGJuASZ2DUtMpSpY8cWlL5BYGG2w7KjUYJc2wF7BJt0XyxQlTN8WBVGE7DhqoPw8Pb2vnA
IBH8fnNt5WSjn+1Tc8edvUGpFsTB7O+n5onDxhFNKB9yIu3eYL683MLTabqbF0SObfCfonsoXdkB
UFtp/sSKIrFpwBCocf/ENJVDTuDrufnMLbJrxBYUYaoyyLspePWU9JqS3FzVO9/n3yVaOvo3p6ci
ZQufWsrXkOEYt3RJpUY0w3P+7UmKgSj11WvG5K9LC0kDlvtKi3NHjEc6EMFQmiLQ+I/dJ9bMmgSs
NtwLaI7CMUBnfzCg9YkfbKKaqtaQIHjIaMJoKHbquiFiehpsiDMqGkeP9zGMzmLpzIbD8SJuJrMe
HWwMOUolXtOEewwcA+exb7jOLUYaI2aIlq0n7NR18G+T3/fr52tp8J1An4MrzlWosDxJRRrdf6uY
LMBOzMY904qXbSi0XV7ZRZSBB8mmI1EMaoq2EDdoJtW+4GT3qICnJOfm8Q1Gfb2Pb+99ng/eAUr8
nU5Xw+S9n9ZH/NN/7YJBWte+hYc5qdjYuYczPfrFNv8l3ZBP/D4eqjpQhrlw74DxFHhPCVHoALYf
z/aIudeWrkX7J/UjXHjpNwB3NAQAPf1hSQIVF38ZAaNqB9J2a6QVtMpw5RI723ysgrxAwdPBAE72
VWjl3cGIDgUNUWaEWXLOZbffJxb/4oIgQE1QrfRLI8PWGAOZY++EsTAHI/DtgzZp73p/KI5pOlhl
7m7DsdwuRqB84db426pWuns6e1lTuwoNhf+cDR+3OmPV/mnrP6haW6GznhkGx+9csTDJzbh544Su
YSSEg5rSCxJDMnEukQaCTAyJHMu5vD2m5wdJuumdHCVFw0YzENuOjK3ueSk9TzzrNLwXx5AYJ6i7
ZQuxkVlYfh214UxQBPLBHqgL99AQXM8SnphA2g+LPt+63LEa3ON7BTGEZN4PJNA5ig7RRtVYSoIq
6V9v1o90JGu5jTdvvOBmsmV/ES4Pg6Mgj9YMdSa+Jtl9je0F2IT7mpWiAqzLwOdyqOXwFDTkVBOq
16A83U8QiPFczKTetU7zORc7TLcsDoYmB4nepQyWs2inuGfO9bQafDYLPdvdfnrWI/hHejNxTPDp
oBQo2aiuv5j+qu/QXWsy4/t4OC44ibiv8tTkDPnDNQsJ/aMW4MI2R5UxgPcoqBI+Jlzhq/SdJWI6
TDC6Gw0unQIAG8Qp9OpoaVZHIInvEkVkJeR7/xOdC7VvzJEWfYw+ykVUHc/TQB6tvvIRP8RDgXE1
3Oozn2BRy839W0POMjSpscljS6NtAQT5ommJOeKE4MJRc8yk+KfBKsqMacqsJ47qsbW8NgpFvPFp
o1Nk5OrgS2S1HDPBwm2hNksC2AI8lkbf7C0PvFeqLJhLwZX4Dy339B/gdDay17VUeZUiR3/6zt4p
vtry02Hh2FZxCAHrhIFmAlV1nbNzwXvMepleQhPeAxgR61L4hB7wMWhvETL4u0yJn5Bb+V1glgrt
xXdMzvjIgs+RzLmlASVTMjSmREoOoO7b1BPMroTu/zdz5eY5hA6MC97qKcuzEqQs8oKcSp49+dzn
PEyNmmoNOcJTg8aMbzri2iKB1oBMvVscGhcejh5Wj/5cWla+QtaAx0Fn7gyKiTeg+d7KbNi0yOVf
LgiG5XUS6NnRvrnwGZIGpaTrsIM3AE5HZvp5McLxIeXLM3u/xItIotrb2VpuSt5BVnUEkT9tTGEi
XeqtyYG2XUWNPOHVuvyFL94SZi2EU2OD7fD5L43nXLc1DoZOUHf3QHHdtQuK6dBu+ol0l5ZcKi9a
Dr7XvfF7b0i+STPkOT9j8yN6+YWiXv3Jz5VRmZN6KKTYkHiwnd66sc0E7dAJtnFf0rCLERjwGjFS
2i5X/DlJWMPJLB4CCLYHKdnKSODA5jeUFbeo9tSljpNdURxCq9+EGs4SXL1n0+ar5TYj6/F70mLt
8nBlIkxQ++swEy0a7YgWQ1VUE+H7r9RNTL9IikE/I15kXDdlCUgq8siQiAuXPxlC0TlK7VnUPjO9
KgA9FVXgCxe4o5CoPwrkab+hRRuk8z0f3J5wQ1HA7UMqs0OXJUBwLIOLJOZyLMzWzwg2VOrE8rMg
QbGMZAU81RYfP7BceJGSh/dm1AogwsAalo89GKQ5qa9E632KuvHO4udUIzcH/FlC3HwdNvBJSWlW
9Dx+wStJJHJlcUPkPY01Jm4HQhJcTWc6R5y4JlR1JdsGbQbfi1gZewef4GCOQu4rzEaZD4WzH2ba
iEu8pEHTRGHH4LTxabrxvVkMmr+NnwkwiHMYhRqP9rJpm02PInBwUUiz8O0LXue92odOdqCrxNLM
A0lOmuxg8DyH6k4h0rdVNetWCjl/aif7/WgT87ygl3th8KuUNeetsO4Ey7ESFjO1unhOqJMuQf9L
YHsBsNkqdV7K6v+KrMqqNPhPc1r9yDDuzaRzdkGsON8/g2JARz6fPF3moAFsM1vNyr3f3kZyfgvL
bSzFv3v+tqWs3QqASQo9cIhh7aKvOY0UNc6Vg0PZFTOLTIEu5jbMY/j+Crx6qOyYxTKQXnAHSHru
LBHaKMdWvdYYrKZ/IoXL9kMYqu1mDpx5WeJpbtkQQG6MAGW7xqRLHaMLFUcn8egIKYyE5VgWut0N
krkukcBIRH1TFtRssEVX8PcczidAv7YpUEu6FRwJO5FT/BA6GN4slgmSCKOOTE5KXl/bV6mXfb0t
pkWg8TDzrK7FKiXAJhXwo+iOxV74k9u3CvzkDjX+XEevasFgL8KNCOQ2xfAUbqOxTivutPk8JsmH
lA32bUgYDA5NZXwoJaDHglm4uD379xt1QUsT+0fVCCFqXeH2M3LuPPap6SuviZEhDovsGAvg3JHv
ypNwmLzAZl0pfpg6GZlrIrdpyCFGhruNZDWkG1dHzBYpARVZMOiXP8oSY0uPRhrrsYgJoD2/3BWV
Y/sDObEPpOJHPhOJG4gF9SaOGr2oNtwGIqh6X0ea7yhgukAdliU669XqdU0KYxXgJTYhjwm6G6Ys
F88s9/dkZu8TwEkFQt9ppjU/kkxY1h5fk42uD52fQYbx6pPLK8FQqbUmAVYyUH/etDgN0KmQ7Q4i
WjcsxuQATDzbZP972lYDpw+TvAr7I94HcSEAb6icV1uKbK9OOGoycHDX4kRFzWYwDFFTm1wEuWPC
c++vHcHi1ixSW+FBiNOw43avU+1DdOJams21wmuuUlkZb0VQRDKPobIrF0FwfCEqIoHNwu20cqAo
rofbAEnVdQl8CwthOF5odrOIh7EZwgRfim39iz1OWV1CaC6SUVSyshY1EuQjZPBnzPxNTGOjgcyu
TeqHaPZjtvGnWMlHcuAvVfZ3mGmSYOt1TgvEngvZ7gfXrO0nkeMHGlTo0dIuYyEf4j5lcUGFBbGJ
jirrFuilkbTvYZxHtm2VefWTBtFz91W9g4NM8nQXlPO4OvONBnSj+EThV/5D/PMXwf30OtKxptlH
jW25eVJvrt1l5NX7NhgdViLWAqXEVwZbpxC/YBE79V4ez/aU9Ij3rZy9VGeaJVYSpQkFCMDjS6PO
4RmTDWhjYUJDDHOz0RnxbtTS6XHDvoLSMmBV76T5JYkj3u11g13gvCphVd5+SlXVfXL05p7XEwj8
0/ZUoGsoXBjMFuPMi0pLFMxy7wAgZQtzADb3apIoeBMAEVD2mREHKQMjozaOlirXDy6zgl7uURwh
UummSf0g7rZ4/JYnxaHSeW4w8jcKC8wV6R86fyDt1oKDzAB+0G0BWRwhvYrhQE6cjOWwEgBmd5kZ
pdTTvgqt75/BWzfoAiLXBucd7qhSEb1l7ozP8j4EngJ79HIt7eDUBrZqWdUm3RQHfaqnHUABCB0z
Gzg5cm6K9uozQumx5upcK1LbFaQaibyxV4w17XbbJSclvRcKU6Bs9wmzJlRv2PAAXaP54STWlzom
it5JLkKovXJc/iH8N4Po7WFF2llvS4Q0m8P1YS/L0bmBEwBIsGEXnEtVZnHzebG+qXPiXa6qp4Vk
8Yvw7SRKGQR4yJ31PDNwiDWeqe1xHTHSHn8d8Nf8EhEuT7OZto371PfciBmSIngA/+lybq0G4/nK
2QGcZnU/0hF3/2M+jCCdeySmYK3LuaHfEkB5C+J/bKIQyASVWdsltwPDYynMqGyQ36/jOuhQvR0n
wqSHztZOKPSUI4KLZlvn2xOcTciWSxxE4s5oc5za7rHlLoop5/cmypH+CPw2/Zzlj933Q9/xc7di
XApfSMz6xfGdnlknkBo6gU9ijH+3/C7KC2p0xvDY4E8CGxS4cw5hqCpFcGCyPRmlQ0Z8yaZmnX5e
wFmBI1NnOO0sDTvpjq/IxYk/dGox2WrnmGHtKdP1Ik96yJA6hazyuPQIBzc7Qj+Z6KzPDXreI6XN
hzpPyNbSaUWXGzjeEgv2v5di4su53OipApHT5m6I0cB4oWtm0wiAYFONv0fP+O6sy66jGwtOzqSs
/4c6rX/wHCGNWmGGn6unK3taXG1EejkG3lFJK4VTR+K4Vlqiem4hIcyLRZK0PQzpLoXDvYIG+00y
H3X8HfizolNSXZXUM+aguzEEcQAvZLFmtoVHdWy+qjfKSP2Uwo/sKsWBL9IAOt2T3K3DUtqioKg+
qx1/UsBz31GBDM/3h1wb8Du+DY4zzBhgEEHaWYSUqpocH97Upxt80SUAQApKu7Ddf2IddofSrQca
uOxIsNPt+2MCV0Qp8kDngK3tUOUm/q8eU232czuyHz6R70nzySujTZt3fDpWomYJV+n0rdtcfyIc
TeCSelGfeDOy+xXeTVCqzwvnAmt/SKLpAn1xoKON28EoDK9ovPY9NwQWnsK75Zm4PmVMAUtnY9rn
oOIUh3zAFociHYUhQFKdJ5H6rmifHzR+Ia1E2jXtqB8/u7dwAJffB+qrUA9JpuFgnfnfXFk0KKQ6
o8Xz8eX9Ov2fmQM8bkyGeZDtOiWXSy2Gll5ZryHFjud2F891Xa0jGQnRWhtxtyC2LKNk4FkaKBmZ
E7xcxjOm6TqSPyOne3iv8sKCFR3guGoXmzhGqaaFGV6jd2iCruzmlqMnK4Y24RpzLwT/+o//6G7Q
Zv22Nqdh2fhEjsghY38kIgtW3YwkaSpp1LgdA7910E1jUqXpPG+0lWp3iU3iE/tEJcmY6Vkytevh
1AsKC3e3JqDs0q/HZawJ6LYNyTSqI3zmLHkPjAmx5GHcDmB1DUb6gMN8tbDZuFwv/Mphl6wtT4p4
LdJQ9ryZRJUCQN/ouB1BLdmajpukj6uXfNPTOBnl2JCGorMHNUhHPHO7CtMhUo8PUmYbovN8+Ezv
jpPzUj5fAH4V47El2ggc2EuiFt5dFS2rVQ0xWC2A+3NAslHzQIocT0so2iWjWIDO7rmoLqDxtI9K
oDdL3fT8oyVbFtOBPH87R5E8tehOrotBNeZQxiBzOFLqQRY8hePW8/rxvdP8hmbBQFb8xqNeo2O1
pi6af2I+zN1qeLSeb+e+b1I8/P1oTSUW9xJSveo+VVg3VNmUpoq9hGvpLi8V9STpQGoULsAexrVf
hdzxItNJ0mSxLLIqLy7pZdHAfXeTolfKvvRlJuXpmtYZWY11Z5WFE23XVnrK/QZsKKG7NyxF1wqr
PUDpQfDjNF1os+q29AsYnnzIjl9b0yi4tmVlVsWx3Gmmb1/Ydoa5cbOyL0KjwT4Pes0DxboAk6IE
ukHqoZNkdQfArL+ON1xXU5Kwgm01jsiGMgSl7DFTMrZS5IrX
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
