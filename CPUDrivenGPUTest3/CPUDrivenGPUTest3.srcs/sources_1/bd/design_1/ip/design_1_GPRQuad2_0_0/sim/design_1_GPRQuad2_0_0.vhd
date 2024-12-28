-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:GPRQuad2:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_GPRQuad2_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    readQuadIndex : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    writeQuadIndex : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portA_en : IN STD_LOGIC;
    portA_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portA_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    portA_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portA_readOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    portB_en : IN STD_LOGIC;
    portB_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portB_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    portB_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portB_readOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    portW_en : IN STD_LOGIC;
    portW_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portW_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    portW_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    portW_writeInData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    clka_bram0 : OUT STD_LOGIC;
    addra_bram0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram0 : OUT STD_LOGIC;
    wea_bram0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram0 : OUT STD_LOGIC;
    addrb_bram0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram0 : OUT STD_LOGIC;
    doutb_bram0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram1 : OUT STD_LOGIC;
    addra_bram1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram1 : OUT STD_LOGIC;
    wea_bram1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram1 : OUT STD_LOGIC;
    addrb_bram1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram1 : OUT STD_LOGIC;
    doutb_bram1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram2 : OUT STD_LOGIC;
    addra_bram2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram2 : OUT STD_LOGIC;
    wea_bram2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram2 : OUT STD_LOGIC;
    addrb_bram2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram2 : OUT STD_LOGIC;
    doutb_bram2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram3 : OUT STD_LOGIC;
    addra_bram3 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram3 : OUT STD_LOGIC;
    wea_bram3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram3 : OUT STD_LOGIC;
    addrb_bram3 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram3 : OUT STD_LOGIC;
    doutb_bram3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram4 : OUT STD_LOGIC;
    addra_bram4 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram4 : OUT STD_LOGIC;
    wea_bram4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram4 : OUT STD_LOGIC;
    addrb_bram4 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram4 : OUT STD_LOGIC;
    doutb_bram4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram5 : OUT STD_LOGIC;
    addra_bram5 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram5 : OUT STD_LOGIC;
    wea_bram5 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram5 : OUT STD_LOGIC;
    addrb_bram5 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram5 : OUT STD_LOGIC;
    doutb_bram5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram6 : OUT STD_LOGIC;
    addra_bram6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram6 : OUT STD_LOGIC;
    wea_bram6 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram6 : OUT STD_LOGIC;
    addrb_bram6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram6 : OUT STD_LOGIC;
    doutb_bram6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    clka_bram7 : OUT STD_LOGIC;
    addra_bram7 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina_bram7 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ena_bram7 : OUT STD_LOGIC;
    wea_bram7 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb_bram7 : OUT STD_LOGIC;
    addrb_bram7 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    enb_bram7 : OUT STD_LOGIC;
    doutb_bram7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END design_1_GPRQuad2_0_0;

