-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- -------------------------------------------------------------------------------
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- MODULE VLNV: amd.com:blockdesign:MainDesign:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT MainDesign
  PORT (
    default_sysclk1_300_clk_n : IN STD_LOGIC;
    default_sysclk1_300_clk_p : IN STD_LOGIC;
    ddr4_sdram_075_act_n : OUT STD_LOGIC;
    ddr4_sdram_075_adr : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    ddr4_sdram_075_ba : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ddr4_sdram_075_bg : OUT STD_LOGIC;
    ddr4_sdram_075_ck_c : OUT STD_LOGIC;
    ddr4_sdram_075_ck_t : OUT STD_LOGIC;
    ddr4_sdram_075_cke : OUT STD_LOGIC;
    ddr4_sdram_075_cs_n : OUT STD_LOGIC;
    ddr4_sdram_075_dm_n : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ddr4_sdram_075_dq : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ddr4_sdram_075_dqs_c : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ddr4_sdram_075_dqs_t : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ddr4_sdram_075_odt : OUT STD_LOGIC;
    ddr4_sdram_075_reset_n : OUT STD_LOGIC;
    mdio_mdc_mdc : OUT STD_LOGIC;
    mdio_mdc_mdio_i : IN STD_LOGIC;
    mdio_mdc_mdio_o : OUT STD_LOGIC;
    mdio_mdc_mdio_t : OUT STD_LOGIC;
    sgmii_lvds_rxn : IN STD_LOGIC;
    sgmii_lvds_rxp : IN STD_LOGIC;
    sgmii_lvds_txn : OUT STD_LOGIC;
    sgmii_lvds_txp : OUT STD_LOGIC;
    sgmii_phyclk_clk_n : IN STD_LOGIC;
    sgmii_phyclk_clk_p : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    tmds_blue_p : OUT STD_LOGIC;
    tmds_blue_n : OUT STD_LOGIC;
    tmds_green_p : OUT STD_LOGIC;
    tmds_green_n : OUT STD_LOGIC;
    tmds_red_p : OUT STD_LOGIC;
    tmds_red_n : OUT STD_LOGIC;
    tmds_cl_p : OUT STD_LOGIC;
    tmds_cl_n : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : MainDesign
  PORT MAP (
    default_sysclk1_300_clk_n => default_sysclk1_300_clk_n,
    default_sysclk1_300_clk_p => default_sysclk1_300_clk_p,
    ddr4_sdram_075_act_n => ddr4_sdram_075_act_n,
    ddr4_sdram_075_adr => ddr4_sdram_075_adr,
    ddr4_sdram_075_ba => ddr4_sdram_075_ba,
    ddr4_sdram_075_bg => ddr4_sdram_075_bg,
    ddr4_sdram_075_ck_c => ddr4_sdram_075_ck_c,
    ddr4_sdram_075_ck_t => ddr4_sdram_075_ck_t,
    ddr4_sdram_075_cke => ddr4_sdram_075_cke,
    ddr4_sdram_075_cs_n => ddr4_sdram_075_cs_n,
    ddr4_sdram_075_dm_n => ddr4_sdram_075_dm_n,
    ddr4_sdram_075_dq => ddr4_sdram_075_dq,
    ddr4_sdram_075_dqs_c => ddr4_sdram_075_dqs_c,
    ddr4_sdram_075_dqs_t => ddr4_sdram_075_dqs_t,
    ddr4_sdram_075_odt => ddr4_sdram_075_odt,
    ddr4_sdram_075_reset_n => ddr4_sdram_075_reset_n,
    mdio_mdc_mdc => mdio_mdc_mdc,
    mdio_mdc_mdio_i => mdio_mdc_mdio_i,
    mdio_mdc_mdio_o => mdio_mdc_mdio_o,
    mdio_mdc_mdio_t => mdio_mdc_mdio_t,
    sgmii_lvds_rxn => sgmii_lvds_rxn,
    sgmii_lvds_rxp => sgmii_lvds_rxp,
    sgmii_lvds_txn => sgmii_lvds_txn,
    sgmii_lvds_txp => sgmii_lvds_txp,
    sgmii_phyclk_clk_n => sgmii_phyclk_clk_n,
    sgmii_phyclk_clk_p => sgmii_phyclk_clk_p,
    reset => reset,
    tmds_blue_p => tmds_blue_p,
    tmds_blue_n => tmds_blue_n,
    tmds_green_p => tmds_green_p,
    tmds_green_n => tmds_green_n,
    tmds_red_p => tmds_red_p,
    tmds_red_n => tmds_red_n,
    tmds_cl_p => tmds_cl_p,
    tmds_cl_n => tmds_cl_n
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file MainDesign.vhd when simulating
-- the module, MainDesign. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
