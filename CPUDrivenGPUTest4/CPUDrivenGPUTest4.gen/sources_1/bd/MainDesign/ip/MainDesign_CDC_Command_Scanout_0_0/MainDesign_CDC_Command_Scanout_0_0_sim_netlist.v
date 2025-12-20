// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:48:58 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_Command_Scanout_0_0/MainDesign_CDC_Command_Scanout_0_0_sim_netlist.v
// Design      : MainDesign_CDC_Command_Scanout_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "CDC_Command_Scanout,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_CDC_Command_Scanout_0_0
   (cmd_clk,
    CMD_VSync,
    CMD_RenderTargetBaseAddr,
    CMD_ScanEnable,
    CMD_InvertOutputColor,
    CMD_OutputColorChannels,
    scanout_clk,
    SCANOUT_VSync,
    SCANOUT_RenderTargetBaseAddr,
    SCANOUT_ScanEnable,
    SCANOUT_InvertOutputColor,
    SCANOUT_OutputColorChannels);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 cmd_clk CLK" *) (* x_interface_mode = "slave cmd_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input cmd_clk;
  output CMD_VSync;
  input [29:0]CMD_RenderTargetBaseAddr;
  input CMD_ScanEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 scanout_clk CLK" *) (* x_interface_mode = "slave scanout_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0" *) input scanout_clk;
  input SCANOUT_VSync;
  output [29:0]SCANOUT_RenderTargetBaseAddr;
  output SCANOUT_ScanEnable;
  output SCANOUT_InvertOutputColor;
  output [8:0]SCANOUT_OutputColorChannels;

  wire CMD_InvertOutputColor;
  wire [8:0]CMD_OutputColorChannels;
  wire [29:0]CMD_RenderTargetBaseAddr;
  wire CMD_ScanEnable;
  wire CMD_VSync;
  wire SCANOUT_InvertOutputColor;
  wire [8:0]SCANOUT_OutputColorChannels;
  wire [29:0]SCANOUT_RenderTargetBaseAddr;
  wire SCANOUT_ScanEnable;
  wire SCANOUT_VSync;
  wire cmd_clk;
  wire scanout_clk;

  MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout U0
       (.CMD_InvertOutputColor(CMD_InvertOutputColor),
        .CMD_OutputColorChannels(CMD_OutputColorChannels),
        .CMD_RenderTargetBaseAddr(CMD_RenderTargetBaseAddr),
        .CMD_ScanEnable(CMD_ScanEnable),
        .CMD_VSync(CMD_VSync),
        .SCANOUT_InvertOutputColor(SCANOUT_InvertOutputColor),
        .SCANOUT_OutputColorChannels(SCANOUT_OutputColorChannels),
        .SCANOUT_RenderTargetBaseAddr(SCANOUT_RenderTargetBaseAddr),
        .SCANOUT_ScanEnable(SCANOUT_ScanEnable),
        .SCANOUT_VSync(SCANOUT_VSync),
        .cmd_clk(cmd_clk),
        .scanout_clk(scanout_clk));
endmodule

