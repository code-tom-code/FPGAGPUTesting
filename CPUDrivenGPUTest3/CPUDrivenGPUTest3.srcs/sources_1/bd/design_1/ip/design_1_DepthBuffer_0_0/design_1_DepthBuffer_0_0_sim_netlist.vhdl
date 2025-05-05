-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Apr 25 20:02:54 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthBuffer_0_0/design_1_DepthBuffer_0_0_sim_netlist.vhdl
-- Design      : design_1_DepthBuffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_DepthBuffer_0_0_DepthBuffer is
  port (
    URAM_addra : out STD_LOGIC_VECTOR ( 17 downto 0 );
    URAM_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    URAM_wea : out STD_LOGIC_VECTOR ( 3 downto 0 );
    URAM_addrb : out STD_LOGIC_VECTOR ( 17 downto 0 );
    STAT_PixelsPassedDepthStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_DepthIsIdle : out STD_LOGIC;
    RAST_PixelPassedDepthStencilTest : out STD_LOGIC;
    RAST_PixelFailedDepthTest : out STD_LOGIC;
    RAST_PixelFailedStencilTest : out STD_LOGIC;
    clk : in STD_LOGIC;
    URAM_doutb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    RAST_PixelReady : in STD_LOGIC;
    RAST_StencilReadMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_SetDepthParams : in STD_LOGIC;
    CMD_ClearDepthBuffer : in STD_LOGIC;
    CMD_ClearStencilBuffer : in STD_LOGIC;
    CMD_ClearDepthValue : in STD_LOGIC_VECTOR ( 23 downto 0 );
    RAST_StencilZFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_PosX : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_StencilCmpFunc : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_DepthFunction : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilWriteMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_PosY : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_StencilPassOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilWriteEnable : in STD_LOGIC;
    RAST_DepthWriteEnable : in STD_LOGIC;
    RAST_StencilRefVal : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CMD_ClearStencilValue : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_InPixelDepth : in STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_DepthBuffer_0_0_DepthBuffer : entity is "DepthBuffer";
end design_1_DepthBuffer_0_0_DepthBuffer;

architecture STRUCTURE of design_1_DepthBuffer_0_0_DepthBuffer is
  signal CMD_DepthIsIdle_i_1_n_0 : STD_LOGIC;
  signal CMD_DepthIsIdle_i_2_n_0 : STD_LOGIC;
  signal DepthTest0 : STD_LOGIC;
  signal DepthTest02_in : STD_LOGIC;
  signal \DepthTest0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \DepthTest0_carry__0_n_5\ : STD_LOGIC;
  signal \DepthTest0_carry__0_n_6\ : STD_LOGIC;
  signal \DepthTest0_carry__0_n_7\ : STD_LOGIC;
  signal DepthTest0_carry_i_10_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_11_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_12_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_13_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_14_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_15_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_16_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_17_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_18_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_19_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_1_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_20_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_21_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_22_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_23_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_24_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_25_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_26_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_27_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_28_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_29_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_2_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_30_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_31_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_32_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_3_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_4_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_5_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_6_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_7_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_8_n_0 : STD_LOGIC;
  signal DepthTest0_carry_i_9_n_0 : STD_LOGIC;
  signal DepthTest0_carry_n_0 : STD_LOGIC;
  signal DepthTest0_carry_n_1 : STD_LOGIC;
  signal DepthTest0_carry_n_2 : STD_LOGIC;
  signal DepthTest0_carry_n_3 : STD_LOGIC;
  signal DepthTest0_carry_n_5 : STD_LOGIC;
  signal DepthTest0_carry_n_6 : STD_LOGIC;
  signal DepthTest0_carry_n_7 : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \DepthTest0_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal EvaluateNewStencilValue : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RAST_PixelFailedDepthTest_i_1_n_0 : STD_LOGIC;
  signal RAST_PixelFailedStencilTest_i_1_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_10_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_11_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_1_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_2_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_3_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_4_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_5_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_6_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_7_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_8_n_0 : STD_LOGIC;
  signal RAST_PixelPassedDepthStencilTest_i_9_n_0 : STD_LOGIC;
  signal \^stat_pixelsfaileddepthtest\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^stat_pixelsfailedstenciltest\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^stat_pixelspasseddepthstenciltest\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StencilTest00_in : STD_LOGIC;
  signal StencilTest0_carry_i_10_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_11_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_1_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_2_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_3_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_4_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_5_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_6_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_7_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_8_n_0 : STD_LOGIC;
  signal StencilTest0_carry_i_9_n_0 : STD_LOGIC;
  signal StencilTest0_carry_n_5 : STD_LOGIC;
  signal StencilTest0_carry_n_6 : STD_LOGIC;
  signal StencilTest0_carry_n_7 : STD_LOGIC;
  signal \URAM_dina[56]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[56]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[57]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[58]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[59]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[60]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_14_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_15_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[61]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_14_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[62]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_10_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_11_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_12_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_13_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_14_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_15_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_16_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_17_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_18_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_2_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_6_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_7_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_8_n_0\ : STD_LOGIC;
  signal \URAM_dina[63]_i_9_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[57]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[58]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[59]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[60]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[61]_i_3_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[62]_i_4_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[62]_i_5_n_0\ : STD_LOGIC;
  signal \URAM_dina_reg[62]_i_6_n_0\ : STD_LOGIC;
  signal URAM_wea_0 : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal clearDepthValue : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \clearModeAddress[0]_i_1_n_0\ : STD_LOGIC;
  signal \clearModeAddress[0]_i_3_n_0\ : STD_LOGIC;
  signal \clearModeAddress[0]_i_4_n_0\ : STD_LOGIC;
  signal \clearModeAddress[0]_i_5_n_0\ : STD_LOGIC;
  signal \clearModeAddress[0]_i_6_n_0\ : STD_LOGIC;
  signal \clearModeAddress[0]_i_7_n_0\ : STD_LOGIC;
  signal clearModeAddress_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \clearModeAddress_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \clearModeAddress_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \clearModeAddress_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \clearModeAddress_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \clearModeAddress_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \clearModeAddress_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal clearModeCompleted : STD_LOGIC;
  signal clearModeCompleted_i_1_n_0 : STD_LOGIC;
  signal clearModeEnable_i_1_n_0 : STD_LOGIC;
  signal clearModeEnable_reg_n_0 : STD_LOGIC;
  signal clearSaveDepthCompareFunc : STD_LOGIC;
  signal \clearSaveDepthCompareFunc_reg_n_0_[0]\ : STD_LOGIC;
  signal \clearSaveDepthCompareFunc_reg_n_0_[1]\ : STD_LOGIC;
  signal \clearSaveDepthCompareFunc_reg_n_0_[2]\ : STD_LOGIC;
  signal clearSaveDepthWriteEnable_reg_n_0 : STD_LOGIC;
  signal clearSaveStencilCompareFunc : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal clearSaveStencilPassOp : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal clearSaveStencilRef : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clearSaveStencilWriteEnable : STD_LOGIC;
  signal clearSaveStencilWriteMask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \currentDepthCompareFunc[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentDepthCompareFunc[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentDepthCompareFunc[2]_i_1_n_0\ : STD_LOGIC;
  signal \currentDepthCompareFunc_reg_n_0_[0]\ : STD_LOGIC;
  signal \currentDepthCompareFunc_reg_n_0_[1]\ : STD_LOGIC;
  signal \currentDepthCompareFunc_reg_n_0_[2]\ : STD_LOGIC;
  signal \currentStencilCompareFunc[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentStencilCompareFunc[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentStencilCompareFunc[2]_i_1_n_0\ : STD_LOGIC;
  signal \currentStencilCompareFunc[2]_i_2_n_0\ : STD_LOGIC;
  signal \currentStencilCompareFunc_reg_n_0_[0]\ : STD_LOGIC;
  signal \currentStencilCompareFunc_reg_n_0_[1]\ : STD_LOGIC;
  signal \currentStencilCompareFunc_reg_n_0_[2]\ : STD_LOGIC;
  signal \depthPipeline[0][isOddAddress]\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_11\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_12\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_13\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_14\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_15\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_5\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_6\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry__0_n_7\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_1\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_10\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_11\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_12\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_13\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_14\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_15\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_2\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_3\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_5\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_6\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_7\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_8\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress]0__0_carry_n_9\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][0]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][10]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][11]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][12]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][13]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][14]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][15]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][16]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][17]_i_2_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][1]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][2]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][3]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][4]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][5]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][6]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][7]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][8]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline[0][pixelAddress][9]_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[0][isOddAddress]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[0][pixelAddress]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \depthPipeline_reg[0][pixelEnabled]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[1][pixelEnabled]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[2][pixelEnabled]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][isOddAddress]_srl3_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelEnabled]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][isOddAddress_n_0_]\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][0]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][10]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][11]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][12]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][13]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][14]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][15]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][16]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][17]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][1]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][2]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][3]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][4]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][5]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][6]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][7]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][8]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelAddress][9]_srl4_n_0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelEnabled]__0\ : STD_LOGIC;
  signal \depthPipeline_reg[4][pixelTestDepth]\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal depthWriteEnable : STD_LOGIC;
  signal depthWriteEnable_i_1_n_0 : STD_LOGIC;
  signal \i__carry_i_10_n_0\ : STD_LOGIC;
  signal \i__carry_i_11_n_0\ : STD_LOGIC;
  signal \i__carry_i_12_n_0\ : STD_LOGIC;
  signal \i__carry_i_13_n_0\ : STD_LOGIC;
  signal \i__carry_i_14_n_0\ : STD_LOGIC;
  signal \i__carry_i_15_n_0\ : STD_LOGIC;
  signal \i__carry_i_16_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_9_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \pixelsFailedDepthTest[7]_i_2_n_0\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[31]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedDepthTest_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedStencilTest[7]_i_2_n_0\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[31]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsFailedStencilTest_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal pixelsPassedDepthStencilTest : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest[7]_i_2_n_0\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_1\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_10\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_11\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_12\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_13\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_14\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_15\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_5\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_6\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_7\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_8\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[31]_i_2_n_9\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_10\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_11\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_12\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_13\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_14\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_15\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \pixelsPassedDepthStencilTest_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal stencilFailOp : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \stencilPassOp[0]_i_1_n_0\ : STD_LOGIC;
  signal \stencilPassOp[1]_i_1_n_0\ : STD_LOGIC;
  signal \stencilPassOp[2]_i_1_n_0\ : STD_LOGIC;
  signal \stencilPassOp_reg_n_0_[0]\ : STD_LOGIC;
  signal \stencilPassOp_reg_n_0_[1]\ : STD_LOGIC;
  signal \stencilPassOp_reg_n_0_[2]\ : STD_LOGIC;
  signal stencilReadMask : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[0]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[1]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[2]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[3]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[4]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[5]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[6]\ : STD_LOGIC;
  signal \stencilReadMask_reg_n_0_[7]\ : STD_LOGIC;
  signal stencilRef : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \stencilRef[0]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[1]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[2]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[3]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[4]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[5]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[6]_i_1_n_0\ : STD_LOGIC;
  signal \stencilRef[7]_i_2_n_0\ : STD_LOGIC;
  signal stencilWriteEnable_i_1_n_0 : STD_LOGIC;
  signal stencilWriteEnable_reg_n_0 : STD_LOGIC;
  signal stencilWriteMask : STD_LOGIC;
  signal \stencilWriteMask[0]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[1]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[2]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[3]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[4]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[5]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[6]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask[7]_i_1_n_0\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[0]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[1]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[2]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[3]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[4]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[5]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[6]\ : STD_LOGIC;
  signal \stencilWriteMask_reg_n_0_[7]\ : STD_LOGIC;
  signal stencilZFailOp : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_DepthTest0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_DepthTest0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DepthTest0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \NLW_DepthTest0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DepthTest0_inferred__0/i__carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_DepthTest0_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_StencilTest0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_StencilTest0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_clearModeAddress_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_clearModeAddress_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_clearModeAddress_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_clearModeAddress_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_depthPipeline[0][pixelAddress]0__0_carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_depthPipeline[0][pixelAddress]0__0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_depthPipeline[0][pixelAddress]0__0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_pixelsFailedDepthTest_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsFailedDepthTest_reg[23]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_pixelsFailedDepthTest_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsFailedStencilTest_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsFailedStencilTest_reg[23]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_pixelsFailedStencilTest_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsPassedDepthStencilTest_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsPassedDepthStencilTest_reg[23]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_pixelsPassedDepthStencilTest_reg[7]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_10\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_11\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_12\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_13\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_14\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_15\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_16\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DepthTest0_carry__0_i_9\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_17 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_18 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_19 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_20 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_21 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_22 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_23 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_24 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_25 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_26 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_27 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_28 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_29 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_30 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_31 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of DepthTest0_carry_i_32 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_10 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_11 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_6 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_7 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_8 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of RAST_PixelPassedDepthStencilTest_i_9 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of StencilTest0_carry_i_10 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of StencilTest0_carry_i_11 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of StencilTest0_carry_i_9 : label is "soft_lutpair7";
  attribute x_interface_info : string;
  attribute x_interface_info of \URAM_addra_reg[0]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[10]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[11]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[12]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[13]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[14]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[15]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[16]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[17]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[1]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[2]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[3]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[4]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[5]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[6]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[7]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[8]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addra_reg[9]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_info of \URAM_addrb_reg[0]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[10]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[11]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[12]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[13]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[14]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[15]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[16]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[17]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[1]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[2]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[3]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[4]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[5]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[6]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[7]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[8]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_info of \URAM_addrb_reg[9]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute SOFT_HLUTNM of \URAM_dina[56]_i_12\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \URAM_dina[56]_i_13\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \URAM_dina[56]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \URAM_dina[56]_i_8\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \URAM_dina[56]_i_9\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \URAM_dina[57]_i_11\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \URAM_dina[57]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \URAM_dina[58]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \URAM_dina[59]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \URAM_dina[60]_i_12\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \URAM_dina[60]_i_13\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \URAM_dina[60]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \URAM_dina[61]_i_15\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \URAM_dina[61]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \URAM_dina[63]_i_18\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \URAM_dina[63]_i_8\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \URAM_dina[63]_i_9\ : label is "soft_lutpair4";
  attribute x_interface_info of \URAM_dina_reg[32]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[33]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[34]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[35]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[36]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[37]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[38]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[39]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[40]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[41]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[42]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[43]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[44]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[45]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[46]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[47]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[48]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[49]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[50]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[51]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[52]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[53]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[54]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[55]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[56]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[57]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[58]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[59]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[60]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[61]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[62]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of \URAM_dina_reg[63]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute SOFT_HLUTNM of \URAM_wea[2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \URAM_wea[3]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \URAM_wea[6]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \URAM_wea[7]_i_2\ : label is "soft_lutpair35";
  attribute x_interface_info of \URAM_wea_reg[2]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  attribute x_interface_info of \URAM_wea_reg[3]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  attribute x_interface_info of \URAM_wea_reg[6]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  attribute x_interface_info of \URAM_wea_reg[7]\ : label is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  attribute SOFT_HLUTNM of \clearModeAddress[0]_i_6\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \depthPipeline[0][isOddAddress]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][10]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][11]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][12]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][13]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][14]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][15]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][16]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][17]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][3]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][5]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][6]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][7]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][8]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \depthPipeline[0][pixelAddress][9]_i_1\ : label is "soft_lutpair31";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \depthPipeline_reg[3][isOddAddress]_srl3\ : label is "\U0/depthPipeline_reg[3] ";
  attribute srl_name : string;
  attribute srl_name of \depthPipeline_reg[3][isOddAddress]_srl3\ : label is "\U0/depthPipeline_reg[3][isOddAddress]_srl3 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][0]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][0]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][0]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][10]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][10]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][10]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][11]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][11]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][11]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][12]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][12]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][12]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][13]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][13]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][13]_srl4 ";
  attribute SOFT_HLUTNM of \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1\ : label is "soft_lutpair20";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][14]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][14]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][14]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][15]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][15]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][15]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][16]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][16]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][16]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][17]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][17]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][17]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][18]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][18]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][18]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][19]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][19]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][19]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][1]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][1]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][1]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][20]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][20]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][20]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][21]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][21]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][21]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][22]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][22]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][22]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][23]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][23]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][23]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][2]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][2]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][2]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][3]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][3]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][3]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][4]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][4]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][4]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][5]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][5]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][5]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][6]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][6]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][6]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][7]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][7]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][7]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][8]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][8]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][8]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[3][pixelTestDepth][9]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth] ";
  attribute srl_name of \depthPipeline_reg[3][pixelTestDepth][9]_srl4\ : label is "\U0/depthPipeline_reg[3][pixelTestDepth][9]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][0]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][0]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][0]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][10]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][10]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][10]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][11]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][11]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][11]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][12]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][12]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][12]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][13]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][13]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][13]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][14]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][14]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][14]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][15]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][15]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][15]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][16]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][16]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][16]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][17]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][17]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][17]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][1]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][1]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][1]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][2]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][2]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][2]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][3]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][3]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][3]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][4]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][4]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][4]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][5]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][5]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][5]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][6]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][6]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][6]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][7]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][7]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][7]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][8]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][8]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][8]_srl4 ";
  attribute srl_bus_name of \depthPipeline_reg[4][pixelAddress][9]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress] ";
  attribute srl_name of \depthPipeline_reg[4][pixelAddress][9]_srl4\ : label is "\U0/depthPipeline_reg[4][pixelAddress][9]_srl4 ";
begin
  STAT_PixelsFailedDepthTest(31 downto 0) <= \^stat_pixelsfaileddepthtest\(31 downto 0);
  STAT_PixelsFailedStencilTest(31 downto 0) <= \^stat_pixelsfailedstenciltest\(31 downto 0);
  STAT_PixelsPassedDepthStencilTest(31 downto 0) <= \^stat_pixelspasseddepthstenciltest\(31 downto 0);
CMD_DepthIsIdle_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelEnabled]__0\,
      I1 => \depthPipeline_reg[0][pixelEnabled]__0\,
      I2 => \depthPipeline_reg[1][pixelEnabled]__0\,
      I3 => \depthPipeline_reg[2][pixelEnabled]__0\,
      I4 => CMD_DepthIsIdle_i_2_n_0,
      O => CMD_DepthIsIdle_i_1_n_0
    );
CMD_DepthIsIdle_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => RAST_PixelReady,
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_SetDepthParams,
      I3 => \depthPipeline_reg[3][pixelEnabled]__0\,
      I4 => CMD_ClearStencilBuffer,
      I5 => CMD_ClearDepthBuffer,
      O => CMD_DepthIsIdle_i_2_n_0
    );
CMD_DepthIsIdle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => CMD_DepthIsIdle_i_1_n_0,
      Q => CMD_DepthIsIdle,
      R => '0'
    );
