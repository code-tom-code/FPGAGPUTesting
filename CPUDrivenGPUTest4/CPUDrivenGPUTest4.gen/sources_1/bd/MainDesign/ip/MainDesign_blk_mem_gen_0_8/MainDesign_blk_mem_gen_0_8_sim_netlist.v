// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:52:03 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_blk_mem_gen_0_8/MainDesign_blk_mem_gen_0_8_sim_netlist.v
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
Hsbla5ZSkt4d
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
