-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:58:52 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_Rasterizer_0_0/MainDesign_Rasterizer_0_0_stub.vhdl
-- Design      : MainDesign_Rasterizer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_Rasterizer_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    TRISETUP_newTriBegin : in STD_LOGIC;
    TRISETUP_readyForNewTri : out STD_LOGIC;
    TRISETUP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inMinX : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inMaxX : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inMinY : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inMaxY : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inInitialBarycentricRowResetA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inInitialBarycentricRowResetB : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inInitialBarycentricRowResetC : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inIsTopLeftEdgeA : in STD_LOGIC;
    TRISETUP_inIsTopLeftEdgeB : in STD_LOGIC;
    TRISETUP_inIsTopLeftEdgeC : in STD_LOGIC;
    TRISETUP_inBarycentricXDeltaA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricXDeltaB : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricXDeltaC : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricYDeltaA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricYDeltaB : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricYDeltaC : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_inBarycentricInverse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inZ0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inZ10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inZ20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inInvW0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inInvW10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inInvW20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTX0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTY0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTX10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTY10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTX20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inTY20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_inVertColor0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    TRISETUP_inVertColor10 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    TRISETUP_inVertColor20 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RASTOUT_FIFO_full : in STD_LOGIC;
    RASTOUT_FIFO_almost_full : in STD_LOGIC;
    RASTOUT_FIFO_wr_data : out STD_LOGIC_VECTOR ( 95 downto 0 );
    RASTOUT_FIFO_wr_en : out STD_LOGIC;
    TRICACHE_BarycentricInverse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_Z0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_Z10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_Z20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_InvW0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_InvW10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_InvW20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TX0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TX10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TX20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TY0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TY10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_TY20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_VertColor0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_VertColor10 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_VertColor20 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    TRICACHE_PushNewTriData : out STD_LOGIC;
    TRICACHE_IsFull : in STD_LOGIC;
    CMD_Rasterizer_Idle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForTriWorkCache : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Rasterizer_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_PixelXPos : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_PixelYPos : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_BarycentricA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_BarycentricB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_BarycentricC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_MinX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MinY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_NewMessage : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_Rasterizer_0_0 : entity is "MainDesign_Rasterizer_0_0,Rasterizer,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_Rasterizer_0_0 : entity is "MainDesign_Rasterizer_0_0,Rasterizer,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Rasterizer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_Rasterizer_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_Rasterizer_0_0 : entity is "module_ref";
end MainDesign_Rasterizer_0_0;

architecture stub of MainDesign_Rasterizer_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,TRISETUP_newTriBegin,TRISETUP_readyForNewTri,TRISETUP_CurrentDrawEventID[15:0],TRISETUP_inMinX[15:0],TRISETUP_inMaxX[15:0],TRISETUP_inMinY[15:0],TRISETUP_inMaxY[15:0],TRISETUP_inInitialBarycentricRowResetA[31:0],TRISETUP_inInitialBarycentricRowResetB[31:0],TRISETUP_inInitialBarycentricRowResetC[31:0],TRISETUP_inIsTopLeftEdgeA,TRISETUP_inIsTopLeftEdgeB,TRISETUP_inIsTopLeftEdgeC,TRISETUP_inBarycentricXDeltaA[15:0],TRISETUP_inBarycentricXDeltaB[15:0],TRISETUP_inBarycentricXDeltaC[15:0],TRISETUP_inBarycentricYDeltaA[15:0],TRISETUP_inBarycentricYDeltaB[15:0],TRISETUP_inBarycentricYDeltaC[15:0],TRISETUP_inBarycentricInverse[31:0],TRISETUP_inZ0[31:0],TRISETUP_inZ10[31:0],TRISETUP_inZ20[31:0],TRISETUP_inInvW0[31:0],TRISETUP_inInvW10[31:0],TRISETUP_inInvW20[31:0],TRISETUP_inTX0[31:0],TRISETUP_inTY0[31:0],TRISETUP_inTX10[31:0],TRISETUP_inTY10[31:0],TRISETUP_inTX20[31:0],TRISETUP_inTY20[31:0],TRISETUP_inVertColor0[127:0],TRISETUP_inVertColor10[127:0],TRISETUP_inVertColor20[127:0],RASTOUT_FIFO_full,RASTOUT_FIFO_almost_full,RASTOUT_FIFO_wr_data[95:0],RASTOUT_FIFO_wr_en,TRICACHE_BarycentricInverse[31:0],TRICACHE_Z0[31:0],TRICACHE_Z10[31:0],TRICACHE_Z20[31:0],TRICACHE_InvW0[31:0],TRICACHE_InvW10[31:0],TRICACHE_InvW20[31:0],TRICACHE_TX0[31:0],TRICACHE_TX10[31:0],TRICACHE_TX20[31:0],TRICACHE_TY0[31:0],TRICACHE_TY10[31:0],TRICACHE_TY20[31:0],TRICACHE_VertColor0[127:0],TRICACHE_VertColor10[127:0],TRICACHE_VertColor20[127:0],TRICACHE_PushNewTriData,TRICACHE_IsFull,CMD_Rasterizer_Idle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForTriWorkCache[31:0],STAT_CurrentDrawEventID[15:0],DBG_Rasterizer_State[3:0],DBG_PixelXPos[15:0],DBG_PixelYPos[15:0],DBG_BarycentricA[31:0],DBG_BarycentricB[31:0],DBG_BarycentricC[31:0],DBG_MinX[15:0],DBG_MaxX[15:0],DBG_MinY[15:0],DBG_MaxY[15:0],DBG_Message[15:0],DBG_MessageData[15:0],DBG_NewMessage";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF RASTOUT_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of RASTOUT_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO FULL";
  attribute x_interface_mode of RASTOUT_FIFO_full : signal is "master RASTOUT_FIFO";
  attribute x_interface_info of RASTOUT_FIFO_almost_full : signal is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO ALMOST_FULL";
  attribute x_interface_info of RASTOUT_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA";
  attribute x_interface_info of RASTOUT_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "Rasterizer,Vivado 2025.2";
begin
end;
