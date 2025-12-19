-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Apr 25 20:02:30 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_AttrInterpolator_0_0/design_1_AttrInterpolator_0_0_stub.vhdl
-- Design      : design_1_AttrInterpolator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_AttrInterpolator_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    DINTERP_FIFO_rd_data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    DINTERP_FIFO_empty : in STD_LOGIC;
    DINTERP_FIFO_rd_en : out STD_LOGIC;
    TRICACHE_inT0X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inT0Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inT10X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inT10Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inT20X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inT20Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_inColorRGBA10 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_inColorRGBA20 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_PopTriangleSlot : out STD_LOGIC;
    FPU_MUL_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_GO : out STD_LOGIC;
    FPU_CNV0_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV0_Mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPU_CNV0_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV0_GO : out STD_LOGIC;
    FPU_CNV1_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV1_Mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPU_CNV1_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV1_GO : out STD_LOGIC;
    TEXSAMP_OutFIFO_wr_data : out STD_LOGIC_VECTOR ( 95 downto 0 );
    TEXSAMP_OutFIFO_full : in STD_LOGIC;
    TEXSAMP_OutFIFO_wr_en : out STD_LOGIC;
    TEXSAMP_OutFIFO_almost_full : in STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 6 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_IsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_InterpolatorDriver_State : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_MultiplierDriver_State : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_ConverterDriver_State : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_OutputDriver_State : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_PixelWFIFO : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RastBarycentricB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RastBarycentricC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentDrawEvent : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end design_1_AttrInterpolator_0_0;

architecture stub of design_1_AttrInterpolator_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,DINTERP_FIFO_rd_data[127:0],DINTERP_FIFO_empty,DINTERP_FIFO_rd_en,TRICACHE_inT0X[31:0],TRICACHE_inT0Y[31:0],TRICACHE_inT10X[31:0],TRICACHE_inT10Y[31:0],TRICACHE_inT20X[31:0],TRICACHE_inT20Y[31:0],TRICACHE_inColorRGBA0[127:0],TRICACHE_inColorRGBA10[127:0],TRICACHE_inColorRGBA20[127:0],TRICACHE_PopTriangleSlot,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV0_A[31:0],FPU_CNV0_Mode[2:0],FPU_CNV0_OUT[31:0],FPU_CNV0_GO,FPU_CNV1_A[31:0],FPU_CNV1_Mode[2:0],FPU_CNV1_OUT[31:0],FPU_CNV1_GO,TEXSAMP_OutFIFO_wr_data[95:0],TEXSAMP_OutFIFO_full,TEXSAMP_OutFIFO_wr_en,TEXSAMP_OutFIFO_almost_full,STATE_StateBitsAtDrawID[6:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_AttrInterpolator_State[2:0],DBG_InterpolatorDriver_State[2:0],DBG_MultiplierDriver_State[2:0],DBG_ConverterDriver_State[2:0],DBG_OutputDriver_State[2:0],DBG_PixelWFIFO[31:0],DBG_RastBarycentricB[31:0],DBG_RastBarycentricC[31:0],DBG_CurrentDrawEvent[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "AttrInterpolator,Vivado 2018.1_AR73068";
begin
end;
