// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_2 -prefix
//               MainDesign_SDP_BRAM0_2_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_2
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
  MainDesign_SDP_BRAM0_2_blk_mem_gen_v8_4_12 U0
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
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
cYaRSiA=
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
