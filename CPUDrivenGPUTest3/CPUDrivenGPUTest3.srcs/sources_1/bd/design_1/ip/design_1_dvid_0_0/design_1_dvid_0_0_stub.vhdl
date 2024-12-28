-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:44:04 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_dvid_0_0/design_1_dvid_0_0_stub.vhdl
-- Design      : design_1_dvid_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_dvid_0_0 is
  Port ( 
    clk_x10 : in STD_LOGIC;
    clk_x10n : in STD_LOGIC;
    clk_pixel_x1 : in STD_LOGIC;
    scanout_en : in STD_LOGIC;
    red_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    green_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blank : in STD_LOGIC;
    hsync : in STD_LOGIC;
    vsync : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel1Green : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    guardBandEnable : in STD_LOGIC;
    guardBandType : in STD_LOGIC;
    isTERC4Region : in STD_LOGIC;
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    red_s : out STD_LOGIC;
    green_s : out STD_LOGIC;
    blue_s : out STD_LOGIC;
    cl_s : out STD_LOGIC;
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedG : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedR : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );

end design_1_dvid_0_0;

architecture stub of design_1_dvid_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_x10,clk_x10n,clk_pixel_x1,scanout_en,red_p[7:0],green_p[7:0],blue_p[7:0],blank,hsync,vsync,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],guardBandEnable,guardBandType,isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],red_s,green_s,blue_s,cl_s,EncodedB[9:0],EncodedG[9:0],EncodedR[9:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dvid,Vivado 2018.1_AR73068";
begin
end;
