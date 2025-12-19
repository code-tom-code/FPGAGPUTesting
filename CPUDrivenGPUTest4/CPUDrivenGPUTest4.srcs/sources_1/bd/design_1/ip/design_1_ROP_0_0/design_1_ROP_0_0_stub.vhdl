-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Apr 26 19:22:59 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ROP_0_0/design_1_ROP_0_0_stub.vhdl
-- Design      : design_1_ROP_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ROP_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_ROPReadRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_ROPReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_en : out STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ROPWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_en : out STD_LOGIC;
    CMD_SetClearColor : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearSignal : in STD_LOGIC;
    CMD_ClearSignalAck : out STD_LOGIC;
    CMD_FlushCacheSignal : in STD_LOGIC;
    CMD_FlushCacheAck : out STD_LOGIC;
    CMD_ROPIsIdle : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 100 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TEXSAMP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    TEXSAMP_InFIFO_empty : in STD_LOGIC;
    TEXSAMP_InFIFO_rd_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForMemoryRead : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheHits : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheMisses : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_CountPixelsPassed : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ROP_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CurrentPixelAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_CurrentBlendedColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_PreviousFramebufferColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentCacheLineDirtyFlags : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_TempSelectedOutputRGB : out STD_LOGIC_VECTOR ( 47 downto 0 );
    DBG_TempSelectedOutputA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TempBlendedOutputRGB : out STD_LOGIC_VECTOR ( 95 downto 0 );
    DBG_TempBlendedOutputA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ReadRequestFIFOFull : out STD_LOGIC
  );

end design_1_ROP_0_0;

architecture stub of design_1_ROP_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,MEM_ROPReadRequestsFIFO_wr_data[29:0],MEM_ROPReadRequestsFIFO_full,MEM_ROPReadRequestsFIFO_wr_en,MEM_ROPReadResponsesFIFO_rd_data[255:0],MEM_ROPReadResponsesFIFO_empty,MEM_ROPReadResponsesFIFO_rd_en,MEM_ROPWriteRequestsFIFO_wr_data[293:0],MEM_ROPWriteRequestsFIFO_full,MEM_ROPWriteRequestsFIFO_wr_en,CMD_SetClearColor[31:0],CMD_ClearSignal,CMD_ClearSignalAck,CMD_FlushCacheSignal,CMD_FlushCacheAck,CMD_ROPIsIdle,STATE_StateBitsAtDrawID[100:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TEXSAMP_InFIFO_rd_data[63:0],TEXSAMP_InFIFO_empty,TEXSAMP_InFIFO_rd_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForMemoryRead[31:0],STAT_CountCacheHits[31:0],STAT_CountCacheMisses[31:0],STAT_CurrentDrawEventID[15:0],STAT_CountPixelsPassed[31:0],DBG_ROP_State[4:0],DBG_CurrentPixelAddr[29:0],DBG_CurrentBlendedColor[31:0],DBG_PreviousFramebufferColor[31:0],DBG_CurrentCacheLineDirtyFlags[7:0],DBG_TempSelectedOutputRGB[47:0],DBG_TempSelectedOutputA[15:0],DBG_TempBlendedOutputRGB[95:0],DBG_TempBlendedOutputA[31:0],DBG_ReadRequestFIFOFull";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ROP,Vivado 2018.1_AR73068";
begin
end;
