// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_0 -prefix
//               MainDesign_SDP_BRAM0_0_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_0
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
  MainDesign_SDP_BRAM0_0_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28448)
`pragma protect data_block
cFtZ0wszuWCuUn11Gi8Eb5okDMNRoB13L9ZHgJzl6dqxjtm2r8QnX/qSX4ABYKROZxkYiuImshiB
bWRNkO1glo/ixgm7mWcR/hmMZx+Wb1myBsychp0WIUvMOb87+KFXmVQx1mhPG/awQpjvLa+lSSy7
l3DcA2k1pbaCscK44VbLRahOsXoBJEVwIuh1qNUc1O6JaQFcC+QlPyBGkgPkldHdvjMqIXOZHmF1
WUnvbXmI15tjS1fN61TdlFCHIoiyayM39KVdovsP7QEzRzx3735fkEFWP30KN8+HHjHiBvJ1KJRX
tdFxRj9kgsiWey9lCJZS9/yrWgPOlR7bvMNcsanH3652d4KH70Wmu3aYY1lv0ys0Zkt2uW3BFIA9
HAwQoY8O2nHLB13T+4b1OzabECt1mBQ6r8AjX0frwEMUhedkmD0xPsvrOmrF6Vz0I3mocGoDSLzW
k5Zd/YFLmzWV5POf2kU5WSh2hjqJsgqjf/5UuDVWLZNfdy4DyC02E8aLmxQ+YXqe4riizzADbxOm
xO/dvRO91Nak1E2SAUqnp19vuyloeSTUuqGLRtAL1dAkGn1lL4ERGZ2/FOKoSnS3NShHWiK6DYee
CcYRDLCWEj3F++lx3A7+Sz/2hjjBRfOHDK0Q9QMei+pSVcJQYb6vOcGy8qGiX4unb6wEby4zxf1j
QTzLPYST6TXAwwkrq0Ei2Jz8LefYajA2kFhPzxDfM/d/qla+dC5sCLLNeP3YzoCeiyWKhgBY+Fv/
MAqljPJ/TLX/7+XuLzq3b6nSUVMW80hiaJHjWESbpbOtR+qjMK+psMVWXsU+aMPpFmVdXRrTtIL4
sFTes1MA+WUp33CKYDy31eygVNbdWjfXAXCm1hRke4KtB4JPwmRHfyDwcJ4DXkaVWpshCLs8vxpb
vTZNmGSkAJEmPZxcMC1wOEcIjcabavfZNp20p4TVEF5XastBzzwzUk5t9t8xaOUIG8T6Un4v0mEs
ppd+KgOz50TeSI5BJTcFHh2JXnsEe0OiaDRCg8HdXKUIXeDL8tWOF2YYctOSrPgKh89DUEYXeIFM
vPqBKN1dLEWF9JuV72Edjwq/qILzZzK1zwPfYj2h1aQSRJIbVFSoywlu7CN8Xur9F0tIxRNxW+CQ
xU2ObrtMPM7PFof7+HXLMNf9i78IU3Vzh0UTHP1KIVVL+JhxagP9B5hn9cl3pqFB5J6iTSvtFdAo
gmnMQO/0qbtP6Np/n0BjDTZ+eMg8zys4KosFJwYtbnBrxg1fykjj3lhpIemrxTz3MBIPhyqfjnvS
m/XB4Pi3/2ah2M3vYcDM+l4/gkDpg4oM7yeEsrIyjSZkaA3odC/WT/UgPB+PC4Zo+tsv43pnk1nO
17r2jxw09z6yGDmgskveo4fRnWx3mfcMic8hIVqS8y7XnsZuVSd11dAQfnwGELb4ZPX2LoxLnq8h
IOPFoJwzd+ZTHVy1wp7YSHmv/b+TORcbTT8SWeSXHT+iGKw7ooM6lICxqKHGmH2YblquBDe445bz
m+UOD+XvXhXZFC/4S3BogTBjxYVZ9O5ZHIBGQtBwotMCjOl3BETcoNpKxcmJCCMfsFTLqRWI1MkF
6WtIDA6Y6+/+CEWNIT1o7WrATUZGODtdcD56ySe7PF6lowsNMG45u73ICjbNpprmlsuz4/QggJJg
dmETiDFGlnhDazl+fxBFTH8rMmMwxd9nS/elHFIkVGFW8bZLuIekdlkAEvtwOSk3RIqFmxiT86O/
X1UZbq+fqHm34sR8dRIMXH290Ul3V1k5/aw6z+egKZQqw6tEOhUFQ0UyYwVspgsu0i/BK7xuNow3
/CPqmogVNpc5UQFrz9jpHJUJuqjy2kI4ekrDnLGQhS2fYwN9w5YmDDhYjXgh/Zxn4ZlbUcYkGHyN
PLX/1igoKb640jVpvcywFND2IEllSl3VuRaKhrrZJJzJQnkozygPnl1O5uzK8/u1B39vXZq+Bl4h
4YAQDyPCR5CRPswX7vOBtxfSkgfsk1NK7747cRGSL2+konBqZnrDF1tyG/pmr+rfBPLe0wBWZSXK
7l/qgQagIVW1L/5gwEKmUYNdAq0MUV3FZwCI9hDm6gEaoJz0poPuGtRS1/tQtS+W15IlOR+7Xnhr
0g5QAMLEovLuzFg17MVG4mqxEHqQEhkfJZrI23WpG58YiyqwuO28DPA6gEEhmoQhcbesbcy/k3Si
9njEwUniYuRn35LCXATucJonyefK01TkpWVCIbLQqT9AqpRBxDdNrmj6/+7YvYUbbKvsikGX1oJD
V4Bmj2bP+mi16GJQRiqqCj/DbGcQBRUjXqWazDV4wA7jTzwmCw9eIxkUVxS77ENY6WHWlL3bgr+Y
Cj3D82ylWBG5EHzPjcbzL0e6YyUh1XWeCrWR/Nt7of2AGfJLkA+qOM+EWbHXgPC6OOF8Ig8PwIxs
5kY6B0iZk1xPmLEPwVXOhiWFQtU9p9/mSztXloV0IfWkMCrIGA5xcpDAbEgPbugOBImSvq1r+84j
Perhb8lg/w3qZo+bAkATxixl/H4md06qE2KOa+0GVjBTpFLTm87eoyTP0L1aexWut6bdQxu92SOo
+ZVwjCPKi9KE8rr+7HUOYhUTYZk2alSNInq3dEd5vaI6My64X0+KNr2tnHB10d1SRgaj++l9UAJj
miIMzO0Qra1xnvUbGEI/kqN3AyVIJsAG9CqN4HiwCkrVLk/OZmWwK+jd/MnufZv1f4ludU7Ha757
UlxCJtTlMWzjci3u1u483DqNgeDejz37UROFjLwRpHKqG2/zUJAb6Xw7jshGB3QqXCs/1rZA7GSN
VAvJeGNiDmQ8DW+wY5dBfslMlk4bPrUSQLS3MEdtwJIj/ClMX679NSkJlcbZgsuLy4OdPnJMDdAq
koHuK5/jVIwSH4/FUQNFQOH/zqpiJesCoa5b4Vmp/n7LzCvxE3/z0DRAmjuZPP7YGvWcfuVb3zyD
XyYZ8pUZpE8tGRjAbDugJc9h2WuaZMR5RVUXErkvehbflEsQVu/8YmOR1y9phtLCZO4+gvdZpQHx
F+1vzmT3mMkCGCJ+rYVfArL3MgNroIkfIvd3pyzs1j6tJkPeJDNslZd0rKx/4tLvzuu7RXdOMttm
TDEe+WoAAsqAKZmYeS2F/ZxwCAAfPUj/coafYb7zSQiEtVeTvkF9HvbWjJPLO4CsAQAyyEaiK4Kg
qno0mkg6o9lWrIKzJqF4dhmDy/gDqjtPui8i5jCJJ5z5M/QKj6hopW0tTtZvuhe6ZYkfPnSJeVou
J9uQvNVCWuYDrcQ9okvB1m8UjIki/2EidgkS5urMLNyBkybXoEpn54fZlLrqtwLBeZX1LnaAz3Er
B+fuLMR/CaVd4fXfDSWdfVIVLM4VQQTj1UveLkBCXEdvKgENlXgvJv1GrSSXsAQIEs9GtkFscPXj
81OEQr4jOl1W9nq4PEBx8rwqTCb6wc2knps7rqPKMbi56/E3a6qYAg9zkMg7Tr0azKdN8LmZVwQ5
J5aNXU5i0zvazmKkRigeBFEkbIbrK5+6Nl6cGVDAGHmTEVK1gyzmPiuft0lYj6D5OIkkPB31HSl/
ha5rILfxopoOYZKywWTrnAElUV24ihitIHL0FiOqBE1s4OOgKaDVw+RbKcEb06O/OfPgfZAqOd9e
KTz5fNcwvuJmj7Uzr59gdSGxBWNU/4RGyE2f2cJ6kQXjVeIYsh7eYxlPSju3lMrluQ8PYjMvIwnq
rsNoibhXanzs3oTVC6pPr6iTSxLfL3W7I0998Mu1vxbOd/yuWu2fUXveI/fv1Vao6FiQJWb8ECMi
3UxOcnizXYTiNMhs/+jSEfDCXuCuoIePYF7yeXG+2AyCuX2rXpO7F01lJJ18rfHFg9Z+prBV5KWf
/SqSeTlF3QMRdOl38VnQTvs3TLGQV54D1nlzbiFLFzxyRxZ9J2AzhjoLbUunYGsxWcNNQ5XiAcVC
hMdKSj8e9eoq/ob/C8dgn7zAjpTCRB9wUSsBBJNvjf+XlpD8/iMW1XlFxpFmitICnHrufc1K0YAo
HErCL6ZFgPhqRCGMAOLYW3XE1W8IhR3O7rhzNMcnhXKY7YhSAA1JeSnA0uRYInVDylVaCRyF24qs
tMqo3oOSt7IUNtJHjGnIcKg5eLq1zMgG6fB9Ug7ItVI3n6CAaZeezSt1tFpQC7Ou6aHtLEkLD6kR
NYFmLvwRMG3DQpDha79DFiEVOi7et8kzdyUNyq6NBEF2cTbNVfMwNb9q03bKp/rHMqsQcpgqIJVE
QHaSPhOsRmfi9UR4rsQOZ0INWRtF+pqWh59Pg2A9fid3jyxC077nOy2TqwT2zdSAC8oG6FmtaLt2
HztIIQ7dq5x/pxQfgV734CEgLAh3Aj65l5mbUYWeQ77ZYxH2vZoDKTflKcB1nHGWDqFKb7kIZLS4
CIhgPbD7SVtOtTg0kXCFRa/+iEbxN0CQhShTYZujb6pOlHE4y7J67KOB5/mDwOeEFVl5tRm4gr7Z
AeE1rRxwSFrtOdGHlgWW5axnD5ZhrY0g+79nBCUgeC/+0nD3ORNnrtqqUniSjiLRpkaqogbiEagg
mG3TRME6zMD8s+4wiU/5obeka2tncftNZ/o5hDOaW9qd+RUyjPCIISzfIWRslfIxx8878QUOnr9M
BzV7g9IanOrinALDqN2pwkbeEMS2firBgrUtaZirBNdsvm+C3e7pDDUpk7oeoxTup1jsliy9eNdy
5SM0M5sD7trNkktAV1cE1bWY/sZOqCGK6KJq9G15fCGC4aFnzNWxjIhpUFppi65R59w5DNsQTXU6
BJt7kmqul9fs6F199XrNmfmwJ/d9a49yfYIy7panFQcjmKm1euO4O3WCrlz2TcQguJjeVhBb16sq
LNdJALv6ZbuNv39BSEqN8AehGMJdWg/hxKX6aXEs85Mye78Gh9SoZn8uRTAF7HP+bxE94xjXfVZk
P6ppOoWPhKPldOZ+kAX0hDQVZykb35qJtRMKAwO3nG2RNTKPHdl4n+VHsOkxLWDFhcJlgx820kKZ
HjdM5gx4RUI4B97i9YwpsYEYcJLAZSfPqmYuytk2NUZDdgJ+3TS9m5cjZ6HPyDbc+WZU+T9wLqV2
Ac3n5NkPf2z1MV+lSBdTGP25k4SQQzSHzxTKVj5+6tgZUNt/gv510g4WbKFQyfp4Vwl/rh2xZcsC
2XreqpWGWeuzeDNRP1UN+1NcStWSmiM4ItYA//Kngkt1q9Y4DAja0butyUOiApj8LP60ErSKhgW9
bzdAu6QodAgoDo6AmtmKV+isDal8gapGI7wetk1K38cZ4ZPeYwe+m09VjMba4UmBkro4k8Z5J4t2
Sz71bXRwzlR4KuZvpOg9hghpPyGeZBWygiTegD6rnYJAcUJAGbfDzPaXQ/+e0M2O0Y42jHe4pFpw
zgicngmALaYiUmEpvF7eUWU8NIRZ0/h4CQH23ySvz/vHlE72cOaPVxFTjhjxkPp1mQY/K5vc7XvA
5/VP5NDQ0Z9hDy9T2DcbWDyVSpkLBft+w+ToxXyWPwMnuq3FeVpfWZ0Zn5C7UGwXZtueDNjrs+G5
tAoMyPuGqVM8Sy4HLw29h603GMYIVF4axXT8aQZE2k1pjDUvUkHqoOoDJgPgTuupvBvlqIujw7gw
rZssdk/LkXE+4xYivWrPaBulISpYe0kNXWnrkAYkVuutaU3fWD2aUEcSlKzCl7LCetC5xyhRJ/Tn
Ka0OwhC0T0DSNhzDMtiTeg153f7iZSoByYb0HBBfQQXAS8uHT07ysRc+qUbzjtA4gI7w1CM54htZ
tIZHI3Zy6jCyPv3On+bl7Qu6DUnZTaPdjsZlb6z30wsqbnPIW1LWqDJ5snZWBYkaJyWy407I0FEk
fUvWNmz+iDz9AwWlnSPfCVTDhwN4rrd4h7RgCa6/oqxbzix2rNEmA+3fR57n2nhpaV4VreZRa8qP
jci+TvuYqqqEakq9cmkIJ5ZhAIUWQgK7oqdNVfFk+3yx+PPhsjLPXYPKbbeWdEvGhw4tNpMWQe+H
O3ysEghiVyvYuMJRK6sB4vIxFN66ERj/JUDtYmmE6AEivGO+bNKOC/pPQaTQIMjQQajIm69QKNqm
YzbeUV9SDOnini6ti3Fv3wcWsP1HQDnvcUjnkhYqQYl7uon3aCEwRhsN6TssKhfPS+095/LQYGX0
80/pkdLbuRZZYBpKG5Jy2ff10joCJlWQjdty4wWPaM+3Fcp9gaxsnyopbwL1215lqg4SjOqgN82r
yWap6p3oNAo0IWSBxlSOiEL8h32dzu9thq6NymJvHFsozsfLLfE91gnkS68d6UYyBERc/pccltXN
+tdXG4wJN/87LQmf41heSJZKycIUYIZhMAsVuP0wX8v7gK3h1tMNrqC8mu5UBIH0xJkn4OUSDJS6
Y5mSeTNtrzzpALVCLnlVVoeElv/qtUyJBHOdu/xafgUz4bslkRVWwc4ZLugAXluFtve8E1vk1Alj
BlwIEGNCGqFnOKiObW8/W1x84WwMEj7wF39BrAzcOsPUdK95xiXyhehkAm+dCqkW+onRJI9zkYzb
ZzGfj5FeVqqXSkdzXWRIlvd/YgcRlRIConBHgOzExOhy1GBNyY8XLSb8Cr8ZeCH5wbJsnhlh9wJz
jGZkMPJekKq9BijWaA60Nqx/h9Y3tJdlVnCrz0/QWW/LZhJxq2WejFnky8wgur6pa7mu4b6F3rWT
q4hLuWkfb1l6iVKu1jtuMQ5Lq+G5w2SLKY0Im8kSJnU8i96I1GTsdhWaL6rhDlnWiqJHbuk2y21q
pmO3J1qeHWd4fDh6YI/O4vEEIuYuo3GtmeJilQo8V1OfGA7VWKVnSlTrVIuwdBN9f4pEBRw3v/ee
e1AQycWQQhwoeXjEnjGL7Jd5B6g2DNiDT+1EjEad4O4OHxhwOBWCXfa8nwsMBHhPSBnQM/j7cgQT
QSu/eP6jY2wlQim6yGDGtWpnzHih8EeyLO8CbIq/PE/divMzoT9qB6eGPARZ9sv5iHUY59s/KR7Y
I7EG6gnNQAOMw8NMzr4ZUNkutwIru203egcnXy1t3N1bmukfaCoA8rdlRhzBwlgGXljQ6MqFQMop
sEGozDcZXt4DnUBQfL1zGJehEsjhCKnp+yRJ7Zz5nmbSAfl9wOuOCDa2DuLcUEGIOKADgPmQ9ipe
BEZp3UU6QFj50/0Q1+nAC1gnA3MEoTzaAlopxkgR6sgF6ApmNDSsMpWRAGRSrsIenJTkvP1fjDhm
j/J18I/SBuPSpxgFyvHBitK084VIOEB3dIBXH/4CRJrpOZpx7gCxsYQq1gmJI/gH3hlxTxQBa6kn
fXt6EQ3krp/Lkm5RHLWPuEdi6+AIHbYgpEG+OCSUp06F9pOaJeGVO7jhnRX5SnOSkchnM/OHOLib
POEGveFfcEuSDnfipDbX7R5cQ/h3bIDBS2CtE+j4VK12ZlQiJFWxi1D22ZlfYh7BsPjvJnDqH8Gg
k1JbnhPt9gd2UIu06SRmTCfNtsJGG8SWO1dzb0e4H+e/NGccaIQPPj/BIdiauIkaJP4cwDVPz6zB
BSJ33jTD8Kmstsl8I0WofY90I8RrCzsBRkD8eM/0Y7ufXmmnGTLfhO3CBlNUafZxu/0Rw1j3t1X8
ZsA13Bih3SScUi8M1pWDtEe40nr15ZCSYQle5IGq38Loff/XggSAKMKc4o6iRTkJ2eHA5n9NVsdt
zHqr9PFvCMiZDN34Ue1s3/FYRe27nuNjpNrHy6FxsO1ZDvAq48BIK4ruwkLfGU6XtasQVRbPc/0h
dGrnT+iir/epywDJmufBC5F2+VfJNAHIzILzYvORcAPHVjgd3fwP2W24M739sIhlHNEGbi3Op6as
fUWYZ1Mwi2ZLKc8g1qxUZiLXOPdmKYjN+vivlpWlQ1V2RJm6umunuN5EDQkiwnKEAJVCPkzKTLIJ
H4NNOmVGZ/Fd+FRATyzw/LUvlvEl8sAVXCYPPCTIW6C6VQB23OHGHHhA5hxlDkGvJYbDhYPmKFQV
dfy1wl7bblqOVEfUcFK/240VszWnzZUn+Rl1+0aJlVlnvCZm7+y3E/NEGRCgSPa0JdLCHxQhlTJV
m6KrsFYTa/QJCrQjiFc5IfMvWmSEr4MbeZahCM+N3Z82KqWVSOem+1gao6SEQRMV7SVs0oJfARKE
/vc+V1WAjw+/FP6CcYjuiNh7f8ZYhH/cefEAYn9D5fucFLCAOhNUNMvHrXjTMQXh4EkbqZSFyhBY
6EisyDo7UCsWjBgmVtDlP5U8AcK1uBYqUu+c9Rxt+HE1Bz3imyHpTSAbhAaVJxDBxgd3Y7Cz5vQc
sLwxUkqc2lRoK0Om2KT26WqU4xA+aDkpygNMjEtUVIUKzq2U6Vk9Xk/N3ITp9xKVSk1FkXIn48kZ
UBORevQnbmTSRpAZNIUJoNhOIthPaibEeE8YoikjK8leyAytIaMzm1TY947ctu0cRuuNT85OOTye
4CF6NTqrbtVBVUc/2OjddbEF9EcYczHjJ/s7AMDzkr0DGlLYeWYcxDySc+eBf7R1OLz3KVTgjYD1
Y7503/k64Ew8SrDO16EU7Tmi4ZhOyMnCjA+rWxsEYkibaL+C0YMoLAX3U5CvqBn9HEBRz3cSBij9
8KA4nC+9SOVFJp+moUPUDP6WwctlsRz61EzHuNtDH94uZhEMvJkXC/iGbZqdmASlBk0KGgLjllAV
PYSbmX6jWHK6Xn205gWkFPSFu3TcLx1+Be4yikGoKRnI5GH8ggYZFUSBFBfThEcgFKmAXJpquRWc
JCGXXbf6EGiLD1XfFdgq2jRVnIdyLdxFQLNPVG5d9VmlW+M+IoSU5mePCgzhk2Gn+OeSvaapEcTN
iPI5N4sQETB6OtVNlD3icJiA7zcD8/L6IB+qSaDg/KoReYA65CQRL65QD1xCGWvvKcipCzslw1iU
eRw7E171i5BtNNikfQO2qJ77JCV01gNZXo97rtfPAvi8j9ewBX9eR83GEXAiCqOzS5ezMVR3ITcP
XoHBcjZCHPbQbgTY3yzMTePxjlQqOa6sGwU7f+PDBseN5gecj724CZS/2LYV2rG1QFoTnCl4PwbP
cE+BqSMkdXaBXH0ERhSvWa0m1PO9O6qDt7V6O66YxDj7Ly/rtXmGqgxJ0KssYf8nRwHgjxSWJuXe
c1SRSRWU35XjR3rXkN9Ywf3XmBAQty1FEKBiHDFTOWHrrfJXv9zpep63T/plCisLQ8f1AimqRLFX
ljP4yDXlsOFBoT3FBiEvs3qyYqVAeMrgeFkzxv8qCqjqFFbavLIsjYsO0jhsx6UiQvEoe16L8x2k
bzYXtZIpu/Q1SByq4OeQSWPyxAB0zG3HodPZVmqwgNs4GoemwsVvWMZiXoggx5jLe+/lIrYgEAtU
/x0zGcfa9Hv1NO2cvVg8U//4u2ArBMlAygCmDy+xXSauEmp/4iXIgatSeHEnxd9l1hwFxBGAgCEn
fI+5exRaG2iIGJHj0A0dsBIDjGBUdK5AsBxWBITAUrVEjrdpQF57zftUGT8ogEXbK8pTnYLtl8xD
lWSKzITDMDvsyZayAoGHkllhEOLSe89A/AecEH/2n4r3Nd0DmlR56ggQfqKDswvPo2N05AWJcQy5
RYwKZVZ+1fTbpujvzGD6W6jHR2RbgyzbHms4XGmkyDgEli2S/zzk0Bk1eYfhYfBIM37qajQHYXEY
Nth/502CLia7BgsMbhwlqX4fqKdFRboWGgDKGJXkAUiShhuHJOY6M7nsi5dZ9RtSaPp2ml3IFEFy
9TPzDkT45SIFBiI3u9DBrkCawGfzKl2g4a18qhqzXBJ3xxJOgCfn6qy/epfHDitBgNmNErSCSCEj
EqYZmVoMhIjTIYI+jBR4RhW63CqCPCOmK4S4fx3BlBX+prySXB10sL0+eqLxGt970WHYv0SHZKmt
qc4G5CYARIIUEthph4X7y/xjorXZIKvdaUYEiM4mIAQDNTrZ5XZkz7v5T+rCpIlIcmuwvGT4RfD/
0xjtC0wn5kk+1+jvxRq6v45wye22TqFbR9y3Tt0mwFZRgEfrQZlrOneSbdxNRQA5g5ytV07QBfO2
XmpvdwwJ2GMdYilrQQR/a7g9esO9C0tr7OKu17x75u06P4ALfPrh+953Y/3wkHvxQyT3m6tL3oUn
i9zqRRb/vIUIvXGGPnaSEXBd2kCJRBYB0e3224TlrmfCfijDefytgMoaMnW4dXByE9WHPjrx0tU/
btvl3n8Bjo1LYFRmO5jCxLU7lgXktm9wqejpsUrfuuWipZu7ctYyY5bWdlOxZRIuh1Cl9811w+R7
YQ10Bb6ZfPmNuNQyM01mWFynvaSZ3N10SgQNKYrWMWhF+ZYRH/58lU1Vt+fJyNMcJwc+evucfvpy
6xnmwU5Tru0aYNcvlk775IWM1rvnaEt64V3LXK2oWnGHCiK9TVGO5/QCKHzISwzhj7aebO6y53i8
9F24rtjt0jdcC3UZAi+XFSqktS8m+wnRiFIQo6BkY2EqtczBNZkOlcJKbUO2AmMFJgjrIpIWk9nK
Ribz1Dtu+RLJl9co7IcUUCdQ1k4AxbfRB2QcI4qvWLM0rtMpB9r7/4dda2a3W0YDKyRS31mIjBv7
SZM+Hnx4eYIznZZBMv6o14RAXtGaeKuSZUH9KymmTDelejBCJdCmZ4l2IXD8d7PtYCPeGwthAWkv
kfPtcnnGxAY5rI4KTEDY7R1vVyzXSHPF+Ob1hF4yLzsdOPHjWZD/0B8p20KN867TM+N24ljVyWdg
MX4FQVUwLV+RxFP296ENmIn9ds4JnFyAklBaIn0ciy6VFKW5aX+XMAS7RdJF4VzGsGyggEqU+sjH
sYn5SMgQwqGxUUFXXcOr/B4o2lI9CgNXNLMiL8gVh8Qg30MdLwuh7JfklWKPhvcjyDppgVv2/tgx
D2lTIBGzfQ+F5/Eb+466ewWz3RV2nkcJaqfpfRIrnzDTDGT2A8FvnhdOTKAfZ8gh0o35n+J5ynON
DiwxgwDun4CKTdEDegjCsWdGYV/9Q1c2rNZtbmCaB/04H5lh+gYu9xNRPrDwm9+LW0RFsoVO9Esf
jyU8sODI5SMotmObI5GIW8PCCkmdw9Tj0AtUvO2EBfX4pushdSqyPasKjHHcjK+S6eR2BGUnsmW3
SFYxhp4y4TmfFTP5D2O9O0fRAlQ3yvPHdx9yyR6kl0A6KE33xWJoJyPNdt48O+De0vJy9isN9ex1
ddqKzsGOdwXug6ZAIk/tXA8fNxu9Dx3uiEzF9lv0TRLhBlyPQXQeDzNu6kUY0WwxMoYGCOOkj4aB
7G9vDkzqa1qGae4xBipUNK2BlvFIjPkB7BdeJa0T1gZusJCNh0OlUuYknPHkY9sUOExDZnQK9acd
zTn3si9llidu1pbnJOUizIF8aL/kXxw8TC9vWnb4w/Mf8aOQrppbCUUBb7As/C9mwfA4ubw9Y93v
0CDA+uotoVtq/4d3P8sabwMp4cuCcU+G5kNkrACJ0JCaJouHf5EQ9G1GfK5JUNkQ7xeS8fns2DXS
tJHLG++gEQ24WLQYq0mVJw1Kkjvd/TuBHuRi4ACRZtSXRXd//lTsNtHz8xq4Z5rQch+rt2yWBZ3y
NeDSt/oHnfrycqz3amEqYZNw2sMnTInmVHyk68YySd8gCuwoABgigsbYLQeF37M/c8QA7qDwIhJK
IaAnaEgawamEpREBFfFYMVTzV5kL9K7EGzeZNg/7+YphG9M8tbvIGvt05IDGxX6sPM5T1EIAcHfh
VJ0QngAtS++phe5lEztcAgN+mnblzdDkKiAQ1eebU8sl4o47dBGp9wMYJ9ncRFhR+Y99ehQPDOGT
VJX9OorEYeERGqHd+Agu+/genElfA3InrkBAWYf2adPi2mZn/dP0B3F9PTiF40c5FLyYJLNzt68c
tz8KOCSSqyIU18T4LFf6BTfsffhFz7Sx1S6IDLu4HCyvSOn/6sNIlPxS5dbc6oSIlslAzvctmUWK
aQN3mtrL6xVtcMyh8FssPCS2rxIxhIeWgBH/FgORw/BLoThmWr+mJzdfPUOpHkN2Ap6jQsY7HAY1
XdlDoV4Di9MLWcc0QUyNkxYUYb3jZAxA9qoT5DaXi8/PuA1yGAOZWqTFQkKlgCQZGXOYXckX1W/j
ZeQePk1eCaQnUflERnF3jY3W41JJel/K6fzhPGKUBhZ8K7OJnsekIDb/3pBBPJONN6j0WtmzisQY
BbfKjRQSFMFU9yOlWav5xTLVRQ0fMOaJWeMJ8ifYcOMCsDWrgVMj2Vn7maj+p9WiEnN2kXt5zeYQ
s79flVYF1ED90a21s47M+T8sb5H4NFWjVjtD69RRf31gzIdPSH8qfCywMYliBzRgunNB7NSeDM+Q
LRruEWP1LCE7nECRgYJFySsK8xsqjVA+y9padeQ+oHcA0cLJTJK8i8qRiKHRc+3dDi0GTAtH+esU
bELpPOWHxe5eN8vAlPFk4jgtSA0e/QzvjuTsGLPL1leuhi8rqgIHVmdA+6d3Bh1rIkpCbtmQElwm
jkRipTa+GcHSZTTn7pzTzY8bX2sXDZYM1N/43uVjJUKu6d3MI1KyidEigvxg0Tb7yBLfpVj7hcbh
5EgR6bDZC1/kDV8fcHfbstUH2qcPf6loYm3XALXbfCuYpHyF6ewg/GDUFkssirbq5yPAJWFzZas6
hrUFhzUH/bU5tIBQ7U33mbF9h/6KGVnci8q28nxSrKY/qR5h3NbwY9ECY+5fd6Efh8sKUsnIhI0b
NAWCF+hubMoNVJiRBgjf08Mv8UlhuO4RucwLSyHseB8hNUd1JmQEXlXtIfvRTlGNomRBn3KP46Aw
b9w34d8kmDs8FQoeogm2qt48Sc3uACtN1wHsNbcXsZPJDOachSLQ3JQpfGU5oVk/oJoNa4/HUpTx
rRKg83qAEUzKIUk90wHuxNxSQ8FFp/3U0gNU6MRz8tBwfbE6qPorG7yRIdm6ZFNzRHI52Ezzt1I7
qsynwVwUd5SDw9xPxbcgjpkLDUxjliFCd9NDIC8HrI/mKnXlBsE7xjErFFsfE0fFZN5unkBt8d/r
/bgxLJTZVmXIKCs1RYkqEB16SYGjJY6qLx3rDTT5LwrGBo/EHmMbjLjOgGFUSb5ZkE2dvaVkM+IR
7DITQjX5AlCGCqmFKJhoEz23JAcImfHLvXr1PEaVo0JCbV4ICa3Ltv7TsnMk2CfBekv8LxdPuZqE
NP58QXoUl7whB8NSuUgskdZ8FgUJj48u7+2548ApZYUg3Ks4jcuQyyB3WTVwVVXk0izA67pvqLQ1
v7/250Q1XKEgi5ou469neIffDKy4JrlLF2Rv4HbCV3cYneJ6Bn2HUPzAxSEZBMTtxE7zX39BO/tH
+EMFkkLL1i2GUSZKh2VQoZCbUYb+IHeApp5MvdkQFI087r1Id2EcI7Cs5/oJmwgNAHA/ACuVGOUm
D1URy0d+DADpBGtu2bHgMMI3Mn6fql0AMYsdSWPtjj9+t+waY93+c39uoswlGYAkhlKOKRknNxxf
hZrepP/jOzaIVwepgmG4L/naSqe/I0BVueDIuIQzJY2lU+6YhbZxsUvV0j7g2U20bIeFxZITYdFQ
GweTeTScvXqc27wkZKvpmXYpPKmD2J8qKFrmWA06dohEcCFYAOH2S7L2ewP3IxJIsFj5WlgSdu9r
7mNwNE3dWUy3lgkFkxPvq9Kjn3b9ByZfoZn7cHVXyAonpqX1T72dxyW5pIDBWHKbln/qfXfIIy94
fq+Je0pluwSlUyaKMgLqhwFPA0v65XLkFd2TpmPVtE1TaA+Uxz3hHSNsLesGAhFngmIk66SOoSSE
jV8+6FKmTYf3IhpCPAYfqjdf8seBG6isO8/j2bQa88JSMD0+2QQDvqBxPGfy0vdJglbDNFfPGFDv
8Y4g/TOHlNa5NY2aGzzjNdG58xdZohBEMvRIhhachsEz6ziHVx877+8KEq82ilBLKoSmuiorH4Ai
QfkqJ7V5alaPlZOJBP/cbRmGYREQfpozA9O3WFNWk4vI/PzbLXwRiV4ju+zwcE8X7ITuVOeE/ksX
b1RHSFMZIEZF8JgySfK5rWFuTaWNcvfS5KsVsQonECdY99aT1kqLYmwiNjjtiKQDaTHdVV/yE7HK
Uv++BwGz7wPgho/VzKZgVrBcPUzoDQ+STg2rB3Czy3NPQyqkTM+nNJKew0gDyWKnUxXgW4BerHHl
r5EYbp4K77oo6Gc9GSbOOSWM85+41Iz3nZra7e/ZSAQB2skOJqLzdHBlDyC+4tfDgi4/hTo8aQrH
C75Vynvaquib4c33y+UbIA+93QTIThan/0b8m/CIjjwwLYBvXamcClmHAOIOd8sRDaGp3sen8zpg
XKNNGkxtFCWnx70zaqIhWaXLgIoEaHCw5JRr7He/X+8dGlxeatPtA+f9VtBspYFaYDZPWqRVzyWt
4By+1QmnueRYBBqWF/cMK3//plFGmUEeEEpdOPqC1LwtXvl5wxAqr02dQCzvCDRYTjqKPl+neX5n
uGCF98XrEkHijJrT+3w3M9dVhN9Rbba7GuQrTqcwfZtVIBRiD8HYwTMgYSu2b/+ON6VvslqqlQgD
EEwyFqZ+et/iSDHRSrsf5s/uTbxq/Ms02zx/a0Qm15KDhGlFmGAcjxVad1BGi3Mh6+aVREGXr1/f
1H28ObzqhxXOOsuWxp0aka59rGp7EgiyGfds/FJgow82YgFsfaLSc3LpTNboa+d/hFlJ6NQ2Pv3O
wvWJeCpuuPP9LGmLVJMG+28Fzl4zXI/SnbnetwgJvXtI5LXva6Li9u7FQpsY0vdDo6v4zAf/4ieP
tXhoyUEKBLxXniv7MhkJNCTDg4GBUzRqnj73jsknk4IMViEqac1LA8E4vVd8IJi5grZPsF3NZAxH
SIMUwP5j1MHftRu4Ouaw3SppsljHHbF+43OCUjC5pGy5hdHWBjZU5ELlKt/VHnhMiE1pRsoaxuon
vkJ6AbBn02gzv/eBTbf89/P+eGkiqjZ3g/IP8kDQGcEL23vKP8V2cmTBu3K0WM/WapgdSjFPPRqu
hTRmi2wu8q/XJBUwz4EXI0xAasaQFWKyxSZ+4mmjR8kcfVQ4TPqumhEoYUakrfjPIfj2Z0K6h8wX
6IDLqO7z/iy+0oCMkVMh03f8zUvWExO7gpXihFieBFSdMzLy0etywIZ5V/1pmzjlIggu+jtosDLG
fJ+P84Ei40zqq8lc2lcmh9LMbLUwPHeYDbzPETUl191Sq1NNz8XxzDIgadTsqSlCT+vw9pkiP+3L
GDucqTeiE9GjQ0LkAUeH8nSeAgOzxy52X6iYOuD4/RLwkyb6ps6KzfaF6yhEYuTflKpWgoMTAUgZ
r/vGLHEPWQGwJ26erFN5Dx26j+a6ikAtMWv5EFeKr2kNCpc1pDWNH7c6yyuQUd9r0kaxtUIyJ/Bv
haz2hEnnmQL2C2VaLZsJtvZS0fOxIkDrxJjU0l77glkiPpeKss4RnJIY4SWPQIqKbPtL4T/rYdtg
dC/PJdn5zOTZFYZRNwedIAsoHYIAG5SENAH//UEMIaPkCw9mxFbFKbbNHktEFlOemmdvMUbyi3Hl
iGzLHZ6f6gamABbAPLOIJ7XM9qZd+JwR/6H+2O5KTCoAiKofidSeWeTAJjLse5tvUA4APXd0hIEu
NMZoCP0iF5oR5cKrJ6uicyc06NmKE+tYkw/brtn4pp0GGnfgZmn0O91Gww1jV8ieRJCUk68Liem/
KWOmy8oiujLvwcd9lLPHK9uZZKo6g0Dv1wX8RIElLu/0pU3e6xEray2zcEXBfv11VSFyUmTrpG+d
oOQA+mK+2sAL0KXXKv7WmsFqFbghVr3IZ7gGxF/CacsHwZFdSOZPAQ54PKN0yBBdD+EpF2Tz6lUb
0Btwv3jts+Dv7q1juFUhj0+QTpcRRvAjsaYHqEC8IB6S5z/ZjDtHKmjwgZUYieazyH0qEtrBiV08
aIuySdPIEQqeXIlriZS2aPgPsZ3WYd1nwhpW1wgkGfMpGZdMcVmJH6HKRucBbL4VEZriLHFwLQ4D
rq5bpMzVp0WjJpI/cvq2P+7Bm6ojmnqm3fI+RfNdVDmGjCDGN5Qu6au3nY4Yk1JmkpGYBMj2W1iE
vOGQ+/HvbuiuqxHRitvKr7+0LTx/PxRHup8/rDqEiibjj5eK6502TsWPULoWaQazxh/ZinloqGxm
SLljLl042xRTTF9HRiGc6zIcHiKfBj10Xx4sUxog4i0Cw917Rk5HoIQ77sYXBntIAsZtQihhIedy
GYJd5KJi8TgHVNtfc3zI+YKMQJAwiDcqXzp/8+gNjOSu7jn3NXHAKYZs0GoSAvqo0JnPmzfjboi5
i34kOgc0CHqqdSNrFNLB+yPg16K6nmSodN9W8wgR59RHh1E8bDB1dZnJKaggy4TNW7QM8t4u/nrz
irf84cXipMM+fKb6DFqdX9Eqpz84wOTTZOx8jaWESWjDvwB0E0YiHQSyl5k+9XJMJnNuu6K9/1F1
5gFRMTTwcuVPEJo3tXX1dKD0WOkPo5KhinoOrzBYg+6xrHYIEVd/F0H6ebrAC9b6PKAls0KzvMmD
6kXTZt9NlgIcaU74QtnmK1+RCXjqGYIUqgV4kVMSjfDY92hQPS2j8EE2sPK6phVkzCYRiyKyIdtr
SSP7yxDSg3fyYhuDStgAxeKDI5AGmNBhinHQl1eyq5c3EMHHiL/HU3x8m/BxKV3KVnSWDPmhlAQr
vOWFcccal1m9dNcvgwvox9A5fNiUAsiYoydrQSQ/dnvO8BIhhV+kENHvPzJxnhtD/9GcrLZhEfwU
Cml2bieAA+Nc3IsfzsD6ZCN6WrV6YM0rEIeDjevdrgqA2dW+8HDk0aiOztdUbVEo88geuxHNvU4B
TAgzwkf3EMYSI/ojuPEEwHcOdUsoiB4oObKngnbHU+UYjuRJJMaM6GV2kbPy1afwh1ymwd3EbMDD
s08ZB/9AwoEokyeiwm7icjmYS+VV/j10xisP+0LdhuGrwE0AqE0Atd9R/xZ0WPJCo0WUIkWDnTAc
wwceUaF8Dox1vlbH38Kn2KmBXz9KC+/wNTfY2w8I81/TkY1yiD+MwA3kMFsM9lRZLeojTBbfZ/0Y
wgboVUJxqUIgdc7/TItoXb/KbjBQVEYTl2R9sIgWYpm6F3IDIFh3kLc/2a7Oh29DsNm1ZlKvI/iq
tM0wlygOZ5b7CjgmQMgRy3JXeTLjuaVjmn7oMUrm6j/gUaAulr2MemfGeMuU9urBBT9s/8IgG49c
ib0SqCcmmPCgCMeQQT07lTKjuRBDY7kfjMYVRET+Wso8/T1lQkccw6MHaqP623QTI/tjcoWp/oyg
d+6SWhoPEvNDjkqE6jGs4VZJUvcOhDk/fuNMPHqNJOEvq1u8VEfDwJiqI0XfVCqfa9SN5o2nH6Mk
dNI4575zOuKZpTAa0TEox3l5Mxz6+fTIX5mY2Po2HFS3+iRe/HvI43ZwAZYHspQDP4YE42G8qUOh
Qg4831FpOd7fNZ4S+Fn1mzuAzPFpNZ118juOm+qXChvrQ928kf/N7SLDv3vxlM8ZrladXhFFWJcU
4G86PanG20vxyuSvv2MZHwqWIMnnrpb3CycmuxDJXspFgiLcjjYHKK3Jv+x6MqR1or5YohrGk75a
SVGLYvrfFhftJvi/CW7KC6StCTec6O76kxQUgO17MdF8ZzRf9YDaJqR/rReveBQQbKuD5N/EIfpo
VG61G3vOZCNSaHTJOqDWWwL56gX8NPxgnIZA8zWyrSgHmLAwPOCwhpcnMjXAyEqxbe0pTBcqZerC
WoHmTfNVwQdpnLoxnO3Flb1kf7xArZ5ZTCR9T1I4CiNSQbSZo/kNkRF3PtTqvGZdUjH2aOmzgSnS
XkmNavd0zfMexnPhMPA+LCmYEMQCjm/GdZ36eTvj6GO56QW0Fn9y9qOCwBQOd7x6nIBwHZbVPBOU
4Aqst0dyAh57eMjAx9VBT+1jbwjx3x0QQApAaaWG5C7iwkBJIcXqL3nHqdUzt5i77sQYw4xVEiEP
Suw3uQtHUgjBeSzopoTAIOVE9yBk4iOwiCZHSGDhT4dzfjYFgZkZ3F7VNYLSIM/BDllDgTMFZxEh
blnWCLjuIoa2h06X83bWYlBZuUKVNz31mF+J9heFRC+GBAwRSid8lxw0N0+j2YakI2Vw74OMtobf
sgKjhIfMM9E4BqVl8CUqBx67puSByNW/IIVx0yp4Rz3s6Q7jNuZV2qd0ph41TpTgFbtSR2m7vcxc
KEEEQpSJVrzJhYJdwTygEZO+U/YKGBxUbTjXpbd8ElotYYT4sIR6hXnu4GXmen2le1Mdkc+fiJdo
3WRabL5Xo38fLOQLw+rKPgjAFHIqxglr4GP5QpaRxUzMGz+thXCYQkI5D6BfoFKvHpNIKIcYRTtW
+FUq6fvgIDAQZPt3kdkMIoNNHW5aWLHI65YHM2pp4KmdcsMeVpwE5z3J+L7pugN8f9TzqNwmbkyk
yXgVowdUhlMgQJ16OhPCD8YOefsvB/WLWA80Xnh4zdKJdZb1imRq0cw/IrwxWdfOJO2JpF5cOBQr
f7sg8jLyHfutAbH571Ube8IJwVO4n+/LOcAi/VhVtQsgd7zo5p8m2u7BoLBQvVqkpePDzfHjQpZl
hnMPsAU1g2VD24ZD3rawVtOJV5v6CAorf90df0Rrz+9e0AchFQrB0b/8KrFrgHtzeeFlRpJhn9T+
9ujtoSSrVOxG1GqB6IPJEAKCwQxo6Wq1zdT8XKaRhjqWa6UmfMbupYxAzJ0PX7pvtHomjUs5acd5
Spsz4SbWE6xfUlpuSMjUUPBztMPFZY4HU5ndE0//ibIZGslPU2zm23Ok9SV5tOmYiHuPkHLQ5CfG
Ma4iuxllSictM6NMTTN6ZifWUbO4e6jNtsUGzSjUCmtOup9dXuikZsu7qqrxKpfbInnM90UryC6m
Sk8IVTeQJ3d+hBsfe7uAUFEj/GK31d+kb4RObwABeYoGFpETcpYsV/m2p8dZyONFI1f4NzXhw+6Q
rK/z7IhDZDF3XuKhNOfuP+X0/dwm3YDzzRw28yr51zblYnR/Fe40pIWLq0rJZwdofb/P8L7/dkJ7
xAkrmLSQG4/5PPCOTe1l1ajxZWiArXiKkqBOvKjcNZX3Y7xhpGnKHLS9De5qB+VSS8m3KO5Yr4MI
uPV6Nt6D99RL71tHM/KvkZ3UAe9t4J6EzEXjf5EV+phsxsPJjFYR3CCfPUslQ3ocfviAwYsJBRnA
ZiUSeIvl6v/tVPbMgk0uWkjm9R1b8BigzH8j6SLPPGDXL8luqsUxXKQ5CcFPingMsnkGPmrFXITP
ETs/3kH+9tDzG9X64v4qnFASfd4s8wAEY2QXma5v77oJ1wiHnY0BSsQiAif2s6yJSJQo4ebP5wL5
0rgVLiN/WzKyBzaJ0CNlEl/sIlfoiUSn/AB/bOatWTmAdKz5ooez9YxM/733uSO+1x56eG1q8/Oe
NOiqV3eVEWsffJEDyim9K3xH4ocktpC5/+hVRLhOoVyc/5afXjVcpCZP4t6LGtvtxx/gCZt51s0v
gQ+xfGvTiNc8PK9xOBs47IbPVZaryOHvMBNoM1tivPzEpSejnAp2RWFEYmJl4DyQNURmVQTsxdfx
nTmLVe1fywTLyO+RpPoN/u2d4bsBiICJC5n2qvJLraEfW/qv0LY8nUYHQamaoBMzOyG0+2CrnI0w
YesdrGNGjMEOf5GwH4TCc1ctkAuEbIRBN0mRd0hMbJsHWm/yoecs4lOiIY794kh3FvBuUELDjrT6
hiYyJzxrj7WKmaPB7qnDlOs5UlFxjSIthySb0RHdTXDzwnDS+K9BK/oDp0Fiw1lYx25EDUvwMGIR
fGSijDMm6KKeqE6ZpHieEU4e+tofiqCRlUmg3Acyq9/dwE+19mRXCJPQHNdNjMbGuFcEqzNHlQB2
pJ3DbvAoRo1Qd248+aa+qo4C/sh5VIPMZ8egIb5RrujR/yjKciYUBiJoefUWnMCLysNb17Vk2hYu
UkUTgdc4AeptgaS+X0WuaqLKwoPg/SKciQJ4u7yAcMf9LlsxLhsBEPC9ZPranQxBs0zuA5snn/8g
JafwuatNeEupirxvVxcwAdVqNuEPEEXXBQyMBFTVyB54E0Iu7oxAEV/dfd/SzNJKZBwpaZsAELf2
T+r2U/F0oRB6TG6V8hhxLakZwWffkohXEEa1YXUuIYYHzI/f/JuYZz88AcKEbDGqaIlzT10WLUFa
QTGEh5wFw6fsov2URxv6J3SgTX2ECf/GjCUZgeKNHlDjfV8udAGjOSrqa4oE3NL2DmWcmdrlrjjT
VtwQvdAfqoqvVyjlz1gIcFYXj/VmEMc01tPyupSJCpWeJDxr7iZ3JiDuiFusjEbTYii9FTpff3y1
9mF18LinDsZN3W87tXYm89dchkQA9c5okgt0997SCfb3/fpooDLCUVS8hOCSiM/JHpfW41bHau4q
V8rQ8srO/UPvXU0oKamZrh+lLoh0bijbQAKcFqqSuwnEmsNhM8ZcMNOux8GEvozQBvTwsCq2J1kt
sd4i/NEdtLUMATL2O2EiUOIuabkFz/Loe1kDr01+NBqdL/tjlzQrPy1AgI2+88Ud0i2Alb8Sbsg/
vhXg/Nd3vV0PT/eFuJQnuPX+KzMQp1Twd7P28zETIzczRp4cCq5nW06ZJTjHjXhaRg67llQIVicr
A4sTVkC5joXZKLqWiT7DsV9eR5lr/L6wcpoW8vuCX63iBcQqHpGsJAnaEpn6E3tGLUNQsmBG2HZB
t4xvNN0UUmzrcmq3ZFOi16UuMcuZJF9pnbD/T1BO/60wscYq2I1tzhSlopyKwP6PK/YS33aErSFK
pUSx+f+g0Efnb+9Bs18SzRX8sfaPpAS/xRssWfIrSiOuj+XEEWkMWmwnb5RYO8MuqUDI4SHsZOSR
cuk/GNxS5hJCr5eE5qwkKBxDLWJ0KYscVZ9nHBn30b9uPqid3Munkki7iAvg5Nd04cSBbNvRzfyH
BxWbWTfLafyEC/kM4cbXYHgkZy8AoJPfaYT3R7uz0T0am40kvMw209zoDJHioiqFAnF8xHKY428z
sK0iZQlFzWex0fekQnVCjXQc3jYHfbp4N2IpSM0NdgUT3AO5Xal10YRRWxsTo860ZY2DEBfx8v7n
wuVt8vDBJhlCyXCvKkWT67NjhnwYxjR0LKENywfEv9JH2FRNXeExmd5JxKl+wQxNvEugfoyzkZM7
z+lDLYCuYvXkgvmaoQ+gRqI+aCDYWTZhl3c8YVn5duouKF5VKuGUuQlZgy8JI5eImvHV5Vdzv6rB
//0n92ZjmbzNvuUpGFEinZMi36Bya6vY3rUBO04Q4/Zm2s67DO5q24VFToNtHt9XaiL6tesKgL3c
3QNZaHh75wAujqR0wFhtyqrJWrc5AMUOGiYUhgFVJRD7+eE3NXnm9Mi12sIImBEniskwXkrnmIEc
+kOLWlO+XnzASQSVEYSvWn7lrVhRa5hVU209Z0zHEAafWXl9+fd+DpzGzbOTGhFYjYx2kyUdR7uK
X2NkJW3a+AKOEbVZuh1ik1zxYfZWcXAKNgUvllxUBAJ8RFGTde7v+fDqKBoq0BvwY0hmfClcXsyi
2W2zq8qf1FS8H4uobnKexqnyKbGYTNkLb/U+Q2C73XA8lY8KSt7mWvA5UgeqiKi3awsDFL4zgvKG
DdEpnc3flkdg2at8hnhh6N3pdMKsFhQ/KIA8TLKKocvuxHWkLKlIRPHYHMAkR3dnxXTWQaoCWPt+
FD/3TXFej6AR2/eBulhjQ366vZo7TdyyjcxGjde8q3L2zEEbMb4AvAYtZ5hHFrkELc9KevDZE2Db
IUYoWdZ+Lo5mG5geiyzlk4Z+58ZskbeLFMMCpWggx7K5ANwNUF8k+qfs+r5/avOHBO8Er64Ku5yO
XCtWnDbYfppoMNN3rVfWMwT1Wf/ceJ+3Ia99viLO7RAVyAXCNPlZ6rC7+PTYDV7cBX0c8VJx4J88
8+XdKZ0QA/BeYIPH+EheG7EtmnKY5CpT3gI7POcWVl5iUoTfMwzxKE0D+NL8qUEU/N17yNvYSv7n
wtAJZ50eGOOnUMOsh945EGJ19UZvHB51a3hR4jxpfyhd+AyD3BH+RIFXcHRKwzT3dqidHUz7Ls4m
9WP7WDNxsMvDOcmA95wABQ0HRVquwLG4+BFzUcEuHsFhatRiCt8/mXT/j9rRtdHh7kYlrvMW6azQ
hUn/M3+aDRFP3B6qomPG6g5aougAcVzGiNPSy9lY0uCfCKvamghbHzvNM9Hj6leC9X7knETfDPpi
Vhp5CrFIWYCIbvnLRBUej2dtsAxKIcLVQWObYBu2e8m5Aktm/VKCtcq+qha1f2DtBBjomEOE+iiC
LBw64tZrXm3lHKeOJb6qbrXjvwmzY70LqaVjZrUHjil+Xi58PbUXbEc+fcj+KtrIAxHbA3YfoawE
1EtTiEZ59u8TQWwByBSOM7ApHp6/S6DXs4I4V306MGZ78E54E2SQM64j3ulRWz+0tTB9mN6i/vHH
az3rxfNy/wPbat8FER+rgFDV0SEzmUYN/MpP6d1SjM2UChNH1jkyK9ymOl2V1RGmcfY9y0e1lCcd
y3t5S8J3YyCIlIlm1z5PA9JdJpEo5GLdStBBeaJiozetMdAhMkf2MXh/ugFwkIwaY1RnbOq0OHk/
SPqCrwe+tChKEcAmcDg0A9WswkDboEejbkLkPpzi7Uz5QLeH12W0Cto7CmX+0zI0IHJd0IWb+l8Y
5MldWz1I0nBhlTP1nz5B7vcRzK0K6xUCWDZ/OixMgXPbMgo1JD1smKALm+I6RaLFjng6bDo/AVOg
XpjHZw5HjBnuReq6GPb+El+LhChsUY6Nn9vDHtx858uvn0XJ9p2HKaxoe/sTBSSoGALzt8kC6IQO
gYZUPL+suEIDhUnVOk0mbSTW+uwt3QUUkSHlbRZfsKnUh2SeTgh790uztItY8tZTLz8h2PNqMyva
ZhKaPv0x/h0OQGJdR2pQXR+fZo/lW/d/nteWaA+lGzSSrcfT7bsjep/bWHJR0BH5VoI/mbBto85L
4TG5z9bUC5ybKuRXTS1N3V2LSDPaxxloEIdqd9NjBh2hJTxkpMPVshe3ZaAw4AfDWWMXT521EZNa
uYIdRQtwzebujbgA1RKNce634TSD1l0MKeh9kTP0WM/7di06plQ3c2wrBeLvvyMHJ2a+obOn5Hrk
Fud2XRhPPN+A0hpiuXqMRKNbdHeVRiH9h1LIpEgZ+Ylgh9PRgKELVIxURDHHSgGEUVIJPu9uRtvJ
cU8qlmVa2/J/J2ZqyEyTZ6gi0cPAU3PosBWUljh38Em1nUIIIZoqcWo81ZgQeLaopRa3GQx6J7UY
plSTPerprsCEwQ1QgykRF+fXZuT2rqtwmeVI4+pJMUlp5EOGuX+S9Q0I4nPfivsPQhxOhLzF95je
JreKh23VYe22Drrek8ssJifND44kJxtFvL7jcnptJTWj29NphD4Lk1VU1mk/yKj2ahG03yT9ey4j
GXMcI85zEnW8bheCm5Vq+FRPFTI3t7RiNXRYouKbFPeecnnvhnFnV2x+9lxjXjHj/t7x3nQh7utz
UC0udCuRKiztVwbMaZfwm9SasQ+m/UO5URTCJOAQH8NGuZ+VYvc7CmRGiKXiwcNBh+JRGwFIbNoW
eWW9GuKnxe6U6DfXZJhsawfe3Nejyc4mtqoxavpcT2p96PqW7qJhhX0mPwnSfzCgd9ISUq+mSQJF
QZ37jbf3g0DxI4U3jaGhl9fpLSyB4+/KbQGb4kWgZ/kWxrA2XK/OJmGJNi1lL0SkajGGG1jzsmq5
xC/WNIvZSbWrBL7zvGLa21zZriUhQ9SM3eWMY+jXDVyQOOc2haK7DBSr3Fb9wRNuiZyaQW3EARfG
xENVhSlKLEinHgSjs5ZLWk4o/rEhlXXcOz2+EOG0AVz3Ci8+Cg8eiYdOFEOe3M6W7JJJ1Y/cXjiK
uRYvxy+knQa6hpW1u1BCv916qDidyqRkt2piYVmNVkRah5byG6rk/LHy9YGAJqZiwRTzD6AII/UU
QeANoRVdkKny/7CzyGmb7rqm11XBs2XNePIo4q1USKeKrLzbsZXcZbCMIOWB0Hwu7DxsdhjJSKmE
XQ1wzmhBG9WMUzTEeIcPsBblBFlajEpQRNvODL7jUUKfOsxDuedxfqidhEoy7jmx5I5MKLNCnU6p
MJj1sxWnD9C3FL8qcf2/UUg4rqQpSdnfTyK8/CIdsrGp+Aohv3QzktZX7NxUStcDjwAR+SfsNRHc
u4MMMraYTcCw59wScy+YDO+e05A/HkDc/EaDp0ChcsLRgxJ564wMWwJrUUy/MdqxZ6omzoL4QGcb
djKbhBYxa5kOywzTZxdR+Gkr3M4FCei72b0f1ZFcRUULmRQqN+168vnC/8B+r6HkxAvXNpX102F6
1odOLKpzsDHkywnbEWfXUL/ekdfeWGk06u7U72CoF8tVXNVsYH97JbwxiWc7RgSMyCvyMvCb11gA
I0DK+A5SrNj+L0t5DnMVHysFabxxt3kPAOpr2ixvfhMB0dnAGkwJQhfiX212vWpozb8yzbCbqAHb
IJxplg0xjPyidTTflitE+Ovq50zw3QVww+YguiQPVwY/QKeQXtpg4oN514XDJE8nqoc0uZ1ZMr5M
imHZxlqrNQPg+nfw/Sc2Py8UG1EGqZCsIflny1iHz8rPAY2gHLIw8FMYHCM4UbJjbMwMpRJjQhIR
fdLoj+Qz5XK+/eq6hKQmP+LjnN2Tp1YL6dquvaWlT5/6yJzj6a/p4Q6O1RQEfBONwQ+7OlexIEij
6ZSLcTo0TolpAwxDRkKEtaIlYwXW+hhQ0cnZqPpLaV0r8yx5Vb7EnHUU8bRUElrrvTq4FhXstBLn
RLR52LeuQZXNzrl/209dw5Pu2tKcVJNoY2DjCKG7kRtj3nYnw77SiC2Y7z9OysxGZe6KvOvKVnap
u6KJhW9ix9z7Fu+lN2y98EgNh+CCwrpV7/Vc9vgIxaHDQUHLGJPmDKqGfckvw6tnJOmrr2BpccT3
0C6gYSE9UTfbxpHOWFPzGK6g1zm6vyBngsQANkoVrIl5kCsLO33+6/JIIxPSZLSlbclyXH0dXvfn
2Eu6HUeuFxN29qs/j+M1irl7fDruMaelR2p5re3oRsk1vpstz2W9HR9rQ6WS/hWTwryoCBvfOVkB
bLLBzb0sJ6wXB9WpIIFzk+uOOxuu/gGDtEUP37hlcgHGsl7hq7GxGka5z3SmXW7M2OHo+VQGvcQh
k/HUh44T9GHz5ydvJcZH9LyJnbCxKNYHJVP9iyYkjFM5oClSmqJN+xdVWpe7B8YmfaNsawKkzDVJ
mXNhxYZA4VwebnbqG4bsPdCriC9BIv9+M0RxtRtt2xiAN4vXxi0b3GOjAuqhnB2vPhFMeJyYOQmO
IGXGYUJSenu/u/Zp94RlqGfhiLdR4TxbSRYi2n3hDuh+2Lk3rRVaCkSORsWdUEquq9uxR4tsHfk2
srz3qTeJk1ZMfPhPR0jahxtwLDdMmZLFoRYyRpSXiz/nyfX8v9hzgSI7sSg19l6ij4+kOfSTWG5H
ZNca+6Di28C0S4rBtTyX0qwYUDsC1sXvOH9Wsp/OLZwJPv/Q6yJVUXcwwExLbYlSvfgHQnx1CNtt
UpqL34X0hxpuMMckv0WB+A6biibTmN/P3dD0OnjTkFyj0/GTaGNu0J5xgYyzHjE3YcCXTgIZS71f
j3jhhp2AASxYsTB4LmjlUqTnepTXhpWOMz13SZK6Ho7XZmGd+tUE4ZPUw9IMc3/74O+ctopg5Ksc
rtklQjChezOLbbvFM0uUe6/sL3O/C+2NiT7rFgg1nUFL25ZsY8aNp0M3z2lGNN7RM7ikm2WLTQTx
zTJ4bpVhR4OiP0/0Y4qljvyqrOOPWzlJ99Rcn4MEytjVMUM/e6nHnkJ5kL2gtnpfsjEf7jzpYIFy
xjoOhZF/JHg3CPZ0uESh2o45JhSIzX97TnT9ommOyQJeuTzi01usdF7MDEuYuWBu6zdm+M3dBMEm
j1DXhXGX8G8us3Kc44TlOKXL5vPPfZG0Jj2xCEjvDDagh4lPsPCkcur4XMPDx3rcggExPw5aDdhB
6hrkb/HkjtOTwbbwq4tfcSqggjz5HaAUzpYQXG91RzGZZNLybgRRvNWrFxZXvyeYJ9ObN7/acTYn
kQ5mjZer/4nBS77VCc4373Yk9n26Iv2SXopQJoIKYJclwBy07Mk6Es7HBoeftq/bkp8kLrAv02J7
pUpg/8xeDWKuO3eGmZrgQuTRI85DB+bALEg7xRQQ6ZMD3Kk0cRPSIHmut22bT3VRTefc9dRc1pfC
InwM7hUIah9dix5XCbQqWWoo9Z2tRN6xN2319S1X6OQa8JT46lsTA/faXey46vuIQHA6vSyKqAz2
/dIU9bB4MowdBMtkKDrI4Bby4v4AS/ktm/bojz8OnJQEn6lUoSV+zh4ML8NgCLZXvXnRIpmNmbok
ilKwFerhcl3DMBkOtyrNuvRoRS6RxgtzQft41gtL/Zplji8GqGRefHDJycfbHx7O38GBxFmm5kYt
Rlegz/kcMsIRcJdbtZtAsmvsjUMt3OoH5kWZBDZvynsp8wtx0ttUcDbLgBlS4YEn5CnymjHC1k84
xsRwE2IrlYX/OQ3q1esfKtLnUEB+8BktrmaraEaNSfLSAVlymflO/H0VMdRs5rp7WzGg00EmxVoV
LQ18kFIiHCdSkOVcOCzuleOc/V3DHBKRXHdk71KVEoYq8heQmhGFyV8LnymG9KtAJGTTDez3Fn+H
0dPpDRtuccA31ocQmlwhcq0HmIz6aCxjktsTn/LYorBxpksyUbs5d2i8yGGt+vGGv/Ijd5EctlRv
DE3yef0yaRbFt8+fQsybm3WDWwWp/hFu1qja4XvHfho6wEzmoq6EpOOg57gJzmzDpvXcXAo0+SUi
xOHW7frauDnxqJLHruIDDulcY1zjyct384LsSm8A2DDQ4Ehbmp5qaEhWja6Fbp4KwiLFJ2JVYRFm
LcSh1GXTj5Ek+d0k8GHnEOMA9bgB5eJqgRbv1Tnm9qbJgDSiQU4K6Gmny9O75IOCs3LInQFIo4Xu
s9rcwj1FeGVIL1dLVqCehxO2owglyFmdlhiljgyqt7/jgruvG9ZpqOFKBKlu/6CaUQAaOBxazEJ8
/kJYDqP44sZv+9Hw/tY4ZxOfAyaf516s/3bH1ea5GjSnS6XDNH/ZqvzZpYHZf8gQ/FhNQa/EwXnj
aM8J1tsLtdztLo1+v00MD95bnX69JeRc/s1gw8yHp/6ANGdJm1hr+BTO/LAMFGg9hyWoYwLabHcL
cUOQk5ZZybBwGFI9wEkhS2iaw0UkEoOF9ySp45JZqXVkMFbx5HYjMFMSCEbQGdLoBWPHit5yEU3W
okfKyEEg6yjfW9TjJX0IUP4OgmMx+bLE2uBkAu1aT5sodZdnlfSS84IhdLw12YlWHjTysM9wT5m9
UqfsqbMphO47mT1u3K2YBV0LPZP3SzaDcsdgLzQE1Gno2aMQbvXYiCfXIPa00rZOT2ZuK/DFUby6
cqYUUsT/p0A1PrhH+S/m00wYK/9l5I5XFIAgeJeYkBbHCmgHVi1Sls6XpBndztyHlFRWn/N7V4IU
em4A5V83/RIRGdNISArdM/I6qptjjkrEMDKUDUFfB12g2deD4IFvND1D1Qk/KszI6KF/r1Ju8jZP
sIeNRdPhpzICZQirao0cvItSXHp0olJlJJMsZtO1G/1P7XI1d21nlBZ3KB/cx1W7L0+NFeBZPZa0
IvTnOhKSnfVLwyIenOeKyCX/2A2frnfmAP7qzSv6FN5c8PxRUQzS+2cfkYcB4c/IUEQqJAir8rtY
QZoZU9VMNKrcAIRiKAwb7FsalYPb9EpuHt6ijwH1on0LonLJejmTpRAvGTDH1odZJWaNE65sSPk0
2gMSvpkCFCwaeqapxu+ZJAM3eZPVsJhDr7uRdKtca7zA/qVOauQiIcoTDTiP8JoEUROmS64pm6MS
Yf/rtIzHTRk8gIZ1fr1vZBB4NlY3tnIt881YM5ztL8Ib6fTcamZ3Ax6CyAn/2Gwcnkr0+qfksPeT
DSfvtLjKI/+VnXJedyJpRIuioA2AsIgL6H4sf9IyzP0zFPHLcPz4uuWBebosEQPRnwbKt/jklkp+
HcqowvKqb4uOTtXgwa92YFMmVXi/gnlFiff/KXk7RdpwczHPsQweHgtow5lHtoOD/87Jq84rmD3e
pjVpG4fYVHLACvwA3Y8Kis5Qmxs8XJAnwwSxyrabjbWzEaQSD+SdCL9D6zKx8huuQyIC9ovifZmS
hV/3AuHoRqq1PR7eXcjAoeXOlMiI9f7Tnq0RAEtvMrjHfymyuL1w3zc3BKMQK1k7mNvLiXk3DOIK
UbGNulnd1Pcsl7WPFNj7LKlkQb1kDZuy08ocCDiH5aJtg8DK/mLJ+s6X79ETMhRmco4tgf4Tvw71
eKX93z56Bs5nAiGKq/1Cbw71K5nbMo12m38+oZmZcXnwiAoE2utw5es6Q7Y9scLIcxEZGV3/8Xb/
zifJY+3twM9vOpKg9Q/w026WD6XCm1YtPAOzkTyWIwGJoYsMPMbugPvTdBcqfoWOWPVWy1DP+9Z0
bwiSGdewXO/2gHvpIaud56TCtESeAq2zANcgxklwSh0xAuSBvMsblGeN+nn3if3kzjrMy2fzTeHz
f0nKBGbsZk28e/z73qXhDWXdGBo0eW4vieTtWPRF8+iuRlNg6npBbMaw18Wr/OCCSZGR1yxmtk6G
lx6QhfWao+2ga315pI/rgWPt5CJxSwoaknW7hUTBwQIlWbBTAQxw4gFmjdAArhiWCc/ibhZ77+z9
K8yVLiYGbuEzq9BI1/e5fgnvOhMtJF+xB9YPknpHGDt74ntg/yd2WmrjUyBqvjq6+TsM1XDhUhVk
MBKSueO/GO+Lt8dQuJdo5T8Cag4RwklMSV73JG7mmB78NPI1GPCrVjCcW5TLACqRa67vqaClRwvs
aUvi+9LLMnJAmNkPKmBSTy824QO1MhE+J/eTHgVZByArwyAZiLNDWaLY3TU1BFUgLhNfwrsyba3+
M+g8Jj4kxnITriN1WxEpvO5zBYBG7BXS/YyM6xDDQBihjQQC2XZjYkJUxuPC4eZZGiQegLi1JQwA
+npIX6EHFp3IOKPIwRNMWkanGQ64i9FecU7cnKau8Wye2ZZTmIeCC6/JpnaQ5HCJeJPBk9IQzCbE
Hud3tkC4VGFZnSzei3dLskjEoAxDowgiAF9nXQxYOlaCSRsYUIrG8ZVUSWMeUqYIYsq+Qd8qw/T4
7skRFDxtcT2Xa/rAWeDb/sGQtZzkoLKQbHQmmpLFqJXOztwS60A/6Ij7OAa9jurja5wKSETiIYMD
0uWeVzwAC0vKxF5511PfeiYVmGKVdnlnJY3tQVJNLd3aWuVRyOSb0K43CZNlMhFASkTW/1EBnm8o
WvuXCuEdV8wSUIXKGow3EKBgG1EQpBPYJszjQddjV2N/G1FDo6BUYnedkrbu66WUyA8ndfgYK+ot
RjeK7AlVcNnth1DBhUfHBBzBY6xSsGpB2PLaElKhcO4ydgJK5AVbjFUBWf9lQCqeKhWGsL97s4Fp
rWoU1SQRWrhDLUEEpjOuCiymiqenkocxNTV45v3yGfh486vxvpXnn90sz/1EWkbhqYkW8gGfLpGx
QtbMwJ3IeWX08+eJTdVyc79l9dWMdCdrfv9RBIXK/ZrnTrXEjQCbcqs5FVHcVNJIEby7LRqpV9z2
BTrQZsC/hIC7OWjkVAZ4T3gBrUtNOR27ZABMLxRuaQ3/EkasZp4IXKVK1nOHAuzqV+29VYXCvvo1
6Whsh3WahNfgRFChcymgLLtVUu7VpQffoNclwQdan4S8zVxey6G2xbWilZdqQhFYiOl6v7f0Dp1x
2W8GM+wKIC5R9QUlk26jGZBCcbEtDdR5Hnrnz1pUvf/Vp/uwxX67qaXcRTecHHPFWUo9n/LK5oP0
zTrdXUOcBVu/tZLORevTPEVApuW8a43Nw2voiXSsgCVnJXy+h9dSIVXDhu6Y50yDp2rtmpzlqvn8
XxuztBbNcR0gkOGHSX8iGq+BTwiTqV86XVToq/kenJ+YPqWwpn05gs4amOzriqJ7OtUdN73jr87v
y8WODMGI24Hr+2EW/v3Qtc3N9YkVyrqL7pUmZSLsK2nOup1LyM0xGr+nnl1jFdu2IUBxpQm7muKy
w5lNGppvtPyKifyNeO8N8Jyzfarb+bmmyvweWio2GvdTD4PMrDBt/jBpRgVP5WDxw8HQipnp2WV1
SbEGymFzknWU/J7IxEE+eugGXDUm7RpxKKJgeRAkAGl7sYxZyirj+HTHF7kFsksXlk8KIBEyI8GJ
PTz//pRPLFef2kuIK9/61M+Q5JyBuQklFeHh/ZQ+muuiF2qH4hVSRRFDC+kkbU37plin2pDIuOwn
NDvs7YjrKwohIALS3X1x1xMyViTgPvfxRNUlWfSI5F70QLBXKqjmV4kQfEWa3O4Q5qYBrWJCmaEv
rR2U7Z029+HuR24a4fQsQJW+orq2J9UmdZqsKsKhkPdtylFGxSZGbpikKUxgY5t4RlWeezTNJFkI
GO54SDcbGa7QFyJkz3l2iFkie1+OxrYqsK9engcDhVPT4mcrTf3Y88BM/awDUUsTfBqx6valIS4K
nMVMhPclPTfU4Rowk0nsAKJK0y1xvn19K4Z1ZWfwVFUerrK54tiYbziA9Bx2MD3bPA/UFbnRtvgQ
Eh4f0YfEW+knpk1JOcpC5xKQGxXgZJZJeQ0odyL3JhgXmOxHq5T7a9wfbHRoUIGh5+wuSpbuQoAr
iTb0Ph6YMB5DAdHX/cwVhCcxpTxVgNMxf9c0mIAvcKKBrA8torzBZqzUo4qjmQFawqVZdkXyVwt0
q8+cWGS8WD9CQZ8ZKSPqmu+ewmv6jem0C/EXgjjjkLOZQZz7JyOKyF5iu3bNuMaHBfRmW/hEA+Oe
Hx1EYAyk5xEkdIAJGe4FnWTp1hboO6fD9Hh270UXPqtVEM7t12gpCXm1I9G7R/LZsIu6cs+y/PdB
LOZxuT+vGmmIadj3HwSiY2sGSizf6z2lkms7k1VPuGbl0hFpUfhJqoPPd8Z508LhswnDQSNQ6pn0
XVh4Ht5q7CVE00yghxuKo1WHR+KNpd66ncsnNVO6Xi38i/oD1QejwBUx0WyIJlHoZ5Bxf42oWhNX
DgVAfAB49SWe2r9kMxtE1SRSvhukZhTUckELlx1R1l0aQ3GjTTBZ7tFKnsaGUulqYCLhzdsnpeSF
T6Gu3l4InotYB2KshyW4XO1z+5/hK7K/6FlRpaK7aqXxcDCcp253Yj4u/iX4llYth3VENdLWfUG7
HXlTssy3gR0NY2BWiTzrniEjHdRWC2+g73F+8jsIFVcYT/sRqjkKe41/9wcEWubJ6RsZeDTG/EzW
p7Cc/FK2oeyNVlkhrZBOfdVaFLBbDPNozZQCvFTrPSj1akJAxykYL2cVA1pZfvDbyQSZ/p/ZZVya
RWAOEARFOAY7PD0FwNxgFPGTnmhFgd4Awa3ae6tzxfL11EDs26TQipBywA3tMNnYup8YH3lWqrTG
1ezBonNla57eJYiI89KAiyVCk7nevkkIoFbHuy9phCjQC708qgaFuZ8wvA3hvt2hs7ViJrpWCMTQ
GPwQU/RE6QHpQhXSrcjaIXLtUCGQQhvThYt7tjCIRrdnYxlqW7ZBBi5zm4dSVyY2csXT0YG6lYKX
XOfO4eDbjdbL3Z6NfZt6HBZQVxj0ucWmSyqUEguDOziGNeSLxfS9s4/huuhsk5dza+earg3Vm2DZ
TZG+xz8yVRtjmCJmfTgcNWgtEjNbEeeTSNqPT4dsSVnG5+bmDoWthDeZ05LGRZNa7XDhK99hDl2Q
afDYpv3DhdXvuUTdUUF2PxBW5vZ1Mhr8Yrt1Cuo/PKLNV0kzUDNQDig1596r5sept1n42lvE52kR
dTxRem40OEltV1HRA70cDQ+rA+GZbpODa47yIk3s09vf4tMh14OPS9fFL4w/+SwZm/mXe9FrvwiW
0F4onBE2gR0h58v+YCzShkymich8++FSjJU6pZ/sfOeAGmeTXQabK0EOsVtgy9a/e3yKzbiJHsBR
StnvsSPBMWbLLeLuTSS95h8FMeM8SR9c2SCovmjknGAnh+XqR9Jx7BeZUTov3/gxdccZWSwrfn1k
QTgeB8vy1KIqGV80iyJ1Cdmd9iBtbnJC8ci9iNIcdnzQ4EWJ/2OqWWUhVyaoM3n7BSkej+uj1kIo
IgXCG1AU8oSK8RQUW2i1xHeju5S8r+05kmEyoEfbquJSlL4Mk61z1FjdCSfYOJHqtYYNhYQzR7k4
8Ytv6U/nKURELvnn5Qrfmf7fX8B1VPllXPYJxLW1xWPY4gjfiWXqZk4BzYrUv8oYagCMANPkp3+M
itnsvxH2XfRe8aUqbJQjGcAjSMl7uizYuLgJFPS/K+UvNGl9Br9oiU54uaY5RLcuV9jxzSFRsKNx
KKj0hN+PGnqy2nxTQE/Jv0YbMHKLm2+DVqRBZrf3nks7bz2b5EiU9BIAxnWh5Rl+cufq97jxnbJj
N8dZA7GmAz4jwoE4vT73JljDkpOR1GSdA9gLHZE69gI8OxWIOJX9cqAWnJx126ym27BhkIp+3+7M
cZ0t4gtu60FhcQqGZLPGFvzFRjKK7fufZP/CGTPKY1YTo7NsHsVMco6i3oeK4hnQHMN2AuPUTXx0
pcoN+e70WQB+qoC+qmto8kaEb7yp+cf0lkl+qk0sp4VDncUigSAfAJ6fQGTiwXN9vKviffKN3n29
g7jg7ZV0no2sVXxEvZWZiGA1IUxCipFlfBmtWO/lGRNDq4U8QhbxQ3rwufAnJeZtaNTjgXfOATs9
0QpOu9/Jp9F1opcz/nrXs2+81U5SAss6UdvI/WgrLDsRaB8Ud81CzGAv0NG9KXQm3+JnFCYFboh1
vkvEC1yJce4kgGROG0696RB/vmLB3eAJM68eAEKDl4spnEBg7DCExxpyrB9BdRsD9ew4NRbVmgVE
P4aalso0lec3Djr35TFlLqazNMuW7Xa+u3TC2UkTPxJEy5IJfvDaSnm9T35LM/JkEvXdVPNScyzi
cSrfw0NBHS0NEFwaX3dmTcAyFhICD0cCORk70QboiUEEQ3CUyH8pf9oBDVQbiY6yHMou5CWP52Bg
2qj9/a0kRWGamxdc+VuzvqVXzkFCDpWdSorrS5kgJTYK14zUyhvHqIZZb6+5DGarCh1v5V0stGvb
o14la8IMtjwPBCPLQZAUVpjNNip/By6Uu4We8cPpGL+N1pXISN9qqAD7toONKmH4IjvKybVj8E/R
ffWSEszuxN7wXpLmdpvjH2987Y64uh8w92TdJEQ7iVuxemSRX8bja5XWQ9Dyo430Sh11GBJxiYcj
iBiteoXe23FvcpbnSaB20RPWygJStwPRcVADTVE0v1zwoxzeFP0vIR2c4YVtsvW0YM9pGZkBzos/
WPDzqSAyD5K+eTDdCA9Qmn/+lXDxOAmZ7nWqggKarQVouVHHCTdx5CxMzuKr0jH7SMaDNZ8ergGu
bJYG+6M+5GhtarmXpDpRAic0GSd+mAQ84MWJjYVArBTLXN2KyEKV09y323OgySWQRrfw8mnA5YKX
BdPAp4FI0l2uTJ1N+kNjWg9SVIuK2ohhcTxiyI+3fR//RPGDNgjDFZHWV5TOvrRVHEvjYbs1do5n
eILlfTNAQocvOgFeX+MUhlABiepES+NP46I3anM9Btgpqv2l5iF549zNWNhm0ivp2BtJ3anvMfbo
PVfib7FSVy2tpig5frQsQ5La3mEeZ9kUmRel3o8cjAWzgqRA0Js5tvIM3/5EbS1iNmcM+oUuOi89
KiZKW9/GuajaOUoP0hHYL7Oj6KH69q7G9RgdJWtzAfhFA4s8KY4IfQSkz736+f8wegtb2EEMX/bF
rjVbM0Pq64lZ59FOmgUeCqBFqaejkkR8dVc426JMY+AdrOGpvigFm6glU3eL5pP2aWjXZGIQtQwX
iL1X2gQqoV+UOqKexaFWYCu/WWw5ZmYWuEk33XYqRkfWz0GBIIxgggx29Nu7EYcA59d1VZFbBH9D
oK/cULpKe/5g2D0fFrY19NsVOl4cPsKLSPeVxLVhsrcQEYfWj7Lt8ixBF0Pul8U34Ok0Gh6l7Vda
GxLZSi1tOA13yUrrgZwVKq44FQkPVrFmp9fuXzyOOdpOxM2HYt/bNjzL2WqWTGSCSyMgjM2ic0xx
VWDbXb9cn0RzS/NuT87TVJiyocZr+IpRX/7tGsAHBp1jBrWf9CErswaM5i5zF+cJfAEnJSy2mFfN
qtoGnpKGKAUX3lrTmL2/pzffqYuxwzcBuHvWoyN37la6+aQODXAkQKoDzob0weecQ0EXp54/lxE5
8SXG68sO0OwQ4aGvFGcpdhFHDzXAhr9zYDjufGEfJ0Bf+P7qOWPf80iQ+ksYywBIBJUsjCy06N8Q
mQxYctMKfytb1lkJPySFm/GXH63hRZoygQR1shS47U94dmMUgSvu23tcmmkzPilMBZE8psNjZWdZ
EFUieoyMkRqichslnVcXlbOXuY5SROhfD9goUAXRWNCVj7jBDeyJrQKxkzFMp6cmOfnCrOpcB4qR
rlxRt6Olt3tXB8+FQb77soQryboeLl9jiFCUC6ueWyCv92utoxUn44lE4t9vZIfw1qxXa89RhMUt
EQZLPqBzaaK9YIvc5DsG3F18l0Q0iVRkfrB03O8e9PF2Rqwmry3NqVVZaGyGUQe38zza1L5Z7iAA
GNwgv12oYpjg4B6XF3YFs80q8BLtGU2c7vDY08MmyBVX1sPZsNqZ4QYu914QnMgmcFaqrQemAxQE
q6sdXiAMor3hB0JbdosKV7VEjygaE3qHnZydFR67jHN/OsDxFN683zxt+DfYafsnQxYZBmEN8dnV
jDw7cKPuow7/WVSIWfdNh07TBk9bYHOF1xM+quftaUOvO5EQY9KhnhkIfL2x8Lw/VOD2XjQQ9DZ9
AaEoj8pIqe0gaMIJjktK1DBmasohrmVJt1W0AxpRXpqAgA2UUyj3o9VX5AEt1am99NeYNt6veLtu
BXi0GOGYJBXXtb5X/oplmRPyhAP2eaoYshcQLTK5qCynoEwhyqdni4XLwPJwndNaPDmrzvrXD3Uu
AMCgqepfzY3nr5/Mv5SpEVtVushKk8uvvltEBD3V+DpYv+MQg5z8k7ijwS1K8+zip48RMBlZqudL
J5CaoRF3KogGbCgC89mO3gewaSTUtIdQ5qX1/5holknczNDjaEgmPoiRCJc5CXzIwq0ZaiX2qlXR
0A/89NgbfyHGnRd60G09eZk2zDCwdUZuJyO9Pnon1KZpSekD5b+zvUE7OYOqlgh55m8nKtnm3M4s
BQ6+S/pyMQe5jO2z3P4QqSZW/CG1TzEDZ72t8PEp3ejjv3GvZTHwqGNjVR3nYpeI05ZY/WcSf8DJ
TJdcExBRBCAqSNX7B0GruXrCo2vIMLS2R4ngOFcqA5MMV596jH+M4zIVZ52oX1vYmObCHGx0Ohpb
DeaHekOOqq3d2kd4mO8k6dVzgvMT4Ypi9XWy0LeEBfB3Ygeqlp+Ag4jvdmE1KygCpq2bYZ1LapeT
KTj0oQk51gHFtzrdfJfhLGXHrG60Ht2yOGn5C+oQjZqqH532llOeVu1J/o6Znorqb+juj6VYVGTD
MrQPDRoAFtI8KzEiDwnC0s+e1Kv+A1VSpAca9OFeS8iyYIevPtLZOOCLzKPByyGOSiTnZDoXvQ6g
9G0PUIPRUCO0rQ2Loi6AQaj0SGe1nQFynni/1zniuh5nmtsd2UloeW7RNTOG6V58tMr4BmLIzqBZ
+UbsDEMkgpqMIf+NC06cjSDHPVYqfOHZF4iYuHxDre+V9ThV/6XiApwIOIw3DxU7JtWiElJIPi/V
VwbH0nt2uSeupIulUwurEfJQDXMg5aqWeBsUJZckRfqpywEDH/68ODXZj3FO8vMVyMFICNNsCeiR
ZU/ZMXnsH41/i+0fxU+udZe+ITPXAyo53Kq+sMD2fbY4Dgn9S3nssqUOGsu+gjbvaatDAvDrUBOU
hIf/4eJ2qilS4IIIJgDFFBmkxJzp6i/Ltamj+mhkg2dw7iKEiAu+L90ehsC4Craxx11ro/UJTvoJ
rfN8v1DdpUfk6qGyrviLvHXoOGhV4fU02nSXXVZo3Jo2Yjdhoacg4xQyTZKYZG1yi9Omb3ZMCb1x
s3zH0UHrqJC9l+h0sNpG4dDa+kKwomKtqwyuL800mxoRSf9TEP5a9+8V2SSIRSl9PodzAL3L5XpW
V4RTOj0f+b29nvAxeBsTBMafz/FmmlP0jOVkr1JljivUI6nzZ437y9EqFiQKlCPsQ211cy4TYYNm
QaXV121h6MJp6UIQ3pgjj3WCHESEdGP2JUmPx7s8TTgZtfBtMZIt77mMMywcL4if5kBvbGMYmcyC
l6ejB2AlSKj9OM1cAMVrKGco83n9yLjfQskYwONmbd5aN5eBcZ8WLkdhTqyhFOAV0aoBCuJnqCsm
Y6qNzKJryIQiS0xJ+53ISKxOZY+RrwbUOgGrECLtPdMloLO0ictWLs7vRE1MyD/H+wC7bQtPusfp
+PRc/Zg8OEVoBp6HYAUmuzOh4TgERgFDLDTJz5iiD5UefrOwWM1w7qa/7gA2qzHYMcyKJfBf50U8
b7A9sjLTRV86h57S6Q6/YQpBmE8TBjOXeheazu3TAhCcgNZx35GNc9c3p8dHy16RpR3Qh/M8R7Nj
c8U9qsixCWVXU/bxRUazIW1V+wi1nZHvdDOcRpkUYima9pyavcc99CWHfa4zI7ZL1LymyovRE/8B
028lIb8v5cK4eG/VhJC8xc744bxenLQCo6je+B1xkZz91zDbSYFeKMRWksbFJux3xPFPdkcfy1V8
gdzPgkKy3IYPmZMLuSOWMNTvsTl6AktIw5jXoQEfJrQn57g+0Dk5B90T9xY3AE8p5kZ4rSWQ7uUx
gqTIhXzJbe/fPsmWL8AArY1Lbr6jGVIzTtbvWL9JQrzYb1dt4QLYUAV8WQOFZ6wBybieDYx08WYX
U75i0a8tTflnPWuB104wC3w7lksT69qT0LuQj2AV2yhWAW/Au86vkZRioc9977hdpaKj/LVNNUGW
+jCRl5VS7HJe+iocGpuCbHjIsXjwDELV7DRIuBG0/UAulkEilz85Pt+Qr3QXJX/NKZdRpGmxf2Kk
RV4/Ki87iAzhYmZ3cUwuzooiC8x2qBf0qH80q5DGd6YeS9YsU/cbRjHK7tFIwuvO2N1h5Yc3CEtr
fV5Q1A8jLrROnbYvv86jzvZvM4F551naX6NDwRTyVUXvUgaSb6Otrzj307vLtOONv8hcwYi44dSs
PZuEliK9d1nbDdTFLvDw6te3gufsgUeD8TlrlbSF2LMcbWAMluffoxsTCpTB0WKqgFy4XWtneY38
tt35TIG9SdznBtMKFLkaCWsRksBCHkImTElpGbqRTF+7GWThHN9tjx8MXJBpQkMzYkPU8JyqJCyH
Bm4Q3gY+nRFZBlxEo15D/l4npF526G4kmtHcX60x8r0tfKdd3GSJ/AcXCk9d5G0W7tADgOGlH67N
M1ylNaRyN/h9kAr/Fakrx0RkyyCeTojZoB8eEUhDqDKnbGMmCNELRoQJfF/uznc8FBGoEEXL+hIl
qDvOGs8CBS2onm/F3pNnaeNpXHA9W8a7Uj51nWTOw67uPWNNTPFMWVwydkrtweYxJdIOe9lahn56
lzlbQg37SnDkAQVpUWrK3UV/RTs8ZceUq3NOSroy5pVkud+2zp05P+rnCw+fSqEODLuyBLEu1cG8
hKnv65GgfhpFvLtFdPscYL/B0FVRoL382xAnuf/37enpXHvXr6MBU8WAobxp/+oBsm425wuEKiBP
r1EpiAcLAq+NBwl6Jx4jgRbQelb/j+bIRcnA0O9aLoXKX/gkOIWOY1ooF0VKnZ/gt9t0dC2aRN29
MmEslMXHeVYVmvKEJlmjGhOxX2f6oQmf6CSkMeJPY+FmpWGcrqj5v1lJ8AbWbnJBoBV5OCDFjW60
xCK1CkA=
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
