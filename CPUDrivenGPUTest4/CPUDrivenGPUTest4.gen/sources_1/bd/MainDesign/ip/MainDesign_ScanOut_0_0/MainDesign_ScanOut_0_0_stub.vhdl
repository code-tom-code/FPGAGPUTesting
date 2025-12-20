-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:29 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ScanOut_0_0/MainDesign_ScanOut_0_0_stub.vhdl
-- Design      : MainDesign_ScanOut_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ScanOut_0_0 is
  Port ( 
    clk_x10 : in STD_LOGIC;
    pixelClk : out STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanoutEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    outXCoord : out STD_LOGIC_VECTOR ( 9 downto 0 );
    outYCoord : out STD_LOGIC_VECTOR ( 9 downto 0 );
    MEM_ScanoutReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_ScanoutReadRequestsFIFO_full : in STD_LOGIC;
    MEM_ScanoutReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_ScanoutReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_almost_empty : in STD_LOGIC;
    MEM_ScanoutReadResponsesFIFO_rd_en : out STD_LOGIC;
    VSyncActivePolarity : in STD_LOGIC;
    HSyncActivePolarity : in STD_LOGIC;
    out_scanout_enable : out STD_LOGIC;
    vsync : out STD_LOGIC;
    hsync : out STD_LOGIC;
    blank : out STD_LOGIC;
    outR : out STD_LOGIC_VECTOR ( 7 downto 0 );
    outG : out STD_LOGIC_VECTOR ( 7 downto 0 );
    outB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    guardBandEnable : out STD_LOGIC;
    guardBandType : out STD_LOGIC;
    controlChannel0Blue : out STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel1Green : out STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : out STD_LOGIC_VECTOR ( 1 downto 0 );
    isTERC4Region : out STD_LOGIC;
    TERC4Character0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ScanoutLoadProcess_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_InternalScanX : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_InternalScanY : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ScanOut_0_0 : entity is "MainDesign_ScanOut_0_0,ScanOut,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ScanOut_0_0 : entity is "MainDesign_ScanOut_0_0,ScanOut,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ScanOut,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,Use_HDMI=true}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ScanOut_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ScanOut_0_0 : entity is "module_ref";
end MainDesign_ScanOut_0_0;

architecture stub of MainDesign_ScanOut_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk_x10,pixelClk,CMD_BaseRenderTargetAddr[29:0],CMD_ScanoutEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],outXCoord[9:0],outYCoord[9:0],MEM_ScanoutReadRequestsFIFO_wr_data[29:0],MEM_ScanoutReadRequestsFIFO_full,MEM_ScanoutReadRequestsFIFO_wr_en,MEM_ScanoutReadResponsesFIFO_rd_data[255:0],MEM_ScanoutReadResponsesFIFO_empty,MEM_ScanoutReadResponsesFIFO_almost_empty,MEM_ScanoutReadResponsesFIFO_rd_en,VSyncActivePolarity,HSyncActivePolarity,out_scanout_enable,vsync,hsync,blank,outR[7:0],outG[7:0],outB[7:0],guardBandEnable,guardBandType,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],DBG_ScanoutLoadProcess_State[3:0],DBG_InternalScanX[9:0],DBG_InternalScanY[9:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk_x10 : signal is "xilinx.com:signal:clock:1.0 clk_x10 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk_x10 : signal is "slave clk_x10";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk_x10 : signal is "XIL_INTERFACENAME clk_x10, FREQ_HZ 251750000, ASSOCIATED_BUSIF ScanoutReadRequestsFIFO:ScanoutReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0";
  attribute x_interface_info of MEM_ScanoutReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_ScanoutReadRequestsFIFO_wr_data : signal is "master ScanoutReadRequestsFIFO";
  attribute x_interface_info of MEM_ScanoutReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO FULL";
  attribute x_interface_info of MEM_ScanoutReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_EN";
  attribute x_interface_info of MEM_ScanoutReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_DATA";
  attribute x_interface_mode of MEM_ScanoutReadResponsesFIFO_rd_data : signal is "master ScanoutReadResponses";
  attribute x_interface_info of MEM_ScanoutReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses EMPTY";
  attribute x_interface_info of MEM_ScanoutReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses ALMOST_EMPTY";
  attribute x_interface_info of MEM_ScanoutReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ScanOut,Vivado 2025.2";
begin
end;