ARCHITECTURE design_1_GPRQuad2_0_0_arch OF design_1_GPRQuad2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_GPRQuad2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT GPRQuad2 IS
    PORT (
      clk : IN STD_LOGIC;
      readQuadIndex : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      writeQuadIndex : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portA_en : IN STD_LOGIC;
      portA_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portA_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      portA_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portA_readOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      portB_en : IN STD_LOGIC;
      portB_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portB_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      portB_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portB_readOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      portW_en : IN STD_LOGIC;
      portW_regType : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portW_regIdx : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      portW_regChan : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      portW_writeInData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      clka_bram0 : OUT STD_LOGIC;
      addra_bram0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram0 : OUT STD_LOGIC;
      wea_bram0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram0 : OUT STD_LOGIC;
      addrb_bram0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram0 : OUT STD_LOGIC;
      doutb_bram0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram1 : OUT STD_LOGIC;
      addra_bram1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram1 : OUT STD_LOGIC;
      wea_bram1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram1 : OUT STD_LOGIC;
      addrb_bram1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram1 : OUT STD_LOGIC;
      doutb_bram1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram2 : OUT STD_LOGIC;
      addra_bram2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram2 : OUT STD_LOGIC;
      wea_bram2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram2 : OUT STD_LOGIC;
      addrb_bram2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram2 : OUT STD_LOGIC;
      doutb_bram2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram3 : OUT STD_LOGIC;
      addra_bram3 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram3 : OUT STD_LOGIC;
      wea_bram3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram3 : OUT STD_LOGIC;
      addrb_bram3 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram3 : OUT STD_LOGIC;
      doutb_bram3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram4 : OUT STD_LOGIC;
      addra_bram4 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram4 : OUT STD_LOGIC;
      wea_bram4 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram4 : OUT STD_LOGIC;
      addrb_bram4 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram4 : OUT STD_LOGIC;
      doutb_bram4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram5 : OUT STD_LOGIC;
      addra_bram5 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram5 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram5 : OUT STD_LOGIC;
      wea_bram5 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram5 : OUT STD_LOGIC;
      addrb_bram5 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram5 : OUT STD_LOGIC;
      doutb_bram5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram6 : OUT STD_LOGIC;
      addra_bram6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram6 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram6 : OUT STD_LOGIC;
      wea_bram6 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram6 : OUT STD_LOGIC;
      addrb_bram6 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram6 : OUT STD_LOGIC;
      doutb_bram6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clka_bram7 : OUT STD_LOGIC;
      addra_bram7 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina_bram7 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ena_bram7 : OUT STD_LOGIC;
      wea_bram7 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      clkb_bram7 : OUT STD_LOGIC;
      addrb_bram7 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      enb_bram7 : OUT STD_LOGIC;
      doutb_bram7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT GPRQuad2;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram7: SIGNAL IS "XIL_INTERFACENAME BRAM7R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram7: SIGNAL IS "XIL_INTERFACENAME BRAM7W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram7: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM7W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram6: SIGNAL IS "XIL_INTERFACENAME BRAM6R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram6: SIGNAL IS "XIL_INTERFACENAME BRAM6W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram6: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM6W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram5: SIGNAL IS "XIL_INTERFACENAME BRAM5R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram5: SIGNAL IS "XIL_INTERFACENAME BRAM5W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram5: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM5W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram4: SIGNAL IS "XIL_INTERFACENAME BRAM4R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram4: SIGNAL IS "XIL_INTERFACENAME BRAM4W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram4: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM4W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram3: SIGNAL IS "XIL_INTERFACENAME BRAM3R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram3: SIGNAL IS "XIL_INTERFACENAME BRAM3W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram3: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM3W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram2: SIGNAL IS "XIL_INTERFACENAME BRAM2R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram2: SIGNAL IS "XIL_INTERFACENAME BRAM2W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram2: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM2W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram1: SIGNAL IS "XIL_INTERFACENAME BRAM1R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram1: SIGNAL IS "XIL_INTERFACENAME BRAM1W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram1: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM1W CLK";
  ATTRIBUTE X_INTERFACE_INFO OF doutb_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0R DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF enb_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0R EN";
  ATTRIBUTE X_INTERFACE_INFO OF addrb_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0R ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clkb_bram0: SIGNAL IS "XIL_INTERFACENAME BRAM0R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clkb_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0R CLK";
  ATTRIBUTE X_INTERFACE_INFO OF wea_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0W WE";
  ATTRIBUTE X_INTERFACE_INFO OF ena_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0W EN";
  ATTRIBUTE X_INTERFACE_INFO OF dina_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0W DIN";
  ATTRIBUTE X_INTERFACE_INFO OF addra_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0W ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clka_bram0: SIGNAL IS "XIL_INTERFACENAME BRAM0W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF clka_bram0: SIGNAL IS "xilinx.com:interface:bram:1.0 BRAM0W CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : GPRQuad2
    PORT MAP (
      clk => clk,
      readQuadIndex => readQuadIndex,
      writeQuadIndex => writeQuadIndex,
      portA_en => portA_en,
      portA_regType => portA_regType,
      portA_regIdx => portA_regIdx,
      portA_regChan => portA_regChan,
      portA_readOutData => portA_readOutData,
      portB_en => portB_en,
      portB_regType => portB_regType,
      portB_regIdx => portB_regIdx,
      portB_regChan => portB_regChan,
      portB_readOutData => portB_readOutData,
      portW_en => portW_en,
      portW_regType => portW_regType,
      portW_regIdx => portW_regIdx,
      portW_regChan => portW_regChan,
      portW_writeInData => portW_writeInData,
      clka_bram0 => clka_bram0,
      addra_bram0 => addra_bram0,
      dina_bram0 => dina_bram0,
      ena_bram0 => ena_bram0,
      wea_bram0 => wea_bram0,
      clkb_bram0 => clkb_bram0,
      addrb_bram0 => addrb_bram0,
      enb_bram0 => enb_bram0,
      doutb_bram0 => doutb_bram0,
      clka_bram1 => clka_bram1,
      addra_bram1 => addra_bram1,
      dina_bram1 => dina_bram1,
      ena_bram1 => ena_bram1,
      wea_bram1 => wea_bram1,
      clkb_bram1 => clkb_bram1,
      addrb_bram1 => addrb_bram1,
      enb_bram1 => enb_bram1,
      doutb_bram1 => doutb_bram1,
      clka_bram2 => clka_bram2,
      addra_bram2 => addra_bram2,
      dina_bram2 => dina_bram2,
      ena_bram2 => ena_bram2,
      wea_bram2 => wea_bram2,
      clkb_bram2 => clkb_bram2,
      addrb_bram2 => addrb_bram2,
      enb_bram2 => enb_bram2,
      doutb_bram2 => doutb_bram2,
      clka_bram3 => clka_bram3,
      addra_bram3 => addra_bram3,
      dina_bram3 => dina_bram3,
      ena_bram3 => ena_bram3,
      wea_bram3 => wea_bram3,
      clkb_bram3 => clkb_bram3,
      addrb_bram3 => addrb_bram3,
      enb_bram3 => enb_bram3,
      doutb_bram3 => doutb_bram3,
      clka_bram4 => clka_bram4,
      addra_bram4 => addra_bram4,
      dina_bram4 => dina_bram4,
      ena_bram4 => ena_bram4,
      wea_bram4 => wea_bram4,
      clkb_bram4 => clkb_bram4,
      addrb_bram4 => addrb_bram4,
      enb_bram4 => enb_bram4,
      doutb_bram4 => doutb_bram4,
      clka_bram5 => clka_bram5,
      addra_bram5 => addra_bram5,
      dina_bram5 => dina_bram5,
      ena_bram5 => ena_bram5,
      wea_bram5 => wea_bram5,
      clkb_bram5 => clkb_bram5,
      addrb_bram5 => addrb_bram5,
      enb_bram5 => enb_bram5,
      doutb_bram5 => doutb_bram5,
      clka_bram6 => clka_bram6,
      addra_bram6 => addra_bram6,
      dina_bram6 => dina_bram6,
      ena_bram6 => ena_bram6,
      wea_bram6 => wea_bram6,
      clkb_bram6 => clkb_bram6,
      addrb_bram6 => addrb_bram6,
      enb_bram6 => enb_bram6,
      doutb_bram6 => doutb_bram6,
      clka_bram7 => clka_bram7,
      addra_bram7 => addra_bram7,
      dina_bram7 => dina_bram7,
      ena_bram7 => ena_bram7,
      wea_bram7 => wea_bram7,
      clkb_bram7 => clkb_bram7,
      addrb_bram7 => addrb_bram7,
      enb_bram7 => enb_bram7,
      doutb_bram7 => doutb_bram7
    );
END design_1_GPRQuad2_0_0_arch;
