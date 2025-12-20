-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Tue Dec 16 23:51:32 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_AttrInterpolator_0_0/MainDesign_AttrInterpolator_0_0_stub.vhdl
-- Design      : MainDesign_AttrInterpolator_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_AttrInterpolator_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    DINTERP_FIFO_rd_data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    DINTERP_FIFO_empty : in STD_LOGIC;
    DINTERP_FIFO_almost_empty : in STD_LOGIC;
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
    DBG_CurrentDrawEvent : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_NewMessage : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_AttrInterpolator_0_0 : entity is "MainDesign_AttrInterpolator_0_0,AttrInterpolator,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_AttrInterpolator_0_0 : entity is "MainDesign_AttrInterpolator_0_0,AttrInterpolator,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=AttrInterpolator,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,MAX_OCCUPANCY=8}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_AttrInterpolator_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_AttrInterpolator_0_0 : entity is "module_ref";
end MainDesign_AttrInterpolator_0_0;

architecture stub of MainDesign_AttrInterpolator_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,DINTERP_FIFO_rd_data[127:0],DINTERP_FIFO_empty,DINTERP_FIFO_almost_empty,DINTERP_FIFO_rd_en,TRICACHE_inT0X[31:0],TRICACHE_inT0Y[31:0],TRICACHE_inT10X[31:0],TRICACHE_inT10Y[31:0],TRICACHE_inT20X[31:0],TRICACHE_inT20Y[31:0],TRICACHE_inColorRGBA0[127:0],TRICACHE_inColorRGBA10[127:0],TRICACHE_inColorRGBA20[127:0],TRICACHE_PopTriangleSlot,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV0_A[31:0],FPU_CNV0_Mode[2:0],FPU_CNV0_OUT[31:0],FPU_CNV0_GO,FPU_CNV1_A[31:0],FPU_CNV1_Mode[2:0],FPU_CNV1_OUT[31:0],FPU_CNV1_GO,TEXSAMP_OutFIFO_wr_data[95:0],TEXSAMP_OutFIFO_full,TEXSAMP_OutFIFO_wr_en,TEXSAMP_OutFIFO_almost_full,STATE_StateBitsAtDrawID[6:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_AttrInterpolator_State[2:0],DBG_InterpolatorDriver_State[2:0],DBG_MultiplierDriver_State[2:0],DBG_ConverterDriver_State[2:0],DBG_OutputDriver_State[2:0],DBG_PixelWFIFO[31:0],DBG_RastBarycentricB[31:0],DBG_RastBarycentricC[31:0],DBG_CurrentDrawEvent[15:0],DBG_Message[15:0],DBG_MessageData[15:0],DBG_NewMessage";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF TEXSAMP_OUT_FIFO:ATTR_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of DINTERP_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_DATA";
  attribute x_interface_mode of DINTERP_FIFO_rd_data : signal is "master ATTR_FIFO";
  attribute x_interface_info of DINTERP_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO EMPTY";
  attribute x_interface_info of DINTERP_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO ALMOST_EMPTY";
  attribute x_interface_info of DINTERP_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_EN";
  attribute x_interface_info of TEXSAMP_OutFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_DATA";
  attribute x_interface_mode of TEXSAMP_OutFIFO_wr_data : signal is "master TEXSAMP_OUT_FIFO";
  attribute x_interface_info of TEXSAMP_OutFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO FULL";
  attribute x_interface_info of TEXSAMP_OutFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "AttrInterpolator,Vivado 2025.2";
begin
end;
