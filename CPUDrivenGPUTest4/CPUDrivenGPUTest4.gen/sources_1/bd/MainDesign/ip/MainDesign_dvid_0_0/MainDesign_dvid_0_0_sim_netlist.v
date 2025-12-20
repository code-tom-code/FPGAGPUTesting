// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:49:00 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_dvid_0_0/MainDesign_dvid_0_0_sim_netlist.v
// Design      : MainDesign_dvid_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_dvid_0_0,dvid,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "dvid,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_dvid_0_0
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

  MainDesign_dvid_0_0_dvid U0
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
module MainDesign_dvid_0_0_TDMS_encoder
   (isTERC4Region_0,
    EncodedR,
    red_p,
    blank,
    isTERC4Region,
    guardBandEnable,
    guardBandType,
    controlChannel2Red,
    TERC4Character2,
    clk_pixel_x1);
  output isTERC4Region_0;
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
  wire \dc_bias[0]_i_2_n_0 ;
  wire \dc_bias[0]_i_3_n_0 ;
  wire \dc_bias[0]_i_4__0_n_0 ;
  wire \dc_bias[0]_i_5__0_n_0 ;
  wire \dc_bias[0]_i_6_n_0 ;
  wire \dc_bias[1]_i_2__0_n_0 ;
  wire \dc_bias[1]_i_3__0_n_0 ;
  wire \dc_bias[1]_i_4_n_0 ;
  wire \dc_bias[1]_i_5__0_n_0 ;
  wire \dc_bias[1]_i_6_n_0 ;
  wire \dc_bias[1]_i_7__1_n_0 ;
  wire \dc_bias[1]_i_8_n_0 ;
  wire \dc_bias[2]_i_10__1_n_0 ;
  wire \dc_bias[2]_i_11_n_0 ;
  wire \dc_bias[2]_i_12_n_0 ;
  wire \dc_bias[2]_i_13_n_0 ;
  wire \dc_bias[2]_i_2__0_n_0 ;
  wire \dc_bias[2]_i_3__0_n_0 ;
  wire \dc_bias[2]_i_4__0_n_0 ;
  wire \dc_bias[2]_i_5_n_0 ;
  wire \dc_bias[2]_i_6__0_n_0 ;
  wire \dc_bias[2]_i_7__1_n_0 ;
  wire \dc_bias[2]_i_8_n_0 ;
  wire \dc_bias[2]_i_9__0_n_0 ;
  wire \dc_bias[3]_i_10__1_n_0 ;
  wire \dc_bias[3]_i_11__0_n_0 ;
  wire \dc_bias[3]_i_12__0_n_0 ;
  wire \dc_bias[3]_i_13__0_n_0 ;
  wire \dc_bias[3]_i_14_n_0 ;
  wire \dc_bias[3]_i_15_n_0 ;
  wire \dc_bias[3]_i_16__0_n_0 ;
  wire \dc_bias[3]_i_17__0_n_0 ;
  wire \dc_bias[3]_i_18__1_n_0 ;
  wire \dc_bias[3]_i_19__0_n_0 ;
  wire \dc_bias[3]_i_1_n_0 ;
  wire \dc_bias[3]_i_20__0_n_0 ;
  wire \dc_bias[3]_i_21_n_0 ;
  wire \dc_bias[3]_i_22__0_n_0 ;
  wire \dc_bias[3]_i_23__0_n_0 ;
  wire \dc_bias[3]_i_24_n_0 ;
  wire \dc_bias[3]_i_25_n_0 ;
  wire \dc_bias[3]_i_26_n_0 ;
  wire \dc_bias[3]_i_27_n_0 ;
  wire \dc_bias[3]_i_3__0_n_0 ;
  wire \dc_bias[3]_i_4__0_n_0 ;
  wire \dc_bias[3]_i_5__0_n_0 ;
  wire \dc_bias[3]_i_6__0_n_0 ;
  wire \dc_bias[3]_i_7__0_n_0 ;
  wire \dc_bias[3]_i_8__0_n_0 ;
  wire \dc_bias[3]_i_9_n_0 ;
  wire \dc_bias_reg[1]_i_1__0_n_0 ;
  wire \dc_bias_reg[2]_i_1__0_n_0 ;
  wire \dc_bias_reg[3]_i_2_n_0 ;
  wire \dc_bias_reg_n_0_[0] ;
  wire \dc_bias_reg_n_0_[1] ;
  wire \dc_bias_reg_n_0_[2] ;
  wire \e[0]_i_1__0_n_0 ;
  wire \e[0]_i_2_n_0 ;
  wire \e[1]_i_2__0_n_0 ;
  wire \e[1]_i_3__0_n_0 ;
  wire \e[1]_i_4__0_n_0 ;
  wire \e[2]_i_2_n_0 ;
  wire \e[2]_i_3_n_0 ;
  wire \e[3]_i_2__0_n_0 ;
  wire \e[3]_i_3_n_0 ;
  wire \e[4]_i_1__0_n_0 ;
  wire \e[4]_i_2__1_n_0 ;
  wire \e[4]_i_3__0_n_0 ;
  wire \e[5]_i_1__0_n_0 ;
  wire \e[5]_i_2__1_n_0 ;
  wire \e[5]_i_3__1_n_0 ;
  wire \e[5]_i_4_n_0 ;
  wire \e[6]_i_2__1_n_0 ;
  wire \e[6]_i_3_n_0 ;
  wire \e[6]_i_4_n_0 ;
  wire \e[7]_i_2__0_n_0 ;
  wire \e[7]_i_3__0_n_0 ;
  wire \e[7]_i_4__0_n_0 ;
  wire \e[7]_i_5_n_0 ;
  wire \e[8]_i_1_n_0 ;
  wire \e[8]_i_2__0_n_0 ;
  wire \e[8]_i_3_n_0 ;
  wire \e[9]_i_10__1_n_0 ;
  wire \e[9]_i_11_n_0 ;
  wire \e[9]_i_12__0_n_0 ;
  wire \e[9]_i_13__0_n_0 ;
  wire \e[9]_i_14__0_n_0 ;
  wire \e[9]_i_15_n_0 ;
  wire \e[9]_i_16__0_n_0 ;
  wire \e[9]_i_17__0_n_0 ;
  wire \e[9]_i_18__0_n_0 ;
  wire \e[9]_i_19_n_0 ;
  wire \e[9]_i_1__0_n_0 ;
  wire \e[9]_i_2__0_n_0 ;
  wire \e[9]_i_3__0_n_0 ;
  wire \e[9]_i_4__0_n_0 ;
  wire \e[9]_i_5_n_0 ;
  wire \e[9]_i_6__0_n_0 ;
  wire \e[9]_i_7__0_n_0 ;
  wire \e[9]_i_8__0_n_0 ;
  wire \e[9]_i_9_n_0 ;
  wire \e_reg[1]_i_1_n_0 ;
  wire \e_reg[2]_i_1_n_0 ;
  wire \e_reg[3]_i_1_n_0 ;
  wire \e_reg[6]_i_1_n_0 ;
  wire \e_reg[7]_i_1_n_0 ;
  wire guardBandEnable;
  wire guardBandType;
  wire isTERC4Region;
  wire isTERC4Region_0;
  wire p_1_in;
  wire [7:0]red_p;

  LUT6 #(
    .INIT(64'h690069FF69FF6900)) 
    \dc_bias[0]_i_1__0 
       (.I0(\e[9]_i_2__0_n_0 ),
        .I1(\dc_bias[0]_i_2_n_0 ),
        .I2(\dc_bias[0]_i_3_n_0 ),
        .I3(\e[9]_i_3__0_n_0 ),
        .I4(\dc_bias[0]_i_4__0_n_0 ),
        .I5(\dc_bias[0]_i_5__0_n_0 ),
        .O(\dc_bias[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \dc_bias[0]_i_2 
       (.I0(\dc_bias[0]_i_6_n_0 ),
        .I1(red_p[0]),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(red_p[7]),
        .O(\dc_bias[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[0]_i_3 
       (.I0(red_p[2]),
        .I1(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00006996FFFF6996)) 
    \dc_bias[0]_i_4__0 
       (.I0(red_p[1]),
        .I1(red_p[0]),
        .I2(red_p[3]),
        .I3(\e[9]_i_10__1_n_0 ),
        .I4(\e[9]_i_4__0_n_0 ),
        .I5(red_p[2]),
        .O(\dc_bias[0]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'hB77B4884)) 
    \dc_bias[0]_i_5__0 
       (.I0(\dc_bias[0]_i_6_n_0 ),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(red_p[7]),
        .I3(red_p[0]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[0]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_6 
       (.I0(red_p[5]),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .I4(red_p[3]),
        .O(\dc_bias[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[1]_i_2__0 
       (.I0(\dc_bias[3]_i_11__0_n_0 ),
        .I1(\dc_bias[3]_i_10__1_n_0 ),
        .I2(\dc_bias[2]_i_4__0_n_0 ),
        .I3(\dc_bias[3]_i_13__0_n_0 ),
        .I4(\dc_bias[3]_i_12__0_n_0 ),
        .O(\dc_bias[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h690069FF69FF6900)) 
    \dc_bias[1]_i_3__0 
       (.I0(\dc_bias[1]_i_4_n_0 ),
        .I1(\dc_bias[1]_i_5__0_n_0 ),
        .I2(\dc_bias[1]_i_6_n_0 ),
        .I3(\e[9]_i_2__0_n_0 ),
        .I4(\dc_bias[1]_i_7__1_n_0 ),
        .I5(\dc_bias[1]_i_8_n_0 ),
        .O(\dc_bias[1]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h9009099009909009)) 
    \dc_bias[1]_i_4 
       (.I0(\dc_bias[2]_i_9__0_n_0 ),
        .I1(\dc_bias[2]_i_10__1_n_0 ),
        .I2(red_p[7]),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(red_p[0]),
        .I5(\dc_bias[0]_i_6_n_0 ),
        .O(\dc_bias[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h0690F96F)) 
    \dc_bias[1]_i_5__0 
       (.I0(red_p[0]),
        .I1(red_p[1]),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(red_p[2]),
        .I4(\dc_bias[3]_i_22__0_n_0 ),
        .O(\dc_bias[1]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hB22B)) 
    \dc_bias[1]_i_6 
       (.I0(red_p[7]),
        .I1(\dc_bias[0]_i_6_n_0 ),
        .I2(red_p[0]),
        .I3(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[1]_i_7__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_13__0_n_0 ),
        .O(\dc_bias[1]_i_7__1_n_0 ));
  LUT6 #(
    .INIT(64'h7DD7D77DEBBEBEEB)) 
    \dc_bias[1]_i_8 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(\e[9]_i_10__1_n_0 ),
        .I2(red_p[3]),
        .I3(red_p[0]),
        .I4(red_p[1]),
        .I5(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \dc_bias[2]_i_10__1 
       (.I0(red_p[2]),
        .I1(red_p[0]),
        .I2(red_p[1]),
        .O(\dc_bias[2]_i_10__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[2]_i_11 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h788787781EE1E11E)) 
    \dc_bias[2]_i_12 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(red_p[5]),
        .I2(red_p[3]),
        .I3(red_p[2]),
        .I4(\e[9]_i_14__0_n_0 ),
        .I5(red_p[4]),
        .O(\dc_bias[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h8EE8E88E)) 
    \dc_bias[2]_i_13 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(red_p[7]),
        .I2(\e[4]_i_3__0_n_0 ),
        .I3(red_p[5]),
        .I4(red_p[6]),
        .O(\dc_bias[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h18718E18E78E71E7)) 
    \dc_bias[2]_i_2__0 
       (.I0(\dc_bias[3]_i_13__0_n_0 ),
        .I1(\dc_bias[3]_i_12__0_n_0 ),
        .I2(\dc_bias[3]_i_10__1_n_0 ),
        .I3(\dc_bias[2]_i_4__0_n_0 ),
        .I4(\dc_bias[3]_i_11__0_n_0 ),
        .I5(\dc_bias[3]_i_5__0_n_0 ),
        .O(\dc_bias[2]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'h69FF6900)) 
    \dc_bias[2]_i_3__0 
       (.I0(\dc_bias[2]_i_5_n_0 ),
        .I1(\dc_bias[2]_i_6__0_n_0 ),
        .I2(\dc_bias[2]_i_7__1_n_0 ),
        .I3(\e[9]_i_2__0_n_0 ),
        .I4(\dc_bias[2]_i_8_n_0 ),
        .O(\dc_bias[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h95A595559AAA9A5A)) 
    \dc_bias[2]_i_4__0 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(red_p[0]),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(red_p[7]),
        .I4(\e[7]_i_4__0_n_0 ),
        .I5(\e[9]_i_13__0_n_0 ),
        .O(\dc_bias[2]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h767777F780E8E8FE)) 
    \dc_bias[2]_i_5 
       (.I0(\dc_bias[2]_i_9__0_n_0 ),
        .I1(\dc_bias[2]_i_10__1_n_0 ),
        .I2(red_p[7]),
        .I3(\dc_bias[2]_i_11_n_0 ),
        .I4(\dc_bias[0]_i_6_n_0 ),
        .I5(\dc_bias[3]_i_22__0_n_0 ),
        .O(\dc_bias[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2BBDBDBDD4424242)) 
    \dc_bias[2]_i_6__0 
       (.I0(\dc_bias[2]_i_12_n_0 ),
        .I1(\dc_bias[2]_i_13_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(red_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h0690FFFF)) 
    \dc_bias[2]_i_7__1 
       (.I0(red_p[0]),
        .I1(red_p[1]),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(red_p[2]),
        .I4(\dc_bias[3]_i_22__0_n_0 ),
        .O(\dc_bias[2]_i_7__1_n_0 ));
  LUT6 #(
    .INIT(64'hA69A9A9A9A9A9A59)) 
    \dc_bias[2]_i_8 
       (.I0(\dc_bias[3]_i_17__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\e[9]_i_13__0_n_0 ),
        .I3(\e[9]_i_4__0_n_0 ),
        .I4(\dc_bias[3]_i_24_n_0 ),
        .I5(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \dc_bias[2]_i_9__0 
       (.I0(red_p[0]),
        .I1(red_p[1]),
        .I2(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[2]_i_9__0_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8B888888B8BBB)) 
    \dc_bias[3]_i_1 
       (.I0(\dc_bias_reg[3]_i_2_n_0 ),
        .I1(\e[9]_i_3__0_n_0 ),
        .I2(\dc_bias[3]_i_3__0_n_0 ),
        .I3(\dc_bias[3]_i_4__0_n_0 ),
        .I4(\dc_bias[3]_i_5__0_n_0 ),
        .I5(\dc_bias[3]_i_6__0_n_0 ),
        .O(\dc_bias[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC33C699600000000)) 
    \dc_bias[3]_i_10__1 
       (.I0(red_p[4]),
        .I1(\e[9]_i_14__0_n_0 ),
        .I2(red_p[2]),
        .I3(red_p[3]),
        .I4(red_p[5]),
        .I5(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[3]_i_10__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \dc_bias[3]_i_11__0 
       (.I0(red_p[2]),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[3]_i_11__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h00909FFF)) 
    \dc_bias[3]_i_12__0 
       (.I0(red_p[0]),
        .I1(red_p[7]),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(\dc_bias[0]_i_6_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_12__0_n_0 ));
  LUT6 #(
    .INIT(64'hF55FF3F35FF5F3F3)) 
    \dc_bias[3]_i_13__0 
       (.I0(red_p[2]),
        .I1(\dc_bias[3]_i_24_n_0 ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(\dc_bias[3]_i_25_n_0 ),
        .I4(\e[9]_i_4__0_n_0 ),
        .I5(\dc_bias[0]_i_6_n_0 ),
        .O(\dc_bias[3]_i_13__0_n_0 ));
  LUT6 #(
    .INIT(64'h808C8C808C80808C)) 
    \dc_bias[3]_i_14 
       (.I0(red_p[0]),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(red_p[7]),
        .I3(\e[4]_i_3__0_n_0 ),
        .I4(red_p[5]),
        .I5(red_p[6]),
        .O(\dc_bias[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hA9AAAAAA99A9A9AA)) 
    \dc_bias[3]_i_15 
       (.I0(p_1_in),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(\dc_bias[3]_i_23__0_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_8__0_n_0 ),
        .I5(\e[9]_i_7__0_n_0 ),
        .O(\dc_bias[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h656666A655656566)) 
    \dc_bias[3]_i_16__0 
       (.I0(p_1_in),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias[3]_i_23__0_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_8__0_n_0 ),
        .I5(\e[9]_i_7__0_n_0 ),
        .O(\dc_bias[3]_i_16__0_n_0 ));
  LUT6 #(
    .INIT(64'h9AA6599A599A599A)) 
    \dc_bias[3]_i_17__0 
       (.I0(\dc_bias_reg_n_0_[2] ),
        .I1(\e[9]_i_7__0_n_0 ),
        .I2(\e[9]_i_8__0_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_10__1_n_0 ),
        .I5(\e[9]_i_11_n_0 ),
        .O(\dc_bias[3]_i_17__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000000014414114)) 
    \dc_bias[3]_i_18__1 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[3]),
        .I4(\e[9]_i_10__1_n_0 ),
        .I5(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[3]_i_18__1_n_0 ));
  LUT6 #(
    .INIT(64'h8228288200000000)) 
    \dc_bias[3]_i_19__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[3]),
        .I4(\e[9]_i_10__1_n_0 ),
        .I5(\e[9]_i_4__0_n_0 ),
        .O(\dc_bias[3]_i_19__0_n_0 ));
  LUT6 #(
    .INIT(64'h555556556A56AA6A)) 
    \dc_bias[3]_i_20__0 
       (.I0(p_1_in),
        .I1(\dc_bias[3]_i_26_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[2]_i_12_n_0 ),
        .I4(\dc_bias[2]_i_13_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_20__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h4224)) 
    \dc_bias[3]_i_21 
       (.I0(red_p[2]),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(red_p[1]),
        .I3(red_p[0]),
        .O(\dc_bias[3]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h69999666)) 
    \dc_bias[3]_i_22__0 
       (.I0(\dc_bias[2]_i_12_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(red_p[0]),
        .I4(\dc_bias[2]_i_13_n_0 ),
        .O(\dc_bias[3]_i_22__0_n_0 ));
  LUT6 #(
    .INIT(64'h9669699600000000)) 
    \dc_bias[3]_i_23__0 
       (.I0(red_p[5]),
        .I1(red_p[6]),
        .I2(red_p[0]),
        .I3(\dc_bias[3]_i_27_n_0 ),
        .I4(\e[5]_i_3__1_n_0 ),
        .I5(\e[9]_i_11_n_0 ),
        .O(\dc_bias[3]_i_23__0_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \dc_bias[3]_i_24 
       (.I0(red_p[5]),
        .I1(red_p[6]),
        .I2(\e[9]_i_11_n_0 ),
        .I3(red_p[0]),
        .I4(\dc_bias[3]_i_27_n_0 ),
        .I5(\e[5]_i_3__1_n_0 ),
        .O(\dc_bias[3]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[3]_i_25 
       (.I0(red_p[0]),
        .I1(red_p[7]),
        .O(\dc_bias[3]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_26 
       (.I0(red_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \dc_bias[3]_i_27 
       (.I0(red_p[7]),
        .I1(\e[4]_i_3__0_n_0 ),
        .I2(red_p[5]),
        .I3(red_p[6]),
        .O(\dc_bias[3]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h000096699669FFFF)) 
    \dc_bias[3]_i_3__0 
       (.I0(\dc_bias[3]_i_9_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_10__1_n_0 ),
        .I3(\dc_bias[3]_i_11__0_n_0 ),
        .I4(\dc_bias[3]_i_12__0_n_0 ),
        .I5(\dc_bias[3]_i_13__0_n_0 ),
        .O(\dc_bias[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAFEFFAB00A8AA02)) 
    \dc_bias[3]_i_4__0 
       (.I0(\dc_bias[3]_i_10__1_n_0 ),
        .I1(\e[9]_i_13__0_n_0 ),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(\dc_bias[3]_i_14_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .I5(\dc_bias[3]_i_11__0_n_0 ),
        .O(\dc_bias[3]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'hC095C0993F6A3F66)) 
    \dc_bias[3]_i_5__0 
       (.I0(\e[9]_i_12__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_14_n_0 ),
        .I3(\e[9]_i_4__0_n_0 ),
        .I4(\e[9]_i_13__0_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h56AA56AA555656AA)) 
    \dc_bias[3]_i_6__0 
       (.I0(\dc_bias[3]_i_15_n_0 ),
        .I1(\e[9]_i_12__0_n_0 ),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(\dc_bias_reg_n_0_[2] ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .I5(\dc_bias[3]_i_9_n_0 ),
        .O(\dc_bias[3]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'h6666AA6656556656)) 
    \dc_bias[3]_i_7__0 
       (.I0(\dc_bias[3]_i_16__0_n_0 ),
        .I1(\dc_bias[3]_i_17__0_n_0 ),
        .I2(\dc_bias[3]_i_18__1_n_0 ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .I4(\e[9]_i_13__0_n_0 ),
        .I5(\dc_bias[3]_i_19__0_n_0 ),
        .O(\dc_bias[3]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'h56555555AA6A6A56)) 
    \dc_bias[3]_i_8__0 
       (.I0(\dc_bias[3]_i_20__0_n_0 ),
        .I1(\dc_bias[1]_i_6_n_0 ),
        .I2(\dc_bias[3]_i_21_n_0 ),
        .I3(\dc_bias[3]_i_22__0_n_0 ),
        .I4(\dc_bias[1]_i_4_n_0 ),
        .I5(\dc_bias[2]_i_6__0_n_0 ),
        .O(\dc_bias[3]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF6996)) 
    \dc_bias[3]_i_9 
       (.I0(\dc_bias[3]_i_23__0_n_0 ),
        .I1(\e[9]_i_9_n_0 ),
        .I2(\e[9]_i_8__0_n_0 ),
        .I3(\e[9]_i_7__0_n_0 ),
        .I4(\e[9]_i_4__0_n_0 ),
        .I5(\dc_bias[3]_i_14_n_0 ),
        .O(\dc_bias[3]_i_9_n_0 ));
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
        .S(\e[9]_i_3__0_n_0 ));
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
        .I1(\dc_bias[2]_i_3__0_n_0 ),
        .O(\dc_bias_reg[2]_i_1__0_n_0 ),
        .S(\e[9]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias[3]_i_1_n_0 ),
        .Q(p_1_in),
        .R(blank));
  MUXF7 \dc_bias_reg[3]_i_2 
       (.I0(\dc_bias[3]_i_7__0_n_0 ),
        .I1(\dc_bias[3]_i_8__0_n_0 ),
        .O(\dc_bias_reg[3]_i_2_n_0 ),
        .S(\e[9]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B88B8B8BB88B)) 
    \e[0]_i_1__0 
       (.I0(\e[0]_i_2_n_0 ),
        .I1(blank),
        .I2(red_p[0]),
        .I3(\e[9]_i_4__0_n_0 ),
        .I4(\e[9]_i_3__0_n_0 ),
        .I5(\e[9]_i_2__0_n_0 ),
        .O(\e[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF8800D200)) 
    \e[0]_i_2 
       (.I0(TERC4Character2[2]),
        .I1(TERC4Character2[3]),
        .I2(TERC4Character2[0]),
        .I3(isTERC4Region_0),
        .I4(TERC4Character2[1]),
        .I5(\e[1]_i_4__0_n_0 ),
        .O(\e[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h609F9F60)) 
    \e[1]_i_2__0 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(\e[9]_i_2__0_n_0 ),
        .I2(\e[9]_i_3__0_n_0 ),
        .I3(red_p[1]),
        .I4(red_p[0]),
        .O(\e[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC8404888)) 
    \e[1]_i_3__0 
       (.I0(TERC4Character2[0]),
        .I1(isTERC4Region_0),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[3]),
        .I5(\e[1]_i_4__0_n_0 ),
        .O(\e[1]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h8B88)) 
    \e[1]_i_4__0 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[1]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h9696966969699669)) 
    \e[2]_i_2 
       (.I0(red_p[1]),
        .I1(red_p[0]),
        .I2(red_p[2]),
        .I3(\e[9]_i_4__0_n_0 ),
        .I4(\e[9]_i_3__0_n_0 ),
        .I5(\e[9]_i_2__0_n_0 ),
        .O(\e[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF5300B900)) 
    \e[2]_i_3 
       (.I0(TERC4Character2[2]),
        .I1(TERC4Character2[0]),
        .I2(TERC4Character2[1]),
        .I3(isTERC4Region_0),
        .I4(TERC4Character2[3]),
        .I5(\e[6]_i_4_n_0 ),
        .O(\e[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9F60609F609F9F60)) 
    \e[3]_i_2__0 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(\e[9]_i_2__0_n_0 ),
        .I2(\e[9]_i_3__0_n_0 ),
        .I3(red_p[3]),
        .I4(red_p[2]),
        .I5(\e[9]_i_14__0_n_0 ),
        .O(\e[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF56002B00)) 
    \e[3]_i_3 
       (.I0(TERC4Character2[3]),
        .I1(TERC4Character2[0]),
        .I2(TERC4Character2[1]),
        .I3(isTERC4Region_0),
        .I4(TERC4Character2[2]),
        .I5(\e[7]_i_5_n_0 ),
        .O(\e[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hABFB0151FEAE5404)) 
    \e[4]_i_1__0 
       (.I0(blank),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(\e[9]_i_3__0_n_0 ),
        .I3(\e[9]_i_2__0_n_0 ),
        .I4(\e[4]_i_2__1_n_0 ),
        .I5(\e[4]_i_3__0_n_0 ),
        .O(\e[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h72190000FFFFFFFF)) 
    \e[4]_i_2__1 
       (.I0(TERC4Character2[3]),
        .I1(TERC4Character2[1]),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[0]),
        .I4(isTERC4Region_0),
        .I5(\e[8]_i_3_n_0 ),
        .O(\e[4]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[4]_i_3__0 
       (.I0(red_p[4]),
        .I1(red_p[1]),
        .I2(red_p[0]),
        .I3(red_p[2]),
        .I4(red_p[3]),
        .O(\e[4]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hAA888AA88AA8AA88)) 
    \e[5]_i_1__0 
       (.I0(\e[5]_i_2__1_n_0 ),
        .I1(blank),
        .I2(\e[9]_i_3__0_n_0 ),
        .I3(\e[5]_i_3__1_n_0 ),
        .I4(\e[9]_i_2__0_n_0 ),
        .I5(\e[9]_i_4__0_n_0 ),
        .O(\e[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFBBBFBFFFBBBFBBB)) 
    \e[5]_i_2__1 
       (.I0(\e[5]_i_4_n_0 ),
        .I1(blank),
        .I2(guardBandType),
        .I3(guardBandEnable),
        .I4(isTERC4Region),
        .I5(controlChannel2Red[0]),
        .O(\e[5]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \e[5]_i_3__1 
       (.I0(red_p[5]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[0]),
        .I4(red_p[1]),
        .I5(red_p[4]),
        .O(\e[5]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'h0404400040440440)) 
    \e[5]_i_4 
       (.I0(guardBandEnable),
        .I1(isTERC4Region),
        .I2(TERC4Character2[1]),
        .I3(TERC4Character2[2]),
        .I4(TERC4Character2[0]),
        .I5(TERC4Character2[3]),
        .O(\e[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6969699696966996)) 
    \e[6]_i_2__1 
       (.I0(\e[4]_i_3__0_n_0 ),
        .I1(red_p[5]),
        .I2(red_p[6]),
        .I3(\e[9]_i_4__0_n_0 ),
        .I4(\e[9]_i_3__0_n_0 ),
        .I5(\e[9]_i_2__0_n_0 ),
        .O(\e[6]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEAAABAEABAFAEA)) 
    \e[6]_i_3 
       (.I0(\e[6]_i_4_n_0 ),
        .I1(TERC4Character2[0]),
        .I2(isTERC4Region_0),
        .I3(TERC4Character2[1]),
        .I4(TERC4Character2[3]),
        .I5(TERC4Character2[2]),
        .O(\e[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h4447)) 
    \e[6]_i_4 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h609F9F60)) 
    \e[7]_i_2__0 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(\e[9]_i_2__0_n_0 ),
        .I2(\e[9]_i_3__0_n_0 ),
        .I3(red_p[7]),
        .I4(\e[7]_i_4__0_n_0 ),
        .O(\e[7]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hF9F4F0F0FFF5F0F0)) 
    \e[7]_i_3__0 
       (.I0(TERC4Character2[0]),
        .I1(TERC4Character2[3]),
        .I2(\e[7]_i_5_n_0 ),
        .I3(TERC4Character2[1]),
        .I4(isTERC4Region_0),
        .I5(TERC4Character2[2]),
        .O(\e[7]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[7]_i_4__0 
       (.I0(red_p[6]),
        .I1(red_p[5]),
        .I2(\e[4]_i_3__0_n_0 ),
        .O(\e[7]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h4744)) 
    \e[7]_i_5 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel2Red[0]),
        .O(\e[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \e[7]_i_6 
       (.I0(isTERC4Region),
        .I1(guardBandEnable),
        .O(isTERC4Region_0));
  LUT6 #(
    .INIT(64'h222222E2EEEEEEEE)) 
    \e[8]_i_1 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(blank),
        .I2(isTERC4Region),
        .I3(guardBandEnable),
        .I4(\e[8]_i_2__0_n_0 ),
        .I5(\e[8]_i_3_n_0 ),
        .O(\e[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB09F)) 
    \e[8]_i_2__0 
       (.I0(TERC4Character2[0]),
        .I1(TERC4Character2[1]),
        .I2(TERC4Character2[3]),
        .I3(TERC4Character2[2]),
        .O(\e[8]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0FEE)) 
    \e[8]_i_3 
       (.I0(isTERC4Region),
        .I1(controlChannel2Red[0]),
        .I2(guardBandType),
        .I3(guardBandEnable),
        .O(\e[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_10__1 
       (.I0(red_p[5]),
        .I1(red_p[7]),
        .I2(red_p[0]),
        .O(\e[9]_i_10__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_11 
       (.I0(red_p[3]),
        .I1(red_p[0]),
        .I2(red_p[1]),
        .O(\e[9]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h60FFFF9F006060FF)) 
    \e[9]_i_12__0 
       (.I0(red_p[3]),
        .I1(\e[9]_i_14__0_n_0 ),
        .I2(\e[9]_i_10__1_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_8__0_n_0 ),
        .I5(\e[9]_i_7__0_n_0 ),
        .O(\e[9]_i_12__0_n_0 ));
  LUT6 #(
    .INIT(64'h9F60609F609F9F60)) 
    \e[9]_i_13__0 
       (.I0(red_p[3]),
        .I1(\e[9]_i_14__0_n_0 ),
        .I2(\e[9]_i_10__1_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_8__0_n_0 ),
        .I5(\e[9]_i_7__0_n_0 ),
        .O(\e[9]_i_13__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \e[9]_i_14__0 
       (.I0(red_p[1]),
        .I1(red_p[0]),
        .O(\e[9]_i_14__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \e[9]_i_15 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(p_1_in),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .O(\e[9]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_16__0 
       (.I0(red_p[4]),
        .I1(red_p[6]),
        .I2(red_p[5]),
        .O(\e[9]_i_16__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \e[9]_i_17__0 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .O(\e[9]_i_17__0_n_0 ));
  LUT6 #(
    .INIT(64'h171717FF17FFFFFF)) 
    \e[9]_i_18__0 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[5]),
        .I4(red_p[6]),
        .I5(red_p[4]),
        .O(\e[9]_i_18__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000001700171717)) 
    \e[9]_i_19 
       (.I0(red_p[1]),
        .I1(red_p[3]),
        .I2(red_p[2]),
        .I3(red_p[5]),
        .I4(red_p[6]),
        .I5(red_p[4]),
        .O(\e[9]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0047)) 
    \e[9]_i_1__0 
       (.I0(\e[9]_i_2__0_n_0 ),
        .I1(\e[9]_i_3__0_n_0 ),
        .I2(\e[9]_i_4__0_n_0 ),
        .I3(blank),
        .I4(\e[9]_i_5_n_0 ),
        .I5(\e[9]_i_6__0_n_0 ),
        .O(\e[9]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h9AAA599A599A599A)) 
    \e[9]_i_2__0 
       (.I0(p_1_in),
        .I1(\e[9]_i_7__0_n_0 ),
        .I2(\e[9]_i_8__0_n_0 ),
        .I3(\e[9]_i_9_n_0 ),
        .I4(\e[9]_i_10__1_n_0 ),
        .I5(\e[9]_i_11_n_0 ),
        .O(\e[9]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FDDFDFFD)) 
    \e[9]_i_3__0 
       (.I0(\e[9]_i_12__0_n_0 ),
        .I1(\e[9]_i_13__0_n_0 ),
        .I2(\e[9]_i_10__1_n_0 ),
        .I3(red_p[3]),
        .I4(\e[9]_i_14__0_n_0 ),
        .I5(\e[9]_i_15_n_0 ),
        .O(\e[9]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFF001700FF011700)) 
    \e[9]_i_4__0 
       (.I0(red_p[7]),
        .I1(\e[9]_i_16__0_n_0 ),
        .I2(\e[9]_i_17__0_n_0 ),
        .I3(\e[9]_i_18__0_n_0 ),
        .I4(\e[9]_i_19_n_0 ),
        .I5(red_p[0]),
        .O(\e[9]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h5300500050005300)) 
    \e[9]_i_5 
       (.I0(guardBandType),
        .I1(isTERC4Region),
        .I2(guardBandEnable),
        .I3(blank),
        .I4(controlChannel2Red[0]),
        .I5(controlChannel2Red[1]),
        .O(\e[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8808800800088808)) 
    \e[9]_i_6__0 
       (.I0(blank),
        .I1(isTERC4Region_0),
        .I2(TERC4Character2[2]),
        .I3(TERC4Character2[3]),
        .I4(TERC4Character2[1]),
        .I5(TERC4Character2[0]),
        .O(\e[9]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h18E7)) 
    \e[9]_i_7__0 
       (.I0(\e[9]_i_4__0_n_0 ),
        .I1(red_p[5]),
        .I2(red_p[6]),
        .I3(\e[4]_i_3__0_n_0 ),
        .O(\e[9]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hD22D4BB4)) 
    \e[9]_i_8__0 
       (.I0(red_p[2]),
        .I1(red_p[3]),
        .I2(red_p[0]),
        .I3(red_p[1]),
        .I4(\e[9]_i_4__0_n_0 ),
        .O(\e[9]_i_8__0_n_0 ));
  LUT6 #(
    .INIT(64'h35C5535CC5355C53)) 
    \e[9]_i_9 
       (.I0(red_p[0]),
        .I1(\e[9]_i_4__0_n_0 ),
        .I2(red_p[7]),
        .I3(\e[4]_i_3__0_n_0 ),
        .I4(red_p[5]),
        .I5(red_p[6]),
        .O(\e[9]_i_9_n_0 ));
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
        .D(\e_reg[2]_i_1_n_0 ),
        .Q(EncodedR[2]),
        .R(1'b0));
  MUXF7 \e_reg[2]_i_1 
       (.I0(\e[2]_i_2_n_0 ),
        .I1(\e[2]_i_3_n_0 ),
        .O(\e_reg[2]_i_1_n_0 ),
        .S(blank));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[3]_i_1_n_0 ),
        .Q(EncodedR[3]),
        .R(1'b0));
  MUXF7 \e_reg[3]_i_1 
       (.I0(\e[3]_i_2__0_n_0 ),
        .I1(\e[3]_i_3_n_0 ),
        .O(\e_reg[3]_i_1_n_0 ),
        .S(blank));
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
        .D(\e[5]_i_1__0_n_0 ),
        .Q(EncodedR[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[6]_i_1_n_0 ),
        .Q(EncodedR[6]),
        .R(1'b0));
  MUXF7 \e_reg[6]_i_1 
       (.I0(\e[6]_i_2__1_n_0 ),
        .I1(\e[6]_i_3_n_0 ),
        .O(\e_reg[6]_i_1_n_0 ),
        .S(blank));
  FDRE #(
    .INIT(1'b0)) 
    \e_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[7]_i_1_n_0 ),
        .Q(EncodedR[7]),
        .R(1'b0));
  MUXF7 \e_reg[7]_i_1 
       (.I0(\e[7]_i_2__0_n_0 ),
        .I1(\e[7]_i_3__0_n_0 ),
        .O(\e_reg[7]_i_1_n_0 ),
        .S(blank));
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
module MainDesign_dvid_0_0_TDMS_encoder__parameterized1
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
  wire \dc_bias[0]_i_2__0_n_0 ;
  wire \dc_bias[0]_i_3__0_n_0 ;
  wire \dc_bias[0]_i_4_n_0 ;
  wire \dc_bias[0]_i_5_n_0 ;
  wire \dc_bias[1]_i_2_n_0 ;
  wire \dc_bias[1]_i_3_n_0 ;
  wire \dc_bias[1]_i_4__1_n_0 ;
  wire \dc_bias[1]_i_5_n_0 ;
  wire \dc_bias[1]_i_6__0_n_0 ;
  wire \dc_bias[1]_i_7_n_0 ;
  wire \dc_bias[2]_i_10_n_0 ;
  wire \dc_bias[2]_i_11__1_n_0 ;
  wire \dc_bias[2]_i_2_n_0 ;
  wire \dc_bias[2]_i_3_n_0 ;
  wire \dc_bias[2]_i_4_n_0 ;
  wire \dc_bias[2]_i_5__0_n_0 ;
  wire \dc_bias[2]_i_6_n_0 ;
  wire \dc_bias[2]_i_7_n_0 ;
  wire \dc_bias[2]_i_8__1_n_0 ;
  wire \dc_bias[2]_i_9_n_0 ;
  wire \dc_bias[3]_i_10_n_0 ;
  wire \dc_bias[3]_i_11_n_0 ;
  wire \dc_bias[3]_i_12_n_0 ;
  wire \dc_bias[3]_i_13_n_0 ;
  wire \dc_bias[3]_i_14__1_n_0 ;
  wire \dc_bias[3]_i_15__0_n_0 ;
  wire \dc_bias[3]_i_16_n_0 ;
  wire \dc_bias[3]_i_17_n_0 ;
  wire \dc_bias[3]_i_18_n_0 ;
  wire \dc_bias[3]_i_19_n_0 ;
  wire \dc_bias[3]_i_20_n_0 ;
  wire \dc_bias[3]_i_21__0_n_0 ;
  wire \dc_bias[3]_i_22_n_0 ;
  wire \dc_bias[3]_i_23_n_0 ;
  wire \dc_bias[3]_i_2_n_0 ;
  wire \dc_bias[3]_i_3_n_0 ;
  wire \dc_bias[3]_i_4_n_0 ;
  wire \dc_bias[3]_i_5_n_0 ;
  wire \dc_bias[3]_i_6_n_0 ;
  wire \dc_bias[3]_i_7_n_0 ;
  wire \dc_bias[3]_i_8_n_0 ;
  wire \dc_bias[3]_i_9__0_n_0 ;
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
  wire \e[2]_i_2__0_n_0 ;
  wire \e[2]_i_3__1_n_0 ;
  wire \e[3]_i_1_n_0 ;
  wire \e[3]_i_2_n_0 ;
  wire \e[3]_i_3__0_n_0 ;
  wire \e[4]_i_1_n_0 ;
  wire \e[4]_i_2_n_0 ;
  wire \e[4]_i_3_n_0 ;
  wire \e[5]_i_1_n_0 ;
  wire \e[5]_i_2_n_0 ;
  wire \e[5]_i_3__0_n_0 ;
  wire \e[6]_i_1_n_0 ;
  wire \e[6]_i_2__0_n_0 ;
  wire \e[6]_i_3__1_n_0 ;
  wire \e[6]_i_4__1_n_0 ;
  wire \e[7]_i_2_n_0 ;
  wire \e[7]_i_3_n_0 ;
  wire \e[7]_i_4_n_0 ;
  wire \e[7]_i_5__1_n_0 ;
  wire \e[7]_i_6__0_n_0 ;
  wire \e[8]_i_1__1_n_0 ;
  wire \e[8]_i_2__1_n_0 ;
  wire \e[9]_i_10_n_0 ;
  wire \e[9]_i_11__1_n_0 ;
  wire \e[9]_i_12_n_0 ;
  wire \e[9]_i_13_n_0 ;
  wire \e[9]_i_14_n_0 ;
  wire \e[9]_i_15__1_n_0 ;
  wire \e[9]_i_16_n_0 ;
  wire \e[9]_i_17_n_0 ;
  wire \e[9]_i_18_n_0 ;
  wire \e[9]_i_2_n_0 ;
  wire \e[9]_i_3_n_0 ;
  wire \e[9]_i_4_n_0 ;
  wire \e[9]_i_5__1_n_0 ;
  wire \e[9]_i_6__1_n_0 ;
  wire \e[9]_i_7_n_0 ;
  wire \e[9]_i_8_n_0 ;
  wire \e[9]_i_9__1_n_0 ;
  wire [7:0]green_p;
  wire guardBandEnable;
  wire isTERC4Region;
  wire p_1_in;

  LUT6 #(
    .INIT(64'h6996FFFF69960000)) 
    \dc_bias[0]_i_1 
       (.I0(\e[9]_i_6__1_n_0 ),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\dc_bias[0]_i_2__0_n_0 ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\e[9]_i_4_n_0 ),
        .I5(\dc_bias[0]_i_3__0_n_0 ),
        .O(\dc_bias[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dc_bias[0]_i_2__0 
       (.I0(green_p[3]),
        .I1(green_p[1]),
        .I2(\e[7]_i_3_n_0 ),
        .I3(\e[4]_i_2_n_0 ),
        .I4(green_p[6]),
        .O(\dc_bias[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h9666669666969666)) 
    \dc_bias[0]_i_3__0 
       (.I0(\dc_bias[0]_i_4_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(green_p[0]),
        .I4(green_p[7]),
        .I5(\dc_bias[0]_i_5_n_0 ),
        .O(\dc_bias[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \dc_bias[0]_i_4 
       (.I0(\dc_bias[0]_i_2__0_n_0 ),
        .I1(\e[9]_i_3_n_0 ),
        .I2(green_p[2]),
        .O(\dc_bias[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[0]_i_5 
       (.I0(green_p[5]),
        .I1(green_p[2]),
        .I2(green_p[0]),
        .I3(green_p[1]),
        .I4(green_p[3]),
        .O(\dc_bias[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[1]_i_2 
       (.I0(\dc_bias[2]_i_8__1_n_0 ),
        .I1(\dc_bias[2]_i_6_n_0 ),
        .I2(\dc_bias[2]_i_7_n_0 ),
        .I3(\dc_bias[2]_i_4_n_0 ),
        .I4(\dc_bias[2]_i_5__0_n_0 ),
        .O(\dc_bias[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9556FFFF95560000)) 
    \dc_bias[1]_i_3 
       (.I0(\dc_bias[1]_i_4__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\dc_bias[0]_i_2__0_n_0 ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\e[9]_i_6__1_n_0 ),
        .I5(\dc_bias[1]_i_5_n_0 ),
        .O(\dc_bias[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[1]_i_4__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_12_n_0 ),
        .O(\dc_bias[1]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h596565A665A6A69A)) 
    \dc_bias[1]_i_5 
       (.I0(\dc_bias[3]_i_16_n_0 ),
        .I1(\dc_bias[0]_i_5_n_0 ),
        .I2(\dc_bias[1]_i_6__0_n_0 ),
        .I3(green_p[7]),
        .I4(\e[2]_i_2__0_n_0 ),
        .I5(\dc_bias[1]_i_7_n_0 ),
        .O(\dc_bias[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dc_bias[1]_i_6__0 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \dc_bias[1]_i_7 
       (.I0(green_p[0]),
        .I1(green_p[1]),
        .I2(\e[9]_i_3_n_0 ),
        .O(\dc_bias[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h5AA6A6A5)) 
    \dc_bias[2]_i_10 
       (.I0(\dc_bias[3]_i_20_n_0 ),
        .I1(\dc_bias[3]_i_19_n_0 ),
        .I2(\dc_bias[3]_i_18_n_0 ),
        .I3(\dc_bias[3]_i_17_n_0 ),
        .I4(\dc_bias[3]_i_16_n_0 ),
        .O(\dc_bias[2]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[2]_i_11__1 
       (.I0(green_p[0]),
        .I1(green_p[7]),
        .O(\dc_bias[2]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'h18718E18E78E71E7)) 
    \dc_bias[2]_i_2 
       (.I0(\dc_bias[2]_i_4_n_0 ),
        .I1(\dc_bias[2]_i_5__0_n_0 ),
        .I2(\dc_bias[2]_i_6_n_0 ),
        .I3(\dc_bias[2]_i_7_n_0 ),
        .I4(\dc_bias[2]_i_8__1_n_0 ),
        .I5(\dc_bias[2]_i_9_n_0 ),
        .O(\dc_bias[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669FFFF96690000)) 
    \dc_bias[2]_i_3 
       (.I0(\e[9]_i_11__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias[3]_i_10_n_0 ),
        .I3(\dc_bias[3]_i_9__0_n_0 ),
        .I4(\e[9]_i_6__1_n_0 ),
        .I5(\dc_bias[2]_i_10_n_0 ),
        .O(\dc_bias[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h090F9F0F9F0F090F)) 
    \dc_bias[2]_i_4 
       (.I0(green_p[7]),
        .I1(green_p[0]),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\e[3]_i_2_n_0 ),
        .I5(green_p[5]),
        .O(\dc_bias[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5FF3F5F3F5F35FF3)) 
    \dc_bias[2]_i_5__0 
       (.I0(green_p[2]),
        .I1(\dc_bias[0]_i_2__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\dc_bias[2]_i_11__1_n_0 ),
        .I5(\dc_bias[0]_i_5_n_0 ),
        .O(\dc_bias[2]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h2282)) 
    \dc_bias[2]_i_6 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[3]_i_2_n_0 ),
        .I2(green_p[4]),
        .I3(green_p[5]),
        .O(\dc_bias[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h95A595559AAA9A5A)) 
    \dc_bias[2]_i_7 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(green_p[0]),
        .I2(\e[9]_i_3_n_0 ),
        .I3(green_p[7]),
        .I4(\e[6]_i_2__0_n_0 ),
        .I5(\e[9]_i_12_n_0 ),
        .O(\dc_bias[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \dc_bias[2]_i_8__1 
       (.I0(green_p[2]),
        .I1(green_p[1]),
        .I2(green_p[0]),
        .I3(\e[9]_i_3_n_0 ),
        .O(\dc_bias[2]_i_8__1_n_0 ));
  LUT6 #(
    .INIT(64'hC095C0993F6A3F66)) 
    \dc_bias[2]_i_9 
       (.I0(\e[9]_i_11__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_13_n_0 ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\e[9]_i_12_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hF9999990)) 
    \dc_bias[3]_i_10 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_12_n_0 ),
        .I2(\dc_bias[0]_i_2__0_n_0 ),
        .I3(\e[9]_i_3_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h95559555AA95AAA9)) 
    \dc_bias[3]_i_11 
       (.I0(\dc_bias[3]_i_15__0_n_0 ),
        .I1(\dc_bias[3]_i_16_n_0 ),
        .I2(\dc_bias[3]_i_17_n_0 ),
        .I3(\dc_bias[3]_i_18_n_0 ),
        .I4(\dc_bias[3]_i_19_n_0 ),
        .I5(\dc_bias[3]_i_20_n_0 ),
        .O(\dc_bias[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF6996)) 
    \dc_bias[3]_i_12 
       (.I0(\dc_bias[3]_i_14__1_n_0 ),
        .I1(\e[9]_i_16_n_0 ),
        .I2(\e[9]_i_17_n_0 ),
        .I3(\e[9]_i_18_n_0 ),
        .I4(\e[9]_i_3_n_0 ),
        .I5(\dc_bias[3]_i_13_n_0 ),
        .O(\dc_bias[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h808C8C808C80808C)) 
    \dc_bias[3]_i_13 
       (.I0(green_p[0]),
        .I1(\e[9]_i_3_n_0 ),
        .I2(green_p[7]),
        .I3(green_p[5]),
        .I4(green_p[6]),
        .I5(\e[4]_i_2_n_0 ),
        .O(\dc_bias[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h8412128412848412)) 
    \dc_bias[3]_i_14__1 
       (.I0(green_p[3]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .I3(\e[7]_i_3_n_0 ),
        .I4(\e[4]_i_2_n_0 ),
        .I5(green_p[6]),
        .O(\dc_bias[3]_i_14__1_n_0 ));
  LUT6 #(
    .INIT(64'hA9AAAAAA559595A9)) 
    \dc_bias[3]_i_15__0 
       (.I0(p_1_in),
        .I1(\dc_bias[3]_i_21__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[3]_i_22_n_0 ),
        .I4(\dc_bias[3]_i_23_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_15__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h96666999)) 
    \dc_bias[3]_i_16 
       (.I0(\dc_bias[3]_i_22_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(green_p[0]),
        .I4(\dc_bias[3]_i_23_n_0 ),
        .O(\dc_bias[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hBDDB)) 
    \dc_bias[3]_i_17 
       (.I0(green_p[2]),
        .I1(\e[9]_i_3_n_0 ),
        .I2(green_p[1]),
        .I3(green_p[0]),
        .O(\dc_bias[3]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000990)) 
    \dc_bias[3]_i_18 
       (.I0(\e[2]_i_2__0_n_0 ),
        .I1(\dc_bias[1]_i_7_n_0 ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(green_p[0]),
        .I4(green_p[7]),
        .I5(\dc_bias[0]_i_5_n_0 ),
        .O(\dc_bias[3]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h8200EB82EB828200)) 
    \dc_bias[3]_i_19 
       (.I0(\dc_bias[0]_i_5_n_0 ),
        .I1(green_p[0]),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(green_p[7]),
        .I4(\e[2]_i_2__0_n_0 ),
        .I5(\dc_bias[1]_i_7_n_0 ),
        .O(\dc_bias[3]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h177E7EE8E8818117)) 
    \dc_bias[3]_i_2 
       (.I0(\dc_bias[3]_i_4_n_0 ),
        .I1(\dc_bias[3]_i_5_n_0 ),
        .I2(\dc_bias[3]_i_6_n_0 ),
        .I3(\dc_bias_reg_n_0_[2] ),
        .I4(\dc_bias[3]_i_7_n_0 ),
        .I5(\dc_bias[3]_i_8_n_0 ),
        .O(\dc_bias[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8EE7E7E771181818)) 
    \dc_bias[3]_i_20 
       (.I0(\dc_bias[3]_i_22_n_0 ),
        .I1(\dc_bias[3]_i_23_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(green_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_21__0 
       (.I0(green_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_21__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h95A9)) 
    \dc_bias[3]_i_22 
       (.I0(\e[3]_i_2_n_0 ),
        .I1(\e[9]_i_3_n_0 ),
        .I2(green_p[5]),
        .I3(green_p[4]),
        .O(\dc_bias[3]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h71171771)) 
    \dc_bias[3]_i_23 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(green_p[7]),
        .I2(green_p[5]),
        .I3(green_p[6]),
        .I4(\e[4]_i_2_n_0 ),
        .O(\dc_bias[3]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h422B422B0000FFFF)) 
    \dc_bias[3]_i_3 
       (.I0(\dc_bias[3]_i_9__0_n_0 ),
        .I1(\dc_bias[3]_i_10_n_0 ),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\e[9]_i_11__1_n_0 ),
        .I4(\dc_bias[3]_i_11_n_0 ),
        .I5(\e[9]_i_6__1_n_0 ),
        .O(\dc_bias[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000096699669FFFF)) 
    \dc_bias[3]_i_4 
       (.I0(\dc_bias[3]_i_12_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[2]_i_6_n_0 ),
        .I3(\dc_bias[2]_i_8__1_n_0 ),
        .I4(\dc_bias[2]_i_5__0_n_0 ),
        .I5(\dc_bias[2]_i_4_n_0 ),
        .O(\dc_bias[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAFEFFAB00A8AA02)) 
    \dc_bias[3]_i_5 
       (.I0(\dc_bias[2]_i_6_n_0 ),
        .I1(\e[9]_i_12_n_0 ),
        .I2(\e[9]_i_3_n_0 ),
        .I3(\dc_bias[3]_i_13_n_0 ),
        .I4(\dc_bias_reg_n_0_[1] ),
        .I5(\dc_bias[2]_i_8__1_n_0 ),
        .O(\dc_bias[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFBEFBAFB)) 
    \dc_bias[3]_i_6 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[9]_i_18_n_0 ),
        .I2(\e[9]_i_17_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\dc_bias[3]_i_14__1_n_0 ),
        .O(\dc_bias[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h80A080008AAA8A0A)) 
    \dc_bias[3]_i_7 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(green_p[0]),
        .I2(\e[9]_i_3_n_0 ),
        .I3(green_p[7]),
        .I4(\e[6]_i_2__0_n_0 ),
        .I5(\e[9]_i_12_n_0 ),
        .O(\dc_bias[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \dc_bias[3]_i_8 
       (.I0(p_1_in),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[9]_i_14_n_0 ),
        .O(\dc_bias[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \dc_bias[3]_i_9__0 
       (.I0(\e[9]_i_12_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .O(\dc_bias[3]_i_9__0_n_0 ));
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
        .S(\e[9]_i_4_n_0 ));
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
        .S(\e[9]_i_4_n_0 ));
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
        .S(\e[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000059A9)) 
    \e[0]_i_1 
       (.I0(green_p[0]),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_6__1_n_0 ),
        .I4(blank),
        .I5(\e[0]_i_2__1_n_0 ),
        .O(\e[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEBAABBAAAAAAAAA)) 
    \e[0]_i_2__1 
       (.I0(\e[7]_i_6__0_n_0 ),
        .I1(TERC4Character1[1]),
        .I2(TERC4Character1[0]),
        .I3(TERC4Character1[2]),
        .I4(TERC4Character1[3]),
        .I5(\e[7]_i_5__1_n_0 ),
        .O(\e[0]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF14415050)) 
    \e[1]_i_1 
       (.I0(blank),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[1]_i_2_n_0 ),
        .I3(\e[9]_i_6__1_n_0 ),
        .I4(\e[9]_i_4_n_0 ),
        .I5(\e[1]_i_3__1_n_0 ),
        .O(\e[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \e[1]_i_2 
       (.I0(green_p[1]),
        .I1(green_p[0]),
        .O(\e[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFC8404888)) 
    \e[1]_i_3__1 
       (.I0(TERC4Character1[0]),
        .I1(\e[7]_i_5__1_n_0 ),
        .I2(TERC4Character1[2]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[3]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[1]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000A656)) 
    \e[2]_i_1 
       (.I0(\e[2]_i_2__0_n_0 ),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_6__1_n_0 ),
        .I4(blank),
        .I5(\e[2]_i_3__1_n_0 ),
        .O(\e[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[2]_i_2__0 
       (.I0(green_p[2]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .O(\e[2]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF4700AD00)) 
    \e[2]_i_3__1 
       (.I0(TERC4Character1[2]),
        .I1(TERC4Character1[1]),
        .I2(TERC4Character1[0]),
        .I3(\e[7]_i_5__1_n_0 ),
        .I4(TERC4Character1[3]),
        .I5(\e[6]_i_4__1_n_0 ),
        .O(\e[2]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000906F)) 
    \e[3]_i_1 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[9]_i_6__1_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[3]_i_2_n_0 ),
        .I4(blank),
        .I5(\e[3]_i_3__0_n_0 ),
        .O(\e[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \e[3]_i_2 
       (.I0(green_p[3]),
        .I1(green_p[1]),
        .I2(green_p[0]),
        .I3(green_p[2]),
        .O(\e[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF044C8884)) 
    \e[3]_i_3__0 
       (.I0(TERC4Character1[2]),
        .I1(\e[7]_i_5__1_n_0 ),
        .I2(TERC4Character1[0]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[3]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[3]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000A656)) 
    \e[4]_i_1 
       (.I0(\e[4]_i_2_n_0 ),
        .I1(\e[9]_i_3_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[9]_i_6__1_n_0 ),
        .I4(blank),
        .I5(\e[4]_i_3_n_0 ),
        .O(\e[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[4]_i_2 
       (.I0(green_p[4]),
        .I1(green_p[2]),
        .I2(green_p[0]),
        .I3(green_p[1]),
        .I4(green_p[3]),
        .O(\e[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF088C4084)) 
    \e[4]_i_3 
       (.I0(TERC4Character1[0]),
        .I1(\e[7]_i_5__1_n_0 ),
        .I2(TERC4Character1[3]),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[2]),
        .I5(\e[6]_i_4__1_n_0 ),
        .O(\e[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000906F)) 
    \e[5]_i_1 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[9]_i_6__1_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[5]_i_2_n_0 ),
        .I4(blank),
        .I5(\e[5]_i_3__0_n_0 ),
        .O(\e[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \e[5]_i_2 
       (.I0(green_p[5]),
        .I1(green_p[3]),
        .I2(green_p[1]),
        .I3(green_p[0]),
        .I4(green_p[2]),
        .I5(green_p[4]),
        .O(\e[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF44848C40)) 
    \e[5]_i_3__0 
       (.I0(TERC4Character1[3]),
        .I1(\e[7]_i_5__1_n_0 ),
        .I2(TERC4Character1[2]),
        .I3(TERC4Character1[0]),
        .I4(TERC4Character1[1]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[5]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF14441411)) 
    \e[6]_i_1 
       (.I0(blank),
        .I1(\e[6]_i_2__0_n_0 ),
        .I2(\e[9]_i_6__1_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(\e[9]_i_3_n_0 ),
        .I5(\e[6]_i_3__1_n_0 ),
        .O(\e[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[6]_i_2__0 
       (.I0(\e[4]_i_2_n_0 ),
        .I1(green_p[6]),
        .I2(green_p[5]),
        .O(\e[6]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFAEAAABAEABAFAEA)) 
    \e[6]_i_3__1 
       (.I0(\e[6]_i_4__1_n_0 ),
        .I1(TERC4Character1[0]),
        .I2(\e[7]_i_5__1_n_0 ),
        .I3(TERC4Character1[1]),
        .I4(TERC4Character1[3]),
        .I5(TERC4Character1[2]),
        .O(\e[6]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
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
    .INIT(64'hFFFFFFFF00006F90)) 
    \e[7]_i_2 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(\e[9]_i_6__1_n_0 ),
        .I2(\e[9]_i_4_n_0 ),
        .I3(\e[7]_i_3_n_0 ),
        .I4(blank),
        .I5(\e[7]_i_4_n_0 ),
        .O(\e[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \e[7]_i_3 
       (.I0(green_p[7]),
        .I1(green_p[5]),
        .I2(green_p[6]),
        .I3(\e[4]_i_2_n_0 ),
        .O(\e[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF9F002300)) 
    \e[7]_i_4 
       (.I0(TERC4Character1[3]),
        .I1(TERC4Character1[0]),
        .I2(TERC4Character1[2]),
        .I3(\e[7]_i_5__1_n_0 ),
        .I4(TERC4Character1[1]),
        .I5(\e[7]_i_6__0_n_0 ),
        .O(\e[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \e[7]_i_5__1 
       (.I0(blank),
        .I1(isTERC4Region),
        .O(\e[7]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \e[7]_i_6__0 
       (.I0(controlChannel1Green[0]),
        .I1(isTERC4Region),
        .I2(blank),
        .O(\e[7]_i_6__0_n_0 ));
  LUT6 #(
    .INIT(64'hD1D1FF00D1D10000)) 
    \e[8]_i_1__1 
       (.I0(controlChannel1Green[0]),
        .I1(isTERC4Region),
        .I2(\e[8]_i_2__1_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(blank),
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
       (.I0(green_p[1]),
        .I1(green_p[3]),
        .I2(green_p[2]),
        .I3(green_p[4]),
        .I4(green_p[6]),
        .I5(green_p[5]),
        .O(\e[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h14FF0014FFEB14FF)) 
    \e[9]_i_11__1 
       (.I0(\e[9]_i_15__1_n_0 ),
        .I1(green_p[3]),
        .I2(\e[1]_i_2_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\e[9]_i_17_n_0 ),
        .I5(\e[9]_i_18_n_0 ),
        .O(\e[9]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'hEB1414EB14EBEB14)) 
    \e[9]_i_12 
       (.I0(\e[9]_i_15__1_n_0 ),
        .I1(green_p[3]),
        .I2(\e[1]_i_2_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\e[9]_i_17_n_0 ),
        .I5(\e[9]_i_18_n_0 ),
        .O(\e[9]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \e[9]_i_13 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(p_1_in),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .O(\e[9]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hEB000000FFEBEB00)) 
    \e[9]_i_14 
       (.I0(\e[9]_i_15__1_n_0 ),
        .I1(green_p[3]),
        .I2(\e[1]_i_2_n_0 ),
        .I3(\e[9]_i_16_n_0 ),
        .I4(\e[9]_i_18_n_0 ),
        .I5(\e[9]_i_17_n_0 ),
        .O(\e[9]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_15__1 
       (.I0(green_p[5]),
        .I1(green_p[7]),
        .I2(green_p[0]),
        .O(\e[9]_i_15__1_n_0 ));
  LUT6 #(
    .INIT(64'h600690096FF69FF9)) 
    \e[9]_i_16 
       (.I0(\e[4]_i_2_n_0 ),
        .I1(green_p[6]),
        .I2(green_p[5]),
        .I3(green_p[7]),
        .I4(\e[9]_i_3_n_0 ),
        .I5(green_p[0]),
        .O(\e[9]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h18E7)) 
    \e[9]_i_17 
       (.I0(\e[9]_i_3_n_0 ),
        .I1(green_p[5]),
        .I2(green_p[6]),
        .I3(\e[4]_i_2_n_0 ),
        .O(\e[9]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hC369693C)) 
    \e[9]_i_18 
       (.I0(green_p[2]),
        .I1(green_p[0]),
        .I2(green_p[1]),
        .I3(green_p[3]),
        .I4(\e[9]_i_3_n_0 ),
        .O(\e[9]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hBAAABABB)) 
    \e[9]_i_2 
       (.I0(\e[9]_i_5__1_n_0 ),
        .I1(blank),
        .I2(\e[9]_i_6__1_n_0 ),
        .I3(\e[9]_i_4_n_0 ),
        .I4(\e[9]_i_3_n_0 ),
        .O(\e[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h80080880EEFFAAEE)) 
    \e[9]_i_3 
       (.I0(\e[9]_i_7_n_0 ),
        .I1(\e[9]_i_8_n_0 ),
        .I2(green_p[0]),
        .I3(green_p[7]),
        .I4(\e[9]_i_9__1_n_0 ),
        .I5(\e[9]_i_10_n_0 ),
        .O(\e[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00DF)) 
    \e[9]_i_4 
       (.I0(\e[9]_i_11__1_n_0 ),
        .I1(\e[9]_i_12_n_0 ),
        .I2(\dc_bias[0]_i_2__0_n_0 ),
        .I3(\e[9]_i_13_n_0 ),
        .O(\e[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h5500C300)) 
    \e[9]_i_5__1 
       (.I0(\e[8]_i_2__1_n_0 ),
        .I1(controlChannel1Green[0]),
        .I2(controlChannel1Green[1]),
        .I3(blank),
        .I4(isTERC4Region),
        .O(\e[9]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \e[9]_i_6__1 
       (.I0(p_1_in),
        .I1(\e[9]_i_14_n_0 ),
        .O(\e[9]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000001700171717)) 
    \e[9]_i_7 
       (.I0(green_p[1]),
        .I1(green_p[3]),
        .I2(green_p[2]),
        .I3(green_p[4]),
        .I4(green_p[6]),
        .I5(green_p[5]),
        .O(\e[9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_8 
       (.I0(green_p[1]),
        .I1(green_p[3]),
        .I2(green_p[2]),
        .O(\e[9]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_9__1 
       (.I0(green_p[6]),
        .I1(green_p[5]),
        .I2(green_p[4]),
        .O(\e[9]_i_9__1_n_0 ));
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
module MainDesign_dvid_0_0_TDMS_encoder__parameterized3
   (EncodedB,
    guardBandType,
    guardBandEnable,
    blank,
    blue_p,
    isTERC4Region,
    controlChannel0Blue,
    TERC4Character0,
    \e_reg[6]_0 ,
    clk_pixel_x1);
  output [9:0]EncodedB;
  input guardBandType;
  input guardBandEnable;
  input blank;
  input [7:0]blue_p;
  input isTERC4Region;
  input [1:0]controlChannel0Blue;
  input [3:0]TERC4Character0;
  input \e_reg[6]_0 ;
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
  wire \dc_bias[0]_i_4__1_n_0 ;
  wire \dc_bias[0]_i_5__1_n_0 ;
  wire \dc_bias[1]_i_2__1_n_0 ;
  wire \dc_bias[1]_i_3__1_n_0 ;
  wire \dc_bias[1]_i_4__0_n_0 ;
  wire \dc_bias[1]_i_5__1_n_0 ;
  wire \dc_bias[1]_i_6__1_n_0 ;
  wire \dc_bias[1]_i_7__0_n_0 ;
  wire \dc_bias[1]_i_8__0_n_0 ;
  wire \dc_bias[2]_i_10__0_n_0 ;
  wire \dc_bias[2]_i_11__0_n_0 ;
  wire \dc_bias[2]_i_2__1_n_0 ;
  wire \dc_bias[2]_i_3__1_n_0 ;
  wire \dc_bias[2]_i_4__1_n_0 ;
  wire \dc_bias[2]_i_5__1_n_0 ;
  wire \dc_bias[2]_i_6__1_n_0 ;
  wire \dc_bias[2]_i_7__0_n_0 ;
  wire \dc_bias[2]_i_8__0_n_0 ;
  wire \dc_bias[2]_i_9__1_n_0 ;
  wire \dc_bias[3]_i_10__0_n_0 ;
  wire \dc_bias[3]_i_11__1_n_0 ;
  wire \dc_bias[3]_i_12__1_n_0 ;
  wire \dc_bias[3]_i_13__1_n_0 ;
  wire \dc_bias[3]_i_14__0_n_0 ;
  wire \dc_bias[3]_i_15__1_n_0 ;
  wire \dc_bias[3]_i_16__1_n_0 ;
  wire \dc_bias[3]_i_17__1_n_0 ;
  wire \dc_bias[3]_i_18__0_n_0 ;
  wire \dc_bias[3]_i_19__1_n_0 ;
  wire \dc_bias[3]_i_20__1_n_0 ;
  wire \dc_bias[3]_i_21__1_n_0 ;
  wire \dc_bias[3]_i_2__0_n_0 ;
  wire \dc_bias[3]_i_3__1_n_0 ;
  wire \dc_bias[3]_i_4__1_n_0 ;
  wire \dc_bias[3]_i_5__1_n_0 ;
  wire \dc_bias[3]_i_6__1_n_0 ;
  wire \dc_bias[3]_i_7__1_n_0 ;
  wire \dc_bias[3]_i_8__1_n_0 ;
  wire \dc_bias[3]_i_9__1_n_0 ;
  wire \dc_bias_reg[1]_i_1__1_n_0 ;
  wire \dc_bias_reg[2]_i_1__1_n_0 ;
  wire \dc_bias_reg[3]_i_1__0_n_0 ;
  wire \dc_bias_reg_n_0_[0] ;
  wire \dc_bias_reg_n_0_[1] ;
  wire \dc_bias_reg_n_0_[2] ;
  wire \e[0]_i_1__1_n_0 ;
  wire \e[0]_i_2__0_n_0 ;
  wire \e[0]_i_3_n_0 ;
  wire \e[1]_i_2__1_n_0 ;
  wire \e[1]_i_3_n_0 ;
  wire \e[1]_i_4_n_0 ;
  wire \e[2]_i_2__1_n_0 ;
  wire \e[2]_i_3__0_n_0 ;
  wire \e[2]_i_4_n_0 ;
  wire \e[3]_i_1__0_n_0 ;
  wire \e[3]_i_2__1_n_0 ;
  wire \e[3]_i_3__1_n_0 ;
  wire \e[3]_i_4_n_0 ;
  wire \e[4]_i_1__1_n_0 ;
  wire \e[4]_i_2__0_n_0 ;
  wire \e[4]_i_3__1_n_0 ;
  wire \e[4]_i_4_n_0 ;
  wire \e[5]_i_1__1_n_0 ;
  wire \e[5]_i_2__0_n_0 ;
  wire \e[5]_i_3_n_0 ;
  wire \e[5]_i_4__0_n_0 ;
  wire \e[6]_i_2_n_0 ;
  wire \e[6]_i_3__0_n_0 ;
  wire \e[6]_i_4__0_n_0 ;
  wire \e[7]_i_2__1_n_0 ;
  wire \e[7]_i_3__1_n_0 ;
  wire \e[7]_i_4__1_n_0 ;
  wire \e[7]_i_5__0_n_0 ;
  wire \e[8]_i_1__0_n_0 ;
  wire \e[8]_i_2_n_0 ;
  wire \e[8]_i_3__0_n_0 ;
  wire \e[9]_i_10__0_n_0 ;
  wire \e[9]_i_11__0_n_0 ;
  wire \e[9]_i_12__1_n_0 ;
  wire \e[9]_i_13__1_n_0 ;
  wire \e[9]_i_14__1_n_0 ;
  wire \e[9]_i_15__0_n_0 ;
  wire \e[9]_i_16__1_n_0 ;
  wire \e[9]_i_17__1_n_0 ;
  wire \e[9]_i_18__1_n_0 ;
  wire \e[9]_i_19__0_n_0 ;
  wire \e[9]_i_1__1_n_0 ;
  wire \e[9]_i_20_n_0 ;
  wire \e[9]_i_2_n_0 ;
  wire \e[9]_i_3__1_n_0 ;
  wire \e[9]_i_4__1_n_0 ;
  wire \e[9]_i_5__0_n_0 ;
  wire \e[9]_i_6_n_0 ;
  wire \e[9]_i_7__1_n_0 ;
  wire \e[9]_i_8__1_n_0 ;
  wire \e[9]_i_9__0_n_0 ;
  wire \e_reg[1]_i_1__0_n_0 ;
  wire \e_reg[2]_i_1__0_n_0 ;
  wire \e_reg[6]_0 ;
  wire \e_reg[6]_i_1__0_n_0 ;
  wire \e_reg[7]_i_1__0_n_0 ;
  wire guardBandEnable;
  wire guardBandType;
  wire isTERC4Region;
  wire p_1_in;

  LUT6 #(
    .INIT(64'h6996FFFF69960000)) 
    \dc_bias[0]_i_1__1 
       (.I0(\e[9]_i_3__1_n_0 ),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(\e[9]_i_4__1_n_0 ),
        .I5(\dc_bias[0]_i_3__1_n_0 ),
        .O(\dc_bias[0]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \dc_bias[0]_i_2__1 
       (.I0(blue_p[3]),
        .I1(blue_p[1]),
        .I2(blue_p[7]),
        .I3(blue_p[5]),
        .O(\dc_bias[0]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h9666669666969666)) 
    \dc_bias[0]_i_3__1 
       (.I0(\dc_bias[0]_i_4__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[0] ),
        .I2(\e[9]_i_5__0_n_0 ),
        .I3(blue_p[0]),
        .I4(blue_p[7]),
        .I5(\dc_bias[0]_i_5__1_n_0 ),
        .O(\dc_bias[0]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \dc_bias[0]_i_4__1 
       (.I0(\dc_bias[0]_i_2__1_n_0 ),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(blue_p[2]),
        .O(\dc_bias[0]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[0]_i_5__1 
       (.I0(blue_p[5]),
        .I1(blue_p[2]),
        .I2(blue_p[0]),
        .I3(blue_p[1]),
        .I4(blue_p[3]),
        .O(\dc_bias[0]_i_5__1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \dc_bias[1]_i_2__1 
       (.I0(\dc_bias[2]_i_9__1_n_0 ),
        .I1(\dc_bias[2]_i_7__0_n_0 ),
        .I2(\dc_bias[2]_i_8__0_n_0 ),
        .I3(\dc_bias[2]_i_4__1_n_0 ),
        .I4(\dc_bias[2]_i_5__1_n_0 ),
        .O(\dc_bias[1]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'hB88B8BB8)) 
    \dc_bias[1]_i_3__1 
       (.I0(\dc_bias[1]_i_4__0_n_0 ),
        .I1(\e[9]_i_3__1_n_0 ),
        .I2(\dc_bias[1]_i_5__1_n_0 ),
        .I3(\dc_bias[1]_i_6__1_n_0 ),
        .I4(\dc_bias[1]_i_7__0_n_0 ),
        .O(\dc_bias[1]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h96666669)) 
    \dc_bias[1]_i_4__0 
       (.I0(\e[9]_i_9__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(\dc_bias[0]_i_2__1_n_0 ),
        .I4(\e[9]_i_5__0_n_0 ),
        .O(\dc_bias[1]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBED74128)) 
    \dc_bias[1]_i_5__1 
       (.I0(blue_p[2]),
        .I1(blue_p[0]),
        .I2(blue_p[1]),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\dc_bias[3]_i_18__0_n_0 ),
        .O(\dc_bias[1]_i_5__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hF99090F9)) 
    \dc_bias[1]_i_6__1 
       (.I0(\e[3]_i_3__1_n_0 ),
        .I1(blue_p[5]),
        .I2(blue_p[7]),
        .I3(blue_p[0]),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[1]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h1441411441141441)) 
    \dc_bias[1]_i_7__0 
       (.I0(\dc_bias[1]_i_8__0_n_0 ),
        .I1(blue_p[7]),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(blue_p[0]),
        .I4(blue_p[5]),
        .I5(\e[3]_i_3__1_n_0 ),
        .O(\dc_bias[1]_i_7__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \dc_bias[1]_i_8__0 
       (.I0(blue_p[2]),
        .I1(\e[9]_i_5__0_n_0 ),
        .O(\dc_bias[1]_i_8__0_n_0 ));
  LUT5 #(
    .INIT(32'hD2B4B42D)) 
    \dc_bias[2]_i_10__0 
       (.I0(\dc_bias[1]_i_7__0_n_0 ),
        .I1(\dc_bias[1]_i_6__1_n_0 ),
        .I2(\dc_bias[3]_i_16__1_n_0 ),
        .I3(\dc_bias[3]_i_18__0_n_0 ),
        .I4(\dc_bias[3]_i_17__1_n_0 ),
        .O(\dc_bias[2]_i_10__0_n_0 ));
  LUT6 #(
    .INIT(64'h966900006996FFFF)) 
    \dc_bias[2]_i_11__0 
       (.I0(blue_p[5]),
        .I1(\e[3]_i_3__1_n_0 ),
        .I2(blue_p[7]),
        .I3(blue_p[0]),
        .I4(\e[9]_i_5__0_n_0 ),
        .I5(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[2]_i_11__0_n_0 ));
  LUT6 #(
    .INIT(64'hE17887E1781EE178)) 
    \dc_bias[2]_i_2__1 
       (.I0(\dc_bias[2]_i_4__1_n_0 ),
        .I1(\dc_bias[2]_i_5__1_n_0 ),
        .I2(\dc_bias[2]_i_6__1_n_0 ),
        .I3(\dc_bias[2]_i_7__0_n_0 ),
        .I4(\dc_bias[2]_i_8__0_n_0 ),
        .I5(\dc_bias[2]_i_9__1_n_0 ),
        .O(\dc_bias[2]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h9669FFFF96690000)) 
    \dc_bias[2]_i_3__1 
       (.I0(\e[9]_i_8__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[2] ),
        .I2(\dc_bias[3]_i_10__0_n_0 ),
        .I3(\dc_bias[3]_i_9__1_n_0 ),
        .I4(\e[9]_i_3__1_n_0 ),
        .I5(\dc_bias[2]_i_10__0_n_0 ),
        .O(\dc_bias[2]_i_3__1_n_0 ));
  LUT6 #(
    .INIT(64'h9F0F090F090F9F0F)) 
    \dc_bias[2]_i_4__1 
       (.I0(blue_p[7]),
        .I1(blue_p[0]),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[3]_i_3__1_n_0 ),
        .I5(blue_p[5]),
        .O(\dc_bias[2]_i_4__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h47FF)) 
    \dc_bias[2]_i_5__1 
       (.I0(blue_p[2]),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\dc_bias[2]_i_11__0_n_0 ),
        .O(\dc_bias[2]_i_5__1_n_0 ));
  LUT6 #(
    .INIT(64'h3F6A3F66C095C099)) 
    \dc_bias[2]_i_6__1 
       (.I0(\e[9]_i_8__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_14__0_n_0 ),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[9]_i_9__0_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[2]_i_6__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8828)) 
    \dc_bias[2]_i_7__0 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(\e[3]_i_3__1_n_0 ),
        .I2(blue_p[4]),
        .I3(blue_p[5]),
        .O(\dc_bias[2]_i_7__0_n_0 ));
  LUT6 #(
    .INIT(64'h95A595559AAA9A5A)) 
    \dc_bias[2]_i_8__0 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(blue_p[0]),
        .I2(\e[9]_i_5__0_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[7]_i_4__1_n_0 ),
        .I5(\e[9]_i_9__0_n_0 ),
        .O(\dc_bias[2]_i_8__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    \dc_bias[2]_i_9__1 
       (.I0(blue_p[2]),
        .I1(blue_p[1]),
        .I2(blue_p[0]),
        .I3(\e[9]_i_5__0_n_0 ),
        .O(\dc_bias[2]_i_9__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hF9999990)) 
    \dc_bias[3]_i_10__0 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(\e[9]_i_9__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_10__0_n_0 ));
  LUT6 #(
    .INIT(64'h6A66665666565655)) 
    \dc_bias[3]_i_11__1 
       (.I0(\dc_bias[3]_i_15__1_n_0 ),
        .I1(\dc_bias[3]_i_16__1_n_0 ),
        .I2(\dc_bias[1]_i_6__1_n_0 ),
        .I3(\dc_bias[3]_i_17__1_n_0 ),
        .I4(\dc_bias[3]_i_18__0_n_0 ),
        .I5(\dc_bias[1]_i_7__0_n_0 ),
        .O(\dc_bias[3]_i_11__1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF9669)) 
    \dc_bias[3]_i_12__1 
       (.I0(\dc_bias[3]_i_13__1_n_0 ),
        .I1(\e[9]_i_18__1_n_0 ),
        .I2(\e[9]_i_20_n_0 ),
        .I3(\e[9]_i_19__0_n_0 ),
        .I4(\e[9]_i_5__0_n_0 ),
        .I5(\dc_bias[3]_i_14__0_n_0 ),
        .O(\dc_bias[3]_i_12__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h84121284)) 
    \dc_bias[3]_i_13__1 
       (.I0(blue_p[3]),
        .I1(blue_p[0]),
        .I2(blue_p[1]),
        .I3(blue_p[7]),
        .I4(blue_p[5]),
        .O(\dc_bias[3]_i_13__1_n_0 ));
  LUT6 #(
    .INIT(64'h808C8C808C80808C)) 
    \dc_bias[3]_i_14__0 
       (.I0(blue_p[0]),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(blue_p[7]),
        .I3(\e[4]_i_3__1_n_0 ),
        .I4(blue_p[5]),
        .I5(blue_p[6]),
        .O(\dc_bias[3]_i_14__0_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA9AA95A95595)) 
    \dc_bias[3]_i_15__1 
       (.I0(p_1_in),
        .I1(\dc_bias[3]_i_19__1_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias[3]_i_20__1_n_0 ),
        .I4(\dc_bias[3]_i_21__1_n_0 ),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_15__1_n_0 ));
  LUT6 #(
    .INIT(64'h2BBDBDBDD4424242)) 
    \dc_bias[3]_i_16__1 
       (.I0(\dc_bias[3]_i_20__1_n_0 ),
        .I1(\dc_bias[3]_i_21__1_n_0 ),
        .I2(\dc_bias_reg_n_0_[1] ),
        .I3(\dc_bias_reg_n_0_[0] ),
        .I4(blue_p[0]),
        .I5(\dc_bias_reg_n_0_[2] ),
        .O(\dc_bias[3]_i_16__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hEB7D)) 
    \dc_bias[3]_i_17__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(blue_p[1]),
        .I2(blue_p[0]),
        .I3(blue_p[2]),
        .O(\dc_bias[3]_i_17__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h69999666)) 
    \dc_bias[3]_i_18__0 
       (.I0(\dc_bias[3]_i_20__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias_reg_n_0_[0] ),
        .I3(blue_p[0]),
        .I4(\dc_bias[3]_i_21__1_n_0 ),
        .O(\dc_bias[3]_i_18__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \dc_bias[3]_i_19__1 
       (.I0(blue_p[0]),
        .I1(\dc_bias_reg_n_0_[0] ),
        .O(\dc_bias[3]_i_19__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h781E)) 
    \dc_bias[3]_i_20__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(blue_p[5]),
        .I2(\e[3]_i_3__1_n_0 ),
        .I3(blue_p[4]),
        .O(\dc_bias[3]_i_20__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h8EE8E88E)) 
    \dc_bias[3]_i_21__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(blue_p[7]),
        .I2(\e[4]_i_3__1_n_0 ),
        .I3(blue_p[5]),
        .I4(blue_p[6]),
        .O(\dc_bias[3]_i_21__1_n_0 ));
  LUT6 #(
    .INIT(64'hA69A9A5965A6A69A)) 
    \dc_bias[3]_i_2__0 
       (.I0(\dc_bias[3]_i_4__1_n_0 ),
        .I1(\dc_bias[3]_i_5__1_n_0 ),
        .I2(\dc_bias[3]_i_6__1_n_0 ),
        .I3(\dc_bias[3]_i_7__1_n_0 ),
        .I4(\dc_bias_reg_n_0_[2] ),
        .I5(\dc_bias[3]_i_8__1_n_0 ),
        .O(\dc_bias[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h422B422B0000FFFF)) 
    \dc_bias[3]_i_3__1 
       (.I0(\dc_bias[3]_i_9__1_n_0 ),
        .I1(\dc_bias[3]_i_10__0_n_0 ),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\e[9]_i_8__1_n_0 ),
        .I4(\dc_bias[3]_i_11__1_n_0 ),
        .I5(\e[9]_i_3__1_n_0 ),
        .O(\dc_bias[3]_i_3__1_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \dc_bias[3]_i_4__1 
       (.I0(p_1_in),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(\e[9]_i_7__1_n_0 ),
        .O(\dc_bias[3]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h000096699669FFFF)) 
    \dc_bias[3]_i_5__1 
       (.I0(\dc_bias[3]_i_12__1_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[2]_i_7__0_n_0 ),
        .I3(\dc_bias[2]_i_9__1_n_0 ),
        .I4(\dc_bias[2]_i_5__1_n_0 ),
        .I5(\dc_bias[2]_i_4__1_n_0 ),
        .O(\dc_bias[3]_i_5__1_n_0 ));
  LUT5 #(
    .INIT(32'h01401501)) 
    \dc_bias[3]_i_6__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(\e[9]_i_19__0_n_0 ),
        .I2(\e[9]_i_20_n_0 ),
        .I3(\e[9]_i_18__1_n_0 ),
        .I4(\dc_bias[3]_i_13__1_n_0 ),
        .O(\dc_bias[3]_i_6__1_n_0 ));
  LUT6 #(
    .INIT(64'h80A080008AAA8A0A)) 
    \dc_bias[3]_i_7__1 
       (.I0(\dc_bias_reg_n_0_[1] ),
        .I1(blue_p[0]),
        .I2(\e[9]_i_5__0_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[7]_i_4__1_n_0 ),
        .I5(\e[9]_i_9__0_n_0 ),
        .O(\dc_bias[3]_i_7__1_n_0 ));
  LUT6 #(
    .INIT(64'h41414144D7D7D7DD)) 
    \dc_bias[3]_i_8__1 
       (.I0(\dc_bias[2]_i_7__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
        .I2(\dc_bias[3]_i_14__0_n_0 ),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[9]_i_9__0_n_0 ),
        .I5(\dc_bias[2]_i_9__1_n_0 ),
        .O(\dc_bias[3]_i_8__1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \dc_bias[3]_i_9__1 
       (.I0(\e[9]_i_9__0_n_0 ),
        .I1(\dc_bias_reg_n_0_[1] ),
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
        .S(\e[9]_i_4__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[2] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[2]_i_1__1_n_0 ),
        .Q(\dc_bias_reg_n_0_[2] ),
        .R(blank));
  MUXF7 \dc_bias_reg[2]_i_1__1 
       (.I0(\dc_bias[2]_i_2__1_n_0 ),
        .I1(\dc_bias[2]_i_3__1_n_0 ),
        .O(\dc_bias_reg[2]_i_1__1_n_0 ),
        .S(\e[9]_i_4__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dc_bias_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\dc_bias_reg[3]_i_1__0_n_0 ),
        .Q(p_1_in),
        .R(blank));
  MUXF7 \dc_bias_reg[3]_i_1__0 
       (.I0(\dc_bias[3]_i_2__0_n_0 ),
        .I1(\dc_bias[3]_i_3__1_n_0 ),
        .O(\dc_bias_reg[3]_i_1__0_n_0 ),
        .S(\e[9]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000059A9)) 
    \e[0]_i_1__1 
       (.I0(blue_p[0]),
        .I1(\e[9]_i_5__0_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(\e[9]_i_3__1_n_0 ),
        .I4(blank),
        .I5(\e[0]_i_2__0_n_0 ),
        .O(\e[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hFC550000FCF00000)) 
    \e[0]_i_2__0 
       (.I0(\e[0]_i_3_n_0 ),
        .I1(controlChannel0Blue[1]),
        .I2(controlChannel0Blue[0]),
        .I3(guardBandEnable),
        .I4(blank),
        .I5(isTERC4Region),
        .O(\e[0]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h1EBB)) 
    \e[0]_i_3 
       (.I0(TERC4Character0[1]),
        .I1(TERC4Character0[0]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[2]),
        .O(\e[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h906F6F90)) 
    \e[1]_i_2__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(\e[9]_i_3__1_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(blue_p[1]),
        .I4(blue_p[0]),
        .O(\e[1]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFABABAEAEAEAAAEA)) 
    \e[1]_i_3 
       (.I0(\e[1]_i_4_n_0 ),
        .I1(TERC4Character0[0]),
        .I2(\e_reg[6]_0 ),
        .I3(TERC4Character0[3]),
        .I4(TERC4Character0[1]),
        .I5(TERC4Character0[2]),
        .O(\e[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8BCC)) 
    \e[1]_i_4 
       (.I0(controlChannel0Blue[1]),
        .I1(guardBandEnable),
        .I2(isTERC4Region),
        .I3(controlChannel0Blue[0]),
        .O(\e[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6969966996969669)) 
    \e[2]_i_2__1 
       (.I0(blue_p[1]),
        .I1(blue_p[0]),
        .I2(blue_p[2]),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[9]_i_4__1_n_0 ),
        .I5(\e[9]_i_3__1_n_0 ),
        .O(\e[2]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'hABAAABBB)) 
    \e[2]_i_3__0 
       (.I0(\e[2]_i_4_n_0 ),
        .I1(controlChannel0Blue[0]),
        .I2(controlChannel0Blue[1]),
        .I3(guardBandEnable),
        .I4(isTERC4Region),
        .O(\e[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0047000000AD0000)) 
    \e[2]_i_4 
       (.I0(TERC4Character0[2]),
        .I1(TERC4Character0[1]),
        .I2(TERC4Character0[0]),
        .I3(guardBandEnable),
        .I4(isTERC4Region),
        .I5(TERC4Character0[3]),
        .O(\e[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8BBBBB88B8888)) 
    \e[3]_i_1__0 
       (.I0(\e[3]_i_2__1_n_0 ),
        .I1(blank),
        .I2(\e[9]_i_5__0_n_0 ),
        .I3(\e[9]_i_3__1_n_0 ),
        .I4(\e[9]_i_4__1_n_0 ),
        .I5(\e[3]_i_3__1_n_0 ),
        .O(\e[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAABABAFAEAEAEABA)) 
    \e[3]_i_2__1 
       (.I0(\e[3]_i_4_n_0 ),
        .I1(TERC4Character0[2]),
        .I2(\e_reg[6]_0 ),
        .I3(TERC4Character0[0]),
        .I4(TERC4Character0[1]),
        .I5(TERC4Character0[3]),
        .O(\e[3]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \e[3]_i_3__1 
       (.I0(blue_p[3]),
        .I1(blue_p[1]),
        .I2(blue_p[0]),
        .I3(blue_p[2]),
        .O(\e[3]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h110C)) 
    \e[3]_i_4 
       (.I0(isTERC4Region),
        .I1(guardBandEnable),
        .I2(controlChannel0Blue[1]),
        .I3(controlChannel0Blue[0]),
        .O(\e[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB8888BBBB8BB8B88)) 
    \e[4]_i_1__1 
       (.I0(\e[4]_i_2__0_n_0 ),
        .I1(blank),
        .I2(\e[9]_i_3__1_n_0 ),
        .I3(\e[9]_i_4__1_n_0 ),
        .I4(\e[4]_i_3__1_n_0 ),
        .I5(\e[9]_i_5__0_n_0 ),
        .O(\e[4]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAFABABAEAAABA)) 
    \e[4]_i_2__0 
       (.I0(\e[4]_i_4_n_0 ),
        .I1(TERC4Character0[1]),
        .I2(\e_reg[6]_0 ),
        .I3(TERC4Character0[0]),
        .I4(TERC4Character0[3]),
        .I5(TERC4Character0[2]),
        .O(\e[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \e[4]_i_3__1 
       (.I0(blue_p[4]),
        .I1(blue_p[2]),
        .I2(blue_p[0]),
        .I3(blue_p[1]),
        .I4(blue_p[3]),
        .O(\e[4]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h01C1)) 
    \e[4]_i_4 
       (.I0(isTERC4Region),
        .I1(guardBandEnable),
        .I2(controlChannel0Blue[0]),
        .I3(controlChannel0Blue[1]),
        .O(\e[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000906F)) 
    \e[5]_i_1__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(\e[9]_i_3__1_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(\e[5]_i_2__0_n_0 ),
        .I4(blank),
        .I5(\e[5]_i_3_n_0 ),
        .O(\e[5]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \e[5]_i_2__0 
       (.I0(blue_p[5]),
        .I1(blue_p[3]),
        .I2(blue_p[1]),
        .I3(blue_p[0]),
        .I4(blue_p[2]),
        .I5(blue_p[4]),
        .O(\e[5]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h303050C0C0C050C0)) 
    \e[5]_i_3 
       (.I0(\e[5]_i_4__0_n_0 ),
        .I1(controlChannel0Blue[0]),
        .I2(blank),
        .I3(isTERC4Region),
        .I4(guardBandEnable),
        .I5(controlChannel0Blue[1]),
        .O(\e[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h96B1)) 
    \e[5]_i_4__0 
       (.I0(TERC4Character0[1]),
        .I1(TERC4Character0[0]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[2]),
        .O(\e[5]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h9696699669696996)) 
    \e[6]_i_2 
       (.I0(\e[4]_i_3__1_n_0 ),
        .I1(blue_p[5]),
        .I2(blue_p[6]),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[9]_i_4__1_n_0 ),
        .I5(\e[9]_i_3__1_n_0 ),
        .O(\e[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAAAEAFAEABABAEA)) 
    \e[6]_i_3__0 
       (.I0(\e[6]_i_4__0_n_0 ),
        .I1(TERC4Character0[0]),
        .I2(\e_reg[6]_0 ),
        .I3(TERC4Character0[3]),
        .I4(TERC4Character0[2]),
        .I5(TERC4Character0[1]),
        .O(\e[6]_i_3__0_n_0 ));
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
    .INIT(32'h906F6F90)) 
    \e[7]_i_2__1 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(\e[9]_i_3__1_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[7]_i_4__1_n_0 ),
        .O(\e[7]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'hFAAABFFBAAAAAAAA)) 
    \e[7]_i_3__1 
       (.I0(\e[7]_i_5__0_n_0 ),
        .I1(TERC4Character0[2]),
        .I2(TERC4Character0[3]),
        .I3(TERC4Character0[1]),
        .I4(TERC4Character0[0]),
        .I5(\e_reg[6]_0 ),
        .O(\e[7]_i_3__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[7]_i_4__1 
       (.I0(blue_p[6]),
        .I1(blue_p[5]),
        .I2(\e[4]_i_3__1_n_0 ),
        .O(\e[7]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAA0F55305500)) 
    \e[7]_i_5__0 
       (.I0(controlChannel0Blue[1]),
        .I1(TERC4Character0[2]),
        .I2(isTERC4Region),
        .I3(guardBandEnable),
        .I4(TERC4Character0[1]),
        .I5(controlChannel0Blue[0]),
        .O(\e[7]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hEFE0)) 
    \e[8]_i_1__0 
       (.I0(\e[8]_i_2_n_0 ),
        .I1(\e[8]_i_3__0_n_0 ),
        .I2(blank),
        .I3(\e[9]_i_5__0_n_0 ),
        .O(\e[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0F0022220F000F0F)) 
    \e[8]_i_2 
       (.I0(TERC4Character0[2]),
        .I1(TERC4Character0[3]),
        .I2(controlChannel0Blue[0]),
        .I3(controlChannel0Blue[1]),
        .I4(guardBandEnable),
        .I5(isTERC4Region),
        .O(\e[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000001C000000)) 
    \e[8]_i_3__0 
       (.I0(TERC4Character0[2]),
        .I1(TERC4Character0[1]),
        .I2(TERC4Character0[0]),
        .I3(isTERC4Region),
        .I4(TERC4Character0[3]),
        .I5(guardBandEnable),
        .O(\e[8]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \e[9]_i_10__0 
       (.I0(\dc_bias_reg_n_0_[0] ),
        .I1(p_1_in),
        .I2(\dc_bias_reg_n_0_[2] ),
        .I3(\dc_bias_reg_n_0_[1] ),
        .O(\e[9]_i_10__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000001700171717)) 
    \e[9]_i_11__0 
       (.I0(blue_p[1]),
        .I1(blue_p[3]),
        .I2(blue_p[2]),
        .I3(blue_p[4]),
        .I4(blue_p[6]),
        .I5(blue_p[5]),
        .O(\e[9]_i_11__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_12__1 
       (.I0(blue_p[3]),
        .I1(blue_p[2]),
        .I2(blue_p[1]),
        .O(\e[9]_i_12__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_13__1 
       (.I0(blue_p[4]),
        .I1(blue_p[6]),
        .I2(blue_p[5]),
        .O(\e[9]_i_13__1_n_0 ));
  LUT6 #(
    .INIT(64'hE8E8E800E8000000)) 
    \e[9]_i_14__1 
       (.I0(blue_p[1]),
        .I1(blue_p[3]),
        .I2(blue_p[2]),
        .I3(blue_p[4]),
        .I4(blue_p[6]),
        .I5(blue_p[5]),
        .O(\e[9]_i_14__1_n_0 ));
  LUT6 #(
    .INIT(64'hB00090000000F000)) 
    \e[9]_i_15__0 
       (.I0(TERC4Character0[0]),
        .I1(TERC4Character0[1]),
        .I2(\e_reg[6]_0 ),
        .I3(blank),
        .I4(TERC4Character0[2]),
        .I5(TERC4Character0[3]),
        .O(\e[9]_i_15__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \e[9]_i_16__1 
       (.I0(blue_p[5]),
        .I1(blue_p[7]),
        .I2(blue_p[0]),
        .O(\e[9]_i_16__1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \e[9]_i_17__1 
       (.I0(blue_p[1]),
        .I1(blue_p[0]),
        .O(\e[9]_i_17__1_n_0 ));
  LUT6 #(
    .INIT(64'h481284217BDEB7ED)) 
    \e[9]_i_18__1 
       (.I0(blue_p[6]),
        .I1(blue_p[5]),
        .I2(\e[4]_i_3__1_n_0 ),
        .I3(blue_p[7]),
        .I4(\e[9]_i_5__0_n_0 ),
        .I5(blue_p[0]),
        .O(\e[9]_i_18__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h18E7)) 
    \e[9]_i_19__0 
       (.I0(\e[9]_i_5__0_n_0 ),
        .I1(blue_p[5]),
        .I2(blue_p[6]),
        .I3(\e[4]_i_3__1_n_0 ),
        .O(\e[9]_i_19__0_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \e[9]_i_1__1 
       (.I0(guardBandType),
        .I1(guardBandEnable),
        .I2(blank),
        .O(\e[9]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4045)) 
    \e[9]_i_2 
       (.I0(blank),
        .I1(\e[9]_i_3__1_n_0 ),
        .I2(\e[9]_i_4__1_n_0 ),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(\e[9]_i_6_n_0 ),
        .O(\e[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h69C33C69)) 
    \e[9]_i_20 
       (.I0(blue_p[3]),
        .I1(blue_p[0]),
        .I2(blue_p[1]),
        .I3(\e[9]_i_5__0_n_0 ),
        .I4(blue_p[2]),
        .O(\e[9]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \e[9]_i_3__1 
       (.I0(p_1_in),
        .I1(\e[9]_i_7__1_n_0 ),
        .O(\e[9]_i_3__1_n_0 ));
  LUT4 #(
    .INIT(16'h00DF)) 
    \e[9]_i_4__1 
       (.I0(\e[9]_i_8__1_n_0 ),
        .I1(\e[9]_i_9__0_n_0 ),
        .I2(\dc_bias[0]_i_2__1_n_0 ),
        .I3(\e[9]_i_10__0_n_0 ),
        .O(\e[9]_i_4__1_n_0 ));
  LUT6 #(
    .INIT(64'h80080880EEFFAAEE)) 
    \e[9]_i_5__0 
       (.I0(\e[9]_i_11__0_n_0 ),
        .I1(\e[9]_i_12__1_n_0 ),
        .I2(blue_p[0]),
        .I3(blue_p[7]),
        .I4(\e[9]_i_13__1_n_0 ),
        .I5(\e[9]_i_14__1_n_0 ),
        .O(\e[9]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'hFAAAFAFABAAAAABA)) 
    \e[9]_i_6 
       (.I0(\e[9]_i_15__0_n_0 ),
        .I1(isTERC4Region),
        .I2(blank),
        .I3(controlChannel0Blue[0]),
        .I4(controlChannel0Blue[1]),
        .I5(guardBandEnable),
        .O(\e[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000EB00EB00FFEB)) 
    \e[9]_i_7__1 
       (.I0(\e[9]_i_16__1_n_0 ),
        .I1(blue_p[3]),
        .I2(\e[9]_i_17__1_n_0 ),
        .I3(\e[9]_i_18__1_n_0 ),
        .I4(\e[9]_i_19__0_n_0 ),
        .I5(\e[9]_i_20_n_0 ),
        .O(\e[9]_i_7__1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEB14FF14FF0014)) 
    \e[9]_i_8__1 
       (.I0(\e[9]_i_16__1_n_0 ),
        .I1(blue_p[3]),
        .I2(\e[9]_i_17__1_n_0 ),
        .I3(\e[9]_i_18__1_n_0 ),
        .I4(\e[9]_i_20_n_0 ),
        .I5(\e[9]_i_19__0_n_0 ),
        .O(\e[9]_i_8__1_n_0 ));
  LUT6 #(
    .INIT(64'h14EBEB14EB1414EB)) 
    \e[9]_i_9__0 
       (.I0(\e[9]_i_16__1_n_0 ),
        .I1(blue_p[3]),
        .I2(\e[9]_i_17__1_n_0 ),
        .I3(\e[9]_i_18__1_n_0 ),
        .I4(\e[9]_i_20_n_0 ),
        .I5(\e[9]_i_19__0_n_0 ),
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
        .D(\e_reg[2]_i_1__0_n_0 ),
        .Q(EncodedB[2]),
        .S(\e[9]_i_1__1_n_0 ));
  MUXF7 \e_reg[2]_i_1__0 
       (.I0(\e[2]_i_2__1_n_0 ),
        .I1(\e[2]_i_3__0_n_0 ),
        .O(\e_reg[2]_i_1__0_n_0 ),
        .S(blank));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[3] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e[3]_i_1__0_n_0 ),
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
        .D(\e[5]_i_1__1_n_0 ),
        .Q(EncodedB[5]),
        .R(\e[9]_i_1__1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[6] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[6]_i_1__0_n_0 ),
        .Q(EncodedB[6]),
        .S(\e[9]_i_1__1_n_0 ));
  MUXF7 \e_reg[6]_i_1__0 
       (.I0(\e[6]_i_2_n_0 ),
        .I1(\e[6]_i_3__0_n_0 ),
        .O(\e_reg[6]_i_1__0_n_0 ),
        .S(blank));
  FDSE #(
    .INIT(1'b0)) 
    \e_reg[7] 
       (.C(clk_pixel_x1),
        .CE(1'b1),
        .D(\e_reg[7]_i_1__0_n_0 ),
        .Q(EncodedB[7]),
        .S(\e[9]_i_1__1_n_0 ));
  MUXF7 \e_reg[7]_i_1__0 
       (.I0(\e[7]_i_2__1_n_0 ),
        .I1(\e[7]_i_3__1_n_0 ),
        .O(\e_reg[7]_i_1__0_n_0 ),
        .S(blank));
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
module MainDesign_dvid_0_0_dvid
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
    clk_pixel_x1,
    clk_x10,
    controlChannel0Blue,
    controlChannel2Red,
    TERC4Character2,
    TERC4Character0,
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
  input clk_pixel_x1;
  input clk_x10;
  input [1:0]controlChannel0Blue;
  input [1:0]controlChannel2Red;
  input [3:0]TERC4Character2;
  input [3:0]TERC4Character0;
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

  MainDesign_dvid_0_0_TDMS_encoder__parameterized3 TDMS_encoder_blue
       (.EncodedB(EncodedB),
        .TERC4Character0(TERC4Character0),
        .blank(blank),
        .blue_p(blue_p),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel0Blue(controlChannel0Blue),
        .\e_reg[6]_0 (TDMS_encoder_red_n_0),
        .guardBandEnable(guardBandEnable),
        .guardBandType(guardBandType),
        .isTERC4Region(isTERC4Region));
  MainDesign_dvid_0_0_TDMS_encoder__parameterized1 TDMS_encoder_green
       (.EncodedG(EncodedG),
        .TERC4Character1(TERC4Character1),
        .blank(blank),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel1Green(controlChannel1Green),
        .green_p(green_p),
        .guardBandEnable(guardBandEnable),
        .isTERC4Region(isTERC4Region));
  MainDesign_dvid_0_0_TDMS_encoder TDMS_encoder_red
       (.EncodedR(EncodedR),
        .TERC4Character2(TERC4Character2),
        .blank(blank),
        .clk_pixel_x1(clk_pixel_x1),
        .controlChannel2Red(controlChannel2Red),
        .guardBandEnable(guardBandEnable),
        .guardBandType(guardBandType),
        .isTERC4Region(isTERC4Region),
        .isTERC4Region_0(TDMS_encoder_red_n_0),
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
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[0]_i_1 
       (.I0(\shift_blue_reg_n_0_[1] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[0]),
        .O(shift_blue[0]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[1]_i_1 
       (.I0(\shift_blue_reg_n_0_[2] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[1]),
        .O(shift_blue[1]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[2]_i_1 
       (.I0(\shift_blue_reg_n_0_[3] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[2]),
        .O(shift_blue[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[3]_i_1 
       (.I0(\shift_blue_reg_n_0_[4] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[3]),
        .O(shift_blue[3]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[4]_i_1 
       (.I0(\shift_blue_reg_n_0_[5] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[4]),
        .O(shift_blue[4]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[5]_i_1 
       (.I0(\shift_blue_reg_n_0_[6] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[5]),
        .O(shift_blue[5]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[6]_i_1 
       (.I0(\shift_blue_reg_n_0_[7] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[6]),
        .O(shift_blue[6]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[7]_i_1 
       (.I0(\shift_blue_reg_n_0_[8] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[7]),
        .O(shift_blue[7]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_blue[8]_i_1 
       (.I0(\shift_blue_reg_n_0_[9] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_blue[8]),
        .O(shift_blue[8]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[0]_i_1 
       (.I0(\shift_green_reg_n_0_[1] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[0]),
        .O(shift_green[0]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[1]_i_1 
       (.I0(\shift_green_reg_n_0_[2] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[1]),
        .O(shift_green[1]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[2]_i_1 
       (.I0(\shift_green_reg_n_0_[3] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[2]),
        .O(shift_green[2]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[3]_i_1 
       (.I0(\shift_green_reg_n_0_[4] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[3]),
        .O(shift_green[3]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[4]_i_1 
       (.I0(\shift_green_reg_n_0_[5] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[4]),
        .O(shift_green[4]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[5]_i_1 
       (.I0(\shift_green_reg_n_0_[6] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[5]),
        .O(shift_green[5]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[6]_i_1 
       (.I0(\shift_green_reg_n_0_[7] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[6]),
        .O(shift_green[6]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[7]_i_1 
       (.I0(\shift_green_reg_n_0_[8] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[7]),
        .O(shift_green[7]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_green[8]_i_1 
       (.I0(\shift_green_reg_n_0_[9] ),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_green[8]),
        .O(shift_green[8]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[0]_i_1 
       (.I0(data1[0]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[0]),
        .O(shift_red[0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[1]_i_1 
       (.I0(data1[1]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[1]),
        .O(shift_red[1]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[2]_i_1 
       (.I0(data1[2]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[2]),
        .O(shift_red[2]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[3]_i_1 
       (.I0(data1[3]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[3]),
        .O(shift_red[3]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[4]_i_1 
       (.I0(data1[4]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[4]),
        .O(shift_red[4]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[5]_i_1 
       (.I0(data1[5]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[5]),
        .O(shift_red[5]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[6]_i_1 
       (.I0(data1[6]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[6]),
        .O(shift_red[6]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[7]_i_1 
       (.I0(data1[7]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[7]),
        .O(shift_red[7]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shift_red[8]_i_1 
       (.I0(data1[8]),
        .I1(\shift_red[9]_i_2_n_0 ),
        .I2(latched_red[8]),
        .O(shift_red[8]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
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
