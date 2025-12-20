// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_3 -prefix
//               MainDesign_SDP_BRAM0_3_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_3
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
  MainDesign_SDP_BRAM0_3_blk_mem_gen_v8_4_12 U0
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
zg7l2szq+4Ngyrveugzc5+ehw/Ygmi739mbHr+55qOKLW6+h7/wQyQHMXznieqGpNTtF1jw9xS+3
iabjbz8/jYzbpL10O3d7eheGjJSOclNcdjwOYdzGBEWfHWvXlJhhO7s2rU1ZMgp+LSDVs1btF/rV
6JgTYDOw5h7y0qtfHQAlUxJ+G3IkBb2Lc7XQxCdvnrvZKMfq7Xs4pNe/lvP6lygZl6Qgt/rN5/da
QL3lJaLYr11fWICkqGPWDKsX8O5+/mgjacn0t/X044tYaJOBdIfzAWn62snaJI7B2CfnkoJWwmXI
VJZ+pO+XffTW1tBPl1JlAxwrUoe/uedSafZwk/t8fTbTkqc1+WdA8lu1/Xn40pnra2ofou454lK5
mGmJpbFNMTHD7yRWvfaW7o11d/LkXlBnpvYQ88Z9iZmkBRgnvW/vqvpJHPA04KTGuAf4kkGBITwo
W1XMOB7sMBSBL1HZ1wqbdC4tAREmMG9oWY2uJfsJant+xpgb8mEp5czydmQAHuSHvLLPi6zGavsT
0gO0JGTxlXNErM6ZSkTGKVe7z4hrsHCGCuJHQFUHFtqu3PV5Z4ANjz/kvKof7uOZGZyuPx+MXjzs
CZqgc65u4ndyIufTUWd0EILyVWelHbMtc7CUS05vCO5ktaZgqpQiJ1aLbfH4c3dF1epWFxkU7NpS
V4dCRWX6fjqb5d7RT5SZZv5mjMnPFDR//bfJE3K/a19ONpCKnOtJW1dDGfiiETySrr8DXHDE0eAq
Q1Gv55o6zdizE9ZnEs6/KtXY4Rm0hdhqwg+/OyHT2qlyzTw2grLVFka5DxFZQRYkTl/fbxhlCDNm
hssbVLd+HwpOHylGN3gVXGZMmd2gBFy4fvlE3RQlVMEnz177xdr+nYR/xL2ekH6WzwUJgbJLEfFV
ciKGGXf6jRayfxBjNFXhvPpWUVtigecEr9aooF1d+U8Edt+7iHJXPHMjxVZWan2VcGwMdwovkrms
Vklsu0SMNIT4ZRz7TuN9elACwef9cgxzmyVrFDiTqnOwvCRRrrauU/Xr8wUeYjoXSyPZhM6TzqGZ
fzemkN9MElqIPHFUnSpLYysObwK/+fAcUHg2cOfBcvZQqkXjiC59ZWXYFzF3Z2g704gNaN9OEHrR
Ozr9C1yVZ9/kYXgmSNtKZIxmBfx1wiXFOga4MKy30c0g8+FF/YRMaak/0Y2CW/OCaESpTmYNGHOW
dbZntJeYth0CZFPDNuCraTCSOMe+A8GU2NFPt6uIURRXLqAEwlUJ2OwvFiFZO5C0xnxSFAGeECt8
qF30t69iaFE4F10fhz1rfp0vWdjZUJIelvjqT4DbQEVnLnyULBjAOCzg3bfphtkyDzJZNRPTFVz6
T6acb7Yky60pU6tZnshfnEN8cYontZgJifuoD8NdH40JLZpTA4HGLpOoOqiA8vq6Ss8amZkTjdXb
fp4TO0jFu7zdm66Y2x+CA5KawhhFj+dgKvcL2iA9mwFhKlb1/i9K8TpmSoz9Q3sQqYNUxL9LexG2
mElGZ8y0mx3knUj4vWbA9HNFidZQB6StrJQvLQXCALajwIYpv4adao9OIiKRrram3YgCk043kTQK
RiW7X4C0+29+F6fQNvEeMfPDY9drDOANZO5rS6lNW2/gzKTCLwfOMGUGQbDAXUg4GEW9xaALcPAS
MuSjng084b6Pi3Wh92P+awb0MjvTjCkSIrff5KLmT70sX9dqsCe2XuD9voLIzdghfiMnXHs9uNZc
hKcSY+A/+1kEZ4dE3xcUkVG7V+5iodjap8EgikDqm9uELibalvR+UpOw3THei9r/zeq2l7tJcWHz
YDi7Zo39tGLlOu6+ed3Xxj23Sdj7hWojCe54a5m0DTDTjpRQ11VVsXMBem+u4uDf0Km2C8nzdAZX
eMd3jvrYG9iqYNxSv4xf5OHq51snAxZQ8u0jBiwDaJu10bHgEPekPNysXM3CCI2TAxtq+CuboBjv
fJ4frcDr3NFkQ228BX60040vPXaY8ZKlDmz7m7pv9wCWT+vsAD04VM/Taa8xRnZTU5W5zQnV1ZrY
xFWGqEQxWRXspEqwRbQ1DiJdwUHE/Hgd3GKiGvsKFZOUFRp+CJNR2kLq7InTTwPjwm0sQudovxRW
ULzKWirMZy9d6VKQecnkIZIO3C84fqBssY/+f+m5AmHvCjqwoKy2xFVXIBCa0qZOW0HRbs9cY9fy
uLCuudhjEVIZCR3V03UnFSNggjL1xNEXj3o5vm7/OmBNWttvT9E/Lcv6WcdN3wBHhWR5Wgmsw8B3
aezZZBuLhPLu0JuZYT/kUjOV7rozgxdqxo2h7eD55O1VnWdervtjl2FQEmcrjfnOUFB+9mjZDG8p
GPqf1IDpDOEeHM2qjIPEG7vthaAhyqZf/0g6Lr+ypNX2wo4gTzsubDKaLH9al0Xc0OQWUQNiNp3i
iITWOsQuj8S1z8g6xfd9GJd4lAEqOJOPvBsau7CWJSdWHfJfSngC1A/tfJyWHwliz1HOX2JmSN4l
uQB1EfExp1aL+AKMaZZVcN6ubvC/gtD7Bu57jMu/l+IzT6Lg/9P9eJRv8fINmBaS2tQgNKsO/aPX
BJw/2rNB3zk2lRBhB+k6q1mS0A1sDXMADPB0cT3dRMCjyaUOGARJ2SjWJEQZlIef7+V/YUGewZfj
kHLLGVn3ZlNl9yNt+JVHIvc6H+fzIFmcbvZGoi2TV0LqtilAeFn2MA9Go+9lYjiti9S1kcnB4L2w
XX5UkVT5Ey+ZondnjaTTVfOv4+XKSDog8VmuSjLngDUVQwYzW6F2s6ItK4x36LyOjL7U3iFLjAaW
lERdc0MbkARha2wziQwmhzHtSBZdShNVgIrP8HaLgLw+3K2wv9peCYgUDa3riRAk3TQIUQxr2PeV
1gqmjM0zF996/p7CzMDrfb9yoiJQ6UOkecaqDaZ1VEvPrBjbVILvrH9jwG724AI8majFaF8OETz6
dfDlIZL1re2kNS4AZVNk5UKOG97ABK/3boUz9EZlpMq9OdBlzl5Df/LkcJamjoEsu5SKBjazOO9N
Un6g1kPtXXKeQsHhagJxwSTOkiUaTAFxx4ThWBHhk5mqEyC8B6cKYQu0cv02knTmGyYyRdO/Fl5Z
/kvtcKz7OAI7aqaZHdXCOrk7Uxd9IeLavhdp267hPQ7S110vdUENSA9ALRH3pwGqGANFaJhxReR2
85YrtM2qpZhcZ7DkRPBbOvUjiZ3V/8ytsAN4ze9qJSSVQklx0rJ1pjfkqA/E3GUD3MpzUoxx/tNE
O6pyTl5Cyf7zhpbtCJfPZ8+Sk4kVgUatsOH9SWxIIVHryin1vsPm8imqzMIylG5Bg9DtWAcTvlhW
t3B1TU5SH/OeSlkrKYRKnUzJYvNKGKm9Iso4V8wELkmHXvU93otf18+uWSRQWfEpsFebmRvDDbeV
y2Q2DY4rFoFkH1tcwHqeQTlq5TwHCzG1d+7nsDZtbh1EPAyWXCGGE3nK/09BPBiuMYvJkjbhvNIp
UDCp7uhyU8dalFfjj97J1sDl9NFHQnrzRG4vNjtgBsGikTadNooTBCko2pO5vIHhit40k8VCcJXh
dmp7YkvIvFBoc9urjH93ST0ckMgL6/Xk+FD2fGX8wvDGJ76fkmyhKaAo1x2+k5M7PPFHtFsqdSth
Mfoy4iv1IrfkWn3r9iwdvuh5xH1A1jSvj+PsY4jypISp8qGzQJgiFxf3Sd2lFRtgtYT5bM8nhCHy
Th2eacm+JpIWPZaOCK+riPcO3ThxJJpZ41Vopd60/zFQxhJMwNFJrYeVPgF0vs+M52adW/lIIAlh
3hKqQZjfZC7GpAK6lK1+skIHW7o+WRnxMhNkm3fyzQiqpAi9C9CXymuf4G/yRmkl3uubcxQPtRu0
njKszGiZieAROXVI7+lN8fRCBZCOZbSBBYl/pDquIU99QhIxTBLrN/2KorI8VdTsxNKc5X8IlhCA
vFll3YfOIUOwko+tftiibgWyw5PgLYFQ/lPGyWWn8IAkGiSvCszZu0R/ILumHkrCs8jktTxai4sI
LUbLOnutyO9s7ZxslqbEpkrXeo/RQrTa5xeSg/qNyxros3ymrrgqAwYBOcsDxhK02TDO9ZZPSr+j
WrGYwmUsPepffxZCibkrtRgJAuDEXRkjYlUcrCgpse1Tp4pBLQceJpTQCphSsq8AJp6PxUTHbNEC
FxIyH/Oz6Qwi9dj/n7439AroFIg4cRS/1YjRupw6KVqToW1KsWtGnBp2YWNpsVMT+gMaYE7u12n4
I5wA/i1ESdc+MB1RDpApjC6q3ggRoiz3GJ2end5j/pjJrZHqz5MgXbzr8Fs6d+B8Da3DDzOQhC/0
p3xhRoBE6YBzfrOeua7F+dVnTCNxQUCxeqCrp2rLkjhNGVhpDxju66uFIQ+JawgUKqbQHQh6FnnE
2jp8g79vDmYjj4rbXCFyqOwKuVfiwqcsYJLy8vbPCPmfF/Pl6nCQ0S0t1dQ/93yVrYGhPDDwdror
cUfULsaozEzBy32kP2SZgBUpVUtBILm/BZjRUHewb/BpHNDKRgMP6Eu2rlrIkleL8dHNRFsmGAEE
lQ0gxwtW8HEYAstllgOsAhSYCldoPNc9UwHh+hd38QSryhetDcbXdTCo1so1Gsfeo8adtDl0+a2u
yjSX3K1MSLbig0WW9qHTv61xM/lRVG0PnmmeZLh3aZrNbN7DHkLoHLSuKddG1qzViLkQEZz94W7V
sB7F/LpWtMV92WQzA/ldTdv/6OypUENU80xK2yaDtH8otpd0PNiHtQLu5urPOfVHTXnWbrOa9QbV
O10MahLovicpUIMLxqLFXroK8tmNJWZgrYb/mVprRniJHqN/ttCKdrVkdqhg+fP0TbnHs1V3nLLF
EWv620EJkvqwwVTCr911Yy9TBVBdoTQHNZmcN4Ugl5okQRMz5Wr6YiKJ/xVO6QllhPWbBMA0Y/Cs
Nv+fcrvsYCJVlmFkL3EJqRPObe1yxWqQ2Q4pTjP17pm4OxZtSiHUDdHfHXx33MeE6vTrjrQlhjAz
UHlFVnjac1nbybzzc5ZuDFk4jj2qgUb9o4Tjt3xo4hCYpWdnFCAtrASQTcV+OPzGeu7AQv9U87UO
9+uCMbfNhTwdjZ41F9kWWO4VTHpgG0F4Vc+Y7wDAaq43TllWKEMMbIJiux/MH8FsDOQx+fGuAK9V
bqvejyKS7kavj2Q6NcpylFaqJchxzhRegxQIjqWT0itqEs6V4J6+UDvWydm0UJ74kPX1M5Dk1tgd
06gwz8iFXJNRZ03MZ3GaTRkhOZGs4Mo0eNTFK/eVhb8kktOMWNiMKY//HP/sk9KOPSy+r/JxEZrr
YvsEVQPhUYXM/4fCtewCRa46URw75cl5jOl0bA+r2Ciwa3Y1qzh+MZus11DEn+xvYyyGA9RaNEi9
ZPE+troe+iDNIMmhRvNTzywTalbibgHe7q1NbcsVfmgQ7kpJmsKXKhPXcrTgxqUSLydiXRKb7/Ai
Ti4m2Y39Tvm98m88HxeZtHIiQooVtLCA0cjzhMGMBEUSdLhkeF1hb0dMeDXOEtelI7L91LoXDWEX
FbyuzVfVBhIq1T+Wz2i8d+0sDHuqRN5D/XV5h8+qTNJEZa5UcB+JWBEw5I29bcQuF06mNWYCYcT4
V6Axdu1vYS1MqHLBOaTS84Jzmmc9lyW2AlxhG6IsLy59lx7rElhjY055bhO0hBiWmdGTfXJRPagL
2E2RF7o/iWRTF/zKTAqxJNISRHpnbX30w4vGkI5B7VS5uB5biMF+omQGakqBAr2mf4i+AKwfZtNu
Tvw+ebF9mcSy5zrIAAEDRBSasXOt4E/5WrrKg5kuZ9k34Q1bF1FVpfMWgjS34EKG8BbnswO02pWn
MCRVU7DfOrdh9jAcz/xszxJ8S1u1R/8ZZD8pr6nD/QaqIzOjlWtswBUDqwI2yhxVjIc/+94Av8mX
MpxgBJxrMZselZD90sDedN7TUHqo8Ju37cUoFrTsdwm3yardjzBwlNssonkivbzwXgiRrvXiSRT5
7WotCOyMck7Vp2gpAJ77aBDAcxYO/B/XBtTDdRNlh/0FIhJ3m97b8jw5QmhRs8WZcvPKOdFHqX/k
ltWkrWws5kr4x2g1wR3cqzKumyqbOvWnFsgp9pNi8qcC/EqyKxb89IwXNT6NuGbhIAtBvnAh9pVE
yUF3/yH4269JImDt+TFx1Dmq3MYTiHMBxxtetHqzzK2suqw94eKFREHjDZnqv/D+ws6mlFwEaxkG
iQCQIhlemLWePtJQJVHofLj1kODznoxlRKg3TGabHo1C3Gy4UPX7mlJa6gAjEFQv5LuuoRyga8+B
uSJ2/BJBaWw5V1jaZiaJVxN2YU7yLSqoMzl1YUVPNIeUfGDXUHrHkhI4zxfxLO6W4vrSsOXOpsf4
XTsiFVevZV+sVo4aSyDmmmJECur9edBv4rC6myPS1c46BbJ46qaNfOxLT2E+bfZAjV6CJdSeH4SF
fWnr7DNv6oKs5+1O8P7NQ7VS/0ccTDzQe3ingKCYscN61fZYkSmHvfUIYHCHU4BTZ9GmJWywN0N9
d1tLB61WWO7c8AhqWQQugPVisr1xS9/h+NiUwwJIIAWHxdicWKGn75QHVX29GqODur05Gs9vhyRN
bPW2FK2K0sYLxyp+aE/GPw3XmbRZA6V0OIEwp+HVXxzSzS3bzjH1MACpJJlb8zj+SSFeuJ9WN/kE
fSthPsbbEmyQHzoz/pYwOz/wMobc+moijlscAZ8RJqjA1ib6oprWU4na3W5Q54Z0vUT4EVnwS3HS
sXJLo+cnL8Fll8/OtFq+BSXTR4zzp1DX7ooZrFRnOI+uDD4YUPcUzRKFpPZrSgAY4DMwtnPRz6l+
2o93/hkuSR+JjjGAjFvRQ6sGm/12aEG2bDJnrYb6+hEUtzCdClU4mZPABQtBEK7zdI/Mu2/he7+s
ZD45L7lE10vh7sXBxt+B6ubYDORGqV0boa1VVyF5XpcfnxYb4pFn6Dxzm3KtKIBGC1sVL1H87b3G
KAEgK9wNNJ3tgbjoE1gECWX77IZt/wuzAXjzrUEHfdu8OP7LCK4r0SkKZBae9AW+g0dqqNrdKlu6
k+CH1LJWm11SdjswaMUgqg/ln+ngrO30md/mxkCN8nU9fy7prbqfndvkx+FM+eBFjN1SbxoJirm3
zQTkd5c2a53oetUhuw8IxgvILlW1H9HD8ihAORE8bKPqjcBQsu/e/q9EY/1GTpFJsesr4hQG2eWh
iPuhSC/x9GwdBFb7vKtAk1prvrRQGluLqtvRX2feWq/qHAZL5CvIwOKMlqQsSf6fb0QsAJX5Sqvc
/eAErRbjajO6dEHfEvpux5wHNI9W0zJaNZZARu3L2flDmJIyioDIgkgIqHkVGfIwXvBxgXQfjhJW
2CNPiZPbH6gcteQLpF1a4aWq/5XJnlvym35C1atJDxTNjcdEca7Q6Res2IhwR8ogmJKStE/G07pp
4ROSAHxX1m2YxGKZdtWfd2XNcTUu/7tonXLSQ8qsAYQCP01T4qm47X5xb8IFW81vdKsrP1Ftsa9u
y+tJGxs06zMI5qJPV9znI5SR8ehKVQ4Xx8r/tschquK+sGoszwnetLjwfXm4fifjZLd+dwRL5aRk
vSfYZIKf9ZimhRFIWR8LT3rbzj2DNsFUkki5uMQX76B84OUH6Gfd9Ar893p7mId/Vpu9C2gPHwqr
U+/y1T/JUI0TV6IOCEwFQppZ02hTvJLWVoi9g77R/bEnmScyoyOLaFAZ54YH/v+oPTC8IdYju1X2
oIeZuIaBTDjh083Lu4BO5SzYW7udtnFCWTRy8PtHQ8R4Mhf8PyzhzPu6vwN7+gfVyr0ZHvwJ+gU9
hYYoioHbnn4eZAdGjQ8so8ueS5Zq06MgbvQ2Mbeeob+n7Tm0fV4ht5YA08/eIvCq5dmnotg3qPZG
Fax7qpKiMdCTpgE5eMeYT0TPLk8MGl7AlSs0NiK6AngYEAQ1bBe7GivRN0aM87XWs4KzWDXJs3Rl
ZtQF7aCJW/5TW5xvFvRwTckG5RjsiNaoiUlOOvuacB90ArvTd2ubcaff5sZXWtcIeW6VQSlzEp6t
QUxn1/vRsfTSfKR/iGaVSzAprU/IzM4u/Ro5pynZV5cwFMeWf0+TFSwuVsV9CvkYapegKSiVCs3v
VsLl0A6+kbCfj1NY5QKeKG3sBCf23z+mJ/q7AXiwSY9xsqm7HzXPmYBZJhNVFiCkKOIAeo5J/YUJ
F48cngsRKIgaFci1pqv5OZ4ss0wWm5+L1L+8AD5N84rQLuEV65l5NKQDucCNFM7xoY0nKEPzDuHF
/fBT3RaCXtMDR2UJLzAro09+IW6EhoQGhrs+8ROHIKtefX7ILVWpqtTCRUqmGdXYaGqRR790XBJL
HRwazdc64yNC8I8xANjW6nUp3aSjHOs2s1xo9spQeKsa/I9IzWg4vYFxiI+di/4UtbkZTfk5omtW
0m0+84l2xXV+FTFhBdgiilIf11y+70qym6m/CD9NlGT76kmQe5VUBUFUEGCs8mYFuz9Cyk4b3fe8
PNX+ZRCcykFem2iWj6bHwXMA3mtl6u93aIVbT624uuBq3IUiSkYk30BVQNZ0Y04jwXLLj8ywfXBs
HzzVFlpA/pshbKPcczUlGKm6inXM7+/kNik2JEUMtiIq9oTNGT1mHNhfdykdARQQIcOp2L/O5bFO
Rp6yAKDrTHnGux5gVNnDQFqRdBjDNQXGr3ZuxScOPiS9Z/bsPTp0ZDtA1uvvC2IPV0iItGajvlxe
5emOoh0BGNsyhAfgVFezBX0Sr3igJk3fFyWxXaHEipS/qU1ZVexrOXaSWzMXThZpLTp9lwtSdSrg
icbFcQy1iKxxggI9X5NFBg37JfBNJGAbMKAI4WaGShBp881LE4/UXGBJF4koVU096URLmBp00ReL
sxnWy/wEZLLwXBQ+fsX/cXjrNpj2dDsqUPyH5Up5rNrJLoGfeyOxn3HTE7caY8vJHVhkUAXqQVxg
AgIAZ/qh/lk3O4DWpjKpuVCl63dhVXllI3SQiYcei4vmtqC+2UzL9rEVSritU1TBXhGbiMvCj2TE
hOEUsL+K5TdpY5cVFB7dvHYIOySIxvcOx7EOfeBoet4s61rq/maMKwxiffLgmv/uGVDj4xxn0NFb
ZPinBBUuob8nQC5FZhMms0YASyilDbAY1uCkiN3jes72YD3JuZd+kldeAqzMQ4KengJwV8Tib3Vo
COEECjjggdvxyCma3h7/E04iH8c79R/gvZmYu4vu0C/1SFBZ+xwM4IISccgXG/4v5q658mtLvZ9j
b6pHer6ounJa74bIAORkYSpndAeejqGH8a2euq98ipuzxAl1WnYmpDWH5o5BQc+mstolYfM4BZRJ
hYwofn/jquxYyFdHj3pC37PKICUSXX12LzCUxvbWtFdM6IXN3+6df2hMw3nF2yTr6emObk8lSu5P
uIz5i22jU6IbR0Sx9LKjUOMc248lFjUAPRwdHfuNZXyYlGDdJcP1Hrs5F1Hdpm0PF2bHddsH8eWK
hRz14YHDfLYg1sNhAfpP/Neb0qUdoHX2T9lbz7B6Uri1NZkfumPhdtSbUwezhlnSgYT0QCkjoQEk
5R3+jp4deNSuyP7RwUGHLi3YIRv4E/tCihJwFsTerGpPFO8vbTcMZ/oyTdOXMYQuwRX3gqKENgkl
Sx3Gw4x+3VX9Nu4IlP8VLSy5NS0MqanIRgKlc5wwJ8nrmczfmBNq4GBtMeBZovO+1RHdsSM2bbYf
Lj/ntAThTtcq5okUukipn6eAmJJ9yfPluTDHvfrUcRcbklEnQwVaAmzZhrTZtqb0NcEFrJkrKAt1
VAseoDMR3w3fkvif08R5uqcSWczGZMHYdborcc28Mumad5xY+5mg/H4BE97eNNwT1Vr/uRjCIYA2
BfSH2LH2bHzKw9JcgKGwpGVe0Q26Q1uY9zBiy4fSsbVw1iBIrjB8OjZWeVMPfQq8IVX1y2EDBMZX
8wXmjbDMIlb48PUc1q4Yzac2oL/EQyM0aBCx0iCHqTbyTTF3/cEfkQOTRb1BFRA/0Crtwa8kCER2
j8i+PqjfoGe4uMHNyWn0Hsrh05JJ+410rgPqYEvmOm/u/wHx6df2QP3cOBuPx1X6N+SLcHg34R7w
070l/B0975879KfGgnuJKxg34aptU0hcA/XDLknynD0NwBqH1B1CIiixROGaknld7yzWhQfWSvkY
FI1+whBhJFFtLowzocP/BLgFFHQjwdoB63BYHxuJ0QpUAu0jM26bTv9u/O2623jLj5ew4uCi8TmQ
KFjY2j027EAFFyKV1vDCKFodWE3TlKZrGv8ZelU9ZqklRENKI388KWQg/bPpbxXZgx5B2ugdFGLc
37zi+XTySoWF+7yxSZJNQgRMaknes3ro4Fft0jOg6hQOfs96iSNAO6xJv5Io82ekIxS/GFxfIPxD
ziLHiC0mnGXxT//1sodhY1Q27QyvbsnD1VZ3eNWAKcHnqGTKzUC+j5pDBNkupcwW6zxxSfvodhAQ
TxrV+q3D/8NgmXMyhFxuAP1vZvjh2ncUoeDDKrQ58gzOHtM/M/YFRN2CjiluEkMPH0fivQTr72SQ
2nx2M2kfNGEWOG77Dt8/9BFLhzpW2ZyC6yZTqwaulqgTIpg3Zoso6fBgyhzT8hLaHIsYNeu9Dy+O
UWAQdqW2rOGMqniHGxye8iTpHHzs2J0TOtsQ1LbBxrJ/9SEkwym2R7WgfG3W3IWAXYYRWX41uK7N
dwRK9xJMFtSGIE50Ab6+H0+jWrGqeZVOvAfFwKNWvSCskb3lTyJdlTtWZTIRvHGrinwuiktRd5Oh
FbhyFR+hGN0kvKivktsnISsDnk9bE7XvZFqVqAz0ZHbxJfSVVZ7/2nHgAWNp26q57QR20J25IYd3
D9TInjl+8XwRMLmi9JzGmKDOvkBpq3LCmo7YGYNhTjmYYUnESl/TsFZgCxzZwfjWMgNDfNGJYwY3
2yUL/pyJykiPUK9tm6/xYZxAFdku+ZqrYUZwDQilUcfC43K4GIE5b+jbzXkE6kDhxwsrYrhBI5gt
Twutx/tV7Wo9JmqQNGlPz4NvyqBWlEROrBm3Wbfz0/ZnzpROIrxSP3iPSLKACZ8mFwVgXTpytOwH
xexbLr3l5TAOhbQFu8yh1xwVnujbKunRlKDj3AaRF9Uz+zjz9QnQFIzgcoDgGjm+M7YigKy5mOkI
hMj8EZ1YLtT7w3mEn4c6HrgT6HDv/a7Fo3kZbgZJxJriKjIyPRUkQJINCc3qeiSfQqhBWny4PxaA
aNk8pDOioJPI+Xi+/8CAgHJ+hY5CJrGpxzYOKerrUOruQBFENPQgWP471oXwEoryry7RiVt80zlB
M5askFKiP3sER14ZLAS7PXczQ8onWeVaJFmInCUEi7wmqi4HYctuZFQwktePVYh3UtkatZJ2p2Gd
+sykVXxNikh/YyWJTYV6jvLTUV0GRl3bfK9/PXNkpu3wo/rZt//NnnyidnwfgSUaAGk7ZTNGfoUv
anXU+tNor3tWaH5NX3v4S0e6/ytgx5WTZUzVGgafWZ/1CNBGhUrURWXCneYuOFf+gm2wvxfy62Fs
DuD8MvDRSn2FNnqUrsCT58KJcz+lsfs03KGsvu5lNcgFcyCwA9X2bqMNZ7nKqLOp814coBhkfyIa
TXahlgs1wgcOQa8zoWcwAHZCmlJg1sf1SGcvtPfbKhuBBi609MlJ0rYt+d8Gf/B5hY1sVSDtCV4c
jHoP0fZnacF9gsqAWIFySGtohz0zBID0wpD0lxpl0ycD96lfMZjjxaCTnMgVWaF7CGyP3qSAoOQo
uOT6Q0rjKOOzdH9cqtKfNo4JmNVgJmPTaFhLJ+qnveGp5sxBUbOsMhci6yCKNjx8hHAHGF8M++f2
LLVUbET2gz81X8Mojj5pd9Fw0RDJI9yXR5zQdBey8ytev7Kl5MH7liYX0oKks7cElIxqLqMyaFzF
u6PXlSnRcQQb9B0l1ke3riEaZb2FEWCJB0X/Q7X84Z8I3xhpuuDlLcFLWgnZYtRqb2xjf9cawgNb
X/QGNjiFaBljhnAlejuISb3elZMWTu+uC/km01B+EVnt/LBxrAwhmXc1I+0HB6NR/+9Xa+p0RL7p
8s+CHrQf09cuHmPeDZzO0plbFfKzI+3h5R48HGJFi+ZfUBPyXYtVUZ4Ga6FfLl6WhLCtw1OkRx6b
YcWo1aII3VMfL9rV0sBkR/h7dir/rgaSxRXcIJnUGEIuNR1sQHpXJrFWvIfEQhAWfp7mGDCC+tGX
ptI5DXZWGK7TWcDJopqy/EXgdMnUWOgUDd+bGOC7Msc7qXyPAMKL9NvOBVNtkwaaLpEimaoTpp6H
VfmjcwdZi3OwIsZzzrpqntbqwpjviojT91rC0ZCR/s0orEa1TtleMfOKod2ek5eFE0xe4AtGI4dm
vUEjgt47gT3VU/Hd4ZDBGFi6JH0xkU51MljvRKl19PMglGh+9j+ec7Ob1vUe8zGbCM5OM+tSs5RU
4UXweZRjh2T96uJMiYlvRuwvZU/ymuL7g5XIJw5ulnCTSW4OqIxOR+zqg59qVyTKie4jmwzckfUY
yzGlsxaUO8aU3BQh61w4nH/ln7jCoIOWBgrr0FGodzjOedLL0lNxBTjjQfJvRIM1BPoYQYXM26AF
RHHeo1vHZCncgOUuYE4qir3ddy8DPfxbwGGnRmpyimUui9M+8bcyZxLLTefXs+d2eiaw7Mf12gZi
PGcqH6UjzmLDy1vVyOA/ZPoubUoht//UP364zGplyqAiarUqt4slgQzvc09DJShPq9jt5WzE3Xqa
F4x1F9j52I4/9o5Ii/dx2bAu7bfm1Qnwr8uUWEUhp+dLK43+hkDV7QAkkm4E2n0jXptWE1E7h30C
CUl8TlKD16FHxqzfOrQ08jcgPAKogoxROvT6Qe9NQfVJ3tlIF3kooqkmTu3FlemSFyT3iAw130Nc
ixdyUCtEv3xaPHFXz8vgSfKZwtEOs298Bw4TrPttSTX9K55HV8NUJ121r8PQplfNIJd190iuMlZ1
zs1ztv6LrMtbRioVKDWUZVYCdqKEJAObYaZrW83ghsDaxgrxUqd6TJAkf3GDUOuicU+kgz9qBAKi
V+dwrDMg/luG/qBvuLBsxYp7y+N2sv1BYhfY+HYaUv7csCKCE1UtebhQc8AaW1vNtiCLdx066M/l
j7Y/vm/L/+ohTKcxrYswkHpuFMjj3qIao7tL9bVmygJoI6guETM0R+HKvnY+UAxUG8sM8IAYl4Yp
FI8q6O99FKqopgb8gusxIm8mxgCcfOFnfePZ6cGPaV4O8X2GnXlF0b6mrACGRUpnO3Z7qDDik7jH
laHbeEvvkNpKaoWuSWeStJGrigEseI3gCMK5HVT39OVoLS8qR2puvB7ZrBQ6QGeOjHmyOLWY8pa/
+Ai2esDBfSqSv0zGOp2KVwZxEDRqQgG1tnUiAYydQ3j+gMRo/OXhWlDJeEqxFN8E8O42tEAxC7WZ
ARSFdsqvfkBTzFvn3xBcKsdlStRqLipaOW8bvf6stLocc4Z+dUHyl52qBF0ygoXwFf8xTsTVm0fR
qSqIchPOBDes6hRTk8q3ruLN/rJN2qdNjwNi2el4Z/sRIiWH8C/ChS42vbAwIHY4OtsxJ6Fr/k2E
ubebd62O0fXDQ99xE9xZTq5dGXdFrXqok4pNCY1CiW3QGRbmkyUNse2Q3zLCbnycQ6znI/5gL7Y8
IRj8fgcNQcB5kA8zhiVwVT2nE5TvQKHXtVWJSuSFJQ5rKDMdcSoxdeHHuXo/aAsujcRlF9EQNIKT
t880o9RJWJbXhn7CaN9cdM/VTOcBVe2mGWxQN187u9f6n+MXANmISbK7Ex6GhuA65kAnoRc8ekYK
3TDX7YQQJzVTFHSkG5giBPMYlQOHwTt+o1OaWkGygbdCxQvbUc3jdx00akVTIWkuegPY/e1t71nW
o0aiOSy2pDVQ0GvZN/m5Tg8Gw6aPF+SeUltt/oOtIOXqpuzh4mNjShYUDrFx5c4zPNkpLIM+f1LI
21Aa0GDdogVwsyLSg6aERIbDnkkZWG5/aV3ivpzs5CWzzvzDjJElftBNw7xOdRRK9qHvMyv7Mzug
fSyo2SQ4itE/ytfXz6Leh/IQbLdnFY+eoqr7v48IKaKRGKvJS3XJ1VlbpheQBfEdu6OYvd7V3aGv
owaeOAVV7B9iK0OrEFMP7Qhl2r6HAoXsmjzMvLcLi8E2tYbKqTCSDkgVtL0Qktxw/2UyvLR+bUNK
IVvXlR533uTUe8NFe0hPr8nW59yy+VHjwjhhgjpi1ei4hK5BwW0YX9lCCrI2FG2D9q63krM6eLy5
vXDxb/twICFSDHx3z2w0BxP+kQ4gcj0vIt6VWmPVAfz2NypQS1mkNu2lCs2KvypFPbA5txAEEPrs
KQVaI+CZdwl2pCFczifZdBqEJGMcjYsB70nLoFbpmjN+EPDpRYlMilOsa6LeAD81fpesRERPmocL
dA1CEOPcG4NuWRET0y2VbNwHliIuV/3In6a6K2KES1viFJDnUp8cmFJ25KCVBscKcHja/gI43oc0
80U4pj9IxYxGcSBoBAdfbc6M+0LBgTE0/nUWi1cDnLKJKWBH9a0pBHMmNeFYVCzSHt7mzrU92ljL
N49TCsrA2Eteo1P4m6OGfNTMT60bmMZyAw9FVwr1GBEQ/E/I2lxhtkggnuAUcSv3tiOJaYHmyELy
ctS2JgRYPgKnY5ro5rcAM7fH1mIstY/ieRnCpuuHwGSZE/yYMfVJpzy7uig0AGskb6YUxEQAQf99
qhEJhCjyc7OCNulCtE36kFFJKQXfpjBaK1tc+dpDWUuoOqcSc88Pebo4Gz7rDVB9BkBYdco6SCVK
/3DOXtnMe4ccEm15h26WjROG4AveJJ1WrJokxWInXZ7KHKpR7Swg4nz3Kd5v0Nd1WqljqImKiE7Z
Cs5FSEo/1pyFtJHHIOxHdQjUZTSIWJ/0h9eCZUt8zC4q9Q/IAzcVEcv1A+rYhHgY7x70T/r5dX9m
QebWA9Rc7QPEdxLYb5FVAundwpOg+Y+/7MFCfphwSo8DjB9QU+XMUCwYTK3SYhB9rEqRIEh+ZSWH
kP/YKHIumBSNLiIaqitYnXShM6nx4Gz/uTg2T2nZMsk3r+bAybUwwqftV+D8L9nYpOmDnkPhqmdM
sy8fYmsSBNt8LU+dGPwBcJrzYsIqVELzBXyWalJ2YqE57GpR24qN4BfvAiDtxb092xU3basBGI12
d7zWeBAggclGsiA8bV7toS92FGCqS/8lPbdy7GM7uD2SxK2ybOrXywB3p1G4xqXjGcvCBqfyucwo
X3Czf4mw+SDrGlcLz1zGMVbPrI9iICZ+iJX7JfwiNjA6I3OcX6U6TrAe+ta9xWqn5gtPbgGd8dVa
uIaM7yqLJbfNt0MuSE/zh6GtuhpkpAmzzVL0soNAiZ23MUe3jahbxCJNqF/Yt4L15IW131Tm31IW
abPHYoYqKBL+Ei6hcd2e63xErtSlew7s0Dqg2+L9MqB8BPBsL47LT9/fv655VSX56EXTP/iXG3ol
s+kMdtOv7Qb67klysoUxI4D35zix2UzwF8TCiEz4vkU4K/vRpihCu2E+evE6F4gwJy1Y+qQ2ClNn
luF67s4H5NxgUt+XDgocJnXgwOqWEtmtg/a4acwHEjGgeFJgfPoc1qnouZAQFoSI3aN3WcwAx2qV
IMp1v+xHd3be5pS/j6/wZ9PEpAx0k7EtzOBkCV446CKC/HotaDK1SQ+uS++7h34V/VpJ1lteUzIh
HLLvSMOtx+E4wnjvFEdZfnFO748bEa1g6bBuRi6aIyuiy0/pwjU5x1Xb9RpOWZivnlwV8jfoYaSI
RxiJHMHtfnL5M+FbTd9Oyb+fbhHfiK+30B13mu0uwTWwSFFp1JM8Y5voT62CkozrOxcv49yrGsdG
rblN8nIevk1S4YOJxQVUCuBwv2eMKcx8OQwoaaCKg4gPPxZNOpKVCVSiskAXifF0Lda2hS2tQm1B
AiomLIZZSr8w+9cUz3aajlzOMrCicHWAaEaYPm2uHJIQ89cRqo6HZc+t8r1AUbEsaeUYZnUNKGZ7
nyWhFeBxTTON4OM1jKki6c2cBi2ss1/2SOQMt0eU1Sg0xKCorGScVYZSWa40lJzCZ60g0hOo68Pb
284U3WwrnpWKuQjT66grgyy1NbawPUbRo09sogNlZV08WQLtz27bX5OSz6emt4ekH9ioB/6KtVwb
Cctml6ClzgNZ6RzNPiUihH6nTlJvqyNuqyg9hCQLfEmPtGidrkPznYl8FDqfWpcxmI4BrgegmeXT
yr+SzkauokmNvYzU4eaiuZ4aXdBEqMAIrTdYgzHdayXxfd4WvqPqCwVCqPpygG+jwGoypNePiSlo
Vug5i7JpNZYT9C9ifSYQt/uggASuqgaM6qqvUHwcVlxGSKo4+MP4gk4IU/Wl2iIGibHokrAZp0go
95FUF0plJLbeJsBChM/ZlK/LaXC57ACM9Tt0eAC+G1/79rPoY95wa+/F0R3Dg2ySSreEnICjIJ7W
EXilZy/HReOydCOvHg+7KcJFRhi7vc50kYbOgOnXA6tx1TEeMp1CKccfwDQd8QP/9+9qFOtLli9M
sphP/aFrzcjDJBEIuA1kvf0iD0rVhWTKFNTHKD4GtWrFVmHC/ip5ZTN8NqqS+/vWAuxNLx3akf0d
jSQWIOxHgFcRe3ssozIe0fHHzRYK+yaYXFLFLJpP+tT9NcNQsIlfuhtlus2iEG8SITfn9V97oRhZ
/IqrzrX9Dp6jU4yrNtmvT8TUVRJ4SdaKT6+qUFv70hy4ceyFgzcH/DX3iE8BBKCIohGwCigYrTGQ
JK4AgALxr23N+Z5Qj/d8mnkKf/WJSVA8CS0bou9Ezj2Zzybe/ZM/paxyellxjakKcDirqMdW9xls
g3OC4M1P8ScpwRt5a5tvusp4gykaTEVMIcDndtEIMb5sWZt9cYmvHhNBuAAjHnDBk0tdydoNygFK
PChlEvXIaKrINjsbaL0ilL1mNrtppC9nKTacfyRHOb0gvQfkaOSSxgGjinVGCbcE5+qC9tgETGsJ
js2zNnQKxT9SMEKcen3F3GTXPKf9U6lB+RdNwhWmAGMGmdFqjKCWVHzSHr2sEujAs5bO6kjlAuj0
ep+8zm9Q8FUFTLCA0CJFkElEWi2PsiaMOgC8yHhLj59CNaNSuWVzs5Og3aUY8b1822snhaipl9mT
RN7JZ0wFvqynzJ36N05/KcV5Ga8f/40k+TpgTGExjLGIwvpmTA4uMkIz13aeBEyYT3MMvOr4Q4zC
yv6TVZjLwVpngAOnfm5kZt2bfCz2BJOHVPLIKWAqo764RmsZ63p9MXlkW/0sP3tVrS3j2ry/Q27x
L+NMQ6AdxVmGvQB3hjPsQVXentFFcdimdcVoDY8jFZXTvqBsSW6pGG0c5i41Bp9Z35Zd26wXnMOc
t6E2/AI89Lnu+guom6HmYnwKDbvO28QP8bijRhfCvMfjTa05r0Q4AQcHuiZlfHXB/MXOsXgyoYC8
Tlr8T2ydI8AYHwSRwxI02N8YpONsj0A6kvxVedKzkHOc5ez4JMUCZhUu6OV/VYXmhx868W3CkUz4
+9KGrBjLhWy9YvzPUDoW1XRnVfqK6tID9KyFUPAGCzKuf/pnntQVJ+ZaTAtIyiithDGlDn2Vl6JO
q2RixYbxS2O34tSn14+Vm9+sFY6zpvIPCWxdBP0iDGEKAUFKwK09E/eJiA2L3BfYe13k8Ur634mK
Lar3nyuL+Qz5zz1bKR+wI26Yqv15zE6hWAzsVwVIDGBRgEGgPeX2VmPm4NiS9cr6fFGOS5RF/99I
i5ylSVCZdl08Snb0lxxJw2rcJ5KavgMO/e4Sd3jUL5fVNWDbzyHXaOx2Yasmr3eWz8kfodXpCzFe
dpoMq8GKllauUYKBVLxYPMXEQO7iybPryZ3kxU35EJ/qYs2gw4XFA/HgBTaoK1LTnOzjlux0nzTj
3EwXZwXdEX2YTFmTAKo2WlUI6qWz+asUEURwfm5CvJbn8ysR6zo8X09bccDDzy9zMPVy1mk2wCCO
g7diT5ZLTCbmeeVreNS9wFDgEbyzom3nTafnetKbHsuecDu9B3CpDKN68WzhwsHuqHqOYpnaFxat
3VDHPKP1lAsbbTx5JPbFanH7uzqwGadiqBOm14PTutVc7QWYu2NtNY/R59xyoqcgHt5sDwYzoL8X
xecUVaPG/fM1J757ZS9IRNHXh9ynSVRfdOq2/E+UuqO+dqR5zur64Eb17EHUVQNcTYVWtJ6ifVEe
EVWSPTpLD85X/Z56pIOAS4Kp1wfL+feTX2P/HA4L5oXDYipfCxqYkC7qCj1pwabB6KOi4qMw1/WZ
DSviVputOUJN3NaLnBGsYFVVelenQauuTJ2G3bdd6luKCv6IzzmtmFiakvdYagAcmyuWdxfiGwQe
xwIz379a7+M9MiVDByVkDO51mho/7V06/1MoLetMmAFqeriyRc1GAsR5A+DDHRBKd1IXEeIRhVgK
hZxvHfmFFfgopdpiU3ufczAn4tuUuryogxKOG7vjxFzDbdg2yvXgxch3zKPDxZiYcseGVTOu8fOt
6Cw/r93Ktx7+9OqOsAglmJslsMzDCS6aJO262haGrkSDjTFvVRGFXUJTy2m+i4YozBV3lTLMULDH
M7eAy6y4EnQg9Powrv6aBV3+yPDwa41X0JoOqELHFrS9MgymlGqiIGry/5QdPjlLRukUgRV0JpVp
xmTLfawDSjSrXj6Gah2hOY3CILGHPSHcz2m9624VFUbrE1oBmgZ5ig50XUx6V1XKSsOMHfpPOXR6
dJQI06W8M56UN/On3WeWDF09ehArWUR0BbEaafwv+gmEjPcbB8cVsm+zPDw6n0rff/lJuIGsv/VE
eattsIZzakutJeSR006/P9uTIzOsCTzD+XbVy8Y8xTP/v0gsxUgL/BK/uVmOo3+zmlOOVMKSHvW2
8lYXa8dYD8k2T0FiujyCYcWBVdBjQ5AVedkhUF4cpXwUkS8tNY+xW8kb92Xd1GVPZNmBCvQiukFJ
d5b+8926FHdQZRx9j75/4m0paGhMAPl/FVxKy7oV5Vzs7jbZbFl9eo+mfcqE0iaxNiHl861IRLgl
pVQUidPixFr+skwN7Bz7J2EJsvBG2EUsHhUFuvEavDe8/acl/Vtp+zXZv8Q6q7b0KCA/6yF4Yu8I
5nd19Q4H9FeKtlmkGWR1io0h6yPblLs6h0BgFMIbFg6RKvirFZrEEgYTWAZ1CgnCirfXT7f0NgIE
6er4nUvZRmJJ2Xqoh51plTgulf7YIkxT6MUmJVf7JXMhYeisgqiRLOtETrdPa5bOg4bChoFqzAsg
NFa3fAQERYhLCFEBpJNfdVjlMsXyU8XFs5vDgB84W3yp+eziT/NO3tf6eUrzsvcWNgKlIp0d9Vpu
NrG+1VWY3fPNSRWPORgxXJiPEDh/Jt7bClr0c0QSD5GaKXhXChrWz81Sl7lUbZrm2MDuDmT8xX9V
+ECAEQZ2LP3eWgNe0m6SmaQus9yeN+x9pnsU4cTYweYNXnzoN45L/bIMDN8zAx7gbzN+MsPaCN7I
aE15jGnY8ObDXp0JV6N+XH4Ux2qLB+nMIqaZobTAdjLzCEkcX1i0DJ6R2wX4c5NxjIKr5KBz8snq
0KsrPK+ib4QuKP4e+TSKz7hSgdR15eZNoxS7KEmR9Qa0uKQ8kaTEDECMZf9mebCNZNmklDstA1/J
VYRg2XUS0vSrZ9AZHYrAhEaDZmS3955uvyL38NoNp0MwsvUbjZivb+Wy5vuqTkXSjwYF1yxWmoCu
jVLoWJzKtEOR3QtOU7WYeNn0pAUzeXXNj5A4SQNlmpz6SHAGPhGE3Oj4+Vv9pgMk9xuJl0rzxeD3
DpXvXppaYqHynpimIU5RzCUGPZ8dRdIyb4TTB9zVVUjP6FFgZoqEde1u9HGJ8BrYEjTWNDjIys8K
8ETVQyGDyg4JcsGPtMywSYlMEkHa9gmNO2GitK9Ij+fcYO9hQWUTZjcyHynWbWkys8WOgqoctxbs
qT280my22aOXjxxvImgzYukk1mxLr/tMsRgGM9iU5KZXaCbOBph3rE7vOCWOjhHIQtZJwV/z6NHj
TnSYCayFYBmnBX8JsdePFV4wMM5sbc9scrf6O/d4fTMJUWr+p1dRdQimlAFzZ/laT66OwJ+vQWBl
qAIi35f8HaAsKDMJCiCcmZ1uH0jNYoLYzPFP5e5GkYEOB/VNJ4PB7C07X9BJqAQG/2Qx6P0aoCiS
28MVZ8gPtaI15KfRF3jvxFLP2hEsscrEU4f+oaICT8I2iihISx0PwAhnJPaSSn8fUTKPgiYIDhbB
mHFfOkEbS5BwvRB7v3fDZmiVTPjHcmEoI4C/RCH1paIY+hTcm0HyDh2hgLfcmeyKqtRwlFQpr+I+
nU5h0YaZ3/06pQsgjWY2vkK66nliRtCtqDnlt9HMGxZbG/la+3bELN7YGo2dum7OLN745iyazAG+
YXgrIYeDyr0PU9Hq+ts82NMJ6ZN8CyUDbenuuAbBdfuyezr/XCcqhQC4qWXcL5DU4odE2mW8RrJW
oAeKaFi1ZQoq81YALX/25etayIxSnZkQtzeRV8d9ApqQcT+HecuGNtebfM1Zn97eQ5f/CmMxKL4Y
IcN5aeBhW+VQv0/8FaCDQL0OzU43/34/Skhw3gi52t1lXqtnfcKkTnl2Dw9nPgRn+5gLTR5gmF/w
9ioYhv3Xg8QSHdLWHPVIh52zsDgZzmrVqAGK79IdbTnVgDJ/PZ5ktlLM6R+81iMBwAv7M961VHWa
VgAuq/oMVPfmurHJJWFM3kqHKegJ06eDGGemRimb7qSpNfjbRXT/yfcUXvB6b9gJht0jPAYpkyFp
DxL04gu0OFVjXOOHmawiqHHhr9vh9aTG4qy2LbDfcPAWgQCUwyfxaQKryiSlCwbG9TnPNDyHdsW7
NWW5nQYB6R9TXha82RT9AdLDxzPdOY1PikCYA3Rg4XF66EfyR9EgMQCE0JPMLrsv2ISQoC12C53m
2rBZPIaHdz9vNGSa49cZSkpdYm7CGTeZuk/bljqVyG2fkIqoDb8xroSDcWoTBjW+awGcR5FEhk3Z
wtknauP/1b4+x+2aDNEebRqpvdCs2WBcp6s9KXTrHdWZ98PDgeniEehtkHsspPydv5SGZ5MQNJlb
zex0rJSlsZ6ACMsfrz47TupUztgajJw/6i0oNExFFAXXOpN/2/3495NbXkuvncLNjvw6Ki07RgSD
hQ7vB1yn+PUh+R2JT+9apwwkUJZEV7hI0VLtKHdoTwDB9EbBs6WDpX7AWesz3VdQc7oyvLhTDZ+Z
vFEWAej/x04NIeEpOHArBDA8RDHv+cfMP/GRmTCn6pwmgNbGDM9w/E7Ecw7w/Hmg64QGyRrTlnFO
9NjOSxTTi65J7ZDdLBdsAyHDJFA0CqBP7S3qd/BWmNyfrmtIcESpw01JIPgs/dW6l01Dt42y/8gy
RN36gwQKOYPBwRx7FzqQfFlX4+nuS/2GdBcN/g2sGjGklEw/OT8VDOEAuRXfcaQIKt+EmWdMJpDi
H5UFRly6N5t09NfmQAZD5cYrYgsnCccQAQRZB0p+WOYK3J8P33D5vtcV/xXxH6xwOv1QCuqQ4XtQ
7lp8aaSYU1/i3ijjlXcHE6gshmgeNqQAV3xNU9xj9LYSd1Q3KJE/P1nF/zpuVjuJLjt49zaW1k6r
bG5nzTyMvNF/2MzHAQNx9huFibIpEiJupXvF599CVBnk+SiMouFe8/0oxeWQpCPAnQVwxOYsff0+
k10Cabp/sdmMkJt/BUcwC7gRPhKfgH9KlpFm2xLKCc8g6RzjVQQTyeOI6GyRZYA5Be967fo3O1tk
gSgnCIm4LHvqSBP+ZmOchYXLPZEHL3fWKUwO8GdCDjy5Uk7FYKSjELq+Tz5Yhx+s1CP7ND7ydyuR
DGQujtPWkibMfVfVEcUpBIhYTQck8OU/0nm7p7gkD1JTohQ+7s6zX5y3qyKO44TE/mLB2SWY1nsb
eX9I6dj8BhcYXj3pgzCjZMxqBPvBy2MihNkXRxJ4OHc/ol6fVkpDrQbkqjjq0MdFehH0wPtfFZp9
uqDSgIaSWRP4A2GdY9rHPgFSjO+bDYmz4z+CFQC0d3adqOnGiBFB2TDra+lfJZPseCtF79ajA1Nr
I8QBzxwVtoZWVmAp4TYwZtB0vJaA9xm79488PCgxb+lzc3VPZ9h3cDbSmgk1jv9kohpGSVmw3TgD
L0iO5S+yr32OmEf5NQHBrs/xE7/X+xpp+WEZeBedmDGb8Dw2g9EpoPEePRbEqsQi1fro+ScbYmJz
Gpty6QPEFR+SCH8cXvQTmnPsv7YyGW3AaBA00Bsm4nYtXGdeO34W4UfagpChcNXorOv66YgRCUy3
KcseI9N7etLc9tAR7ZQa9zaFpANnh4TKcURuvcQGpRFRYzRVCsqyeIRIej4vI/dfHbPT+NWKUK5c
mKBTKdqwO0ZmDNyLML6SyB1gKLFUY/qwGPVc3HAdbcCPFTY75EGehDlznEqTyvNZZAsswjawbMYh
fEIuTev/ZkymScqeDDJhfZiVeAcqiPx7huD4zVeIgqtsh8DJON2Chi4OezGXRDDySvbLgH/OO1YD
kxSW9tOUzE8S5aXIZHTEabELUam1N7fpAcI9HRAbgBEQAN40E/TbkApDOMywsdTwYJ0fmWtFwuqs
AP4JFV7dtSA1ARtdSKHMA2wIRp5VDzTO52EPCByDxJY3OiXhz1qUtMkX7AgyHaXNSbr5yAbNWooY
ph4cnyI24x83vEuJM/R7hyBAq0MamLhNwe0T0zuUau+DQu1GfvcTbzwEKNbzAtRcq6D1a83x0I2f
n8Q6RzY9n17Vhpz5ap95BmhFVdqNYKJ64BgEvHJaerKtkAxszhKIfi+b09sadA3erUO0gHF2lM/u
vznSU383aQIaoE2IcAShBUYJIIHMO10TsJgK0DUNwM6VqbBg8XsmKV7Cx+7Og9/baQQUEiBTjpxm
FULrS8Iln0+jtFpFybvhub+JdF7BzWmlTO25wisMHDcL7+AnFmWZHswmLBBzzGrFZjw6rqfBxDM3
UHY8aKwG+fUcaYS35y+czTOn7YXWpxZNJYrUU+/Ts7d4zLIAUma70P49QXcsd8L04xgJiISYFN7L
E9x3mKbpA4xUInkf8gKxC4FlEoLGjrPnGVMp93NUrjrkbJMTeQH3vxyrT+VUc0PeCuPjMFY07nW4
SoaCqO2nKzMfhDeiCkUHMcP5htUP8s/R5NQdbSs84cfhkRKTjIS6Fo45q0TUawI6INzSf/WlNWzW
6Oxwc1QQuZ6hcA8NMl+6MUZLUiwZTJPrR4Fqsb+M47Oq5DOdGfhL3kGShYgYT1DdKgWv5dAN7x+k
waIdJ0cWChpRgdWnJtejz5sFY5qzc3N3VdIKgTo73u57ZI2ePcXQxvMmMWA/tMwF1367YdtyfiS3
KL2OfNsmZZ636Oy+p25AE48hOyUtmrc4tdIO/+70FyY0gSwg+6v+13Tv9qU19OYTHyieZeooBRs6
ElSicwnZ0ocxJ67a7fhf03NBpzka+MRAnLkEJJRUAfrn6uec11kTdJjK7s2rtICBIOfuseVUlK+e
RWoBCZMFhvIXsIAAYE7C1mxDF1h+BCm008N1sCqmFmcR/jRwk6EKbwiLLVTc+zeCiKwEOgrY3z5f
/iqo8aeGza0Nb3LZAezl6emspeeoxJK9usGv9vaDW7x0hc/+eRkaUl8pfEmrqrX/dP0pLMeJT/NJ
+3wSOgGeShQdvEuxndx/g0DcCaQcUxHMOIlQhDyiMxHmUGxVvLNwh4BZNVPcSnGUDBF3vE1s59ZA
4BcHyN26YI+fA30Tn0MUPayTclTWX0GTDHFesUNsYocYiQEZlXrHEz4/Bz75MLA8S11/pXGKMuzC
7aZJtVmEixTSfmoknI38PAZ8dk+JP3D2K7wBRQz5Kp0QSUfOn1+6FeA9DQZkjIoc4AhdTnZdTQd8
3rjaSyR8OW78ffyA6R9/cXsfXhAKWmXBS2J7CSgPPZ22NPMM4/5nlXGPYvkgCfmLpO5jbMjzJ0w1
86WqX3loJlnvtHtH/kKhVTgBFnlweDf4r90f5tv7dfr4r/TluDYQfDV2HwonNWiAGOmbN/xPSzHk
nZXgS0PsW1mebEG3xSXoHJHI4VU5CsldnRy4KlTlTjdARurXyA77Facka9H827wN3dPexa6txhco
9dn3ctWmUqlkAh3C5y935GENdo2CAeabHFldLKJwfkDpPqsB+Auy2hviIQdzWrS+JwMj8Hu7ywwu
9COZ6Rh/P8Df3x0BYGtsXpieDj+y3s6qOFXFsScLbKQbdmduy4MtHJFiPHQt7uHXaToQIFKiY2TM
ugXfBpNqk+HIIf3Y/ocAszTURPVxiC4YMEHtHAt5GUKXr1f74c7o9So0a1YE1kxJUXtMll4lk3TA
XiPHQIUCCxPTiaa3E3i0ya6E490WsDKCSD7mrvDyC6U2mCSQAkSRkh/IJhKKHGeM9kq6PSmUlGXL
FHgBrkPoVqABFWSm7PZrc3IQnph6oasa2o2YRLH9PL6utmFj5X3RIYMkIfqPdGUUwJugnfosugoZ
xHkRGu3Dxd6If2/vHawZOcGJJjZRKVlNn1X6qbW8bPAp71nJSMVD7pw4aqo1VDPe74vOs2mMoYlW
cI4+3zk5mYC14dWle26WFsfpH0pr0w/6nuLxg8OuzJAwkX5gBuoFD4uYf3Qf3jdkM6CjpOtd3URF
D2TLXiiSR+EZ6To9Vhcz+xHBOAVgGHP4BpfCZhHuW9LWR1003BrDJjSL4/T4fEpyJOgVJ9wRQKmL
jCfdnMuhysSN3DvuZ3U4pEoXAVqaAVmGjFUP1kIDEVsHSwdvt/yA0EoZGvblG9iCc6gcrWfnHUMk
Y2d2wRPtqZ4vK3CFyTaDXCRulGMOzvRuJGbdV4OXX+Zkq+3/a7T3JawTwltO8I4Tl6ON9GOKf7/z
PTWKNMdFomnxZ+j0f3eEP01obsiyQBdLY23SXoNAAlOhS7ybNVD2BeT8Lq96u+yrizSIp+36XQsy
Mhre66UZRvMh3Zzk/KNs17oFzQn7SQoNNLTqcDzyis0LxaT+823dwUfSmOwCCw2UW1/dPBtMLTJZ
QliUho4H9Juvnu7v6ljZjrX67cBlmBDNGH/yF+vdXb3KwuLOMWZ9/MnBS2/iK100HR0M4XLrhi7V
PJT+KpbydJzwr9ZtcaqXmuvRQ9ueYedNPm/5nqc04g8AJq3kqkJNFoNHM9Kp9X0MixIeB9kQC4fm
IVjyXIuQakqASzMd8SqyOIPQ/Rl4cuiacqxG60aNOAoZt6Ea8KwryHeejF9BJ5HsY9TCtHvUFy4f
6y5IH9ltXjF12KeZQ088kkcLInzUywNX+ST4dpzZbvMzWHVI1GUmU+Zhsp2ac7eaXIzHjy0c1WWK
NKcyvwjOP3rQukZEAdymNFATwr7OTtW/nR3fMNbZbePYJZ5hAVLIReGjUbIe7oCmO+zr83fXmhiS
G/+iAcORFLVQcJQ5VP8IEncb/dg4hiJIS5Nm0QQIaKLR79f5QcPCzbjwIOW3kE7ZOvKmRSiLuwEA
9K4STCgWj4itd+zUxkOMSovX+sX+2qaRSqga4eKIWAd1Z/PYQI9vCC/Xf3BPvlrdOhO4snF1yay1
Gto7KbnWufHiN13nMfvdmleixHTkNMIjdTNGWCoG/1OBkLqmYQQA9DR1Z1m8zqaTA3WdM8nA2Ep3
ql1LI+5U/peVAs9dwLz471+Jo7EXWdyV2iUrG7VgyvaF8uQi84kYi1EuU9tWXNNWOd+Ue54Ybnm3
r+MTBV8mDO6K6k/hcRtIYsAZV/r68Kx5obxPfkVjxPZrxSVvw5KBWno7c21xgaElfGGxtu8j7A7F
sQzYZv3E+/M/47+O6mGsHKt1omVFwx2AwEAVrJne3lShsw4Bev8RLm5+1B1dIQFGXqP5Hp8kSyMJ
lEKny1hfGtsIwiROdB2X4MAMuEQntqBCiey5GRKTI/FbGa7IXFj3Wkh+zt6MVkn+fbqwkqdLW0fT
CtoHG0GUQtqxVtnGBGPqdTSEwUxlKOyt7Vbv3lPtbUogGAGYxwVefOOjywjsaEnwK/hKEkKb9nIN
dn3+MgeBRsVj1kAb0Ryp0rOTz3qrdIU2AIahCCMXzZgj/mP6KJCMEVamLlIUCNZgwbDzHOxMkMXM
x2X9Tqp6WTWPwsx3xvtSq7KF/5y25Wl/1bZdhgyMtF6Rb1nnzx4H0rkX1ag52d2l2g2gPqHaGP2B
RY8pFNtPsp8T632KnR8lL0l0CWKSGkHPMiFLkGD6ns5/IrvH4xfgD8dSkSRjgCB1kQwCxdwrZ1Op
qmwpfsel/V9qU4o+HEOjB3DvmrvZI7TVbsO9i8wgHzvTXmlmTfwxObaxETz8KHdiTJ90Lt53P24Z
Ze0q3vsQOvU0TEt1AhVOsbzeFXV8jjBAWHLwVTx/GfIeGM3nN7Wj3kqoYKStQK3buVwRRgB7yJMs
F4o3GTvbyGDanr5vXmCZqK3Vef55jvHItkifMbkIe9pry3By6n1oIkPjiePGQpzXmT4pdwYw591t
11W1H6rQXRSkGdjramr40gtzLM2sTil0oUe95eYgFfGgrBEF/Kl6sFDQ5p2D7uNCWforK4BN7ZA7
BIMzesggjElOy6W4Qz96A/1ZVD4OXVrvEQFDnqi5DSg6dvDYSnf7v3yYNJ6YqK77JipoYmGK7isU
CaHuFwnPa+yMCKo5GSmEk6GPU0kQTF3+ogUOCsd4074UGPOiEZTEwp4moAb9vdHcLuZBe2+N4UE8
BsdWKZshx6nqAJp0FHN3kp9FAwQljTqkTlIZ9Ez9VsVtjXXmGUzy8dMMoFjFbMGHuY+/91og9om9
c8UBrFKgq/NO9/08xSiSwR/9psYnNzkjOtNAw5OFRoFinby24fC/YuhknHKJTNkvqaFfQL+e9hxc
ok5qyt0blb25CIIx6eXbM5VI5+qLdezXd/lZe3WxyEjJFVeC2K5gsu3Q9P+yEVPVggv9h+0qezbe
ohVyEWkPhWPcR3wvLf5RC8bjpsXfbrniwCWy0w1WubtZV7vnSPzvYIC1/pLQodjPdW14ahUMKHfN
iUQTLrn5qolU32lKQdJVPa0tovyaEF+7B5ZBZYa/vTnWvuau83BMVk5Ltv05bmZikg8w1rLbA9hm
JS1XYhx8h9Pom+vpD1h0HmHjgHEPlL6X3EGsOZg6ICplztTGqgR2NQ62zaFoQ8KPmjIKmdoe82lP
uIoJtF0dgvQcjNDD442L4yCQImCmaJBhJ+sM//clK9+eF6eKYdBY9jF+1FIVrIoqNCQrYYS454oB
SXoETRguExBuV0etUAn6KMM6WNo3fG/rsBFyzoDXXeh/M7n3KTLFQIoIKf/hE1dvVCegWqrvXpQc
WajmoA/h4Le6c82lBLlN0DaSZ0Ujz34wL7x/SGTSAq42UmNMaquLhLl7QGhOgt2z68yO+e5T6FUn
uXfJjcpJelI9AV0eZOi9eN2E+wq9p1oxvBoSJKG0qE90x4jJzQXXL1r1z7B2nyF9ttB3EHlKYwMT
FJR0JTAP8cfZqY3huPSRJRc41CsHF2pSE+JxeO1jER99k3eh5sKcr/JrHZqHU+YD46zsNABupfTt
GZOE0gcspVe1PB7FM6cYhQrrv1nuY1XPWjN5HHHdUd/NWV441W6SBBIWMDZbEt7mWf7g5NjuVcLY
Gj0H0GRsBlx4gnjP3nXufPtAyllmA+9bmNQazGogSdI9N9Pa7b+kLTggy7d3zdcC1DlSThuiA3fK
yrrDZaOt1mNPTNVmcrR69JNeekQXXA9Cu5gwBhWjZGLiG6f9IuX9dM3unfczM7t5r1v0d3+g/ZTO
VYeI6/qmMSTTp0FAoboAxwKpxl4DrllFWXDrMvO9n1MWkW5oBMJrIRB2oBHWzzf7k+X650Q675JV
x1bNjcfxu7X1tzefYhQpCCENrbHJZxFfm5zP3rys1oNDhKlrPi499EN6OhYBuBl4+Dab4wRuceKx
WOjFOpfSrK67tug7ompxqsIreQ5bwGeY0UCo4Bh2aJA9pMj4dUMnkcssPOhlxLhFxViAfM8nqzy4
antT5QICTm0wMN91Q5xK+fnPNo3NNx1rwS9C4z8HZD9xZtTiAz2wbc/VS3RtFriao01qyMNmdIoW
adm3y0BN1Tj4/n/dwlfMi2ESB+nvjgGOQCsUJWZ8xjNm32HxjGpDEl7udw8mSsTMVthvOHpFWkMl
cq7QBZYnkpOW5//1b9zrzbKf9zbfzI+TkR1OSnLZs0li0+QcoUULBEai53KTW1gAvW4ZqFW/PkdX
HRxsD/59k91nJLDVqmUL73En3Xkz5ldNggy3Yl2Sf1adiniF2LPe2I3WMm+GG+DBbh4Z2xhnRpSs
UMBMSmg3sV5K0TEoUSoLpe2cveZlthnd1QpBgqSGHJ7YP5wBdR70o7fWLdrzldCBuqtfNtj4lvyE
5Mx8sz1J8byrPktbK9MlRZ9M5SQG9bDH25hVW7BOHvJBsbAWa8Tn2MiADQd/rlSRPZykpGpUvTU8
7TdDOHkGhf5tzyO/PB+EbX9ogxC2FiKavmQ1oAcTSV/w1QtGhCdq+BQ3rZPp/H1ymEkvimo6nJU+
dPrdwvLbk6sDEbv+xGZrRv2CnWY8HpXhRYK2Q1ueo/+D/TXwWHy671Fqmz3eXHkpW/RC6ms7Ig1K
jdQrmkdnfVP2NW+4F9bWmo3e9+b2wd3cE6xAqU45Kpai9FkDnNs2//Wma3Okc8PmSJTbMW2U8BZ9
1dDYuWIqTmkMBOOLmOD5I1sP6FCvV0AlpuTQ7/zLdvIhHG2nmHfe6zfRFkhNW1k+mRg3OHY0x5JR
0wLCFcooiWLXfFudyhoVjwlg+iONmq5zG0WJO/tvTTfT9XYzW+Xct3du6G7Ar3FXqUPPqziqo7vl
K9yw4h1+b4u7QupnIPPWYss0ZwgNID4PBEzVizB6aEd3DyIChrW27tac9BeBEYHzsn509ohmKEAH
gB5yQ+ZxylKh9Lt0kA62caWEusTkAsLV76TkE5sL0e0H3WWv90wOcjEWBprnDYyemqfE1ForWwEg
p2cT6gX4TSWqqZmXE4YJr5jdtLojeA+TBb5BN8WR7mKv9EnqIiORdngF2K0j5mLX7Ji1vCYW6BJs
TcTMAsuDHP8/cYKoRkO/4wJGB69gzGOBxaoJQby8SA35p2mwVgvoevtzFHWQ1vEs5yM/x6iw9Zp0
76rdgWC5SEq+D39CTXtIEUiV6oyYt6HiRX8vo8+Sq2SOhdjB8beFzp2T9dAckvnNZXCxe5Oxg7Be
F80HfIEVcU9uwJX0tYyW8V4mWa6TqifAQxNIxWB+n/Dn3huzT+ngmgTdCnW3eOGmjGYHuCYv3Nse
pQpUosFKsFEmK+4eq4SkZA+a61qJJCk4NPoYU/qCh2IMxxexidLF4dOa58X3vu71ydYauyRxHMjJ
DVr7VcqN0GRRht5EaVB231dbEso4pWF5HH3IXqqyqFxv2zU107N2PdGs27AG83xlHP/u7N53SfeQ
pZS72PmuIhxco2pAkpLtApPyOSN1a8kmeL/uK9o5AjJIMz0zBwkppkGpb7i9AM0AW9f2FuCGR4Ow
W9SH57Dj8TEZyTXd+ZzoA77EmZv0AvNMMZ0iFAyD+r6rDMaHdQuFobDbzA/DulRrR/zqA+o5ZF1v
u4oABEyuqghVXge2ZbetitbL1Q3rHNqw6EBk7FV4QZHUNycwobb4++14hmcF77NAxlcflrB2vXnw
u7joop2F6eO2Zw7xIYZI4BMmtfTMG+BLviBKRlaLQodaTTRVILcuuFWfY6AFscTXjdPmP+Gqi9WJ
DLwZvPK5HAPZIIk/cb2ezv4AMJ6qbLpwMf/QsXosz2DgVYsKLmy8cQS9vd6o2/a01Qihm1BUcrex
3xb+K7kan084LW2GVUM2KxG7UlKATxm+E8aVA+UHBlsq8/aAIkbYz1rNopV7VvifzisTS9ATbMLs
Owzb6BjQ7TusAmzfecY1uEuNRucsyQrjtgp+4J0E0NNuKsxVQlCbYBWXPIVX99VBeAULJohyy5LU
Xr/sc6W/uKT9/C/MHwzZBGsmITuEArhfZm+bwNNlSbRLKJXEQ4lO+CPuwosozTCVcbArF/O2G5DH
2pcRP3Mv73lS808e5kNLR2u96MuYs0/u8Yo3e0Xcd3i0O9B/iVwzageXYYnCXxyuuPDJnt8UQS1y
VfMb+73VSK8lrrpyBRs5utQ2emqHR/MCCXsmPkf9l+/0lYPdSxQTk2SP6YzjJ0z/7i4Zf31uC8tQ
sIofdhSqDOtO+PlkWeuBrlcelY+p5JPJ+XUis7IegIk9qnRbR/B1EHFQpKMziaonXBEbgDEjhXEP
PR5bzomofwItx0OE/xKDQVD9zQrEITvP0NGonvY3AFBOfUHoIRA/6e9jnjDfLl4yaknFpvzfFq/9
BjgJFuQmG9EfEoQqsGB7huOJWx4XWm2GVcQq3785bNNngAREXIbQ5rLMSy3u/UjneofrW2AWtMGH
FuaAyjTNjbXOZxvjNXDLO2VaXR2G9pt6OX2LO9fECaQzgXadJOyGVnGHD8wPirw27R1LhqPEV510
OtkR3bDsdVhJe25caOf/+TZEaJx7xmbyOlpNV8aJcY7A2rleiY/k951ySbER/X3DDAcHfWk882Wv
7zPpLvBYVcb8KywvHSUH9+TbD44FVBHuQOAirRGg7DhbcQJJ7Yd1TAqraBSvw1QQGdWJYoIruFD1
DAZcmRR2stnKaJyb4T5Xgp9rI/1NIsUNBgmXX6/lY67g3rV0R7kjJityAqUQjNZh6Gl1PEMIS2N4
5kbg0WT4fmhoixJTszTimDUrmubQ2lWvtKnexj1VTU50EonLcciEyfMwPvxSUPzaYXet/V/HLGRc
MZzzMKHJbRjsOyvMuoWlD0FiP2LKFLGM3ZsXmgL8r7c4FbyB0DBfCYdgny3qjPdX9sE44pCbjXfn
BqUd+q3ZMA5gK4f93KQUk6TQh9/efRbqh0leD6j00EoG+UKb0QMSbfgOd2haRCwBxTUHuFqEV3s4
VE3UtEtq4WexNexDdlQLXy1CXJtOMnAUgVbTO0jUo0fLwTP7DiWiScaGJBjl7+Iu4tY4hpDuqobo
jdPfSp0pX7Yd0igxLpfXqL89AxZu3iQ1X5xudvoYlenb/QGdo6DTDbDW4C4hnYV0bTPwQrRRL9OW
nb3+l2LAqQWlfkQizb5x9Q/SjsgC9q7CG00qqRuO4J/c0ijh4q+iCjjDLrQ/iEwemsR+PBhxDn+e
CCn1Sin7r5B+rn3xlnABm9INJu26ZJSgwh8+E+cPOufBw4fyG9Fpqgo9nE4GoJnyi99TTgnJBwzR
OmW8zy1YAhEV9e7HgEanvyH2t3KYz/FX2C7Q2xsI9oJhzIJTof0lW5kcMt5MniUSL+L338/ffBGL
hhoLA+YlGIeLWYho/aYuo/zM2T8a2yYvH5ihM98VWrwgBsMO8ci0GomGUdFj3tTsU2Dhe2DaZl1Q
XVysasTWL69oNwbM/DcGRrs9yzhDE/2fu/MUyxSTPyOn62MNr65ragSpsRxK4cTlurC5DrEQBAv5
QMyhdx2QQEAZnK5nZgZbfHK5qxIx6ERxLmXa8bS6eQi3gDg2X076+yp2IZ9Iw3sDFfkgCx0l/4Ja
UaTUjz0IJb3W+jWZ0WjwSUIbNuzwzfBYq+6GdzQM0DqmdSJqXEvpHaBnyYtsaZOAhbxLXuwqJltq
LPDy4ixm9Bybe46FbzD3SrCOP3Zi4xI1NpYRVhCdbvgD269fB2gLxdIVzjviyKec/EFbwWBOEC0m
dPyVjNV3SxuRBtPt5W1R9pY0rNY/PguoxvIMKbhnL22mcTdieoEycIl7pZlLMCIR41T34UPfFbjr
veaSfxG+jfRYjbJBxtu6ezcGW37Z0asKH55Wj/XSimkCXKTl5a3d1u06HIbSOZJuN/X1oi2xn0iQ
2gnbai3FXAb++t3sB4/yY8eTG9zlMNOd9+c2mZLbm/z/Ia+MdFYN6N8tKqKLc9NjBcNbDfyMOEb7
amdyYqPH12VCPbJlR8gJEWAE18nsUotEoHT8oqbExGYcphVBbvHAw/TRWPn8WlMcoRL+tTLR2byX
m+ZSi6dOZN0UJR0fwERmrbUb9RbvxW998HQR89rKQDR6J+fPwCymyFpIhrHfE5N8eE5vxRV0BMg7
hbwcYYu2Rv7XprXP60OBJL1HyuMB6IeoL6334d56U2wn6Xi1PJhmPel/8CDAksPGi7JGeqXJ9aOV
Umjte3mSQnD/dbveZB4dOx5JrIYQjX8dScN+xKmBZXgLnkPKygz3K59yoAef+W602YTBxqKwtf5G
xuUEadWgcf2TVTnGB/RMdmqPf6kTsAa4GAVDZ+a5hbuQ0ZpckL/tbVM/HV2ZSJXvmIglTsIYzUAU
syfJOqPdyZiN6h+sJLmQVj71QhKRiAcibH9fNtHncuQrcZI+E+Mpz74Y0CKdc6mlo0XY9yNttnbH
UucelfrQ2fpV6UncQUy3dMGe5LmvSL3123QCviSIds2lBT4aLRMv0q7HkjwnUS3CYEjyUwLgxH4Z
Qae51w3PqEgi04ZSN7VYE0+vk1Lq3NARSA40PU26+gQfRLMJ1q1zqT5JZMcs1Jg5wHnhfeFnyyMF
LuwttHyvyRO+nYTBUA2LsJxbyi+MZ0zKVhDIxvGW0/4GRp2LcGrc7q7ddquksklEue/LHJlQCmRn
tsslwxl6ORXinqhR7I4s0R/Vr6BwCK92vUS2jCZO+ataWUZE/BI1xVemQO8AVfFbi1LpNtT6MW7C
+O+rEAGkyf4KoZafAfnvwk1/FPFV9wC18gC1bTFm/FI4emKu1Onb78hVezsudEELhDCts7+rUHip
gZ/5a+iHhCyg+4kKr9bn/FM8UbKh/AEMr0xNWKb0rAFqu0Vu9koWJtYx9VDXu0L06aaaKxseWZZf
l39SK2UQf7JL6gnHjzDZAq2gyYSE3ZjeUgUgzoW25joakEDGj/illzH8bJDghdaPFqBvfFaL6K7w
hOYNvErMPgTIKv64yty068lvjiRWSSrYBm2s+HC9k1IDTkLbZxFJrq9SRP512JWWjHlS/rX56Zaj
VaX+2i7VYM1Hr2pscXY2YuczHRHx0IgEhQgXx250GUV3uy4O5Yof6yQUvy/IvU4i74va/KpjdZL5
HQVbva1Ya2q58VePFlGjeCWIUjdNVPJ6UiXfrGDQ90HSBx1qJz9KkIhkukRHrVIPGQ2a4p/VMPnR
pHGp2s7rIDFKGcSPU7NrJZ75cL+ohY5qZb+a6sEPS2VFMHH5a+SIIVr05GMzpreNI0Bu5htF3OTN
Z1oHvNFTdlY/6zQHkHb71tjP+wPiUiJADh5J8Q3Jb4s/mHAAzz87//F6VFNqIc6yi0+V8q98yKtg
hIhmjLQAAZgGZjxUaqr7g59Wt+l2me2Rx5nmAy/+AqqBI+zOL0dVrYnt2r0uZKYDN+3ZYcbjeGVd
60kLWqxVBpBFb3vjI2t3N8O3IhIFSEAZ1TKweQBmGiswXQXw+0DsaalABAQp4au3PusaBRlVr5dk
A8xdZnuVOdmo6ANpJeLglZUfRebd/li/ZWL2dFM/GeTxeOSeTmJ7dUqT4jWmYXkYHRHPWOeNv3B2
hpN/RmiAmYFu7gx5G2+4ySOWFvB33qV6QhhFmhqSu6YlXTPpuZ9wVt7h2nLRN8gIbbg4NmjRFRb0
N+ubtXHEW6ZwLWKUzRvaKXR0pQj57XExhTYIEkrVsMdTeCFIaZPQLj3Pgyp90FE6QZXzJMQPNV+m
PHC+9Sr+UtBkDEZf6QRW6pLuxAQGuRPRkbtTyt8IADT0T9zE+jBM3bIVTbI6NLIJgd7OtAlcVCvI
BoXfMEL6w+vtcBeDw2biF2djQ6VSvR4WQZOw9/UxI7+ul6hKXaEAqsmcvI/pIsmt65xwVQBhF5dw
KEj7o97kttKdTI/xrziphIErRR0GmbXS62DM5Rjc9w+cZbqcddbB9S4kNeEABP5/6m4RXreScGE+
ZDwuLUGUMbkUK5mcL09yb5JZ92zJjhHoA1pdQUFZHScokxydtRvKBDN9b80cjNV5QaQuV/jRgLk4
YEztbnPsfTzIPQWTUxv4e+sWE9I7sDulBhU+jsr3Ku5cakpY+bGRQBasmdKicJ3q0U8CwmR2DCWX
sMwuEBfOVNAhgJO5y6ZhvBP3Fj9+W/EIVYAzX5igxIEWtpiUvx5jmekldoete6gP+F41pc5IkjeU
Iu9UaRBQLxh9CsE7KC0IWHAuazY/HKDlCoCqscdJ81PdcEsMntPUYBJCnv/88PQuil9w3T/rsRnN
TOHzHUg9ppg9HKA05oMyIakFg6y3VcjNym6AUpNwScizGIXm6I8RamUIaivmzH9lCUEImG13XkxU
0LYpPlg0s6Nmi4KZPVR+Qti5ikngE3pABqewrQ0rcgLe2bVeTS91i8fmfKAB+HEJSORGYLoYqiO+
opougH+X9UkpySHXqnfxVf9uVCgfeSYZa9fUC9aJ2VvRqIuoyLXCRMSxp1lpL8CmrDPQ+8vLAl6S
gkeUKghVQ8tjyoDBRFWe2OeBQdUo7NH8Np2Ma3TSYkAfDWrez6Vmorlif+88ePL5uM9ScYgfxUUK
Mqp1LBJLhe6Oo8m1BRLet5fHKB2aGb50Jtxt3hNIT18DZjrChoQPMU8Lj1BEekBNG3Q7bNq/lD8B
ORY1Wdv0zZRbnft/vluOhbOc2CSZ0nCm74gJt9h8cy4Eock2HD6IgWEKMPylTpvFmk1CzsxEW3OY
StA2ox+GCMbt3RzqQTzWs18LZse3nqE0hZqBDQq0j3IE3x3yjYHL4yCQEgEGNVp+xhPc5kdm58pQ
yuMYYujYL/Lj1nR96y/fqt0lzwUzBbTC3piQn1AF6uNdB71IBalOAAbkUDbBBJ7uzX6u5/tYJAGA
Z4wte0e+92vdWokpu/bEF2zIp22R2KNmj2IDFo16f+n910Q6ZMPDH4bNDhbuo4KHCODbZ0saUF4R
ElJEH19xj1gQFoOJHk2iPtr2lU/yYshL77F03ElfsUOiZ9FERwnAPYIRQzvSUEHUpWD4Zzhk6joE
71Xz5QDxwdv1NDw6C7d4MFTE26QqJv7KFa0hhOvk7OlOBqKv7aR3A1F6BxHre5/3v0QDTfN+iWCv
qL8j3a0Yl2V39NABIcYcJDf6BZ68FmmcpYEbT3B25GNItlOr77r/Ey62ulWI3+gTUkPVx1rGstf3
H2T9Di9aFbRQ12dDlJO+6H+uzJkRbVDQrmVZOI1D7mWb4KBr3usO6HY7p0BnzufGN95ffb8dV0K/
TcVaEi538LDlOq3DOGq79Gq3oEkJi4QllUafKLhbGTo4QAy0u4NKwVKMCX38wNW4Ei7cL0qU2wIX
eHfBDlm7S6RGcKXwQmRqoonHvjXkORbNaozHgjLCRfRvV+606QGcqidY/RadmbwykLj8ZzIptu/g
zLVVa+u49wp4De3W4IlFVHKJEmtwomgSVsF3DkJPViKHoizcm5VBiqX56e39IYI9rXa9dMe5Zg3J
3hzcegiLaqkWcoHbrMAqXjBW1mds7v3gZR9nv95KR3sYQ79ipAM7pyazvAPhGRRLiKUH/WtlGwKJ
qtMDnTOyqcsY8dNabFMAvKuNcqlc42/JXra7pVRLg4O8TFu5iJCPB93Ocahdp20/ycQZQyXg62Z8
L20Zodxn43/tNsctXnamMYDxtotxRyg03i/pZ3NDqRNfwAdv4a5hJYiKS7dfvY0jMtKrm20V1jWW
au6Q7SEEIEdBUui2wSXwhuNGfxN1ZS1xSwODyC7RK78x/+WBHacjlX8INmt/dxh4PVvBzTsyfw0O
s+BZNaLael9x+z6hbxFImMosmCFRzjMw1AaZaR24W2r2SHZr4gg0fd5UstyvpOEWEUIUhFNnG+19
XNjBIIFOU0XPDf1noKjvF+w7jBnDWoo5ihkgJo4ResIhld8Trhm+W+/hKrpT3Fz9bAvxqMKrLcoQ
VQdnWOQhqD6v3lOxaX/P7vdALCWuq3WMnvQCek4N8tDOewqXEcobYANOJj/3mteAGYiVv1+5S9FL
QrdHpDNfl72Pny11+qA0WFUCDvsOa5LVgurMclvIhmjRsXKc/mYJbJ9BVmnyaLWbApMyL79R5wqH
D32/oGkSqn+xThqPYEzRt6tEjxF9i+0PLgwYQhLmW/6e2Aw5Tx9ujpJfKIwrQm/aO1ypZuQV/I4p
Rs3dic1H48QGQI541lEvn0uYxvmV2Xn/sfvZEmu3/wFND4NHBAQN4dNLOH2cQkpDgDlT6awDA03F
mVmfbnvAmLRUyDKd0nL9xAOEHunItOmaI19S0KdgA68KI7t/YnWonydC9VN4MQ8RcFmWI72UjWli
zKNxc3c7B/aLQ3OJhuLGAD3TRmcTf9RgIttWZsUJbq7Rrxu1Bndq+xrPy81iLGuPqVxL0pjexjg3
JgiQhs/MB1/3A0QGNCtLUOIUCc2X2GH7bP59sEADG1ZPehXRCSiZ0O6UsuNQ8rCZTqnPGSMGhVOh
12wQ19XOAPjh0QxR/NjG7JlNJc7RcvPJYaGuyAGQVwevUIND/VARqoeTp1FahM+E1PObKeDjnBn+
Ta1eHMWe5xVjW2ZimNCMQVjv5q2mTMLMRjvPn6EG+bX+DVL4pfjs+MpIBMLd/8jen8JFtLszGlrA
wwXikJ7n98L/RIE8EO7wKEqP8I7wrSkIsQSDt7CE87A87xsATH6Kfq6RG7qMuAsGKVkkjW3aWuUB
8Sgowe/X52gNLbBLUgd6JIP0YVXI6xKYKi2Z4vZU+s6CQth2StIrUv5FlkijBiUNIqwpv/FBPk7U
Mu9ogyfQ8Ymjt+qws6aXNuNA7vRTmmf3qkw8il2uwEbnWDguAwC+Pvm7fd1WR0ep+jtcPDxQaJOP
dTQ2pEE5MHLhetWSRLC7E+jI8j99MyKtwFpLKka0qJ1WLY2mMNk7tcKHlMpoznu9h1o/T9eyBLzd
ZfhmqKfFkU11NZmngcJCrJL+KDLYKXXudpjxqEeWdj7LR4QMJYTZMFkQWBvfpu7IVOWzQIksyWVK
aE9aBvWrkppxj2fAioz9duxrRR6y0+EoSSYsAgCLvsxuDD3AmkcfPUDqacyfVYheb4Inj4BnhDdV
lisU+EjRZP8isX7XTDQSK6QLanVj2/i007fOwCNQoDptY6znIfDre8ekiqLxbgJNwOok1bSAQ/Fa
qJIj1QAHf7x3EqA10SeIE98POGn6nKLtgfyKK7vsAJSZIk9OXZNDFlmnPQjLUBac2YZHLbzSmjM5
CJIzxH5GvQW11/YxYyl0uqTXZ0AQ+FdBKcPRwy63yU3hq+kkYXkmltB/Bn9v7i+xLfb/QfFqmpi1
JzxF/wTpHID6mCkzf0vHx7QLeQ+a7zTGrdhw4oElMe3nuxb0SOgRZpNh+zI09oVtgStQtz44Njsx
hfWvaMpnIKuu1vvd91SftzcDGZy7S5bNPq5YBYz9Ga2nzA1r8lwmIsng/YuEIVqsY6PkJ9axmXX7
/0twPHJksSalSf8i1rFU1gC8EVlQNFQJFi2Vm3Bq7NGYWMXPjo/2Te2pDkLBw/5bhud2BJUUD7C7
0AStJRYkHu24CsqqQE2wNwZ1gBkScVOV6CE+7w+lztE4cjy6BeyqqB4+yaZu7ryE6B4xoMJhUAXp
36jll/WEN5QlJFKdB8i2N6bWQlIRHy1TPsKG1+xV/rx98IueVdHtSRIu/boPHUNSsKh7hFNzs+6j
Qi8F6U8E6v8zxL1XqU5LA+FDpgswN0jK+Di2nZGJHkITHmfYWrL9Xf3zbthMLJR7iGQtGSVTvyKs
ak/ITTSzXc/hsP0NG9eth/lIy3F7PkKl6Yfd8TeQVYa9+YcawjgKbSPdoXOhyN65Q57UjwjZHlnV
yKLwbitRfTJcdndiXXxu2yysmu6YAlrnE7MnevWypgif2aZejIyZrF+gzFxlH6dvQhZB1/3sQttN
mm+MetA=
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
