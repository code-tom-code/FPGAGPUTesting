--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Mon May 15 20:24:27 2023
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
    ddr4_sdram_c1_act_n : out STD_LOGIC;
    ddr4_sdram_c1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_c1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_c1_bg : out STD_LOGIC;
    ddr4_sdram_c1_ck_c : out STD_LOGIC;
    ddr4_sdram_c1_ck_t : out STD_LOGIC;
    ddr4_sdram_c1_cke : out STD_LOGIC;
    ddr4_sdram_c1_cs_n : out STD_LOGIC;
    ddr4_sdram_c1_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_c1_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_odt : out STD_LOGIC;
    ddr4_sdram_c1_reset_n : out STD_LOGIC;
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    reset : in STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    tmds_blue_n : out STD_LOGIC;
    tmds_blue_p : out STD_LOGIC;
    tmds_cl_n : out STD_LOGIC;
    tmds_cl_p : out STD_LOGIC;
    tmds_green_n : out STD_LOGIC;
    tmds_green_p : out STD_LOGIC;
    tmds_red_n : out STD_LOGIC;
    tmds_red_p : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    reset : in STD_LOGIC;
    tmds_blue_p : out STD_LOGIC;
    tmds_blue_n : out STD_LOGIC;
    tmds_green_p : out STD_LOGIC;
    tmds_green_n : out STD_LOGIC;
    tmds_red_p : out STD_LOGIC;
    tmds_red_n : out STD_LOGIC;
    tmds_cl_p : out STD_LOGIC;
    tmds_cl_n : out STD_LOGIC;
    rs232_uart_rxd : in STD_LOGIC;
    rs232_uart_txd : out STD_LOGIC;
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    ddr4_sdram_c1_act_n : out STD_LOGIC;
    ddr4_sdram_c1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_c1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_c1_bg : out STD_LOGIC;
    ddr4_sdram_c1_ck_c : out STD_LOGIC;
    ddr4_sdram_c1_ck_t : out STD_LOGIC;
    ddr4_sdram_c1_cke : out STD_LOGIC;
    ddr4_sdram_c1_cs_n : out STD_LOGIC;
    ddr4_sdram_c1_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_c1_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_odt : out STD_LOGIC;
    ddr4_sdram_c1_reset_n : out STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      ddr4_sdram_c1_act_n => ddr4_sdram_c1_act_n,
      ddr4_sdram_c1_adr(16 downto 0) => ddr4_sdram_c1_adr(16 downto 0),
      ddr4_sdram_c1_ba(1 downto 0) => ddr4_sdram_c1_ba(1 downto 0),
      ddr4_sdram_c1_bg => ddr4_sdram_c1_bg,
      ddr4_sdram_c1_ck_c => ddr4_sdram_c1_ck_c,
      ddr4_sdram_c1_ck_t => ddr4_sdram_c1_ck_t,
      ddr4_sdram_c1_cke => ddr4_sdram_c1_cke,
      ddr4_sdram_c1_cs_n => ddr4_sdram_c1_cs_n,
      ddr4_sdram_c1_dm_n(3 downto 0) => ddr4_sdram_c1_dm_n(3 downto 0),
      ddr4_sdram_c1_dq(31 downto 0) => ddr4_sdram_c1_dq(31 downto 0),
      ddr4_sdram_c1_dqs_c(3 downto 0) => ddr4_sdram_c1_dqs_c(3 downto 0),
      ddr4_sdram_c1_dqs_t(3 downto 0) => ddr4_sdram_c1_dqs_t(3 downto 0),
      ddr4_sdram_c1_odt => ddr4_sdram_c1_odt,
      ddr4_sdram_c1_reset_n => ddr4_sdram_c1_reset_n,
      default_sysclk1_300_clk_n => default_sysclk1_300_clk_n,
      default_sysclk1_300_clk_p => default_sysclk1_300_clk_p,
      reset => reset,
      rs232_uart_rxd => rs232_uart_rxd,
      rs232_uart_txd => rs232_uart_txd,
      tmds_blue_n => tmds_blue_n,
      tmds_blue_p => tmds_blue_p,
      tmds_cl_n => tmds_cl_n,
      tmds_cl_p => tmds_cl_p,
      tmds_green_n => tmds_green_n,
      tmds_green_p => tmds_green_p,
      tmds_red_n => tmds_red_n,
      tmds_red_p => tmds_red_p
    );
end STRUCTURE;