(* ORIG_REF_NAME = "CDC_Command_Scanout" *) 
module MainDesign_CDC_Command_Scanout_0_0_CDC_Command_Scanout
   (CMD_VSync,
    SCANOUT_ScanEnable,
    SCANOUT_RenderTargetBaseAddr,
    SCANOUT_InvertOutputColor,
    SCANOUT_OutputColorChannels,
    cmd_clk,
    scanout_clk,
    SCANOUT_VSync,
    CMD_RenderTargetBaseAddr,
    CMD_ScanEnable,
    CMD_InvertOutputColor,
    CMD_OutputColorChannels);
  output CMD_VSync;
  output SCANOUT_ScanEnable;
  output [29:0]SCANOUT_RenderTargetBaseAddr;
  output SCANOUT_InvertOutputColor;
  output [8:0]SCANOUT_OutputColorChannels;
  input cmd_clk;
  input scanout_clk;
  input SCANOUT_VSync;
  input [29:0]CMD_RenderTargetBaseAddr;
  input CMD_ScanEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;

  wire CMD_InvertOutputColor;
  wire [8:0]CMD_OutputColorChannels;
  wire [29:0]CMD_RenderTargetBaseAddr;
  wire CMD_ScanEnable;
  wire \CMD_SendState0_reg[InvertOutputColor]__0 ;
  wire [8:0]\CMD_SendState0_reg[OutputColorChannels] ;
  wire [29:0]\CMD_SendState0_reg[RenderTargetBaseAddr] ;
  wire \CMD_SendState0_reg[ScanEnable]__0 ;
  wire \CMD_SendState1_reg[InvertOutputColor]__0 ;
  wire [8:0]\CMD_SendState1_reg[OutputColorChannels] ;
  wire [29:0]\CMD_SendState1_reg[RenderTargetBaseAddr] ;
  wire \CMD_SendState1_reg[ScanEnable]__0 ;
  wire \CMD_SendState2_reg[InvertOutputColor_n_0_] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][0] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][1] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][2] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][3] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][4] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][5] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][6] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][7] ;
  wire \CMD_SendState2_reg[OutputColorChannels_n_0_][8] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8] ;
  wire \CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9] ;
  wire \CMD_SendState2_reg[ScanEnable_n_0_] ;
  wire CMD_VSync;
  wire SCANOUT_InvertOutputColor;
  wire [8:0]SCANOUT_OutputColorChannels;
  wire [29:0]SCANOUT_RenderTargetBaseAddr;
  wire SCANOUT_ScanEnable;
  wire SCANOUT_VSync;
  wire VSync_Signal_Pipeline0;
  wire VSync_Signal_Pipeline2_reg_srl2_n_0;
  wire cmd_clk;
  wire scanout_clk;

  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[InvertOutputColor] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_InvertOutputColor),
        .Q(\CMD_SendState0_reg[InvertOutputColor]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[0]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[1]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[2]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[3]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[4]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[5]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[6]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[7]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[OutputColorChannels][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_OutputColorChannels[8]),
        .Q(\CMD_SendState0_reg[OutputColorChannels] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[0]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][10] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[10]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][11] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[11]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][12] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[12]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][13] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[13]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][14] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[14]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][15] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[15]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][16] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[16]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][17] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[17]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][18] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[18]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][19] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[19]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[1]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][20] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[20]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][21] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[21]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][22] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[22]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][23] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[23]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][24] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[24]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][25] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[25]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][26] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[26]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][27] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[27]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][28] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[28]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][29] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[29]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[2]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[3]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[4]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[5]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[6]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[7]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[8]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[RenderTargetBaseAddr][9] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_RenderTargetBaseAddr[9]),
        .Q(\CMD_SendState0_reg[RenderTargetBaseAddr] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState0_reg[ScanEnable] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(CMD_ScanEnable),
        .Q(\CMD_SendState0_reg[ScanEnable]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[InvertOutputColor] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[InvertOutputColor]__0 ),
        .Q(\CMD_SendState1_reg[InvertOutputColor]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [0]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [1]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [2]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [3]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [4]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [5]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [6]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [7]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[OutputColorChannels][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[OutputColorChannels] [8]),
        .Q(\CMD_SendState1_reg[OutputColorChannels] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [0]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][10] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [10]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][11] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [11]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][12] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [12]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][13] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [13]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][14] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [14]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][15] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [15]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][16] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [16]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][17] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [17]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][18] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [18]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][19] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [19]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [1]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][20] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [20]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][21] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [21]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][22] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [22]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][23] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [23]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][24] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [24]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][25] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [25]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][26] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [26]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][27] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [27]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][28] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [28]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][29] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [29]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [2]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [3]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [4]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [5]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [6]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [7]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [8]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[RenderTargetBaseAddr][9] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[RenderTargetBaseAddr] [9]),
        .Q(\CMD_SendState1_reg[RenderTargetBaseAddr] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState1_reg[ScanEnable] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState0_reg[ScanEnable]__0 ),
        .Q(\CMD_SendState1_reg[ScanEnable]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[InvertOutputColor] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[InvertOutputColor]__0 ),
        .Q(\CMD_SendState2_reg[InvertOutputColor_n_0_] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [0]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [1]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [2]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [3]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [4]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [5]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [6]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [7]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[OutputColorChannels][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[OutputColorChannels] [8]),
        .Q(\CMD_SendState2_reg[OutputColorChannels_n_0_][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][0] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [0]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][10] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [10]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][11] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [11]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][12] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [12]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][13] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [13]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][14] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [14]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][15] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [15]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][16] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [16]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][17] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [17]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][18] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [18]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][19] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [19]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][1] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [1]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][20] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [20]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][21] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [21]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][22] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [22]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][23] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [23]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][24] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [24]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][25] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [25]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][26] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [26]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][27] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [27]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][28] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [28]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][29] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [29]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][2] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [2]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][3] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [3]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][4] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [4]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][5] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [5]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][6] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [6]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][7] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [7]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][8] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [8]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[RenderTargetBaseAddr][9] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[RenderTargetBaseAddr] [9]),
        .Q(\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \CMD_SendState2_reg[ScanEnable] 
       (.C(cmd_clk),
        .CE(1'b1),
        .D(\CMD_SendState1_reg[ScanEnable]__0 ),
        .Q(\CMD_SendState2_reg[ScanEnable_n_0_] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    CMD_VSync_reg
       (.C(cmd_clk),
        .CE(1'b1),
        .D(VSync_Signal_Pipeline2_reg_srl2_n_0),
        .Q(CMD_VSync),
        .R(1'b0));
  (* srl_name = "\\U0/VSync_Signal_Pipeline2_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    VSync_Signal_Pipeline2_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(cmd_clk),
        .D(VSync_Signal_Pipeline0),
        .Q(VSync_Signal_Pipeline2_reg_srl2_n_0));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2 cdcInvertOutputColorLogic
       (.dest_clk(scanout_clk),
        .dest_out(SCANOUT_InvertOutputColor),
        .src_clk(cmd_clk),
        .src_in(\CMD_SendState2_reg[InvertOutputColor_n_0_] ));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "9" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1 cdcOutputColorChannelsLogicVector
       (.dest_clk(scanout_clk),
        .dest_out(SCANOUT_OutputColorChannels),
        .src_clk(cmd_clk),
        .src_in({\CMD_SendState2_reg[OutputColorChannels_n_0_][8] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][7] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][6] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][5] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][4] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][3] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][2] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][1] ,\CMD_SendState2_reg[OutputColorChannels_n_0_][0] }));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* WIDTH = "30" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single cdcRenderTargetBaseAddrLogicVector
       (.dest_clk(scanout_clk),
        .dest_out(SCANOUT_RenderTargetBaseAddr),
        .src_clk(cmd_clk),
        .src_in({\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][29] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][28] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][27] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][26] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][25] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][24] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][23] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][22] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][21] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][20] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][19] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][18] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][17] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][16] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][15] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][14] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][13] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][12] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][11] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][10] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][9] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][8] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][7] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][6] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][5] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][4] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][3] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][2] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][1] ,\CMD_SendState2_reg[RenderTargetBaseAddr_n_0_][0] }));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1 cdcScanEnableLogic
       (.dest_clk(scanout_clk),
        .dest_out(SCANOUT_ScanEnable),
        .src_clk(cmd_clk),
        .src_in(\CMD_SendState2_reg[ScanEnable_n_0_] ));
  (* DEST_SYNC_FF = "4" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "1" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single cdcVSyncLogic
       (.dest_clk(cmd_clk),
        .dest_out(VSync_Signal_Pipeline0),
        .src_clk(scanout_clk),
        .src_in(SCANOUT_VSync));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_array_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* WIDTH = "30" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) 
