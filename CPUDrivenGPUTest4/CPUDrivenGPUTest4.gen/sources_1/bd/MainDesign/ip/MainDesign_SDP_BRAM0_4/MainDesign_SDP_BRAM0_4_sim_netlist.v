// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_4 -prefix
//               MainDesign_SDP_BRAM0_4_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_4
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
  MainDesign_SDP_BRAM0_4_blk_mem_gen_v8_4_12 U0
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
mxQ1kdc=
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
