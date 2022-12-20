--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Mon Dec 19 23:35:29 2022
--Host        : Dragon2 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    mdio_mdc_mdc : out STD_LOGIC;
    mdio_mdc_mdio_io : inout STD_LOGIC;
    sgmii_lvds_rxn : in STD_LOGIC;
    sgmii_lvds_rxp : in STD_LOGIC;
    sgmii_lvds_txn : out STD_LOGIC;
    sgmii_lvds_txp : out STD_LOGIC;
    sgmii_phyclk_clk_n : in STD_LOGIC;
    sgmii_phyclk_clk_p : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
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
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC
  );
  end component design_1;
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
design_1_i: component design_1
     port map (
      default_sysclk1_300_clk_n => default_sysclk1_300_clk_n,
      default_sysclk1_300_clk_p => default_sysclk1_300_clk_p,
      mdio_mdc_mdc => mdio_mdc_mdc,
      mdio_mdc_mdio_i => mdio_mdc_mdio_i,
      mdio_mdc_mdio_o => mdio_mdc_mdio_o,
      mdio_mdc_mdio_t => mdio_mdc_mdio_t,
      sgmii_lvds_rxn => sgmii_lvds_rxn,
      sgmii_lvds_rxp => sgmii_lvds_rxp,
      sgmii_lvds_txn => sgmii_lvds_txn,
      sgmii_lvds_txp => sgmii_lvds_txp,
      sgmii_phyclk_clk_n => sgmii_phyclk_clk_n,
      sgmii_phyclk_clk_p => sgmii_phyclk_clk_p
    );
mdio_mdc_mdio_iobuf: component IOBUF
     port map (
      I => mdio_mdc_mdio_o,
      IO => mdio_mdc_mdio_io,
      O => mdio_mdc_mdio_i,
      T => mdio_mdc_mdio_t
    );
end STRUCTURE;
