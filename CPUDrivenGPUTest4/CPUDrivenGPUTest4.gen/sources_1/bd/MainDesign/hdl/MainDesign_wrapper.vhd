--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
--Date        : Tue Dec 23 19:01:31 2025
--Host        : TomTop3 running 64-bit major release  (build 9200)
--Command     : generate_target MainDesign_wrapper.bd
--Design      : MainDesign_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_wrapper is
  port (
    ddr4_sdram_075_act_n : out STD_LOGIC;
    ddr4_sdram_075_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_075_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_075_bg : out STD_LOGIC;
    ddr4_sdram_075_ck_c : out STD_LOGIC;
    ddr4_sdram_075_ck_t : out STD_LOGIC;
    ddr4_sdram_075_cke : out STD_LOGIC;
    ddr4_sdram_075_cs_n : out STD_LOGIC;
    ddr4_sdram_075_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_075_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_odt : out STD_LOGIC;
    ddr4_sdram_075_reset_n : out STD_LOGIC;
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    mdio_mdc_mdc : out STD_LOGIC;
    mdio_mdc_mdio_io : inout STD_LOGIC;
    reset : in STD_LOGIC;
    sgmii_lvds_rxn : in STD_LOGIC;
    sgmii_lvds_rxp : in STD_LOGIC;
    sgmii_lvds_txn : out STD_LOGIC;
    sgmii_lvds_txp : out STD_LOGIC;
    sgmii_phyclk_clk_n : in STD_LOGIC;
    sgmii_phyclk_clk_p : in STD_LOGIC;
    tmds_blue_n : out STD_LOGIC;
    tmds_blue_p : out STD_LOGIC;
    tmds_cl_n : out STD_LOGIC;
    tmds_cl_p : out STD_LOGIC;
    tmds_green_n : out STD_LOGIC;
    tmds_green_p : out STD_LOGIC;
    tmds_red_n : out STD_LOGIC;
    tmds_red_p : out STD_LOGIC
  );
end MainDesign_wrapper;

architecture STRUCTURE of MainDesign_wrapper is
  component MainDesign is
  port (
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    ddr4_sdram_075_act_n : out STD_LOGIC;
    ddr4_sdram_075_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_075_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_075_bg : out STD_LOGIC;
    ddr4_sdram_075_ck_c : out STD_LOGIC;
    ddr4_sdram_075_ck_t : out STD_LOGIC;
    ddr4_sdram_075_cke : out STD_LOGIC;
    ddr4_sdram_075_cs_n : out STD_LOGIC;
    ddr4_sdram_075_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_075_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_075_odt : out STD_LOGIC;
    ddr4_sdram_075_reset_n : out STD_LOGIC;
    mdio_mdc_mdc : out STD_LOGIC;
    mdio_mdc_mdio_i : in STD_LOGIC;
    mdio_mdc_mdio_o : out STD_LOGIC;
    mdio_mdc_mdio_t : out STD_LOGIC;
    sgmii_lvds_rxn : in STD_LOGIC;
    sgmii_lvds_rxp : in STD_LOGIC;
    sgmii_lvds_txn : out STD_LOGIC;
    sgmii_lvds_txp : out STD_LOGIC;
    sgmii_phyclk_clk_n : in STD_LOGIC;
    sgmii_phyclk_clk_p : in STD_LOGIC;
    reset : in STD_LOGIC;
    tmds_blue_p : out STD_LOGIC;
    tmds_blue_n : out STD_LOGIC;
    tmds_green_p : out STD_LOGIC;
    tmds_green_n : out STD_LOGIC;
    tmds_red_p : out STD_LOGIC;
    tmds_red_n : out STD_LOGIC;
    tmds_cl_p : out STD_LOGIC;
    tmds_cl_n : out STD_LOGIC
  );
  end component MainDesign;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal mdio_mdc_mdio_i : STD_LOGIC;
  signal mdio_mdc_mdio_o : STD_LOGIC;
  signal mdio_mdc_mdio_t : STD_LOGIC;
begin
MainDesign_i: component MainDesign
     port map (
      ddr4_sdram_075_act_n => ddr4_sdram_075_act_n,
      ddr4_sdram_075_adr(16 downto 0) => ddr4_sdram_075_adr(16 downto 0),
      ddr4_sdram_075_ba(1 downto 0) => ddr4_sdram_075_ba(1 downto 0),
      ddr4_sdram_075_bg => ddr4_sdram_075_bg,
      ddr4_sdram_075_ck_c => ddr4_sdram_075_ck_c,
      ddr4_sdram_075_ck_t => ddr4_sdram_075_ck_t,
      ddr4_sdram_075_cke => ddr4_sdram_075_cke,
      ddr4_sdram_075_cs_n => ddr4_sdram_075_cs_n,
      ddr4_sdram_075_dm_n(3 downto 0) => ddr4_sdram_075_dm_n(3 downto 0),
      ddr4_sdram_075_dq(31 downto 0) => ddr4_sdram_075_dq(31 downto 0),
      ddr4_sdram_075_dqs_c(3 downto 0) => ddr4_sdram_075_dqs_c(3 downto 0),
      ddr4_sdram_075_dqs_t(3 downto 0) => ddr4_sdram_075_dqs_t(3 downto 0),
      ddr4_sdram_075_odt => ddr4_sdram_075_odt,
      ddr4_sdram_075_reset_n => ddr4_sdram_075_reset_n,
      default_sysclk1_300_clk_n => default_sysclk1_300_clk_n,
      default_sysclk1_300_clk_p => default_sysclk1_300_clk_p,
      mdio_mdc_mdc => mdio_mdc_mdc,
      mdio_mdc_mdio_i => mdio_mdc_mdio_i,
      mdio_mdc_mdio_o => mdio_mdc_mdio_o,
      mdio_mdc_mdio_t => mdio_mdc_mdio_t,
      reset => reset,
      sgmii_lvds_rxn => sgmii_lvds_rxn,
      sgmii_lvds_rxp => sgmii_lvds_rxp,
      sgmii_lvds_txn => sgmii_lvds_txn,
      sgmii_lvds_txp => sgmii_lvds_txp,
      sgmii_phyclk_clk_n => sgmii_phyclk_clk_n,
      sgmii_phyclk_clk_p => sgmii_phyclk_clk_p,
      tmds_blue_n => tmds_blue_n,
      tmds_blue_p => tmds_blue_p,
      tmds_cl_n => tmds_cl_n,
      tmds_cl_p => tmds_cl_p,
      tmds_green_n => tmds_green_n,
      tmds_green_p => tmds_green_p,
      tmds_red_n => tmds_red_n,
      tmds_red_p => tmds_red_p
    );
mdio_mdc_mdio_iobuf: component IOBUF
     port map (
      I => mdio_mdc_mdio_o,
      IO => mdio_mdc_mdio_io,
      O => mdio_mdc_mdio_i,
      T => mdio_mdc_mdio_t
    );
end STRUCTURE;