DepthTest0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => DepthTest0_carry_n_0,
      CO(6) => DepthTest0_carry_n_1,
      CO(5) => DepthTest0_carry_n_2,
      CO(4) => DepthTest0_carry_n_3,
      CO(3) => NLW_DepthTest0_carry_CO_UNCONNECTED(3),
      CO(2) => DepthTest0_carry_n_5,
      CO(1) => DepthTest0_carry_n_6,
      CO(0) => DepthTest0_carry_n_7,
      DI(7) => DepthTest0_carry_i_1_n_0,
      DI(6) => DepthTest0_carry_i_2_n_0,
      DI(5) => DepthTest0_carry_i_3_n_0,
      DI(4) => DepthTest0_carry_i_4_n_0,
      DI(3) => DepthTest0_carry_i_5_n_0,
      DI(2) => DepthTest0_carry_i_6_n_0,
      DI(1) => DepthTest0_carry_i_7_n_0,
      DI(0) => DepthTest0_carry_i_8_n_0,
      O(7 downto 0) => NLW_DepthTest0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => DepthTest0_carry_i_9_n_0,
      S(6) => DepthTest0_carry_i_10_n_0,
      S(5) => DepthTest0_carry_i_11_n_0,
      S(4) => DepthTest0_carry_i_12_n_0,
      S(3) => DepthTest0_carry_i_13_n_0,
      S(2) => DepthTest0_carry_i_14_n_0,
      S(1) => DepthTest0_carry_i_15_n_0,
      S(0) => DepthTest0_carry_i_16_n_0
    );
\DepthTest0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => DepthTest0_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 4) => \NLW_DepthTest0_carry__0_CO_UNCONNECTED\(7 downto 4),
      CO(3) => DepthTest02_in,
      CO(2) => \DepthTest0_carry__0_n_5\,
      CO(1) => \DepthTest0_carry__0_n_6\,
      CO(0) => \DepthTest0_carry__0_n_7\,
      DI(7 downto 4) => B"0000",
      DI(3) => \DepthTest0_carry__0_i_1_n_0\,
      DI(2) => \DepthTest0_carry__0_i_2_n_0\,
      DI(1) => \DepthTest0_carry__0_i_3_n_0\,
      DI(0) => \DepthTest0_carry__0_i_4_n_0\,
      O(7 downto 0) => \NLW_DepthTest0_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 4) => B"0000",
      S(3) => \DepthTest0_carry__0_i_5_n_0\,
      S(2) => \DepthTest0_carry__0_i_6_n_0\,
      S(1) => \DepthTest0_carry__0_i_7_n_0\,
      S(0) => \DepthTest0_carry__0_i_8_n_0\
    );
\DepthTest0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(23),
      I1 => \DepthTest0_carry__0_i_9_n_0\,
      I2 => URAM_doutb(22),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(54),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(22),
      O => \DepthTest0_carry__0_i_1_n_0\
    );
\DepthTest0_carry__0_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(53),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(21),
      O => \DepthTest0_carry__0_i_10_n_0\
    );
\DepthTest0_carry__0_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(51),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(19),
      O => \DepthTest0_carry__0_i_11_n_0\
    );
\DepthTest0_carry__0_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(49),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(17),
      O => \DepthTest0_carry__0_i_12_n_0\
    );
\DepthTest0_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(23),
      I1 => URAM_doutb(23),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(55),
      O => \DepthTest0_carry__0_i_13_n_0\
    );
\DepthTest0_carry__0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(21),
      I1 => URAM_doutb(21),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(53),
      O => \DepthTest0_carry__0_i_14_n_0\
    );
\DepthTest0_carry__0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A959"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(19),
      I1 => URAM_doutb(19),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(51),
      O => \DepthTest0_carry__0_i_15_n_0\
    );
\DepthTest0_carry__0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(17),
      I1 => URAM_doutb(17),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(49),
      O => \DepthTest0_carry__0_i_16_n_0\
    );
\DepthTest0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(21),
      I1 => \DepthTest0_carry__0_i_10_n_0\,
      I2 => URAM_doutb(20),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(52),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(20),
      O => \DepthTest0_carry__0_i_2_n_0\
    );
\DepthTest0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(19),
      I1 => \DepthTest0_carry__0_i_11_n_0\,
      I2 => URAM_doutb(18),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(50),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(18),
      O => \DepthTest0_carry__0_i_3_n_0\
    );
\DepthTest0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(17),
      I1 => \DepthTest0_carry__0_i_12_n_0\,
      I2 => URAM_doutb(16),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(48),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(16),
      O => \DepthTest0_carry__0_i_4_n_0\
    );
\DepthTest0_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_13_n_0\,
      I1 => URAM_doutb(54),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(22),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(22),
      O => \DepthTest0_carry__0_i_5_n_0\
    );
\DepthTest0_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_14_n_0\,
      I1 => URAM_doutb(52),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(20),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(20),
      O => \DepthTest0_carry__0_i_6_n_0\
    );
\DepthTest0_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_15_n_0\,
      I1 => URAM_doutb(50),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(18),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(18),
      O => \DepthTest0_carry__0_i_7_n_0\
    );
\DepthTest0_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_16_n_0\,
      I1 => URAM_doutb(48),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(16),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(16),
      O => \DepthTest0_carry__0_i_8_n_0\
    );
\DepthTest0_carry__0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(55),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(23),
      O => \DepthTest0_carry__0_i_9_n_0\
    );
DepthTest0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(15),
      I1 => DepthTest0_carry_i_17_n_0,
      I2 => URAM_doutb(14),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(46),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(14),
      O => DepthTest0_carry_i_1_n_0
    );
DepthTest0_carry_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_26_n_0,
      I1 => URAM_doutb(44),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(12),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(12),
      O => DepthTest0_carry_i_10_n_0
    );
DepthTest0_carry_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_27_n_0,
      I1 => URAM_doutb(42),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(10),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(10),
      O => DepthTest0_carry_i_11_n_0
    );
DepthTest0_carry_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_28_n_0,
      I1 => URAM_doutb(40),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(8),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(8),
      O => DepthTest0_carry_i_12_n_0
    );
DepthTest0_carry_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_29_n_0,
      I1 => URAM_doutb(38),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(6),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(6),
      O => DepthTest0_carry_i_13_n_0
    );
DepthTest0_carry_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_30_n_0,
      I1 => URAM_doutb(36),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(4),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(4),
      O => DepthTest0_carry_i_14_n_0
    );
DepthTest0_carry_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_31_n_0,
      I1 => URAM_doutb(34),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(2),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(2),
      O => DepthTest0_carry_i_15_n_0
    );
DepthTest0_carry_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_32_n_0,
      I1 => URAM_doutb(32),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(0),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(0),
      O => DepthTest0_carry_i_16_n_0
    );
DepthTest0_carry_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(47),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(15),
      O => DepthTest0_carry_i_17_n_0
    );
DepthTest0_carry_i_18: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(45),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(13),
      O => DepthTest0_carry_i_18_n_0
    );
DepthTest0_carry_i_19: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(43),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(11),
      O => DepthTest0_carry_i_19_n_0
    );
DepthTest0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(13),
      I1 => DepthTest0_carry_i_18_n_0,
      I2 => URAM_doutb(12),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(44),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(12),
      O => DepthTest0_carry_i_2_n_0
    );
DepthTest0_carry_i_20: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(41),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(9),
      O => DepthTest0_carry_i_20_n_0
    );
DepthTest0_carry_i_21: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(39),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(7),
      O => DepthTest0_carry_i_21_n_0
    );
DepthTest0_carry_i_22: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(37),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(5),
      O => DepthTest0_carry_i_22_n_0
    );
DepthTest0_carry_i_23: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(35),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(3),
      O => DepthTest0_carry_i_23_n_0
    );
DepthTest0_carry_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(33),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(1),
      O => DepthTest0_carry_i_24_n_0
    );
DepthTest0_carry_i_25: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(15),
      I1 => URAM_doutb(15),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(47),
      O => DepthTest0_carry_i_25_n_0
    );
DepthTest0_carry_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A959"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(13),
      I1 => URAM_doutb(13),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(45),
      O => DepthTest0_carry_i_26_n_0
    );
DepthTest0_carry_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(11),
      I1 => URAM_doutb(11),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(43),
      O => DepthTest0_carry_i_27_n_0
    );
DepthTest0_carry_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(9),
      I1 => URAM_doutb(9),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(41),
      O => DepthTest0_carry_i_28_n_0
    );
DepthTest0_carry_i_29: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A959"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(7),
      I1 => URAM_doutb(7),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(39),
      O => DepthTest0_carry_i_29_n_0
    );
DepthTest0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(11),
      I1 => DepthTest0_carry_i_19_n_0,
      I2 => URAM_doutb(10),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(42),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(10),
      O => DepthTest0_carry_i_3_n_0
    );
DepthTest0_carry_i_30: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(5),
      I1 => URAM_doutb(5),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(37),
      O => DepthTest0_carry_i_30_n_0
    );
DepthTest0_carry_i_31: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(3),
      I1 => URAM_doutb(3),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(35),
      O => DepthTest0_carry_i_31_n_0
    );
DepthTest0_carry_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A959"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(1),
      I1 => URAM_doutb(1),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(33),
      O => DepthTest0_carry_i_32_n_0
    );
DepthTest0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(9),
      I1 => DepthTest0_carry_i_20_n_0,
      I2 => URAM_doutb(8),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(40),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(8),
      O => DepthTest0_carry_i_4_n_0
    );
DepthTest0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(7),
      I1 => DepthTest0_carry_i_21_n_0,
      I2 => URAM_doutb(6),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(38),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(6),
      O => DepthTest0_carry_i_5_n_0
    );
DepthTest0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(5),
      I1 => DepthTest0_carry_i_22_n_0,
      I2 => URAM_doutb(4),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(36),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(4),
      O => DepthTest0_carry_i_6_n_0
    );
DepthTest0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(3),
      I1 => DepthTest0_carry_i_23_n_0,
      I2 => URAM_doutb(2),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(34),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(2),
      O => DepthTest0_carry_i_7_n_0
    );
DepthTest0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444DDD444D4"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelTestDepth]\(1),
      I1 => DepthTest0_carry_i_24_n_0,
      I2 => URAM_doutb(0),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(32),
      I5 => \depthPipeline_reg[4][pixelTestDepth]\(0),
      O => DepthTest0_carry_i_8_n_0
    );
DepthTest0_carry_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_25_n_0,
      I1 => URAM_doutb(46),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(14),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(14),
      O => DepthTest0_carry_i_9_n_0
    );
\DepthTest0_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => DepthTest0,
      CO(6) => \DepthTest0_inferred__0/i__carry_n_1\,
      CO(5) => \DepthTest0_inferred__0/i__carry_n_2\,
      CO(4) => \DepthTest0_inferred__0/i__carry_n_3\,
      CO(3) => \NLW_DepthTest0_inferred__0/i__carry_CO_UNCONNECTED\(3),
      CO(2) => \DepthTest0_inferred__0/i__carry_n_5\,
      CO(1) => \DepthTest0_inferred__0/i__carry_n_6\,
      CO(0) => \DepthTest0_inferred__0/i__carry_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_DepthTest0_inferred__0/i__carry_O_UNCONNECTED\(7 downto 0),
      S(7) => \i__carry_i_1_n_0\,
      S(6) => \i__carry_i_2_n_0\,
      S(5) => \i__carry_i_3_n_0\,
      S(4) => \i__carry_i_4_n_0\,
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
RAST_PixelFailedDepthTest_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I2 => \depthPipeline_reg[4][pixelEnabled]__0\,
      O => RAST_PixelFailedDepthTest_i_1_n_0
    );
RAST_PixelFailedDepthTest_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => RAST_PixelFailedDepthTest_i_1_n_0,
      Q => RAST_PixelFailedDepthTest,
      R => '0'
    );
RAST_PixelFailedStencilTest_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \depthPipeline_reg[4][pixelEnabled]__0\,
      I1 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      O => RAST_PixelFailedStencilTest_i_1_n_0
    );
RAST_PixelFailedStencilTest_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => RAST_PixelFailedStencilTest_i_1_n_0,
      Q => RAST_PixelFailedStencilTest,
      R => '0'
    );
RAST_PixelPassedDepthStencilTest_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I2 => \depthPipeline_reg[4][pixelEnabled]__0\,
      O => RAST_PixelPassedDepthStencilTest_i_1_n_0
    );
RAST_PixelPassedDepthStencilTest_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47B80000"
    )
        port map (
      I0 => URAM_doutb(62),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(30),
      I3 => stencilRef(6),
      I4 => \stencilReadMask_reg_n_0_[6]\,
      O => RAST_PixelPassedDepthStencilTest_i_10_n_0
    );
RAST_PixelPassedDepthStencilTest_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"656A0000"
    )
        port map (
      I0 => stencilRef(7),
      I1 => URAM_doutb(63),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(31),
      I4 => \stencilReadMask_reg_n_0_[7]\,
      O => RAST_PixelPassedDepthStencilTest_i_11_n_0
    );
RAST_PixelPassedDepthStencilTest_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0BBF888"
    )
        port map (
      I0 => \currentDepthCompareFunc_reg_n_0_[0]\,
      I1 => DepthTest02_in,
      I2 => \currentDepthCompareFunc_reg_n_0_[1]\,
      I3 => DepthTest0,
      I4 => \currentDepthCompareFunc_reg_n_0_[2]\,
      O => RAST_PixelPassedDepthStencilTest_i_2_n_0
    );
RAST_PixelPassedDepthStencilTest_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB0888F8888"
    )
        port map (
      I0 => \currentStencilCompareFunc_reg_n_0_[0]\,
      I1 => StencilTest00_in,
      I2 => RAST_PixelPassedDepthStencilTest_i_4_n_0,
      I3 => RAST_PixelPassedDepthStencilTest_i_5_n_0,
      I4 => \currentStencilCompareFunc_reg_n_0_[1]\,
      I5 => \currentStencilCompareFunc_reg_n_0_[2]\,
      O => RAST_PixelPassedDepthStencilTest_i_3_n_0
    );
RAST_PixelPassedDepthStencilTest_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF60"
    )
        port map (
      I0 => StencilTest0_carry_i_11_n_0,
      I1 => stencilRef(0),
      I2 => \stencilReadMask_reg_n_0_[0]\,
      I3 => RAST_PixelPassedDepthStencilTest_i_6_n_0,
      I4 => RAST_PixelPassedDepthStencilTest_i_7_n_0,
      I5 => RAST_PixelPassedDepthStencilTest_i_8_n_0,
      O => RAST_PixelPassedDepthStencilTest_i_4_n_0
    );
RAST_PixelPassedDepthStencilTest_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF60"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => stencilRef(4),
      I2 => \stencilReadMask_reg_n_0_[4]\,
      I3 => RAST_PixelPassedDepthStencilTest_i_9_n_0,
      I4 => RAST_PixelPassedDepthStencilTest_i_10_n_0,
      I5 => RAST_PixelPassedDepthStencilTest_i_11_n_0,
      O => RAST_PixelPassedDepthStencilTest_i_5_n_0
    );
RAST_PixelPassedDepthStencilTest_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"656A0000"
    )
        port map (
      I0 => stencilRef(1),
      I1 => URAM_doutb(57),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(25),
      I4 => \stencilReadMask_reg_n_0_[1]\,
      O => RAST_PixelPassedDepthStencilTest_i_6_n_0
    );
RAST_PixelPassedDepthStencilTest_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"47B80000"
    )
        port map (
      I0 => URAM_doutb(58),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(26),
      I3 => stencilRef(2),
      I4 => \stencilReadMask_reg_n_0_[2]\,
      O => RAST_PixelPassedDepthStencilTest_i_7_n_0
    );
RAST_PixelPassedDepthStencilTest_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"656A0000"
    )
        port map (
      I0 => stencilRef(3),
      I1 => URAM_doutb(59),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(27),
      I4 => \stencilReadMask_reg_n_0_[3]\,
      O => RAST_PixelPassedDepthStencilTest_i_8_n_0
    );
RAST_PixelPassedDepthStencilTest_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"656A0000"
    )
        port map (
      I0 => stencilRef(5),
      I1 => URAM_doutb(61),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(29),
      I4 => \stencilReadMask_reg_n_0_[5]\,
      O => RAST_PixelPassedDepthStencilTest_i_9_n_0
    );
RAST_PixelPassedDepthStencilTest_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => RAST_PixelPassedDepthStencilTest_i_1_n_0,
      Q => RAST_PixelPassedDepthStencilTest,
      R => '0'
    );
StencilTest0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => NLW_StencilTest0_carry_CO_UNCONNECTED(7 downto 4),
      CO(3) => StencilTest00_in,
      CO(2) => StencilTest0_carry_n_5,
      CO(1) => StencilTest0_carry_n_6,
      CO(0) => StencilTest0_carry_n_7,
      DI(7 downto 4) => B"0000",
      DI(3) => StencilTest0_carry_i_1_n_0,
      DI(2) => StencilTest0_carry_i_2_n_0,
      DI(1) => StencilTest0_carry_i_3_n_0,
      DI(0) => StencilTest0_carry_i_4_n_0,
      O(7 downto 0) => NLW_StencilTest0_carry_O_UNCONNECTED(7 downto 0),
      S(7 downto 4) => B"0000",
      S(3) => StencilTest0_carry_i_5_n_0,
      S(2) => StencilTest0_carry_i_6_n_0,
      S(1) => StencilTest0_carry_i_7_n_0,
      S(0) => StencilTest0_carry_i_8_n_0
    );
StencilTest0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20FF002020202020"
    )
        port map (
      I0 => StencilTest0_carry_i_9_n_0,
      I1 => stencilRef(6),
      I2 => \stencilReadMask_reg_n_0_[6]\,
      I3 => stencilRef(7),
      I4 => StencilTest0_carry_i_10_n_0,
      I5 => \stencilReadMask_reg_n_0_[7]\,
      O => StencilTest0_carry_i_1_n_0
    );
StencilTest0_carry_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(63),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(31),
      O => StencilTest0_carry_i_10_n_0
    );
StencilTest0_carry_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(56),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(24),
      O => StencilTest0_carry_i_11_n_0
    );
StencilTest0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20FF002020202020"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => stencilRef(4),
      I2 => \stencilReadMask_reg_n_0_[4]\,
      I3 => stencilRef(5),
      I4 => \URAM_dina[61]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[5]\,
      O => StencilTest0_carry_i_2_n_0
    );
StencilTest0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20FF002020202020"
    )
        port map (
      I0 => \URAM_dina[58]_i_2_n_0\,
      I1 => stencilRef(2),
      I2 => \stencilReadMask_reg_n_0_[2]\,
      I3 => stencilRef(3),
      I4 => \URAM_dina[59]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[3]\,
      O => StencilTest0_carry_i_3_n_0
    );
