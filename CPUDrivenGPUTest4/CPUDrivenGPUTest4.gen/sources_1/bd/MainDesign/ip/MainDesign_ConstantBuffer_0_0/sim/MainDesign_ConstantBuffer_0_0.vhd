-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
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

-- IP VLNV: xilinx.com:module_ref:ConstantBuffer:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_ConstantBuffer_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    writeMode : IN STD_LOGIC;
    regIndex : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    regComponent : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    readOutData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    writeInData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ConstBufferBRAM_addra : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    ConstBufferBRAM_clka : OUT STD_LOGIC;
    ConstBufferBRAM_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ConstBufferBRAM_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ConstBufferBRAM_ena : OUT STD_LOGIC;
    ConstBufferBRAM_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END MainDesign_ConstantBuffer_0_0;

ARCHITECTURE MainDesign_ConstantBuffer_0_0_arch OF MainDesign_ConstantBuffer_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_ConstantBuffer_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ConstantBuffer IS
    PORT (
      clk : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      writeMode : IN STD_LOGIC;
      regIndex : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      regComponent : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      readOutData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      writeInData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ConstBufferBRAM_addra : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      ConstBufferBRAM_clka : OUT STD_LOGIC;
      ConstBufferBRAM_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ConstBufferBRAM_douta : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ConstBufferBRAM_ena : OUT STD_LOGIC;
      ConstBufferBRAM_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT ConstantBuffer;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR";
  ATTRIBUTE X_INTERFACE_MODE OF ConstBufferBRAM_addra: SIGNAL IS "master ConstBufferBRAM";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ConstBufferBRAM_addra: SIGNAL IS "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_clka: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN";
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_douta: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN";
  ATTRIBUTE X_INTERFACE_INFO OF ConstBufferBRAM_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk: SIGNAL IS "slave clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ConstBufferBRAM, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
BEGIN
  U0 : ConstantBuffer
    PORT MAP (
      clk => clk,
      enable => enable,
      writeMode => writeMode,
      regIndex => regIndex,
      regComponent => regComponent,
      readOutData => readOutData,
      writeInData => writeInData,
      ConstBufferBRAM_addra => ConstBufferBRAM_addra,
      ConstBufferBRAM_clka => ConstBufferBRAM_clka,
      ConstBufferBRAM_dina => ConstBufferBRAM_dina,
      ConstBufferBRAM_douta => ConstBufferBRAM_douta,
      ConstBufferBRAM_ena => ConstBufferBRAM_ena,
      ConstBufferBRAM_wea => ConstBufferBRAM_wea
    );
END MainDesign_ConstantBuffer_0_0_arch;
