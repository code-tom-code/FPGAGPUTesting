// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_6 -prefix
//               MainDesign_SDP_BRAM0_6_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_6
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
  MainDesign_SDP_BRAM0_6_blk_mem_gen_v8_4_12 U0
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
fmXqTYY=
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
