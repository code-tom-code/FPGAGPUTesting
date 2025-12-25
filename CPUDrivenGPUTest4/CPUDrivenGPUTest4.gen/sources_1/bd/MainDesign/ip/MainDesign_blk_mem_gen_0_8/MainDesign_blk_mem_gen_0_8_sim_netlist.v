// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:41 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_8/MainDesign_blk_mem_gen_0_8_sim_netlist.v
// Design      : MainDesign_blk_mem_gen_0_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_blk_mem_gen_0_8,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_blk_mem_gen_0_8
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
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
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     0.806555 mW" *) 
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
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_blk_mem_gen_0_8_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
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
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21840)
`pragma protect data_block
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
e0ApWOFX7JP5
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