(* xpm_cdc = "ARRAY_SINGLE" *) 
module MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input [29:0]src_in;
  input dest_clk;
  output [29:0]dest_out;

  wire [29:0]async_path_bit;
  wire dest_clk;
  wire src_clk;
  wire [29:0]src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [29:0]\syncstages_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [29:0]\syncstages_ff[1] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [29:0]\syncstages_ff[2] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [29:0]\syncstages_ff[3] ;

  assign dest_out[29:0] = \syncstages_ff[3] ;
  FDRE \src_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[0]),
        .Q(async_path_bit[0]),
        .R(1'b0));
  FDRE \src_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[10]),
        .Q(async_path_bit[10]),
        .R(1'b0));
  FDRE \src_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[11]),
        .Q(async_path_bit[11]),
        .R(1'b0));
  FDRE \src_ff_reg[12] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[12]),
        .Q(async_path_bit[12]),
        .R(1'b0));
  FDRE \src_ff_reg[13] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[13]),
        .Q(async_path_bit[13]),
        .R(1'b0));
  FDRE \src_ff_reg[14] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[14]),
        .Q(async_path_bit[14]),
        .R(1'b0));
  FDRE \src_ff_reg[15] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[15]),
        .Q(async_path_bit[15]),
        .R(1'b0));
  FDRE \src_ff_reg[16] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[16]),
        .Q(async_path_bit[16]),
        .R(1'b0));
  FDRE \src_ff_reg[17] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[17]),
        .Q(async_path_bit[17]),
        .R(1'b0));
  FDRE \src_ff_reg[18] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[18]),
        .Q(async_path_bit[18]),
        .R(1'b0));
  FDRE \src_ff_reg[19] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[19]),
        .Q(async_path_bit[19]),
        .R(1'b0));
  FDRE \src_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[1]),
        .Q(async_path_bit[1]),
        .R(1'b0));
  FDRE \src_ff_reg[20] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[20]),
        .Q(async_path_bit[20]),
        .R(1'b0));
  FDRE \src_ff_reg[21] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[21]),
        .Q(async_path_bit[21]),
        .R(1'b0));
  FDRE \src_ff_reg[22] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[22]),
        .Q(async_path_bit[22]),
        .R(1'b0));
  FDRE \src_ff_reg[23] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[23]),
        .Q(async_path_bit[23]),
        .R(1'b0));
  FDRE \src_ff_reg[24] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[24]),
        .Q(async_path_bit[24]),
        .R(1'b0));
  FDRE \src_ff_reg[25] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[25]),
        .Q(async_path_bit[25]),
        .R(1'b0));
  FDRE \src_ff_reg[26] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[26]),
        .Q(async_path_bit[26]),
        .R(1'b0));
  FDRE \src_ff_reg[27] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[27]),
        .Q(async_path_bit[27]),
        .R(1'b0));
  FDRE \src_ff_reg[28] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[28]),
        .Q(async_path_bit[28]),
        .R(1'b0));
  FDRE \src_ff_reg[29] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[29]),
        .Q(async_path_bit[29]),
        .R(1'b0));
  FDRE \src_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[2]),
        .Q(async_path_bit[2]),
        .R(1'b0));
  FDRE \src_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[3]),
        .Q(async_path_bit[3]),
        .R(1'b0));
  FDRE \src_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[4]),
        .Q(async_path_bit[4]),
        .R(1'b0));
  FDRE \src_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[5]),
        .Q(async_path_bit[5]),
        .R(1'b0));
  FDRE \src_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[6]),
        .Q(async_path_bit[6]),
        .R(1'b0));
  FDRE \src_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[7]),
        .Q(async_path_bit[7]),
        .R(1'b0));
  FDRE \src_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[8]),
        .Q(async_path_bit[8]),
        .R(1'b0));
  FDRE \src_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[9]),
        .Q(async_path_bit[9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[0]),
        .Q(\syncstages_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[10]),
        .Q(\syncstages_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[11]),
        .Q(\syncstages_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[12]),
        .Q(\syncstages_ff[0] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][13] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[13]),
        .Q(\syncstages_ff[0] [13]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][14] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[14]),
        .Q(\syncstages_ff[0] [14]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][15] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[15]),
        .Q(\syncstages_ff[0] [15]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][16] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[16]),
        .Q(\syncstages_ff[0] [16]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][17] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[17]),
        .Q(\syncstages_ff[0] [17]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][18] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[18]),
        .Q(\syncstages_ff[0] [18]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][19] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[19]),
        .Q(\syncstages_ff[0] [19]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[1]),
        .Q(\syncstages_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][20] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[20]),
        .Q(\syncstages_ff[0] [20]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][21] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[21]),
        .Q(\syncstages_ff[0] [21]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][22] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[22]),
        .Q(\syncstages_ff[0] [22]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][23] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[23]),
        .Q(\syncstages_ff[0] [23]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][24] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[24]),
        .Q(\syncstages_ff[0] [24]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][25] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[25]),
        .Q(\syncstages_ff[0] [25]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][26] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[26]),
        .Q(\syncstages_ff[0] [26]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][27] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[27]),
        .Q(\syncstages_ff[0] [27]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][28] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[28]),
        .Q(\syncstages_ff[0] [28]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][29] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[29]),
        .Q(\syncstages_ff[0] [29]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[2]),
        .Q(\syncstages_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[3]),
        .Q(\syncstages_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[4]),
        .Q(\syncstages_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[5]),
        .Q(\syncstages_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[6]),
        .Q(\syncstages_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[7]),
        .Q(\syncstages_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[8]),
        .Q(\syncstages_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[9]),
        .Q(\syncstages_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [0]),
        .Q(\syncstages_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [10]),
        .Q(\syncstages_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [11]),
        .Q(\syncstages_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [12]),
        .Q(\syncstages_ff[1] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][13] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [13]),
        .Q(\syncstages_ff[1] [13]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][14] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [14]),
        .Q(\syncstages_ff[1] [14]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][15] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [15]),
        .Q(\syncstages_ff[1] [15]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][16] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [16]),
        .Q(\syncstages_ff[1] [16]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][17] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [17]),
        .Q(\syncstages_ff[1] [17]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][18] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [18]),
        .Q(\syncstages_ff[1] [18]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][19] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [19]),
        .Q(\syncstages_ff[1] [19]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [1]),
        .Q(\syncstages_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][20] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [20]),
        .Q(\syncstages_ff[1] [20]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][21] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [21]),
        .Q(\syncstages_ff[1] [21]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][22] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [22]),
        .Q(\syncstages_ff[1] [22]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][23] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [23]),
        .Q(\syncstages_ff[1] [23]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][24] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [24]),
        .Q(\syncstages_ff[1] [24]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][25] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [25]),
        .Q(\syncstages_ff[1] [25]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][26] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [26]),
        .Q(\syncstages_ff[1] [26]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][27] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [27]),
        .Q(\syncstages_ff[1] [27]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][28] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [28]),
        .Q(\syncstages_ff[1] [28]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][29] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [29]),
        .Q(\syncstages_ff[1] [29]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [2]),
        .Q(\syncstages_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [3]),
        .Q(\syncstages_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [4]),
        .Q(\syncstages_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [5]),
        .Q(\syncstages_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [6]),
        .Q(\syncstages_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [7]),
        .Q(\syncstages_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [8]),
        .Q(\syncstages_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [9]),
        .Q(\syncstages_ff[1] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [0]),
        .Q(\syncstages_ff[2] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [10]),
        .Q(\syncstages_ff[2] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [11]),
        .Q(\syncstages_ff[2] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [12]),
        .Q(\syncstages_ff[2] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][13] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [13]),
        .Q(\syncstages_ff[2] [13]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][14] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [14]),
        .Q(\syncstages_ff[2] [14]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][15] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [15]),
        .Q(\syncstages_ff[2] [15]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][16] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [16]),
        .Q(\syncstages_ff[2] [16]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][17] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [17]),
        .Q(\syncstages_ff[2] [17]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][18] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [18]),
        .Q(\syncstages_ff[2] [18]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][19] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [19]),
        .Q(\syncstages_ff[2] [19]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [1]),
        .Q(\syncstages_ff[2] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][20] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [20]),
        .Q(\syncstages_ff[2] [20]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][21] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [21]),
        .Q(\syncstages_ff[2] [21]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][22] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [22]),
        .Q(\syncstages_ff[2] [22]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][23] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [23]),
        .Q(\syncstages_ff[2] [23]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][24] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [24]),
        .Q(\syncstages_ff[2] [24]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][25] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [25]),
        .Q(\syncstages_ff[2] [25]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][26] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [26]),
        .Q(\syncstages_ff[2] [26]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][27] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [27]),
        .Q(\syncstages_ff[2] [27]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][28] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [28]),
        .Q(\syncstages_ff[2] [28]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][29] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [29]),
        .Q(\syncstages_ff[2] [29]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [2]),
        .Q(\syncstages_ff[2] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [3]),
        .Q(\syncstages_ff[2] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [4]),
        .Q(\syncstages_ff[2] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [5]),
        .Q(\syncstages_ff[2] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [6]),
        .Q(\syncstages_ff[2] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [7]),
        .Q(\syncstages_ff[2] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [8]),
        .Q(\syncstages_ff[2] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [9]),
        .Q(\syncstages_ff[2] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [0]),
        .Q(\syncstages_ff[3] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [10]),
        .Q(\syncstages_ff[3] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [11]),
        .Q(\syncstages_ff[3] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][12] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [12]),
        .Q(\syncstages_ff[3] [12]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][13] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [13]),
        .Q(\syncstages_ff[3] [13]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][14] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [14]),
        .Q(\syncstages_ff[3] [14]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][15] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [15]),
        .Q(\syncstages_ff[3] [15]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][16] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [16]),
        .Q(\syncstages_ff[3] [16]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][17] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [17]),
        .Q(\syncstages_ff[3] [17]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][18] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [18]),
        .Q(\syncstages_ff[3] [18]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][19] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [19]),
        .Q(\syncstages_ff[3] [19]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [1]),
        .Q(\syncstages_ff[3] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][20] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [20]),
        .Q(\syncstages_ff[3] [20]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][21] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [21]),
        .Q(\syncstages_ff[3] [21]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][22] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [22]),
        .Q(\syncstages_ff[3] [22]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][23] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [23]),
        .Q(\syncstages_ff[3] [23]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][24] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [24]),
        .Q(\syncstages_ff[3] [24]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][25] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [25]),
        .Q(\syncstages_ff[3] [25]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][26] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [26]),
        .Q(\syncstages_ff[3] [26]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][27] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [27]),
        .Q(\syncstages_ff[3] [27]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][28] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [28]),
        .Q(\syncstages_ff[3] [28]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][29] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [29]),
        .Q(\syncstages_ff[3] [29]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [2]),
        .Q(\syncstages_ff[3] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [3]),
        .Q(\syncstages_ff[3] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [4]),
        .Q(\syncstages_ff[3] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [5]),
        .Q(\syncstages_ff[3] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [6]),
        .Q(\syncstages_ff[3] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [7]),
        .Q(\syncstages_ff[3] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [8]),
        .Q(\syncstages_ff[3] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [9]),
        .Q(\syncstages_ff[3] [9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_array_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* WIDTH = "9" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) 
(* xpm_cdc = "ARRAY_SINGLE" *) 
module MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_array_single__parameterized1
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input [8:0]src_in;
  input dest_clk;
  output [8:0]dest_out;

  wire [8:0]async_path_bit;
  wire dest_clk;
  wire src_clk;
  wire [8:0]src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [8:0]\syncstages_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [8:0]\syncstages_ff[1] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [8:0]\syncstages_ff[2] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ARRAY_SINGLE" *) wire [8:0]\syncstages_ff[3] ;

  assign dest_out[8:0] = \syncstages_ff[3] ;
  FDRE \src_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[0]),
        .Q(async_path_bit[0]),
        .R(1'b0));
  FDRE \src_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[1]),
        .Q(async_path_bit[1]),
        .R(1'b0));
  FDRE \src_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[2]),
        .Q(async_path_bit[2]),
        .R(1'b0));
  FDRE \src_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[3]),
        .Q(async_path_bit[3]),
        .R(1'b0));
  FDRE \src_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[4]),
        .Q(async_path_bit[4]),
        .R(1'b0));
  FDRE \src_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[5]),
        .Q(async_path_bit[5]),
        .R(1'b0));
  FDRE \src_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[6]),
        .Q(async_path_bit[6]),
        .R(1'b0));
  FDRE \src_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[7]),
        .Q(async_path_bit[7]),
        .R(1'b0));
  FDRE \src_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in[8]),
        .Q(async_path_bit[8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[0]),
        .Q(\syncstages_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[1]),
        .Q(\syncstages_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[2]),
        .Q(\syncstages_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[3]),
        .Q(\syncstages_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[4]),
        .Q(\syncstages_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[5]),
        .Q(\syncstages_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[6]),
        .Q(\syncstages_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[7]),
        .Q(\syncstages_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path_bit[8]),
        .Q(\syncstages_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [0]),
        .Q(\syncstages_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [1]),
        .Q(\syncstages_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [2]),
        .Q(\syncstages_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [3]),
        .Q(\syncstages_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [4]),
        .Q(\syncstages_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [5]),
        .Q(\syncstages_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [6]),
        .Q(\syncstages_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [7]),
        .Q(\syncstages_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[0] [8]),
        .Q(\syncstages_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [0]),
        .Q(\syncstages_ff[2] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [1]),
        .Q(\syncstages_ff[2] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [2]),
        .Q(\syncstages_ff[2] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [3]),
        .Q(\syncstages_ff[2] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [4]),
        .Q(\syncstages_ff[2] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [5]),
        .Q(\syncstages_ff[2] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [6]),
        .Q(\syncstages_ff[2] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [7]),
        .Q(\syncstages_ff[2] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[2][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[1] [8]),
        .Q(\syncstages_ff[2] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [0]),
        .Q(\syncstages_ff[3] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [1]),
        .Q(\syncstages_ff[3] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [2]),
        .Q(\syncstages_ff[3] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [3]),
        .Q(\syncstages_ff[3] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [4]),
        .Q(\syncstages_ff[3] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [5]),
        .Q(\syncstages_ff[3] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [6]),
        .Q(\syncstages_ff[3] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [7]),
        .Q(\syncstages_ff[3] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ARRAY_SINGLE" *) 
  FDRE \syncstages_ff_reg[3][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\syncstages_ff[2] [8]),
        .Q(\syncstages_ff[3] [8]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "SINGLE" *) 
module MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire [0:0]p_0_in;
  wire src_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  FDRE src_ff_reg
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(p_0_in),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "SINGLE" *) 
module MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__1
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire [0:0]p_0_in;
  wire src_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  FDRE src_ff_reg
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(p_0_in),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) (* xpm_cdc = "SINGLE" *) 
module MainDesign_CDC_Command_Scanout_0_0_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire [0:0]p_0_in;
  wire src_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  FDRE src_ff_reg
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(p_0_in),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule
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
