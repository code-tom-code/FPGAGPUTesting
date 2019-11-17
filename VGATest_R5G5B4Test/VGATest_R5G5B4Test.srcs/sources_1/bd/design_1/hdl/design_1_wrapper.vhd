--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Fri Jul 26 01:39:13 2019
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
    hsync : out STD_LOGIC;
    port_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    port_g : out STD_LOGIC_VECTOR ( 4 downto 0 );
    port_r : out STD_LOGIC_VECTOR ( 4 downto 0 );
    vsync : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    port_r : out STD_LOGIC_VECTOR ( 4 downto 0 );
    port_g : out STD_LOGIC_VECTOR ( 4 downto 0 );
    port_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    vsync : out STD_LOGIC;
    hsync : out STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      default_sysclk1_300_clk_n => default_sysclk1_300_clk_n,
      default_sysclk1_300_clk_p => default_sysclk1_300_clk_p,
      hsync => hsync,
      port_b(3 downto 0) => port_b(3 downto 0),
      port_g(4 downto 0) => port_g(4 downto 0),
      port_r(4 downto 0) => port_r(4 downto 0),
      vsync => vsync
    );
end STRUCTURE;