StencilTest0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20FF002020202020"
    )
        port map (
      I0 => StencilTest0_carry_i_11_n_0,
      I1 => stencilRef(0),
      I2 => \stencilReadMask_reg_n_0_[0]\,
      I3 => stencilRef(1),
      I4 => \URAM_dina[57]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[1]\,
      O => StencilTest0_carry_i_4_n_0
    );
StencilTest0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F00009F9F9F9F9F"
    )
        port map (
      I0 => StencilTest0_carry_i_9_n_0,
      I1 => stencilRef(6),
      I2 => \stencilReadMask_reg_n_0_[6]\,
      I3 => stencilRef(7),
      I4 => StencilTest0_carry_i_10_n_0,
      I5 => \stencilReadMask_reg_n_0_[7]\,
      O => StencilTest0_carry_i_5_n_0
    );
StencilTest0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F00009F9F9F9F9F"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => stencilRef(4),
      I2 => \stencilReadMask_reg_n_0_[4]\,
      I3 => stencilRef(5),
      I4 => \URAM_dina[61]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[5]\,
      O => StencilTest0_carry_i_6_n_0
    );
StencilTest0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F00009F9F9F9F9F"
    )
        port map (
      I0 => \URAM_dina[58]_i_2_n_0\,
      I1 => stencilRef(2),
      I2 => \stencilReadMask_reg_n_0_[2]\,
      I3 => stencilRef(3),
      I4 => \URAM_dina[59]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[3]\,
      O => StencilTest0_carry_i_7_n_0
    );
StencilTest0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F00009F9F9F9F9F"
    )
        port map (
      I0 => StencilTest0_carry_i_11_n_0,
      I1 => stencilRef(0),
      I2 => \stencilReadMask_reg_n_0_[0]\,
      I3 => stencilRef(1),
      I4 => \URAM_dina[57]_i_2_n_0\,
      I5 => \stencilReadMask_reg_n_0_[1]\,
      O => StencilTest0_carry_i_8_n_0
    );
StencilTest0_carry_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(62),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(30),
      O => StencilTest0_carry_i_9_n_0
    );
\URAM_addra_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][0]_srl4_n_0\,
      Q => URAM_addra(0),
      R => '0'
    );
\URAM_addra_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][10]_srl4_n_0\,
      Q => URAM_addra(10),
      R => '0'
    );
\URAM_addra_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][11]_srl4_n_0\,
      Q => URAM_addra(11),
      R => '0'
    );
\URAM_addra_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][12]_srl4_n_0\,
      Q => URAM_addra(12),
      R => '0'
    );
\URAM_addra_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][13]_srl4_n_0\,
      Q => URAM_addra(13),
      R => '0'
    );
\URAM_addra_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][14]_srl4_n_0\,
      Q => URAM_addra(14),
      R => '0'
    );
\URAM_addra_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][15]_srl4_n_0\,
      Q => URAM_addra(15),
      R => '0'
    );
\URAM_addra_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][16]_srl4_n_0\,
      Q => URAM_addra(16),
      R => '0'
    );
\URAM_addra_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][17]_srl4_n_0\,
      Q => URAM_addra(17),
      R => '0'
    );
\URAM_addra_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][1]_srl4_n_0\,
      Q => URAM_addra(1),
      R => '0'
    );
\URAM_addra_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][2]_srl4_n_0\,
      Q => URAM_addra(2),
      R => '0'
    );
\URAM_addra_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][3]_srl4_n_0\,
      Q => URAM_addra(3),
      R => '0'
    );
\URAM_addra_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][4]_srl4_n_0\,
      Q => URAM_addra(4),
      R => '0'
    );
\URAM_addra_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][5]_srl4_n_0\,
      Q => URAM_addra(5),
      R => '0'
    );
\URAM_addra_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][6]_srl4_n_0\,
      Q => URAM_addra(6),
      R => '0'
    );
\URAM_addra_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][7]_srl4_n_0\,
      Q => URAM_addra(7),
      R => '0'
    );
\URAM_addra_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][8]_srl4_n_0\,
      Q => URAM_addra(8),
      R => '0'
    );
\URAM_addra_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelAddress][9]_srl4_n_0\,
      Q => URAM_addra(9),
      R => '0'
    );
\URAM_addrb_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => RAST_PosX(1),
      Q => URAM_addrb(0),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_10\,
      Q => URAM_addrb(10),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_9\,
      Q => URAM_addrb(11),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_8\,
      Q => URAM_addrb(12),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry__0_n_15\,
      Q => URAM_addrb(13),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry__0_n_14\,
      Q => URAM_addrb(14),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry__0_n_13\,
      Q => URAM_addrb(15),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry__0_n_12\,
      Q => URAM_addrb(16),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry__0_n_11\,
      Q => URAM_addrb(17),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => RAST_PosX(2),
      Q => URAM_addrb(1),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => RAST_PosX(3),
      Q => URAM_addrb(2),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => RAST_PosX(4),
      Q => URAM_addrb(3),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => RAST_PosX(5),
      Q => URAM_addrb(4),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_15\,
      Q => URAM_addrb(5),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_14\,
      Q => URAM_addrb(6),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_13\,
      Q => URAM_addrb(7),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_12\,
      Q => URAM_addrb(8),
      R => clearModeEnable_reg_n_0
    );
\URAM_addrb_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelReady,
      D => \depthPipeline[0][pixelAddress]0__0_carry_n_11\,
      Q => URAM_addrb(9),
      R => clearModeEnable_reg_n_0
    );
\URAM_dina[56]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \URAM_dina[56]_i_2_n_0\,
      I1 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I2 => \URAM_dina[56]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[56]_i_4_n_0\,
      O => EvaluateNewStencilValue(0)
    );
\URAM_dina[56]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504500415041004"
    )
        port map (
      I0 => stencilFailOp(2),
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => stencilFailOp(0),
      I3 => stencilFailOp(1),
      I4 => stencilRef(0),
      I5 => \URAM_dina[61]_i_13_n_0\,
      O => \URAM_dina[56]_i_10_n_0\
    );
\URAM_dina[56]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => stencilFailOp(1),
      I1 => stencilFailOp(0),
      O => \URAM_dina[56]_i_11_n_0\
    );
\URAM_dina[56]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => URAM_doutb(25),
      I1 => URAM_doutb(57),
      I2 => URAM_doutb(24),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(56),
      O => \URAM_dina[56]_i_12_n_0\
    );
\URAM_dina[56]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => URAM_doutb(27),
      I1 => URAM_doutb(59),
      I2 => URAM_doutb(26),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(58),
      O => \URAM_dina[56]_i_13_n_0\
    );
\URAM_dina[56]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F00FFFFEFE00000"
    )
        port map (
      I0 => \URAM_dina[56]_i_5_n_0\,
      I1 => \URAM_dina[56]_i_6_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[56]_i_7_n_0\,
      I4 => \stencilWriteMask_reg_n_0_[0]\,
      I5 => StencilTest0_carry_i_11_n_0,
      O => \URAM_dina[56]_i_2_n_0\
    );
\URAM_dina[56]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F00FFFFDFD00000"
    )
        port map (
      I0 => \URAM_dina[56]_i_8_n_0\,
      I1 => \URAM_dina[56]_i_6_n_0\,
      I2 => stencilZFailOp(2),
      I3 => \URAM_dina[56]_i_9_n_0\,
      I4 => \stencilWriteMask_reg_n_0_[0]\,
      I5 => StencilTest0_carry_i_11_n_0,
      O => \URAM_dina[56]_i_3_n_0\
    );
\URAM_dina[56]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFFFFEEEA0000"
    )
        port map (
      I0 => \URAM_dina[56]_i_10_n_0\,
      I1 => stencilFailOp(2),
      I2 => \URAM_dina[56]_i_6_n_0\,
      I3 => \URAM_dina[56]_i_11_n_0\,
      I4 => \stencilWriteMask_reg_n_0_[0]\,
      I5 => StencilTest0_carry_i_11_n_0,
      O => \URAM_dina[56]_i_4_n_0\
    );
\URAM_dina[56]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \stencilPassOp_reg_n_0_[1]\,
      I1 => \stencilPassOp_reg_n_0_[0]\,
      O => \URAM_dina[56]_i_5_n_0\
    );
\URAM_dina[56]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => StencilTest0_carry_i_10_n_0,
      I1 => StencilTest0_carry_i_9_n_0,
      I2 => \URAM_dina[61]_i_2_n_0\,
      I3 => \URAM_dina[60]_i_2_n_0\,
      I4 => \URAM_dina[56]_i_12_n_0\,
      I5 => \URAM_dina[56]_i_13_n_0\,
      O => \URAM_dina[56]_i_6_n_0\
    );
\URAM_dina[56]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0CFF0C0"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => stencilRef(0),
      I2 => \stencilPassOp_reg_n_0_[1]\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => StencilTest0_carry_i_11_n_0,
      O => \URAM_dina[56]_i_7_n_0\
    );
\URAM_dina[56]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stencilZFailOp(1),
      I1 => stencilZFailOp(0),
      O => \URAM_dina[56]_i_8_n_0\
    );
\URAM_dina[56]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2EEA244"
    )
        port map (
      I0 => stencilZFailOp(1),
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => \URAM_dina[61]_i_13_n_0\,
      I3 => stencilZFailOp(0),
      I4 => stencilRef(0),
      O => \URAM_dina[56]_i_9_n_0\
    );
\URAM_dina[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222E222E222EEE2E"
    )
        port map (
      I0 => \URAM_dina[57]_i_2_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[1]\,
      I2 => \URAM_dina_reg[57]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[57]_i_4_n_0\,
      I5 => \URAM_dina[57]_i_5_n_0\,
      O => EvaluateNewStencilValue(1)
    );
\URAM_dina[57]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEFFBE0000F000F0"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => stencilRef(1),
      I5 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[57]_i_10_n_0\
    );
\URAM_dina[57]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96964B0A"
    )
        port map (
      I0 => \stencilPassOp_reg_n_0_[0]\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => \URAM_dina[56]_i_6_n_0\,
      I4 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[57]_i_11_n_0\
    );
\URAM_dina[57]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(57),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(25),
      O => \URAM_dina[57]_i_2_n_0\
    );
\URAM_dina[57]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A8"
    )
        port map (
      I0 => \URAM_dina[57]_i_8_n_0\,
      I1 => stencilZFailOp(2),
      I2 => \URAM_dina[57]_i_9_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      O => \URAM_dina[57]_i_4_n_0\
    );
\URAM_dina[57]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[57]_i_10_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[57]_i_11_n_0\,
      O => \URAM_dina[57]_i_5_n_0\
    );
\URAM_dina[57]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44FF0F0011FF0FFF"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => stencilRef(1),
      I3 => stencilFailOp(1),
      I4 => stencilFailOp(0),
      I5 => \URAM_dina[57]_i_2_n_0\,
      O => \URAM_dina[57]_i_6_n_0\
    );
\URAM_dina[57]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6D927D93"
    )
        port map (
      I0 => stencilFailOp(1),
      I1 => stencilFailOp(0),
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => \URAM_dina[57]_i_2_n_0\,
      I4 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[57]_i_7_n_0\
    );
\URAM_dina[57]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3CC3CC7DFFFFFFFF"
    )
        port map (
      I0 => \URAM_dina[56]_i_6_n_0\,
      I1 => \URAM_dina[57]_i_2_n_0\,
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => stencilZFailOp(0),
      I4 => stencilZFailOp(1),
      I5 => stencilZFailOp(2),
      O => \URAM_dina[57]_i_8_n_0\
    );
\URAM_dina[57]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44FF0F0011FF0FFF"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => stencilRef(1),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => \URAM_dina[57]_i_2_n_0\,
      O => \URAM_dina[57]_i_9_n_0\
    );
\URAM_dina[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222E222E222EEE2E"
    )
        port map (
      I0 => \URAM_dina[58]_i_2_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[2]\,
      I2 => \URAM_dina_reg[58]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[58]_i_4_n_0\,
      I5 => \URAM_dina[58]_i_5_n_0\,
      O => EvaluateNewStencilValue(2)
    );
\URAM_dina[58]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[58]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(2),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[58]_i_10_n_0\
    );
\URAM_dina[58]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"644D9BB2755D9BB3"
    )
        port map (
      I0 => stencilZFailOp(1),
      I1 => stencilZFailOp(0),
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => StencilTest0_carry_i_11_n_0,
      I4 => \URAM_dina[58]_i_2_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[58]_i_11_n_0\
    );
\URAM_dina[58]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C333A5A5C3335555"
    )
        port map (
      I0 => URAM_doutb(26),
      I1 => URAM_doutb(58),
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => URAM_doutb(57),
      I4 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I5 => URAM_doutb(25),
      O => \URAM_dina[58]_i_12_n_0\
    );
\URAM_dina[58]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(58),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(26),
      O => \URAM_dina[58]_i_2_n_0\
    );
\URAM_dina[58]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[58]_i_8_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[58]_i_9_n_0\,
      O => \URAM_dina[58]_i_4_n_0\
    );
\URAM_dina[58]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5044"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[58]_i_10_n_0\,
      I2 => \URAM_dina[58]_i_11_n_0\,
      I3 => stencilZFailOp(2),
      O => \URAM_dina[58]_i_5_n_0\
    );
\URAM_dina[58]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[58]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(2),
      I3 => stencilFailOp(1),
      I4 => stencilFailOp(0),
      I5 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[58]_i_6_n_0\
    );
\URAM_dina[58]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"644D9BB2755D9BB3"
    )
        port map (
      I0 => stencilFailOp(1),
      I1 => stencilFailOp(0),
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => StencilTest0_carry_i_11_n_0,
      I4 => \URAM_dina[58]_i_2_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[58]_i_7_n_0\
    );
\URAM_dina[58]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD00F0FFDD00F000"
    )
        port map (
      I0 => \URAM_dina[58]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(2),
      I3 => \stencilPassOp_reg_n_0_[1]\,
      I4 => \stencilPassOp_reg_n_0_[0]\,
      I5 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[58]_i_8_n_0\
    );
\URAM_dina[58]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BD42BD4254AB00AA"
    )
        port map (
      I0 => \stencilPassOp_reg_n_0_[0]\,
      I1 => \URAM_dina[57]_i_2_n_0\,
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => \URAM_dina[58]_i_2_n_0\,
      I4 => \URAM_dina[56]_i_6_n_0\,
      I5 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[58]_i_9_n_0\
    );
\URAM_dina[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222E222E222EEE2E"
    )
        port map (
      I0 => \URAM_dina[59]_i_2_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[3]\,
      I2 => \URAM_dina_reg[59]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[59]_i_4_n_0\,
      I5 => \URAM_dina[59]_i_5_n_0\,
      O => EvaluateNewStencilValue(3)
    );
\URAM_dina[59]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[59]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(3),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => \URAM_dina[59]_i_2_n_0\,
      O => \URAM_dina[59]_i_10_n_0\
    );
\URAM_dina[59]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[59]_i_12_n_0\,
      I1 => stencilZFailOp(1),
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => stencilZFailOp(0),
      I4 => \URAM_dina[59]_i_13_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[59]_i_11_n_0\
    );
\URAM_dina[59]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A959555555555555"
    )
        port map (
      I0 => \URAM_dina[59]_i_2_n_0\,
      I1 => URAM_doutb(25),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(57),
      I4 => StencilTest0_carry_i_11_n_0,
      I5 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[59]_i_12_n_0\
    );
\URAM_dina[59]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555555556A6"
    )
        port map (
      I0 => \URAM_dina[59]_i_2_n_0\,
      I1 => URAM_doutb(25),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(57),
      I4 => StencilTest0_carry_i_11_n_0,
      I5 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[59]_i_13_n_0\
    );
\URAM_dina[59]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(59),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(27),
      O => \URAM_dina[59]_i_2_n_0\
    );
\URAM_dina[59]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[59]_i_8_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[59]_i_9_n_0\,
      O => \URAM_dina[59]_i_4_n_0\
    );
\URAM_dina[59]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \URAM_dina[59]_i_10_n_0\,
      I1 => stencilZFailOp(2),
      I2 => \URAM_dina[59]_i_11_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      O => \URAM_dina[59]_i_5_n_0\
    );
\URAM_dina[59]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[59]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(3),
      I3 => stencilFailOp(1),
      I4 => stencilFailOp(0),
      I5 => \URAM_dina[59]_i_2_n_0\,
      O => \URAM_dina[59]_i_6_n_0\
    );
\URAM_dina[59]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[59]_i_12_n_0\,
      I1 => stencilFailOp(1),
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => stencilFailOp(0),
      I4 => \URAM_dina[59]_i_13_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[59]_i_7_n_0\
    );
\URAM_dina[59]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD00F0FFDD00F000"
    )
        port map (
      I0 => \URAM_dina[59]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(3),
      I3 => \stencilPassOp_reg_n_0_[1]\,
      I4 => \stencilPassOp_reg_n_0_[0]\,
      I5 => \URAM_dina[59]_i_2_n_0\,
      O => \URAM_dina[59]_i_8_n_0\
    );
\URAM_dina[59]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F000FFF550C550C"
    )
        port map (
      I0 => \URAM_dina[59]_i_2_n_0\,
      I1 => \URAM_dina[56]_i_6_n_0\,
      I2 => \URAM_dina[59]_i_13_n_0\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => \URAM_dina[59]_i_12_n_0\,
      I5 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[59]_i_9_n_0\
    );
\URAM_dina[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222E222E222EEE2E"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[4]\,
      I2 => \URAM_dina_reg[60]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[60]_i_4_n_0\,
      I5 => \URAM_dina[60]_i_5_n_0\,
      O => EvaluateNewStencilValue(4)
    );
\URAM_dina[60]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD00F0FFDD00F000"
    )
        port map (
      I0 => \URAM_dina[60]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(4),
      I3 => \stencilPassOp_reg_n_0_[1]\,
      I4 => \stencilPassOp_reg_n_0_[0]\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[60]_i_10_n_0\
    );
\URAM_dina[60]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F000FFF550C550C"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => \URAM_dina[56]_i_6_n_0\,
      I2 => \URAM_dina[60]_i_13_n_0\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => \URAM_dina[60]_i_12_n_0\,
      I5 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[60]_i_11_n_0\
    );
\URAM_dina[60]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"95555555"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => \URAM_dina[59]_i_2_n_0\,
      I2 => \URAM_dina[58]_i_2_n_0\,
      I3 => \URAM_dina[57]_i_2_n_0\,
      I4 => StencilTest0_carry_i_11_n_0,
      O => \URAM_dina[60]_i_12_n_0\
    );
