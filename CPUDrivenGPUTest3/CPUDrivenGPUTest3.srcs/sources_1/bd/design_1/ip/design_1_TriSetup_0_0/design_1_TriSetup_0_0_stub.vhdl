-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:16:41 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TriSetup_0_0/design_1_TriSetup_0_0_stub.vhdl
-- Design      : design_1_TriSetup_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_TriSetup_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CLIP_v0_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t0_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t0_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t1_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t1_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t2_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t2_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v1_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v2_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_newTriBegin : in STD_LOGIC;
    CLIP_readyForNewTri : out STD_LOGIC;
    TEXCFG_nointerpolation : in STD_LOGIC;
    RAST_outBarycentricInverse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v10_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v20_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v10_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v20_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t0_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t0_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t10_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t10_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t20_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t20_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_v10_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_v20_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_outMinX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMaxX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMinY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMaxY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outInitialBarycentricRowResetA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outInitialBarycentricRowResetB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outInitialBarycentricRowResetC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outIsTopLeftEdgeA : out STD_LOGIC;
    RAST_outIsTopLeftEdgeB : out STD_LOGIC;
    RAST_outIsTopLeftEdgeC : out STD_LOGIC;
    RAST_outBarycentricXDeltaA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricXDeltaB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricXDeltaC : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaC : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_readyForTriSetupData : in STD_LOGIC;
    RAST_triSetupDataIsValid : out STD_LOGIC;
    FPU_ADD_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_GO : out STD_LOGIC;
    FPU_MUL_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_GO : out STD_LOGIC;
    FPU_CNV_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV_Mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPU_CNV_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV_GO : out STD_LOGIC;
    FPU_SPEC_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_GO : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 191 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_TriSetupIsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TriSetup_State : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_MinX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MinY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_XProdSub0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TwiceTriArea : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_TriSetup_0_0;

architecture stub of design_1_TriSetup_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,CLIP_v0_in_x[31:0],CLIP_v0_in_y[31:0],CLIP_v0_in_z[31:0],CLIP_v0_in_w[31:0],CLIP_v1_in_x[31:0],CLIP_v1_in_y[31:0],CLIP_v1_in_z[31:0],CLIP_v1_in_w[31:0],CLIP_v2_in_x[31:0],CLIP_v2_in_y[31:0],CLIP_v2_in_z[31:0],CLIP_v2_in_w[31:0],CLIP_t0_in_x[31:0],CLIP_t0_in_y[31:0],CLIP_t1_in_x[31:0],CLIP_t1_in_y[31:0],CLIP_t2_in_x[31:0],CLIP_t2_in_y[31:0],CLIP_v0_in_RGBA[127:0],CLIP_v1_in_RGBA[127:0],CLIP_v2_in_RGBA[127:0],CLIP_CurrentDrawEventID[15:0],CLIP_newTriBegin,CLIP_readyForNewTri,TEXCFG_nointerpolation,RAST_outBarycentricInverse[31:0],RAST_v0_out_Z[31:0],RAST_v10_out_Z[31:0],RAST_v20_out_Z[31:0],RAST_v0_out_invW[31:0],RAST_v10_out_invW[31:0],RAST_v20_out_invW[31:0],RAST_t0_out_x[31:0],RAST_t0_out_y[31:0],RAST_t10_out_x[31:0],RAST_t10_out_y[31:0],RAST_t20_out_x[31:0],RAST_t20_out_y[31:0],RAST_v0_out_colorRGBA[127:0],RAST_v10_out_colorRGBA[127:0],RAST_v20_out_colorRGBA[127:0],RAST_outMinX[15:0],RAST_outMaxX[15:0],RAST_outMinY[15:0],RAST_outMaxY[15:0],RAST_outInitialBarycentricRowResetA[31:0],RAST_outInitialBarycentricRowResetB[31:0],RAST_outInitialBarycentricRowResetC[31:0],RAST_outIsTopLeftEdgeA,RAST_outIsTopLeftEdgeB,RAST_outIsTopLeftEdgeC,RAST_outBarycentricXDeltaA[15:0],RAST_outBarycentricXDeltaB[15:0],RAST_outBarycentricXDeltaC[15:0],RAST_outBarycentricYDeltaA[15:0],RAST_outBarycentricYDeltaB[15:0],RAST_outBarycentricYDeltaC[15:0],RAST_CurrentDrawEventID[15:0],RAST_readyForTriSetupData,RAST_triSetupDataIsValid,FPU_ADD_A[31:0],FPU_ADD_B[31:0],FPU_ADD_OUT[31:0],FPU_ADD_GO,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV_A[31:0],FPU_CNV_Mode[2:0],FPU_CNV_OUT[31:0],FPU_CNV_GO,FPU_SPEC_A[31:0],FPU_SPEC_OUT[31:0],FPU_SPEC_GO,STATE_StateBitsAtDrawID[191:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_TriSetupIsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_TriSetup_State[7:0],DBG_MinX[15:0],DBG_MaxX[15:0],DBG_MinY[15:0],DBG_MaxY[15:0],DBG_XProdSub0[31:0],DBG_XProdSub1[31:0],DBG_XProdSub2[31:0],DBG_XProdSub3[31:0],DBG_XProdProd0[31:0],DBG_XProdProd1[31:0],DBG_LeftProd0[31:0],DBG_LeftProd1[31:0],DBG_LeftProd2[31:0],DBG_RightProd0[31:0],DBG_RightProd1[31:0],DBG_RightProd2[31:0],DBG_TwiceTriArea[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TriSetup,Vivado 2018.1_AR73068";
begin
end;
