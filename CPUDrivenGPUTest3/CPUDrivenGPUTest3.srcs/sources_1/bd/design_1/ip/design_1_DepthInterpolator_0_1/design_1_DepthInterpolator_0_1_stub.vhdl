-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat May  3 22:46:55 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthInterpolator_0_1/design_1_DepthInterpolator_0_1_stub.vhdl
-- Design      : design_1_DepthInterpolator_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_DepthInterpolator_0_1 is
  Port ( 
    clk : in STD_LOGIC;
    TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_PopTriangleSlot : out STD_LOGIC;
    RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 95 downto 0 );
    RASTOUT_FIFO_empty : in STD_LOGIC;
    RASTOUT_FIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 76 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
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
    FPU_SPEC_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_GO : out STD_LOGIC;
    DEPTH_PixelReady : out STD_LOGIC;
    DEPTH_PosX : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DEPTH_PosY : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DEPTH_OutPixelDepth : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DEPTH_PixelPassedDepthStencilTest : in STD_LOGIC;
    DEPTH_PixelFailedDepthTest : in STD_LOGIC;
    DEPTH_PixelFailedStencilTest : in STD_LOGIC;
    DEPTH_SetDepthParams : out STD_LOGIC;
    DEPTH_DepthWriteEnable : out STD_LOGIC;
    DEPTH_DepthFunction : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_StencilWriteEnable : out STD_LOGIC;
    DEPTH_StencilRefVal : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DEPTH_StencilReadMask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DEPTH_StencilWriteMask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DEPTH_StencilCmpFunc : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_StencilFailOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_StencilZFailOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_StencilPassOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_DepthIsIdle : in STD_LOGIC;
    ATTR_FIFO_wr_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    ATTR_FIFO_wr_en : out STD_LOGIC;
    ATTR_FIFO_full : in STD_LOGIC;
    ATTR_FIFO_almost_full : in STD_LOGIC;
    CMD_IsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_DepthOnlyPixelsPassed : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_BarycentricConvertState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_BarycentricNormalizeState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_InterpolatorDriverState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ShiftConvertZState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_DepthTestDriverZState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_RastBarycentricB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RastBarycentricC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_InterpolatedDepthU24 : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_IdleVector : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_BarycentricBCFIFO : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DBG_CurrentDepthStencilState : out STD_LOGIC_VECTOR ( 76 downto 0 )
  );

end design_1_DepthInterpolator_0_1;

architecture stub of design_1_DepthInterpolator_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,TRICACHE_inBarycentricInverse[31:0],TRICACHE_inZ0[31:0],TRICACHE_inZ10[31:0],TRICACHE_inZ20[31:0],TRICACHE_inInvW0[31:0],TRICACHE_inInvW10[31:0],TRICACHE_inInvW20[31:0],TRICACHE_PopTriangleSlot,RASTOUT_FIFO_rd_data[95:0],RASTOUT_FIFO_empty,RASTOUT_FIFO_rd_en,STATE_StateBitsAtDrawID[76:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV0_A[31:0],FPU_CNV0_Mode[2:0],FPU_CNV0_OUT[31:0],FPU_CNV0_GO,FPU_CNV1_A[31:0],FPU_CNV1_Mode[2:0],FPU_CNV1_OUT[31:0],FPU_CNV1_GO,FPU_SPEC_A[31:0],FPU_SPEC_OUT[31:0],FPU_SPEC_GO,DEPTH_PixelReady,DEPTH_PosX[9:0],DEPTH_PosY[9:0],DEPTH_OutPixelDepth[23:0],DEPTH_PixelPassedDepthStencilTest,DEPTH_PixelFailedDepthTest,DEPTH_PixelFailedStencilTest,DEPTH_SetDepthParams,DEPTH_DepthWriteEnable,DEPTH_DepthFunction[2:0],DEPTH_StencilWriteEnable,DEPTH_StencilRefVal[7:0],DEPTH_StencilReadMask[7:0],DEPTH_StencilWriteMask[7:0],DEPTH_StencilCmpFunc[2:0],DEPTH_StencilFailOp[2:0],DEPTH_StencilZFailOp[2:0],DEPTH_StencilPassOp[2:0],DEPTH_DepthIsIdle,ATTR_FIFO_wr_data[127:0],ATTR_FIFO_wr_en,ATTR_FIFO_full,ATTR_FIFO_almost_full,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],STAT_DepthOnlyPixelsPassed[31:0],DBG_DepthInterpolator_State[6:0],DBG_BarycentricConvertState[3:0],DBG_BarycentricNormalizeState[3:0],DBG_InterpolatorDriverState[3:0],DBG_ShiftConvertZState[3:0],DBG_DepthTestDriverZState[3:0],DBG_RastBarycentricB[31:0],DBG_RastBarycentricC[31:0],DBG_InterpolatedDepthU24[23:0],DBG_IdleVector[9:0],DBG_BarycentricBCFIFO[63:0],DBG_CurrentDepthStencilState[76:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "DepthInterpolator,Vivado 2018.1_AR73068";
begin
end;
