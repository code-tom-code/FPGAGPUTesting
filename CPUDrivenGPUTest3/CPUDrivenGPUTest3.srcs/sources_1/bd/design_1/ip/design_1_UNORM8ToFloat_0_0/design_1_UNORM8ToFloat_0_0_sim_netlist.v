// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:35:03 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_UNORM8ToFloat_0_0/design_1_UNORM8ToFloat_0_0_sim_netlist.v
// Design      : design_1_UNORM8ToFloat_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_UNORM8ToFloat_0_0,UNORM8ToFloat,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "UNORM8ToFloat,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_UNORM8ToFloat_0_0
   (clk,
    Enable,
    D3DColorIn,
    FloatXOut,
    FloatYOut,
    FloatZOut,
    FloatWOut);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  input Enable;
  input [31:0]D3DColorIn;
  output [31:0]FloatXOut;
  output [31:0]FloatYOut;
  output [31:0]FloatZOut;
  output [31:0]FloatWOut;

  wire \<const0> ;
  wire [31:0]D3DColorIn;
  wire Enable;
  wire [28:16]\^FloatWOut ;
  wire [28:16]\^FloatXOut ;
  wire [28:16]\^FloatYOut ;
  wire [28:16]\^FloatZOut ;
  wire clk;

  assign FloatWOut[31] = \<const0> ;
  assign FloatWOut[30] = \<const0> ;
  assign FloatWOut[29] = \^FloatWOut [28];
  assign FloatWOut[28] = \^FloatWOut [28];
  assign FloatWOut[27] = \^FloatWOut [28];
  assign FloatWOut[26:16] = \^FloatWOut [26:16];
  assign FloatWOut[15] = \<const0> ;
  assign FloatWOut[14] = \<const0> ;
  assign FloatWOut[13] = \<const0> ;
  assign FloatWOut[12] = \<const0> ;
  assign FloatWOut[11] = \<const0> ;
  assign FloatWOut[10] = \<const0> ;
  assign FloatWOut[9] = \<const0> ;
  assign FloatWOut[8] = \<const0> ;
  assign FloatWOut[7] = \<const0> ;
  assign FloatWOut[6] = \<const0> ;
  assign FloatWOut[5] = \<const0> ;
  assign FloatWOut[4] = \<const0> ;
  assign FloatWOut[3] = \<const0> ;
  assign FloatWOut[2] = \<const0> ;
  assign FloatWOut[1] = \<const0> ;
  assign FloatWOut[0] = \<const0> ;
  assign FloatXOut[31] = \<const0> ;
  assign FloatXOut[30] = \<const0> ;
  assign FloatXOut[29] = \^FloatXOut [28];
  assign FloatXOut[28] = \^FloatXOut [28];
  assign FloatXOut[27] = \^FloatXOut [28];
  assign FloatXOut[26:16] = \^FloatXOut [26:16];
  assign FloatXOut[15] = \<const0> ;
  assign FloatXOut[14] = \<const0> ;
  assign FloatXOut[13] = \<const0> ;
  assign FloatXOut[12] = \<const0> ;
  assign FloatXOut[11] = \<const0> ;
  assign FloatXOut[10] = \<const0> ;
  assign FloatXOut[9] = \<const0> ;
  assign FloatXOut[8] = \<const0> ;
  assign FloatXOut[7] = \<const0> ;
  assign FloatXOut[6] = \<const0> ;
  assign FloatXOut[5] = \<const0> ;
  assign FloatXOut[4] = \<const0> ;
  assign FloatXOut[3] = \<const0> ;
  assign FloatXOut[2] = \<const0> ;
  assign FloatXOut[1] = \<const0> ;
  assign FloatXOut[0] = \<const0> ;
  assign FloatYOut[31] = \<const0> ;
  assign FloatYOut[30] = \<const0> ;
  assign FloatYOut[29] = \^FloatYOut [28];
  assign FloatYOut[28] = \^FloatYOut [28];
  assign FloatYOut[27] = \^FloatYOut [28];
  assign FloatYOut[26:16] = \^FloatYOut [26:16];
  assign FloatYOut[15] = \<const0> ;
  assign FloatYOut[14] = \<const0> ;
  assign FloatYOut[13] = \<const0> ;
  assign FloatYOut[12] = \<const0> ;
  assign FloatYOut[11] = \<const0> ;
  assign FloatYOut[10] = \<const0> ;
  assign FloatYOut[9] = \<const0> ;
  assign FloatYOut[8] = \<const0> ;
  assign FloatYOut[7] = \<const0> ;
  assign FloatYOut[6] = \<const0> ;
  assign FloatYOut[5] = \<const0> ;
  assign FloatYOut[4] = \<const0> ;
  assign FloatYOut[3] = \<const0> ;
  assign FloatYOut[2] = \<const0> ;
  assign FloatYOut[1] = \<const0> ;
  assign FloatYOut[0] = \<const0> ;
  assign FloatZOut[31] = \<const0> ;
  assign FloatZOut[30] = \<const0> ;
  assign FloatZOut[29] = \^FloatZOut [28];
  assign FloatZOut[28] = \^FloatZOut [28];
  assign FloatZOut[27] = \^FloatZOut [28];
  assign FloatZOut[26:16] = \^FloatZOut [26:16];
  assign FloatZOut[15] = \<const0> ;
  assign FloatZOut[14] = \<const0> ;
  assign FloatZOut[13] = \<const0> ;
  assign FloatZOut[12] = \<const0> ;
  assign FloatZOut[11] = \<const0> ;
  assign FloatZOut[10] = \<const0> ;
  assign FloatZOut[9] = \<const0> ;
  assign FloatZOut[8] = \<const0> ;
  assign FloatZOut[7] = \<const0> ;
  assign FloatZOut[6] = \<const0> ;
  assign FloatZOut[5] = \<const0> ;
  assign FloatZOut[4] = \<const0> ;
  assign FloatZOut[3] = \<const0> ;
  assign FloatZOut[2] = \<const0> ;
  assign FloatZOut[1] = \<const0> ;
  assign FloatZOut[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_UNORM8ToFloat_0_0_UNORM8ToFloat U0
       (.D3DColorIn(D3DColorIn),
        .Enable(Enable),
        .FloatWOut({\^FloatWOut [28],\^FloatWOut [26:16]}),
        .FloatXOut({\^FloatXOut [28],\^FloatXOut [26:16]}),
        .FloatYOut({\^FloatYOut [28],\^FloatYOut [26:16]}),
        .FloatZOut({\^FloatZOut [28],\^FloatZOut [26:16]}),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "UNORM8ToFloat" *) 
module design_1_UNORM8ToFloat_0_0_UNORM8ToFloat
   (FloatXOut,
    FloatYOut,
    FloatZOut,
    FloatWOut,
    D3DColorIn,
    Enable,
    clk);
  output [11:0]FloatXOut;
  output [11:0]FloatYOut;
  output [11:0]FloatZOut;
  output [11:0]FloatWOut;
  input [31:0]D3DColorIn;
  input Enable;
  input clk;

  wire [31:0]D3DColorIn;
  wire Enable;
  wire [11:0]FloatWOut;
  wire \FloatWOut[16]_i_1_n_0 ;
  wire \FloatWOut[17]_i_1_n_0 ;
  wire \FloatWOut[18]_i_1_n_0 ;
  wire \FloatWOut[19]_i_1_n_0 ;
  wire \FloatWOut[19]_i_2_n_0 ;
  wire \FloatWOut[20]_i_1_n_0 ;
  wire \FloatWOut[20]_i_2_n_0 ;
  wire \FloatWOut[21]_i_1_n_0 ;
  wire \FloatWOut[21]_i_2_n_0 ;
  wire \FloatWOut[22]_i_1_n_0 ;
  wire \FloatWOut[22]_i_2_n_0 ;
  wire \FloatWOut[22]_i_3_n_0 ;
  wire \FloatWOut[23]_i_1_n_0 ;
  wire \FloatWOut[23]_i_2_n_0 ;
  wire \FloatWOut[24]_i_1_n_0 ;
  wire \FloatWOut[24]_i_2_n_0 ;
  wire \FloatWOut[25]_i_1_n_0 ;
  wire \FloatWOut[25]_i_2_n_0 ;
  wire \FloatWOut[26]_i_1_n_0 ;
  wire \FloatWOut[26]_i_2_n_0 ;
  wire \FloatWOut[29]_i_1_n_0 ;
  wire \FloatWOut[29]_i_2_n_0 ;
  wire \FloatWOut[29]_i_3_n_0 ;
  wire \FloatWOut[29]_i_4_n_0 ;
  wire \FloatWOut[29]_i_5_n_0 ;
  wire [11:0]FloatXOut;
  wire \FloatXOut[16]_i_1_n_0 ;
  wire \FloatXOut[19]_i_2_n_0 ;
  wire \FloatXOut[20]_i_2_n_0 ;
  wire \FloatXOut[21]_i_2_n_0 ;
  wire \FloatXOut[22]_i_1_n_0 ;
  wire \FloatXOut[22]_i_3_n_0 ;
  wire \FloatXOut[23]_i_1_n_0 ;
  wire \FloatXOut[23]_i_2_n_0 ;
  wire \FloatXOut[24]_i_1_n_0 ;
  wire \FloatXOut[24]_i_2_n_0 ;
  wire \FloatXOut[25]_i_1_n_0 ;
  wire \FloatXOut[25]_i_2_n_0 ;
  wire \FloatXOut[26]_i_1_n_0 ;
  wire \FloatXOut[26]_i_2_n_0 ;
  wire \FloatXOut[29]_i_1_n_0 ;
  wire \FloatXOut[29]_i_2_n_0 ;
  wire \FloatXOut[29]_i_3_n_0 ;
  wire \FloatXOut[29]_i_4_n_0 ;
  wire \FloatXOut[29]_i_5_n_0 ;
  wire [11:0]FloatYOut;
  wire \FloatYOut[16]_i_1_n_0 ;
  wire \FloatYOut[17]_i_1_n_0 ;
  wire \FloatYOut[18]_i_1_n_0 ;
  wire \FloatYOut[19]_i_1_n_0 ;
  wire \FloatYOut[19]_i_2_n_0 ;
  wire \FloatYOut[20]_i_1_n_0 ;
  wire \FloatYOut[20]_i_2_n_0 ;
  wire \FloatYOut[21]_i_1_n_0 ;
  wire \FloatYOut[21]_i_2_n_0 ;
  wire \FloatYOut[22]_i_1_n_0 ;
  wire \FloatYOut[22]_i_2_n_0 ;
  wire \FloatYOut[22]_i_3_n_0 ;
  wire \FloatYOut[23]_i_1_n_0 ;
  wire \FloatYOut[23]_i_2_n_0 ;
  wire \FloatYOut[24]_i_1_n_0 ;
  wire \FloatYOut[24]_i_2_n_0 ;
  wire \FloatYOut[25]_i_1_n_0 ;
  wire \FloatYOut[25]_i_2_n_0 ;
  wire \FloatYOut[26]_i_1_n_0 ;
  wire \FloatYOut[26]_i_2_n_0 ;
  wire \FloatYOut[29]_i_1_n_0 ;
  wire \FloatYOut[29]_i_2_n_0 ;
  wire \FloatYOut[29]_i_3_n_0 ;
  wire \FloatYOut[29]_i_4_n_0 ;
  wire \FloatYOut[29]_i_5_n_0 ;
  wire [11:0]FloatZOut;
  wire \FloatZOut[16]_i_1_n_0 ;
  wire \FloatZOut[17]_i_1_n_0 ;
  wire \FloatZOut[18]_i_1_n_0 ;
  wire \FloatZOut[19]_i_1_n_0 ;
  wire \FloatZOut[19]_i_2_n_0 ;
  wire \FloatZOut[20]_i_1_n_0 ;
  wire \FloatZOut[20]_i_2_n_0 ;
  wire \FloatZOut[21]_i_1_n_0 ;
  wire \FloatZOut[21]_i_2_n_0 ;
  wire \FloatZOut[22]_i_1_n_0 ;
  wire \FloatZOut[22]_i_2_n_0 ;
  wire \FloatZOut[22]_i_3_n_0 ;
  wire \FloatZOut[23]_i_1_n_0 ;
  wire \FloatZOut[23]_i_2_n_0 ;
  wire \FloatZOut[24]_i_1_n_0 ;
  wire \FloatZOut[24]_i_2_n_0 ;
  wire \FloatZOut[25]_i_1_n_0 ;
  wire \FloatZOut[25]_i_2_n_0 ;
  wire \FloatZOut[26]_i_1_n_0 ;
  wire \FloatZOut[26]_i_2_n_0 ;
  wire \FloatZOut[29]_i_1_n_0 ;
  wire \FloatZOut[29]_i_2_n_0 ;
  wire \FloatZOut[29]_i_3_n_0 ;
  wire \FloatZOut[29]_i_4_n_0 ;
  wire \FloatZOut[29]_i_5_n_0 ;
  wire clk;
  wire [22:17]\mantissaBits[255]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FloatWOut[16]_i_1 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[31]),
        .O(\FloatWOut[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h101F)) 
    \FloatWOut[17]_i_1 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[30]),
        .I2(D3DColorIn[31]),
        .I3(D3DColorIn[25]),
        .O(\FloatWOut[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatWOut[18]_i_1 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[29]),
        .I2(D3DColorIn[30]),
        .I3(D3DColorIn[25]),
        .I4(D3DColorIn[31]),
        .I5(D3DColorIn[26]),
        .O(\FloatWOut[18]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \FloatWOut[19]_i_1 
       (.I0(\FloatWOut[19]_i_2_n_0 ),
        .I1(D3DColorIn[31]),
        .I2(D3DColorIn[27]),
        .O(\FloatWOut[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatWOut[19]_i_2 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[28]),
        .I2(D3DColorIn[29]),
        .I3(D3DColorIn[25]),
        .I4(D3DColorIn[30]),
        .I5(D3DColorIn[26]),
        .O(\FloatWOut[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatWOut[20]_i_1 
       (.I0(\FloatWOut[20]_i_2_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(D3DColorIn[27]),
        .I3(D3DColorIn[31]),
        .I4(D3DColorIn[28]),
        .O(\FloatWOut[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatWOut[20]_i_2 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[27]),
        .I2(D3DColorIn[28]),
        .I3(D3DColorIn[25]),
        .I4(D3DColorIn[29]),
        .I5(D3DColorIn[26]),
        .O(\FloatWOut[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatWOut[21]_i_1 
       (.I0(\FloatWOut[21]_i_2_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(D3DColorIn[28]),
        .I3(D3DColorIn[31]),
        .I4(D3DColorIn[29]),
        .O(\FloatWOut[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h005F0000303FFFFF)) 
    \FloatWOut[21]_i_2 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[25]),
        .I2(D3DColorIn[28]),
        .I3(D3DColorIn[26]),
        .I4(D3DColorIn[29]),
        .I5(D3DColorIn[27]),
        .O(\FloatWOut[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA4040000)) 
    \FloatWOut[22]_i_1 
       (.I0(D3DColorIn[30]),
        .I1(\FloatWOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[31]),
        .I3(\FloatWOut[29]_i_5_n_0 ),
        .I4(Enable),
        .O(\FloatWOut[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hA03F)) 
    \FloatWOut[22]_i_2 
       (.I0(\FloatWOut[22]_i_3_n_0 ),
        .I1(D3DColorIn[29]),
        .I2(D3DColorIn[31]),
        .I3(D3DColorIn[30]),
        .O(\FloatWOut[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h130F000000FFFFFF)) 
    \FloatWOut[22]_i_3 
       (.I0(D3DColorIn[24]),
        .I1(D3DColorIn[25]),
        .I2(D3DColorIn[26]),
        .I3(D3DColorIn[27]),
        .I4(D3DColorIn[29]),
        .I5(D3DColorIn[28]),
        .O(\FloatWOut[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFCF0A0A)) 
    \FloatWOut[23]_i_1 
       (.I0(\FloatWOut[29]_i_3_n_0 ),
        .I1(\FloatWOut[23]_i_2_n_0 ),
        .I2(D3DColorIn[30]),
        .I3(\FloatWOut[29]_i_5_n_0 ),
        .I4(D3DColorIn[31]),
        .O(\FloatWOut[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7555500000000)) 
    \FloatWOut[23]_i_2 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[25]),
        .I3(D3DColorIn[24]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hC8FF)) 
    \FloatWOut[24]_i_1 
       (.I0(\FloatWOut[24]_i_2_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(\FloatWOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[31]),
        .O(\FloatWOut[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55D5FFFF00000000)) 
    \FloatWOut[24]_i_2 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[25]),
        .I3(D3DColorIn[24]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatWOut[25]_i_1 
       (.I0(\FloatWOut[25]_i_2_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(\FloatWOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[31]),
        .O(\FloatWOut[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00800000FFFFFFFF)) 
    \FloatWOut[25]_i_2 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[25]),
        .I3(D3DColorIn[24]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEAFF)) 
    \FloatWOut[26]_i_1 
       (.I0(\FloatWOut[26]_i_2_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(\FloatWOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[31]),
        .O(\FloatWOut[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatWOut[26]_i_2 
       (.I0(D3DColorIn[29]),
        .I1(D3DColorIn[27]),
        .I2(D3DColorIn[25]),
        .I3(D3DColorIn[26]),
        .I4(D3DColorIn[28]),
        .I5(D3DColorIn[30]),
        .O(\FloatWOut[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FloatWOut[29]_i_1 
       (.I0(D3DColorIn[31]),
        .I1(\FloatWOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[30]),
        .I3(Enable),
        .O(\FloatWOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatWOut[29]_i_2 
       (.I0(\FloatWOut[29]_i_4_n_0 ),
        .I1(D3DColorIn[30]),
        .I2(\FloatWOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[31]),
        .O(\FloatWOut[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FloatWOut[29]_i_3 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[24]),
        .I3(D3DColorIn[25]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatWOut[29]_i_4 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[25]),
        .I3(D3DColorIn[24]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FloatWOut[29]_i_5 
       (.I0(D3DColorIn[28]),
        .I1(D3DColorIn[26]),
        .I2(D3DColorIn[24]),
        .I3(D3DColorIn[25]),
        .I4(D3DColorIn[27]),
        .I5(D3DColorIn[29]),
        .O(\FloatWOut[29]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[16] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[16]_i_1_n_0 ),
        .Q(FloatWOut[0]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[17] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[17]_i_1_n_0 ),
        .Q(FloatWOut[1]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[18] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[18]_i_1_n_0 ),
        .Q(FloatWOut[2]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[19] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[19]_i_1_n_0 ),
        .Q(FloatWOut[3]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[20] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[20]_i_1_n_0 ),
        .Q(FloatWOut[4]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[21] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[21]_i_1_n_0 ),
        .Q(FloatWOut[5]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[22] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[22]_i_2_n_0 ),
        .Q(FloatWOut[6]),
        .R(\FloatWOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[23] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[23]_i_1_n_0 ),
        .Q(FloatWOut[7]),
        .R(\FloatWOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[24] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[24]_i_1_n_0 ),
        .Q(FloatWOut[8]),
        .R(\FloatWOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[25] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[25]_i_1_n_0 ),
        .Q(FloatWOut[9]),
        .R(\FloatWOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[26] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[26]_i_1_n_0 ),
        .Q(FloatWOut[10]),
        .R(\FloatWOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatWOut_reg[29] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatWOut[29]_i_2_n_0 ),
        .Q(FloatWOut[11]),
        .R(\FloatWOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FloatXOut[16]_i_1 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[23]),
        .O(\FloatXOut[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h101F)) 
    \FloatXOut[17]_i_1 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[22]),
        .I2(D3DColorIn[23]),
        .I3(D3DColorIn[17]),
        .O(\mantissaBits[255]_0 [17]));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatXOut[18]_i_1 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[21]),
        .I2(D3DColorIn[22]),
        .I3(D3DColorIn[17]),
        .I4(D3DColorIn[23]),
        .I5(D3DColorIn[18]),
        .O(\mantissaBits[255]_0 [18]));
  LUT3 #(
    .INIT(8'h8B)) 
    \FloatXOut[19]_i_1 
       (.I0(\FloatXOut[19]_i_2_n_0 ),
        .I1(D3DColorIn[23]),
        .I2(D3DColorIn[19]),
        .O(\mantissaBits[255]_0 [19]));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatXOut[19]_i_2 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[20]),
        .I2(D3DColorIn[21]),
        .I3(D3DColorIn[17]),
        .I4(D3DColorIn[22]),
        .I5(D3DColorIn[18]),
        .O(\FloatXOut[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatXOut[20]_i_1 
       (.I0(\FloatXOut[20]_i_2_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(D3DColorIn[19]),
        .I3(D3DColorIn[23]),
        .I4(D3DColorIn[20]),
        .O(\mantissaBits[255]_0 [20]));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatXOut[20]_i_2 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[19]),
        .I2(D3DColorIn[20]),
        .I3(D3DColorIn[17]),
        .I4(D3DColorIn[21]),
        .I5(D3DColorIn[18]),
        .O(\FloatXOut[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatXOut[21]_i_1 
       (.I0(\FloatXOut[21]_i_2_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(D3DColorIn[20]),
        .I3(D3DColorIn[23]),
        .I4(D3DColorIn[21]),
        .O(\mantissaBits[255]_0 [21]));
  LUT6 #(
    .INIT(64'h005F0000303FFFFF)) 
    \FloatXOut[21]_i_2 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[17]),
        .I2(D3DColorIn[20]),
        .I3(D3DColorIn[18]),
        .I4(D3DColorIn[21]),
        .I5(D3DColorIn[19]),
        .O(\FloatXOut[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA4040000)) 
    \FloatXOut[22]_i_1 
       (.I0(D3DColorIn[22]),
        .I1(\FloatXOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[23]),
        .I3(\FloatXOut[29]_i_5_n_0 ),
        .I4(Enable),
        .O(\FloatXOut[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA03F)) 
    \FloatXOut[22]_i_2 
       (.I0(\FloatXOut[22]_i_3_n_0 ),
        .I1(D3DColorIn[21]),
        .I2(D3DColorIn[23]),
        .I3(D3DColorIn[22]),
        .O(\mantissaBits[255]_0 [22]));
  LUT6 #(
    .INIT(64'h130F000000FFFFFF)) 
    \FloatXOut[22]_i_3 
       (.I0(D3DColorIn[16]),
        .I1(D3DColorIn[17]),
        .I2(D3DColorIn[18]),
        .I3(D3DColorIn[19]),
        .I4(D3DColorIn[21]),
        .I5(D3DColorIn[20]),
        .O(\FloatXOut[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFCF0A0A)) 
    \FloatXOut[23]_i_1 
       (.I0(\FloatXOut[29]_i_3_n_0 ),
        .I1(\FloatXOut[23]_i_2_n_0 ),
        .I2(D3DColorIn[22]),
        .I3(\FloatXOut[29]_i_5_n_0 ),
        .I4(D3DColorIn[23]),
        .O(\FloatXOut[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7555500000000)) 
    \FloatXOut[23]_i_2 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[16]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hC8FF)) 
    \FloatXOut[24]_i_1 
       (.I0(\FloatXOut[24]_i_2_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(\FloatXOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[23]),
        .O(\FloatXOut[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55D5FFFF00000000)) 
    \FloatXOut[24]_i_2 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[16]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatXOut[25]_i_1 
       (.I0(\FloatXOut[25]_i_2_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(\FloatXOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[23]),
        .O(\FloatXOut[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00800000FFFFFFFF)) 
    \FloatXOut[25]_i_2 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[16]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hEAFF)) 
    \FloatXOut[26]_i_1 
       (.I0(\FloatXOut[26]_i_2_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(\FloatXOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[23]),
        .O(\FloatXOut[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatXOut[26]_i_2 
       (.I0(D3DColorIn[21]),
        .I1(D3DColorIn[19]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[18]),
        .I4(D3DColorIn[20]),
        .I5(D3DColorIn[22]),
        .O(\FloatXOut[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FloatXOut[29]_i_1 
       (.I0(D3DColorIn[23]),
        .I1(\FloatXOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[22]),
        .I3(Enable),
        .O(\FloatXOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatXOut[29]_i_2 
       (.I0(\FloatXOut[29]_i_4_n_0 ),
        .I1(D3DColorIn[22]),
        .I2(\FloatXOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[23]),
        .O(\FloatXOut[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FloatXOut[29]_i_3 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[16]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatXOut[29]_i_4 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[16]),
        .I3(D3DColorIn[17]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FloatXOut[29]_i_5 
       (.I0(D3DColorIn[20]),
        .I1(D3DColorIn[18]),
        .I2(D3DColorIn[17]),
        .I3(D3DColorIn[16]),
        .I4(D3DColorIn[19]),
        .I5(D3DColorIn[21]),
        .O(\FloatXOut[29]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[16] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[16]_i_1_n_0 ),
        .Q(FloatXOut[0]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[17] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [17]),
        .Q(FloatXOut[1]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[18] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [18]),
        .Q(FloatXOut[2]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[19] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [19]),
        .Q(FloatXOut[3]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[20] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [20]),
        .Q(FloatXOut[4]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[21] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [21]),
        .Q(FloatXOut[5]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[22] 
       (.C(clk),
        .CE(Enable),
        .D(\mantissaBits[255]_0 [22]),
        .Q(FloatXOut[6]),
        .R(\FloatXOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[23] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[23]_i_1_n_0 ),
        .Q(FloatXOut[7]),
        .R(\FloatXOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[24] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[24]_i_1_n_0 ),
        .Q(FloatXOut[8]),
        .R(\FloatXOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[25] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[25]_i_1_n_0 ),
        .Q(FloatXOut[9]),
        .R(\FloatXOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[26] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[26]_i_1_n_0 ),
        .Q(FloatXOut[10]),
        .R(\FloatXOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatXOut_reg[29] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatXOut[29]_i_2_n_0 ),
        .Q(FloatXOut[11]),
        .R(\FloatXOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FloatYOut[16]_i_1 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[15]),
        .O(\FloatYOut[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h101F)) 
    \FloatYOut[17]_i_1 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[14]),
        .I2(D3DColorIn[15]),
        .I3(D3DColorIn[9]),
        .O(\FloatYOut[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatYOut[18]_i_1 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[13]),
        .I2(D3DColorIn[14]),
        .I3(D3DColorIn[9]),
        .I4(D3DColorIn[15]),
        .I5(D3DColorIn[10]),
        .O(\FloatYOut[18]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \FloatYOut[19]_i_1 
       (.I0(\FloatYOut[19]_i_2_n_0 ),
        .I1(D3DColorIn[15]),
        .I2(D3DColorIn[11]),
        .O(\FloatYOut[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatYOut[19]_i_2 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[12]),
        .I2(D3DColorIn[13]),
        .I3(D3DColorIn[9]),
        .I4(D3DColorIn[14]),
        .I5(D3DColorIn[10]),
        .O(\FloatYOut[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatYOut[20]_i_1 
       (.I0(\FloatYOut[20]_i_2_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(D3DColorIn[11]),
        .I3(D3DColorIn[15]),
        .I4(D3DColorIn[12]),
        .O(\FloatYOut[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatYOut[20]_i_2 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[11]),
        .I2(D3DColorIn[12]),
        .I3(D3DColorIn[9]),
        .I4(D3DColorIn[13]),
        .I5(D3DColorIn[10]),
        .O(\FloatYOut[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatYOut[21]_i_1 
       (.I0(\FloatYOut[21]_i_2_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(D3DColorIn[12]),
        .I3(D3DColorIn[15]),
        .I4(D3DColorIn[13]),
        .O(\FloatYOut[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h005F0000303FFFFF)) 
    \FloatYOut[21]_i_2 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[9]),
        .I2(D3DColorIn[12]),
        .I3(D3DColorIn[10]),
        .I4(D3DColorIn[13]),
        .I5(D3DColorIn[11]),
        .O(\FloatYOut[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA4040000)) 
    \FloatYOut[22]_i_1 
       (.I0(D3DColorIn[14]),
        .I1(\FloatYOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[15]),
        .I3(\FloatYOut[29]_i_5_n_0 ),
        .I4(Enable),
        .O(\FloatYOut[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA03F)) 
    \FloatYOut[22]_i_2 
       (.I0(\FloatYOut[22]_i_3_n_0 ),
        .I1(D3DColorIn[13]),
        .I2(D3DColorIn[15]),
        .I3(D3DColorIn[14]),
        .O(\FloatYOut[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h130F000000FFFFFF)) 
    \FloatYOut[22]_i_3 
       (.I0(D3DColorIn[8]),
        .I1(D3DColorIn[9]),
        .I2(D3DColorIn[10]),
        .I3(D3DColorIn[11]),
        .I4(D3DColorIn[13]),
        .I5(D3DColorIn[12]),
        .O(\FloatYOut[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFCF0A0A)) 
    \FloatYOut[23]_i_1 
       (.I0(\FloatYOut[29]_i_3_n_0 ),
        .I1(\FloatYOut[23]_i_2_n_0 ),
        .I2(D3DColorIn[14]),
        .I3(\FloatYOut[29]_i_5_n_0 ),
        .I4(D3DColorIn[15]),
        .O(\FloatYOut[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7555500000000)) 
    \FloatYOut[23]_i_2 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[8]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hC8FF)) 
    \FloatYOut[24]_i_1 
       (.I0(\FloatYOut[24]_i_2_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(\FloatYOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[15]),
        .O(\FloatYOut[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55D5FFFF00000000)) 
    \FloatYOut[24]_i_2 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[8]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatYOut[25]_i_1 
       (.I0(\FloatYOut[25]_i_2_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(\FloatYOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[15]),
        .O(\FloatYOut[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00800000FFFFFFFF)) 
    \FloatYOut[25]_i_2 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[8]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hEAFF)) 
    \FloatYOut[26]_i_1 
       (.I0(\FloatYOut[26]_i_2_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(\FloatYOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[15]),
        .O(\FloatYOut[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatYOut[26]_i_2 
       (.I0(D3DColorIn[13]),
        .I1(D3DColorIn[11]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[10]),
        .I4(D3DColorIn[12]),
        .I5(D3DColorIn[14]),
        .O(\FloatYOut[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FloatYOut[29]_i_1 
       (.I0(D3DColorIn[15]),
        .I1(\FloatYOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[14]),
        .I3(Enable),
        .O(\FloatYOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatYOut[29]_i_2 
       (.I0(\FloatYOut[29]_i_4_n_0 ),
        .I1(D3DColorIn[14]),
        .I2(\FloatYOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[15]),
        .O(\FloatYOut[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FloatYOut[29]_i_3 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[8]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatYOut[29]_i_4 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[8]),
        .I3(D3DColorIn[9]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FloatYOut[29]_i_5 
       (.I0(D3DColorIn[12]),
        .I1(D3DColorIn[10]),
        .I2(D3DColorIn[9]),
        .I3(D3DColorIn[8]),
        .I4(D3DColorIn[11]),
        .I5(D3DColorIn[13]),
        .O(\FloatYOut[29]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[16] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[16]_i_1_n_0 ),
        .Q(FloatYOut[0]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[17] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[17]_i_1_n_0 ),
        .Q(FloatYOut[1]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[18] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[18]_i_1_n_0 ),
        .Q(FloatYOut[2]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[19] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[19]_i_1_n_0 ),
        .Q(FloatYOut[3]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[20] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[20]_i_1_n_0 ),
        .Q(FloatYOut[4]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[21] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[21]_i_1_n_0 ),
        .Q(FloatYOut[5]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[22] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[22]_i_2_n_0 ),
        .Q(FloatYOut[6]),
        .R(\FloatYOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[23] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[23]_i_1_n_0 ),
        .Q(FloatYOut[7]),
        .R(\FloatYOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[24] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[24]_i_1_n_0 ),
        .Q(FloatYOut[8]),
        .R(\FloatYOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[25] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[25]_i_1_n_0 ),
        .Q(FloatYOut[9]),
        .R(\FloatYOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[26] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[26]_i_1_n_0 ),
        .Q(FloatYOut[10]),
        .R(\FloatYOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatYOut_reg[29] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatYOut[29]_i_2_n_0 ),
        .Q(FloatYOut[11]),
        .R(\FloatYOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FloatZOut[16]_i_1 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[7]),
        .O(\FloatZOut[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h101F)) 
    \FloatZOut[17]_i_1 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[6]),
        .I2(D3DColorIn[7]),
        .I3(D3DColorIn[1]),
        .O(\FloatZOut[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatZOut[18]_i_1 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[5]),
        .I2(D3DColorIn[6]),
        .I3(D3DColorIn[1]),
        .I4(D3DColorIn[7]),
        .I5(D3DColorIn[2]),
        .O(\FloatZOut[18]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8B)) 
    \FloatZOut[19]_i_1 
       (.I0(\FloatZOut[19]_i_2_n_0 ),
        .I1(D3DColorIn[7]),
        .I2(D3DColorIn[3]),
        .O(\FloatZOut[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatZOut[19]_i_2 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[4]),
        .I2(D3DColorIn[5]),
        .I3(D3DColorIn[1]),
        .I4(D3DColorIn[6]),
        .I5(D3DColorIn[2]),
        .O(\FloatZOut[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatZOut[20]_i_1 
       (.I0(\FloatZOut[20]_i_2_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(D3DColorIn[3]),
        .I3(D3DColorIn[7]),
        .I4(D3DColorIn[4]),
        .O(\FloatZOut[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101F0000101FFFFF)) 
    \FloatZOut[20]_i_2 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[3]),
        .I2(D3DColorIn[4]),
        .I3(D3DColorIn[1]),
        .I4(D3DColorIn[5]),
        .I5(D3DColorIn[2]),
        .O(\FloatZOut[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8B008BFF)) 
    \FloatZOut[21]_i_1 
       (.I0(\FloatZOut[21]_i_2_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(D3DColorIn[4]),
        .I3(D3DColorIn[7]),
        .I4(D3DColorIn[5]),
        .O(\FloatZOut[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h005F0000303FFFFF)) 
    \FloatZOut[21]_i_2 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[1]),
        .I2(D3DColorIn[4]),
        .I3(D3DColorIn[2]),
        .I4(D3DColorIn[5]),
        .I5(D3DColorIn[3]),
        .O(\FloatZOut[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA4040000)) 
    \FloatZOut[22]_i_1 
       (.I0(D3DColorIn[6]),
        .I1(\FloatZOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[7]),
        .I3(\FloatZOut[29]_i_5_n_0 ),
        .I4(Enable),
        .O(\FloatZOut[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hA03F)) 
    \FloatZOut[22]_i_2 
       (.I0(\FloatZOut[22]_i_3_n_0 ),
        .I1(D3DColorIn[5]),
        .I2(D3DColorIn[7]),
        .I3(D3DColorIn[6]),
        .O(\FloatZOut[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h130F000000FFFFFF)) 
    \FloatZOut[22]_i_3 
       (.I0(D3DColorIn[0]),
        .I1(D3DColorIn[1]),
        .I2(D3DColorIn[2]),
        .I3(D3DColorIn[3]),
        .I4(D3DColorIn[5]),
        .I5(D3DColorIn[4]),
        .O(\FloatZOut[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFCF0A0A)) 
    \FloatZOut[23]_i_1 
       (.I0(\FloatZOut[29]_i_3_n_0 ),
        .I1(\FloatZOut[23]_i_2_n_0 ),
        .I2(D3DColorIn[6]),
        .I3(\FloatZOut[29]_i_5_n_0 ),
        .I4(D3DColorIn[7]),
        .O(\FloatZOut[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7555500000000)) 
    \FloatZOut[23]_i_2 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[0]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hC8FF)) 
    \FloatZOut[24]_i_1 
       (.I0(\FloatZOut[24]_i_2_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(\FloatZOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[7]),
        .O(\FloatZOut[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55D5FFFF00000000)) 
    \FloatZOut[24]_i_2 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[0]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatZOut[25]_i_1 
       (.I0(\FloatZOut[25]_i_2_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(\FloatZOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[7]),
        .O(\FloatZOut[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00800000FFFFFFFF)) 
    \FloatZOut[25]_i_2 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[0]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hEAFF)) 
    \FloatZOut[26]_i_1 
       (.I0(\FloatZOut[26]_i_2_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(\FloatZOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[7]),
        .O(\FloatZOut[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatZOut[26]_i_2 
       (.I0(D3DColorIn[5]),
        .I1(D3DColorIn[3]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[2]),
        .I4(D3DColorIn[4]),
        .I5(D3DColorIn[6]),
        .O(\FloatZOut[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \FloatZOut[29]_i_1 
       (.I0(D3DColorIn[7]),
        .I1(\FloatZOut[29]_i_3_n_0 ),
        .I2(D3DColorIn[6]),
        .I3(Enable),
        .O(\FloatZOut[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FloatZOut[29]_i_2 
       (.I0(\FloatZOut[29]_i_4_n_0 ),
        .I1(D3DColorIn[6]),
        .I2(\FloatZOut[29]_i_5_n_0 ),
        .I3(D3DColorIn[7]),
        .O(\FloatZOut[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FloatZOut[29]_i_3 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[0]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FloatZOut[29]_i_4 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[0]),
        .I3(D3DColorIn[1]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FloatZOut[29]_i_5 
       (.I0(D3DColorIn[4]),
        .I1(D3DColorIn[2]),
        .I2(D3DColorIn[1]),
        .I3(D3DColorIn[0]),
        .I4(D3DColorIn[3]),
        .I5(D3DColorIn[5]),
        .O(\FloatZOut[29]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[16] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[16]_i_1_n_0 ),
        .Q(FloatZOut[0]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[17] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[17]_i_1_n_0 ),
        .Q(FloatZOut[1]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[18] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[18]_i_1_n_0 ),
        .Q(FloatZOut[2]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[19] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[19]_i_1_n_0 ),
        .Q(FloatZOut[3]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[20] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[20]_i_1_n_0 ),
        .Q(FloatZOut[4]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[21] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[21]_i_1_n_0 ),
        .Q(FloatZOut[5]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[22] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[22]_i_2_n_0 ),
        .Q(FloatZOut[6]),
        .R(\FloatZOut[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[23] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[23]_i_1_n_0 ),
        .Q(FloatZOut[7]),
        .R(\FloatZOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[24] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[24]_i_1_n_0 ),
        .Q(FloatZOut[8]),
        .R(\FloatZOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[25] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[25]_i_1_n_0 ),
        .Q(FloatZOut[9]),
        .R(\FloatZOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[26] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[26]_i_1_n_0 ),
        .Q(FloatZOut[10]),
        .R(\FloatZOut[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FloatZOut_reg[29] 
       (.C(clk),
        .CE(Enable),
        .D(\FloatZOut[29]_i_2_n_0 ),
        .Q(FloatZOut[11]),
        .R(\FloatZOut[29]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
