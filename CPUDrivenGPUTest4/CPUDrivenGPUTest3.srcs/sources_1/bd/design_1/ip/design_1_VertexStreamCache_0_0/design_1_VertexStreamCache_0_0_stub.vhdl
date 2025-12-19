-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:35:20 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_VertexStreamCache_0_0/design_1_VertexStreamCache_0_0_stub.vhdl
-- Design      : design_1_VertexStreamCache_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_VertexStreamCache_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    VSC_ReadEnable : in STD_LOGIC;
    VSC_ReadStreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_ReadDWORDAddr : in STD_LOGIC_VECTOR ( 21 downto 0 );
    VSC_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VSC_ReadReady : out STD_LOGIC;
    VSC_SetStreamVBAddress : in STD_LOGIC;
    VSC_StreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_StreamVBAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VSC_InvalidateCache : in STD_LOGIC;
    VertexCache_clk : out STD_LOGIC;
    VertexCache_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VertexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_ena : out STD_LOGIC;
    VertexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    VSCReadRequestsFIFO_full : in STD_LOGIC;
    VSCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VSCReadRequestsFIFO_wr_en : out STD_LOGIC;
    VSCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    VSCReadResponsesFIFO_empty : in STD_LOGIC;
    VSCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CacheSetIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CacheElementIndex : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end design_1_VertexStreamCache_0_0;

architecture stub of design_1_VertexStreamCache_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,VertexCache_clk,VertexCache_addra[9:0],VertexCache_dina[31:0],VertexCache_douta[31:0],VertexCache_ena,VertexCache_wea[0:0],VSCReadRequestsFIFO_full,VSCReadRequestsFIFO_wr_data[29:0],VSCReadRequestsFIFO_wr_en,VSCReadResponsesFIFO_rd_data[255:0],VSCReadResponsesFIFO_empty,VSCReadResponsesFIFO_rd_en,DBG_State[3:0],DBG_CacheSetIndex[4:0],DBG_CacheElementIndex[1:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "VertexStreamCache,Vivado 2018.1_AR73068";
begin
end;