\URAM_dina[60]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555556"
    )
        port map (
      I0 => \URAM_dina[60]_i_2_n_0\,
      I1 => \URAM_dina[57]_i_2_n_0\,
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => \URAM_dina[59]_i_2_n_0\,
      I4 => \URAM_dina[58]_i_2_n_0\,
      O => \URAM_dina[60]_i_13_n_0\
    );
\URAM_dina[60]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => URAM_doutb(28),
      I1 => URAM_doutb(60),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      O => \URAM_dina[60]_i_2_n_0\
    );
\URAM_dina[60]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \URAM_dina[60]_i_8_n_0\,
      I1 => stencilZFailOp(2),
      I2 => \URAM_dina[60]_i_9_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      O => \URAM_dina[60]_i_4_n_0\
    );
\URAM_dina[60]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[60]_i_10_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[60]_i_11_n_0\,
      O => \URAM_dina[60]_i_5_n_0\
    );
\URAM_dina[60]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[60]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(4),
      I3 => stencilFailOp(1),
      I4 => stencilFailOp(0),
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[60]_i_6_n_0\
    );
\URAM_dina[60]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[60]_i_12_n_0\,
      I1 => stencilFailOp(1),
      I2 => \URAM_dina[60]_i_2_n_0\,
      I3 => stencilFailOp(0),
      I4 => \URAM_dina[60]_i_13_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[60]_i_7_n_0\
    );
\URAM_dina[60]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[60]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(4),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[60]_i_8_n_0\
    );
\URAM_dina[60]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[60]_i_12_n_0\,
      I1 => stencilZFailOp(1),
      I2 => \URAM_dina[60]_i_2_n_0\,
      I3 => stencilZFailOp(0),
      I4 => \URAM_dina[60]_i_13_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[60]_i_9_n_0\
    );
\URAM_dina[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222E222E222EEE2E"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[5]\,
      I2 => \URAM_dina_reg[61]_i_3_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \URAM_dina[61]_i_4_n_0\,
      I5 => \URAM_dina[61]_i_5_n_0\,
      O => EvaluateNewStencilValue(5)
    );
\URAM_dina[61]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD00F0FFDD00F000"
    )
        port map (
      I0 => \URAM_dina[61]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(5),
      I3 => \stencilPassOp_reg_n_0_[1]\,
      I4 => \stencilPassOp_reg_n_0_[0]\,
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[61]_i_10_n_0\
    );
\URAM_dina[61]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F000FFF550C550C"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => \URAM_dina[56]_i_6_n_0\,
      I2 => \URAM_dina[61]_i_14_n_0\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => \URAM_dina[61]_i_12_n_0\,
      I5 => \stencilPassOp_reg_n_0_[1]\,
      O => \URAM_dina[61]_i_11_n_0\
    );
\URAM_dina[61]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9555555555555555"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => \URAM_dina[58]_i_2_n_0\,
      I4 => \URAM_dina[59]_i_2_n_0\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[61]_i_12_n_0\
    );
\URAM_dina[61]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \URAM_dina[61]_i_15_n_0\,
      I1 => \URAM_dina[63]_i_18_n_0\,
      I2 => StencilTest0_carry_i_10_n_0,
      I3 => StencilTest0_carry_i_9_n_0,
      I4 => \URAM_dina[61]_i_2_n_0\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[61]_i_13_n_0\
    );
\URAM_dina[61]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555555555556"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => \URAM_dina[58]_i_2_n_0\,
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => StencilTest0_carry_i_11_n_0,
      I4 => \URAM_dina[57]_i_2_n_0\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[61]_i_14_n_0\
    );
\URAM_dina[61]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335FFF5F"
    )
        port map (
      I0 => URAM_doutb(27),
      I1 => URAM_doutb(59),
      I2 => URAM_doutb(26),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(58),
      O => \URAM_dina[61]_i_15_n_0\
    );
\URAM_dina[61]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => URAM_doutb(61),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(29),
      O => \URAM_dina[61]_i_2_n_0\
    );
\URAM_dina[61]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \URAM_dina[61]_i_8_n_0\,
      I1 => stencilZFailOp(2),
      I2 => \URAM_dina[61]_i_9_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      O => \URAM_dina[61]_i_4_n_0\
    );
\URAM_dina[61]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I1 => \URAM_dina[61]_i_10_n_0\,
      I2 => \stencilPassOp_reg_n_0_[2]\,
      I3 => \URAM_dina[61]_i_11_n_0\,
      O => \URAM_dina[61]_i_5_n_0\
    );
\URAM_dina[61]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[61]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(5),
      I3 => stencilFailOp(1),
      I4 => stencilFailOp(0),
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[61]_i_6_n_0\
    );
\URAM_dina[61]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[61]_i_12_n_0\,
      I1 => stencilFailOp(1),
      I2 => \URAM_dina[61]_i_2_n_0\,
      I3 => stencilFailOp(0),
      I4 => \URAM_dina[61]_i_14_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[61]_i_7_n_0\
    );
\URAM_dina[61]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22FF0F0022FF0FFF"
    )
        port map (
      I0 => \URAM_dina[61]_i_12_n_0\,
      I1 => \URAM_dina[61]_i_13_n_0\,
      I2 => stencilRef(5),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[61]_i_8_n_0\
    );
\URAM_dina[61]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCBB3088FCBB30BB"
    )
        port map (
      I0 => \URAM_dina[61]_i_12_n_0\,
      I1 => stencilZFailOp(1),
      I2 => \URAM_dina[61]_i_2_n_0\,
      I3 => stencilZFailOp(0),
      I4 => \URAM_dina[61]_i_14_n_0\,
      I5 => \URAM_dina[56]_i_6_n_0\,
      O => \URAM_dina[61]_i_9_n_0\
    );
\URAM_dina[62]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFBBCF8803880388"
    )
        port map (
      I0 => \URAM_dina[62]_i_13_n_0\,
      I1 => \stencilPassOp_reg_n_0_[1]\,
      I2 => StencilTest0_carry_i_9_n_0,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => \URAM_dina[56]_i_6_n_0\,
      I5 => \URAM_dina[62]_i_14_n_0\,
      O => \URAM_dina[62]_i_10_n_0\
    );
\URAM_dina[62]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE00EE00F0FFF000"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => \URAM_dina[62]_i_13_n_0\,
      I2 => stencilRef(6),
      I3 => stencilZFailOp(1),
      I4 => StencilTest0_carry_i_9_n_0,
      I5 => stencilZFailOp(0),
      O => \URAM_dina[62]_i_11_n_0\
    );
\URAM_dina[62]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFBBCF8803880388"
    )
        port map (
      I0 => \URAM_dina[62]_i_13_n_0\,
      I1 => stencilZFailOp(1),
      I2 => StencilTest0_carry_i_9_n_0,
      I3 => stencilZFailOp(0),
      I4 => \URAM_dina[56]_i_6_n_0\,
      I5 => \URAM_dina[62]_i_14_n_0\,
      O => \URAM_dina[62]_i_12_n_0\
    );
\URAM_dina[62]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => StencilTest0_carry_i_9_n_0,
      I1 => \URAM_dina[60]_i_2_n_0\,
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => \URAM_dina[58]_i_2_n_0\,
      I4 => \URAM_dina[63]_i_18_n_0\,
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[62]_i_13_n_0\
    );
\URAM_dina[62]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
        port map (
      I0 => StencilTest0_carry_i_9_n_0,
      I1 => \URAM_dina[60]_i_2_n_0\,
      I2 => \URAM_dina[56]_i_12_n_0\,
      I3 => \URAM_dina[59]_i_2_n_0\,
      I4 => \URAM_dina[58]_i_2_n_0\,
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[62]_i_14_n_0\
    );
\URAM_dina[62]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \URAM_dina_reg[62]_i_4_n_0\,
      I1 => \stencilWriteMask_reg_n_0_[6]\,
      I2 => URAM_doutb(62),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(30),
      O => \URAM_dina[62]_i_2_n_0\
    );
\URAM_dina[62]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \URAM_dina_reg[62]_i_5_n_0\,
      I1 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I2 => \URAM_dina_reg[62]_i_6_n_0\,
      I3 => \stencilWriteMask_reg_n_0_[6]\,
      I4 => StencilTest0_carry_i_9_n_0,
      O => \URAM_dina[62]_i_3_n_0\
    );
\URAM_dina[62]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE00EE00F0FFF000"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => \URAM_dina[62]_i_13_n_0\,
      I2 => stencilRef(6),
      I3 => stencilFailOp(1),
      I4 => StencilTest0_carry_i_9_n_0,
      I5 => stencilFailOp(0),
      O => \URAM_dina[62]_i_7_n_0\
    );
\URAM_dina[62]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFBBCF8803880388"
    )
        port map (
      I0 => \URAM_dina[62]_i_13_n_0\,
      I1 => stencilFailOp(1),
      I2 => StencilTest0_carry_i_9_n_0,
      I3 => stencilFailOp(0),
      I4 => \URAM_dina[56]_i_6_n_0\,
      I5 => \URAM_dina[62]_i_14_n_0\,
      O => \URAM_dina[62]_i_8_n_0\
    );
\URAM_dina[62]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE00EE00F0FFF000"
    )
        port map (
      I0 => \URAM_dina[61]_i_13_n_0\,
      I1 => \URAM_dina[62]_i_13_n_0\,
      I2 => stencilRef(6),
      I3 => \stencilPassOp_reg_n_0_[1]\,
      I4 => StencilTest0_carry_i_9_n_0,
      I5 => \stencilPassOp_reg_n_0_[0]\,
      O => \URAM_dina[62]_i_9_n_0\
    );
\URAM_dina[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF11155515"
    )
        port map (
      I0 => \URAM_dina[63]_i_2_n_0\,
      I1 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I2 => \URAM_dina[63]_i_3_n_0\,
      I3 => \stencilPassOp_reg_n_0_[2]\,
      I4 => \URAM_dina[63]_i_4_n_0\,
      I5 => \URAM_dina[63]_i_5_n_0\,
      O => EvaluateNewStencilValue(7)
    );
\URAM_dina[63]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFE2FFFF"
    )
        port map (
      I0 => URAM_doutb(30),
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => URAM_doutb(62),
      I3 => \URAM_dina[60]_i_2_n_0\,
      I4 => \URAM_dina[63]_i_16_n_0\,
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[63]_i_10_n_0\
    );
\URAM_dina[63]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"38C738C730CFF30F"
    )
        port map (
      I0 => \URAM_dina[63]_i_13_n_0\,
      I1 => stencilFailOp(1),
      I2 => stencilFailOp(0),
      I3 => StencilTest0_carry_i_10_n_0,
      I4 => \URAM_dina[63]_i_14_n_0\,
      I5 => StencilTest0_carry_i_9_n_0,
      O => \URAM_dina[63]_i_11_n_0\
    );
\URAM_dina[63]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000A33FF0F"
    )
        port map (
      I0 => \URAM_dina[63]_i_17_n_0\,
      I1 => stencilRef(7),
      I2 => StencilTest0_carry_i_10_n_0,
      I3 => stencilFailOp(0),
      I4 => stencilFailOp(1),
      I5 => stencilFailOp(2),
      O => \URAM_dina[63]_i_12_n_0\
    );
\URAM_dina[63]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => StencilTest0_carry_i_11_n_0,
      I2 => \URAM_dina[57]_i_2_n_0\,
      I3 => \URAM_dina[58]_i_2_n_0\,
      I4 => \URAM_dina[59]_i_2_n_0\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[63]_i_13_n_0\
    );
\URAM_dina[63]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => \URAM_dina[58]_i_2_n_0\,
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => StencilTest0_carry_i_11_n_0,
      I4 => \URAM_dina[57]_i_2_n_0\,
      I5 => \URAM_dina[60]_i_2_n_0\,
      O => \URAM_dina[63]_i_14_n_0\
    );
\URAM_dina[63]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A80000000000000"
    )
        port map (
      I0 => StencilTest0_carry_i_11_n_0,
      I1 => URAM_doutb(57),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(25),
      I4 => \URAM_dina[58]_i_2_n_0\,
      I5 => \URAM_dina[59]_i_2_n_0\,
      O => \URAM_dina[63]_i_15_n_0\
    );
\URAM_dina[63]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000010101"
    )
        port map (
      I0 => \URAM_dina[58]_i_2_n_0\,
      I1 => \URAM_dina[59]_i_2_n_0\,
      I2 => StencilTest0_carry_i_11_n_0,
      I3 => URAM_doutb(57),
      I4 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I5 => URAM_doutb(25),
      O => \URAM_dina[63]_i_16_n_0\
    );
\URAM_dina[63]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => StencilTest0_carry_i_9_n_0,
      I1 => \URAM_dina[60]_i_2_n_0\,
      I2 => \URAM_dina[59]_i_2_n_0\,
      I3 => \URAM_dina[58]_i_2_n_0\,
      I4 => \URAM_dina[63]_i_18_n_0\,
      I5 => \URAM_dina[61]_i_2_n_0\,
      O => \URAM_dina[63]_i_17_n_0\
    );
\URAM_dina[63]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => URAM_doutb(25),
      I1 => URAM_doutb(57),
      I2 => URAM_doutb(24),
      I3 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I4 => URAM_doutb(56),
      O => \URAM_dina[63]_i_18_n_0\
    );
\URAM_dina[63]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F7777777F77"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I1 => \stencilWriteMask_reg_n_0_[7]\,
      I2 => RAST_PixelPassedDepthStencilTest_i_2_n_0,
      I3 => \URAM_dina[63]_i_6_n_0\,
      I4 => stencilZFailOp(2),
      I5 => \URAM_dina[63]_i_7_n_0\,
      O => \URAM_dina[63]_i_2_n_0\
    );
\URAM_dina[63]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AF30AF3F"
    )
        port map (
      I0 => \URAM_dina[63]_i_8_n_0\,
      I1 => stencilRef(7),
      I2 => \stencilPassOp_reg_n_0_[1]\,
      I3 => \stencilPassOp_reg_n_0_[0]\,
      I4 => StencilTest0_carry_i_10_n_0,
      O => \URAM_dina[63]_i_3_n_0\
    );
\URAM_dina[63]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"38CBFB0B"
    )
        port map (
      I0 => \URAM_dina[63]_i_9_n_0\,
      I1 => \stencilPassOp_reg_n_0_[1]\,
      I2 => \stencilPassOp_reg_n_0_[0]\,
      I3 => StencilTest0_carry_i_10_n_0,
      I4 => \URAM_dina[63]_i_10_n_0\,
      O => \URAM_dina[63]_i_4_n_0\
    );
\URAM_dina[63]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0007FFFF00070000"
    )
        port map (
      I0 => \URAM_dina[63]_i_11_n_0\,
      I1 => stencilFailOp(2),
      I2 => \URAM_dina[63]_i_12_n_0\,
      I3 => RAST_PixelPassedDepthStencilTest_i_3_n_0,
      I4 => \stencilWriteMask_reg_n_0_[7]\,
      I5 => StencilTest0_carry_i_10_n_0,
      O => \URAM_dina[63]_i_5_n_0\
    );
\URAM_dina[63]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF0F0077FF0FFF"
    )
        port map (
      I0 => \URAM_dina[63]_i_13_n_0\,
      I1 => StencilTest0_carry_i_9_n_0,
      I2 => stencilRef(7),
      I3 => stencilZFailOp(1),
      I4 => stencilZFailOp(0),
      I5 => StencilTest0_carry_i_10_n_0,
      O => \URAM_dina[63]_i_6_n_0\
    );
\URAM_dina[63]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"38C738C730CFF30F"
    )
        port map (
      I0 => \URAM_dina[63]_i_13_n_0\,
      I1 => stencilZFailOp(1),
      I2 => stencilZFailOp(0),
      I3 => StencilTest0_carry_i_10_n_0,
      I4 => \URAM_dina[63]_i_14_n_0\,
      I5 => StencilTest0_carry_i_9_n_0,
      O => \URAM_dina[63]_i_7_n_0\
    );
\URAM_dina[63]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007FFF"
    )
        port map (
      I0 => \URAM_dina[61]_i_2_n_0\,
      I1 => \URAM_dina[63]_i_15_n_0\,
      I2 => \URAM_dina[60]_i_2_n_0\,
      I3 => StencilTest0_carry_i_9_n_0,
      I4 => StencilTest0_carry_i_10_n_0,
      O => \URAM_dina[63]_i_8_n_0\
    );
\URAM_dina[63]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"95555555"
    )
        port map (
      I0 => StencilTest0_carry_i_10_n_0,
      I1 => \URAM_dina[61]_i_2_n_0\,
      I2 => \URAM_dina[63]_i_15_n_0\,
      I3 => \URAM_dina[60]_i_2_n_0\,
      I4 => StencilTest0_carry_i_9_n_0,
      O => \URAM_dina[63]_i_9_n_0\
    );
\URAM_dina_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(0),
      Q => URAM_dina(0),
      R => '0'
    );
\URAM_dina_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(1),
      Q => URAM_dina(1),
      R => '0'
    );
\URAM_dina_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(2),
      Q => URAM_dina(2),
      R => '0'
    );
\URAM_dina_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(3),
      Q => URAM_dina(3),
      R => '0'
    );
\URAM_dina_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(4),
      Q => URAM_dina(4),
      R => '0'
    );
\URAM_dina_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(5),
      Q => URAM_dina(5),
      R => '0'
    );
\URAM_dina_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(6),
      Q => URAM_dina(6),
      R => '0'
    );
\URAM_dina_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(7),
      Q => URAM_dina(7),
      R => '0'
    );
\URAM_dina_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(8),
      Q => URAM_dina(8),
      R => '0'
    );
\URAM_dina_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(9),
      Q => URAM_dina(9),
      R => '0'
    );
\URAM_dina_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(10),
      Q => URAM_dina(10),
      R => '0'
    );
\URAM_dina_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(11),
      Q => URAM_dina(11),
      R => '0'
    );
\URAM_dina_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(12),
      Q => URAM_dina(12),
      R => '0'
    );
\URAM_dina_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(13),
      Q => URAM_dina(13),
      R => '0'
    );
\URAM_dina_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(14),
      Q => URAM_dina(14),
      R => '0'
    );
\URAM_dina_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(15),
      Q => URAM_dina(15),
      R => '0'
    );
\URAM_dina_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(16),
      Q => URAM_dina(16),
      R => '0'
    );
\URAM_dina_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(17),
      Q => URAM_dina(17),
      R => '0'
    );
\URAM_dina_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(18),
      Q => URAM_dina(18),
      R => '0'
    );
\URAM_dina_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(19),
      Q => URAM_dina(19),
      R => '0'
    );
\URAM_dina_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(20),
      Q => URAM_dina(20),
      R => '0'
    );
\URAM_dina_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(21),
      Q => URAM_dina(21),
      R => '0'
    );
