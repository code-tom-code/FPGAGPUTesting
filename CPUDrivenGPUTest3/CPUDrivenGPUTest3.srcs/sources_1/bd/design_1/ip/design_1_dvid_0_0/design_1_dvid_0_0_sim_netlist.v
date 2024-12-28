// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:44:04 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_dvid_0_0/design_1_dvid_0_0_sim_netlist.v
// Design      : design_1_dvid_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_dvid_0_0,dvid,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dvid,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_dvid_0_0
   (clk_x10,
    clk_x10n,
    clk_pixel_x1,
    scanout_en,
    red_p,
    green_p,
    blue_p,
    blank,
    hsync,
    vsync,
    controlChannel0Blue,
    controlChannel1Green,
    controlChannel2Red,
    guardBandEnable,
    guardBandType,
    isTERC4Region,
    TERC4Character0,
    TERC4Character1,
    TERC4Character2,
    red_s,
    green_s,
    blue_s,
    cl_s,
    EncodedB,
    EncodedG,
    EncodedR);
  input clk_x10;
  input clk_x10n;
  input clk_pixel_x1;
  input scanout_en;
  input [7:0]red_p;
  input [7:0]green_p;
  input [7:0]blue_p;
  input blank;
  input hsync;
  input vsync;
  input [1:0]controlChannel0Blue;
  input [1:0]controlChannel1Green;
  input [1:0]controlChannel2Red;
  input guardBandEnable;
  input guardBandType;
  input isTERC4Region;
  input [3:0]TERC4Character0;
  input [3:0]TERC4Character1;
  input [3:0]TERC4Character2;
  output red_s;
  output green_s;
  output blue_s;
  output cl_s;
  output [9:0]EncodedB;
  output [9:0]EncodedG;
  output [9:0]EncodedR;

  wire [9:0]EncodedB;
  wire [9:0]EncodedG;
  wire [9:0]EncodedR;
  wire [3:0]TERC4Character0;
  wire [3:0]TERC4Character1;
  wire [3:0]TERC4Character2;
  wire blank;
  wire [7:0]blue_p;
  wire blue_s;
  wire cl_s;
  wire clk_pixel_x1;
  wire clk_x10;
  wire [1:0]controlChannel0Blue;
  wire [1:0]controlChannel1Green;
  wire [1:0]controlChannel2Red;
  wire [7:0]green_p;
  wire green_s;
  wire guardBandEnable;
  wire guardBandType;
  wire isTERC4Region;
  wire [7:0]red_p;
  wire red_s;
  wire scanout_en;

  design_1_dvid_0_0_dvid U0
       (.EncodedB(EncodedB),
        .EncodedG(EncodedG),
        .EncodedR(EncodedR),
        .TERC4Character0(TERC4Character0),
        .TERC4Character1(TERC4Character1),
        .TERC4Character2(TERC4Character2),
        .blank(blank),
        .blue_p(blue_p),
        .blue_s(blue_s),
        .cl_s(cl_s),
        .clk_pixel_x1(clk_pixel_x1),
        .clk_x10(clk_x10),
        .controlChannel0Blue(controlChannel0Blue),
        .controlChannel1Green(controlChannel1Green),
        .controlChannel2Red(controlChannel2Red),
        .green_p(green_p),
        .green_s(green_s),
        .guardBandEnable(guardBandEnable),
        .guardBandType(guardBandType),
        .isTERC4Region(isTERC4Region),
        .red_p(red_p),
        .red_s(red_s),
        .scanout_en(scanout_en));
endmodule

