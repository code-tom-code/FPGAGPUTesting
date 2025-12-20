// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_SDP_BRAM0_5 -prefix
//               MainDesign_SDP_BRAM0_5_ MainDesign_SDP_BRAM0_1_sim_netlist.v
// Design      : MainDesign_SDP_BRAM0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_SDP_BRAM0_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_SDP_BRAM0_5
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
  MainDesign_SDP_BRAM0_5_blk_mem_gen_v8_4_12 U0
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
LOECqvg=
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