\URAM_dina_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(22),
      Q => URAM_dina(22),
      R => '0'
    );
\URAM_dina_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[4][pixelTestDepth]\(23),
      Q => URAM_dina(23),
      R => '0'
    );
\URAM_dina_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(0),
      Q => URAM_dina(24),
      R => '0'
    );
\URAM_dina_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(1),
      Q => URAM_dina(25),
      R => '0'
    );
\URAM_dina_reg[57]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[57]_i_6_n_0\,
      I1 => \URAM_dina[57]_i_7_n_0\,
      O => \URAM_dina_reg[57]_i_3_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(2),
      Q => URAM_dina(26),
      R => '0'
    );
\URAM_dina_reg[58]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[58]_i_6_n_0\,
      I1 => \URAM_dina[58]_i_7_n_0\,
      O => \URAM_dina_reg[58]_i_3_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(3),
      Q => URAM_dina(27),
      R => '0'
    );
\URAM_dina_reg[59]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[59]_i_6_n_0\,
      I1 => \URAM_dina[59]_i_7_n_0\,
      O => \URAM_dina_reg[59]_i_3_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(4),
      Q => URAM_dina(28),
      R => '0'
    );
\URAM_dina_reg[60]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[60]_i_6_n_0\,
      I1 => \URAM_dina[60]_i_7_n_0\,
      O => \URAM_dina_reg[60]_i_3_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(5),
      Q => URAM_dina(29),
      R => '0'
    );
\URAM_dina_reg[61]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[61]_i_6_n_0\,
      I1 => \URAM_dina[61]_i_7_n_0\,
      O => \URAM_dina_reg[61]_i_3_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(6),
      Q => URAM_dina(30),
      R => '0'
    );
\URAM_dina_reg[62]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[62]_i_2_n_0\,
      I1 => \URAM_dina[62]_i_3_n_0\,
      O => EvaluateNewStencilValue(6),
      S => RAST_PixelPassedDepthStencilTest_i_3_n_0
    );
\URAM_dina_reg[62]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[62]_i_7_n_0\,
      I1 => \URAM_dina[62]_i_8_n_0\,
      O => \URAM_dina_reg[62]_i_4_n_0\,
      S => stencilFailOp(2)
    );
\URAM_dina_reg[62]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[62]_i_9_n_0\,
      I1 => \URAM_dina[62]_i_10_n_0\,
      O => \URAM_dina_reg[62]_i_5_n_0\,
      S => \stencilPassOp_reg_n_0_[2]\
    );
\URAM_dina_reg[62]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \URAM_dina[62]_i_11_n_0\,
      I1 => \URAM_dina[62]_i_12_n_0\,
      O => \URAM_dina_reg[62]_i_6_n_0\,
      S => stencilZFailOp(2)
    );
\URAM_dina_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => EvaluateNewStencilValue(7),
      Q => URAM_dina(31),
      R => '0'
    );
\URAM_wea[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => depthWriteEnable,
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      O => p_1_in(2)
    );
\URAM_wea[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5D5D5DFF"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_1_n_0,
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => clearModeEnable_reg_n_0,
      I3 => stencilWriteEnable_reg_n_0,
      I4 => depthWriteEnable,
      O => URAM_wea_0(3)
    );
\URAM_wea[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => stencilWriteEnable_reg_n_0,
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      O => p_1_in(3)
    );
\URAM_wea[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => depthWriteEnable,
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => clearModeEnable_reg_n_0,
      O => p_1_in(6)
    );
\URAM_wea[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"575757FF"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_1_n_0,
      I1 => stencilWriteEnable_reg_n_0,
      I2 => depthWriteEnable,
      I3 => clearModeEnable_reg_n_0,
      I4 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      O => URAM_wea_0(7)
    );
\URAM_wea[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => stencilWriteEnable_reg_n_0,
      I1 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I2 => clearModeEnable_reg_n_0,
      O => p_1_in(7)
    );
\URAM_wea_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(2),
      Q => URAM_wea(0),
      R => URAM_wea_0(3)
    );
\URAM_wea_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(3),
      Q => URAM_wea(1),
      R => URAM_wea_0(3)
    );
\URAM_wea_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(6),
      Q => URAM_wea(2),
      R => URAM_wea_0(7)
    );
\URAM_wea_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in(7),
      Q => URAM_wea(3),
      R => URAM_wea_0(7)
    );
\clearDepthValue_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(0),
      Q => clearDepthValue(0),
      R => '0'
    );
\clearDepthValue_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(10),
      Q => clearDepthValue(10),
      R => '0'
    );
\clearDepthValue_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(11),
      Q => clearDepthValue(11),
      R => '0'
    );
\clearDepthValue_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(12),
      Q => clearDepthValue(12),
      R => '0'
    );
\clearDepthValue_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(13),
      Q => clearDepthValue(13),
      R => '0'
    );
\clearDepthValue_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(14),
      Q => clearDepthValue(14),
      R => '0'
    );
\clearDepthValue_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(15),
      Q => clearDepthValue(15),
      R => '0'
    );
\clearDepthValue_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(16),
      Q => clearDepthValue(16),
      R => '0'
    );
\clearDepthValue_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(17),
      Q => clearDepthValue(17),
      R => '0'
    );
\clearDepthValue_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(18),
      Q => clearDepthValue(18),
      R => '0'
    );
\clearDepthValue_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(19),
      Q => clearDepthValue(19),
      R => '0'
    );
\clearDepthValue_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(1),
      Q => clearDepthValue(1),
      R => '0'
    );
\clearDepthValue_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(20),
      Q => clearDepthValue(20),
      R => '0'
    );
\clearDepthValue_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(21),
      Q => clearDepthValue(21),
      R => '0'
    );
\clearDepthValue_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(22),
      Q => clearDepthValue(22),
      R => '0'
    );
\clearDepthValue_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(23),
      Q => clearDepthValue(23),
      R => '0'
    );
\clearDepthValue_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(2),
      Q => clearDepthValue(2),
      R => '0'
    );
\clearDepthValue_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(3),
      Q => clearDepthValue(3),
      R => '0'
    );
\clearDepthValue_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(4),
      Q => clearDepthValue(4),
      R => '0'
    );
\clearDepthValue_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(5),
      Q => clearDepthValue(5),
      R => '0'
    );
\clearDepthValue_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(6),
      Q => clearDepthValue(6),
      R => '0'
    );
\clearDepthValue_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(7),
      Q => clearDepthValue(7),
      R => '0'
    );
\clearDepthValue_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(8),
      Q => clearDepthValue(8),
      R => '0'
    );
\clearDepthValue_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => CMD_ClearDepthValue(9),
      Q => clearDepthValue(9),
      R => '0'
    );
\clearModeAddress[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \clearModeAddress[0]_i_3_n_0\,
      I1 => clearModeEnable_reg_n_0,
      O => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAA8AAA8A8A8"
    )
        port map (
      I0 => clearModeAddress_reg(17),
      I1 => clearModeAddress_reg(15),
      I2 => clearModeAddress_reg(16),
      I3 => clearModeAddress_reg(14),
      I4 => \clearModeAddress[0]_i_5_n_0\,
      I5 => clearModeAddress_reg(13),
      O => \clearModeAddress[0]_i_3_n_0\
    );
\clearModeAddress[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clearModeAddress_reg(0),
      O => \clearModeAddress[0]_i_4_n_0\
    );
\clearModeAddress[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888A888888888888"
    )
        port map (
      I0 => clearModeAddress_reg(12),
      I1 => clearModeAddress_reg(11),
      I2 => \clearModeAddress[0]_i_6_n_0\,
      I3 => \clearModeAddress[0]_i_7_n_0\,
      I4 => clearModeAddress_reg(0),
      I5 => clearModeAddress_reg(5),
      O => \clearModeAddress[0]_i_5_n_0\
    );
\clearModeAddress[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => clearModeAddress_reg(2),
      I1 => clearModeAddress_reg(4),
      I2 => clearModeAddress_reg(3),
      O => \clearModeAddress[0]_i_6_n_0\
    );
\clearModeAddress[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => clearModeAddress_reg(6),
      I1 => clearModeAddress_reg(10),
      I2 => clearModeAddress_reg(8),
      I3 => clearModeAddress_reg(9),
      I4 => clearModeAddress_reg(1),
      I5 => clearModeAddress_reg(7),
      O => \clearModeAddress[0]_i_7_n_0\
    );
\clearModeAddress_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_15\,
      Q => clearModeAddress_reg(0),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \clearModeAddress_reg[0]_i_2_n_0\,
      CO(6) => \clearModeAddress_reg[0]_i_2_n_1\,
      CO(5) => \clearModeAddress_reg[0]_i_2_n_2\,
      CO(4) => \clearModeAddress_reg[0]_i_2_n_3\,
      CO(3) => \NLW_clearModeAddress_reg[0]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \clearModeAddress_reg[0]_i_2_n_5\,
      CO(1) => \clearModeAddress_reg[0]_i_2_n_6\,
      CO(0) => \clearModeAddress_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \clearModeAddress_reg[0]_i_2_n_8\,
      O(6) => \clearModeAddress_reg[0]_i_2_n_9\,
      O(5) => \clearModeAddress_reg[0]_i_2_n_10\,
      O(4) => \clearModeAddress_reg[0]_i_2_n_11\,
      O(3) => \clearModeAddress_reg[0]_i_2_n_12\,
      O(2) => \clearModeAddress_reg[0]_i_2_n_13\,
      O(1) => \clearModeAddress_reg[0]_i_2_n_14\,
      O(0) => \clearModeAddress_reg[0]_i_2_n_15\,
      S(7 downto 1) => clearModeAddress_reg(7 downto 1),
      S(0) => \clearModeAddress[0]_i_4_n_0\
    );
\clearModeAddress_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_13\,
      Q => clearModeAddress_reg(10),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_12\,
      Q => clearModeAddress_reg(11),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_11\,
      Q => clearModeAddress_reg(12),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_10\,
      Q => clearModeAddress_reg(13),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_9\,
      Q => clearModeAddress_reg(14),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_8\,
      Q => clearModeAddress_reg(15),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[16]_i_1_n_15\,
      Q => clearModeAddress_reg(16),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \clearModeAddress_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_clearModeAddress_reg[16]_i_1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \clearModeAddress_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_clearModeAddress_reg[16]_i_1_O_UNCONNECTED\(7 downto 2),
      O(1) => \clearModeAddress_reg[16]_i_1_n_14\,
      O(0) => \clearModeAddress_reg[16]_i_1_n_15\,
      S(7 downto 2) => B"000000",
      S(1 downto 0) => clearModeAddress_reg(17 downto 16)
    );
\clearModeAddress_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[16]_i_1_n_14\,
      Q => clearModeAddress_reg(17),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_14\,
      Q => clearModeAddress_reg(1),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_13\,
      Q => clearModeAddress_reg(2),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_12\,
      Q => clearModeAddress_reg(3),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_11\,
      Q => clearModeAddress_reg(4),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_10\,
      Q => clearModeAddress_reg(5),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_9\,
      Q => clearModeAddress_reg(6),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[0]_i_2_n_8\,
      Q => clearModeAddress_reg(7),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_15\,
      Q => clearModeAddress_reg(8),
      R => \clearModeAddress[0]_i_1_n_0\
    );
\clearModeAddress_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \clearModeAddress_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \clearModeAddress_reg[8]_i_1_n_0\,
      CO(6) => \clearModeAddress_reg[8]_i_1_n_1\,
      CO(5) => \clearModeAddress_reg[8]_i_1_n_2\,
      CO(4) => \clearModeAddress_reg[8]_i_1_n_3\,
      CO(3) => \NLW_clearModeAddress_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \clearModeAddress_reg[8]_i_1_n_5\,
      CO(1) => \clearModeAddress_reg[8]_i_1_n_6\,
      CO(0) => \clearModeAddress_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \clearModeAddress_reg[8]_i_1_n_8\,
      O(6) => \clearModeAddress_reg[8]_i_1_n_9\,
      O(5) => \clearModeAddress_reg[8]_i_1_n_10\,
      O(4) => \clearModeAddress_reg[8]_i_1_n_11\,
      O(3) => \clearModeAddress_reg[8]_i_1_n_12\,
      O(2) => \clearModeAddress_reg[8]_i_1_n_13\,
      O(1) => \clearModeAddress_reg[8]_i_1_n_14\,
      O(0) => \clearModeAddress_reg[8]_i_1_n_15\,
      S(7 downto 0) => clearModeAddress_reg(15 downto 8)
    );
\clearModeAddress_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearModeEnable_reg_n_0,
      D => \clearModeAddress_reg[8]_i_1_n_14\,
      Q => clearModeAddress_reg(9),
      R => \clearModeAddress[0]_i_1_n_0\
    );
clearModeCompleted_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \clearModeAddress[0]_i_3_n_0\,
      I1 => clearModeEnable_reg_n_0,
      I2 => clearModeCompleted,
      O => clearModeCompleted_i_1_n_0
    );
clearModeCompleted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => clearModeCompleted_i_1_n_0,
      Q => clearModeCompleted,
      R => '0'
    );
clearModeEnable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"53535350"
    )
        port map (
      I0 => clearModeCompleted,
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => CMD_ClearDepthBuffer,
      I4 => CMD_ClearStencilBuffer,
      O => clearModeEnable_i_1_n_0
    );
clearModeEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => clearModeEnable_i_1_n_0,
      Q => clearModeEnable_reg_n_0,
      R => '0'
    );
\clearSaveDepthCompareFunc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentDepthCompareFunc_reg_n_0_[0]\,
      Q => \clearSaveDepthCompareFunc_reg_n_0_[0]\,
      R => '0'
    );
\clearSaveDepthCompareFunc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentDepthCompareFunc_reg_n_0_[1]\,
      Q => \clearSaveDepthCompareFunc_reg_n_0_[1]\,
      R => '0'
    );
\clearSaveDepthCompareFunc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentDepthCompareFunc_reg_n_0_[2]\,
      Q => \clearSaveDepthCompareFunc_reg_n_0_[2]\,
      R => '0'
    );
clearSaveDepthWriteEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => depthWriteEnable,
      Q => clearSaveDepthWriteEnable_reg_n_0,
      R => '0'
    );
\clearSaveStencilCompareFunc_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentStencilCompareFunc_reg_n_0_[0]\,
      Q => clearSaveStencilCompareFunc(0),
      R => '0'
    );
\clearSaveStencilCompareFunc_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentStencilCompareFunc_reg_n_0_[1]\,
      Q => clearSaveStencilCompareFunc(1),
      R => '0'
    );
\clearSaveStencilCompareFunc_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \currentStencilCompareFunc_reg_n_0_[2]\,
      Q => clearSaveStencilCompareFunc(2),
      R => '0'
    );
\clearSaveStencilPassOp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilPassOp_reg_n_0_[0]\,
      Q => clearSaveStencilPassOp(0),
      R => '0'
    );
\clearSaveStencilPassOp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilPassOp_reg_n_0_[1]\,
      Q => clearSaveStencilPassOp(1),
      R => '0'
    );
\clearSaveStencilPassOp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilPassOp_reg_n_0_[2]\,
      Q => clearSaveStencilPassOp(2),
      R => '0'
    );
\clearSaveStencilRef[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
        port map (
      I0 => CMD_ClearStencilBuffer,
      I1 => CMD_ClearDepthBuffer,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_SetDepthParams,
      O => clearSaveDepthCompareFunc
    );
\clearSaveStencilRef_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(0),
      Q => clearSaveStencilRef(0),
      R => '0'
    );
\clearSaveStencilRef_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(1),
      Q => clearSaveStencilRef(1),
      R => '0'
    );
\clearSaveStencilRef_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(2),
      Q => clearSaveStencilRef(2),
      R => '0'
    );
\clearSaveStencilRef_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(3),
      Q => clearSaveStencilRef(3),
      R => '0'
    );
\clearSaveStencilRef_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(4),
      Q => clearSaveStencilRef(4),
      R => '0'
    );
\clearSaveStencilRef_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(5),
      Q => clearSaveStencilRef(5),
      R => '0'
    );
\clearSaveStencilRef_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(6),
      Q => clearSaveStencilRef(6),
      R => '0'
    );
\clearSaveStencilRef_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilRef(7),
      Q => clearSaveStencilRef(7),
      R => '0'
    );
clearSaveStencilWriteEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => stencilWriteEnable_reg_n_0,
      Q => clearSaveStencilWriteEnable,
      R => '0'
    );
\clearSaveStencilWriteMask_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[0]\,
      Q => clearSaveStencilWriteMask(0),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[1]\,
      Q => clearSaveStencilWriteMask(1),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[2]\,
      Q => clearSaveStencilWriteMask(2),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[3]\,
      Q => clearSaveStencilWriteMask(3),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[4]\,
      Q => clearSaveStencilWriteMask(4),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[5]\,
      Q => clearSaveStencilWriteMask(5),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[6]\,
      Q => clearSaveStencilWriteMask(6),
      R => '0'
    );
\clearSaveStencilWriteMask_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => clearSaveDepthCompareFunc,
      D => \stencilWriteMask_reg_n_0_[7]\,
      Q => clearSaveStencilWriteMask(7),
      R => '0'
    );
\currentDepthCompareFunc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_DepthFunction(0),
      I2 => \clearSaveDepthCompareFunc_reg_n_0_[0]\,
      I3 => clearModeEnable_reg_n_0,
      O => \currentDepthCompareFunc[0]_i_1_n_0\
    );
\currentDepthCompareFunc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => \clearSaveDepthCompareFunc_reg_n_0_[1]\,
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_DepthFunction(1),
      O => \currentDepthCompareFunc[1]_i_1_n_0\
    );
\currentDepthCompareFunc[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_DepthFunction(2),
      I2 => \clearSaveDepthCompareFunc_reg_n_0_[2]\,
      I3 => clearModeEnable_reg_n_0,
      O => \currentDepthCompareFunc[2]_i_1_n_0\
    );
\currentDepthCompareFunc_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentDepthCompareFunc[0]_i_1_n_0\,
      Q => \currentDepthCompareFunc_reg_n_0_[0]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentDepthCompareFunc_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentDepthCompareFunc[1]_i_1_n_0\,
      Q => \currentDepthCompareFunc_reg_n_0_[1]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentDepthCompareFunc_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentDepthCompareFunc[2]_i_1_n_0\,
      Q => \currentDepthCompareFunc_reg_n_0_[2]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentStencilCompareFunc[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_StencilCmpFunc(0),
      I2 => clearSaveStencilCompareFunc(0),
      I3 => clearModeEnable_reg_n_0,
      O => \currentStencilCompareFunc[0]_i_1_n_0\
    );
