-- (c) Copyright 1995-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ila_0_1 IS
PORT (
clk : IN STD_LOGIC;


probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe8 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe9 : IN STD_LOGIC_VECTOR(319 DOWNTO 0);
    probe10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe11 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe12 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe13 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    probe14 : IN STD_LOGIC_VECTOR(543 DOWNTO 0);
    probe15 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe16 : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    probe17 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe18 : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
    probe19 : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    probe20 : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    probe21 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe22 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe23 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe24 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe25 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    probe26 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe27 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    probe28 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe29 : IN STD_LOGIC_VECTOR(271 DOWNTO 0);
    probe30 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe31 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    probe32 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    probe33 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    probe34 : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    probe35 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe36 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe37 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe38 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe39 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe40 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe41 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe42 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe43 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe44 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe45 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe46 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe47 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe48 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe49 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe50 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe51 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe52 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe53 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe54 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe55 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    probe56 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe57 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    probe58 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe59 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe60 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    probe61 : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    probe62 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe63 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END design_1_ila_0_1;

ARCHITECTURE design_1_ila_0_1_arch OF design_1_ila_0_1 IS
BEGIN
END design_1_ila_0_1_arch;
