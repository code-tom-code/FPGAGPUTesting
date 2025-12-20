// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:01 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StatsDataSampler_0_0/MainDesign_StatsDataSampler_0_0_sim_netlist.v
// Design      : MainDesign_StatsDataSampler_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StatsDataSampler_0_0,StatsDataSampler,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StatsDataSampler,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StatsDataSampler_0_0
   (clk,
    SamplingCache_clk,
    SamplingCache_addra,
    SamplingCache_dina,
    SamplingCache_wea,
    STAT_SamplingIntervalCycles,
    STAT_SampleData,
    STAT_CurrentWriteIndex,
    STAT_Reset);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF SamplingCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache CLK" *) (* x_interface_mode = "master SamplingCache" *) (* x_interface_parameter = "XIL_INTERFACENAME SamplingCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output SamplingCache_clk;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) output [9:0]SamplingCache_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache DIN" *) output [31:0]SamplingCache_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache WE" *) output [0:0]SamplingCache_wea;
  input [31:0]STAT_SamplingIntervalCycles;
  input [31:0]STAT_SampleData;
  output [9:0]STAT_CurrentWriteIndex;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 STAT_Reset RST" *) (* x_interface_mode = "slave STAT_Reset" *) (* x_interface_parameter = "XIL_INTERFACENAME STAT_Reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input STAT_Reset;

  wire [9:0]STAT_CurrentWriteIndex;
  wire STAT_Reset;
  wire [31:0]STAT_SampleData;
  wire [31:0]STAT_SamplingIntervalCycles;
  wire [0:0]SamplingCache_wea;
  wire clk;

  assign SamplingCache_addra[9:0] = STAT_CurrentWriteIndex;
  assign SamplingCache_clk = clk;
  assign SamplingCache_dina[31:0] = STAT_SampleData;
  MainDesign_StatsDataSampler_0_0_StatsDataSampler U0
       (.STAT_CurrentWriteIndex(STAT_CurrentWriteIndex),
        .STAT_Reset(STAT_Reset),
        .STAT_SamplingIntervalCycles(STAT_SamplingIntervalCycles),
        .SamplingCache_wea(SamplingCache_wea),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StatsDataSampler" *) 
module MainDesign_StatsDataSampler_0_0_StatsDataSampler
   (STAT_CurrentWriteIndex,
    SamplingCache_wea,
    STAT_Reset,
    STAT_SamplingIntervalCycles,
    clk);
  output [9:0]STAT_CurrentWriteIndex;
  output [0:0]SamplingCache_wea;
  input STAT_Reset;
  input [31:0]STAT_SamplingIntervalCycles;
  input clk;

  wire [9:0]STAT_CurrentWriteIndex;
  wire STAT_Reset;
  wire [31:0]STAT_SamplingIntervalCycles;
  wire [0:0]SamplingCache_wea;
  wire SamplingCache_wea0_carry__0_n_5;
  wire SamplingCache_wea0_carry__0_n_6;
  wire SamplingCache_wea0_carry__0_n_7;
  wire SamplingCache_wea0_carry_i_1__0_n_0;
  wire SamplingCache_wea0_carry_i_1_n_0;
  wire SamplingCache_wea0_carry_i_2__0_n_0;
  wire SamplingCache_wea0_carry_i_2_n_0;
  wire SamplingCache_wea0_carry_i_3__0_n_0;
  wire SamplingCache_wea0_carry_i_3_n_0;
  wire SamplingCache_wea0_carry_i_4_n_0;
  wire SamplingCache_wea0_carry_i_5_n_0;
  wire SamplingCache_wea0_carry_i_6_n_0;
  wire SamplingCache_wea0_carry_i_7_n_0;
  wire SamplingCache_wea0_carry_i_8_n_0;
  wire SamplingCache_wea0_carry_n_0;
  wire SamplingCache_wea0_carry_n_1;
  wire SamplingCache_wea0_carry_n_2;
  wire SamplingCache_wea0_carry_n_3;
  wire SamplingCache_wea0_carry_n_4;
  wire SamplingCache_wea0_carry_n_5;
  wire SamplingCache_wea0_carry_n_6;
  wire SamplingCache_wea0_carry_n_7;
  wire \SamplingCache_wea[0]_i_1_n_0 ;
  wire clk;
  wire \currentCycle[0]_i_1_n_0 ;
  wire \currentCycle[0]_i_3_n_0 ;
  wire [31:0]currentCycle_reg;
  wire \currentCycle_reg[0]_i_2_n_0 ;
  wire \currentCycle_reg[0]_i_2_n_1 ;
  wire \currentCycle_reg[0]_i_2_n_10 ;
  wire \currentCycle_reg[0]_i_2_n_11 ;
  wire \currentCycle_reg[0]_i_2_n_12 ;
  wire \currentCycle_reg[0]_i_2_n_13 ;
  wire \currentCycle_reg[0]_i_2_n_14 ;
  wire \currentCycle_reg[0]_i_2_n_15 ;
  wire \currentCycle_reg[0]_i_2_n_2 ;
  wire \currentCycle_reg[0]_i_2_n_3 ;
  wire \currentCycle_reg[0]_i_2_n_4 ;
  wire \currentCycle_reg[0]_i_2_n_5 ;
  wire \currentCycle_reg[0]_i_2_n_6 ;
  wire \currentCycle_reg[0]_i_2_n_7 ;
  wire \currentCycle_reg[0]_i_2_n_8 ;
  wire \currentCycle_reg[0]_i_2_n_9 ;
  wire \currentCycle_reg[16]_i_1_n_0 ;
  wire \currentCycle_reg[16]_i_1_n_1 ;
  wire \currentCycle_reg[16]_i_1_n_10 ;
  wire \currentCycle_reg[16]_i_1_n_11 ;
  wire \currentCycle_reg[16]_i_1_n_12 ;
  wire \currentCycle_reg[16]_i_1_n_13 ;
  wire \currentCycle_reg[16]_i_1_n_14 ;
  wire \currentCycle_reg[16]_i_1_n_15 ;
  wire \currentCycle_reg[16]_i_1_n_2 ;
  wire \currentCycle_reg[16]_i_1_n_3 ;
  wire \currentCycle_reg[16]_i_1_n_4 ;
  wire \currentCycle_reg[16]_i_1_n_5 ;
  wire \currentCycle_reg[16]_i_1_n_6 ;
  wire \currentCycle_reg[16]_i_1_n_7 ;
  wire \currentCycle_reg[16]_i_1_n_8 ;
  wire \currentCycle_reg[16]_i_1_n_9 ;
  wire \currentCycle_reg[24]_i_1_n_1 ;
  wire \currentCycle_reg[24]_i_1_n_10 ;
  wire \currentCycle_reg[24]_i_1_n_11 ;
  wire \currentCycle_reg[24]_i_1_n_12 ;
  wire \currentCycle_reg[24]_i_1_n_13 ;
  wire \currentCycle_reg[24]_i_1_n_14 ;
  wire \currentCycle_reg[24]_i_1_n_15 ;
  wire \currentCycle_reg[24]_i_1_n_2 ;
  wire \currentCycle_reg[24]_i_1_n_3 ;
  wire \currentCycle_reg[24]_i_1_n_4 ;
  wire \currentCycle_reg[24]_i_1_n_5 ;
  wire \currentCycle_reg[24]_i_1_n_6 ;
  wire \currentCycle_reg[24]_i_1_n_7 ;
  wire \currentCycle_reg[24]_i_1_n_8 ;
  wire \currentCycle_reg[24]_i_1_n_9 ;
  wire \currentCycle_reg[8]_i_1_n_0 ;
  wire \currentCycle_reg[8]_i_1_n_1 ;
  wire \currentCycle_reg[8]_i_1_n_10 ;
  wire \currentCycle_reg[8]_i_1_n_11 ;
  wire \currentCycle_reg[8]_i_1_n_12 ;
  wire \currentCycle_reg[8]_i_1_n_13 ;
  wire \currentCycle_reg[8]_i_1_n_14 ;
  wire \currentCycle_reg[8]_i_1_n_15 ;
  wire \currentCycle_reg[8]_i_1_n_2 ;
  wire \currentCycle_reg[8]_i_1_n_3 ;
  wire \currentCycle_reg[8]_i_1_n_4 ;
  wire \currentCycle_reg[8]_i_1_n_5 ;
  wire \currentCycle_reg[8]_i_1_n_6 ;
  wire \currentCycle_reg[8]_i_1_n_7 ;
  wire \currentCycle_reg[8]_i_1_n_8 ;
  wire \currentCycle_reg[8]_i_1_n_9 ;
  wire \currentWriteIndex[9]_i_2_n_0 ;
  wire [9:0]plusOp;
  wire [31:0]samplingInterval_cycles;
  wire [7:0]NLW_SamplingCache_wea0_carry_O_UNCONNECTED;
  wire [7:3]NLW_SamplingCache_wea0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_SamplingCache_wea0_carry__0_O_UNCONNECTED;
  wire [7:7]\NLW_currentCycle_reg[24]_i_1_CO_UNCONNECTED ;

  CARRY8 SamplingCache_wea0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({SamplingCache_wea0_carry_n_0,SamplingCache_wea0_carry_n_1,SamplingCache_wea0_carry_n_2,SamplingCache_wea0_carry_n_3,SamplingCache_wea0_carry_n_4,SamplingCache_wea0_carry_n_5,SamplingCache_wea0_carry_n_6,SamplingCache_wea0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_SamplingCache_wea0_carry_O_UNCONNECTED[7:0]),
        .S({SamplingCache_wea0_carry_i_1_n_0,SamplingCache_wea0_carry_i_2_n_0,SamplingCache_wea0_carry_i_3_n_0,SamplingCache_wea0_carry_i_4_n_0,SamplingCache_wea0_carry_i_5_n_0,SamplingCache_wea0_carry_i_6_n_0,SamplingCache_wea0_carry_i_7_n_0,SamplingCache_wea0_carry_i_8_n_0}));
  CARRY8 SamplingCache_wea0_carry__0
       (.CI(SamplingCache_wea0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_SamplingCache_wea0_carry__0_CO_UNCONNECTED[7:3],SamplingCache_wea0_carry__0_n_5,SamplingCache_wea0_carry__0_n_6,SamplingCache_wea0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_SamplingCache_wea0_carry__0_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,SamplingCache_wea0_carry_i_1__0_n_0,SamplingCache_wea0_carry_i_2__0_n_0,SamplingCache_wea0_carry_i_3__0_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_1
       (.I0(currentCycle_reg[21]),
        .I1(samplingInterval_cycles[21]),
        .I2(samplingInterval_cycles[23]),
        .I3(currentCycle_reg[23]),
        .I4(samplingInterval_cycles[22]),
        .I5(currentCycle_reg[22]),
        .O(SamplingCache_wea0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    SamplingCache_wea0_carry_i_1__0
       (.I0(currentCycle_reg[30]),
        .I1(samplingInterval_cycles[30]),
        .I2(currentCycle_reg[31]),
        .I3(samplingInterval_cycles[31]),
        .O(SamplingCache_wea0_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_2
       (.I0(currentCycle_reg[18]),
        .I1(samplingInterval_cycles[18]),
        .I2(samplingInterval_cycles[20]),
        .I3(currentCycle_reg[20]),
        .I4(samplingInterval_cycles[19]),
        .I5(currentCycle_reg[19]),
        .O(SamplingCache_wea0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_2__0
       (.I0(currentCycle_reg[27]),
        .I1(samplingInterval_cycles[27]),
        .I2(samplingInterval_cycles[29]),
        .I3(currentCycle_reg[29]),
        .I4(samplingInterval_cycles[28]),
        .I5(currentCycle_reg[28]),
        .O(SamplingCache_wea0_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_3
       (.I0(currentCycle_reg[15]),
        .I1(samplingInterval_cycles[15]),
        .I2(samplingInterval_cycles[17]),
        .I3(currentCycle_reg[17]),
        .I4(samplingInterval_cycles[16]),
        .I5(currentCycle_reg[16]),
        .O(SamplingCache_wea0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_3__0
       (.I0(currentCycle_reg[24]),
        .I1(samplingInterval_cycles[24]),
        .I2(samplingInterval_cycles[26]),
        .I3(currentCycle_reg[26]),
        .I4(samplingInterval_cycles[25]),
        .I5(currentCycle_reg[25]),
        .O(SamplingCache_wea0_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_4
       (.I0(currentCycle_reg[12]),
        .I1(samplingInterval_cycles[12]),
        .I2(samplingInterval_cycles[14]),
        .I3(currentCycle_reg[14]),
        .I4(samplingInterval_cycles[13]),
        .I5(currentCycle_reg[13]),
        .O(SamplingCache_wea0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_5
       (.I0(currentCycle_reg[9]),
        .I1(samplingInterval_cycles[9]),
        .I2(samplingInterval_cycles[11]),
        .I3(currentCycle_reg[11]),
        .I4(samplingInterval_cycles[10]),
        .I5(currentCycle_reg[10]),
        .O(SamplingCache_wea0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_6
       (.I0(currentCycle_reg[6]),
        .I1(samplingInterval_cycles[6]),
        .I2(samplingInterval_cycles[8]),
        .I3(currentCycle_reg[8]),
        .I4(samplingInterval_cycles[7]),
        .I5(currentCycle_reg[7]),
        .O(SamplingCache_wea0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_7
       (.I0(currentCycle_reg[3]),
        .I1(samplingInterval_cycles[3]),
        .I2(samplingInterval_cycles[5]),
        .I3(currentCycle_reg[5]),
        .I4(samplingInterval_cycles[4]),
        .I5(currentCycle_reg[4]),
        .O(SamplingCache_wea0_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    SamplingCache_wea0_carry_i_8
       (.I0(currentCycle_reg[0]),
        .I1(samplingInterval_cycles[0]),
        .I2(samplingInterval_cycles[2]),
        .I3(currentCycle_reg[2]),
        .I4(samplingInterval_cycles[1]),
        .I5(currentCycle_reg[1]),
        .O(SamplingCache_wea0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \SamplingCache_wea[0]_i_1 
       (.I0(SamplingCache_wea0_carry__0_n_5),
        .I1(STAT_Reset),
        .O(\SamplingCache_wea[0]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \SamplingCache_wea_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\SamplingCache_wea[0]_i_1_n_0 ),
        .Q(SamplingCache_wea),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    \currentCycle[0]_i_1 
       (.I0(STAT_Reset),
        .I1(SamplingCache_wea0_carry__0_n_5),
        .O(\currentCycle[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \currentCycle[0]_i_3 
       (.I0(currentCycle_reg[0]),
        .O(\currentCycle[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_15 ),
        .Q(currentCycle_reg[0]),
        .R(\currentCycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \currentCycle_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\currentCycle_reg[0]_i_2_n_0 ,\currentCycle_reg[0]_i_2_n_1 ,\currentCycle_reg[0]_i_2_n_2 ,\currentCycle_reg[0]_i_2_n_3 ,\currentCycle_reg[0]_i_2_n_4 ,\currentCycle_reg[0]_i_2_n_5 ,\currentCycle_reg[0]_i_2_n_6 ,\currentCycle_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\currentCycle_reg[0]_i_2_n_8 ,\currentCycle_reg[0]_i_2_n_9 ,\currentCycle_reg[0]_i_2_n_10 ,\currentCycle_reg[0]_i_2_n_11 ,\currentCycle_reg[0]_i_2_n_12 ,\currentCycle_reg[0]_i_2_n_13 ,\currentCycle_reg[0]_i_2_n_14 ,\currentCycle_reg[0]_i_2_n_15 }),
        .S({currentCycle_reg[7:1],\currentCycle[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_13 ),
        .Q(currentCycle_reg[10]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_12 ),
        .Q(currentCycle_reg[11]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_11 ),
        .Q(currentCycle_reg[12]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_10 ),
        .Q(currentCycle_reg[13]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_9 ),
        .Q(currentCycle_reg[14]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_8 ),
        .Q(currentCycle_reg[15]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_15 ),
        .Q(currentCycle_reg[16]),
        .R(\currentCycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \currentCycle_reg[16]_i_1 
       (.CI(\currentCycle_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\currentCycle_reg[16]_i_1_n_0 ,\currentCycle_reg[16]_i_1_n_1 ,\currentCycle_reg[16]_i_1_n_2 ,\currentCycle_reg[16]_i_1_n_3 ,\currentCycle_reg[16]_i_1_n_4 ,\currentCycle_reg[16]_i_1_n_5 ,\currentCycle_reg[16]_i_1_n_6 ,\currentCycle_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\currentCycle_reg[16]_i_1_n_8 ,\currentCycle_reg[16]_i_1_n_9 ,\currentCycle_reg[16]_i_1_n_10 ,\currentCycle_reg[16]_i_1_n_11 ,\currentCycle_reg[16]_i_1_n_12 ,\currentCycle_reg[16]_i_1_n_13 ,\currentCycle_reg[16]_i_1_n_14 ,\currentCycle_reg[16]_i_1_n_15 }),
        .S(currentCycle_reg[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_14 ),
        .Q(currentCycle_reg[17]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_13 ),
        .Q(currentCycle_reg[18]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_12 ),
        .Q(currentCycle_reg[19]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_14 ),
        .Q(currentCycle_reg[1]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_11 ),
        .Q(currentCycle_reg[20]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_10 ),
        .Q(currentCycle_reg[21]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_9 ),
        .Q(currentCycle_reg[22]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[16]_i_1_n_8 ),
        .Q(currentCycle_reg[23]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_15 ),
        .Q(currentCycle_reg[24]),
        .R(\currentCycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \currentCycle_reg[24]_i_1 
       (.CI(\currentCycle_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_currentCycle_reg[24]_i_1_CO_UNCONNECTED [7],\currentCycle_reg[24]_i_1_n_1 ,\currentCycle_reg[24]_i_1_n_2 ,\currentCycle_reg[24]_i_1_n_3 ,\currentCycle_reg[24]_i_1_n_4 ,\currentCycle_reg[24]_i_1_n_5 ,\currentCycle_reg[24]_i_1_n_6 ,\currentCycle_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\currentCycle_reg[24]_i_1_n_8 ,\currentCycle_reg[24]_i_1_n_9 ,\currentCycle_reg[24]_i_1_n_10 ,\currentCycle_reg[24]_i_1_n_11 ,\currentCycle_reg[24]_i_1_n_12 ,\currentCycle_reg[24]_i_1_n_13 ,\currentCycle_reg[24]_i_1_n_14 ,\currentCycle_reg[24]_i_1_n_15 }),
        .S(currentCycle_reg[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_14 ),
        .Q(currentCycle_reg[25]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_13 ),
        .Q(currentCycle_reg[26]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_12 ),
        .Q(currentCycle_reg[27]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_11 ),
        .Q(currentCycle_reg[28]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_10 ),
        .Q(currentCycle_reg[29]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_13 ),
        .Q(currentCycle_reg[2]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_9 ),
        .Q(currentCycle_reg[30]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[24]_i_1_n_8 ),
        .Q(currentCycle_reg[31]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_12 ),
        .Q(currentCycle_reg[3]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_11 ),
        .Q(currentCycle_reg[4]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_10 ),
        .Q(currentCycle_reg[5]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_9 ),
        .Q(currentCycle_reg[6]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[0]_i_2_n_8 ),
        .Q(currentCycle_reg[7]),
        .R(\currentCycle[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_15 ),
        .Q(currentCycle_reg[8]),
        .R(\currentCycle[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \currentCycle_reg[8]_i_1 
       (.CI(\currentCycle_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\currentCycle_reg[8]_i_1_n_0 ,\currentCycle_reg[8]_i_1_n_1 ,\currentCycle_reg[8]_i_1_n_2 ,\currentCycle_reg[8]_i_1_n_3 ,\currentCycle_reg[8]_i_1_n_4 ,\currentCycle_reg[8]_i_1_n_5 ,\currentCycle_reg[8]_i_1_n_6 ,\currentCycle_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\currentCycle_reg[8]_i_1_n_8 ,\currentCycle_reg[8]_i_1_n_9 ,\currentCycle_reg[8]_i_1_n_10 ,\currentCycle_reg[8]_i_1_n_11 ,\currentCycle_reg[8]_i_1_n_12 ,\currentCycle_reg[8]_i_1_n_13 ,\currentCycle_reg[8]_i_1_n_14 ,\currentCycle_reg[8]_i_1_n_15 }),
        .S(currentCycle_reg[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \currentCycle_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\currentCycle_reg[8]_i_1_n_14 ),
        .Q(currentCycle_reg[9]),
        .R(\currentCycle[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \currentWriteIndex[0]_i_1 
       (.I0(STAT_CurrentWriteIndex[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteIndex[1]_i_1 
       (.I0(STAT_CurrentWriteIndex[0]),
        .I1(STAT_CurrentWriteIndex[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentWriteIndex[2]_i_1 
       (.I0(STAT_CurrentWriteIndex[0]),
        .I1(STAT_CurrentWriteIndex[1]),
        .I2(STAT_CurrentWriteIndex[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \currentWriteIndex[3]_i_1 
       (.I0(STAT_CurrentWriteIndex[1]),
        .I1(STAT_CurrentWriteIndex[0]),
        .I2(STAT_CurrentWriteIndex[2]),
        .I3(STAT_CurrentWriteIndex[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \currentWriteIndex[4]_i_1 
       (.I0(STAT_CurrentWriteIndex[2]),
        .I1(STAT_CurrentWriteIndex[0]),
        .I2(STAT_CurrentWriteIndex[1]),
        .I3(STAT_CurrentWriteIndex[3]),
        .I4(STAT_CurrentWriteIndex[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \currentWriteIndex[5]_i_1 
       (.I0(STAT_CurrentWriteIndex[3]),
        .I1(STAT_CurrentWriteIndex[1]),
        .I2(STAT_CurrentWriteIndex[0]),
        .I3(STAT_CurrentWriteIndex[2]),
        .I4(STAT_CurrentWriteIndex[4]),
        .I5(STAT_CurrentWriteIndex[5]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteIndex[6]_i_1 
       (.I0(\currentWriteIndex[9]_i_2_n_0 ),
        .I1(STAT_CurrentWriteIndex[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentWriteIndex[7]_i_1 
       (.I0(\currentWriteIndex[9]_i_2_n_0 ),
        .I1(STAT_CurrentWriteIndex[6]),
        .I2(STAT_CurrentWriteIndex[7]),
        .O(plusOp[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \currentWriteIndex[8]_i_1 
       (.I0(STAT_CurrentWriteIndex[6]),
        .I1(\currentWriteIndex[9]_i_2_n_0 ),
        .I2(STAT_CurrentWriteIndex[7]),
        .I3(STAT_CurrentWriteIndex[8]),
        .O(plusOp[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \currentWriteIndex[9]_i_1 
       (.I0(STAT_CurrentWriteIndex[7]),
        .I1(\currentWriteIndex[9]_i_2_n_0 ),
        .I2(STAT_CurrentWriteIndex[6]),
        .I3(STAT_CurrentWriteIndex[8]),
        .I4(STAT_CurrentWriteIndex[9]),
        .O(plusOp[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \currentWriteIndex[9]_i_2 
       (.I0(STAT_CurrentWriteIndex[5]),
        .I1(STAT_CurrentWriteIndex[3]),
        .I2(STAT_CurrentWriteIndex[1]),
        .I3(STAT_CurrentWriteIndex[0]),
        .I4(STAT_CurrentWriteIndex[2]),
        .I5(STAT_CurrentWriteIndex[4]),
        .O(\currentWriteIndex[9]_i_2_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[0] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[0]),
        .Q(STAT_CurrentWriteIndex[0]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[1] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[1]),
        .Q(STAT_CurrentWriteIndex[1]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[2] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[2]),
        .Q(STAT_CurrentWriteIndex[2]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[3] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[3]),
        .Q(STAT_CurrentWriteIndex[3]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[4] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[4]),
        .Q(STAT_CurrentWriteIndex[4]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[5] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[5]),
        .Q(STAT_CurrentWriteIndex[5]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[6] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[6]),
        .Q(STAT_CurrentWriteIndex[6]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[7] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[7]),
        .Q(STAT_CurrentWriteIndex[7]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[8] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[8]),
        .Q(STAT_CurrentWriteIndex[8]),
        .R(STAT_Reset));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteIndex_reg[9] 
       (.C(clk),
        .CE(SamplingCache_wea0_carry__0_n_5),
        .D(plusOp[9]),
        .Q(STAT_CurrentWriteIndex[9]),
        .R(STAT_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[0] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[0]),
        .Q(samplingInterval_cycles[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[10] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[10]),
        .Q(samplingInterval_cycles[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[11] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[11]),
        .Q(samplingInterval_cycles[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[12] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[12]),
        .Q(samplingInterval_cycles[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[13] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[13]),
        .Q(samplingInterval_cycles[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[14] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[14]),
        .Q(samplingInterval_cycles[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[15] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[15]),
        .Q(samplingInterval_cycles[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[16] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[16]),
        .Q(samplingInterval_cycles[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[17] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[17]),
        .Q(samplingInterval_cycles[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[18] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[18]),
        .Q(samplingInterval_cycles[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[19] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[19]),
        .Q(samplingInterval_cycles[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[1] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[1]),
        .Q(samplingInterval_cycles[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[20] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[20]),
        .Q(samplingInterval_cycles[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[21] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[21]),
        .Q(samplingInterval_cycles[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[22] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[22]),
        .Q(samplingInterval_cycles[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[23] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[23]),
        .Q(samplingInterval_cycles[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[24] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[24]),
        .Q(samplingInterval_cycles[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[25] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[25]),
        .Q(samplingInterval_cycles[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[26] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[26]),
        .Q(samplingInterval_cycles[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[27] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[27]),
        .Q(samplingInterval_cycles[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[28] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[28]),
        .Q(samplingInterval_cycles[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[29] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[29]),
        .Q(samplingInterval_cycles[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[2] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[2]),
        .Q(samplingInterval_cycles[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[30] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[30]),
        .Q(samplingInterval_cycles[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[31] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[31]),
        .Q(samplingInterval_cycles[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[3] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[3]),
        .Q(samplingInterval_cycles[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[4] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[4]),
        .Q(samplingInterval_cycles[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[5] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[5]),
        .Q(samplingInterval_cycles[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[6] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[6]),
        .Q(samplingInterval_cycles[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[7] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[7]),
        .Q(samplingInterval_cycles[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \samplingInterval_cycles_reg[8] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[8]),
        .Q(samplingInterval_cycles[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \samplingInterval_cycles_reg[9] 
       (.C(clk),
        .CE(STAT_Reset),
        .D(STAT_SamplingIntervalCycles[9]),
        .Q(samplingInterval_cycles[9]),
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