\currentStencilCompareFunc[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilCompareFunc(1),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilCmpFunc(1),
      O => \currentStencilCompareFunc[1]_i_1_n_0\
    );
\currentStencilCompareFunc[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1110"
    )
        port map (
      I0 => clearModeEnable_reg_n_0,
      I1 => RAST_SetDepthParams,
      I2 => CMD_ClearDepthBuffer,
      I3 => CMD_ClearStencilBuffer,
      O => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentStencilCompareFunc[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilCompareFunc(2),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilCmpFunc(2),
      O => \currentStencilCompareFunc[2]_i_2_n_0\
    );
\currentStencilCompareFunc_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentStencilCompareFunc[0]_i_1_n_0\,
      Q => \currentStencilCompareFunc_reg_n_0_[0]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentStencilCompareFunc_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentStencilCompareFunc[1]_i_1_n_0\,
      Q => \currentStencilCompareFunc_reg_n_0_[1]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\currentStencilCompareFunc_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \currentStencilCompareFunc[2]_i_2_n_0\,
      Q => \currentStencilCompareFunc_reg_n_0_[2]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\depthPipeline[0][isOddAddress]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosX(0),
      I1 => RAST_PixelReady,
      O => \depthPipeline[0][isOddAddress]\
    );
\depthPipeline[0][pixelAddress]0__0_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \depthPipeline[0][pixelAddress]0__0_carry_n_0\,
      CO(6) => \depthPipeline[0][pixelAddress]0__0_carry_n_1\,
      CO(5) => \depthPipeline[0][pixelAddress]0__0_carry_n_2\,
      CO(4) => \depthPipeline[0][pixelAddress]0__0_carry_n_3\,
      CO(3) => \NLW_depthPipeline[0][pixelAddress]0__0_carry_CO_UNCONNECTED\(3),
      CO(2) => \depthPipeline[0][pixelAddress]0__0_carry_n_5\,
      CO(1) => \depthPipeline[0][pixelAddress]0__0_carry_n_6\,
      CO(0) => \depthPipeline[0][pixelAddress]0__0_carry_n_7\,
      DI(7) => \depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0\,
      DI(6) => \depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0\,
      DI(5) => \depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0\,
      DI(4) => \depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0\,
      DI(3 downto 1) => RAST_PosY(2 downto 0),
      DI(0) => '0',
      O(7) => \depthPipeline[0][pixelAddress]0__0_carry_n_8\,
      O(6) => \depthPipeline[0][pixelAddress]0__0_carry_n_9\,
      O(5) => \depthPipeline[0][pixelAddress]0__0_carry_n_10\,
      O(4) => \depthPipeline[0][pixelAddress]0__0_carry_n_11\,
      O(3) => \depthPipeline[0][pixelAddress]0__0_carry_n_12\,
      O(2) => \depthPipeline[0][pixelAddress]0__0_carry_n_13\,
      O(1) => \depthPipeline[0][pixelAddress]0__0_carry_n_14\,
      O(0) => \depthPipeline[0][pixelAddress]0__0_carry_n_15\,
      S(7) => \depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0\,
      S(6) => \depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0\,
      S(5) => \depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0\,
      S(4) => \depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0\,
      S(3) => \depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0\,
      S(2) => \depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0\,
      S(1) => \depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0\,
      S(0) => RAST_PosX(6)
    );
\depthPipeline[0][pixelAddress]0__0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \depthPipeline[0][pixelAddress]0__0_carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_depthPipeline[0][pixelAddress]0__0_carry__0_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_5\,
      CO(1) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_6\,
      CO(0) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_7\,
      DI(7 downto 4) => B"0000",
      DI(3) => RAST_PosY(8),
      DI(2) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0\,
      DI(1) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0\,
      DI(0) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0\,
      O(7 downto 5) => \NLW_depthPipeline[0][pixelAddress]0__0_carry__0_O_UNCONNECTED\(7 downto 5),
      O(4) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_11\,
      O(3) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_12\,
      O(2) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_13\,
      O(1) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_14\,
      O(0) => \depthPipeline[0][pixelAddress]0__0_carry__0_n_15\,
      S(7 downto 5) => B"000",
      S(4) => RAST_PosY(9),
      S(3) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0\,
      S(2) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0\,
      S(1) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0\,
      S(0) => \depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(6),
      I1 => RAST_PosY(8),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(5),
      I1 => RAST_PosY(7),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(4),
      I1 => RAST_PosY(6),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => RAST_PosY(9),
      I1 => RAST_PosY(7),
      I2 => RAST_PosY(8),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(8),
      I1 => RAST_PosY(6),
      I2 => RAST_PosY(9),
      I3 => RAST_PosY(7),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(7),
      I1 => RAST_PosY(5),
      I2 => RAST_PosY(8),
      I3 => RAST_PosY(6),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(6),
      I1 => RAST_PosY(4),
      I2 => RAST_PosY(7),
      I3 => RAST_PosY(5),
      O => \depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(3),
      I1 => RAST_PosY(5),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => RAST_PosY(1),
      I1 => RAST_PosX(8),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => RAST_PosY(0),
      I1 => RAST_PosX(7),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(2),
      I1 => RAST_PosY(4),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosY(1),
      I1 => RAST_PosY(3),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => RAST_PosX(9),
      I1 => RAST_PosY(0),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(5),
      I1 => RAST_PosY(3),
      I2 => RAST_PosY(6),
      I3 => RAST_PosY(4),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(4),
      I1 => RAST_PosY(2),
      I2 => RAST_PosY(5),
      I3 => RAST_PosY(3),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(3),
      I1 => RAST_PosY(1),
      I2 => RAST_PosY(4),
      I3 => RAST_PosY(2),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => RAST_PosY(0),
      I1 => RAST_PosX(9),
      I2 => RAST_PosY(3),
      I3 => RAST_PosY(1),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0\
    );
\depthPipeline[0][pixelAddress]0__0_carry_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => RAST_PosY(0),
      I1 => RAST_PosX(9),
      I2 => RAST_PosY(2),
      O => \depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0\
    );
\depthPipeline[0][pixelAddress][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(0),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PosX(1),
      O => \depthPipeline[0][pixelAddress][0]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(10),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_10\,
      O => \depthPipeline[0][pixelAddress][10]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(11),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_9\,
      O => \depthPipeline[0][pixelAddress][11]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(12),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_8\,
      O => \depthPipeline[0][pixelAddress][12]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(13),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry__0_n_15\,
      O => \depthPipeline[0][pixelAddress][13]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(14),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry__0_n_14\,
      O => \depthPipeline[0][pixelAddress][14]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(15),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry__0_n_13\,
      O => \depthPipeline[0][pixelAddress][15]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(16),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry__0_n_12\,
      O => \depthPipeline[0][pixelAddress][16]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clearModeEnable_reg_n_0,
      I1 => RAST_PixelReady,
      O => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline[0][pixelAddress][17]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(17),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry__0_n_11\,
      O => \depthPipeline[0][pixelAddress][17]_i_2_n_0\
    );
\depthPipeline[0][pixelAddress][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(1),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PosX(2),
      O => \depthPipeline[0][pixelAddress][1]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(2),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PosX(3),
      O => \depthPipeline[0][pixelAddress][2]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(3),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PosX(4),
      O => \depthPipeline[0][pixelAddress][3]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(4),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PosX(5),
      O => \depthPipeline[0][pixelAddress][4]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(5),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_15\,
      O => \depthPipeline[0][pixelAddress][5]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(6),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_14\,
      O => \depthPipeline[0][pixelAddress][6]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(7),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_13\,
      O => \depthPipeline[0][pixelAddress][7]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(8),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_12\,
      O => \depthPipeline[0][pixelAddress][8]_i_1_n_0\
    );
\depthPipeline[0][pixelAddress][9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => clearModeAddress_reg(9),
      I1 => clearModeEnable_reg_n_0,
      I2 => \depthPipeline[0][pixelAddress]0__0_carry_n_11\,
      O => \depthPipeline[0][pixelAddress][9]_i_1_n_0\
    );
\depthPipeline_reg[0][isOddAddress]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][isOddAddress]\,
      Q => \depthPipeline_reg[0][isOddAddress]__0\,
      R => clearModeEnable_reg_n_0
    );
\depthPipeline_reg[0][pixelAddress][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][0]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(0),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][10]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(10),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][11]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(11),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][12]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(12),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][13]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(13),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][14]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(14),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][15]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(15),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][16]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(16),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][17]_i_2_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(17),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][1]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(1),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][2]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(2),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][3]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(3),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][4]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(4),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][5]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(5),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][6]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(6),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][7]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(7),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][8]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(8),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelAddress][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline[0][pixelAddress][9]_i_1_n_0\,
      Q => \depthPipeline_reg[0][pixelAddress]\(9),
      R => \depthPipeline[0][pixelAddress]\
    );
\depthPipeline_reg[0][pixelEnabled]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => RAST_PixelReady,
      Q => \depthPipeline_reg[0][pixelEnabled]__0\,
      S => clearModeEnable_reg_n_0
    );
\depthPipeline_reg[1][pixelEnabled]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[0][pixelEnabled]__0\,
      Q => \depthPipeline_reg[1][pixelEnabled]__0\,
      R => '0'
    );
\depthPipeline_reg[2][pixelEnabled]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[1][pixelEnabled]__0\,
      Q => \depthPipeline_reg[2][pixelEnabled]__0\,
      R => '0'
    );
\depthPipeline_reg[3][isOddAddress]_srl3\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][isOddAddress]__0\,
      Q => \depthPipeline_reg[3][isOddAddress]_srl3_n_0\
    );
\depthPipeline_reg[3][pixelEnabled]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[2][pixelEnabled]__0\,
      Q => \depthPipeline_reg[3][pixelEnabled]__0\,
      R => '0'
    );
\depthPipeline_reg[3][pixelTestDepth][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(0),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(0),
      O => \depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][10]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(10),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(10),
      O => \depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][11]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(11),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(11),
      O => \depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][12]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(12),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(12),
      O => \depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][13]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(13),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(13),
      O => \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][14]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(14),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(14),
      O => \depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][15]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(15),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(15),
      O => \depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][16]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(16),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(16),
      O => \depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][17]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(17),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(17),
      O => \depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][18]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(18),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(18),
      O => \depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][19]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(19),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(19),
      O => \depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(1),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(1),
      O => \depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][20]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(20),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(20),
      O => \depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][21]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(21),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(21),
      O => \depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][22]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(22),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(22),
      O => \depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][23]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(23),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(23),
      O => \depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][2]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(2),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(2),
      O => \depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][3]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(3),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(3),
      O => \depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][4]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(4),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(4),
      O => \depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][5]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(5),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(5),
      O => \depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][6]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(6),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(6),
      O => \depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][7]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(7),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(7),
      O => \depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(8),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(8),
      O => \depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][9]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0\,
      Q => \depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0\
    );
\depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearDepthValue(9),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_PixelReady,
      I3 => RAST_InPixelDepth(9),
      O => \depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0\
    );
\depthPipeline_reg[4][isOddAddress]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][isOddAddress]_srl3_n_0\,
      Q => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      R => '0'
    );
\depthPipeline_reg[4][pixelAddress][0]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(0),
      Q => \depthPipeline_reg[4][pixelAddress][0]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][10]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(10),
      Q => \depthPipeline_reg[4][pixelAddress][10]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][11]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(11),
      Q => \depthPipeline_reg[4][pixelAddress][11]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][12]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(12),
      Q => \depthPipeline_reg[4][pixelAddress][12]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][13]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(13),
      Q => \depthPipeline_reg[4][pixelAddress][13]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][14]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(14),
      Q => \depthPipeline_reg[4][pixelAddress][14]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][15]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(15),
      Q => \depthPipeline_reg[4][pixelAddress][15]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][16]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(16),
      Q => \depthPipeline_reg[4][pixelAddress][16]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][17]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(17),
      Q => \depthPipeline_reg[4][pixelAddress][17]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(1),
      Q => \depthPipeline_reg[4][pixelAddress][1]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][2]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(2),
      Q => \depthPipeline_reg[4][pixelAddress][2]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][3]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(3),
      Q => \depthPipeline_reg[4][pixelAddress][3]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][4]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(4),
      Q => \depthPipeline_reg[4][pixelAddress][4]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][5]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(5),
      Q => \depthPipeline_reg[4][pixelAddress][5]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][6]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(6),
      Q => \depthPipeline_reg[4][pixelAddress][6]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][7]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(7),
      Q => \depthPipeline_reg[4][pixelAddress][7]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][8]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(8),
      Q => \depthPipeline_reg[4][pixelAddress][8]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelAddress][9]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \depthPipeline_reg[0][pixelAddress]\(9),
      Q => \depthPipeline_reg[4][pixelAddress][9]_srl4_n_0\
    );
\depthPipeline_reg[4][pixelEnabled]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelEnabled]__0\,
      Q => \depthPipeline_reg[4][pixelEnabled]__0\,
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(0),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(10),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(11),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(12),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(13),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(14),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(15),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(16),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(17),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(18),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(19),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(1),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(20),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(21),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(22),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(23),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(2),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(3),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(4),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(5),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(6),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(7),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(8),
      R => '0'
    );
\depthPipeline_reg[4][pixelTestDepth][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0\,
      Q => \depthPipeline_reg[4][pixelTestDepth]\(9),
      R => '0'
    );
depthWriteEnable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveDepthWriteEnable_reg_n_0,
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_DepthWriteEnable,
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearDepthBuffer,
      O => depthWriteEnable_i_1_n_0
    );
depthWriteEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => depthWriteEnable_i_1_n_0,
      Q => depthWriteEnable,
      R => '0'
    );
\i__carry_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_9_n_0\,
      I1 => URAM_doutb(53),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(21),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(21),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_15_n_0\,
      I1 => URAM_doutb(50),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(18),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(18),
      O => \i__carry_i_10_n_0\
    );
\i__carry_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_16_n_0\,
      I1 => URAM_doutb(48),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(16),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(16),
      O => \i__carry_i_11_n_0\
    );
\i__carry_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_26_n_0,
      I1 => URAM_doutb(44),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(12),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(12),
      O => \i__carry_i_12_n_0\
    );
\i__carry_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_27_n_0,
      I1 => URAM_doutb(42),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(10),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(10),
      O => \i__carry_i_13_n_0\
    );
\i__carry_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_29_n_0,
      I1 => URAM_doutb(38),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(6),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(6),
      O => \i__carry_i_14_n_0\
    );
\i__carry_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => DepthTest0_carry_i_30_n_0,
      I1 => URAM_doutb(36),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(4),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(4),
      O => \i__carry_i_15_n_0\
    );
\i__carry_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => DepthTest0_carry_i_32_n_0,
      I1 => URAM_doutb(32),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(0),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(0),
      O => \i__carry_i_16_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_10_n_0\,
      I1 => URAM_doutb(52),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(20),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(20),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_11_n_0\,
      I1 => URAM_doutb(47),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(15),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(15),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => URAM_doutb(46),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(14),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(14),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_13_n_0\,
      I1 => URAM_doutb(41),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(9),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(9),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_14_n_0\,
      I1 => URAM_doutb(40),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(8),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(8),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_15_n_0\,
      I1 => URAM_doutb(35),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(3),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(3),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A80202A"
    )
        port map (
      I0 => \i__carry_i_16_n_0\,
      I1 => URAM_doutb(34),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(2),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(2),
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45401015"
    )
        port map (
      I0 => \DepthTest0_carry__0_i_13_n_0\,
      I1 => URAM_doutb(54),
      I2 => \depthPipeline_reg[4][isOddAddress_n_0_]\,
      I3 => URAM_doutb(22),
      I4 => \depthPipeline_reg[4][pixelTestDepth]\(22),
      O => \i__carry_i_9_n_0\
    );
\pixelsFailedDepthTest[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stat_pixelsfaileddepthtest\(0),
      O => \pixelsFailedDepthTest[7]_i_2_n_0\
    );
\pixelsFailedDepthTest_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_15\,
      Q => \^stat_pixelsfaileddepthtest\(0),
      R => '0'
    );
\pixelsFailedDepthTest_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_13\,
      Q => \^stat_pixelsfaileddepthtest\(10),
      R => '0'
    );
\pixelsFailedDepthTest_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_12\,
      Q => \^stat_pixelsfaileddepthtest\(11),
      R => '0'
    );
\pixelsFailedDepthTest_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_11\,
      Q => \^stat_pixelsfaileddepthtest\(12),
      R => '0'
    );
\pixelsFailedDepthTest_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_10\,
      Q => \^stat_pixelsfaileddepthtest\(13),
      R => '0'
    );
\pixelsFailedDepthTest_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_9\,
      Q => \^stat_pixelsfaileddepthtest\(14),
      R => '0'
    );
\pixelsFailedDepthTest_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_8\,
      Q => \^stat_pixelsfaileddepthtest\(15),
      R => '0'
    );
\pixelsFailedDepthTest_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedDepthTest_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsFailedDepthTest_reg[15]_i_1_n_0\,
      CO(6) => \pixelsFailedDepthTest_reg[15]_i_1_n_1\,
      CO(5) => \pixelsFailedDepthTest_reg[15]_i_1_n_2\,
      CO(4) => \pixelsFailedDepthTest_reg[15]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedDepthTest_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedDepthTest_reg[15]_i_1_n_5\,
      CO(1) => \pixelsFailedDepthTest_reg[15]_i_1_n_6\,
      CO(0) => \pixelsFailedDepthTest_reg[15]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedDepthTest_reg[15]_i_1_n_8\,
      O(6) => \pixelsFailedDepthTest_reg[15]_i_1_n_9\,
      O(5) => \pixelsFailedDepthTest_reg[15]_i_1_n_10\,
      O(4) => \pixelsFailedDepthTest_reg[15]_i_1_n_11\,
      O(3) => \pixelsFailedDepthTest_reg[15]_i_1_n_12\,
      O(2) => \pixelsFailedDepthTest_reg[15]_i_1_n_13\,
      O(1) => \pixelsFailedDepthTest_reg[15]_i_1_n_14\,
      O(0) => \pixelsFailedDepthTest_reg[15]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfaileddepthtest\(15 downto 8)
    );
\pixelsFailedDepthTest_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_15\,
      Q => \^stat_pixelsfaileddepthtest\(16),
      R => '0'
    );
\pixelsFailedDepthTest_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_14\,
      Q => \^stat_pixelsfaileddepthtest\(17),
      R => '0'
    );
\pixelsFailedDepthTest_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_13\,
      Q => \^stat_pixelsfaileddepthtest\(18),
      R => '0'
    );
\pixelsFailedDepthTest_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_12\,
      Q => \^stat_pixelsfaileddepthtest\(19),
      R => '0'
    );
