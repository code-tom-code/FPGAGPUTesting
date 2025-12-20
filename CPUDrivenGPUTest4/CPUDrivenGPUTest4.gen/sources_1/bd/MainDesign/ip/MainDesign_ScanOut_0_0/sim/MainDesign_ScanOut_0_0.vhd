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

-- IP VLNV: xilinx.com:module_ref:ScanOut:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_ScanOut_0_0 IS
  PORT (
    clk_x10 : IN STD_LOGIC;
    pixelClk : OUT STD_LOGIC;
    CMD_BaseRenderTargetAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_ScanoutEnable : IN STD_LOGIC;
    CMD_InvertOutputColor : IN STD_LOGIC;
    CMD_OutputColorChannels : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    outXCoord : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    outYCoord : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    MEM_ScanoutReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    MEM_ScanoutReadRequestsFIFO_full : IN STD_LOGIC;
    MEM_ScanoutReadRequestsFIFO_wr_en : OUT STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    MEM_ScanoutReadResponsesFIFO_empty : IN STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_almost_empty : IN STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_en : OUT STD_LOGIC;
    VSyncActivePolarity : IN STD_LOGIC;
    HSyncActivePolarity : IN STD_LOGIC;
    out_scanout_enable : OUT STD_LOGIC;
    vsync : OUT STD_LOGIC;
    hsync : OUT STD_LOGIC;
    blank : OUT STD_LOGIC;
    outR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    outG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    outB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    guardBandEnable : OUT STD_LOGIC;
    guardBandType : OUT STD_LOGIC;
    controlChannel0Blue : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    controlChannel1Green : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    controlChannel2Red : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    isTERC4Region : OUT STD_LOGIC;
    TERC4Character0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    TERC4Character1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    TERC4Character2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_ScanoutLoadProcess_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_InternalScanX : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    DBG_InternalScanY : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
  );
END MainDesign_ScanOut_0_0;

ARCHITECTURE MainDesign_ScanOut_0_0_arch OF MainDesign_ScanOut_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_ScanOut_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ScanOut IS
    GENERIC (
      Use_HDMI : BOOLEAN
    );
    PORT (
      clk_x10 : IN STD_LOGIC;
      pixelClk : OUT STD_LOGIC;
      CMD_BaseRenderTargetAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_ScanoutEnable : IN STD_LOGIC;
      CMD_InvertOutputColor : IN STD_LOGIC;
      CMD_OutputColorChannels : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      outXCoord : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      outYCoord : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      MEM_ScanoutReadRequestsFIFO_wr_data : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      MEM_ScanoutReadRequestsFIFO_full : IN STD_LOGIC;
      MEM_ScanoutReadRequestsFIFO_wr_en : OUT STD_LOGIC;
      MEM_ScanoutReadResponsesFIFO_rd_data : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
      MEM_ScanoutReadResponsesFIFO_empty : IN STD_LOGIC;
      MEM_ScanoutReadResponsesFIFO_almost_empty : IN STD_LOGIC;
      MEM_ScanoutReadResponsesFIFO_rd_en : OUT STD_LOGIC;
      VSyncActivePolarity : IN STD_LOGIC;
      HSyncActivePolarity : IN STD_LOGIC;
      out_scanout_enable : OUT STD_LOGIC;
      vsync : OUT STD_LOGIC;
      hsync : OUT STD_LOGIC;
      blank : OUT STD_LOGIC;
      outR : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      outG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      outB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      guardBandEnable : OUT STD_LOGIC;
      guardBandType : OUT STD_LOGIC;
      controlChannel0Blue : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      controlChannel1Green : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      controlChannel2Red : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      isTERC4Region : OUT STD_LOGIC;
      TERC4Character0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      TERC4Character1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      TERC4Character2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_ScanoutLoadProcess_State : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_InternalScanX : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      DBG_InternalScanY : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
  END COMPONENT ScanOut;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadRequestsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadRequestsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF MEM_ScanoutReadRequestsFIFO_wr_data: SIGNAL IS "master ScanoutReadRequestsFIFO";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadRequestsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadResponsesFIFO_almost_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses ALMOST_EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadResponsesFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadResponsesFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF MEM_ScanoutReadResponsesFIFO_rd_data: SIGNAL IS "master ScanoutReadResponses";
  ATTRIBUTE X_INTERFACE_INFO OF MEM_ScanoutReadResponsesFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF clk_x10: SIGNAL IS "xilinx.com:signal:clock:1.0 clk_x10 CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk_x10: SIGNAL IS "slave clk_x10";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk_x10: SIGNAL IS "XIL_INTERFACENAME clk_x10, FREQ_HZ 251750000, ASSOCIATED_BUSIF ScanoutReadRequestsFIFO:ScanoutReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0";
BEGIN
  U0 : ScanOut
    GENERIC MAP (
      Use_HDMI => true
    )
    PORT MAP (
      clk_x10 => clk_x10,
      pixelClk => pixelClk,
      CMD_BaseRenderTargetAddr => CMD_BaseRenderTargetAddr,
      CMD_ScanoutEnable => CMD_ScanoutEnable,
      CMD_InvertOutputColor => CMD_InvertOutputColor,
      CMD_OutputColorChannels => CMD_OutputColorChannels,
      outXCoord => outXCoord,
      outYCoord => outYCoord,
      MEM_ScanoutReadRequestsFIFO_wr_data => MEM_ScanoutReadRequestsFIFO_wr_data,
      MEM_ScanoutReadRequestsFIFO_full => MEM_ScanoutReadRequestsFIFO_full,
      MEM_ScanoutReadRequestsFIFO_wr_en => MEM_ScanoutReadRequestsFIFO_wr_en,
      MEM_ScanoutReadResponsesFIFO_rd_data => MEM_ScanoutReadResponsesFIFO_rd_data,
      MEM_ScanoutReadResponsesFIFO_empty => MEM_ScanoutReadResponsesFIFO_empty,
      MEM_ScanoutReadResponsesFIFO_almost_empty => MEM_ScanoutReadResponsesFIFO_almost_empty,
      MEM_ScanoutReadResponsesFIFO_rd_en => MEM_ScanoutReadResponsesFIFO_rd_en,
      VSyncActivePolarity => VSyncActivePolarity,
      HSyncActivePolarity => HSyncActivePolarity,
      out_scanout_enable => out_scanout_enable,
      vsync => vsync,
      hsync => hsync,
      blank => blank,
      outR => outR,
      outG => outG,
      outB => outB,
      guardBandEnable => guardBandEnable,
      guardBandType => guardBandType,
      controlChannel0Blue => controlChannel0Blue,
      controlChannel1Green => controlChannel1Green,
      controlChannel2Red => controlChannel2Red,
      isTERC4Region => isTERC4Region,
      TERC4Character0 => TERC4Character0,
      TERC4Character1 => TERC4Character1,
      TERC4Character2 => TERC4Character2,
      DBG_ScanoutLoadProcess_State => DBG_ScanoutLoadProcess_State,
      DBG_InternalScanX => DBG_InternalScanX,
      DBG_InternalScanY => DBG_InternalScanY
    );
END MainDesign_ScanOut_0_0_arch;
