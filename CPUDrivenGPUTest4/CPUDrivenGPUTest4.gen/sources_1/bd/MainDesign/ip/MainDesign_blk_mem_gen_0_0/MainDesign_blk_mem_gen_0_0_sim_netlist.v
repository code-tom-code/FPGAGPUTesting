// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_blk_mem_gen_0_0 -prefix
//               MainDesign_blk_mem_gen_0_0_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_0
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
  MainDesign_blk_mem_gen_0_0_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28496)
`pragma protect data_block
yFFrr37GJa7I7UZhZ7QQ4zB6dX5EQvVc/FywVNquiZngIWe3XmyoPkMcjtpuFA+3aRLtA0a4GKbS
zKvNnNZh4WPn4tzzOgPqly3QG7S1amjPnPKu6rwcVyx1jT6V2EW2IE4TQvq6Nz7U+Cm8nXprIYbc
8+bpC1nKiZvsu64kWFLLnsaf3YD9Ul+LJmeqHU3UtzFKMaO/idzF9G4JFOCSYKBcrDdrlieW19eK
MWtUzNfZzAuqxaSKblBk29dNxjYdO41DX0kzdVSlagImkj2zGHWYeZMr6ooCktl6B8rmMJSAQuv4
HsmMDy5OjzqrYbXulEYz88Ew8YVnqf0pD7XLGFQgkIn9M+6/yQ+O2GYXqMEulgXum7998k5Jj8a+
Zn0lpR74pTY1xolIThXDyI3FeeDgVMd1klDR4vNwId4fkQdMJrhqDvHc6SPEoBa8RfZbzJFy0LzE
0PxtL5loZnAbhL5gc9NQ1nSH9Hrk//SEX0NvwtUcnGSI22Mb+KnLLHkQkchNHLMnZpuU26iGpD8P
c6UKjWXBxaDM0KgNjFmkVngJj2stNjbGa1yYxiLW3UQ8PsE53E6bOWUnIh1cIEKnD2zwhMiPf0t4
fdkJRavTEoIvhRsTw6gbK+halU+ktVXhybV3rQyzmCRoBbj8SmEDXfHd50acuRJmhM5kZfQ+RQ39
c6eK/W5PikA0HZdI+65FLmXue/h8O1CU2eaM8+cq3YXGFfcrfp508ItYILCV8OprMw484YHAvCp6
aStOw1SzK7Q2ydTtz1IpJu51/aGCCk/KdJE5LMNFGRKS328/pAiLLnhusoeOyeBavGqGtYyOCJ7a
dQCgh8F2Vsggv4VnBYhEjb1GarQBvSIrsLsWGVi8cSDK+zJi+3Y3kF0/ZoZp8INx56Geo+uX1GZp
zjxNos+KLzkuFFeWATRnlq/sbplemNSIm1eSHAsmA0j5Gx5src/EiTITRcnI7QYjxIJI782WbAQy
huTLBy0HXlSzuJBrAbOEIb6H3n8d7rffsSNzfjcx8Prkv0IJmtqAONbVnfzWQip+D5aGnH1ofaan
d3UYJqVf/N+zIaXEdqPISZcUeTsB/RKlRszFLe6NvBMpioGdtu7yXhV7N9AkSIx8/D/dHAZra2/M
00nc05kdl8gORUJk5I4UU1CB4sS8f3dCzs/AEMr02zitfIDQWn8ZwKAZNerL35MSSDtOIjvMmzbG
CkB5X8xLFusBXoNL+X+803GTMQlETc8aBSaPbraRKNxtAg+MBdkJU2VMmaF93ZDVzr8ODJczOVUf
pH4iYcYxPWEXngJoxpZpt6MuIFzbEiSjdGCKaLOsi07VkryuSsLVPrZMaJkzENA+cSVhUpYdWxEF
EaJaMZChMnAQjkEWjA+E+GvgGVOMCJOau7kSB1FQerY/RJAV9wUxAfjGWrhTxA4S8XF/+jW9PweE
NZWsfiOsIb1H8pol/qhAF0cu9cdgFIYpfJpq8mBOIx7p/oqwSgMr5y3aa90l6zXjFyA3v+FpCN+o
blPc03iAoH+zAxeMP6r5bsyOF/j41zAo/2TH6CRyYgXx/gZRnosdeKkMeIyvc15pyO2mHvhb4Zrl
Mqn2dc8szNfF4dSqBIVOwSRh6duSvjWzHSH7A790ATgde/DoFHVjLOsY35KVDaJNiUALaiJRfzsx
sHsSClR9fs5lvkU21kW+Cp2LQ+l63Xh0nfhX9dKvzl50+2fjcKIYUrYmOGInM0fozZaNnERbVdno
VPrsMIFJHghooXH7ktNzHQA5KjB8b6t/OlmCOPoBmTJ2UvFXJJnmJSxCx9KBc+Y9wWyehaWNIcJK
a7lxFVsuFBO8g78TH7KT9raPcRPKar1cLOZ8rwH/Y9f2GCLIAmr9FzkUdMND0YdRZHRA+8AM5HMS
c5tERmAy1P95kOap3y9Dp6jove1qXKe7P+ZSV6SHiAoG9625ffgvZ/pYJafEylQNaqEYC2SHl/dF
n8HILuE6ghpWCkQWZ2gMkwZFqNSibIBhPcK8S6XXReFL8Wu1tXp37Dgnsm9NclhKjGpkLtQTNR+m
rqPurCEpBqH4wRNHjXCNT8S5/wH9SpqUHAJat2Vb/ivrWtzl8i/p+O4Oer2Kgl2Frs+Ng2NuSWLp
v/xeLk9+jLmcQWQ++RLfXUKFKKdNantIzL4CaFZmX+BeVuZto8R7Y+TssRmhkECvgIso3exbGOGS
U2K9lKh4XZiZZgkCaSnJESjqMfZCTv/Wfk5WxCQblK2ajZGaCUXYPpbOpEsLFB4AyXBdtAi/IRsw
mwa5O2vftFPQ29esawy+bvCbTSHYSIw4Ozqi/Zgkh/frSmazdITHpOt5Nr282de0in1+1Iguh5ox
qon2Ubp+y6Bk1jDXrtiVh1MforhqlXh4P0Wr76e+UYPOzT5zl2RTzEPP2p6sU2UPGzzWPO6mW7ZS
xB7oBEZBsU4HaRm/0slRRlPzwp3L+Bhs3tTp3tIUKTRVLM4SqHpPKjRBS/Ze9AHme6jAT+vrhFu0
ojHncY7BFiW9dwGcT37iT1ZGGhBydIhIFoalxpcgtxynRgNZt1jv8gz0MSPUx69HUbBWpnNlGIbT
zgebo4CwPeh8w99g1NT5slN6IBZCf0VtZpQBq0yuC/naaUcktllFbwH49Mag58rJ7JcpBGLHx8PP
6J4dPBqlxowL1ZuSw0qbA5vZxSQWT2J6GR8x0Xh/OyAZD7/rpSw8yHPBmITYYiU0BDJeDtHQMQt7
3NxF3tjaD1QdJOpN/m+El0XJsdkB7q3j1O28eTgDohQAZdP1Mkc7+5c8vkeSK69Hd9PFfWn+iu2e
vwRBm73qKWMsKBPhy0916+t2uJGUQK1M7nyFpPngA45dXLJT2vncYYDeMlGA+QPvwFpJo/fEYMtT
gfsMATnDWwQ0QFzlsvIwKb/nK+kzKB2c2CNfZmgRuZl8gotdfyrQDepVFIl1+Ew35wFFavJU2ZTX
zOmEESlTWSRdMIc092hDiS3rnytY3jzCEMRm2bWH0Rt5ddyaYWvSHeqFMje7YUnAEVDe1VMKVMp7
ZReY5exh4foOJP8HEZ/HOL+MfKiISQdM1pQ/t3EvaNXz24B0d39b4iphNhAKCflIcoRwjcWIfEu3
m+gLSJ3O8qR+I9VDnPjnZuPQIYYmK8UlPzW7U6CYeO3QpNhoMQ4e5TiHB0KOAd7PQg2uXWteKNuD
2ywRFLZ4bWs1RJrX75uIVYlhnTocjy3P1U9a0IIVUkTrnRvQAwN0WitPiUvVh+QFTOq7nGP5lVHe
TL4elyv3at0E3qgh/5KwgENpXa9DOjHy4xIXXziPZg2N/eemvufnae24Fk3m0D2u6b0NmwE5UxCi
L3jTlIDB9a7KOa3fXS3BvJsCA7QGZ6rZdeYtF0NjqpaVOia+pBK86EJaTD9cfHERIBZTY2z6XfVA
qxEzJHXYX8alN+pTAYdZdKGmFCJCF7oFYRWFZoDTD7e815QWr+ZPmfN2wsftvG8fDId2PI1BgNkX
mX8ICuVg0xPe/zbCcqD3DMp3C2mX+SWNVnO5Ewjo7XquQErFwsx7h27PhhfzX8CBq/AYTiK0WeJo
o17l6EewAafMkvEu1a0RES2hx3y2IOGzJwzJtpKVhfXFcnO2Qc8IgxT6QP4I7LbODHvq5g00E6N9
rD5vyTb8c/TfR54rh5dAnrjpRMBwTfhUcS6U8VdZYf2WtmcndqK5cEHmGeg/iDEGq09pBa35HRrN
EYq3iieO9uBpB7nSfOLXlDlggD8Ex1jj9adWWISOZ0fc74jIHPqqCx2f0VZUVkSDPsU+rxEkMaKn
m4B9lKXtiGolUu9b985V7TVrPCLNfvlhE9A2VzCywkMbQqgrpAaBvt/gHBIhac44mciR9oZH6CEt
Qx5qNUu/TeC2dr+EnVPtwSThPsY03Em2ajkahMsoUtEkdN+t6rkn/LJyPhowraRAr7Y2epPWZQ+P
wdMZEeYBNWRR1jiMqUIDAmC4VsdgHqq9AWC4w34pmwWV+fGwg420i1Sf4OFv/ZAW8IG4mla8G5Hi
C4NhxibOJfH/8drHVHy4upo8Sr6gLColGBhsSlepst2AdSI/ciUmMIS4HSOH9x8fmLyCg7JSk5ev
FbBlyzSz+FJfDgBZLjBA4HSJPSu743i3HcGnkXaA+/j3+Mus3ciCnbE2uavFYHV8LD975yMNc0yo
F7G/hfnKDEoj98mc/VDg0oXJOaIEAI7U7YjC1g2KrAXb+xhYLclRX8g5Xo4jU4meb0f8OMEUPSRP
DTCXLYdf8dxTkYZpOXnn3aVKbUSVRRYvGAewi1q/snuFrxp1e6i6ZmxqyZceB6XAHjvofb0dvBUT
/nn9elxFYd4ngZuS6fTAveS3PRA2SJVKvtV0CN1oa89yz9LN26g71t2H7PI8+Pey4q+GGZhmWP3L
XYgvNUiQYI6MXLN0X/fs1GUD4lhH7MKefc5AJtcRXwZbChFK2BJxJeLeYHmpQ2oezzx3H8PrJL6Z
PpwpUAPIaODeyJNvMU2V0ps+4dOm/uMOnm8ZypqjUkKugQWO+LQynfON9lnrYxXoVy1rp4Lh4L8E
2nit11Ck5XYFaq4bD5xVgjV6CMKYjv/QtI0jPtLes2yd4xqUmgNNmwSyGYqT0bt+0zoGrYA85Zwe
BsgOHA2jGATNTu/Zj65CH/3RbqVrkdc/djnGe0MsrWcOaNnOMSDgmN2UwLP63ONFDLSdhJDiLMEM
eN0zj09MbTfeI84FrUIM+84EQtpJfu7p3Puo4OrClgNRUHQIGHZjit/QpMEV5T+DeZ/waglu4OYQ
OHZP0fq/FEnYQAIJhzimP08EPoHOPGSHK3NDua9Q0sisb+B60/Hj3vdX+g8tlSDO1B4SmLk80TmS
meN6GUs/Fqh9PD8W9KV6c2QFWJYRqGBfWDkTkG/yxqMgCkj8lfyJcPU9wHCkhNeRy4Fq30/tUjpA
xr02Tv0tYWq1jJBWBpYyzJNqWxWsPgHdq/qknbtlBJhsa+IITGRpc+kceU68MefU1pJgvCkHf0l2
qD4JNOfMTYaPnKpzh2gIovIpEoTudcpRO0RM+urCvciSJd/Auktqo3U4y85LJmDFXjUeOC30Ep4X
RGxZBxTN+iTP5/Vlh7CtclDbqCzJilDmCJibzBtHqFhR9CrteD3CSSlb5QmhLoaRysTAq46CdLLn
mqVkI7uLJoOqbaVv2e2FJNeuWwPinTyf4KERJmuX9fLcUG5BtMoRYuVDyfVgWpuaM8JEyZrlTOrj
kFozJGLMOLgtkTeqseOWusdfjsDDwkY9i3K6jA74vMG46z9811G6lmzu3n2J8xmiyovi1aPkglpC
qUOviwGwtmKh1wL5PyrXrj0eliItE84uE2qyf1TfkRvgrH/VHT9MZMjN/BCUcLWLtWtaEQA6aSk3
MpY3l1R8JlssUs0ZFIT8IQSghPPna6WzA/YFdD2x9YAEFMoubTsgpIBS5uIgak9RqPPZdTSdMSfw
BLIBOZHNLyO+RHtDVJyrNqSl+Er9pxuU55m45maxCMRjAQmI57IdLDSizAqv98tOmgoLGp1Z9P24
TKU8o6auUXRcJDYyfNUI3CqNLGHWikoqHemWWb35sx0AASYK4PiHtJ3hYqLXxsb8moETDpn+fBzV
poheeTBYCpFW44dDYUIIvwWqfALxGyT9/Ezc6LI+Z2vUXJcP/qW1G1ohyPWw9nhQxkprj04J40hT
premqK753vnvtWb2vdcady5MjOGYAU3QVPyF+WUrRD1bMQh1RUy2ZVHj0G4/sEYEM7kjWhTsumXi
faoiGN8rwrJKaoWFqxuq2ZF3QjsGIi16JRe4Tf7AaDxK+SgO7FHq0jsD2h4XM2uHzeYA0bddh6Sx
OGKLMxXrd+/GyRmhMM70kq9vxoqjTY/U9aqsr5eY4cUwB4tVRFS7qZrOnip3VJUSwf5SJ7gTpNOr
E+O8bJZpO6NB3lyI0KEwgjZ3ojo0GmVwYe7biJA218762q9BZrKyIxc4x0bJDMv1Wn6pMqeZAehk
PM1Y3uXG+gCHRG7jKH2c/cSGHLKJkOrIzn1LvTywYehj5G7nEWWe/mjPr8GimvdccjTjzvK5TH6h
ukAQ+K2JrN/OOrFjQqkUfbVQmT2dPh+j/AB8N20vVyvrWjEzw8W0/RaimzBaPZh4Q6Cn3V+k81ac
uh2A9b4cWz09eag/yMTgEcS5WEESLELOP3gIjyS/+vjhybCZ/w3WdnwEA8eNfIuaan157nDE2zsw
beJMSJd9yHqCihHOYL8GExp+JWM1bmte/TpbWUTXia45Hmxq/aXR3roTUReaRJbHJrz7kHvV+zCR
LyvkHAS4GIXDfI8ozwRel5qkq+VUv1Ry+rxc8mKTFLWyzTjPXOs9D3+OzEUcsMR5M2ikw+yLDlde
MEswb5uiZPmqoJBUFiIdq1sV9+ZfgIRNwuYVMrIcPejhi2wnPTd9F3L+Icrkk3sVbtgaPX9El4yk
oMxe6dag9Atm52YZu3+/1mLxjQ6/cm7OYF5cJFswv1eY1dgXyyi20HFHp2cgxM5I3LyFjImZHCO9
RZZsq+GAJNCD7ChlJY19Fvg+SsEuGY4D16ApIbV+J1OBXx3Qe5ulYkoIUpcOJjW7lzITmLxjXPpM
Pa2Qub3AlBR8rPoqmInt0/yqunqWlQFzSTotlR2LmTnoGe32yqs/9m/y28D8ugFXbuPHFiDwtur5
SFX+hMkLC2NSNNZjOzKwC60xmmbjSzCV23AzgzgEkeQ8CFik4MId2uzpiL4sAj8K2MN7oWB36ZS7
fevvNtYZs91FPCnEElzTMbdtkgWevYBhPRIswbbEofBDp8r+WFw6ET21HRnpXdchEWfVRBmsfqKl
CiKsYtXbSRfl4QhGwqTyTUq1kgNB55Qb3zez6VkoLZtZweyn6MjDxvy4+4YiOkV+MoA4nvXoVyVv
rfpG7moRe15hzLYUGQvScc9WgnLsxdMEWpboCgFH1bBA3H+2TIZg/xm0F5q6+/jy9IFxWMu+nUbo
Ug0ex58esIZeW42Vescp8zLGP1haxz3i1HSELAB0cAte3IGCpsmtn3ORW954lKvMnM416s9dfmaP
Sh7WaXZirMCn6EwGrl6nNPF14JQAxzGTC4wQyuHq8+Dssvz/K7ifxF1X1qUqsCvjgaPVAVtdS4V6
hDZp+86eTuEzEv6xLEAUbtWQfFDMPoC7rdkYZMGyTwBFw+6HoZ22xldWdC/WsxDM2E6h40xBKswo
sYv8c3a3NR/Q0zTDhDIzAvQEZVfyibjxbExjd011Nj08PTMOW2l4pvc6Ji8HiaWy0bajsp457Z/M
A/H/zqcFwzjMjjJBRhGNHpYIjLaMnjaF5txyIlxlFWHVk3wLnIDDD57fJfg01J7pNbtYBU4Ot+Pg
tR2uAnFuFWFTQfSMgfr8olh3JkRUcdhpwvQkRKlW6pBa4kq6GiRakA12XdvpSKgz4dzbjeSg+f9S
oyUpjbUhKYX2BbhWEtk3IQuP4TkalrtTEzrSE9Iae1D+U7DIUCEEiIAEAZ5mpz/ryX1+tBOCuhVx
92UviJ6TNbiAKsNHOLVi7DTpoCByic8tBIFQpW9fZNaZZL/14omb9C3FZDs76vAlAhwOsanAXzzm
YwWSRifggFWk+1WklL1YKHsW9javHRX1QUQZF1KisGO8wh4i7OFbnk75BgyTLsxIoWF38cnL4y1d
xTMzgZ/EA1bra8a5DBHa/O8dPktBe03u1u51y2GRp+MaUFcD1XcDIzOuFUzJung+m9z0aAXYsr9v
DDNub++caXuyTTPM0vVIyVZQ4kBxr8aP3A+TP54FKC/vkruJ1dgzV70sp+92jw6k40+/NqhJjbUu
N6ipkyV0Wfab/uAlxNEA1F5ZUnVkbJao4a/+M/lvsLmy/Q4wjTa1wDTcNvCV08gcQzDNCUItCbHT
zc+jjeGnTPrBs9SQb3Y62DASSpAXVdoneaoRaXDGF5eO2N/CZ4qYflnpBb7HbEMLNVYIlYrm4H6z
CajnRP0H9Vwe9eSbzhTZdFZAG7xFyHCBjKqVZBeYc8h4g/BknkcGaH4eysrCvBC/oVDpQnGw0wZG
AcRCAV51l2cs6OU158naQYsuPzGNewvUAxv+Ym7yAfslgqKEb11RcIzRa/T8wDei+3AP7ntH9W0T
ODbNj9JYZ+JAB2dD2Icxiw7G/eXvToxqqn5orxBi9XLAmaXflk3uNkYDEa64v9UAOA8vqJJcu6k2
X+7UhL+2RyjYjLNGCKIevKYIvQRH+cDcJ8kPbnyeJ6b9McIKj9yxS/LyLnE6jQt9UfijXiWi4lIz
KiJ2IwZmFtqBcq+EZn8VvAMJfJO0qbZUBwyxrFccYUWgGm6HlM3whTHRnCu7Vev4qWA0Aohrs+fQ
zRKoxtS0JorwUze2XMrkuB8Ei/hgRLjWzTcfpj9PX7DH6yny2SNMVAXCBYUrtc1uAUEAnZkIh2PL
NNPDM/XfAJUTnk/QQs21NbuIaRnzm5LuOlR47HrGb0OGHARqG1u369ZlzF6gdaevX4M5tpgSF3si
IcmcufNnnfMGgX4UwIGDXmAnOHb8ABCpDK7vWYC+D7YetxSfPU/ooRa6BrNZh6O9HwvqBtCHfV3T
UV7Nscsvlkjo3cOWFffPNnJITi09+hiVLQlBPr/y8MdkQMpX1Rq1pfD0NswbGhDBrXhsqHcKuY2/
bYH0Dxb4e59+KLs5QNS9dFBveW0eXvgG1Kpsu1yIjGC4X9WdCg9U8Yv6ubXTC/bRIlBxdzLJwpPH
qTfS8iitTb1w3NudXzrGrJdoY25teXmmuo015oTTp56WwaOLtFh4Fna68ebsIoI3lju7EzTWe1a7
TMRUagGhcJtSexC95aKyvfK/rO6ko7YRLCib4aJq3/tyxVGC7UHzkLHQu+WzguOJr2IGtnHbsoo0
xqYuVYJev0P2jW1DslztN7Hp3YAWpGO7eCCT3JBfSosUFfwTDNihOhab95NVjMtJ8F8FlnpAODdX
udpj0h+mI1ocEr6BnXu5z4upMPKVt4EA3AT4VqXdRIp6hWig0RMdiNin1KvDQLPM6QaiEjsHRu4h
wDAxJkt5ZBy3DW7UNrHTWpe2J/6PbPdchv18lU1FqmIKrVS6DTtjqY/PrxkRQOzVF2Q0N6eavHj9
F33dNbZRhTH9nA2atcMXG1ryvOhrEiw7duMArcGL6ODxjRv29fRvT5RjV2bR3yewvL5+R5Wzs7Wb
Y0dGfoK9Z4zt3wjIyXNmY9dYUw63q6dT6YlqtPSc05rJ6bAekEY7AU1p2aqLpY+bi+vDTagRRTNE
yH8eJQ6kIHgIJfTxslxUP0uOT3egIsfJb8Eff8Wq/xfj4gRs2Ty4zJPg1ocblqhYMd6UwBeD27bR
LZh3CBvFQimxcnMge429KSECcL+UBzjzIodWFv8rzM7JkgZlhQmIR3rLlmMhiZyF7uNzlZJBxJkp
buRlmzvCrsaVOq1d78dcXkeRMxvlGQvOM57nJg2sXhLI85GtPmijvNvtKoAh1ScCKXnnnDyt/D38
nnozaKwbDcjwLRlwgU1n/BRUzmJGepZ5XVTrRD/iCqGtBX5CvhtKLcy+r90yd0ithpbkF8Sa59fr
j+mii98gto9+fPdZb1ulZTZ+9dyQpvSIZq1tXkwno3bHSaBzBxJgCXqzr3ZnyV4VvS7guwhsZ7sT
BbcXWt5Ex08IgNMokvl3pJZpJJRDLl/RFtAiUVSR2lOknux33Pmzyo8xWMR/0LB6q9cqmM8ua8mA
sK4J5YZOmYwjrYGtkv64arqTtSAmwHRmCsScR0cfJJtHJCp3NOUfQ/Wm/SXObYXCyt5YAph0bIUc
TzochOWxMaY4WuGi/6GiberRwB8vb1yKvmDIo6PbwwC4/AAXAqKsIXwCANpKxPoHZpb34EpbP9TD
LknHqhkkrjWySjgd/RxlsUC9fjyTWlRqdDV6cfeZWy0OgZsK0HX724m8ub/76/0e3ScDkJIY/S0j
TFkF2R+eLBuWts/r4FU3PvjuAW9cNWGMRM6OK0qxykhssXV3i4DcSvgSXp7UcA4pfQs0FRCHvTzD
u8iFqeWhpOrlQRRvL9givhQL03CuXMBA4OPI6EUL5xef4x4dY8BWE1gHI48Rg15nXaKgA8IVHY3Q
5FA8GI9AaJH1xNg6jfvN+JyMLdRQA0T4ZbyrX8DkeIaA+LJH+6W0FXCnuO4TYfaO5/6JQr4hIXVi
tUcrRIxg9e/futM0Rz8GFkHSVA2sK3y+VBUOXB+bAK5pREEaFAMXNH+6vHsF28AeyDzhJm4wRwVR
5eL595ZHlRGgpBOwatKYZl/FCo2Zs2qtbO2Iwy2zx55egC2lIPHVxb0jyC/EgLUNJsXGmEFXjpmJ
8cD/U9ZFgzJoRkcNht1SD0he9NhrnYL9rvzFhA9rCeHFrZ6vohSJf2xAQspYjATYwi0Nnrmw6b24
9kwuhe3lttuQQAp5oMnu8SJUWfTaZX1ZAgA2Kp/aWlXyvD1cZV+pifHquwfac5eI5Tk4WbUi5uN2
8KTai5EuUJPJGWDkb0U8V/d5eN1K53F8MVcGlcBX9ybxLDUy5RLqKEm+aKbU1KjiAw+SBapkxY61
g/AJdyicIsTGGpCJKpbuNG2gJKBzL8V6klnzEHFcLz2aXGx5Z5IhrRZpJkDnYRF1m3ySBt/jyK25
N7lSBl5BJM16+/3zXl0a0biLy2Fwmp2ewZ80tCCmEMi3ZM4LHS+ZQx2kzJKS3BTlEEcSEoF0HIyu
dJWIlCp5aPtg4p8M6S0sK8Jyuij8i2qkmIto1YxzecxE5f+5oaqURq/GJ23ldvbcJGR6qjMBV462
C9sZdgslt5m8rel71XEhxkU9GRAcXT3UOKvd1ILrXP+pKI9Sp2/wTMx1bhcIEUV8rpzgPbGL+nas
lPiYG+dEldjnhHMMu9k6o44xFHWBH/Q6g1zD2qiDxmTC4CxooHRmFAwKB1jmD9/fcegFDLpIAhLW
NTJsZG3WOFhtP78/o2ZXCdZ0nTm3EFdq8Xm6zgwNSj4Q39RdLQ/lxVohNn+k7IO8yx78PLChGPw/
/LIkM4gORQ0+nzXICksyhydeuKedJVaHmH31NRWRPLpjMYMJdg4lqLGucazgd2uZQmfBFViGNKZp
fPcx8zSV1b/vBPBGp/N31a70BTx1tC6XE9KUU1HPljt8FnFYrKhBOZDz6/75QTdOXgCwGYTeC6d/
0514sd2Y+IsDm1zZ2njY+3SmxGF07RnM044mWmMHQp8y3bpvGmFDaDxrWyS+jmNjgBf6paXQ1umZ
k9ay7Uhyz1RtVYlg9IrVeycBEq32mfrJHKOA/24cNWFm+FbCWEO5aGWEqaLMy7pGLoBLRQDJhJes
LLP98kIwngs6bvjpbEEi6XtkT7atl8rAAHqk599KvBg3liclCe39JqDbEKc3J9ab+rjz1Mi9RSMb
MKC8R5E78nAtFp/NqVDg0gTO76GpROH5g337P+onHQ4esJMpmgy92K9aVB33gcYjgu85lCGB+GHc
F/DT8H2b8oU9Y9lhLPrbmZ11HUz/9AscKVlEx3YLmA3oSZXTA3xFvZhA+yDaAKkQYzeu9dN4cTbc
CMm7Z6+EY15LNxOdFVfIKhR9wmADWCNB1ZPTOe2QSTMlQ4S4ScFCEAOpSzh2s6oj+dqK21cn5ibY
uFtVogz7VD+BgQF3J4pudANNoUcRvRLZogJ2l6Us/L8XeyhP6200UGalN9lr/4hqRl6xwyuTeYg/
Z4laqm8D/AkVRmzshDRXk66f6jzfTovDIb1zMElYIk7j53nBTH+XofvHfbt0QTha8d3+MMATZyG3
boOZqJjE+dOGe8dE2DRmY9uAhcNbalDQCvVFdEbfz3bEs3X4G7WbKSWMKbI4He6pLOuVEOPa6Jhz
ckiOcxjb1vGND9JvBjY2y3Hu7OlQLlFAFmp2VNs7R6A/w9vAuGf3JLenWglJKA6/VVTvoaca2qA5
jjaxpfYua9JvslGu0tp2AKvzutKN1lPtnfn3o1+snz1q8A17PUlXCskqD731xXG3Kcirnt6G/C6+
aWhiE5HfQvIUPaJf6Uk6ssW+HIDf0RHalbg4Je1i7WS11m2WYBC3T0huIhihSnLQNt7SARA9pgc0
zNq2QsCPYSnkv/Zsj7hUoYeBkNoedX8F/hAcgBV/N2f8kyly8JquBKEOt2Gu7hkMOkrQyrHVFP/5
OQtwCMx6wmCRvnNrKscnonv4wOv8/DQwAit0Hwsd4XWQMHAeX0XcQ+aTNfsCXMLNrzF2mtG+9jt+
yWy2w1lDs1InAZmo3+Mt8vkpwEvQKYU3ZtylJvvNtnjVkXQ0k8x00wx8HVNnR4XiYvpfMOi5K7WK
ZAcQb06e7RiD1S70O/gqstHafXX09TVlanctJ5Gh3ByWdK6TCfil4wUNNIG3zPaIQE+Ctm3/yAa1
F162KKAuG2nw4ypTbtlqdbNfuEnFvUp6htBC9xqCH4Vade/DIL+IEBQXRNl0Lihef+EDs9ECKyzp
4L3gTw6Uae3haQueVJtXllbSCopTsvnFCKbbv0e4zDmuxtedein80wHDi9JxIGxTDB/fbEJGaAbl
3gy2XXeE7wstaqwse1okWN7Byi6zm3dtQPeTU6MiBUSFfFG0c1dSw3aWKTqY07rfxz0SoZPEaQHj
Wme0Bq6WaS4beSuEmQ2or5EwdPGol8JAESnOifKP8rEdw98GqKHH7rfc7kcCcGI8PAfkqONyGMaA
NX0ITU9IUyTcqye7h9uin0vJDH/ABaRjesakmsW7Pv02cEji3fH/ChktjvLb9vKvI4Yxpeh5GN/O
cPflrIy8roU+5r+3m8TUh3/IJ4tMQ7eaQtMNz6LOGv8znFghyvk1CUduaeLkiL/DF+8LUhDoggX/
2tHjm5QxTv9CtAtFqMYVgMs5VqEr1M1ErZTDDl7CEifDaY+3BBcsa3DtEDxt5eLSbSVDBwjaJn18
U+D/WGsAdTiQVhoVMUxbv35Umf3WHZHc4gi4ej6jH3n25E3jsS1LoTEIihV0pRyHGjU9co4FSNy8
jO1pJcWpH+vorZFKWXVCpZ0GO1BHlcLqJjMmXad4pppCePR4OTE00LXAoN68/vnfiw2iePPQOEuF
XfVwS9On25/LEUoWkeo4KL0RToEx8CEjwolOQjwxYdrZE71EDybRofJ8OKO87auT/UtfVBwjoRdK
xfybVNmStRVmfe89Fcrpu0MtCYfx7eiX/0Lwi2ZfBPjz9wRWWrmpfhooqPd1e52VGKUNwp7VbZxD
NmOuDC1uDO5vqJSu+yWNUuBNJo6I32yI3T3+b2YiJxWw4dGKp+zRK6qxk0SIHeeMpBJe1oaQjMUr
hz1NLnFgbdoVoj7/L1r/wWUZwrm9wEpYKXJLtlcyqU878alR4xFl1BQgelwnSROPBJqjNnyPwTh1
8JZO3M0Gx5Y1737idVgwcT2P4ofPhQyvFF6nD8Lp2FWkXZmqPU+r5JmzcClWvTqydUbWPeKFPBoD
0yIcOit9nELLIXWsvDxjMIXEsKEhw98s2rgllqbobCHU59fF0GESDWHu2wPmCWF/xnTEv7BN2KZX
zGmBo4Ovv3v9Um71ilAAkZ+EASHW+BER+c1dy8Q1/jQXjJCy5M8BnJxhhKKLJ6kL0MmEUhvw6CK+
WIhoJpCMe9JoQl0KsH6NC7uJXgUmqzPQ0SFM2a8NJnyit0ibjlXmRytFLWxdVAw1RjyxY7TKjVVR
jHGPXL8tNMbbKW693Sb0mW0QHn3dJyUfTbC/Nl8ivITXZ5gJcrL50kEXcD3keyUT6aIt58KTa4+N
r0P+asxi34UlEY1eK0ghWPhCWy5mzm3lfjMkazdnQHTRPnSBUIcWd5IPWNwBsOQ1lEOu/EC/sOee
1C5vcym8WZ9Ngj1+1ty0l2jyWDOOXFmVyqSSKw6iaV8E/sMnifRAFdsEl6d+5B2ZFQJfa/0J6ZCL
FFPWZSro1QVfQri8mN3yv2cbGu4YKTESDRmEP0wazWVQythcTsmEWtnwK3OmtVRuAe5zTz7RWq8r
EHCvJWyG0QIrB8605VZBjKCA1DH6dh8bGNaM9qRuHiMjDkbypFzTePHLZ7UF7V4I81k4IXgY52jL
KwgLDe5uJdet18j9XPdOu/8uvkyg+OrfpqPoVO0PKESdykenFdgO0Xp8FA29B8WYaf0voJxRm+oN
MSM3yO+ZMg0afTcDMtsZEbUX9AHQlQZ/TIU4s3pwlzIfvDvgogSC4jEcG0caQI3Mj5KkM5lpsQAY
JYnVtu84kUKDUM/qD23t7x94DIwyrlta29pUBbQOMCNMU0AoKKF8gMc6PvIjBIKa3685fASo+aqD
hvnjTu05xYG04TsGTgPEXS8topfyV8swZrZhhshA3IwIoNiX75KpIT3dnYXeRge+XLdBq+R/NT7w
/ney2EOPruQdA4sX1tK9tXOd0W9/GzYzPz3QpgDKqurO8oJxMd7wPnmBi8R/SG2izdGNdHENbRSg
oI0328KtbsT3Zp54I2C5uYH2pcvJMZXK0HmxC4EQK6go0x5iIJMvP2Gjzxqfuc4nPP2Q2XYn6/14
06Y7tltAAyUlgYcXXVT8Z5iNU6EgCaIeHOtjqr6LwkuGL1nKl1Q3wnkrDwa3Ta49WPSUGIX0T2eP
n2qCosCJRZAoylBUhFFDQOqZ5RHT3Boik607aAcHqy5sbspnfbGLMT4yiRMxir2+IRIZXyLg5QtN
0uBZVQj4pQPj/2CzTW00+GBVmAldCFbfAZqL90oYIeCotLkikGKsCTnP/rTOOTO8zUpx4BU3nKil
nnaYyvMjVvd9K0yM3JtjdthB6a0pSaFGhcvtDGjV2kpDoZqvaONj9mjmiap2yXTvv9rsuLV2kp5E
a6PyW4dPZs6zen1jCWz/7ygDclTUb6dz/pW1BhG3iqkcrbu8lo8kU1pYLXNfEFBf26IJnBdxD/63
mlA56bPa+0o8TVPgTrWHT2z5KeDHZGz8GZo/mez7IhGpC7nec5cAYR/L0whj8DIXNNRcwHy8GoPd
falcLkTXuHluka32lej6MWdDrsa+o44dWSqTYAUmkb/M0JtUmY4u330BnWuWh5xbEfE9JVUSn//K
+Mr9m4rWmMyBsnIzqk0tv91w7ZbkWuB/pSlCS3NjlZyI+5i0waNJLh+k2SJffWeOiskvA7wkvTaw
dOnamLRkg0JMyXmNp29f2QlIlk74PL4qiwTm5cUSV0/dj/jUqWWPjGyVS5lj++vQp5dPM3oMdixr
3F9FmxPDcgGdr3QT3JkrNK0od0UUk7m9Mkjro52da4PQ6lg0nAAF9mTvsk47yG7Ljgvo8+UeGSu6
+Wkz/SLQAWWgsaFZ5ddiEuLoJLxXg5T7kvPfCOpRttUIfQp/Za8ZDj68FYpdxpnk3MBJ91mjiqMh
WbWF0jWxJ7SK4aMzskKoKa54Iv10MpsuXlOBtOuRMznKqHHQMsgY+ExTiJGqzBl7yLzgXu4+/8Gq
ML08wEe2VFSoWaHkk5sy2xw45DLi3sARSD7nE5gCafwXol31ujThYBAGzKm8+COn+Qb5U+VpdmG3
/S/Wf69EZI1QxMFFQW5oZOK2ROcEfuJNq/2xe1bEId/I/LBdPya4WonxgbGV41uBDo7ScXEqBv2o
rw48dl+j5EkGLeKSoeCRSEDiWaL7TOi6n4dlFIQCNEiiv+XBM1SiN51SfYvrdTLWXk4KwadpJ+/Q
qG/LTpKn/akmS70zEDCI3rNn+lvO4fKJPaHbb5DY1R1mdVmFHT4F39bmnaLWZQMmwmDXusNQLC2D
Rvx9G3TKAt0mcaINmtec0pHGawBo5cZa+4nYhG53zPrJIQB46yZeI3ZC7na64qDci7txVDBHA6Rq
sm0PCdJJ/HF1ksKSqJXInt3Sv0bCs6JYA8oJleMHSnxzl+ZykEqUPuzRPluau6EEP5d5CaeP/eif
3jIL9yIqqa3+kbe2NEjTO/DiiQTrSr/LF9JZOSGm65PskHTDlIVvjPZOxa/buDuX8gE63GRDh6ac
hpUOg+rgQKE67dLe20Fq9FJ6X/hVIkE09cMynqCELCQ3ALU2zRwU0MFYfyNoAlo7mM7fK9H2Qby5
lzWC9FmC0CZ5xPVlvEXf3mQrO5JQR5WgJb/MX7zm37tQc+ojxJqjJ5Qc1EIhSlcQvazafNcBOkB/
bgo1RNjcOHVGIw04kCFUk1Mba1W1n8ZgwZb9AaWIkXZr0wXP1zfostsbLfwxyhsLCsIRACPissK3
v4FKU3dcuYTigVkAfwlMhFefSnE6ZJEtuGdqeHB3Q7iX9Jv4/a4AUyScM9Joi2B63EIgeB3JcMPF
aFBgwwksPj+7IicFKqHdtNSCg7TtYDGt/yeO8jp0ZCUjZjn43QYX6Zc79LwvLaPyDpPeiZcSw/P+
b41tD7fj7qRhl/F74fyvgqjmziTui4iT/1SVIzJTwiMUQZD65rSfcMI/G28Qq+SwxfIUzMZpHnDG
CcwIL2MPiBN87zYy9FNModeNKR4B+msgAhHSEpUtTL5eA9LH7MLVWmUy8jFUTcHMInyocUjthRRR
9rsFMSw6F2kDqKzS6xZGtB0X85gAfWihVMXexsbobAGd5GolmYoaWxL1JPSYgSXsphkpkMG5eGUI
WS7HOHeDE/sZAKXWJTqq0w1sjz8v1ULqt49MYrLzgCDI1cJcS/kCW2GXtVEFX7VGcoHmv8EoSbC3
JrZkw59S59t2x7rhbveMtUx3kOPl3bI72ec9+4W+0gbNvFGckaEh7KL7C/gZqFuJ1pBxY073fp++
k1aL8tAih5AM6tT26wjicwGlhDkwyIjJtDGUh49RGN6+aSaOWChk2hRsbE5Ubmrvd8eGcrSijFgv
8ySMgxUvpRxzX6bzE1kYSdMozv7PC3pInOEYS88gjlwztqXaUXvTkNF2PAqqULufTwsTluKBAxEG
b0dAvoAC91c5g08f/WP31aT+wLuToHqm6xQ8kKCtn5SoNXt5hkwjtiFRchcyI56S1PlIWk8m8tyP
Bj1oAICVKoPSZ/NCgdXcFEAq1/5RQBCsy4gIHVs+6PbduOK5gNr4CgnZ5ISMkoGMQ2cmUA1Lx8U+
yuZWvbPCgcb94TuAsyuYnPi5hougG4a+Ihb2F4MF0iFmTrXSvakxQzP7PELGhwZr2XLGTdIt2peN
ksjZ+wYUHYmLwiY/LYsSku9d565A6JT8Iaia+NuDN5m+pYN5tGGKyDv1yuTkr00LaPd8M4TK5XXY
gAmzV0sog9slZNlcRuzpTtcYG1o2M7fn1cqDwIoa0RIUuTpM3ITdekuI/HIihkn1oQRzU5YsoFj+
PqKXAM/J5Ur0avu/mR8Aj8/RD0RERXptkDgdr7XQRXvesxH13gD4SDS+u0Rf7vJB59yYM2irduuW
wBTkVcSD9eF+Vxw8B7L4/zYzcadVmbS7qUko7OulVufaeO0r3zh7/DcHtgDfwLMoO+sTkO4aETR7
zlChmLG9MuBeyk2ACGMX/KGTBM1YVmpZnYwEzDF6973jLLn7rE8SyDLRLX1CXEmomTic9GkFCWbz
1z7BKlK7USnEpE0ArlWq2kBMaIDWxD3qSpFKRuD8erTdN8RfQ0spr7Bp57cFjl6abwrekecZn4LM
jRlNGSNIX6SLhpS8wYuxPkyVna9in84oiJIC5hqfRYuuq9nddjDFgjdSof5g1pVj5zQo2a9uyYVS
mgdlx1i6NTaG741B24y0v8q9Rd8SsMUbhHJXjIp/3l60lwotBL1H9CHPeqBAL08EkjmAo34IJhVD
RTCtgl3vrPLjSyFvp4b+O20pj3VIhoBx0nRlk3PXOISovCR2IaCa2xfRpIdnxavElnuEw7Fvgfd6
9ynBwmUfTgwU+XSagRADJ41xJeZoeYFaFtC6/PcFho98KSqGToExHrr0Lhbi9IdjRjfOR1Y/4vAH
lQ4+abRCCw0F0aH3mKVWYf5ljnUdWjhZ2/yUd8xhxH+Dk1Gu7Zo2QEqvyLWiJv26htltwQsUSE1S
Hfw/lJdaozqzmsz83x+OmmpAakvcZ/yedx7MyKWhAuaKW4EDgi80W1WqhP81gzJ3X2A/xc05q+2U
idtY/T4nWXzUVFncvNIZxVlUKdmsWo/Vk+3wCntm4Pc9G/N92rjDncQtpTqSpHQqrowFmMQRkgLP
vz+h0mT1YXQYmQ/NZiDtjo9h6g1thpTPEYTu8KuRLmG86LhjKs7jrGBu6Dzm9/aMMThiSGQ63xH+
HdnI31EaKfRE0HaTSDBZ8ettTmhz4pkChlwQ9p55+QGz7El7BqfmYLa6YS2mFSAwssbDlsIk4Sa4
pyvP0SKm96vPUZ5z1avkIXneupfLy5NJ2p7DQs8e+NYkeD6PiE2tXsnvECfx5ErwX/IKx/bdv+io
9qIjw+8vzvsIGXYz+77EY5Al16/pshfn5dUbL6rxmMI86roz2Dwe1DXqwpLyHDXA4JbNSXLgueIp
RDLrGzu0w2876y8hfZdBomVyJ3bk6t46ZY07qhErmxlq0dXIug9pcxVWMTRBrqIsiHVvjOLqulkA
TjcaJ7zCebnTf3PRzcphJ/dKhQPkVVYjpdpXjeVbnsM/R15VnZGiKdqBy2ha7lFzpgqEKF5lqsBY
PMJL5Id7cu1SA/1NdsWhJnsNYT4hOTLA9ttJEVMQlMyGbROerJniab9BjyDqkH3SiIdXnX30gZSM
kgNuJNCJpfw2rVFuNR/YBmBuO4lD9SXiwKFKkzGoqzcXL2O20r4XubNa5AStURQjgWCxl5ZtIJIK
PvuDMvmOG2/vZ3yEBhVl7FzR5zQ5w55J7HjV/PCModVZX5A+1zuIXzUq9rcetthVM89/Wfiyvknb
/oX1UsdAAzE3ffiEYU5GhQjnj0FmgYeSZsmMTOE4lDqFxYpwtM0BJixDEktodV6HoeZwGh4DdkdW
SswyeTm6Mxx67Ko/v6WWGedwvgfOoDXfxunoHG4DtKHBerRXFQLfvB06I4ZFB+6Ybmxlgoba8yX/
wl4XTCRgbiJcjGQCZb+j7Cj8yfi1YKKI5p20EXp4rf3kZc2negHzWfNbHy4WMyOYteLtszhnYDrP
kFmtxh9YBZHK5shLuQNorl8wPOS+bH/ybwiUoeEGNIPBztJN5X/L+8UoQOPb3ECxm2nNyzJi2xl8
7W97uIetK8RW3HPK3YRlCg10cRMOSwZg1YIqF8MLM6OeBuuqv0IHafQj+4/axD0oSTdd6/N1j8lP
voLl421sCEzewLvGcysJLI0w+yuoYf5d5PkdcNZI50TdQcqC1U6QWYy7UVVDSHfpbYHvnDY21DZ1
9zlMHIFOGJc8N8IjR5oQIy1oLsuGBaqhtqO+F+TwQx4DMRQdO5JtOgOy3gb920aLW1XFqz3BiguE
ItW8dhCI2AEWz8SXEGu1PT78CcGWMdKTQxR7xVuLcj5kf7kIXGas8KE1VnPJKJL13cLeVDeqO18B
t5T6V4lWP7R6HRCF1Ujg+IobXfcqg29EHwGKbDhn3mUbUMAavG/vuTfDjEZVdwkDlQj83WU/Jarb
fBQm/JTzv6L1ht7gFY0JjV9+1B99fnd+1UrhnsZmA9ycGVt4AOz3xnVHECQ2r1BhpBzXzQJbXQbK
0GBosxnwyQLkRIz+06CviRAC7oVQNFHBkGO3aFnym3cR6jCV0K81NaWj6dSMUUp75Cl/qTXvv5Or
Xr2sAVsjvuG21ej9EcyTBRZwi11DbPi8qGCrkIadefJZVe2xISpqElCTPTRVQLasYT3liyTcO4sb
vtQv+dPInLnCwxfSk0gPtB1no/hbZX2mLOBP6/dC1lOXEP4Qe8Sxixl0v4OK6do/UY7ROFlP9wv6
HBuNgd66V/IroizSObnrKHhz5vyt+q6hQXUOTcjxQqU/sm0YF63h9MhGXrxDC90XyhOTHe/x+tZM
60J4S6dyzXrNC6pSTwZBxfQ7o/hFd+tJaGmonQQ7JFP/d4Y+guiDtkjZ3rK6yj15/BrxQYhl4RRL
9EKB0ZGFJOHHJk9chgyzHCzVGYqa7WXytN8AC4ZSMDrwF/cgyEwgElio+WfstUlWmmmTvk0S+7ZX
w8AnEXWrgQT2PMdyjDvt2W/u0IQBQVDHFig06Raq9TSbmyoiOxi3VBWpWNkcUpB6w4PoZLnUGKHZ
r5WSg5Qq5kYMBbWHkPOPdhFsz61TOLqI+z6R3evLdiF/DhMlutgwlo2DkbLkHNzZkpRiyJBRxUoo
5QrFmgW5JkQ978qEoymWjUw0AjnM0eko4CDzeRergUXjdbbzgw/Bia0wrXvgYNpjg4tR264yTkgz
jjRvUCFu/tw68K4/czpIKrQRTMlSTavVwZOVWalw7VKWjbi5DjHBfmgRbclHxzANSdF4ge/d9khX
icQxzrgFozftFpFOi2L8ksWskMV7z8xqePMLINXYnxTq3kK5yjx74UfuCuJprCfRRJwPKPwQ24ft
UgWJKzCyBktqtNs8Zug/fLzSMJzg5UjopFPl5yazTW7NEBtJuIt+aP7+WMbTFk5cYW0xTzqvM+tY
TNfNfbxN1ypAnZ/Vt6CGp+ZgwsTeeSV3fcynt/nZsYsiyl7zfZFp742WL6P1T15kyITDzuUJX1yC
LmUbGatHLufwKpd4rvJSBx2urXix1W0sti3j8GYgo8Hvp3m/HV6KdTpzPwOJHZCDyNmljmwY13lF
ZttJSNq2xFXIh0vbj1ClxJAjLgMq2KVISkfvjE2516kRuxx4SAQO2MtIYkqs++fK4cQAVhLnHOeo
IbdNbQNlqiXgkZ82kFzHH7mG2gd2Od8pWO56EvnAsSCojQvRyViDVBaxWCVSDAeY8yYRFDgvkF3Z
Clxx8DSzHJnORdBnTCKovL9Z0GLRXI/N86hOe24+LwgBj1TAfbiA8m/bQrMFPtSWDR8WR9bZJKz4
EGrAdtSeEUsZJiYqRiubOYMOBhGtxi/CMt49opH+r7Oo5ow4C8pD6v00B5oc23MOQwpv/UwPpClW
nt0qGY8v585qNtliertjXm46imSsMKZxh9jECy0XEkiPmxkh+zgmv7DVGAqJQ00Hll0G5yclKlWk
aZTXT7lQ1bl7/u+VnsInG0iQguoKmcMOnsJewYGzKwAITjJCoZTf+ScgitoOi6lBDFFtGrINLJp6
cd0A5nouvjBSlYpnooXbQTHSxk3/r9K5KBQ9SqNOx3gw48yL1KUTUBanNJF7weF6CK3/Yq1+23jJ
y5+6rlddgHSbIxKTRTkxHdqtYJ+W1X8Q2DLtb9wh7PhOf+FWnZX7yyiicWncm5GBhE23WaG7+NiO
5vkSp+BTEKlCTtXSx+uFWwLq6mSAJ/KiHv3wQhBsO5QVMzHGzdEs1E4CxHq2qO6bFVnBZMLTVh5c
vihhvonbG9BZ5Do0aZThZaB2rdZNpuwZbUtw9lZhvTBKfZOE9Ou3XkUdeN08uGkyHQ2oMFU7L25f
0rjYEItvLDSKVEO+hPoQLlRhOym1rf4UnuTreri1VRJFwmGVpiaofhFycuLbaNact1MtN+isaeW/
0o14FHf/H38SQiqDNMv8addqFvgaKsCA/YnFkHAebwyihc4/s/WQLHjXZyU8wvzdm81nm9vhCWqE
ZRZOWCPqh3fUcMVIEu8fNE0WcSrgXk5vg8DQZoxLFXerQD4iBEYkUscNQfsFnJYs2M8wj6nsym0P
0IU1ZpP2akY5LmOudi1f/d+xWsx8S98QMx/AjU+ORZbLA/DnF9Q1j6aGqpfokgDJlqqkR0qfalmu
11WRTdmyidi1PdNjSq813JhJ1zGoyjOroRPfoEvAPK2ednEWFjouukH8FhvbJfOyHuHtjGBBNQGc
tcVqUTfrpRiuALEcyDv5xHUzeEtlOhnAPq+lIly0Gv3w1oOeP0dO901eQF+IpLCOnoD+Sj4mziR5
Iz7WHPrmupc7gfyAhzWqaX0het+sy4R3mVYz1o0Cj7ejz5af0uf5Ydpb4CjvtkGOyu7ZEz3AmN7n
rYrUWFGV61wpGEHrGwavfcpfL4gOrqFS1v0eoZa/1jf0uGVGh+q4/DSdQUI38sr8zQnaz3IqlmPz
FhGyOFWGOyqhAmWeHq6z5Oh227lcYN0Dv0WaRvxTL/sY/GSPoeKnuS8qwdQPqbLtWwVcn7i4XnQN
QDTAj9oGYBVV4/qaRGCeYFDZg+tOB/R6qK9O0pn5k6Ktib6cIoS89+NOx5fq/QJs/L8hyyqZ3PSb
m6xLPWI/Wfv15OVwRrGso5OnNtizTYkbJLdCX6Hi2GM+JG2c7ctoapwiwDT8D29IvA9AEuUBRB2x
Waa5qPQli/QNYhOFVEJ2O/5zCNMsneyY0I+7bdfMchp0sXa9iztPDg1ue4LqWhLdvBIyVr6ot1km
20/kWzk4MP2Rgfi84xCOw58453+FPlKrTjdze8Dsd5bbHkYtyvs4uZHdOzbdPFQtuLT7XO7OXX06
A78iLWc1Nwc2b+zsxoUAoKmp4HTm9F3SavPFTT9NCNbc3hw2FW/BfxMGkeC+EclPL2TDFbBGT+9+
a2ZaHIbVtiVKc06EyGXY50gLJhHOOawm180Ki8bhn3JXM4NvlCfWAZLrq0bfVdf14hWGGV3C//15
uu+DTRbUp/M94zq2kur0v2l+2FUuUjUi44GQqSsb8kVWegOpNTmH+ViWTsG32bLGRS0Mt9sVQyqW
+zec4F+8tWkl3SLizllj96y0O4DcKgpx8iLyvJLvkCH7w+3sa0JX3TcQ2rFINttUpyI+qfyUBHHr
V+tHHqcmJG95Mgvk1XPaETP8gq3XXAsQYGaNv6AwX3QIkk47oO/5l+OxXKm7NhFRGJxjMBtre0cq
OijAc1Blwn+1Nr9BX1VWF7HWHwh4g9fy+dvhIb+FJG+62EJGURErahmQbWU0ONPFEe/MUk/Ny+zx
RBZkBTapZWOgiCL34Do+0XByv6NJTa/d+uicUTQ58IIH1DONqvT2czZCO14ojh2pC6GvXB0y+WbD
kfoDPMHM+7WvjNVNyLdB1tPbxV/g2JRXwY4RfukJODEH052APlq9CQzUSZ3mxXdhnTmoy4LNg2hq
1a9nHFSFwDaoZr6sTebIbOCiDXrz3ghUgB0nc7e+jPf5jH5FygCTTo0WmCO0shhsqH1d6qKRFS3K
Z8qJZmLaegV3NX8CUDHQU+cMSa66jGS/fB95w7CKSjW02N5goENvX1UY/vror1877U0gRoCNaxLa
1hFL3DeNNtKItEwk1OkA2QBbD+8Z+ORbB3QYn1AtUrJQ5lehietH+rGFwSAMwgB/bKUS5u8dfGDw
2/VntNxI6pwKFez8jFEAuVVyjyDFsro4DylY/lDkeN/48HGcud7ludQ/D6NL5RmEFGmxVNIdGYRm
D1VEUV2BprYhh+s1zOrpmfEdE19pMfr+W+Mv8t/dTmwDcQQxPg1xfvxc9YIR7m8Odr8W7ji/Aor+
r7FWCVly91gRsWIu0EjKT5CrvqI4gW9DzPVpmh4Mm5anfyeN/O99AfXuxOmYjw1FQhNE5jt3pv4S
zbHmmWJuGsjz7i0RXNXaRO3Lllk/AeRbrCnvbaDea8JwfVZJs7070v1w+TVXZK+TqloCN/NjHQvm
l1C+BWKS/HqbUmFY4loDj0DeYsAt3omrG56eDYbuDkDFMXNea7+qJnSUa9b7bZO0zMlTFteiMTpH
xtCncvyM48V1UW04/G2B3jI3k+VB0nFJP6/CXZ2zovPW3W2eBPcMSzcQwXvinwAD419xhBvMklRg
i9IzSPDE/6j94xMhQyGPdjIrKhJf6+0EDA9kIpf8zbQz7A0kYhnGH3rEC7kGY2H034RECiZPKQtE
7PoCCR44INDg0u++VMYpYf9owWbDK9Oue7Ts8wy4dzej99umyxTuf/By1deGdO3+Auf4b/+x7zV3
+iCD3qoTvWHQ33FxLlnsHnNsCr5bMmw+mdV0es1t4YCTIjbtJ20UN6auvVQOeBR2v2c7LgLrhjMG
krEVBdW7l3Gxsvz7NXWPIcR/oeO95Io/7U0erM5I73zXmhZQDZNUhehbZzu6jIafhaj9xBc+AiwJ
5ZjONyKCw+WuUgsjFFlmPM25y6uTQm4FEnh6f6nEQDdnIF2V2mQWaLErEae5aduV4YbA+iwfeO8p
WYUIZIeHuBmPHfRySEyzaTLLbKfruovAzxfrQQS6kA9NPyd7eN4YfOLXHkObwIv6Aa9CT17d+e6+
rK+w0EQC25OD5XxJu03TyEqKGk1jO/v1O1z2oH4PJ1z4Lkx3bVwRolk/VGfr6FQpskB0kv9GEKIZ
QHmyj9G9zqdzEC4QJFUJFnwoGgF5BjNYfcl3mMtjLdQ+eBJxI8JzCF4kWdmbsENJnbSahhuGjU/l
pvM5jRk5jhZ35rMuNMEvT9umaSDLdM4v8KIxIQFuY5Y8jd74kkETx+uRgrpoM0d6gquRhICvo+G7
bvMMKR9nhKg70XlgsqXRVAAqJiu6GFJrCOqGaXFsU2HUqvM79F0xxKSP71ffYlKqPW9Png9DSoUl
3dwU21wMqM5t7o+PIGZAZ9Qb+UL23SPRK8po5IWE0uh3mtpA1oNalDp2buL7WAnXUA+4zWJpOqAa
AxEVaosRafy6wA8UB6U8Frtu4cYukfzTdpvdZNZx3UHj+5rJoQrQlnYlvMl4W5WIA4zz6Dj96p9K
cLyJkRUUrd0PtGnQrdu9rzax6kV4biZFjlk5dye3gPpKx/w1rFKPYRxOSC6qVAO4XAKEtP3Ez1ur
Ay+K7LJ+5qJKKc1M/cUd7DnbzpFIXrAQDIgZYUnqK6UsFIZN7PSPP476sw5UUFC8uBm/EHUz9qnb
NXUgKhpDvK5p8naA1VI7zGeKmlxMFj3ibvS4YmmvFsRTLYOMxY4Q4qEp4neRbHYuWdX3djVgO1h3
yd3m23K4BxEK62U+dIysaSHQFbowvDn6JAL2o61PA0Ey2j+EOjnEOxSNzPKGInSUzaN5uTk0bJom
mo0Z/hJJArCT3L30SxCeP6JuTzt+o4UJpqsVSk2qrFxe8P0RzxmSkRFSxcwsVVFslkxMDouA2gAl
677T3YSTvllCtQZZfg/5mWLXcS0cyOmftksFWLE8v1GQDVuL6/reEDovYq+CDMYjjcLNo1KAPG6W
jhxz/M6m5+HfcUImeePgQSvN9klWPADj+3klWlGDhlnYUD0dgqFg5dF8pVXKDEWfKWNBzlk7JveV
MYYTp3vsckjL/P2xNUlGu3StFZlhljjF+8s7VvFV6daz4mF6yjjS22q7C7bn4upcNZ5IqfYDNCWk
+b0v41+3jeCbnetBTqgp+wTAHqcUdOmE8l+8a2gQT+NHYvLi21otkWKYQjb/F4TAjOF/lTAm4uOM
nLugb+zC0NMNyG9S4+Pc/F7bThJ2l6JI8Oa0L2VnftfeG2IrGNEscY77MATkkl4kMMA7W7IesvyU
qJSx9jf4s7jFDmjXrcPi4mkY9xSaSgH8bs/DnjlwyiRxtMq0Zxhw+ueNcx7lbsiRyC5+2unSoYm9
OI1z/zlIW5yhgLDsjT1Hls4b8KLrHhVDs/MGu/I81Tg27lx1Fh+Ggi0RDYV3/nLlBBzzgkD+nXPY
L5JaAtAUgGP5z+sovpTKMUBJzJ8vYUCHDEKGSphsfHk+arzART7if/FXfgP2sve5f/z4JgeOQCRi
6IBkh9PQhCdOwrJHRbs0mhlcpZaEmA1esJb4NVivn+mYkDdHUrQQXa/aJA9e48NS2Y7Z0N8h1QIM
Kh9xTXc90cLG0MLjEScxDevyCsTHx3iXV3SVF1vs46CBmbo/2vRPFaLt5O4xXhU1LQc95GYpzvZ5
BcsPG9i/zn7M63HOWvonT34aSFEyuedwtKp9c68/YQQ5Hfnfb15fUlMOGHLpXeJb2u3bE7Xj2fOV
sULGO2chwOh10795qun1sdqWgPbaNi07ZFQWvUZz8f8tRd3dLMtIdmgS3EqdqqrRwSWC75Qj3eGI
Ahf5J9clqOcSJml8ySio9OSkOD6hqppHSiDSO8Qw0mWRJZl0Egzn64xaBjv6nCrD4uqlkTC+2Fcr
YbX2UleUkLrirHVICAM6FvQ2fSLPEVJQA5N0X5pSqT4P1AcPIpwnFCbOhASspbhT5IKC1ZZ1asFL
YOhWXu+155QINEpVXsMGQn8QwR3kiTn6JuOjZ2yNsMLrZU+6IPFf63f0+y+DkAoqumcniBsoN7bt
LVcAwug9bY9Y8QA2g/DhDa6g5v2mJUlazUL0bJOsWhKFw9nRzB/ep+rO1ZE2ixhbfzacLZu4w6F9
zWg4Ob0rq80/C/nao1KRE7eEUstJUlrEP9ETpe26FrK4g9Hq/MbpPmK8MjKP5WgUTMJsDJDkUByd
BT/gsIJpOziA/K9HczBpj8rtVvwgZ4gt/BHZvF1U+0e6MElKC5olAhsUdBll03lNlDnje0jHKAaP
K7C/k9Z2c+F0BNAzJtch9I9QXECJANMmboXkuEUHoxNJ/HdvuC9uD5UJ4AvIZkLo/rGqhdLq7/ak
jzAhbPx510JOPNbPhnpR/TKvAaQfciYK0R788Y7bscTBffR4nBfqqzfpXZPzk95PiOlewfunDwdC
Jf+6rjndsWO8Wq5rvWxzripXwpfnDG3k2L+d09WbkDDMzcE0Dpb/R4gSl69Y276DamdlEvZKsONc
g2oMZ36m1IkfobpUS6VJ9ZLvn0P+Gh8D4V3pCAPnPYG92Ib+FvtGMWOnfCXpgGrQDuvGo38icDLV
vHPawvmxmsjCUwz1UPxXp9q8xb+989hmh969UcTt6/kjyBl8iWklgfzXcnvgW2yjL/ovVmip9OxH
Y7HWydNIjeqrla/e2WXqx74s9YWsr9nAQzRM9txkQUmRGK+5MYjORUfcAg0C13uZwmTLS24DkcBk
ObpxcRODx0BFDT+RcEt5Ln26sAyHyVxAGHOl/urhCZ0fbrMFetMuJNNOvTrpWDaKp4gbs/ZgQ1QB
TeG20rwuVD2EDPQ4Ohbck5POwE8IVrjeHeXHEeNl4SsZnIt3nWsmdTH/89c6sT6JAHq9FQEf4Q/V
16bjeUEw3wWdj8+mhJE7gdJDr9kDxOupd3H8Ng9rxpE8kO1rV7278OpIAyEkGuvpCD9N2tY9B1Pt
o6ewXs7vxQEqmoFRF+p8VLtuM6eADlf7+7UHsEA85aXn+eieYXvLDSiZxL2kRaf+UeeUwL3EQQFi
wOZ4B01vz3Mclj0j7D00H9vEEuQvs0yyylSKUPYbrPeqz1UE6ErRj0+g2vfLj/e32aji9A1auETs
BG/TMdoTpVF2VYerwyK/jrjJbehzokIafxQ8jkzMY3N68Y2iejwlUx5IwauJuTbW5TvnN6pKlZ7i
hDbwVHJaFRJlAY0vz2Q52d7lKRsNDHc0eWEuV+7Wea87FT6AlXExfIARAMTUWh5HpNMgQani5S+O
mTISIelWQvpxCw+zFU64fV4Dd5jyzHXgrlDMhqcSeb5fKtiR9h6LPrtEcxN7rLeyMLY34jm3a4Lr
ClhNMThIr0HJMnpZEcb4HPe0kLJvLiQoVAh8W3QR+Yfkb6afGx2bpzGo9QOUZfsiswqidkwhFjWd
FPZf4zceAHLAilj+ImItWjzJcahCX9FhR7R3fvzmncvO5QLLB1fUKfvNnYHAq/FwaphRmFJwaC6/
u8QWWuAt3j174VM8FbsJxMb6/bGnvtPNZBe7WU8wz+VPtJfgYGFc57WeQG4UrxeuXPAT/rWyhePJ
msWL+zOtSYDy9Pb3dP9C5yKWVLEgGPDtst+/1i4IFSE7fdhORvkrdKpW6yQbVKMECpLhSpiMICZI
JUg/YZ+N5vFOG3dP0yJendMjveu0CekCn2aUDMziXrL9A21UGwZOj1bzZLA9Xhn5ZwafTykpce9p
f5ogPjKrsSRHd5NsurkIbMyNOzzeDgf22wppoQbWu/BFyTTfpshK/UKw+cpSGBnVnShEj4+3oKtD
4BODX/qZai+I2Bo07H50fzLzssj9r1UouiVzHlYVnF+7kOW/gcU9DcJ4iQ3FzpOcMjKcT4LifFQv
kRFOCtDubr+26bOnGub6k+2hGilqOYkhCZH5hhqQJDPsoK7kmUFqw2Zc//pUQqgvIEFnvnCx/Ted
+QQRhc84pgul5x16BzJ0oHg+lbW1bsIcsni/nsM1qRaveu/5A23+szVS0AdL8ZH9iqsGCJendD6i
UMi6p0jRYpyQ+jmePHA7/qZdV6li5K+WwlQCwwgm1IEM/Hd7HP7AlDfv8AEAxpxZiAQw4106QYLQ
ofgAsicUWBG8GDSWnRzIxZmFsvesQwJO95TnNEZL8KlEF8r8+qy9Ny9GX1E7vMD77j/43aRd6ur8
PT0aeZH/ZE4tGbaRD7FVLOTwknK2eiMDH8UOg6UDRniAnLY1uPUsQaHnA9c/Lge4D8jBj2YigEt7
v6nmpUcyJ74mPdSYI6Wj3B+pDDx2IHKxfdC0FRvSFOyeUPCr7lfEbt3ZrHh8XBbaIwlB9FLWVTvj
Ate1+gzpPt9u62mpI3Mf0Box2X6/D5rt2N64D2JkRfoM1mA7Kvk0OtYKSq75yF9zUQQCX26nBZ0x
ZLgO52iUL8ayXirFNo97pL/cZagtzrdyfcJE46m1A49liPvhaX9mn+3oNX/Tet26GE28H25I8cBq
OpykHuCSmAe2+l17r3i96t/Mtc+Y/FH0HMhtuK7c/b+9c1UU43Qpfyc1fCZ8rQuqQ8vk8rQXicgQ
lyBjq/6PxaK07lf43UKX47Nq12VgBN83hfxt5ZKTVsmwheiRXm7hWPoi1/CAdvUvT1H+LIug+UKW
5EoA+Cb2cj1GVo7hC8yAWdU+9m3mXYLF/ySj6zt8WBb4e1SEpz6FYNTvwIS2ij5+Dg21kVvCljte
BdX5rlwO/EsZzRAVi/Wh2LZ9Tgccv7DTBaGdzyxpGyVblq+utHpv+qy+Yyd7Q3K19BpoVPivm3EV
w9xuTxp5QfvvLTkzfgYpwTdsYRuqLMTzcZ4VgosSPpKx+ga4EJmqtZgn+rqGDLp09dzkzXIA1/BO
u23PscftLu5Pgvrc0DlQTlyJLNdcez+9FXONcDpo4fCkIq2sjy7hPS/EBCLbLUOSNNoWDixIDKDT
Mj4LHoAjM2fdkn20dCL3V/WkGBbQ/zpHw5zaqkdTJ3EWB/JoT2q7P8C5cfwJRFlP8VSgT4jNyqhC
3/8rr2AGZ1iyo+gI783gYF4zN1eqv7m4bmvnSzyYWFjzJp1FngSG3ZRz+aZAbyc5cOYaHaJK7uno
qlyqKhIv7dhZo/c8vkM31RYWqJFuYY9oXbNlF3fyvy8oj0zrZMg+rZ3nkKawRFXewhMsIgVmDlpt
lqQligQKATn6erinyCSuhSZaVMA1vxRx9ZkPMDRBW9RaTR5ZcxZUMnY4lRnV0UfUp4jekYOBr6QR
Xb22zDVPpMAa+N+/HYftgyEq2yGW9oZfjFiAdQ0syHWik9Zk+9h1ASm0aYmuT3wybLnAZzIUZBR9
RGh4QxFuWk7izoStzwePXL7yE3HlToKP/TMxg3IWvG12cAxOdq/+R4lb2KI+xGXdkKj2TfNeCmuD
ebxVjTfjyUtXYQRp4RBXx9cp3CgutRQpwQHbf3DUoG6LAc9DNEym0EKEkalB1s2zIQh190FMrd5/
A+MWAsuHs7Ih+1SbHMyMbf2bIMY+hGsdBzKSRd3m+BZgfA5xnD94TneoFj6QmG1UyEfMJu7tfKGH
RruGNQ7Za1W0Ii8u+dtB8nMDkucYtXC1F2tlbz0e3BMVLP56t9cp3rvVfZfaWI6YAwlSIVQccLM8
im9sxFXk2tH0vBv8tW2JnH0xLPKPGMg8RSVZW28ZDdK939Qtp/JNmi2FIu0KKrbpvJsXt8BqmyAQ
Wsu3F1vkA/ISUfOpKsx+aXFahgj0wIYsNWInU3W261TGurn/lTBfPy1bISG2WZHpWJAqp+V2CSpY
Gd7OSCgC0Y5TURRpKzs9FVipQrgm9lU1RKeWeZm4CW02FIPmTL5C1/bBniOxVvKT5DNgOtkzBM7V
X16wR0yQwWFdi1UPXz0P28eeG4q50L5tDljc7dfpJRWCdBPGs8pTR3iG+wJsTMcENOh4F1862hI6
xE5OqvsdGOr8APwazqkgsp7EdH5Zz8jHbmqekC1wfjUL6SFor0zq5ri3PXiqPawlStU8CAkP/+N9
fiAaoUTMfwiaIrT+jkleyaXahkyRpegEK2UugkrDTFqbyIf+NzuTVuvul8Z3LbqX8yP8gDk/RfaV
4mR6aG6lZjbQQbvTy+us3bm9imD+GudUz+bxbrjvff4gPpvyfaSODKNfCCmQVSq19be0WYntIDf8
oA0GqpSXqiMTwjYog+zifIOHWL21lO2P+cqmK5eOnEE7++jMHH+NZRGMGU170g61brk39I3+H326
oErdOGdbbZP6wisO5Oe3fIn9gATzVnW0Lze9ecDtRZpbjTz816kVEjHMBaJIS0Ln2A8wSyVfpiQH
Fm5BvaOdt/So6Driu87WOGxQsjsYQOG3eQMMAyrAIQgts5B6ZbKkZcgQvkeaMLt4hhMHxnQQrhwE
OqkPeGgsIN5xHkFlxPwwt+VtvXDs7mX6oM1JWkMKzRvMn8DhrnbRiWLP/onlY7fXcd3eW8+iqGUS
4hov5UGN6VD2IztICMIJ1zi/frs/Ka0FxpzGnru/HIW8Fe+Gq2HZWNDAwQc/+e4VptqQwzdxCxzO
YKAt/2a/ulhduIgZSeQUgg7KAJEU4WXH1Gp9sckFhNcKiMn2SNmOhx5GZvb/YIi7K0vNcFnyyBgN
TUyaaISMwr1Tu1N2GO0KicenRQOXKJD/qHmArMKuCHj9j+xuEKJCFGjECRslJ9uPqBecTeWh4PNF
BgYekBfmKmCT8hnenolIG0PcswrL4T4lpol5uodr60t8AknBEJgJ5JeGJcEjqHjlV7XrhrZZSGjP
cGZ9pS6SJaRp829/mmyjAhkpR/fl98mdiTBke1ZikvuR+z+xyGYvLwHNk57HoqSdEvZDyUf5nsu5
OieRlsMXAElZO6dFHUOyO52vLW3gWr+F6c5HICKwpCZOJ/K/mxpYV9DbDrcfIyVQx16PQ20cWw2G
4TJ1m7ge+9cdcyMeE2/c+PS2txCtOlko8lSZlEgD1ha/Aplvk+ON1W9JCauj69yMmHe3iLzr1M/Q
9UE3JuVJtnoBO+TKifm/EvHPmMHW7sFwbAdRU3AL0oSnjcUbWQNUZ7GIbwwIggwFRuG8udLPdZx8
Uka2O1O6Wcy7zQJPj6LvZG6ufEg1HCJsuSJTvepmEl5KkLP4hLN8EUFjK4Aouk1CBU+aFcO3Rnab
SYHJLWF+pLxIk4Sxz47QQoYpjsHTub+peV5UlqkZ6B1WRvy7UQneQQUkhxLBZWDstVtQCMWArfio
m31Z6o05QjerPjneFMPABzNgwV/KZanUQVeYb2+rtSUxL+tI2rar/t69ogT2fGDlBodhWFPMULJd
FvzthAm/7Bw9+qcMiE8tcwUipu1ivPdyhj1+6A/s/3UFL4p48gq0gztntynZuuBoMaGpMPvNatcH
Uuqcj7I7u8Fd4CKCaAMlByZtV9ttwe8a5fwFUOzF8YBnloAc8VCexqAovfrN5inYu8OpcfbqZZ+p
8I0fuweUbY2i2OA93DWfVBDxqt4NyQ+S0j+RWHGr5EBLDF39sBbCCs9wSAVTZCVzHzKgAlnjZlMj
Fer1JyKpG7IaNmJrPhaoeuogeXkrTZjDqmnlKfl4jR4njdxzjnnRime3aM/kmijQWV0zY/j1og/U
HCsSl1tzDiltPo6OOphzhI+nqSduMc2m92s3WN6mQDgE06W8PgDAsDNvrCQJsyP5GLQKVbzIRbLx
f8moUHqkbJkxwNl4/bXZgEwudmsuBFxK/FLpfvd+/wHtEPxTXc9olR1FXJd/CWb6HY3S5YIKfxxg
3+sq5BRM95zfwoZQkveCqL0MpkUPjcASIu1255p1LcK/VyEFl8f1zwVnHeqRTAbwu1UlVN/rbD5V
uYBFDeay3/NPQehW/F1CnMvldACJA0sGaSRF6slX9FG/SaPmGyl6M/X7oXsJCvuFjZIKoZjHmuLk
KRrl5/QwYPznugv6n2T0HNzXPdmeDRtdpYsN+fXXd7Pvhd+QTpTlMhxIqFhsL4r8ZBJSOsgSxNj2
olYgPsXcTxytW0EvCXRbRPMo5Ec2j3b52F8KbmKUYylhFi8KrVj9AI6mFNeVS/8O0IE1mjffyNUH
orTnacdY/2iHe8/USU9Mkmz8DfObZUFH3Q7IbvKNcIeiGzccwM16EVAlgJCF01k4zs1yfr7PHpJ+
/K5GxjgQ8gak3zXd6ZUKw9iMJ6AcZ8i54U+GKxw7FfauF5Pu1v01ZS9eju8Gv9B5lgqoGJussYer
pGQWXKH59cXPRH7BnvK7JzgwVRAhPwkCBQDpf7JKi+3dh0UnMipql0zknJHLi4/1ZCwPYyAM66Xh
woIYFuytG9LuMSHpgEngk1B2MneNg3+rj0C7fhRHhr2rbhIEVZeMPn9XB7NeIK3o2Hh9fKx5/jOh
9etRnKMMle40M6LBRSRC8PQlogO1I2k4KXa10WKpVG0U+8xiOV+DqeLnyJi5ukF5969Ot/gfzLte
lWG7hxSHUmJ3pJFfa3BzXAvDiIBxfHcWPjSEtCfAn2lQM7mDJ4egwqZlOItZRfBLgze5XOboaH1X
diBx9RnnD8YSqqIzgAR5yBKIdrNjTWrH5cR/1FOX8mWBxrbkBW27xs2mOs+PfRtRZB2H4XJqHnIO
wBKp7S9W84xi9o8J4JpsdDTC+kZrjlKHa3lpH0wKKMiqpJYM1HVNKw9ppCdudvP0X+5pq7mRNlCb
syU0quAMTv2/dhYHiR+0sOAxf4985b9TFFe8jrkKNL/mUVM3dM7qRp656Pv2Vg1/m3Sc64SNca4F
jtQzr9cLa9vbv4KNr58LjNfMUyeDQAfvOV5k2tjyKBpBxzxX3sihM8vN7LLxcXpUalqwvPJ24Pea
kS3KuLh5by+moOi++jwmsrD6svCMT3ZZkd/aop6Mmvlo/jrCFsEvyZdq1HjgA0zkdGb60MicEnqr
A6OAIC3EedtRUsdKzzXWEUjUZxFRe3haYrDAl7vFBQ54ndPA9pn8G6ETnDstKNZF/AUogZ7knrUQ
djba94fkvYmCxnwHJEYvKqg4E8oEd8AkF9fDdlhCJRYjwGBag0jCEytv2YPf54MGcPqsabujgGs2
JWg+7HzKjNLICYa4cBJrR0I+osKEvBNeOYtT7tdlojV/BVBwM/WnqCeGtJbjqwwZdqMHBkkZjWqT
wJXFA6ijT3eRY1Tr1dVqtbZ6wo5sF3gu5E5J2R6ssax+xYQBeWtVvd8sE6a1rgV/MLJn3kMoOFza
wG3L5LqZ5G56JF6jj/T7V10LYnTr3NgSq4A0yAV7lTBzGcmPR5/Yd6mxS7CqgK1wtGbL1axeHKDN
CotGPx5jYFlMBzctEjI/kN/Z+rZ4C0c8b0Wqw1wC7vePLmGDZJVEhU8j/HCz4Apdr4QP++iKQJ4l
+QYcvjhdEgnWY77jrvfzURXgFAWGdZBMTte4XbWZFmGaKYyqxs58oN7RPNM+D5LDbhs/9cjkgGtb
XdhNEGi75OSnMOn0fP7HY6hidaYQLorEIQMj4tX20lJYeD+JCEn/P4DJeEowbb4TMH91on3LKkNf
/BClMrVB6cXmv5bHMnghRh7AhFYl/fZ0XH6ADfphO9T1BDyy2bilOkP0EobdBvMGzvwhECXc/7uS
i1xUsclffammlaZ5N5QQMfGsLKoM3z8paw4P8c2pRzam56VsC/+wPab3/3X/bUqt/kW88JY9zZiS
LN/xQfi38qjSPiR0kTt8JLs+yRIls8AZE3qktFOR7zqNJ0GdSzodl8MVNHrBlWoiPOD0qvJcVLVd
cfNI8IZcJ8sgGGjX+5D/Q2jW76nC/p2G4AXwwT4lJFKoDcwxOhmsdhydEACICMw1YhHSM8DXVNEf
jskQ5GygxiG/Ezt05zN+2fvXYjNVQKKtzxYZKIpw2+QHGsi6jX0QOsofxhjW3EK25761uk6AGOg3
SpFGDNgLxw0NPZQFbWJ34+SX9TKbeDaIJ81xkLhrq8YSEsRpAKYuvFlyPbQJHvmfusABPFWZVk27
2qrws2AYsj7byTxcDBzCsghZOAbGc+0VO1SO9PtjJ246+n0ViojE4ijEdSnW+jPKIbE6Rfkputkr
WEkn3cdXv8640VQcC54W3G+UY0ZmHiKbIIi3npWVdwr+lIHVn1vWBIIJ7MbOkw65RYdy5FsLMPCO
d33Q6JHb2NMU2stLr0X2GHr6c4pj1PS8x5BnNqPwO+4q0gZZXmQDk/F/Cb5WDN3h3+kw9BQG/j5z
kigtR0yTjDygvzGHZ7f3mljxrOmmATzK0hEbUl/JwbL3srk4cc/DdbdXCY2kkH24pYde5/am+PT1
MT+tTioLA5kb3mw44gR2KV8UWpMhHA1BCdN1xJjMnTNOO7wlUZgm8YVTFLQ1/ZXMCQo7uF9xkmnR
T4Vr1jmmvWOPHjfuMtN0tzkS08OISjJJnA33jDn51AF/EjXBlWE9cmFWXVmPiiGPc1J/ywOl4MhH
KeXuePOLVxuYB6izgPxqykXthHss3sPLIYGDPiNdO//ALsJ/iIxkFcbhbClKf+MdkQzuMV8o/eSL
UYV55vL3QYufjkuRBrEFNMc4Hj5Gy5HBf2Xd+vqmwZ2Abi+gOYG2lzFHtDF91jDkRkIkKMMGH2RW
HjNDupsVQow9Bz8oLRm2OXIsE5nzH7LdeoQwwBxMi21r9ec3x2tEP61gnVZWitzr4MLvOauTptS2
SMTrH4h8PXkXqfQ6d8eR+Ykv7np1OtOql+BUC0SNRvKVwA8XsDx930FCoVqLnRPLgudyajEPrsSx
N8Tap7/0qLyjKZPMObOfNxny4ubdjln3NCFvK7py4CYZ3c4MUJkFxjHAQMx8Omw9rlkyORCf1Ect
mgdTr9ulbTgclaJmLkvRhXcwttBBYUnf0l16ZMuyhOvzkLTa5gDDEqSmHmFCViwvfjS/p7GvVuE5
dvfO/qhLYxX4krpGDagmjP6wwoGOwekDWqPP1mQdsCSqMBERpo08uy/abc1xFca4AP2y50BCZY5N
A7kwjzW0O7KBhWnXq0v7hW7MPk1mNJQn+unhLu4GLQrO760pZBtSOzBYluyGWY4ilnywMQNyWCN3
439WeXXp4n8rcpffzu3uz6dZQQ4UpB0xG6CRQeceI1GiiRBdvdZfrhpZvXVGgbuM9hzN+FNY8zRb
JAf54tysmV5XPFOLdHdke6p7c7l38aYDP3NPo0qphmmZ4A7C6ltsQ+0eN/A00g0efDIFtV37IHQ+
6X72rpo/4yXIeNbrNJUq8tT/zo4LCWGkBI3jLYRXYN5hZWFq4pBy1OZbqN+LClISF5p+oEFSGJM9
UOOgwB62VfyfPPW7huTr2mCTkqjwH0cBrAOGXyZev+5YRC+yWKQ31uuoXogQKb1Zr6E3E2ZPKWiz
8l1L68f8lW2Ali0JMDVOpeOCpDfc0VVpEyLT4fKanOFVWEiQA+wUWJZ0vxpkFrwFFLQsh0N+hDKO
MWZRI2CHJlmiFhNHq67pYGhTdgkunkNRZ0lnRpRsccX4pcY4qfQOlmODC3ekQBKgmqTzTLvdX8dV
/cQWdCvDLtBdLaqbRD5Ix4YvfW1LbG+GgsrVkYAjYckGjC9oUP71ojCR9K2ulMN3Xgl1mv0Xg7/Y
J4pcJiX2g1CvAApnc2RxIPrQlMRakO6QMgs7btzn1j9JlNFJLr5VoegzZR6t1uvNwtrFyxE4a+x0
89CzQ2vNQDJS1KS3yf6LQf+/QlhDeLHFxAlVgX+pKGAfBbM5p9dxooK0GY7qRizMFdKJKh7zFU18
Y5yN/Sz+F+3daJg/dgkCbpeKcaK5YNZYBvdcXidvwAzMzzrVJTzn3SD8BvJTzXovn8nttB7eMiYD
j6XG9wkw8GxeuBX+AuP7Vmt3AL8sWh7z1gdjwO89lBu0WUBerDLesZ/orxCY9Xm7zUW8AxjJ/ayF
CRbklbf7cKi8gR9Cj4mZxOhtq1q8IqqQGZj+LpJCa0WHQWpnAEkoNGKSB49p2ty/Uz/htpSi3eVh
ztMv/USyxT/if52BzDO68AcXcSL+qXMQm5ri+8kZQhTGURHFJ9c3atmEOhORzPizmyG+KjXE0xyR
1UfPGCDLjIpKZjytfz84cKVsfGxl24GPCkrhqrRlUUL7RVthsJb2V8pF0inNg3jZ3CdFSLLd3PZp
+i1SUCL3S7T5z9FC/WHoeCYe4FOE6S8ab+CGXgAUii/TExJDc7V20S8YpZ9/Xn6AN/+lFd99lzjh
+3b+VP2BKNStO+lfroShFlfSFkDC8p/P0TXrST34Ci9tjbT7zv46g4aBaRnMUUJkVlXT93PnMs8Q
aTNFVoIfDk3FJUE3qwVYGRH0uavv5HIcUuePHDRZXM5NNYJJLaMnGvgKrONc8JI5aPDhs/HpQUE2
r7f9kpbR8tNZQiQVRofz2uPBqas5F6bO195fPcPSJ7ThTyd5vQA+8BVvUqk2/fxwxfKob2mgv5rs
4KBiTAI5EJ+ezAyx2zK5ekgNFPxnl439F5WrebGuWDdBaYpbeak5n/XA+cvBX2qsDVIwmrTntJAH
HFr8sxxF9u1FiUD9EbiYwgdNc8WyX+HPgAGRf3wkRfnBRCwsPURUpi/IB5im4OBK9VEspBAGf22/
NnBF946wTjlqSNiKd6Xp3xDb3x2heFetlQlNqKTzEpv33z3voV6xg8/E+h4IoYdUMBvxQjMHnp/R
7Al60Yc/XWRm17hgV4Nxcn9ltv/rdV949G84HjA+1pQAPGNPI5uKdATxPdsTBl/nv9wnioh8pxvp
7K3eni/Hm4DmbC5/t+HXcdaQfiokTvqbh/J7ts0OK+1NHCdTmF9Piayu/+edOQTY7FhffEULHoRc
Yp0du4BEiyfTpho80HctUWyD0MNPMABvk1u9zPCDeYCq54KZATItWPGA+3DLw6i2J4egi2XZ/icK
4ZnlfzlyaN8U7Mcxdr6brVTGm3ERIAnClNtyTwQZ8k87ZHQNW7vPVcNYpa0uZKGx5c/iiZ0NGiZS
b4pnY4exwBk6FD3x6GURixSVV1xt+yC9MbyCln2FScYdgHPmNaSKj+wZGJZ5hCecR37J57ax5Icq
PzdO+oiexMLs9+AQRELpq62x56Y4sSXYIRombTJWrPHR055CzX7Cm2N2KHLrw/bI/0Mk60T3+1C3
Etm07KMwN+EyPhqgypJ0IB8C8BhW7k2qmv5ONoMeyI7kpMh1TS839mZAL7a7GTNeWQJW0ETUbX8L
OH2wb3kIFk+pkbWtLUWZ/AmYZpc+jCPGpldy6kbqvcIt82MyU1sl1KUUCB07bAK1mnbsfvfD4ERX
BsUlwh7p/wErHTV2xDA0Uskv7r7yyuhg/TenoY+efI41R9e/HKaagEMNzovftnWi0ZGkiAgyrRlq
q3EnpdkMCSWJTCJMec4P8SteE7tHD+JQMGcb3dhYhQZyYzToKatqFo7bDvTnkzlahYYghcbpW4Mp
2HgPWIjM9V6R8zUInunDLpLMND2HuWbxRf71FZsOaPQHoEKbllJdStFcvJIABqxxqLRJpP3SeUtk
5ICgZ2SOBiRRgJHp1nhHpkSqA6Kn4Kz+ynA9UTAX4F36DsBK8/EIubowdl15ZWrVCib5V2gqkMvT
7skcfCiLU5WNNMrlpzDmT9ryh9jk0PoJyvmVloz8ZmtctlqQvzFt1a2GvnV3ZM/oG3mwB8bgb1Vi
Ys1ERTweg3h5Jh8BSIQMUG/qmqo0u6fdO3mv8MnOVz79rZYp8eUD0IZzlufhpY7QdeeNTa3gtx82
hCjXVrPdnoui2GScmcjYEFQBeeIYnkHFegD97MJ9SXX9/1najpt8A9Os9Woec0c1sD8kxEUCVmt5
2FX0Z0JH0Kr+2SlwmQ8y7u6tXvmZN6RrloYODYp8KpxECupHBjmK+pXYjgsBjgw1LWrDSutORC/+
rrwLhJ6nRo39huHk1E1axtzkXouEOOSZg/KxBHKTxI8ZOS0GCrOri9jPWXOkKTFJhzdxIEcK95lG
vf1YVCTi2PJ/wuj+pc5ehOP1mWXE0T2Xe0GnGTnalWLrMZFEXmoeqmoAUEtIp+8vQqvGmt0=
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