\pixelsFailedDepthTest_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_14\,
      Q => \^stat_pixelsfaileddepthtest\(1),
      R => '0'
    );
\pixelsFailedDepthTest_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_11\,
      Q => \^stat_pixelsfaileddepthtest\(20),
      R => '0'
    );
\pixelsFailedDepthTest_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_10\,
      Q => \^stat_pixelsfaileddepthtest\(21),
      R => '0'
    );
\pixelsFailedDepthTest_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_9\,
      Q => \^stat_pixelsfaileddepthtest\(22),
      R => '0'
    );
\pixelsFailedDepthTest_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[23]_i_1_n_8\,
      Q => \^stat_pixelsfaileddepthtest\(23),
      R => '0'
    );
\pixelsFailedDepthTest_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedDepthTest_reg[15]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsFailedDepthTest_reg[23]_i_1_n_0\,
      CO(6) => \pixelsFailedDepthTest_reg[23]_i_1_n_1\,
      CO(5) => \pixelsFailedDepthTest_reg[23]_i_1_n_2\,
      CO(4) => \pixelsFailedDepthTest_reg[23]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedDepthTest_reg[23]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedDepthTest_reg[23]_i_1_n_5\,
      CO(1) => \pixelsFailedDepthTest_reg[23]_i_1_n_6\,
      CO(0) => \pixelsFailedDepthTest_reg[23]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedDepthTest_reg[23]_i_1_n_8\,
      O(6) => \pixelsFailedDepthTest_reg[23]_i_1_n_9\,
      O(5) => \pixelsFailedDepthTest_reg[23]_i_1_n_10\,
      O(4) => \pixelsFailedDepthTest_reg[23]_i_1_n_11\,
      O(3) => \pixelsFailedDepthTest_reg[23]_i_1_n_12\,
      O(2) => \pixelsFailedDepthTest_reg[23]_i_1_n_13\,
      O(1) => \pixelsFailedDepthTest_reg[23]_i_1_n_14\,
      O(0) => \pixelsFailedDepthTest_reg[23]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfaileddepthtest\(23 downto 16)
    );
\pixelsFailedDepthTest_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_15\,
      Q => \^stat_pixelsfaileddepthtest\(24),
      R => '0'
    );
\pixelsFailedDepthTest_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_14\,
      Q => \^stat_pixelsfaileddepthtest\(25),
      R => '0'
    );
\pixelsFailedDepthTest_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_13\,
      Q => \^stat_pixelsfaileddepthtest\(26),
      R => '0'
    );
\pixelsFailedDepthTest_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_12\,
      Q => \^stat_pixelsfaileddepthtest\(27),
      R => '0'
    );
\pixelsFailedDepthTest_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_11\,
      Q => \^stat_pixelsfaileddepthtest\(28),
      R => '0'
    );
\pixelsFailedDepthTest_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_10\,
      Q => \^stat_pixelsfaileddepthtest\(29),
      R => '0'
    );
\pixelsFailedDepthTest_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_13\,
      Q => \^stat_pixelsfaileddepthtest\(2),
      R => '0'
    );
\pixelsFailedDepthTest_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_9\,
      Q => \^stat_pixelsfaileddepthtest\(30),
      R => '0'
    );
\pixelsFailedDepthTest_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[31]_i_1_n_8\,
      Q => \^stat_pixelsfaileddepthtest\(31),
      R => '0'
    );
\pixelsFailedDepthTest_reg[31]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedDepthTest_reg[23]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \pixelsFailedDepthTest_reg[31]_i_1_n_1\,
      CO(5) => \pixelsFailedDepthTest_reg[31]_i_1_n_2\,
      CO(4) => \pixelsFailedDepthTest_reg[31]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedDepthTest_reg[31]_i_1_n_5\,
      CO(1) => \pixelsFailedDepthTest_reg[31]_i_1_n_6\,
      CO(0) => \pixelsFailedDepthTest_reg[31]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedDepthTest_reg[31]_i_1_n_8\,
      O(6) => \pixelsFailedDepthTest_reg[31]_i_1_n_9\,
      O(5) => \pixelsFailedDepthTest_reg[31]_i_1_n_10\,
      O(4) => \pixelsFailedDepthTest_reg[31]_i_1_n_11\,
      O(3) => \pixelsFailedDepthTest_reg[31]_i_1_n_12\,
      O(2) => \pixelsFailedDepthTest_reg[31]_i_1_n_13\,
      O(1) => \pixelsFailedDepthTest_reg[31]_i_1_n_14\,
      O(0) => \pixelsFailedDepthTest_reg[31]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfaileddepthtest\(31 downto 24)
    );
\pixelsFailedDepthTest_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_12\,
      Q => \^stat_pixelsfaileddepthtest\(3),
      R => '0'
    );
\pixelsFailedDepthTest_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_11\,
      Q => \^stat_pixelsfaileddepthtest\(4),
      R => '0'
    );
\pixelsFailedDepthTest_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_10\,
      Q => \^stat_pixelsfaileddepthtest\(5),
      R => '0'
    );
\pixelsFailedDepthTest_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_9\,
      Q => \^stat_pixelsfaileddepthtest\(6),
      R => '0'
    );
\pixelsFailedDepthTest_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[7]_i_1_n_8\,
      Q => \^stat_pixelsfaileddepthtest\(7),
      R => '0'
    );
\pixelsFailedDepthTest_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \pixelsFailedDepthTest_reg[7]_i_1_n_0\,
      CO(6) => \pixelsFailedDepthTest_reg[7]_i_1_n_1\,
      CO(5) => \pixelsFailedDepthTest_reg[7]_i_1_n_2\,
      CO(4) => \pixelsFailedDepthTest_reg[7]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedDepthTest_reg[7]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedDepthTest_reg[7]_i_1_n_5\,
      CO(1) => \pixelsFailedDepthTest_reg[7]_i_1_n_6\,
      CO(0) => \pixelsFailedDepthTest_reg[7]_i_1_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \pixelsFailedDepthTest_reg[7]_i_1_n_8\,
      O(6) => \pixelsFailedDepthTest_reg[7]_i_1_n_9\,
      O(5) => \pixelsFailedDepthTest_reg[7]_i_1_n_10\,
      O(4) => \pixelsFailedDepthTest_reg[7]_i_1_n_11\,
      O(3) => \pixelsFailedDepthTest_reg[7]_i_1_n_12\,
      O(2) => \pixelsFailedDepthTest_reg[7]_i_1_n_13\,
      O(1) => \pixelsFailedDepthTest_reg[7]_i_1_n_14\,
      O(0) => \pixelsFailedDepthTest_reg[7]_i_1_n_15\,
      S(7 downto 1) => \^stat_pixelsfaileddepthtest\(7 downto 1),
      S(0) => \pixelsFailedDepthTest[7]_i_2_n_0\
    );
\pixelsFailedDepthTest_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_15\,
      Q => \^stat_pixelsfaileddepthtest\(8),
      R => '0'
    );
\pixelsFailedDepthTest_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedDepthTest_i_1_n_0,
      D => \pixelsFailedDepthTest_reg[15]_i_1_n_14\,
      Q => \^stat_pixelsfaileddepthtest\(9),
      R => '0'
    );
\pixelsFailedStencilTest[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stat_pixelsfailedstenciltest\(0),
      O => \pixelsFailedStencilTest[7]_i_2_n_0\
    );
\pixelsFailedStencilTest_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_15\,
      Q => \^stat_pixelsfailedstenciltest\(0),
      R => '0'
    );
\pixelsFailedStencilTest_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_13\,
      Q => \^stat_pixelsfailedstenciltest\(10),
      R => '0'
    );
\pixelsFailedStencilTest_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_12\,
      Q => \^stat_pixelsfailedstenciltest\(11),
      R => '0'
    );
\pixelsFailedStencilTest_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_11\,
      Q => \^stat_pixelsfailedstenciltest\(12),
      R => '0'
    );
\pixelsFailedStencilTest_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_10\,
      Q => \^stat_pixelsfailedstenciltest\(13),
      R => '0'
    );
\pixelsFailedStencilTest_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_9\,
      Q => \^stat_pixelsfailedstenciltest\(14),
      R => '0'
    );
\pixelsFailedStencilTest_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_8\,
      Q => \^stat_pixelsfailedstenciltest\(15),
      R => '0'
    );
\pixelsFailedStencilTest_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedStencilTest_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsFailedStencilTest_reg[15]_i_1_n_0\,
      CO(6) => \pixelsFailedStencilTest_reg[15]_i_1_n_1\,
      CO(5) => \pixelsFailedStencilTest_reg[15]_i_1_n_2\,
      CO(4) => \pixelsFailedStencilTest_reg[15]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedStencilTest_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedStencilTest_reg[15]_i_1_n_5\,
      CO(1) => \pixelsFailedStencilTest_reg[15]_i_1_n_6\,
      CO(0) => \pixelsFailedStencilTest_reg[15]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedStencilTest_reg[15]_i_1_n_8\,
      O(6) => \pixelsFailedStencilTest_reg[15]_i_1_n_9\,
      O(5) => \pixelsFailedStencilTest_reg[15]_i_1_n_10\,
      O(4) => \pixelsFailedStencilTest_reg[15]_i_1_n_11\,
      O(3) => \pixelsFailedStencilTest_reg[15]_i_1_n_12\,
      O(2) => \pixelsFailedStencilTest_reg[15]_i_1_n_13\,
      O(1) => \pixelsFailedStencilTest_reg[15]_i_1_n_14\,
      O(0) => \pixelsFailedStencilTest_reg[15]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfailedstenciltest\(15 downto 8)
    );
\pixelsFailedStencilTest_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_15\,
      Q => \^stat_pixelsfailedstenciltest\(16),
      R => '0'
    );
\pixelsFailedStencilTest_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_14\,
      Q => \^stat_pixelsfailedstenciltest\(17),
      R => '0'
    );
\pixelsFailedStencilTest_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_13\,
      Q => \^stat_pixelsfailedstenciltest\(18),
      R => '0'
    );
\pixelsFailedStencilTest_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_12\,
      Q => \^stat_pixelsfailedstenciltest\(19),
      R => '0'
    );
\pixelsFailedStencilTest_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_14\,
      Q => \^stat_pixelsfailedstenciltest\(1),
      R => '0'
    );
\pixelsFailedStencilTest_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_11\,
      Q => \^stat_pixelsfailedstenciltest\(20),
      R => '0'
    );
\pixelsFailedStencilTest_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_10\,
      Q => \^stat_pixelsfailedstenciltest\(21),
      R => '0'
    );
\pixelsFailedStencilTest_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_9\,
      Q => \^stat_pixelsfailedstenciltest\(22),
      R => '0'
    );
\pixelsFailedStencilTest_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[23]_i_1_n_8\,
      Q => \^stat_pixelsfailedstenciltest\(23),
      R => '0'
    );
\pixelsFailedStencilTest_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedStencilTest_reg[15]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsFailedStencilTest_reg[23]_i_1_n_0\,
      CO(6) => \pixelsFailedStencilTest_reg[23]_i_1_n_1\,
      CO(5) => \pixelsFailedStencilTest_reg[23]_i_1_n_2\,
      CO(4) => \pixelsFailedStencilTest_reg[23]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedStencilTest_reg[23]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedStencilTest_reg[23]_i_1_n_5\,
      CO(1) => \pixelsFailedStencilTest_reg[23]_i_1_n_6\,
      CO(0) => \pixelsFailedStencilTest_reg[23]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedStencilTest_reg[23]_i_1_n_8\,
      O(6) => \pixelsFailedStencilTest_reg[23]_i_1_n_9\,
      O(5) => \pixelsFailedStencilTest_reg[23]_i_1_n_10\,
      O(4) => \pixelsFailedStencilTest_reg[23]_i_1_n_11\,
      O(3) => \pixelsFailedStencilTest_reg[23]_i_1_n_12\,
      O(2) => \pixelsFailedStencilTest_reg[23]_i_1_n_13\,
      O(1) => \pixelsFailedStencilTest_reg[23]_i_1_n_14\,
      O(0) => \pixelsFailedStencilTest_reg[23]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfailedstenciltest\(23 downto 16)
    );
\pixelsFailedStencilTest_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_15\,
      Q => \^stat_pixelsfailedstenciltest\(24),
      R => '0'
    );
\pixelsFailedStencilTest_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_14\,
      Q => \^stat_pixelsfailedstenciltest\(25),
      R => '0'
    );
\pixelsFailedStencilTest_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_13\,
      Q => \^stat_pixelsfailedstenciltest\(26),
      R => '0'
    );
\pixelsFailedStencilTest_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_12\,
      Q => \^stat_pixelsfailedstenciltest\(27),
      R => '0'
    );
\pixelsFailedStencilTest_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_11\,
      Q => \^stat_pixelsfailedstenciltest\(28),
      R => '0'
    );
\pixelsFailedStencilTest_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_10\,
      Q => \^stat_pixelsfailedstenciltest\(29),
      R => '0'
    );
\pixelsFailedStencilTest_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_13\,
      Q => \^stat_pixelsfailedstenciltest\(2),
      R => '0'
    );
\pixelsFailedStencilTest_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_9\,
      Q => \^stat_pixelsfailedstenciltest\(30),
      R => '0'
    );
\pixelsFailedStencilTest_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[31]_i_1_n_8\,
      Q => \^stat_pixelsfailedstenciltest\(31),
      R => '0'
    );
\pixelsFailedStencilTest_reg[31]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsFailedStencilTest_reg[23]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \pixelsFailedStencilTest_reg[31]_i_1_n_1\,
      CO(5) => \pixelsFailedStencilTest_reg[31]_i_1_n_2\,
      CO(4) => \pixelsFailedStencilTest_reg[31]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedStencilTest_reg[31]_i_1_n_5\,
      CO(1) => \pixelsFailedStencilTest_reg[31]_i_1_n_6\,
      CO(0) => \pixelsFailedStencilTest_reg[31]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsFailedStencilTest_reg[31]_i_1_n_8\,
      O(6) => \pixelsFailedStencilTest_reg[31]_i_1_n_9\,
      O(5) => \pixelsFailedStencilTest_reg[31]_i_1_n_10\,
      O(4) => \pixelsFailedStencilTest_reg[31]_i_1_n_11\,
      O(3) => \pixelsFailedStencilTest_reg[31]_i_1_n_12\,
      O(2) => \pixelsFailedStencilTest_reg[31]_i_1_n_13\,
      O(1) => \pixelsFailedStencilTest_reg[31]_i_1_n_14\,
      O(0) => \pixelsFailedStencilTest_reg[31]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelsfailedstenciltest\(31 downto 24)
    );
\pixelsFailedStencilTest_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_12\,
      Q => \^stat_pixelsfailedstenciltest\(3),
      R => '0'
    );
\pixelsFailedStencilTest_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_11\,
      Q => \^stat_pixelsfailedstenciltest\(4),
      R => '0'
    );
\pixelsFailedStencilTest_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_10\,
      Q => \^stat_pixelsfailedstenciltest\(5),
      R => '0'
    );
\pixelsFailedStencilTest_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_9\,
      Q => \^stat_pixelsfailedstenciltest\(6),
      R => '0'
    );
\pixelsFailedStencilTest_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[7]_i_1_n_8\,
      Q => \^stat_pixelsfailedstenciltest\(7),
      R => '0'
    );
\pixelsFailedStencilTest_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \pixelsFailedStencilTest_reg[7]_i_1_n_0\,
      CO(6) => \pixelsFailedStencilTest_reg[7]_i_1_n_1\,
      CO(5) => \pixelsFailedStencilTest_reg[7]_i_1_n_2\,
      CO(4) => \pixelsFailedStencilTest_reg[7]_i_1_n_3\,
      CO(3) => \NLW_pixelsFailedStencilTest_reg[7]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsFailedStencilTest_reg[7]_i_1_n_5\,
      CO(1) => \pixelsFailedStencilTest_reg[7]_i_1_n_6\,
      CO(0) => \pixelsFailedStencilTest_reg[7]_i_1_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \pixelsFailedStencilTest_reg[7]_i_1_n_8\,
      O(6) => \pixelsFailedStencilTest_reg[7]_i_1_n_9\,
      O(5) => \pixelsFailedStencilTest_reg[7]_i_1_n_10\,
      O(4) => \pixelsFailedStencilTest_reg[7]_i_1_n_11\,
      O(3) => \pixelsFailedStencilTest_reg[7]_i_1_n_12\,
      O(2) => \pixelsFailedStencilTest_reg[7]_i_1_n_13\,
      O(1) => \pixelsFailedStencilTest_reg[7]_i_1_n_14\,
      O(0) => \pixelsFailedStencilTest_reg[7]_i_1_n_15\,
      S(7 downto 1) => \^stat_pixelsfailedstenciltest\(7 downto 1),
      S(0) => \pixelsFailedStencilTest[7]_i_2_n_0\
    );
\pixelsFailedStencilTest_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_15\,
      Q => \^stat_pixelsfailedstenciltest\(8),
      R => '0'
    );
\pixelsFailedStencilTest_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => RAST_PixelFailedStencilTest_i_1_n_0,
      D => \pixelsFailedStencilTest_reg[15]_i_1_n_14\,
      Q => \^stat_pixelsfailedstenciltest\(9),
      R => '0'
    );
\pixelsPassedDepthStencilTest[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RAST_PixelPassedDepthStencilTest_i_1_n_0,
      I1 => clearModeEnable_reg_n_0,
      O => pixelsPassedDepthStencilTest
    );
\pixelsPassedDepthStencilTest[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stat_pixelspasseddepthstenciltest\(0),
      O => \pixelsPassedDepthStencilTest[7]_i_2_n_0\
    );
\pixelsPassedDepthStencilTest_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_15\,
      Q => \^stat_pixelspasseddepthstenciltest\(0),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_13\,
      Q => \^stat_pixelspasseddepthstenciltest\(10),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_12\,
      Q => \^stat_pixelspasseddepthstenciltest\(11),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_11\,
      Q => \^stat_pixelspasseddepthstenciltest\(12),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_10\,
      Q => \^stat_pixelspasseddepthstenciltest\(13),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_9\,
      Q => \^stat_pixelspasseddepthstenciltest\(14),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_8\,
      Q => \^stat_pixelspasseddepthstenciltest\(15),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_0\,
      CO(6) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_1\,
      CO(5) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_2\,
      CO(4) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_3\,
      CO(3) => \NLW_pixelsPassedDepthStencilTest_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_5\,
      CO(1) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_6\,
      CO(0) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_8\,
      O(6) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_9\,
      O(5) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_10\,
      O(4) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_11\,
      O(3) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_12\,
      O(2) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_13\,
      O(1) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_14\,
      O(0) => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelspasseddepthstenciltest\(15 downto 8)
    );
