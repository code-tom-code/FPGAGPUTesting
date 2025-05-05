-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Apr 26 19:20:50 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TexSample_0_0/design_1_TexSample_0_0_stub.vhdl
-- Design      : design_1_TexSample_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_TexSample_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    INTERP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 95 downto 0 );
    INTERP_InFIFO_empty : in STD_LOGIC;
    INTERP_InFIFO_rd_en : out STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_TexSampReadRequestsFIFO_full : in STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_TexSampReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 73 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 );
    TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_ena : out STD_LOGIC;
    TexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    CMD_TexSampleIsIdle : out STD_LOGIC;
    ROP_OutFIFO_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ROP_OutFIFO_full : in STD_LOGIC;
    ROP_OutFIFO_wr_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingCacheLoad : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TexSample_State : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_TexCache_douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 );
    DBG_texCacheReadTexelsCount : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end design_1_TexSample_0_0;

architecture stub of design_1_TexSample_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,INTERP_InFIFO_rd_data[95:0],INTERP_InFIFO_empty,INTERP_InFIFO_rd_en,MEM_TexSampReadRequestsFIFO_wr_data[29:0],MEM_TexSampReadRequestsFIFO_full,MEM_TexSampReadRequestsFIFO_wr_en,MEM_TexSampReadResponsesFIFO_rd_data[255:0],MEM_TexSampReadResponsesFIFO_empty,MEM_TexSampReadResponsesFIFO_rd_en,STATE_StateBitsAtDrawID[73:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TexCache_addra[13:0],TexCache_dina[31:0],TexCache_douta[31:0],TexCache_ena,TexCache_wea[0:0],CMD_TexSampleIsIdle,ROP_OutFIFO_wr_data[63:0],ROP_OutFIFO_full,ROP_OutFIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingCacheLoad[31:0],STAT_CurrentDrawEventID[15:0],DBG_TexSample_State[5:0],DBG_TexCache_douta[31:0],DBG_TexCache_dina[31:0],DBG_TexCache_addra[13:0],DBG_texCacheReadTexelsCount[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TexSample,Vivado 2018.1_AR73068";
begin
end;