(* ORIG_REF_NAME = "TDMS_encoder" *) 
module design_1_dvid_0_0_TDMS_encoder
   (\e_reg[9]_0 ,
    EncodedR,
    red_p,
    blank,
    isTERC4Region,
    guardBandEnable,
    guardBandType,
    controlChannel2Red,
    TERC4Character2,
    clk_pixel_x1);
  output \e_reg[9]_0 ;
  output [9:0]EncodedR;
  input [7:0]red_p;
  input blank;
  input isTERC4Region;
  input guardBandEnable;
  input guardBandType;
  input [1:0]controlChannel2Red;
  input [3:0]TERC4Character2;
  input clk_pixel_x1;

  wire [9:0]EncodedR;
  wire [3:0]TERC4Character2;
  wire blank;
  wire clk_pixel_x1;
  wire [1:0]controlChannel2Red;
  wire \dc_bias[0]_i_1__0_n_0 ;
  wire \dc_bias[0]_i_2__0_n_0 ;
  wire \dc_bias[0]_i_3__0_n_0 ;
  wire \dc_bias[0]_i_4__1_n_0 ;
  wire \dc_bias[0]_i_5__0_n_0 ;
  wire \dc_bias[0]_i_6_n_0 ;
  wire \dc_bias[1]_i_10_n_0 ;
  wire \dc_bias[1]_i_11_n_0 ;
  wire \dc_bias[1]_i_2__0_n_0 ;
  wire \dc_bias[1]_i_3__0_n_0 ;
  wire \dc_bias[1]_i_4__1_n_0 ;
  wire \dc_bias[1]_i_5_n_0 ;
  wire \dc_bias[1]_i_6_n_0 ;
  wire \dc_bias[1]_i_7__0_n_0 ;
  wire \dc_bias[1]_i_8__1_n_0 ;
  wire \dc_bias[1]_i_9__1_n_0 ;
  wire \dc_bias[2]_i_10__0_n_0 ;
  wire \dc_bias[2]_i_11__0_n_0 ;
  wire \dc_bias[2]_i_1_n_0 ;
  wire \dc_bias[2]_i_3__0_n_0 ;
  wire \dc_bias[2]_i_4__0_n_0 ;
  wire \dc_bias[2]_i_5__0_n_0 ;
  wire \dc_bias[2]_i_6__0_n_0 ;
  wire \dc_bias[2]_i_7__0_n_0 ;
  wire \dc_bias[2]_i_8__0_n_0 ;
  wire \dc_bias[2]_i_9__1_n_0 ;
  wire \dc_bias[3]_i_10__0_n_0 ;
  wire \dc_bias[3]_i_11__0_n_0 ;
  wire \dc_bias[3]_i_12_n_0 ;
  wire \dc_bias[3]_i_13__0_n_0 ;
  wire \dc_bias[3]_i_14_n_0 ;
  wire \dc_bias[3]_i_15__0_n_0 ;
  wire \dc_bias[3]_i_16__0_n_0 ;
  wire \dc_bias[3]_i_17__0_n_0 ;
  wire \dc_bias[3]_i_18__1_n_0 ;
  wire \dc_bias[3]_i_19_n_0 ;
  wire \dc_bias[3]_i_1_n_0 ;
  wire \dc_bias[3]_i_20_n_0 ;
  wire \dc_bias[3]_i_21_n_0 ;
  wire \dc_bias[3]_i_22_n_0 ;
  wire \dc_bias[3]_i_23_n_0 ;
  wire \dc_bias[3]_i_24_n_0 ;
  wire \dc_bias[3]_i_25_n_0 ;
  wire \dc_bias[3]_i_26_n_0 ;
  wire \dc_bias[3]_i_27_n_0 ;
  wire \dc_bias[3]_i_2__0_n_0 ;
  wire \dc_bias[3]_i_3__0_n_0 ;
  wire \dc_bias[3]_i_4__0_n_0 ;
  wire \dc_bias[3]_i_5__0_n_0 ;
  wire \dc_bias[3]_i_6__1_n_0 ;
  wire \dc_bias[3]_i_7__0_n_0 ;
  wire \dc_bias[3]_i_8__0_n_0 ;
  wire \dc_bias[3]_i_9__0_n_0 ;
  wire \dc_bias_reg[1]_i_1__0_n_0 ;
  wire \dc_bias_reg[2]_i_2_n_0 ;
  wire \dc_bias_reg_n_0_[0] ;
  wire \dc_bias_reg_n_0_[1] ;
  wire \dc_bias_reg_n_0_[2] ;
  wire \e[0]_i_1__0_n_0 ;
  wire \e[0]_i_2_n_0 ;
  wire \e[1]_i_2__0_n_0 ;
  wire \e[1]_i_3__0_n_0 ;
  wire \e[2]_i_1__0_n_0 ;
  wire \e[2]_i_2_n_0 ;
  wire \e[3]_i_1__0_n_0 ;
  wire \e[3]_i_2__0_n_0 ;
  wire \e[3]_i_3__1_n_0 ;
  wire \e[4]_i_1__0_n_0 ;
  wire \e[4]_i_2__0_n_0 ;
  wire \e[5]_i_2__0_n_0 ;
  wire \e[5]_i_3__0_n_0 ;
  wire \e[5]_i_4__0_n_0 ;
  wire \e[6]_i_1__0_n_0 ;
  wire \e[6]_i_2_n_0 ;
  wire \e[6]_i_3__0_n_0 ;
  wire \e[6]_i_4_n_0 ;
  wire \e[7]_i_10_n_0 ;
  wire \e[7]_i_11_n_0 ;
  wire \e[7]_i_12_n_0 ;
  wire \e[7]_i_1__0_n_0 ;
  wire \e[7]_i_2__0_n_0 ;
  wire \e[7]_i_3_n_0 ;
  wire \e[7]_i_4_n_0 ;
  wire \e[7]_i_5__0_n_0 ;
  wire \e[7]_i_6_n_0 ;
  wire \e[7]_i_7_n_0 ;
  wire \e[7]_i_8_n_0 ;
  wire \e[7]_i_9_n_0 ;
  wire \e[8]_i_1_n_0 ;
  wire \e[8]_i_2_n_0 ;
  wire \e[8]_i_3__0_n_0 ;
  wire \e[8]_i_4_n_0 ;
  wire \e[8]_i_5_n_0 ;
  wire \e[8]_i_6_n_0 ;
  wire \e[8]_i_7_n_0 ;
  wire \e[9]_i_1__0_n_0 ;
  wire \e[9]_i_2__0_n_0 ;
  wire \e[9]_i_3__0_n_0 ;
  wire \e[9]_i_4__1_n_0 ;
  wire \e_reg[1]_i_1_n_0 ;
  wire \e_reg[5]_i_1_n_0 ;
  wire \e_reg[9]_0 ;
  wire guardBandEnable;
  wire guardBandType;
  wire isTERC4Region;
  wire p_1_in;
  wire [7:0]red_p;

  LUT6 #(
    .INIT(64'h9F90909F909F9F90)) 
    \dc_bias[0]_i_1__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias[0]_i_2__0_n_0 ),
        .I2(\e[7]_i_3_n_0 ),
        .I3(\e[7]_i_5__0_n_0 ),
        .I4(\dc_bias[0]_i_3__0_n_0 ),
        .I5(\dc_bias[0]_i_4__1_n_0 ),
        .O(\dc_bias[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[0]_i_2__0 
       (.I0(red_p[0]),
        .I1(\e[7]_i_4_n_0 ),
        .I2(\dc_bias[0]_i_5__0_n_0 ),
        .I3(\dc_bias[0]_i_6_n_0 ),
        .I4(\e[7]_i_11_n_0 ),
        .O(\dc_bias[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_3__0 
       (.I0(\e[3]_i_3__1_n_0 ),
        .I1(red_p[5]),
        .I2(red_p[0]),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(red_p[7]),
        .O(\dc_bias[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[0]_i_4__1 
       (.I0(red_p[2]),
        .I1(\e[8]_i_2_n_0 ),
        .O(\dc_bias[0]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[0]_i_5__0 
       (.I0(red_p[5]),
        .I1(red_p[6]),
        .O(\dc_bias[0]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dc_bias[0]_i_6 
       (.I0(red_p[5]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[0]),
        .I4(red_p[1]),
        .I5(red_p[4]),
        .O(\dc_bias[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[1]_i_10 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[1]_i_11 
       (.I0(red_p[5]),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .I4(red_p[3]),
        .O(\dc_bias[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9556FFFF95560000)) 
    \dc_bias[1]_i_2__0 
       (.I0(\dc_bias[1]_i_4__1_n_0 ),
        .I1(\e[8]_i_2_n_0 ),
        .I2(\dc_bias[0]_i_2__0_n_0 ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\e[7]_i_5__0_n_0 ),
        .I5(\dc_bias[1]_i_5_n_0 ),
        .O(\dc_bias[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h690069FF69FF6900)) 
    \dc_bias[1]_i_3__0 
       (.I0(\dc_bias[1]_i_6_n_0 ),
        .I1(\dc_bias[1]_i_7__0_n_0 ),
        .I2(\e[7]_i_8_n_0 ),
        .I3(\e[8]_i_2_n_0 ),
        .I4(\dc_bias[3]_i_10__0_n_0 ),
        .I5(\dc_bias[1]_i_4__1_n_0 ),
        .O(\dc_bias[1]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[1]_i_4__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias[3]_i_9__0_n_0 ),
        .O(\dc_bias[1]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'hA6659AA66559A665)) 
    \dc_bias[1]_i_5 
       (.I0(\dc_bias[2]_i_8__0_n_0 ),
        .I1(\dc_bias[1]_i_8__1_n_0 ),
        .I2(\dc_bias[1]_i_9__1_n_0 ),
        .I3(\dc_bias[1]_i_10_n_0 ),
        .I4(red_p[7]),
        .I5(\dc_bias[1]_i_11_n_0 ),
        .O(\dc_bias[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h28BEBE28EB8282EB)) 
    \dc_bias[1]_i_6 
       (.I0(\e[7]_i_11_n_0 ),
        .I1(\dc_bias[0]_i_5__0_n_0 ),
        .I2(\dc_bias[0]_i_6_n_0 ),
        .I3(\dc_bias[1]_i_10_n_0 ),
        .I4(\e[7]_i_4_n_0 ),
        .I5(\e[8]_i_2_n_0 ),
        .O(\dc_bias[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \dc_bias[1]_i_7__0 
       (.I0(\dc_bias[3]_i_20_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(red_p[0]),
        .I3(\e[7]_i_9_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[1]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[1]_i_8__1 
       (.I0(red_p[2]),
        .I1(red_p[0]),
        .I2(red_p[1]),
        .O(\dc_bias[1]_i_8__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[1]_i_9__1 
       (.I0(red_p[0]),
        .I1(red_p[1]),
        .I2(\e[8]_i_2_n_0 ),
        .O(\dc_bias[1]_i_9__1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBB88B8888)) 
    \dc_bias[2]_i_1 
       (.I0(\dc_bias_reg[2]_i_2_n_0 ),
        .I1(\e[7]_i_3_n_0 ),
        .I2(\dc_bias[2]_i_3__0_n_0 ),
        .I3(\dc_bias[2]_i_4__0_n_0 ),
        .I4(\e[7]_i_5__0_n_0 ),
        .I5(\dc_bias[2]_i_5__0_n_0 ),
        .O(\dc_bias[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h066F6F06)) 
    \dc_bias[2]_i_10__0 
       (.I0(\e[3]_i_3__1_n_0 ),
        .I1(red_p[5]),
        .I2(red_p[7]),
        .I3(red_p[0]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_10__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \dc_bias[2]_i_11__0 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(red_p[2]),
        .I2(\dc_bias[0]_i_3__0_n_0 ),
        .O(\dc_bias[2]_i_11__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'hF9999990)) 
    \dc_bias[2]_i_3__0 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias[3]_i_9__0_n_0 ),
        .I2(\e[8]_i_2_n_0 ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\dc_bias[0]_i_2__0_n_0 ),
        .O(\dc_bias[2]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'h2DD2)) 
    \dc_bias[2]_i_4__0 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias[3]_i_9__0_n_0 ),
        .I2(\dc_bias[3]_i_11__0_n_0 ),
        .I3(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h000000009556566A)) 
    \dc_bias[2]_i_5__0 
       (.I0(\dc_bias[3]_i_13__0_n_0 ),
        .I1(\dc_bias[2]_i_8__0_n_0 ),
        .I2(\dc_bias[2]_i_9__1_n_0 ),
        .I3(\dc_bias[2]_i_10__0_n_0 ),
        .I4(\dc_bias[2]_i_11__0_n_0 ),
        .I5(\e[7]_i_5__0_n_0 ),
        .O(\dc_bias[2]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'h2BD4D42B)) 
    \dc_bias[2]_i_6__0 
       (.I0(\dc_bias[3]_i_9__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_10__0_n_0 ),
        .I3(\dc_bias[3]_i_11__0_n_0 ),
        .I4(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h9A59A69AA69A65A6)) 
    \dc_bias[2]_i_7__0 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\e[7]_i_9_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[3]_i_19_n_0 ),
        .I4(\e[7]_i_8_n_0 ),
        .I5(\dc_bias[1]_i_6_n_0 ),
        .O(\dc_bias[2]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h69999666)) 
    \dc_bias[2]_i_8__0 
       (.I0(\dc_bias[3]_i_23_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(red_p[0]),
        .I4(\dc_bias[3]_i_24_n_0 ),
        .O(\dc_bias[2]_i_8__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hEB7D)) 
    \dc_bias[2]_i_9__1 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .O(\dc_bias[2]_i_9__1_n_0 ));
  LUT6 #(
    .INIT(64'hAB00AB00AB00ABAB)) 
    \dc_bias[3]_i_1 
       (.I0(\dc_bias[3]_i_2__0_n_0 ),
        .I1(\e[8]_i_2_n_0 ),
        .I2(\dc_bias[3]_i_3__0_n_0 ),
        .I3(\dc_bias[3]_i_4__0_n_0 ),
        .I4(\dc_bias[3]_i_5__0_n_0 ),
        .I5(\dc_bias[3]_i_6__1_n_0 ),
        .O(\dc_bias[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \dc_bias[3]_i_10__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias[0]_i_2__0_n_0 ),
        .O(\dc_bias[3]_i_10__0_n_0 ));
  LUT6 #(
    .INIT(64'h424444D444D4D4DD)) 
    \dc_bias[3]_i_11__0 
       (.I0(\e[7]_i_8_n_0 ),
        .I1(\e[7]_i_9_n_0 ),
        .I2(\dc_bias[3]_i_21_n_0 ),
        .I3(\dc_bias[3]_i_20_n_0 ),
        .I4(red_p[0]),
        .I5(\e[7]_i_11_n_0 ),
        .O(\dc_bias[3]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'h555556556A56AA6A)) 
    \dc_bias[3]_i_12 
       (.I0(p_1_in),
        .I1(\dc_bias[3]_i_22_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[3]_i_23_n_0 ),
        .I4(\dc_bias[3]_i_24_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hD44242422BBDBDBD)) 
    \dc_bias[3]_i_13__0 
       (.I0(\dc_bias[3]_i_23_n_0 ),
        .I1(\dc_bias[3]_i_24_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(red_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_13__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000069006969FF)) 
    \dc_bias[3]_i_14 
       (.I0(\dc_bias[3]_i_23_n_0 ),
        .I1(\dc_bias[3]_i_25_n_0 ),
        .I2(\dc_bias[3]_i_24_n_0 ),
        .I3(\dc_bias[2]_i_9__1_n_0 ),
        .I4(\dc_bias[2]_i_10__0_n_0 ),
        .I5(\dc_bias[2]_i_11__0_n_0 ),
        .O(\dc_bias[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF9669FFFF)) 
    \dc_bias[3]_i_15__0 
       (.I0(\dc_bias[3]_i_23_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_22_n_0 ),
        .I3(\dc_bias[3]_i_24_n_0 ),
        .I4(\dc_bias[2]_i_9__1_n_0 ),
        .I5(\dc_bias[3]_i_26_n_0 ),
        .O(\dc_bias[3]_i_15__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \dc_bias[3]_i_16__0 
       (.I0(\dc_bias[0]_i_2__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[8]_i_2_n_0 ),
        .O(\dc_bias[3]_i_16__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \dc_bias[3]_i_17__0 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(\dc_bias[0]_i_2__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_17__0_n_0 ));
  LUT6 #(
    .INIT(64'hD002FDD0FFFFFFFF)) 
    \dc_bias[3]_i_18__1 
       (.I0(\e[7]_i_11_n_0 ),
        .I1(\e[7]_i_12_n_0 ),
        .I2(\e[7]_i_10_n_0 ),
        .I3(\e[7]_i_9_n_0 ),
        .I4(\e[7]_i_8_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_18__1_n_0 ));
  LUT6 #(
    .INIT(64'h7117177117717117)) 
    \dc_bias[3]_i_19 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\dc_bias[0]_i_5__0_n_0 ),
        .I3(\e[6]_i_3__0_n_0 ),
        .I4(red_p[7]),
        .I5(\e[8]_i_2_n_0 ),
        .O(\dc_bias[3]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[3]_i_20 
       (.I0(red_p[6]),
        .I1(red_p[5]),
        .I2(\e[6]_i_3__0_n_0 ),
        .I3(red_p[7]),
        .I4(\e[8]_i_2_n_0 ),
        .O(\dc_bias[3]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[3]_i_21 
       (.I0(red_p[6]),
        .I1(\e[8]_i_2_n_0 ),
        .I2(\e[6]_i_3__0_n_0 ),
        .O(\dc_bias[3]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_22 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h2BD4D42BD42B2BD4)) 
    \dc_bias[3]_i_23 
       (.I0(red_p[4]),
        .I1(red_p[5]),
        .I2(\e[8]_i_2_n_0 ),
        .I3(\dc_bias[3]_i_27_n_0 ),
        .I4(red_p[2]),
        .I5(red_p[3]),
        .O(\dc_bias[3]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h8EE8E88E)) 
    \dc_bias[3]_i_24 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(red_p[7]),
        .I2(\e[6]_i_3__0_n_0 ),
        .I3(red_p[5]),
        .I4(red_p[6]),
        .O(\dc_bias[3]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \dc_bias[3]_i_25 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(red_p[0]),
        .O(\dc_bias[3]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hFF9FFFFF)) 
    \dc_bias[3]_i_26 
       (.I0(red_p[2]),
        .I1(\e[8]_i_2_n_0 ),
        .I2(\dc_bias[1]_i_10_n_0 ),
        .I3(red_p[7]),
        .I4(\dc_bias[1]_i_11_n_0 ),
        .O(\dc_bias[3]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[3]_i_27 
       (.I0(red_p[1]),
        .I1(red_p[0]),
        .O(\dc_bias[3]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h5D5DD55DD5D55DD5)) 
    \dc_bias[3]_i_2__0 
       (.I0(\e[7]_i_3_n_0 ),
        .I1(\e[8]_i_2_n_0 ),
        .I2(\dc_bias[3]_i_7__0_n_0 ),
        .I3(\dc_bias[3]_i_8__0_n_0 ),
        .I4(\dc_bias_reg_n_0_[2] ),
        .I5(p_1_in),
        .O(\dc_bias[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hA665AAAA5555A665)) 
    \dc_bias[3]_i_3__0 
       (.I0(\e[7]_i_5__0_n_0 ),
        .I1(\dc_bias[3]_i_9__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[3]_i_10__0_n_0 ),
        .I4(\dc_bias[3]_i_11__0_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hABABBAABBABABABA)) 
    \dc_bias[3]_i_4__0 
       (.I0(\e[7]_i_3_n_0 ),
        .I1(\e[7]_i_5__0_n_0 ),
        .I2(\dc_bias[3]_i_12_n_0 ),
        .I3(\dc_bias[3]_i_13__0_n_0 ),
        .I4(\dc_bias[3]_i_14_n_0 ),
        .I5(\dc_bias[3]_i_15__0_n_0 ),
        .O(\dc_bias[3]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h990909099D9D9909)) 
    \dc_bias[3]_i_5__0 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\dc_bias[3]_i_11__0_n_0 ),
        .I2(\dc_bias[3]_i_16__0_n_0 ),
        .I3(\dc_bias[3]_i_17__0_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .I5(\dc_bias[3]_i_9__0_n_0 ),
        .O(\dc_bias[3]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'h00FBFFFF)) 
    \dc_bias[3]_i_6__1 
       (.I0(\dc_bias[3]_i_16__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_9__0_n_0 ),
        .I3(\dc_bias[3]_i_18__1_n_0 ),
        .I4(\e[7]_i_5__0_n_0 ),
        .O(\dc_bias[3]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h544080548054A880)) 
    \dc_bias[3]_i_7__0 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\dc_bias[1]_i_6_n_0 ),
        .I2(\e[7]_i_8_n_0 ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .I4(\e[7]_i_9_n_0 ),
        .I5(\dc_bias[3]_i_19_n_0 ),
        .O(\dc_bias[3]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h17FF0017)) 
    \dc_bias[3]_i_8__0 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\dc_bias[3]_i_20_n_0 ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .I4(\e[7]_i_9_n_0 ),
        .O(\dc_bias[3]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h1781E87EE87E1781)) 
    \dc_bias[3]_i_9__0 
       (.I0(\e[7]_i_11_n_0 ),
        .I1(red_p[0]),
        .I2(\dc_bias[3]_i_20_n_0 ),
        .I3(\dc_bias[3]_i_21_n_0 ),
        .I4(\e[7]_i_9_n_0 ),
        .I5(\e[7]_i_8_n_0 ),
        .O(\dc_bias[3]_i_9__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[0]_i_1__0_n_0 ),
        .Q(\dc_bias_reg_n_0_[0] ),
        .R(blank));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[1]_i_1__0_n_0 ),
        .Q(\dc_bias_reg_n_0_[1] ),
        .R(blank));
  MUXF7 \dc_bias_reg[1]_i_1__0 
       (.I0(\dc_bias[1]_i_2__0_n_0 ),
        .I1(\dc_bias[1]_i_3__0_n_0 ),
        .O(\dc_bias_reg[1]_i_1__0_n_0 ),
        .S(\e[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[2]_i_1_n_0 ),
        .Q(\dc_bias_reg_n_0_[2] ),
        .R(blank));
  MUXF7 \dc_bias_reg[2]_i_2 
       (.I0(\dc_bias[2]_i_6__0_n_0 ),
        .I1(\dc_bias[2]_i_7__0_n_0 ),
        .O(\dc_bias_reg[2]_i_2_n_0 ),
        .S(\e[8]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[3]_i_1_n_0 ),
        .Q(p_1_in),
        .R(blank));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hB88B)) 
    \e[0]_i_1__0 
       (.I0(\e[0]_i_2_n_0 ),
        .I1(blank),
        .I2(red_p[0]),
        .I3(\e[9]_i_2__0_n_0 ),
        .O(\e[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC09000A0)) 
    \e[0]_i_2 
       (.I0(TERC4Character2[0]),
        .I1(TERC4Character2[3]),
        .I2(\e_reg[9]_0 ),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[2]),
        .I5(\e[5]_i_4__0_n_0 ),
        .O(\e[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h4BB41EE1)) 
    \e[1]_i_2__0 
       (.I0(\e[7]_i_3_n_0 ),
        .I1(\e[8]_i_2_n_0 ),
        .I2(red_p[1]),
        .I3(red_p[0]),
        .I4(\e[7]_i_5__0_n_0 ),
        .O(\e[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC8404888)) 
    \e[1]_i_3__0 
       (.I0(TERC4Character2[0]),
        .I1(\e_reg[9]_0 ),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[3]),
        .I5(\e[5]_i_4__0_n_0 ),
        .O(\e[1]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hB88B8BB88BB8B88B)) 
    \e[2]_i_1__0 
       (.I0(\e[2]_i_2_n_0 ),
        .I1(blank),
        .I2(red_p[1]),
        .I3(red_p[0]),
        .I4(red_p[2]),
        .I5(\e[9]_i_2__0_n_0 ),
        .O(\e[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF44488C0C)) 
    \e[2]_i_2 
       (.I0(TERC4Character2[3]),
        .I1(\e_reg[9]_0 ),
        .I2(TERC4Character2[0]),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[2]),
        .I5(\e[6]_i_4_n_0 ),
        .O(\e[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB8BB8B88BBB8888B)) 
    \e[3]_i_1__0 
       (.I0(\e[3]_i_2__0_n_0 ),
        .I1(blank),
        .I2(\e[7]_i_3_n_0 ),
        .I3(\e[8]_i_2_n_0 ),
        .I4(\e[3]_i_3__1_n_0 ),
        .I5(\e[7]_i_5__0_n_0 ),
        .O(\e[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF36004D00)) 
    \e[3]_i_2__0 
       (.I0(TERC4Character2[0]),
        .I1(TERC4Character2[3]),
        .I2(TERC4Character2[1]),
        .I3(\e_reg[9]_0 ),
        .I4(TERC4Character2[2]),
        .I5(\e[7]_i_6_n_0 ),
        .O(\e[3]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \e[3]_i_3__1 
       (.I0(red_p[3]),
        .I1(red_p[2]),
        .I2(red_p[0]),
        .I3(red_p[1]),
        .O(\e[3]_i_3__1_n_0 ));
  LUT4 #(
    .INIT(16'hB1E4)) 
    \e[4]_i_1__0 
       (.I0(blank),
        .I1(\e[9]_i_2__0_n_0 ),
        .I2(\e[4]_i_2__0_n_0 ),
        .I3(\e[6]_i_3__0_n_0 ),
        .O(\e[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h72190000FFFFFFFF)) 
    \e[4]_i_2__0 
       (.I0(TERC4Character2[3]),
        .I1(TERC4Character2[1]),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[0]),
        .I4(\e_reg[9]_0 ),
        .I5(\e[8]_i_3__0_n_0 ),
        .O(\e[4]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hB44BE11E)) 
    \e[5]_i_2__0 
       (.I0(\e[7]_i_3_n_0 ),
        .I1(\e[8]_i_2_n_0 ),
        .I2(red_p[5]),
        .I3(\e[6]_i_3__0_n_0 ),
        .I4(\e[7]_i_5__0_n_0 ),
        .O(\e[5]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF659C0000)) 
    \e[5]_i_3__0 
       (.I0(TERC4Character2[3]),
        .I1(TERC4Character2[0]),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[1]),
        .I4(\e_reg[9]_0 ),
        .I5(\e[5]_i_4__0_n_0 ),
        .O(\e[5]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h8B88)) 
    \e[5]_i_4__0 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[5]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B88BB88B8BB8)) 
    \e[6]_i_1__0 
       (.I0(\e[6]_i_2_n_0 ),
        .I1(blank),
        .I2(\e[6]_i_3__0_n_0 ),
        .I3(red_p[5]),
        .I4(red_p[6]),
        .I5(\e[9]_i_2__0_n_0 ),
        .O(\e[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFAEAAABAEABAFAEA)) 
    \e[6]_i_2 
       (.I0(\e[6]_i_4_n_0 ),
        .I1(TERC4Character2[0]),
        .I2(\e_reg[9]_0 ),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[3]),
        .I5(TERC4Character2[2]),
        .O(\e[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[6]_i_3__0 
       (.I0(red_p[4]),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .I4(red_p[3]),
        .O(\e[6]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h4447)) 
    \e[6]_i_4 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h35C5535CC5355C53)) 
    \e[7]_i_10 
       (.I0(red_p[0]),
        .I1(\e[8]_i_2_n_0 ),
        .I2(red_p[7]),
        .I3(\e[6]_i_3__0_n_0 ),
        .I4(red_p[5]),
        .I5(red_p[6]),
        .O(\e[7]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[7]_i_11 
       (.I0(red_p[3]),
        .I1(red_p[0]),
        .I2(red_p[1]),
        .O(\e[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[7]_i_12 
       (.I0(red_p[5]),
        .I1(red_p[7]),
        .I2(red_p[0]),
        .O(\e[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hB8BB8B88BBB8888B)) 
    \e[7]_i_1__0 
       (.I0(\e[7]_i_2__0_n_0 ),
        .I1(blank),
        .I2(\e[7]_i_3_n_0 ),
        .I3(\e[8]_i_2_n_0 ),
        .I4(\e[7]_i_4_n_0 ),
        .I5(\e[7]_i_5__0_n_0 ),
        .O(\e[7]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFD07D0000)) 
    \e[7]_i_2__0 
       (.I0(TERC4Character2[2]),
        .I1(TERC4Character2[3]),
        .I2(TERC4Character2[1]),
        .I3(TERC4Character2[0]),
        .I4(\e_reg[9]_0 ),
        .I5(\e[7]_i_6_n_0 ),
        .O(\e[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAEEBEBBAAAAA)) 
    \e[7]_i_3 
       (.I0(\e[7]_i_7_n_0 ),
        .I1(\e[7]_i_8_n_0 ),
        .I2(\e[7]_i_9_n_0 ),
        .I3(\e[7]_i_10_n_0 ),
        .I4(\e[7]_i_11_n_0 ),
        .I5(\e[7]_i_12_n_0 ),
        .O(\e[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \e[7]_i_4 
       (.I0(red_p[7]),
        .I1(\e[6]_i_3__0_n_0 ),
        .I2(red_p[5]),
        .I3(red_p[6]),
        .O(\e[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA6A665A665655565)) 
    \e[7]_i_5__0 
       (.I0(p_1_in),
        .I1(\e[7]_i_8_n_0 ),
        .I2(\e[7]_i_9_n_0 ),
        .I3(\e[7]_i_11_n_0 ),
        .I4(\e[7]_i_12_n_0 ),
        .I5(\e[7]_i_10_n_0 ),
        .O(\e[7]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h4744)) 
    \e[7]_i_6 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \e[7]_i_7 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(p_1_in),
        .O(\e[7]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h693CC369)) 
    \e[7]_i_8 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .I4(red_p[3]),
        .O(\e[7]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hA96A)) 
    \e[7]_i_9 
       (.I0(\e[6]_i_3__0_n_0 ),
        .I1(red_p[5]),
        .I2(\e[8]_i_2_n_0 ),
        .I3(red_p[6]),
        .O(\e[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222222E2EEEEEEEE)) 
    \e[8]_i_1 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(blank),
        .I2(isTERC4Region),
        .I3(guardBandEnable),
        .I4(\e[9]_i_4__1_n_0 ),
        .I5(\e[8]_i_3__0_n_0 ),
        .O(\e[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5DD50445D55D0445)) 
    \e[8]_i_2 
       (.I0(\e[8]_i_4_n_0 ),
        .I1(\e[8]_i_5_n_0 ),
        .I2(red_p[7]),
        .I3(\e[8]_i_6_n_0 ),
        .I4(\e[8]_i_7_n_0 ),
        .I5(red_p[0]),
        .O(\e[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h0FEE)) 
    \e[8]_i_3__0 
       (.I0(isTERC4Region),
        .I1(controlChannel2Red[0]),
        .I2(guardBandType),
        .I3(guardBandEnable),
        .O(\e[8]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hE8E8E800E8000000)) 
    \e[8]_i_4 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[4]),
        .I4(red_p[6]),
        .I5(red_p[5]),
        .O(\e[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[8]_i_5 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .O(\e[8]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[8]_i_6 
       (.I0(red_p[4]),
        .I1(red_p[6]),
        .I2(red_p[5]),
        .O(\e[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000001700171717)) 
    \e[8]_i_7 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[4]),
        .I4(red_p[6]),
        .I5(red_p[5]),
        .O(\e[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCCDDCCDDFCDDCCDD)) 
    \e[9]_i_1__0 
       (.I0(\e[9]_i_2__0_n_0 ),
        .I1(\e[9]_i_3__0_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(blank),
        .I4(isTERC4Region),
        .I5(guardBandEnable),
        .O(\e[9]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \e[9]_i_2__0 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(\e[7]_i_3_n_0 ),
        .I2(\e[7]_i_5__0_n_0 ),
        .O(\e[9]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h5300500050005300)) 
    \e[9]_i_3__0 
       (.I0(guardBandType),
        .I1(isTERC4Region),
        .I2(guardBandEnable),
        .I3(blank),
        .I4(controlChannel2Red[0]),
        .I5(controlChannel2Red[1]),
        .O(\e[9]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hB09F)) 
    \e[9]_i_4__1 
       (.I0(TERC4Character2[0]),
        .I1(TERC4Character2[1]),
        .I2(TERC4Character2[3]),
        .I3(TERC4Character2[2]),
        .O(\e[9]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \e[9]_i_6__0 
       (.I0(isTERC4Region),
        .I1(guardBandEnable),
        .O(\e_reg[9]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[0]_i_1__0_n_0 ),
        .Q(EncodedR[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[1]_i_1_n_0 ),
        .Q(EncodedR[1]),
        .R(1'b0));
  MUXF7 \e_reg[1]_i_1 
       (.I0(\e[1]_i_2__0_n_0 ),
        .I1(\e[1]_i_3__0_n_0 ),
        .O(\e_reg[1]_i_1_n_0 ),
        .S(blank));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[2]_i_1__0_n_0 ),
        .Q(EncodedR[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[3]_i_1__0_n_0 ),
        .Q(EncodedR[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[4]_i_1__0_n_0 ),
        .Q(EncodedR[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[5]_i_1_n_0 ),
        .Q(EncodedR[5]),
        .R(1'b0));
  MUXF7 \e_reg[5]_i_1 
       (.I0(\e[5]_i_2__0_n_0 ),
        .I1(\e[5]_i_3__0_n_0 ),
        .O(\e_reg[5]_i_1_n_0 ),
        .S(blank));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[6]_i_1__0_n_0 ),
        .Q(EncodedR[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[7]_i_1__0_n_0 ),
        .Q(EncodedR[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[8]_i_1_n_0 ),
        .Q(EncodedR[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[9]_i_1__0_n_0 ),
        .Q(EncodedR[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "TDMS_encoder" *) 
module design_1_dvid_0_0_TDMS_encoder__parameterized1
   (EncodedG,
    controlChannel1Green,
    isTERC4Region,
    blank,
    green_p,
    guardBandEnable,
    TERC4Character1,
    clk_pixel_x1);
  output [9:0]EncodedG;
  input [1:0]controlChannel1Green;
  input isTERC4Region;
  input blank;
  input [7:0]green_p;
  input guardBandEnable;
  input [3:0]TERC4Character1;
  input clk_pixel_x1;

  wire [9:0]EncodedG;
  wire [3:0]TERC4Character1;
  wire blank;
  wire clk_pixel_x1;
  wire [1:0]controlChannel1Green;
  wire \dc_bias[0]_i_1_n_0 ;
  wire \dc_bias[0]_i_2_n_0 ;
  wire \dc_bias[0]_i_3_n_0 ;
  wire \dc_bias[0]_i_4__0_n_0 ;
  wire \dc_bias[0]_i_5_n_0 ;
  wire \dc_bias[1]_i_2_n_0 ;
  wire \dc_bias[1]_i_3_n_0 ;
  wire \dc_bias[1]_i_4_n_0 ;
  wire \dc_bias[1]_i_5__1_n_0 ;
  wire \dc_bias[1]_i_6__0_n_0 ;
  wire \dc_bias[1]_i_7_n_0 ;
  wire \dc_bias[1]_i_8_n_0 ;
  wire \dc_bias[1]_i_9__0_n_0 ;
  wire \dc_bias[2]_i_10_n_0 ;
  wire \dc_bias[2]_i_11__1_n_0 ;
  wire \dc_bias[2]_i_12_n_0 ;
  wire \dc_bias[2]_i_13_n_0 ;
  wire \dc_bias[2]_i_14_n_0 ;
  wire \dc_bias[2]_i_15_n_0 ;
  wire \dc_bias[2]_i_2_n_0 ;
  wire \dc_bias[2]_i_3_n_0 ;
  wire \dc_bias[2]_i_4_n_0 ;
  wire \dc_bias[2]_i_5_n_0 ;
  wire \dc_bias[2]_i_6_n_0 ;
  wire \dc_bias[2]_i_7_n_0 ;
  wire \dc_bias[2]_i_8_n_0 ;
  wire \dc_bias[2]_i_9_n_0 ;
  wire \dc_bias[3]_i_10_n_0 ;
  wire \dc_bias[3]_i_11_n_0 ;
  wire \dc_bias[3]_i_12__1_n_0 ;
  wire \dc_bias[3]_i_13_n_0 ;
  wire \dc_bias[3]_i_14__1_n_0 ;
  wire \dc_bias[3]_i_15_n_0 ;
  wire \dc_bias[3]_i_16_n_0 ;
  wire \dc_bias[3]_i_17_n_0 ;
  wire \dc_bias[3]_i_18_n_0 ;
  wire \dc_bias[3]_i_19__0_n_0 ;
  wire \dc_bias[3]_i_2_n_0 ;
  wire \dc_bias[3]_i_3_n_0 ;
  wire \dc_bias[3]_i_4_n_0 ;
  wire \dc_bias[3]_i_5_n_0 ;
  wire \dc_bias[3]_i_6_n_0 ;
  wire \dc_bias[3]_i_7_n_0 ;
  wire \dc_bias[3]_i_8_n_0 ;
  wire \dc_bias[3]_i_9_n_0 ;
  wire \dc_bias_reg[1]_i_1_n_0 ;
  wire \dc_bias_reg[2]_i_1_n_0 ;
  wire \dc_bias_reg[3]_i_1_n_0 ;
  wire \dc_bias_reg_n_0_[0] ;
  wire \dc_bias_reg_n_0_[1] ;
  wire \dc_bias_reg_n_0_[2] ;
  wire [9:7]e0_in;
  wire \e[0]_i_1_n_0 ;
  wire \e[0]_i_2__1_n_0 ;
  wire \e[1]_i_1_n_0 ;
  wire \e[1]_i_2_n_0 ;
  wire \e[1]_i_3__1_n_0 ;
  wire \e[2]_i_1_n_0 ;
  wire \e[2]_i_2__1_n_0 ;
  wire \e[2]_i_3_n_0 ;
  wire \e[3]_i_1_n_0 ;
  wire \e[3]_i_2_n_0 ;
  wire \e[3]_i_3__0_n_0 ;
  wire \e[4]_i_1_n_0 ;
  wire \e[4]_i_2__1_n_0 ;
  wire \e[4]_i_3__0_n_0 ;
  wire \e[5]_i_1_n_0 ;
  wire \e[5]_i_2_n_0 ;
  wire \e[5]_i_3__1_n_0 ;
  wire \e[6]_i_1_n_0 ;
  wire \e[6]_i_2__1_n_0 ;
  wire \e[6]_i_3_n_0 ;
  wire \e[6]_i_4__1_n_0 ;
  wire \e[7]_i_2_n_0 ;
  wire \e[7]_i_3__1_n_0 ;
  wire \e[7]_i_4__1_n_0 ;
  wire \e[7]_i_5_n_0 ;
  wire \e[7]_i_6__0_n_0 ;
  wire \e[8]_i_1__1_n_0 ;
  wire \e[8]_i_2__1_n_0 ;
  wire \e[9]_i_10_n_0 ;
  wire \e[9]_i_11_n_0 ;
  wire \e[9]_i_12__0_n_0 ;
  wire \e[9]_i_13_n_0 ;
  wire \e[9]_i_14_n_0 ;
  wire \e[9]_i_15_n_0 ;
  wire \e[9]_i_16_n_0 ;
  wire \e[9]_i_17_n_0 ;
  wire \e[9]_i_2_n_0 ;
  wire \e[9]_i_3_n_0 ;
  wire \e[9]_i_4_n_0 ;
  wire \e[9]_i_5_n_0 ;
  wire \e[9]_i_6_n_0 ;
  wire \e[9]_i_7_n_0 ;
  wire \e[9]_i_8_n_0 ;
  wire \e[9]_i_9_n_0 ;
  wire [7:0]green_p;
  wire guardBandEnable;
  wire isTERC4Region;
  wire p_1_in;

  LUT6 #(
    .INIT(64'h909F9F909F90909F)) 
    \dc_bias[0]_i_1 
       (.I0(\dc_bias[0]_i_2_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_6_n_0 ),
        .I4(\dc_bias[0]_i_3_n_0 ),
        .I5(\dc_bias[0]_i_4__0_n_0 ),
        .O(\dc_bias[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_2 
       (.I0(\e[9]_i_13_n_0 ),
        .I1(\e[4]_i_2__1_n_0 ),
        .I2(green_p[6]),
        .I3(green_p[0]),
        .I4(\dc_bias[0]_i_5_n_0 ),
        .O(\dc_bias[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_3 
       (.I0(\e[3]_i_2_n_0 ),
        .I1(green_p[5]),
        .I2(green_p[0]),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(green_p[7]),
        .O(\dc_bias[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[0]_i_4__0 
       (.I0(green_p[2]),
        .I1(\e[9]_i_4_n_0 ),
        .O(\dc_bias[0]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \dc_bias[0]_i_5 
       (.I0(green_p[7]),
        .I1(\e[4]_i_2__1_n_0 ),
        .I2(green_p[5]),
        .I3(green_p[6]),
        .O(\dc_bias[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B88B8BB8B8B8)) 
    \dc_bias[1]_i_2 
       (.I0(\dc_bias[1]_i_4_n_0 ),
        .I1(\e[9]_i_6_n_0 ),
        .I2(\dc_bias[1]_i_5__1_n_0 ),
        .I3(\dc_bias[0]_i_2_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .I5(\e[9]_i_4_n_0 ),
        .O(\dc_bias[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9F90909F909F9F90)) 
    \dc_bias[1]_i_3 
       (.I0(\dc_bias[1]_i_6__0_n_0 ),
        .I1(\dc_bias[1]_i_5__1_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\dc_bias[1]_i_7_n_0 ),
        .I4(\dc_bias[1]_i_8_n_0 ),
        .I5(\e[9]_i_15_n_0 ),
        .O(\dc_bias[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA96A95A995A95695)) 
    \dc_bias[1]_i_4 
       (.I0(\dc_bias[3]_i_13_n_0 ),
        .I1(\dc_bias[2]_i_12_n_0 ),
        .I2(\e[2]_i_2__1_n_0 ),
        .I3(\dc_bias[2]_i_14_n_0 ),
        .I4(green_p[7]),
        .I5(\dc_bias[2]_i_13_n_0 ),
        .O(\dc_bias[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[1]_i_5__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias[3]_i_16_n_0 ),
        .O(\dc_bias[1]_i_5__1_n_0 ));
  LUT5 #(
    .INIT(32'hEBBEBEEB)) 
    \dc_bias[1]_i_6__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias[0]_i_5_n_0 ),
        .I2(green_p[0]),
        .I3(\dc_bias[1]_i_9__0_n_0 ),
        .I4(\e[9]_i_13_n_0 ),
        .O(\dc_bias[1]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'hB712DE84DE84B712)) 
    \dc_bias[1]_i_7 
       (.I0(\dc_bias[0]_i_5_n_0 ),
        .I1(\e[9]_i_4_n_0 ),
        .I2(\dc_bias[2]_i_14_n_0 ),
        .I3(\e[9]_i_13_n_0 ),
        .I4(green_p[6]),
        .I5(\e[4]_i_2__1_n_0 ),
        .O(\dc_bias[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h2BD4D42B)) 
    \dc_bias[1]_i_8 
       (.I0(\e[7]_i_3__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(green_p[0]),
        .I3(\dc_bias[3]_i_17_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dc_bias[1]_i_9__0 
       (.I0(green_p[6]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .I3(green_p[3]),
        .I4(green_p[2]),
        .I5(green_p[4]),
        .O(\dc_bias[1]_i_9__0_n_0 ));
  LUT6 #(
    .INIT(64'h6996C33C3CC36996)) 
    \dc_bias[2]_i_10 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(\e[1]_i_2_n_0 ),
        .I2(green_p[3]),
        .I3(green_p[2]),
        .I4(green_p[4]),
        .I5(green_p[5]),
        .O(\dc_bias[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEBFFEBFFFF)) 
    \dc_bias[2]_i_11__1 
       (.I0(\dc_bias[0]_i_4__0_n_0 ),
        .I1(green_p[5]),
        .I2(\e[3]_i_2_n_0 ),
        .I3(green_p[7]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .I5(green_p[0]),
        .O(\dc_bias[2]_i_11__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[2]_i_12 
       (.I0(green_p[0]),
        .I1(green_p[1]),
        .I2(\e[9]_i_4_n_0 ),
        .O(\dc_bias[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[2]_i_13 
       (.I0(green_p[5]),
        .I1(green_p[2]),
        .I2(green_p[3]),
        .I3(green_p[1]),
        .I4(green_p[0]),
        .O(\dc_bias[2]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[2]_i_14 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \dc_bias[2]_i_15 
       (.I0(\e[4]_i_2__1_n_0 ),
        .I1(green_p[6]),
        .I2(green_p[0]),
        .I3(\dc_bias[0]_i_5_n_0 ),
        .I4(\e[9]_i_13_n_0 ),
        .O(\dc_bias[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F00F99999999)) 
    \dc_bias[2]_i_2 
       (.I0(\dc_bias[3]_i_7_n_0 ),
        .I1(\dc_bias[2]_i_4_n_0 ),
        .I2(\dc_bias[2]_i_5_n_0 ),
        .I3(\dc_bias[2]_i_6_n_0 ),
        .I4(\dc_bias[2]_i_7_n_0 ),
        .I5(\e[9]_i_6_n_0 ),
        .O(\dc_bias[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h606F9F906F60909F)) 
    \dc_bias[2]_i_3 
       (.I0(\dc_bias[3]_i_6_n_0 ),
        .I1(\dc_bias[2]_i_8_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\dc_bias[3]_i_10_n_0 ),
        .I4(\dc_bias_reg_n_0_[2] ),
        .I5(\dc_bias[3]_i_9_n_0 ),
        .O(\dc_bias[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h7887)) 
    \dc_bias[2]_i_4 
       (.I0(\dc_bias[3]_i_16_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias[3]_i_6_n_0 ),
        .O(\dc_bias[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE8818181177E7E7E)) 
    \dc_bias[2]_i_5 
       (.I0(\dc_bias[2]_i_9_n_0 ),
        .I1(\dc_bias[2]_i_10_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(green_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000051154554)) 
    \dc_bias[2]_i_6 
       (.I0(\dc_bias[3]_i_13_n_0 ),
        .I1(\e[9]_i_4_n_0 ),
        .I2(green_p[1]),
        .I3(green_p[0]),
        .I4(green_p[2]),
        .I5(\dc_bias[2]_i_11__1_n_0 ),
        .O(\dc_bias[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hE0808000F8E0E080)) 
    \dc_bias[2]_i_7 
       (.I0(\e[2]_i_2__1_n_0 ),
        .I1(\dc_bias[2]_i_12_n_0 ),
        .I2(\dc_bias[3]_i_13_n_0 ),
        .I3(\dc_bias[2]_i_13_n_0 ),
        .I4(green_p[7]),
        .I5(\dc_bias[2]_i_14_n_0 ),
        .O(\dc_bias[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h41141441D77D7DD7)) 
    \dc_bias[2]_i_8 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_14_n_0 ),
        .I2(\e[9]_i_15_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\dc_bias[2]_i_15_n_0 ),
        .I5(\dc_bias[1]_i_6__0_n_0 ),
        .O(\dc_bias[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h4DD4D44D)) 
    \dc_bias[2]_i_9 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(green_p[7]),
        .I2(\e[4]_i_2__1_n_0 ),
        .I3(green_p[5]),
        .I4(green_p[6]),
        .O(\dc_bias[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB2B22BB2B22BB2B2)) 
    \dc_bias[3]_i_10 
       (.I0(\dc_bias[3]_i_18_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[4]_i_2__1_n_0 ),
        .I3(green_p[6]),
        .I4(green_p[5]),
        .I5(\e[9]_i_4_n_0 ),
        .O(\dc_bias[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h066F6F06)) 
    \dc_bias[3]_i_11 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(green_p[7]),
        .I3(\e[3]_i_2_n_0 ),
        .I4(green_p[5]),
        .O(\dc_bias[3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hF6)) 
    \dc_bias[3]_i_12__1 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(green_p[2]),
        .I2(\dc_bias[0]_i_3_n_0 ),
        .O(\dc_bias[3]_i_12__1_n_0 ));
  LUT5 #(
    .INIT(32'h69969696)) 
    \dc_bias[3]_i_13 
       (.I0(\dc_bias[2]_i_10_n_0 ),
        .I1(\dc_bias[2]_i_9_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(green_p[0]),
        .O(\dc_bias[3]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h2841)) 
    \dc_bias[3]_i_14__1 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(green_p[1]),
        .I2(green_p[0]),
        .I3(green_p[2]),
        .O(\dc_bias[3]_i_14__1_n_0 ));
  LUT6 #(
    .INIT(64'h55555556566A6AAA)) 
    \dc_bias[3]_i_15 
       (.I0(p_1_in),
        .I1(\dc_bias[3]_i_19__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[2]_i_10_n_0 ),
        .I4(\dc_bias[2]_i_9_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h1871E78EE78E1871)) 
    \dc_bias[3]_i_16 
       (.I0(\e[9]_i_13_n_0 ),
        .I1(\e[9]_i_17_n_0 ),
        .I2(\e[7]_i_3__1_n_0 ),
        .I3(green_p[0]),
        .I4(\e[9]_i_15_n_0 ),
        .I5(\e[9]_i_14_n_0 ),
        .O(\dc_bias[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h24DB)) 
    \dc_bias[3]_i_17 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(green_p[5]),
        .I2(green_p[6]),
        .I3(\e[4]_i_2__1_n_0 ),
        .O(\dc_bias[3]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h17717117)) 
    \dc_bias[3]_i_18 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(green_p[7]),
        .I4(\e[6]_i_2__1_n_0 ),
        .O(\dc_bias[3]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_19__0 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_19__0_n_0 ));
  LUT6 #(
    .INIT(64'h8B8888B888B8B8BB)) 
    \dc_bias[3]_i_2 
       (.I0(\dc_bias[3]_i_4_n_0 ),
        .I1(\e[9]_i_6_n_0 ),
        .I2(\dc_bias[3]_i_5_n_0 ),
        .I3(\dc_bias_reg_n_0_[2] ),
        .I4(\dc_bias[3]_i_6_n_0 ),
        .I5(\dc_bias[3]_i_7_n_0 ),
        .O(\dc_bias[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBB8BB8BB88B88B88)) 
    \dc_bias[3]_i_3 
       (.I0(\dc_bias[3]_i_8_n_0 ),
        .I1(\e[9]_i_4_n_0 ),
        .I2(\dc_bias[3]_i_9_n_0 ),
        .I3(\dc_bias_reg_n_0_[2] ),
        .I4(\dc_bias[3]_i_10_n_0 ),
        .I5(p_1_in),
        .O(\dc_bias[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h088A8AAEF7757551)) 
    \dc_bias[3]_i_4 
       (.I0(\dc_bias[2]_i_5_n_0 ),
        .I1(\dc_bias[3]_i_11_n_0 ),
        .I2(\dc_bias[3]_i_12__1_n_0 ),
        .I3(\dc_bias[3]_i_13_n_0 ),
        .I4(\dc_bias[3]_i_14__1_n_0 ),
        .I5(\dc_bias[3]_i_15_n_0 ),
        .O(\dc_bias[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hD77D7DD7D77DD77D)) 
    \dc_bias[3]_i_5 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_14_n_0 ),
        .I2(\e[9]_i_15_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\e[9]_i_12__0_n_0 ),
        .I5(\e[9]_i_13_n_0 ),
        .O(\dc_bias[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h77E7717771771171)) 
    \dc_bias[3]_i_6 
       (.I0(\e[9]_i_15_n_0 ),
        .I1(\e[9]_i_14_n_0 ),
        .I2(\e[9]_i_13_n_0 ),
        .I3(\e[7]_i_3__1_n_0 ),
        .I4(green_p[0]),
        .I5(\e[9]_i_17_n_0 ),
        .O(\dc_bias[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h6F666606)) 
    \dc_bias[3]_i_7 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias[3]_i_16_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\dc_bias[0]_i_2_n_0 ),
        .O(\dc_bias[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hA9A9A995A9959595)) 
    \dc_bias[3]_i_8 
       (.I0(\e[9]_i_6_n_0 ),
        .I1(\dc_bias[3]_i_6_n_0 ),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias[1]_i_6__0_n_0 ),
        .I4(\dc_bias[3]_i_16_n_0 ),
        .I5(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hD77D4114)) 
    \dc_bias[3]_i_9 
       (.I0(\dc_bias[1]_i_7_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_17_n_0 ),
        .I3(\dc_bias[3]_i_18_n_0 ),
        .I4(\e[9]_i_15_n_0 ),
        .O(\dc_bias[3]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[0]_i_1_n_0 ),
        .Q(\dc_bias_reg_n_0_[0] ),
        .R(blank));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[1]_i_1_n_0 ),
        .Q(\dc_bias_reg_n_0_[1] ),
        .R(blank));
  MUXF7 \dc_bias_reg[1]_i_1 
       (.I0(\dc_bias[1]_i_2_n_0 ),
        .I1(\dc_bias[1]_i_3_n_0 ),
        .O(\dc_bias_reg[1]_i_1_n_0 ),
        .S(\e[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[2]_i_1_n_0 ),
        .Q(\dc_bias_reg_n_0_[2] ),
        .R(blank));
  MUXF7 \dc_bias_reg[2]_i_1 
       (.I0(\dc_bias[2]_i_2_n_0 ),
        .I1(\dc_bias[2]_i_3_n_0 ),
        .O(\dc_bias_reg[2]_i_1_n_0 ),
        .S(\e[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[3]_i_1_n_0 ),
        .Q(p_1_in),
        .R(blank));
  MUXF7 \dc_bias_reg[3]_i_1 
       (.I0(\dc_bias[3]_i_2_n_0 ),
        .I1(\dc_bias[3]_i_3_n_0 ),
        .O(\dc_bias_reg[3]_i_1_n_0 ),
        .S(\e[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000059A9)) 
    \e[0]_i_1 
       (.I0(green_p[0]),
        .I1(\e[9]_i_6_n_0 ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(blank),
        .I5(\e[0]_i_2__1_n_0 ),
        .O(\e[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEBAABBAAAAAAAAA)) 
    \e[0]_i_2__1 
       (.I0(\e[7]_i_5_n_0 ),
        .I1(TERC4Character1[1]),
        .I2(TERC4Character1[0]),
        .I3(TERC4Character1[2]),
        .I4(TERC4Character1[3]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[0]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF45105401)) 
    \e[1]_i_1 
       (.I0(blank),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[1]_i_2_n_0 ),
        .I4(\e[9]_i_6_n_0 ),
        .I5(\e[1]_i_3__1_n_0 ),
        .O(\e[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \e[1]_i_2 
       (.I0(green_p[1]),
        .I1(green_p[0]),
        .O(\e[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC4884808)) 
    \e[1]_i_3__1 
       (.I0(TERC4Character1[0]),
        .I1(\e[7]_i_6__0_n_0 ),
        .I2(TERC4Character1[3]),
        .I3(TERC4Character1[2]),
        .I4(TERC4Character1[1]),
        .I5(\e[7]_i_5_n_0 ),
        .O(\e[1]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000A656)) 
    \e[2]_i_1 
       (.I0(\e[2]_i_2__1_n_0 ),
        .I1(\e[9]_i_6_n_0 ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(blank),
        .I5(\e[2]_i_3_n_0 ),
        .O(\e[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[2]_i_2__1 
       (.I0(green_p[2]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .O(\e[2]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF1B00E300)) 
    \e[2]_i_3 
       (.I0(TERC4Character1[1]),
        .I1(TERC4Character1[0]),
        .I2(TERC4Character1[2]),
        .I3(\e[7]_i_6__0_n_0 ),
        .I4(TERC4Character1[3]),
        .I5(\e[6]_i_4__1_n_0 ),
        .O(\e[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000B4E1)) 
    \e[3]_i_1 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[9]_i_4_n_0 ),
        .I2(\e[3]_i_2_n_0 ),
        .I3(\e[9]_i_6_n_0 ),
        .I4(blank),
        .I5(\e[3]_i_3__0_n_0 ),
        .O(\e[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \e[3]_i_2 
       (.I0(green_p[0]),
        .I1(green_p[1]),
        .I2(green_p[3]),
        .I3(green_p[2]),
        .O(\e[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF044C8884)) 
    \e[3]_i_3__0 
       (.I0(TERC4Character1[2]),
        .I1(\e[7]_i_6__0_n_0 ),
        .I2(TERC4Character1[0]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[3]),
        .I5(\e[7]_i_5_n_0 ),
        .O(\e[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF41114144)) 
    \e[4]_i_1 
       (.I0(blank),
        .I1(\e[4]_i_2__1_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\e[9]_i_6_n_0 ),
        .I5(\e[4]_i_3__0_n_0 ),
        .O(\e[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[4]_i_2__1 
       (.I0(green_p[4]),
        .I1(green_p[2]),
        .I2(green_p[3]),
        .I3(green_p[1]),
        .I4(green_p[0]),
        .O(\e[4]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF088C4084)) 
    \e[4]_i_3__0 
       (.I0(TERC4Character1[0]),
        .I1(\e[7]_i_6__0_n_0 ),
        .I2(TERC4Character1[3]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[2]),
        .I5(\e[6]_i_4__1_n_0 ),
        .O(\e[4]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00006336)) 
    \e[5]_i_1 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[5]_i_2_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_6_n_0 ),
        .I4(blank),
        .I5(\e[5]_i_3__1_n_0 ),
        .O(\e[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \e[5]_i_2 
       (.I0(green_p[5]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .I3(green_p[3]),
        .I4(green_p[2]),
        .I5(green_p[4]),
        .O(\e[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF44848C40)) 
    \e[5]_i_3__1 
       (.I0(TERC4Character1[3]),
        .I1(\e[7]_i_6__0_n_0 ),
        .I2(TERC4Character1[2]),
        .I3(TERC4Character1[0]),
        .I4(TERC4Character1[1]),
        .I5(\e[7]_i_5_n_0 ),
        .O(\e[5]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF15104045)) 
    \e[6]_i_1 
       (.I0(blank),
        .I1(\e[9]_i_4_n_0 ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_6_n_0 ),
        .I4(\e[6]_i_2__1_n_0 ),
        .I5(\e[6]_i_3_n_0 ),
        .O(\e[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[6]_i_2__1 
       (.I0(green_p[6]),
        .I1(green_p[5]),
        .I2(\e[4]_i_2__1_n_0 ),
        .O(\e[6]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEAAABAEABAFAEA)) 
    \e[6]_i_3 
       (.I0(\e[6]_i_4__1_n_0 ),
        .I1(TERC4Character1[0]),
        .I2(\e[7]_i_6__0_n_0 ),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[3]),
        .I5(TERC4Character1[2]),
        .O(\e[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \e[6]_i_4__1 
       (.I0(isTERC4Region),
        .I1(blank),
        .I2(controlChannel1Green[0]),
        .O(\e[6]_i_4__1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \e[7]_i_1 
       (.I0(blank),
        .I1(guardBandEnable),
        .O(e0_in[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000A656)) 
    \e[7]_i_2 
       (.I0(\e[7]_i_3__1_n_0 ),
        .I1(\e[9]_i_6_n_0 ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(blank),
        .I5(\e[7]_i_4__1_n_0 ),
        .O(\e[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \e[7]_i_3__1 
       (.I0(green_p[6]),
        .I1(green_p[5]),
        .I2(\e[4]_i_2__1_n_0 ),
        .I3(green_p[7]),
        .I4(\e[9]_i_4_n_0 ),
        .O(\e[7]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFBAABFFBAAAAAAAA)) 
    \e[7]_i_4__1 
       (.I0(\e[7]_i_5_n_0 ),
        .I1(TERC4Character1[2]),
        .I2(TERC4Character1[3]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[0]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[7]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \e[7]_i_5 
       (.I0(controlChannel1Green[0]),
        .I1(isTERC4Region),
        .I2(blank),
        .O(\e[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \e[7]_i_6__0 
       (.I0(blank),
        .I1(isTERC4Region),
        .O(\e[7]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'hD100D100D100D1FF)) 
    \e[8]_i_1__1 
       (.I0(controlChannel1Green[0]),
        .I1(isTERC4Region),
        .I2(\e[8]_i_2__1_n_0 ),
        .I3(blank),
        .I4(\e[9]_i_4_n_0 ),
        .I5(\e[9]_i_3_n_0 ),
        .O(\e[8]_i_1__1_n_0 ));
  LUT4 #(
    .INIT(16'h5C2C)) 
    \e[8]_i_2__1 
       (.I0(TERC4Character1[0]),
        .I1(TERC4Character1[2]),
        .I2(TERC4Character1[3]),
        .I3(TERC4Character1[1]),
        .O(\e[8]_i_2__1_n_0 ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \e[9]_i_1 
       (.I0(guardBandEnable),
        .I1(blank),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .O(e0_in[9]));
  LUT6 #(
    .INIT(64'hE8E8E800E8000000)) 
    \e[9]_i_10 
       (.I0(green_p[2]),
        .I1(green_p[3]),
        .I2(green_p[1]),
        .I3(green_p[4]),
        .I4(green_p[6]),
        .I5(green_p[5]),
        .O(\e[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE8FFE8E8E8)) 
    \e[9]_i_11 
       (.I0(green_p[2]),
        .I1(green_p[3]),
        .I2(green_p[1]),
        .I3(green_p[4]),
        .I4(green_p[6]),
        .I5(green_p[5]),
        .O(\e[9]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_12__0 
       (.I0(green_p[5]),
        .I1(green_p[7]),
        .I2(green_p[0]),
        .O(\e[9]_i_12__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_13 
       (.I0(green_p[3]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .O(\e[9]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hDB24)) 
    \e[9]_i_14 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(green_p[5]),
        .I2(green_p[6]),
        .I3(\e[4]_i_2__1_n_0 ),
        .O(\e[9]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h4BB4D22D)) 
    \e[9]_i_15 
       (.I0(green_p[2]),
        .I1(green_p[3]),
        .I2(green_p[0]),
        .I3(green_p[1]),
        .I4(\e[9]_i_4_n_0 ),
        .O(\e[9]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h69FFFF6969000069)) 
    \e[9]_i_16 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(\e[4]_i_2__1_n_0 ),
        .I2(green_p[6]),
        .I3(green_p[7]),
        .I4(green_p[5]),
        .I5(green_p[0]),
        .O(\e[9]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_17 
       (.I0(\e[9]_i_4_n_0 ),
        .I1(\e[4]_i_2__1_n_0 ),
        .I2(green_p[6]),
        .O(\e[9]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hBAAABABB)) 
    \e[9]_i_2 
       (.I0(\e[9]_i_5_n_0 ),
        .I1(blank),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\e[9]_i_6_n_0 ),
        .O(\e[9]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    \e[9]_i_3 
       (.I0(p_1_in),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\e[9]_i_7_n_0 ),
        .O(\e[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF8EFF8EFF00EF00)) 
    \e[9]_i_4 
       (.I0(green_p[7]),
        .I1(\e[9]_i_8_n_0 ),
        .I2(\e[9]_i_9_n_0 ),
        .I3(\e[9]_i_10_n_0 ),
        .I4(green_p[0]),
        .I5(\e[9]_i_11_n_0 ),
        .O(\e[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h5500C300)) 
    \e[9]_i_5 
       (.I0(\e[8]_i_2__1_n_0 ),
        .I1(controlChannel1Green[0]),
        .I2(controlChannel1Green[1]),
        .I3(blank),
        .I4(isTERC4Region),
        .O(\e[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h65AAAAAA556565AA)) 
    \e[9]_i_6 
       (.I0(p_1_in),
        .I1(\e[9]_i_12__0_n_0 ),
        .I2(\e[9]_i_13_n_0 ),
        .I3(\e[9]_i_14_n_0 ),
        .I4(\e[9]_i_15_n_0 ),
        .I5(\e[9]_i_16_n_0 ),
        .O(\e[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF9E799E79FFEF)) 
    \e[9]_i_7 
       (.I0(\e[9]_i_17_n_0 ),
        .I1(green_p[0]),
        .I2(\e[7]_i_3__1_n_0 ),
        .I3(\e[9]_i_13_n_0 ),
        .I4(\e[9]_i_14_n_0 ),
        .I5(\e[9]_i_15_n_0 ),
        .O(\e[9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_8 
       (.I0(green_p[4]),
        .I1(green_p[6]),
        .I2(green_p[5]),
        .O(\e[9]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_9 
       (.I0(green_p[2]),
        .I1(green_p[3]),
        .I2(green_p[1]),
        .O(\e[9]_i_9_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[0]_i_1_n_0 ),
        .Q(EncodedG[0]),
        .S(e0_in[7]));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[1]_i_1_n_0 ),
        .Q(EncodedG[1]),
        .S(e0_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[2]_i_1_n_0 ),
        .Q(EncodedG[2]),
        .R(e0_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[3]_i_1_n_0 ),
        .Q(EncodedG[3]),
        .R(e0_in[7]));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[4]_i_1_n_0 ),
        .Q(EncodedG[4]),
        .S(e0_in[7]));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[5]_i_1_n_0 ),
        .Q(EncodedG[5]),
        .S(e0_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[6]_i_1_n_0 ),
        .Q(EncodedG[6]),
        .R(e0_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[7]_i_2_n_0 ),
        .Q(EncodedG[7]),
        .R(e0_in[7]));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[8]_i_1__1_n_0 ),
        .Q(EncodedG[8]),
        .S(e0_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[9]_i_2_n_0 ),
        .Q(EncodedG[9]),
        .R(e0_in[9]));
endmodule

(* ORIG_REF_NAME = "TDMS_encoder" *) 
module design_1_dvid_0_0_TDMS_encoder__parameterized3
   (EncodedB,
    guardBandType,
    guardBandEnable,
    blank,
    blue_p,
    TERC4Character0,
    guardBandEnable_0,
    controlChannel0Blue,
    isTERC4Region,
    clk_pixel_x1);
  output [9:0]EncodedB;
  input guardBandType;
  input guardBandEnable;
  input blank;
  input [7:0]blue_p;
  input [3:0]TERC4Character0;
  input guardBandEnable_0;
  input [1:0]controlChannel0Blue;
  input isTERC4Region;
  input clk_pixel_x1;

  wire [9:0]EncodedB;
  wire [3:0]TERC4Character0;
  wire blank;
  wire [7:0]blue_p;
  wire clk_pixel_x1;
  wire [1:0]controlChannel0Blue;
  wire \dc_bias[0]_i_1__1_n_0 ;
  wire \dc_bias[0]_i_2__1_n_0 ;
  wire \dc_bias[0]_i_3__1_n_0 ;
  wire \dc_bias[0]_i_4_n_0 ;
  wire \dc_bias[0]_i_5__1_n_0 ;
  wire \dc_bias[1]_i_10__0_n_0 ;
  wire \dc_bias[1]_i_2__1_n_0 ;
  wire \dc_bias[1]_i_3__1_n_0 ;
  wire \dc_bias[1]_i_4__0_n_0 ;
  wire \dc_bias[1]_i_5__0_n_0 ;
  wire \dc_bias[1]_i_6__1_n_0 ;
  wire \dc_bias[1]_i_7__1_n_0 ;
  wire \dc_bias[1]_i_8__0_n_0 ;
  wire \dc_bias[1]_i_9_n_0 ;
  wire \dc_bias[2]_i_10__1_n_0 ;
  wire \dc_bias[2]_i_11_n_0 ;
  wire \dc_bias[2]_i_2__0_n_0 ;
  wire \dc_bias[2]_i_3__1_n_0 ;
  wire \dc_bias[2]_i_4__1_n_0 ;
  wire \dc_bias[2]_i_5__1_n_0 ;
  wire \dc_bias[2]_i_6__1_n_0 ;
  wire \dc_bias[2]_i_7__1_n_0 ;
  wire \dc_bias[2]_i_8__1_n_0 ;
  wire \dc_bias[2]_i_9__0_n_0 ;
  wire \dc_bias[3]_i_10__1_n_0 ;
  wire \dc_bias[3]_i_11__1_n_0 ;
  wire \dc_bias[3]_i_12__0_n_0 ;
  wire \dc_bias[3]_i_13__1_n_0 ;
  wire \dc_bias[3]_i_14__0_n_0 ;
  wire \dc_bias[3]_i_15__1_n_0 ;
  wire \dc_bias[3]_i_16__1_n_0 ;
  wire \dc_bias[3]_i_17__1_n_0 ;
  wire \dc_bias[3]_i_18__0_n_0 ;
  wire \dc_bias[3]_i_19__1_n_0 ;
  wire \dc_bias[3]_i_1__0_n_0 ;
  wire \dc_bias[3]_i_3__1_n_0 ;
  wire \dc_bias[3]_i_4__1_n_0 ;
  wire \dc_bias[3]_i_5__1_n_0 ;
  wire \dc_bias[3]_i_6__0_n_0 ;
  wire \dc_bias[3]_i_7__1_n_0 ;
  wire \dc_bias[3]_i_8__1_n_0 ;
  wire \dc_bias[3]_i_9__1_n_0 ;
  wire \dc_bias_reg[1]_i_1__1_n_0 ;
  wire \dc_bias_reg[2]_i_1__0_n_0 ;
  wire \dc_bias_reg[3]_i_2_n_0 ;
  wire \dc_bias_reg_n_0_[0] ;
  wire \dc_bias_reg_n_0_[1] ;
  wire \dc_bias_reg_n_0_[2] ;
  wire \e[0]_i_1__1_n_0 ;
  wire \e[0]_i_2__0_n_0 ;
  wire \e[0]_i_3_n_0 ;
  wire \e[1]_i_2__1_n_0 ;
  wire \e[1]_i_3_n_0 ;
  wire \e[1]_i_4_n_0 ;
  wire \e[2]_i_1__1_n_0 ;
  wire \e[2]_i_2__0_n_0 ;
  wire \e[2]_i_3__0_n_0 ;
  wire \e[3]_i_1__1_n_0 ;
  wire \e[3]_i_2__1_n_0 ;
  wire \e[3]_i_3_n_0 ;
  wire \e[3]_i_4_n_0 ;
  wire \e[3]_i_5_n_0 ;
  wire \e[4]_i_1__1_n_0 ;
  wire \e[4]_i_2_n_0 ;
  wire \e[4]_i_3_n_0 ;
  wire \e[5]_i_10_n_0 ;
  wire \e[5]_i_11_n_0 ;
  wire \e[5]_i_1__0_n_0 ;
  wire \e[5]_i_2__1_n_0 ;
  wire \e[5]_i_3_n_0 ;
  wire \e[5]_i_4_n_0 ;
  wire \e[5]_i_5_n_0 ;
  wire \e[5]_i_6_n_0 ;
  wire \e[5]_i_7_n_0 ;
  wire \e[5]_i_8_n_0 ;
  wire \e[5]_i_9_n_0 ;
  wire \e[6]_i_1__1_n_0 ;
  wire \e[6]_i_2__0_n_0 ;
  wire \e[6]_i_3__1_n_0 ;
  wire \e[6]_i_4__0_n_0 ;
  wire \e[7]_i_1__1_n_0 ;
  wire \e[7]_i_2__1_n_0 ;
  wire \e[7]_i_3__0_n_0 ;
  wire \e[7]_i_4__0_n_0 ;
  wire \e[8]_i_1__0_n_0 ;
  wire \e[8]_i_2__0_n_0 ;
  wire \e[8]_i_3_n_0 ;
  wire \e[8]_i_4__0_n_0 ;
  wire \e[8]_i_5__0_n_0 ;
  wire \e[8]_i_6__0_n_0 ;
  wire \e[8]_i_7__0_n_0 ;
  wire \e[9]_i_10__0_n_0 ;
  wire \e[9]_i_11__0_n_0 ;
  wire \e[9]_i_12_n_0 ;
  wire \e[9]_i_1__1_n_0 ;
  wire \e[9]_i_2_n_0 ;
  wire \e[9]_i_3__1_n_0 ;
  wire \e[9]_i_4__0_n_0 ;
  wire \e[9]_i_5__0_n_0 ;
  wire \e[9]_i_7__0_n_0 ;
  wire \e[9]_i_8__0_n_0 ;
  wire \e[9]_i_9__0_n_0 ;
  wire \e_reg[1]_i_1__0_n_0 ;
  wire guardBandEnable;
  wire guardBandEnable_0;
  wire guardBandType;
  wire isTERC4Region;
  wire p_1_in;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEB1414EB)) 
    \dc_bias[0]_i_1__1 
       (.I0(\e[5]_i_2__1_n_0 ),
        .I1(\e[5]_i_4_n_0 ),
        .I2(\e[8]_i_3_n_0 ),
        .I3(\dc_bias[0]_i_2__1_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_2__1 
       (.I0(\dc_bias[0]_i_3__1_n_0 ),
        .I1(blue_p[0]),
        .I2(\dc_bias[0]_i_4_n_0 ),
        .I3(\dc_bias[0]_i_5__1_n_0 ),
        .I4(\e[5]_i_3_n_0 ),
        .O(\dc_bias[0]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \dc_bias[0]_i_3__1 
       (.I0(blue_p[3]),
        .I1(blue_p[0]),
        .I2(blue_p[1]),
        .O(\dc_bias[0]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \dc_bias[0]_i_4 
       (.I0(blue_p[7]),
        .I1(\e[6]_i_3__1_n_0 ),
        .I2(blue_p[5]),
        .I3(blue_p[6]),
        .O(\dc_bias[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[0]_i_5__1 
       (.I0(blue_p[5]),
        .I1(blue_p[6]),
        .O(\dc_bias[0]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[1]_i_10__0 
       (.I0(blue_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_10__0_n_0 ));
  LUT6 #(
    .INIT(64'h966996690000FFFF)) 
    \dc_bias[1]_i_2__1 
       (.I0(\dc_bias[3]_i_8__1_n_0 ),
        .I1(\dc_bias[3]_i_10__1_n_0 ),
        .I2(\dc_bias[3]_i_11__1_n_0 ),
        .I3(\dc_bias[3]_i_9__1_n_0 ),
        .I4(\dc_bias[1]_i_4__0_n_0 ),
        .I5(\e[5]_i_4_n_0 ),
        .O(\dc_bias[1]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h0FF0F00F66666666)) 
    \dc_bias[1]_i_3__1 
       (.I0(\dc_bias[1]_i_5__0_n_0 ),
        .I1(\dc_bias[1]_i_6__1_n_0 ),
        .I2(\dc_bias[1]_i_7__1_n_0 ),
        .I3(\dc_bias[1]_i_8__0_n_0 ),
        .I4(\e[5]_i_6_n_0 ),
        .I5(\e[8]_i_3_n_0 ),
        .O(\dc_bias[1]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h69C3C396)) 
    \dc_bias[1]_i_4__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[9]_i_8__0_n_0 ),
        .I3(\e[8]_i_3_n_0 ),
        .I4(\dc_bias[0]_i_2__1_n_0 ),
        .O(\dc_bias[1]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \dc_bias[1]_i_5__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias[0]_i_2__1_n_0 ),
        .O(\dc_bias[1]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h9669966969969669)) 
    \dc_bias[1]_i_6__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[5]_i_10_n_0 ),
        .I2(\e[5]_i_6_n_0 ),
        .I3(\e[5]_i_9_n_0 ),
        .I4(\dc_bias[0]_i_3__1_n_0 ),
        .I5(\dc_bias[1]_i_9_n_0 ),
        .O(\dc_bias[1]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h14D782BE82BE14D7)) 
    \dc_bias[1]_i_7__1 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(\dc_bias[0]_i_4_n_0 ),
        .I2(\dc_bias[1]_i_10__0_n_0 ),
        .I3(\dc_bias[0]_i_3__1_n_0 ),
        .I4(\dc_bias[0]_i_5__1_n_0 ),
        .I5(\e[5]_i_3_n_0 ),
        .O(\dc_bias[1]_i_7__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2BD4D42B)) 
    \dc_bias[1]_i_8__0 
       (.I0(\e[7]_i_4__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(blue_p[0]),
        .I3(\e[5]_i_10_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[1]_i_8__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[1]_i_9 
       (.I0(blue_p[5]),
        .I1(blue_p[7]),
        .I2(blue_p[0]),
        .O(\dc_bias[1]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \dc_bias[2]_i_10__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(blue_p[0]),
        .O(\dc_bias[2]_i_10__1_n_0 ));
  LUT6 #(
    .INIT(64'h7117177117717117)) 
    \dc_bias[2]_i_11 
       (.I0(blue_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[8]_i_3_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[6]_i_3__1_n_0 ),
        .I5(\dc_bias[0]_i_5__1_n_0 ),
        .O(\dc_bias[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFF0000FF69696969)) 
    \dc_bias[2]_i_2__0 
       (.I0(\dc_bias[2]_i_4__1_n_0 ),
        .I1(\dc_bias[3]_i_14__0_n_0 ),
        .I2(\dc_bias[2]_i_5__1_n_0 ),
        .I3(\dc_bias[2]_i_6__1_n_0 ),
        .I4(\dc_bias[3]_i_12__0_n_0 ),
        .I5(\e[5]_i_4_n_0 ),
        .O(\dc_bias[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h69AA6955695569AA)) 
    \dc_bias[2]_i_3__1 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\dc_bias[2]_i_7__1_n_0 ),
        .I2(\dc_bias[2]_i_8__1_n_0 ),
        .I3(\e[8]_i_3_n_0 ),
        .I4(\dc_bias[2]_i_9__0_n_0 ),
        .I5(\e[9]_i_9__0_n_0 ),
        .O(\dc_bias[2]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF9999990)) 
    \dc_bias[2]_i_4__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_8__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\e[8]_i_3_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \dc_bias[2]_i_5__1 
       (.I0(\e[9]_i_8__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[2]_i_5__1_n_0 ));
  LUT6 #(
    .INIT(64'hD44242D442D4D442)) 
    \dc_bias[2]_i_6__1 
       (.I0(\dc_bias[3]_i_8__1_n_0 ),
        .I1(\dc_bias[3]_i_9__1_n_0 ),
        .I2(\dc_bias[3]_i_10__1_n_0 ),
        .I3(\dc_bias[2]_i_10__1_n_0 ),
        .I4(\dc_bias[3]_i_17__1_n_0 ),
        .I5(\dc_bias[3]_i_16__1_n_0 ),
        .O(\dc_bias[2]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h4DD44D4D4D4DD44D)) 
    \dc_bias[2]_i_7__1 
       (.I0(\dc_bias[2]_i_11_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[6]_i_3__1_n_0 ),
        .I3(blue_p[6]),
        .I4(blue_p[5]),
        .I5(\e[8]_i_3_n_0 ),
        .O(\dc_bias[2]_i_7__1_n_0 ));
  LUT5 #(
    .INIT(32'h14417DD7)) 
    \dc_bias[2]_i_8__1 
       (.I0(\dc_bias[1]_i_7__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[5]_i_10_n_0 ),
        .I3(\dc_bias[2]_i_11_n_0 ),
        .I4(\e[5]_i_6_n_0 ),
        .O(\dc_bias[2]_i_8__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    \dc_bias[2]_i_9__0 
       (.I0(\dc_bias[1]_i_5__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[9]_i_8__0_n_0 ),
        .O(\dc_bias[2]_i_9__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h1482)) 
    \dc_bias[3]_i_10__1 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(blue_p[1]),
        .I2(blue_p[0]),
        .I3(blue_p[2]),
        .O(\dc_bias[3]_i_10__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    \dc_bias[3]_i_11__1 
       (.I0(\dc_bias[3]_i_16__1_n_0 ),
        .I1(\dc_bias[3]_i_17__1_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(blue_p[0]),
        .O(\dc_bias[3]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'hE8818181177E7E7E)) 
    \dc_bias[3]_i_12__0 
       (.I0(\dc_bias[3]_i_17__1_n_0 ),
        .I1(\dc_bias[3]_i_16__1_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(blue_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_12__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAA9A999A9999995)) 
    \dc_bias[3]_i_13__1 
       (.I0(p_1_in),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias[3]_i_18__0_n_0 ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .I4(\dc_bias[3]_i_17__1_n_0 ),
        .I5(\dc_bias[3]_i_16__1_n_0 ),
        .O(\dc_bias[3]_i_13__1_n_0 ));
  LUT6 #(
    .INIT(64'h65A6A6656559A69A)) 
    \dc_bias[3]_i_14__0 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\e[5]_i_8_n_0 ),
        .I2(\e[5]_i_9_n_0 ),
        .I3(\e[5]_i_6_n_0 ),
        .I4(\e[5]_i_10_n_0 ),
        .I5(\e[5]_i_7_n_0 ),
        .O(\dc_bias[3]_i_14__0_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dc_bias[3]_i_15__1 
       (.I0(blue_p[5]),
        .I1(blue_p[2]),
        .I2(blue_p[3]),
        .I3(blue_p[1]),
        .I4(blue_p[0]),
        .I5(blue_p[7]),
        .O(\dc_bias[3]_i_15__1_n_0 ));
  LUT6 #(
    .INIT(64'hD22D2DD24BB4B44B)) 
    \dc_bias[3]_i_16__1 
       (.I0(blue_p[4]),
        .I1(\e[8]_i_3_n_0 ),
        .I2(\dc_bias[3]_i_19__1_n_0 ),
        .I3(blue_p[3]),
        .I4(blue_p[2]),
        .I5(blue_p[5]),
        .O(\dc_bias[3]_i_16__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h8EE8E88E)) 
    \dc_bias[3]_i_17__1 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(blue_p[7]),
        .I2(\e[6]_i_3__1_n_0 ),
        .I3(blue_p[5]),
        .I4(blue_p[6]),
        .O(\dc_bias[3]_i_17__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_18__0 
       (.I0(blue_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_18__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[3]_i_19__1 
       (.I0(blue_p[1]),
        .I1(blue_p[0]),
        .O(\dc_bias[3]_i_19__1_n_0 ));
  LUT6 #(
    .INIT(64'hB888B8BBB8BBB888)) 
    \dc_bias[3]_i_1__0 
       (.I0(\dc_bias_reg[3]_i_2_n_0 ),
        .I1(\e[5]_i_2__1_n_0 ),
        .I2(\dc_bias[3]_i_3__1_n_0 ),
        .I3(\e[5]_i_4_n_0 ),
        .I4(\dc_bias[3]_i_4__1_n_0 ),
        .I5(\dc_bias[3]_i_5__1_n_0 ),
        .O(\dc_bias[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hD440FFFD2BBF0002)) 
    \dc_bias[3]_i_3__1 
       (.I0(\dc_bias[3]_i_8__1_n_0 ),
        .I1(\dc_bias[3]_i_9__1_n_0 ),
        .I2(\dc_bias[3]_i_10__1_n_0 ),
        .I3(\dc_bias[3]_i_11__1_n_0 ),
        .I4(\dc_bias[3]_i_12__0_n_0 ),
        .I5(\dc_bias[3]_i_13__1_n_0 ),
        .O(\dc_bias[3]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_4__1 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\e[9]_i_9__0_n_0 ),
        .O(\dc_bias[3]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h455D5D5D5D5D5DDF)) 
    \dc_bias[3]_i_5__1 
       (.I0(\dc_bias[3]_i_14__0_n_0 ),
        .I1(\e[9]_i_8__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[0]_i_2__1_n_0 ),
        .I4(\e[8]_i_3_n_0 ),
        .I5(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_5__1_n_0 ));
  LUT6 #(
    .INIT(64'hA9A995A995A99595)) 
    \dc_bias[3]_i_6__0 
       (.I0(\e[5]_i_4_n_0 ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\e[9]_i_9__0_n_0 ),
        .I3(\e[9]_i_8__0_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .I5(\dc_bias[1]_i_5__0_n_0 ),
        .O(\dc_bias[3]_i_6__0_n_0 ));
  LUT4 #(
    .INIT(16'h7E81)) 
    \dc_bias[3]_i_7__1 
       (.I0(\dc_bias[2]_i_8__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias[2]_i_7__1_n_0 ),
        .I3(p_1_in),
        .O(\dc_bias[3]_i_7__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h06606006)) 
    \dc_bias[3]_i_8__1 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(blue_p[2]),
        .I2(\dc_bias[3]_i_15__1_n_0 ),
        .I3(blue_p[0]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_8__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hEB8282EB)) 
    \dc_bias[3]_i_9__1 
       (.I0(blue_p[7]),
        .I1(\e[3]_i_3_n_0 ),
        .I2(blue_p[5]),
        .I3(blue_p[0]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_9__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[0]_i_1__1_n_0 ),
        .Q(\dc_bias_reg_n_0_[0] ),
        .R(blank));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[1]_i_1__1_n_0 ),
        .Q(\dc_bias_reg_n_0_[1] ),
        .R(blank));
  MUXF7 \dc_bias_reg[1]_i_1__1 
       (.I0(\dc_bias[1]_i_2__1_n_0 ),
        .I1(\dc_bias[1]_i_3__1_n_0 ),
        .O(\dc_bias_reg[1]_i_1__1_n_0 ),
        .S(\e[5]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[2]_i_1__0_n_0 ),
        .Q(\dc_bias_reg_n_0_[2] ),
        .R(blank));
  MUXF7 \dc_bias_reg[2]_i_1__0 
       (.I0(\dc_bias[2]_i_2__0_n_0 ),
        .I1(\dc_bias[2]_i_3__1_n_0 ),
        .O(\dc_bias_reg[2]_i_1__0_n_0 ),
        .S(\e[5]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[3]_i_1__0_n_0 ),
        .Q(p_1_in),
        .R(blank));
  MUXF7 \dc_bias_reg[3]_i_2 
       (.I0(\dc_bias[3]_i_6__0_n_0 ),
        .I1(\dc_bias[3]_i_7__1_n_0 ),
        .O(\dc_bias_reg[3]_i_2_n_0 ),
        .S(\e[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEEEFEFEE)) 
    \e[0]_i_1__1 
       (.I0(\e[0]_i_2__0_n_0 ),
        .I1(\e[0]_i_3_n_0 ),
        .I2(blank),
        .I3(\e[9]_i_3__1_n_0 ),
        .I4(blue_p[0]),
        .O(\e[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hC0A6000000000000)) 
    \e[0]_i_2__0 
       (.I0(TERC4Character0[0]),
        .I1(TERC4Character0[2]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[1]),
        .I4(guardBandEnable_0),
        .I5(blank),
        .O(\e[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hC4C0C400)) 
    \e[0]_i_3 
       (.I0(isTERC4Region),
        .I1(blank),
        .I2(guardBandEnable),
        .I3(controlChannel0Blue[0]),
        .I4(controlChannel0Blue[1]),
        .O(\e[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h1EE14BB4)) 
    \e[1]_i_2__1 
       (.I0(\e[5]_i_2__1_n_0 ),
        .I1(\e[8]_i_3_n_0 ),
        .I2(blue_p[1]),
        .I3(blue_p[0]),
        .I4(\e[5]_i_4_n_0 ),
        .O(\e[1]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFABABAEAEAEAAAEA)) 
    \e[1]_i_3 
       (.I0(\e[1]_i_4_n_0 ),
        .I1(TERC4Character0[0]),
        .I2(guardBandEnable_0),
        .I3(TERC4Character0[3]),
        .I4(TERC4Character0[1]),
        .I5(TERC4Character0[2]),
        .O(\e[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8BCC)) 
    \e[1]_i_4 
       (.I0(controlChannel0Blue[1]),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel0Blue[0]),
        .O(\e[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B88BB88B8BB8)) 
    \e[2]_i_1__1 
       (.I0(\e[2]_i_2__0_n_0 ),
        .I1(blank),
        .I2(blue_p[1]),
        .I3(blue_p[0]),
        .I4(blue_p[2]),
        .I5(\e[9]_i_3__1_n_0 ),
        .O(\e[2]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h000F6666000F0F0F)) 
    \e[2]_i_2__0 
       (.I0(\e[2]_i_3__0_n_0 ),
        .I1(\e[9]_i_7__0_n_0 ),
        .I2(controlChannel0Blue[0]),
        .I3(controlChannel0Blue[1]),
        .I4(guardBandEnable),
        .I5(isTERC4Region),
        .O(\e[2]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h03B3)) 
    \e[2]_i_3__0 
       (.I0(TERC4Character0[3]),
        .I1(TERC4Character0[0]),
        .I2(TERC4Character0[1]),
        .I3(TERC4Character0[2]),
        .O(\e[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8888BB8BB8B88)) 
    \e[3]_i_1__1 
       (.I0(\e[3]_i_2__1_n_0 ),
        .I1(blank),
        .I2(\e[5]_i_2__1_n_0 ),
        .I3(\e[8]_i_3_n_0 ),
        .I4(\e[3]_i_3_n_0 ),
        .I5(\e[5]_i_4_n_0 ),
        .O(\e[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFF02)) 
    \e[3]_i_2__1 
       (.I0(guardBandEnable),
        .I1(controlChannel0Blue[1]),
        .I2(controlChannel0Blue[0]),
        .I3(\e[3]_i_4_n_0 ),
        .O(\e[3]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \e[3]_i_3 
       (.I0(blue_p[0]),
        .I1(blue_p[1]),
        .I2(blue_p[3]),
        .I3(blue_p[2]),
        .O(\e[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF1070C090)) 
    \e[3]_i_4 
       (.I0(TERC4Character0[0]),
        .I1(TERC4Character0[2]),
        .I2(guardBandEnable_0),
        .I3(TERC4Character0[1]),
        .I4(TERC4Character0[3]),
        .I5(\e[3]_i_5_n_0 ),
        .O(\e[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \e[3]_i_5 
       (.I0(controlChannel0Blue[0]),
        .I1(isTERC4Region),
        .I2(guardBandEnable),
        .O(\e[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hE2D1)) 
    \e[4]_i_1__1 
       (.I0(\e[9]_i_3__1_n_0 ),
        .I1(blank),
        .I2(\e[4]_i_2_n_0 ),
        .I3(\e[6]_i_3__1_n_0 ),
        .O(\e[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hAEBAAAAAFEAFAAAA)) 
    \e[4]_i_2 
       (.I0(\e[4]_i_3_n_0 ),
        .I1(TERC4Character0[2]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[0]),
        .I4(guardBandEnable_0),
        .I5(TERC4Character0[1]),
        .O(\e[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h01C1)) 
    \e[4]_i_3 
       (.I0(isTERC4Region),
        .I1(guardBandEnable),
        .I2(controlChannel0Blue[0]),
        .I3(controlChannel0Blue[1]),
        .O(\e[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h18E7)) 
    \e[5]_i_10 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(blue_p[5]),
        .I2(blue_p[6]),
        .I3(\e[6]_i_3__1_n_0 ),
        .O(\e[5]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h96B1)) 
    \e[5]_i_11 
       (.I0(TERC4Character0[1]),
        .I1(TERC4Character0[0]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[2]),
        .O(\e[5]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001E4B)) 
    \e[5]_i_1__0 
       (.I0(\e[5]_i_2__1_n_0 ),
        .I1(\e[8]_i_3_n_0 ),
        .I2(\e[5]_i_3_n_0 ),
        .I3(\e[5]_i_4_n_0 ),
        .I4(blank),
        .I5(\e[5]_i_5_n_0 ),
        .O(\e[5]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hFF40)) 
    \e[5]_i_2__1 
       (.I0(\e[9]_i_8__0_n_0 ),
        .I1(\dc_bias[0]_i_2__1_n_0 ),
        .I2(\e[9]_i_9__0_n_0 ),
        .I3(\e[9]_i_10__0_n_0 ),
        .O(\e[5]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \e[5]_i_3 
       (.I0(blue_p[5]),
        .I1(blue_p[0]),
        .I2(blue_p[1]),
        .I3(blue_p[3]),
        .I4(blue_p[2]),
        .I5(blue_p[4]),
        .O(\e[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9A56AA9A6656AA66)) 
    \e[5]_i_4 
       (.I0(p_1_in),
        .I1(\e[5]_i_6_n_0 ),
        .I2(\e[5]_i_7_n_0 ),
        .I3(\e[5]_i_8_n_0 ),
        .I4(\e[5]_i_9_n_0 ),
        .I5(\e[5]_i_10_n_0 ),
        .O(\e[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h303050C0C0C050C0)) 
    \e[5]_i_5 
       (.I0(\e[5]_i_11_n_0 ),
        .I1(controlChannel0Blue[0]),
        .I2(blank),
        .I3(isTERC4Region),
        .I4(guardBandEnable),
        .I5(controlChannel0Blue[1]),
        .O(\e[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hD22D4BB4)) 
    \e[5]_i_6 
       (.I0(blue_p[2]),
        .I1(blue_p[3]),
        .I2(blue_p[0]),
        .I3(blue_p[1]),
        .I4(\e[8]_i_3_n_0 ),
        .O(\e[5]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hE718)) 
    \e[5]_i_7 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(blue_p[5]),
        .I2(blue_p[6]),
        .I3(\e[6]_i_3__1_n_0 ),
        .O(\e[5]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h82282882)) 
    \e[5]_i_8 
       (.I0(\dc_bias[0]_i_3__1_n_0 ),
        .I1(blue_p[0]),
        .I2(\dc_bias[0]_i_4_n_0 ),
        .I3(\dc_bias[0]_i_5__1_n_0 ),
        .I4(\e[5]_i_3_n_0 ),
        .O(\e[5]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h35C5535CC5355C53)) 
    \e[5]_i_9 
       (.I0(blue_p[0]),
        .I1(blue_p[6]),
        .I2(blue_p[5]),
        .I3(\e[6]_i_3__1_n_0 ),
        .I4(blue_p[7]),
        .I5(\e[8]_i_3_n_0 ),
        .O(\e[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hB88B8BB88BB8B88B)) 
    \e[6]_i_1__1 
       (.I0(\e[6]_i_2__0_n_0 ),
        .I1(blank),
        .I2(\e[6]_i_3__1_n_0 ),
        .I3(blue_p[5]),
        .I4(blue_p[6]),
        .I5(\e[9]_i_3__1_n_0 ),
        .O(\e[6]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEBEBBEAAAAAAAA)) 
    \e[6]_i_2__0 
       (.I0(\e[6]_i_4__0_n_0 ),
        .I1(TERC4Character0[3]),
        .I2(TERC4Character0[2]),
        .I3(TERC4Character0[1]),
        .I4(TERC4Character0[0]),
        .I5(guardBandEnable_0),
        .O(\e[6]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[6]_i_3__1 
       (.I0(blue_p[4]),
        .I1(blue_p[2]),
        .I2(blue_p[3]),
        .I3(blue_p[1]),
        .I4(blue_p[0]),
        .O(\e[6]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFC05)) 
    \e[6]_i_4__0 
       (.I0(isTERC4Region),
        .I1(controlChannel0Blue[1]),
        .I2(controlChannel0Blue[0]),
        .I3(guardBandEnable),
        .O(\e[6]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hEFE0E0EF)) 
    \e[7]_i_1__1 
       (.I0(\e[7]_i_2__1_n_0 ),
        .I1(\e[7]_i_3__0_n_0 ),
        .I2(blank),
        .I3(\e[7]_i_4__0_n_0 ),
        .I4(\e[9]_i_3__1_n_0 ),
        .O(\e[7]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h4000400004404444)) 
    \e[7]_i_2__1 
       (.I0(guardBandEnable),
        .I1(isTERC4Region),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[1]),
        .I4(TERC4Character0[2]),
        .I5(TERC4Character0[0]),
        .O(\e[7]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hF3FB0008030BF0F8)) 
    \e[7]_i_3__0 
       (.I0(TERC4Character0[1]),
        .I1(isTERC4Region),
        .I2(guardBandEnable),
        .I3(TERC4Character0[2]),
        .I4(controlChannel0Blue[0]),
        .I5(controlChannel0Blue[1]),
        .O(\e[7]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[7]_i_4__0 
       (.I0(blue_p[6]),
        .I1(blue_p[5]),
        .I2(\e[6]_i_3__1_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[8]_i_3_n_0 ),
        .O(\e[7]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h777777F7444444C4)) 
    \e[8]_i_1__0 
       (.I0(\e[8]_i_2__0_n_0 ),
        .I1(blank),
        .I2(isTERC4Region),
        .I3(guardBandEnable),
        .I4(\e[9]_i_5__0_n_0 ),
        .I5(\e[8]_i_3_n_0 ),
        .O(\e[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0DDF0FFFFDDF0)) 
    \e[8]_i_2__0 
       (.I0(TERC4Character0[2]),
        .I1(TERC4Character0[3]),
        .I2(controlChannel0Blue[0]),
        .I3(isTERC4Region),
        .I4(guardBandEnable),
        .I5(controlChannel0Blue[1]),
        .O(\e[8]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h55550445555D0445)) 
    \e[8]_i_3 
       (.I0(\e[8]_i_4__0_n_0 ),
        .I1(\e[8]_i_5__0_n_0 ),
        .I2(blue_p[7]),
        .I3(\e[8]_i_6__0_n_0 ),
        .I4(\e[8]_i_7__0_n_0 ),
        .I5(blue_p[0]),
        .O(\e[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE8E8E800E8000000)) 
    \e[8]_i_4__0 
       (.I0(blue_p[4]),
        .I1(blue_p[6]),
        .I2(blue_p[5]),
        .I3(blue_p[1]),
        .I4(blue_p[3]),
        .I5(blue_p[2]),
        .O(\e[8]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[8]_i_5__0 
       (.I0(blue_p[2]),
        .I1(blue_p[3]),
        .I2(blue_p[1]),
        .O(\e[8]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[8]_i_6__0 
       (.I0(blue_p[4]),
        .I1(blue_p[6]),
        .I2(blue_p[5]),
        .O(\e[8]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000001700171717)) 
    \e[8]_i_7__0 
       (.I0(blue_p[1]),
        .I1(blue_p[3]),
        .I2(blue_p[2]),
        .I3(blue_p[4]),
        .I4(blue_p[6]),
        .I5(blue_p[5]),
        .O(\e[8]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \e[9]_i_10__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(p_1_in),
        .O(\e[9]_i_10__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_11__0 
       (.I0(blue_p[6]),
        .I1(\e[8]_i_3_n_0 ),
        .I2(\e[6]_i_3__1_n_0 ),
        .O(\e[9]_i_11__0_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_12 
       (.I0(\e[6]_i_3__1_n_0 ),
        .I1(blue_p[5]),
        .I2(\e[8]_i_3_n_0 ),
        .O(\e[9]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \e[9]_i_1__1 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(blank),
        .O(\e[9]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCEEEEFCCCEEEE)) 
    \e[9]_i_2 
       (.I0(\e[9]_i_3__1_n_0 ),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(\e[9]_i_5__0_n_0 ),
        .I3(guardBandEnable_0),
        .I4(blank),
        .I5(\e[9]_i_7__0_n_0 ),
        .O(\e[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h555510005555DFFF)) 
    \e[9]_i_3__1 
       (.I0(\e[8]_i_3_n_0 ),
        .I1(\e[9]_i_8__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\e[9]_i_9__0_n_0 ),
        .I4(\e[9]_i_10__0_n_0 ),
        .I5(\e[5]_i_4_n_0 ),
        .O(\e[9]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hA200E300)) 
    \e[9]_i_4__0 
       (.I0(guardBandEnable),
        .I1(controlChannel0Blue[1]),
        .I2(controlChannel0Blue[0]),
        .I3(blank),
        .I4(isTERC4Region),
        .O(\e[9]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hB9FF)) 
    \e[9]_i_5__0 
       (.I0(TERC4Character0[0]),
        .I1(TERC4Character0[1]),
        .I2(TERC4Character0[2]),
        .I3(TERC4Character0[3]),
        .O(\e[9]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \e[9]_i_7__0 
       (.I0(TERC4Character0[2]),
        .I1(TERC4Character0[3]),
        .O(\e[9]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'h71188EE78EE77118)) 
    \e[9]_i_8__0 
       (.I0(\dc_bias[0]_i_3__1_n_0 ),
        .I1(blue_p[0]),
        .I2(\e[7]_i_4__0_n_0 ),
        .I3(\e[9]_i_11__0_n_0 ),
        .I4(\e[5]_i_6_n_0 ),
        .I5(\e[5]_i_10_n_0 ),
        .O(\e[9]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h8BFFFF74008B8BFF)) 
    \e[9]_i_9__0 
       (.I0(\e[9]_i_12_n_0 ),
        .I1(\dc_bias[0]_i_5__1_n_0 ),
        .I2(\e[6]_i_3__1_n_0 ),
        .I3(\e[5]_i_6_n_0 ),
        .I4(\e[5]_i_9_n_0 ),
        .I5(\e[5]_i_8_n_0 ),
        .O(\e[9]_i_9__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[0]_i_1__1_n_0 ),
        .Q(EncodedB[0]),
        .R(\e[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[1]_i_1__0_n_0 ),
        .Q(EncodedB[1]),
        .R(\e[9]_i_1__1_n_0 ));
  MUXF7 \e_reg[1]_i_1__0 
       (.I0(\e[1]_i_2__1_n_0 ),
        .I1(\e[1]_i_3_n_0 ),
        .O(\e_reg[1]_i_1__0_n_0 ),
        .S(blank));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[2]_i_1__1_n_0 ),
        .Q(EncodedB[2]),
        .S(\e[9]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[3]_i_1__1_n_0 ),
        .Q(EncodedB[3]),
        .S(\e[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[4]_i_1__1_n_0 ),
        .Q(EncodedB[4]),
        .R(\e[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[5]_i_1__0_n_0 ),
        .Q(EncodedB[5]),
        .R(\e[9]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[6]_i_1__1_n_0 ),
        .Q(EncodedB[6]),
        .S(\e[9]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[7]_i_1__1_n_0 ),
        .Q(EncodedB[7]),
        .S(\e[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[8]_i_1__0_n_0 ),
        .Q(EncodedB[8]),
        .R(\e[9]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[9]_i_2_n_0 ),
        .Q(EncodedB[9]),
        .S(\e[9]_i_1__1_n_0 ));
endmodule

(* ORIG_REF_NAME = "dvid" *) 
module design_1_dvid_0_0_dvid
   (EncodedR,
    EncodedG,
    EncodedB,
    red_s,
    green_s,
    blue_s,
    cl_s,
    controlChannel1Green,
    isTERC4Region,
    blank,
    green_p,
    red_p,
    guardBandType,
    guardBandEnable,
    blue_p,
    TERC4Character0,
    clk_pixel_x1,
    clk_x10,
    controlChannel0Blue,
    controlChannel2Red,
    TERC4Character2,
    TERC4Character1,
    scanout_en);
  output [9:0]EncodedR;
  output [9:0]EncodedG;
  output [9:0]EncodedB;
  output red_s;
  output green_s;
  output blue_s;
  output cl_s;
  input [1:0]controlChannel1Green;
  input isTERC4Region;
  input blank;
  input [7:0]green_p;
  input [7:0]red_p;
  input guardBandType;
  input guardBandEnable;
  input [7:0]blue_p;
  input [3:0]TERC4Character0;
  input clk_pixel_x1;
  input clk_x10;
  input [1:0]controlChannel0Blue;
  input [1:0]controlChannel2Red;
  input [3:0]TERC4Character2;
  input [3:0]TERC4Character1;
  input scanout_en;

  wire [9:0]EncodedB;
  wire [9:0]EncodedG;
  wire [9:0]EncodedR;
  wire TDMS_encoder_red_n_0;
  wire [3:0]TERC4Character0;
  wire [3:0]TERC4Character1;
  wire [3:0]TERC4Character2;
  wire blank;
  wire [7:0]blue_p;
  wire blue_s;
  wire cl_s;
  wire clk_pixel_x1;
  wire clk_x10;
  wire [1:0]controlChannel0Blue;
  wire [1:0]controlChannel1Green;
  wire [1:0]controlChannel2Red;
  wire [8:0]data1;
  wire [7:0]green_p;
  wire green_s;
  wire guardBandEnable;
  wire guardBandType;
  wire isTERC4Region;
  wire [9:0]latched_blue;
  wire [9:0]latched_green;
  wire [9:0]latched_red;
  wire [7:0]red_p;
  wire red_s;
  wire red_s_i_1_n_0;
  wire scanout_en;
  wire [9:0]shift_blue;
  wire \shift_blue_reg_n_0_[0] ;
  wire \shift_blue_reg_n_0_[1] ;
  wire \shift_blue_reg_n_0_[2] ;
  wire \shift_blue_reg_n_0_[3] ;
  wire \shift_blue_reg_n_0_[4] ;
  wire \shift_blue_reg_n_0_[5] ;
  wire \shift_blue_reg_n_0_[6] ;
  wire \shift_blue_reg_n_0_[7] ;
  wire \shift_blue_reg_n_0_[8] ;
  wire \shift_blue_reg_n_0_[9] ;
  wire \shift_clock_reg_n_0_[0] ;
  wire \shift_clock_reg_n_0_[1] ;
  wire \shift_clock_reg_n_0_[2] ;
  wire \shift_clock_reg_n_0_[3] ;
  wire \shift_clock_reg_n_0_[4] ;
  wire \shift_clock_reg_n_0_[5] ;
  wire \shift_clock_reg_n_0_[6] ;
  wire \shift_clock_reg_n_0_[7] ;
  wire \shift_clock_reg_n_0_[8] ;
  wire \shift_clock_reg_n_0_[9] ;
  wire [9:0]shift_green;
  wire \shift_green_reg_n_0_[0] ;
  wire \shift_green_reg_n_0_[1] ;
  wire \shift_green_reg_n_0_[2] ;
  wire \shift_green_reg_n_0_[3] ;
  wire \shift_green_reg_n_0_[4] ;
  wire \shift_green_reg_n_0_[5] ;
  wire \shift_green_reg_n_0_[6] ;
  wire \shift_green_reg_n_0_[7] ;
  wire \shift_green_reg_n_0_[8] ;
  wire \shift_green_reg_n_0_[9] ;
  wire [9:0]shift_red;
  wire \shift_red[9]_i_2_n_0 ;
  wire \shift_red[9]_i_3_n_0 ;
  wire \shift_red_reg_n_0_[0] ;

  design_1_dvid_0_0_TDMS_encoder__parameterized3 TDMS_encoder_blue
       (.EncodedB(EncodedB),
        .TERC4Character0(TERC4Character0),
        .blank(blank),
        .blue_p(blue_p),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel0Blue(controlChannel0Blue),
        .guardBandEnable(guardBandEnable),
        .guardBandEnable_0(TDMS_encoder_red_n_0),
        .guardBandType(guardBandType),
        .isTERC4Region(isTERC4Region));
  design_1_dvid_0_0_TDMS_encoder__parameterized1 TDMS_encoder_green
       (.EncodedG(EncodedG),
        .TERC4Character1(TERC4Character1),
        .blank(blank),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel1Green(controlChannel1Green),
        .green_p(green_p),
        .guardBandEnable(guardBandEnable),
        .isTERC4Region(isTERC4Region));
  design_1_dvid_0_0_TDMS_encoder TDMS_encoder_red
       (.EncodedR(EncodedR),
        .TERC4Character2(TERC4Character2),
        .blank(blank),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel2Red(controlChannel2Red),
        .\e_reg[9]_0 (TDMS_encoder_red_n_0),
        .guardBandEnable(guardBandEnable),
        .guardBandType(guardBandType),
        .isTERC4Region(isTERC4Region),
        .red_p(red_p));
  FDRE blue_s_reg
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_blue_reg_n_0_[0] ),
        .Q(blue_s),
        .R(red_s_i_1_n_0));
  FDRE cl_s_reg
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[0] ),
        .Q(cl_s),
        .R(red_s_i_1_n_0));
  FDRE green_s_reg
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_green_reg_n_0_[0] ),
        .Q(green_s),
        .R(red_s_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[0]),
        .Q(latched_blue[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[1]),
        .Q(latched_blue[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[2]),
        .Q(latched_blue[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[3]),
        .Q(latched_blue[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[4]),
        .Q(latched_blue[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[5]),
        .Q(latched_blue[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[6]),
        .Q(latched_blue[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[7]),
        .Q(latched_blue[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[8]),
        .Q(latched_blue[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_blue_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedB[9]),
        .Q(latched_blue[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[0]),
        .Q(latched_green[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[1]),
        .Q(latched_green[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[2]),
        .Q(latched_green[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[3]),
        .Q(latched_green[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[4]),
        .Q(latched_green[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[5]),
        .Q(latched_green[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[6]),
        .Q(latched_green[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[7]),
        .Q(latched_green[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[8]),
        .Q(latched_green[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_green_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedG[9]),
        .Q(latched_green[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[0] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[0]),
        .Q(latched_red[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[1] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[1]),
        .Q(latched_red[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[2]),
        .Q(latched_red[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[3]),
        .Q(latched_red[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[4] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[4]),
        .Q(latched_red[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[5] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[5]),
        .Q(latched_red[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[6]),
        .Q(latched_red[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[7]),
        .Q(latched_red[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[8] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[8]),
        .Q(latched_red[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \latched_red_reg[9] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(EncodedR[9]),
        .Q(latched_red[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    red_s_i_1
       (.I0(scanout_en),
        .O(red_s_i_1_n_0));
  FDRE red_s_reg
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_red_reg_n_0_[0] ),
        .Q(red_s),
        .R(red_s_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[0]_i_1 
       (.I0(\shift_blue_reg_n_0_[1] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[0]),
        .O(shift_blue[0]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[1]_i_1 
       (.I0(\shift_blue_reg_n_0_[2] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[1]),
        .O(shift_blue[1]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[2]_i_1 
       (.I0(\shift_blue_reg_n_0_[3] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[2]),
        .O(shift_blue[2]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[3]_i_1 
       (.I0(\shift_blue_reg_n_0_[4] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[3]),
        .O(shift_blue[3]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[4]_i_1 
       (.I0(\shift_blue_reg_n_0_[5] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[4]),
        .O(shift_blue[4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[5]_i_1 
       (.I0(\shift_blue_reg_n_0_[6] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[5]),
        .O(shift_blue[5]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[6]_i_1 
       (.I0(\shift_blue_reg_n_0_[7] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[6]),
        .O(shift_blue[6]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[7]_i_1 
       (.I0(\shift_blue_reg_n_0_[8] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[7]),
        .O(shift_blue[7]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[8]_i_1 
       (.I0(\shift_blue_reg_n_0_[9] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[8]),
        .O(shift_blue[8]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \shift_blue[9]_i_1 
       (.I0(latched_blue[9]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .O(shift_blue[9]));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[0] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[0]),
        .Q(\shift_blue_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[1] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[1]),
        .Q(\shift_blue_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[2] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[2]),
        .Q(\shift_blue_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[3] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[3]),
        .Q(\shift_blue_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[4] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[4]),
        .Q(\shift_blue_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[5] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[5]),
        .Q(\shift_blue_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[6] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[6]),
        .Q(\shift_blue_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[7] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[7]),
        .Q(\shift_blue_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[8] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[8]),
        .Q(\shift_blue_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_blue_reg[9] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_blue[9]),
        .Q(\shift_blue_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shift_clock_reg[0] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[1] ),
        .Q(\shift_clock_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shift_clock_reg[1] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[2] ),
        .Q(\shift_clock_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shift_clock_reg[2] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[3] ),
        .Q(\shift_clock_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shift_clock_reg[3] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[4] ),
        .Q(\shift_clock_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shift_clock_reg[4] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[5] ),
        .Q(\shift_clock_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_clock_reg[5] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[6] ),
        .Q(\shift_clock_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_clock_reg[6] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[7] ),
        .Q(\shift_clock_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_clock_reg[7] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[8] ),
        .Q(\shift_clock_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_clock_reg[8] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[9] ),
        .Q(\shift_clock_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_clock_reg[9] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(\shift_clock_reg_n_0_[0] ),
        .Q(\shift_clock_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[0]_i_1 
       (.I0(\shift_green_reg_n_0_[1] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[0]),
        .O(shift_green[0]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[1]_i_1 
       (.I0(\shift_green_reg_n_0_[2] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[1]),
        .O(shift_green[1]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[2]_i_1 
       (.I0(\shift_green_reg_n_0_[3] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[2]),
        .O(shift_green[2]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[3]_i_1 
       (.I0(\shift_green_reg_n_0_[4] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[3]),
        .O(shift_green[3]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[4]_i_1 
       (.I0(\shift_green_reg_n_0_[5] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[4]),
        .O(shift_green[4]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[5]_i_1 
       (.I0(\shift_green_reg_n_0_[6] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[5]),
        .O(shift_green[5]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[6]_i_1 
       (.I0(\shift_green_reg_n_0_[7] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[6]),
        .O(shift_green[6]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[7]_i_1 
       (.I0(\shift_green_reg_n_0_[8] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[7]),
        .O(shift_green[7]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[8]_i_1 
       (.I0(\shift_green_reg_n_0_[9] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[8]),
        .O(shift_green[8]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \shift_green[9]_i_1 
       (.I0(latched_green[9]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .O(shift_green[9]));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[0] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[0]),
        .Q(\shift_green_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[1] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[1]),
        .Q(\shift_green_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[2] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[2]),
        .Q(\shift_green_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[3] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[3]),
        .Q(\shift_green_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[4] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[4]),
        .Q(\shift_green_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[5] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[5]),
        .Q(\shift_green_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[6] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[6]),
        .Q(\shift_green_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[7] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[7]),
        .Q(\shift_green_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[8] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[8]),
        .Q(\shift_green_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_green_reg[9] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_green[9]),
        .Q(\shift_green_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[0]_i_1 
       (.I0(data1[0]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[0]),
        .O(shift_red[0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[1]_i_1 
       (.I0(data1[1]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[1]),
        .O(shift_red[1]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[2]_i_1 
       (.I0(data1[2]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[2]),
        .O(shift_red[2]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[3]_i_1 
       (.I0(data1[3]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[3]),
        .O(shift_red[3]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[4]_i_1 
       (.I0(data1[4]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[4]),
        .O(shift_red[4]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[5]_i_1 
       (.I0(data1[5]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[5]),
        .O(shift_red[5]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[6]_i_1 
       (.I0(data1[6]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[6]),
        .O(shift_red[6]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[7]_i_1 
       (.I0(data1[7]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[7]),
        .O(shift_red[7]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[8]_i_1 
       (.I0(data1[8]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[8]),
        .O(shift_red[8]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \shift_red[9]_i_1 
       (.I0(latched_red[9]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .O(shift_red[9]));
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \shift_red[9]_i_2 
       (.I0(\shift_red[9]_i_3_n_0 ),
        .I1(\shift_clock_reg_n_0_[5] ),
        .I2(\shift_clock_reg_n_0_[4] ),
        .I3(\shift_clock_reg_n_0_[2] ),
        .I4(\shift_clock_reg_n_0_[3] ),
        .O(\shift_red[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \shift_red[9]_i_3 
       (.I0(\shift_clock_reg_n_0_[8] ),
        .I1(\shift_clock_reg_n_0_[9] ),
        .I2(\shift_clock_reg_n_0_[6] ),
        .I3(\shift_clock_reg_n_0_[7] ),
        .I4(\shift_clock_reg_n_0_[1] ),
        .I5(\shift_clock_reg_n_0_[0] ),
        .O(\shift_red[9]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[0] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[0]),
        .Q(\shift_red_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[1] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[1]),
        .Q(data1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[2] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[2]),
        .Q(data1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[3] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[3]),
        .Q(data1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[4] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[4]),
        .Q(data1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[5] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[5]),
        .Q(data1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[6] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[6]),
        .Q(data1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[7] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[7]),
        .Q(data1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[8] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[8]),
        .Q(data1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_red_reg[9] 
       (.C(clk_x10),
        .CE(1'b1),
        .D(shift_red[9]),
        .Q(data1[8]),
        .R(1'b0));
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