\pixelsPassedDepthStencilTest_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_15\,
      Q => \^stat_pixelspasseddepthstenciltest\(16),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_14\,
      Q => \^stat_pixelspasseddepthstenciltest\(17),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_13\,
      Q => \^stat_pixelspasseddepthstenciltest\(18),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_12\,
      Q => \^stat_pixelspasseddepthstenciltest\(19),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_14\,
      Q => \^stat_pixelspasseddepthstenciltest\(1),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_11\,
      Q => \^stat_pixelspasseddepthstenciltest\(20),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_10\,
      Q => \^stat_pixelspasseddepthstenciltest\(21),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_9\,
      Q => \^stat_pixelspasseddepthstenciltest\(22),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_8\,
      Q => \^stat_pixelspasseddepthstenciltest\(23),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_0\,
      CO(6) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_1\,
      CO(5) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_2\,
      CO(4) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_3\,
      CO(3) => \NLW_pixelsPassedDepthStencilTest_reg[23]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_5\,
      CO(1) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_6\,
      CO(0) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_8\,
      O(6) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_9\,
      O(5) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_10\,
      O(4) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_11\,
      O(3) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_12\,
      O(2) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_13\,
      O(1) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_14\,
      O(0) => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_15\,
      S(7 downto 0) => \^stat_pixelspasseddepthstenciltest\(23 downto 16)
    );
\pixelsPassedDepthStencilTest_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_15\,
      Q => \^stat_pixelspasseddepthstenciltest\(24),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_14\,
      Q => \^stat_pixelspasseddepthstenciltest\(25),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_13\,
      Q => \^stat_pixelspasseddepthstenciltest\(26),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_12\,
      Q => \^stat_pixelspasseddepthstenciltest\(27),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_11\,
      Q => \^stat_pixelspasseddepthstenciltest\(28),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_10\,
      Q => \^stat_pixelspasseddepthstenciltest\(29),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_13\,
      Q => \^stat_pixelspasseddepthstenciltest\(2),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_9\,
      Q => \^stat_pixelspasseddepthstenciltest\(30),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_8\,
      Q => \^stat_pixelspasseddepthstenciltest\(31),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[31]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \pixelsPassedDepthStencilTest_reg[23]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED\(7),
      CO(6) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_1\,
      CO(5) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_2\,
      CO(4) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_3\,
      CO(3) => \NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_5\,
      CO(1) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_6\,
      CO(0) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_8\,
      O(6) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_9\,
      O(5) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_10\,
      O(4) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_11\,
      O(3) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_12\,
      O(2) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_13\,
      O(1) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_14\,
      O(0) => \pixelsPassedDepthStencilTest_reg[31]_i_2_n_15\,
      S(7 downto 0) => \^stat_pixelspasseddepthstenciltest\(31 downto 24)
    );
\pixelsPassedDepthStencilTest_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_12\,
      Q => \^stat_pixelspasseddepthstenciltest\(3),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_11\,
      Q => \^stat_pixelspasseddepthstenciltest\(4),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_10\,
      Q => \^stat_pixelspasseddepthstenciltest\(5),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_9\,
      Q => \^stat_pixelspasseddepthstenciltest\(6),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_8\,
      Q => \^stat_pixelspasseddepthstenciltest\(7),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_0\,
      CO(6) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_1\,
      CO(5) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_2\,
      CO(4) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_3\,
      CO(3) => \NLW_pixelsPassedDepthStencilTest_reg[7]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_5\,
      CO(1) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_6\,
      CO(0) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_8\,
      O(6) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_9\,
      O(5) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_10\,
      O(4) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_11\,
      O(3) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_12\,
      O(2) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_13\,
      O(1) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_14\,
      O(0) => \pixelsPassedDepthStencilTest_reg[7]_i_1_n_15\,
      S(7 downto 1) => \^stat_pixelspasseddepthstenciltest\(7 downto 1),
      S(0) => \pixelsPassedDepthStencilTest[7]_i_2_n_0\
    );
\pixelsPassedDepthStencilTest_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_15\,
      Q => \^stat_pixelspasseddepthstenciltest\(8),
      R => '0'
    );
\pixelsPassedDepthStencilTest_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pixelsPassedDepthStencilTest,
      D => \pixelsPassedDepthStencilTest_reg[15]_i_1_n_14\,
      Q => \^stat_pixelspasseddepthstenciltest\(9),
      R => '0'
    );
\stencilFailOp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilFailOp(0),
      Q => stencilFailOp(0),
      R => '0'
    );
\stencilFailOp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilFailOp(1),
      Q => stencilFailOp(1),
      R => '0'
    );
\stencilFailOp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilFailOp(2),
      Q => stencilFailOp(2),
      R => '0'
    );
\stencilPassOp[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearSaveStencilPassOp(0),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_SetDepthParams,
      I3 => RAST_StencilPassOp(0),
      O => \stencilPassOp[0]_i_1_n_0\
    );
\stencilPassOp[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B8BB"
    )
        port map (
      I0 => clearSaveStencilPassOp(1),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilPassOp(1),
      I3 => RAST_SetDepthParams,
      O => \stencilPassOp[1]_i_1_n_0\
    );
\stencilPassOp[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => clearSaveStencilPassOp(2),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_SetDepthParams,
      I3 => RAST_StencilPassOp(2),
      O => \stencilPassOp[2]_i_1_n_0\
    );
\stencilPassOp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilPassOp[0]_i_1_n_0\,
      Q => \stencilPassOp_reg_n_0_[0]\,
      R => '0'
    );
\stencilPassOp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilPassOp[1]_i_1_n_0\,
      Q => \stencilPassOp_reg_n_0_[1]\,
      R => '0'
    );
\stencilPassOp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilPassOp[2]_i_1_n_0\,
      Q => \stencilPassOp_reg_n_0_[2]\,
      R => '0'
    );
\stencilReadMask[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => clearModeEnable_reg_n_0,
      O => stencilReadMask
    );
\stencilReadMask_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(0),
      Q => \stencilReadMask_reg_n_0_[0]\,
      R => '0'
    );
\stencilReadMask_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(1),
      Q => \stencilReadMask_reg_n_0_[1]\,
      R => '0'
    );
\stencilReadMask_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(2),
      Q => \stencilReadMask_reg_n_0_[2]\,
      R => '0'
    );
\stencilReadMask_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(3),
      Q => \stencilReadMask_reg_n_0_[3]\,
      R => '0'
    );
\stencilReadMask_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(4),
      Q => \stencilReadMask_reg_n_0_[4]\,
      R => '0'
    );
\stencilReadMask_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(5),
      Q => \stencilReadMask_reg_n_0_[5]\,
      R => '0'
    );
\stencilReadMask_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(6),
      Q => \stencilReadMask_reg_n_0_[6]\,
      R => '0'
    );
\stencilReadMask_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilReadMask(7),
      Q => \stencilReadMask_reg_n_0_[7]\,
      R => '0'
    );
\stencilRef[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(0),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(0),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(0),
      O => \stencilRef[0]_i_1_n_0\
    );
\stencilRef[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(1),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(1),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(1),
      O => \stencilRef[1]_i_1_n_0\
    );
\stencilRef[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(2),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(2),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(2),
      O => \stencilRef[2]_i_1_n_0\
    );
\stencilRef[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(3),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(3),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(3),
      O => \stencilRef[3]_i_1_n_0\
    );
\stencilRef[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(4),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(4),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(4),
      O => \stencilRef[4]_i_1_n_0\
    );
\stencilRef[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(5),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(5),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(5),
      O => \stencilRef[5]_i_1_n_0\
    );
\stencilRef[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(6),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(6),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(6),
      O => \stencilRef[6]_i_1_n_0\
    );
\stencilRef[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE00FE"
    )
        port map (
      I0 => CMD_ClearStencilBuffer,
      I1 => CMD_ClearDepthBuffer,
      I2 => RAST_SetDepthParams,
      I3 => clearModeEnable_reg_n_0,
      I4 => clearModeCompleted,
      O => stencilWriteMask
    );
\stencilRef[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilRef(7),
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilRefVal(7),
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilValue(7),
      O => \stencilRef[7]_i_2_n_0\
    );
\stencilRef_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[0]_i_1_n_0\,
      Q => stencilRef(0),
      R => '0'
    );
\stencilRef_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[1]_i_1_n_0\,
      Q => stencilRef(1),
      R => '0'
    );
\stencilRef_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[2]_i_1_n_0\,
      Q => stencilRef(2),
      R => '0'
    );
\stencilRef_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[3]_i_1_n_0\,
      Q => stencilRef(3),
      R => '0'
    );
\stencilRef_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[4]_i_1_n_0\,
      Q => stencilRef(4),
      R => '0'
    );
\stencilRef_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[5]_i_1_n_0\,
      Q => stencilRef(5),
      R => '0'
    );
\stencilRef_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[6]_i_1_n_0\,
      Q => stencilRef(6),
      R => '0'
    );
\stencilRef_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilRef[7]_i_2_n_0\,
      Q => stencilRef(7),
      R => '0'
    );
stencilWriteEnable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => clearSaveStencilWriteEnable,
      I1 => clearModeEnable_reg_n_0,
      I2 => RAST_StencilWriteEnable,
      I3 => RAST_SetDepthParams,
      I4 => CMD_ClearStencilBuffer,
      O => stencilWriteEnable_i_1_n_0
    );
stencilWriteEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => stencilWriteEnable_i_1_n_0,
      Q => stencilWriteEnable_reg_n_0,
      R => '0'
    );
\stencilWriteMask[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilWriteMask(0),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilWriteMask(0),
      O => \stencilWriteMask[0]_i_1_n_0\
    );
\stencilWriteMask[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilWriteMask(1),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilWriteMask(1),
      O => \stencilWriteMask[1]_i_1_n_0\
    );
\stencilWriteMask[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_StencilWriteMask(2),
      I2 => clearSaveStencilWriteMask(2),
      I3 => clearModeEnable_reg_n_0,
      O => \stencilWriteMask[2]_i_1_n_0\
    );
\stencilWriteMask[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilWriteMask(3),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilWriteMask(3),
      O => \stencilWriteMask[3]_i_1_n_0\
    );
\stencilWriteMask[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_StencilWriteMask(4),
      I2 => clearSaveStencilWriteMask(4),
      I3 => clearModeEnable_reg_n_0,
      O => \stencilWriteMask[4]_i_1_n_0\
    );
\stencilWriteMask[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilWriteMask(5),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilWriteMask(5),
      O => \stencilWriteMask[5]_i_1_n_0\
    );
\stencilWriteMask[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F088"
    )
        port map (
      I0 => RAST_SetDepthParams,
      I1 => RAST_StencilWriteMask(6),
      I2 => clearSaveStencilWriteMask(6),
      I3 => clearModeEnable_reg_n_0,
      O => \stencilWriteMask[6]_i_1_n_0\
    );
\stencilWriteMask[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACA0"
    )
        port map (
      I0 => clearSaveStencilWriteMask(7),
      I1 => RAST_SetDepthParams,
      I2 => clearModeEnable_reg_n_0,
      I3 => RAST_StencilWriteMask(7),
      O => \stencilWriteMask[7]_i_1_n_0\
    );
\stencilWriteMask_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[0]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[0]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[1]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[1]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[2]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[2]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[3]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[3]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[4]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[4]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[5]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[5]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[6]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[6]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilWriteMask_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => stencilWriteMask,
      D => \stencilWriteMask[7]_i_1_n_0\,
      Q => \stencilWriteMask_reg_n_0_[7]\,
      S => \currentStencilCompareFunc[2]_i_1_n_0\
    );
\stencilZFailOp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilZFailOp(0),
      Q => stencilZFailOp(0),
      R => '0'
    );
\stencilZFailOp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilZFailOp(1),
      Q => stencilZFailOp(1),
      R => '0'
    );
\stencilZFailOp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => stencilReadMask,
      D => RAST_StencilZFailOp(2),
      Q => stencilZFailOp(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_DepthBuffer_0_0 is
  port (
    clk : in STD_LOGIC;
    RAST_PixelReady : in STD_LOGIC;
    RAST_PosX : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_PosY : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_InPixelDepth : in STD_LOGIC_VECTOR ( 23 downto 0 );
    RAST_SetDepthParams : in STD_LOGIC;
    RAST_DepthWriteEnable : in STD_LOGIC;
    RAST_DepthFunction : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_DepthIsIdle : out STD_LOGIC;
    RAST_StencilWriteEnable : in STD_LOGIC;
    RAST_StencilRefVal : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilReadMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilWriteMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilCmpFunc : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilZFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilPassOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_PixelPassedDepthStencilTest : out STD_LOGIC;
    RAST_PixelFailedDepthTest : out STD_LOGIC;
    RAST_PixelFailedStencilTest : out STD_LOGIC;
    URAM_addra : out STD_LOGIC_VECTOR ( 17 downto 0 );
    URAM_clka : out STD_LOGIC;
    URAM_dina : out STD_LOGIC_VECTOR ( 63 downto 0 );
    URAM_ena : out STD_LOGIC;
    URAM_wea : out STD_LOGIC_VECTOR ( 7 downto 0 );
    URAM_addrb : out STD_LOGIC_VECTOR ( 17 downto 0 );
    URAM_clkb : out STD_LOGIC;
    URAM_doutb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    URAM_enb : out STD_LOGIC;
    CMD_ClearDepthBuffer : in STD_LOGIC;
    CMD_ClearStencilBuffer : in STD_LOGIC;
    CMD_ClearDepthValue : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CMD_ClearStencilValue : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CMD_DepthIsIdle : out STD_LOGIC;
    STAT_PixelsPassedDepthStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_DepthBuffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_DepthBuffer_0_0 : entity is "design_1_DepthBuffer_0_0,DepthBuffer,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_DepthBuffer_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_DepthBuffer_0_0 : entity is "DepthBuffer,Vivado 2018.1_AR73068";
end design_1_DepthBuffer_0_0;

architecture STRUCTURE of design_1_DepthBuffer_0_0 is
  signal \<const1>\ : STD_LOGIC;
  signal \^cmd_depthisidle\ : STD_LOGIC;
  signal \^uram_dina\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^uram_wea\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \^clk\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of URAM_clka : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW CLK";
  attribute x_interface_info of URAM_clkb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR CLK";
  attribute x_interface_info of URAM_ena : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW EN";
  attribute x_interface_info of URAM_enb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR EN";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  attribute x_interface_info of URAM_addra : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_parameter of URAM_addra : signal is "XIL_INTERFACENAME DBufferRAMW, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of URAM_addrb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_parameter of URAM_addrb : signal is "XIL_INTERFACENAME DBufferRAMR, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of URAM_dina : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of URAM_doutb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT";
  attribute x_interface_info of URAM_wea : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
begin
  CMD_DepthIsIdle <= \^cmd_depthisidle\;
  RAST_DepthIsIdle <= \^cmd_depthisidle\;
  URAM_clka <= \^clk\;
  URAM_clkb <= \^clk\;
  URAM_dina(63 downto 32) <= \^uram_dina\(31 downto 0);
  URAM_dina(31 downto 0) <= \^uram_dina\(31 downto 0);
  URAM_ena <= \<const1>\;
  URAM_enb <= \<const1>\;
  URAM_wea(7) <= \^uram_wea\(7);
  URAM_wea(6) <= \^uram_wea\(5);
  URAM_wea(5) <= \^uram_wea\(5);
  URAM_wea(4) <= \^uram_wea\(5);
  URAM_wea(3) <= \^uram_wea\(3);
  URAM_wea(2) <= \^uram_wea\(1);
  URAM_wea(1) <= \^uram_wea\(1);
  URAM_wea(0) <= \^uram_wea\(1);
  \^clk\ <= clk;
U0: entity work.design_1_DepthBuffer_0_0_DepthBuffer
     port map (
      CMD_ClearDepthBuffer => CMD_ClearDepthBuffer,
      CMD_ClearDepthValue(23 downto 0) => CMD_ClearDepthValue(23 downto 0),
      CMD_ClearStencilBuffer => CMD_ClearStencilBuffer,
      CMD_ClearStencilValue(7 downto 0) => CMD_ClearStencilValue(7 downto 0),
      CMD_DepthIsIdle => \^cmd_depthisidle\,
      RAST_DepthFunction(2 downto 0) => RAST_DepthFunction(2 downto 0),
      RAST_DepthWriteEnable => RAST_DepthWriteEnable,
      RAST_InPixelDepth(23 downto 0) => RAST_InPixelDepth(23 downto 0),
      RAST_PixelFailedDepthTest => RAST_PixelFailedDepthTest,
      RAST_PixelFailedStencilTest => RAST_PixelFailedStencilTest,
      RAST_PixelPassedDepthStencilTest => RAST_PixelPassedDepthStencilTest,
      RAST_PixelReady => RAST_PixelReady,
      RAST_PosX(9 downto 0) => RAST_PosX(9 downto 0),
      RAST_PosY(9 downto 0) => RAST_PosY(9 downto 0),
      RAST_SetDepthParams => RAST_SetDepthParams,
      RAST_StencilCmpFunc(2 downto 0) => RAST_StencilCmpFunc(2 downto 0),
      RAST_StencilFailOp(2 downto 0) => RAST_StencilFailOp(2 downto 0),
      RAST_StencilPassOp(2 downto 0) => RAST_StencilPassOp(2 downto 0),
      RAST_StencilReadMask(7 downto 0) => RAST_StencilReadMask(7 downto 0),
      RAST_StencilRefVal(7 downto 0) => RAST_StencilRefVal(7 downto 0),
      RAST_StencilWriteEnable => RAST_StencilWriteEnable,
      RAST_StencilWriteMask(7 downto 0) => RAST_StencilWriteMask(7 downto 0),
      RAST_StencilZFailOp(2 downto 0) => RAST_StencilZFailOp(2 downto 0),
      STAT_PixelsFailedDepthTest(31 downto 0) => STAT_PixelsFailedDepthTest(31 downto 0),
      STAT_PixelsFailedStencilTest(31 downto 0) => STAT_PixelsFailedStencilTest(31 downto 0),
      STAT_PixelsPassedDepthStencilTest(31 downto 0) => STAT_PixelsPassedDepthStencilTest(31 downto 0),
      URAM_addra(17 downto 0) => URAM_addra(17 downto 0),
      URAM_addrb(17 downto 0) => URAM_addrb(17 downto 0),
      URAM_dina(31 downto 0) => \^uram_dina\(31 downto 0),
      URAM_doutb(63 downto 0) => URAM_doutb(63 downto 0),
      URAM_wea(3) => \^uram_wea\(7),
      URAM_wea(2) => \^uram_wea\(5),
      URAM_wea(1) => \^uram_wea\(3),
      URAM_wea(0) => \^uram_wea\(1),
      clk => \^clk\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
