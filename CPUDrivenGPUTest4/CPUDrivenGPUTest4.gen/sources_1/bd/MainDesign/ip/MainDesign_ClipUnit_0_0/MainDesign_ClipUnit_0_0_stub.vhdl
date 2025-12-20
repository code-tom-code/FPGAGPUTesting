-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:49:04 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClipUnit_0_0/MainDesign_ClipUnit_0_0_stub.vhdl
-- Design      : MainDesign_ClipUnit_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ClipUnit_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    IA_inPreviousStageIsValid : in STD_LOGIC;
    IA_outPreviousStageIsReady : out STD_LOGIC;
    TRISETUP_outNextStageIsValid : out STD_LOGIC;
    TRISETUP_inNextStageisReady : in STD_LOGIC;
    IA_inv0x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0rgba : in STD_LOGIC_VECTOR ( 127 downto 0 );
    IA_inv0tx : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0ty : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv0ClipOutcodes : in STD_LOGIC_VECTOR ( 10 downto 0 );
    IA_inv1x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1rgba : in STD_LOGIC_VECTOR ( 127 downto 0 );
    IA_inv1tx : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1ty : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv1ClipOutcodes : in STD_LOGIC_VECTOR ( 10 downto 0 );
    IA_inv2x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2rgba : in STD_LOGIC_VECTOR ( 127 downto 0 );
    IA_inv2tx : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2ty : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_inv2ClipOutcodes : in STD_LOGIC_VECTOR ( 10 downto 0 );
    IA_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    IA_inWholeTriangleAABBIntersectsViewport : in STD_LOGIC;
    TRISETUP_outv0x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv0y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv0z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv0w : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv0rgba : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRISETUP_outv0tx : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv0ty : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1w : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1rgba : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRISETUP_outv1tx : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv1ty : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2w : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2rgba : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRISETUP_outv2tx : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_outv2ty : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    FPU_Add0_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Add0_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Add0_IADD_GO : out STD_LOGIC;
    FPU_Add0_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Add1_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Add1_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Add1_IADD_GO : out STD_LOGIC;
    FPU_Add1_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul0_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul0_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul0_IMUL_GO : out STD_LOGIC;
    FPU_Mul0_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul1_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul1_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Mul1_IMUL_GO : out STD_LOGIC;
    FPU_Mul1_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Rcp0_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_Rcp0_ISPEC_GO : out STD_LOGIC;
    FPU_Rcp0_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 10 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_IsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_CurrentClipPlane : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentClipBitmask : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_ChildTriStackSize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_ClipDistance0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ClipDistance1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TriangleIntersectsViewport : out STD_LOGIC;
    DBG_V0PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V0PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V0PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V0PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V1PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V1PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V1PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V1PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V2PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V2PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V2PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_V2PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ClipOutcodes0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_ClipOutcodes1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_ClipOutcodes2 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_AlreadyClippedPlanes : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ClipUnit_0_0 : entity is "MainDesign_ClipUnit_0_0,ClipUnit,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ClipUnit_0_0 : entity is "MainDesign_ClipUnit_0_0,ClipUnit,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClipUnit,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ClipUnit_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ClipUnit_0_0 : entity is "module_ref";
end MainDesign_ClipUnit_0_0;

architecture stub of MainDesign_ClipUnit_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,IA_inPreviousStageIsValid,IA_outPreviousStageIsReady,TRISETUP_outNextStageIsValid,TRISETUP_inNextStageisReady,IA_inv0x[31:0],IA_inv0y[31:0],IA_inv0z[31:0],IA_inv0w[31:0],IA_inv0rgba[127:0],IA_inv0tx[31:0],IA_inv0ty[31:0],IA_inv0ClipOutcodes[10:0],IA_inv1x[31:0],IA_inv1y[31:0],IA_inv1z[31:0],IA_inv1w[31:0],IA_inv1rgba[127:0],IA_inv1tx[31:0],IA_inv1ty[31:0],IA_inv1ClipOutcodes[10:0],IA_inv2x[31:0],IA_inv2y[31:0],IA_inv2z[31:0],IA_inv2w[31:0],IA_inv2rgba[127:0],IA_inv2tx[31:0],IA_inv2ty[31:0],IA_inv2ClipOutcodes[10:0],IA_CurrentDrawEventID[15:0],IA_inWholeTriangleAABBIntersectsViewport,TRISETUP_outv0x[31:0],TRISETUP_outv0y[31:0],TRISETUP_outv0z[31:0],TRISETUP_outv0w[31:0],TRISETUP_outv0rgba[127:0],TRISETUP_outv0tx[31:0],TRISETUP_outv0ty[31:0],TRISETUP_outv1x[31:0],TRISETUP_outv1y[31:0],TRISETUP_outv1z[31:0],TRISETUP_outv1w[31:0],TRISETUP_outv1rgba[127:0],TRISETUP_outv1tx[31:0],TRISETUP_outv1ty[31:0],TRISETUP_outv2x[31:0],TRISETUP_outv2y[31:0],TRISETUP_outv2z[31:0],TRISETUP_outv2w[31:0],TRISETUP_outv2rgba[127:0],TRISETUP_outv2tx[31:0],TRISETUP_outv2ty[31:0],TRISETUP_CurrentDrawEventID[15:0],FPU_Add0_A[31:0],FPU_Add0_B[31:0],FPU_Add0_IADD_GO,FPU_Add0_OUT[31:0],FPU_Add1_A[31:0],FPU_Add1_B[31:0],FPU_Add1_IADD_GO,FPU_Add1_OUT[31:0],FPU_Mul0_A[31:0],FPU_Mul0_B[31:0],FPU_Mul0_IMUL_GO,FPU_Mul0_OUT[31:0],FPU_Mul1_A[31:0],FPU_Mul1_B[31:0],FPU_Mul1_IMUL_GO,FPU_Mul1_OUT[31:0],FPU_Rcp0_A[31:0],FPU_Rcp0_ISPEC_GO,FPU_Rcp0_OUT[31:0],STATE_StateBitsAtDrawID[10:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_CurrentState[7:0],DBG_CurrentClipPlane[3:0],DBG_CurrentClipBitmask[2:0],DBG_ChildTriStackSize[2:0],DBG_ClipDistance0[31:0],DBG_ClipDistance1[31:0],DBG_TriangleIntersectsViewport,DBG_V0PosX[31:0],DBG_V0PosY[31:0],DBG_V0PosZ[31:0],DBG_V0PosW[31:0],DBG_V1PosX[31:0],DBG_V1PosY[31:0],DBG_V1PosZ[31:0],DBG_V1PosW[31:0],DBG_V2PosX[31:0],DBG_V2PosY[31:0],DBG_V2PosZ[31:0],DBG_V2PosW[31:0],DBG_ClipOutcodes0[10:0],DBG_ClipOutcodes1[10:0],DBG_ClipOutcodes2[10:0],DBG_AlreadyClippedPlanes[10:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ClipUnit,Vivado 2025.2";
begin
end;
