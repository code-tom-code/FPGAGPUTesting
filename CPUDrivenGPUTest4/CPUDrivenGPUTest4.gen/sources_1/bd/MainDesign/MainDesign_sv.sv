// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:MainDesign:1.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module MainDesign_sv (
  (* X_INTERFACE_IGNORE = "true" *)
  input wire default_sysclk1_300_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire default_sysclk1_300_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_act_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [16:0] ddr4_sdram_075_adr,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [1:0] ddr4_sdram_075_ba,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_bg,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_ck_c,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_ck_t,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_cke,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_cs_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [3:0] ddr4_sdram_075_dm_n,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [31:0] ddr4_sdram_075_dq,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [3:0] ddr4_sdram_075_dqs_c,
  (* X_INTERFACE_IGNORE = "true" *)
  inout wire [3:0] ddr4_sdram_075_dqs_t,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_odt,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire ddr4_sdram_075_reset_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdc_mdc,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mdio_mdc_mdio_i,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdc_mdio_o,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdc_mdio_t,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire sgmii_lvds_rxn,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire sgmii_lvds_rxp,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire sgmii_lvds_txn,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire sgmii_lvds_txp,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire sgmii_phyclk_clk_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire sgmii_phyclk_clk_p,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire reset,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_blue_p,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_blue_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_green_p,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_green_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_red_p,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_red_n,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_cl_p,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire tmds_cl_n
);

  MainDesign inst (
    .default_sysclk1_300_clk_n(default_sysclk1_300_clk_n),
    .default_sysclk1_300_clk_p(default_sysclk1_300_clk_p),
    .ddr4_sdram_075_act_n(ddr4_sdram_075_act_n),
    .ddr4_sdram_075_adr(ddr4_sdram_075_adr),
    .ddr4_sdram_075_ba(ddr4_sdram_075_ba),
    .ddr4_sdram_075_bg(ddr4_sdram_075_bg),
    .ddr4_sdram_075_ck_c(ddr4_sdram_075_ck_c),
    .ddr4_sdram_075_ck_t(ddr4_sdram_075_ck_t),
    .ddr4_sdram_075_cke(ddr4_sdram_075_cke),
    .ddr4_sdram_075_cs_n(ddr4_sdram_075_cs_n),
    .ddr4_sdram_075_dm_n(ddr4_sdram_075_dm_n),
    .ddr4_sdram_075_dq(ddr4_sdram_075_dq),
    .ddr4_sdram_075_dqs_c(ddr4_sdram_075_dqs_c),
    .ddr4_sdram_075_dqs_t(ddr4_sdram_075_dqs_t),
    .ddr4_sdram_075_odt(ddr4_sdram_075_odt),
    .ddr4_sdram_075_reset_n(ddr4_sdram_075_reset_n),
    .mdio_mdc_mdc(mdio_mdc_mdc),
    .mdio_mdc_mdio_i(mdio_mdc_mdio_i),
    .mdio_mdc_mdio_o(mdio_mdc_mdio_o),
    .mdio_mdc_mdio_t(mdio_mdc_mdio_t),
    .sgmii_lvds_rxn(sgmii_lvds_rxn),
    .sgmii_lvds_rxp(sgmii_lvds_rxp),
    .sgmii_lvds_txn(sgmii_lvds_txn),
    .sgmii_lvds_txp(sgmii_lvds_txp),
    .sgmii_phyclk_clk_n(sgmii_phyclk_clk_n),
    .sgmii_phyclk_clk_p(sgmii_phyclk_clk_p),
    .reset(reset),
    .tmds_blue_p(tmds_blue_p),
    .tmds_blue_n(tmds_blue_n),
    .tmds_green_p(tmds_green_p),
    .tmds_green_n(tmds_green_n),
    .tmds_red_p(tmds_red_p),
    .tmds_red_n(tmds_red_n),
    .tmds_cl_p(tmds_cl_p),
    .tmds_cl_n(tmds_cl_n)
  );

endmodule
