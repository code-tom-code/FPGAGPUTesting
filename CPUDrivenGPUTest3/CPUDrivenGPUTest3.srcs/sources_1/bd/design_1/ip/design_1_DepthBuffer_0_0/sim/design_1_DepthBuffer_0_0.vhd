-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:DepthBuffer:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_DepthBuffer_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    RAST_PixelReady : IN STD_LOGIC;
    RAST_PosX : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    RAST_PosY : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    RAST_InPixelDepth : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    RAST_SetDepthParams : IN STD_LOGIC;
    RAST_DepthWriteEnable : IN STD_LOGIC;
    RAST_DepthFunction : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    RAST_DepthIsIdle : OUT STD_LOGIC;
    RAST_StencilWriteEnable : IN STD_LOGIC;
    RAST_StencilRefVal : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    RAST_StencilReadMask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    RAST_StencilWriteMask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    RAST_StencilCmpFunc : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    RAST_StencilFailOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    RAST_StencilZFailOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    RAST_StencilPassOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    RAST_PixelPassedDepthStencilTest : OUT STD_LOGIC;
    RAST_PixelFailedDepthTest : OUT STD_LOGIC;
    RAST_PixelFailedStencilTest : OUT STD_LOGIC;
    URAM_addra : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    URAM_clka : OUT STD_LOGIC;
    URAM_dina : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    URAM_ena : OUT STD_LOGIC;
    URAM_wea : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    URAM_addrb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    URAM_clkb : OUT STD_LOGIC;
    URAM_doutb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    URAM_enb : OUT STD_LOGIC;
    CMD_ClearDepthBuffer : IN STD_LOGIC;
    CMD_ClearStencilBuffer : IN STD_LOGIC;
    CMD_ClearDepthValue : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    CMD_ClearStencilValue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    CMD_DepthIsIdle : OUT STD_LOGIC;
    STAT_PixelsPassedDepthStencilTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_PixelsFailedDepthTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_PixelsFailedStencilTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END design_1_DepthBuffer_0_0;

ARCHITECTURE design_1_DepthBuffer_0_0_arch OF design_1_DepthBuffer_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_DepthBuffer_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT DepthBuffer IS
    GENERIC (
      NUM_PIPELINE_STAGES : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      RAST_PixelReady : IN STD_LOGIC;
      RAST_PosX : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      RAST_PosY : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      RAST_InPixelDepth : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      RAST_SetDepthParams : IN STD_LOGIC;
      RAST_DepthWriteEnable : IN STD_LOGIC;
      RAST_DepthFunction : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      RAST_DepthIsIdle : OUT STD_LOGIC;
      RAST_StencilWriteEnable : IN STD_LOGIC;
      RAST_StencilRefVal : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      RAST_StencilReadMask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      RAST_StencilWriteMask : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      RAST_StencilCmpFunc : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      RAST_StencilFailOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      RAST_StencilZFailOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      RAST_StencilPassOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      RAST_PixelPassedDepthStencilTest : OUT STD_LOGIC;
      RAST_PixelFailedDepthTest : OUT STD_LOGIC;
      RAST_PixelFailedStencilTest : OUT STD_LOGIC;
      URAM_addra : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      URAM_clka : OUT STD_LOGIC;
      URAM_dina : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      URAM_ena : OUT STD_LOGIC;
      URAM_wea : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      URAM_addrb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
      URAM_clkb : OUT STD_LOGIC;
      URAM_doutb : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      URAM_enb : OUT STD_LOGIC;
      CMD_ClearDepthBuffer : IN STD_LOGIC;
      CMD_ClearStencilBuffer : IN STD_LOGIC;
      CMD_ClearDepthValue : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      CMD_ClearStencilValue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      CMD_DepthIsIdle : OUT STD_LOGIC;
      STAT_PixelsPassedDepthStencilTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_PixelsFailedDepthTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_PixelsFailedStencilTest : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT DepthBuffer;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF URAM_enb: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMR EN";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_doutb: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_clkb: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMR CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF URAM_addrb: SIGNAL IS "XIL_INTERFACENAME DBufferRAMR, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_addrb: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMW EN";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_clka: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMW CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF URAM_addra: SIGNAL IS "XIL_INTERFACENAME DBufferRAMW, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF URAM_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : DepthBuffer
    GENERIC MAP (
      NUM_PIPELINE_STAGES => 4
    )
    PORT MAP (
      clk => clk,
      RAST_PixelReady => RAST_PixelReady,
      RAST_PosX => RAST_PosX,
      RAST_PosY => RAST_PosY,
      RAST_InPixelDepth => RAST_InPixelDepth,
      RAST_SetDepthParams => RAST_SetDepthParams,
      RAST_DepthWriteEnable => RAST_DepthWriteEnable,
      RAST_DepthFunction => RAST_DepthFunction,
      RAST_DepthIsIdle => RAST_DepthIsIdle,
      RAST_StencilWriteEnable => RAST_StencilWriteEnable,
      RAST_StencilRefVal => RAST_StencilRefVal,
      RAST_StencilReadMask => RAST_StencilReadMask,
      RAST_StencilWriteMask => RAST_StencilWriteMask,
      RAST_StencilCmpFunc => RAST_StencilCmpFunc,
      RAST_StencilFailOp => RAST_StencilFailOp,
      RAST_StencilZFailOp => RAST_StencilZFailOp,
      RAST_StencilPassOp => RAST_StencilPassOp,
      RAST_PixelPassedDepthStencilTest => RAST_PixelPassedDepthStencilTest,
      RAST_PixelFailedDepthTest => RAST_PixelFailedDepthTest,
      RAST_PixelFailedStencilTest => RAST_PixelFailedStencilTest,
      URAM_addra => URAM_addra,
      URAM_clka => URAM_clka,
      URAM_dina => URAM_dina,
      URAM_ena => URAM_ena,
      URAM_wea => URAM_wea,
      URAM_addrb => URAM_addrb,
      URAM_clkb => URAM_clkb,
      URAM_doutb => URAM_doutb,
      URAM_enb => URAM_enb,
      CMD_ClearDepthBuffer => CMD_ClearDepthBuffer,
      CMD_ClearStencilBuffer => CMD_ClearStencilBuffer,
      CMD_ClearDepthValue => CMD_ClearDepthValue,
      CMD_ClearStencilValue => CMD_ClearStencilValue,
      CMD_DepthIsIdle => CMD_DepthIsIdle,
      STAT_PixelsPassedDepthStencilTest => STAT_PixelsPassedDepthStencilTest,
      STAT_PixelsFailedDepthTest => STAT_PixelsFailedDepthTest,
      STAT_PixelsFailedStencilTest => STAT_PixelsFailedStencilTest
    );
END design_1_DepthBuffer_0_0_arch;
