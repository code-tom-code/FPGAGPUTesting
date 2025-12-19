-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:21:41 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ScanOut_0_0/design_1_ScanOut_0_0_stub.vhdl
-- Design      : design_1_ScanOut_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ScanOut_0_0 is
  Port ( 
    clk_x10 : in STD_LOGIC;
    pixelClk : out STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanoutEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    outXCoord : out STD_LOGIC_VECTOR ( 9 downto 0 );
    outYCoord : out STD_LOGIC_VECTOR ( 9 downto 0 );
    MEM_ScanoutReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_ScanoutReadRequestsFIFO_full : in STD_LOGIC;
    MEM_ScanoutReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_ScanoutReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_en : out STD_LOGIC;
    VSyncActivePolarity : in STD_LOGIC;
    HSyncActivePolarity : in STD_LOGIC;
    out_scanout_enable : out STD_LOGIC;
    vsync : out STD_LOGIC;
    hsync : out STD_LOGIC;
    blank : out STD_LOGIC;
    outR : out STD_LOGIC_VECTOR ( 7 downto 0 );
    outG : out STD_LOGIC_VECTOR ( 7 downto 0 );
    outB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    guardBandEnable : out STD_LOGIC;
    guardBandType : out STD_LOGIC;
    controlChannel0Blue : out STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel1Green : out STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : out STD_LOGIC_VECTOR ( 1 downto 0 );
    isTERC4Region : out STD_LOGIC;
    TERC4Character0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ScanoutLoadProcess_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_InternalScanX : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_InternalScanY : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );

end design_1_ScanOut_0_0;

architecture stub of design_1_ScanOut_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_x10,pixelClk,CMD_BaseRenderTargetAddr[29:0],CMD_ScanoutEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],outXCoord[9:0],outYCoord[9:0],MEM_ScanoutReadRequestsFIFO_wr_data[29:0],MEM_ScanoutReadRequestsFIFO_full,MEM_ScanoutReadRequestsFIFO_wr_en,MEM_ScanoutReadResponsesFIFO_rd_data[255:0],MEM_ScanoutReadResponsesFIFO_empty,MEM_ScanoutReadResponsesFIFO_rd_en,VSyncActivePolarity,HSyncActivePolarity,out_scanout_enable,vsync,hsync,blank,outR[7:0],outG[7:0],outB[7:0],guardBandEnable,guardBandType,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],DBG_ScanoutLoadProcess_State[3:0],DBG_InternalScanX[9:0],DBG_InternalScanY[9:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ScanOut,Vivado 2018.1_AR73068";
begin
end;
