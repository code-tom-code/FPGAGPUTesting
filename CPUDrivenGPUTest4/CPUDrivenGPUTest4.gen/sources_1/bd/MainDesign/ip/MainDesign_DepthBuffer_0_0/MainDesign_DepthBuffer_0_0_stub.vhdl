-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:25 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DepthBuffer_0_0/MainDesign_DepthBuffer_0_0_stub.vhdl
-- Design      : MainDesign_DepthBuffer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_DepthBuffer_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    RAST_PixelReady : in STD_LOGIC;
    RAST_PosX : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_PosY : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_InPixelDepth : in STD_LOGIC_VECTOR ( 23 downto 0 );
    RAST_SetDepthParams : in STD_LOGIC;
    RAST_DepthWriteEnable : in STD_LOGIC;
    RAST_DepthFunction : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_DepthIsIdle : out STD_LOGIC;
    RAST_StencilWriteEnable : in STD_LOGIC;
    RAST_StencilRefVal : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilReadMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilWriteMask : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RAST_StencilCmpFunc : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilZFailOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_StencilPassOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_PixelPassedDepthStencilTest : out STD_LOGIC;
    RAST_PixelFailedDepthTest : out STD_LOGIC;
    RAST_PixelFailedStencilTest : out STD_LOGIC;
    URAM_addra : out STD_LOGIC_VECTOR ( 17 downto 0 );
    URAM_clka : out STD_LOGIC;
    URAM_dina : out STD_LOGIC_VECTOR ( 63 downto 0 );
    URAM_ena : out STD_LOGIC;
    URAM_wea : out STD_LOGIC_VECTOR ( 7 downto 0 );
    URAM_addrb : out STD_LOGIC_VECTOR ( 17 downto 0 );
    URAM_clkb : out STD_LOGIC;
    URAM_doutb : in STD_LOGIC_VECTOR ( 63 downto 0 );
    URAM_enb : out STD_LOGIC;
    CMD_ClearDepthBuffer : in STD_LOGIC;
    CMD_ClearStencilBuffer : in STD_LOGIC;
    CMD_ClearDepthValue : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CMD_ClearStencilValue : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CMD_DepthIsIdle : out STD_LOGIC;
    STAT_PixelsPassedDepthStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedStencilTest : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_DepthBuffer_0_0 : entity is "MainDesign_DepthBuffer_0_0,DepthBuffer,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_DepthBuffer_0_0 : entity is "MainDesign_DepthBuffer_0_0,DepthBuffer,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DepthBuffer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,NUM_PIPELINE_STAGES=4}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_DepthBuffer_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_DepthBuffer_0_0 : entity is "module_ref";
end MainDesign_DepthBuffer_0_0;

architecture stub of MainDesign_DepthBuffer_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,RAST_PixelReady,RAST_PosX[9:0],RAST_PosY[9:0],RAST_InPixelDepth[23:0],RAST_SetDepthParams,RAST_DepthWriteEnable,RAST_DepthFunction[2:0],RAST_DepthIsIdle,RAST_StencilWriteEnable,RAST_StencilRefVal[7:0],RAST_StencilReadMask[7:0],RAST_StencilWriteMask[7:0],RAST_StencilCmpFunc[2:0],RAST_StencilFailOp[2:0],RAST_StencilZFailOp[2:0],RAST_StencilPassOp[2:0],RAST_PixelPassedDepthStencilTest,RAST_PixelFailedDepthTest,RAST_PixelFailedStencilTest,URAM_addra[17:0],URAM_clka,URAM_dina[63:0],URAM_ena,URAM_wea[7:0],URAM_addrb[17:0],URAM_clkb,URAM_doutb[63:0],URAM_enb,CMD_ClearDepthBuffer,CMD_ClearStencilBuffer,CMD_ClearDepthValue[23:0],CMD_ClearStencilValue[7:0],CMD_DepthIsIdle,STAT_PixelsPassedDepthStencilTest[31:0],STAT_PixelsFailedDepthTest[31:0],STAT_PixelsFailedStencilTest[31:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF DBufferRAMW:DBufferRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of URAM_addra : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";
  attribute x_interface_mode of URAM_addra : signal is "master DBufferRAMW";
  attribute x_interface_parameter of URAM_addra : signal is "XIL_INTERFACENAME DBufferRAMW, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of URAM_clka : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW CLK";
  attribute x_interface_info of URAM_dina : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
  attribute x_interface_info of URAM_ena : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW EN";
  attribute x_interface_info of URAM_wea : signal is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
  attribute x_interface_info of URAM_addrb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
  attribute x_interface_mode of URAM_addrb : signal is "master DBufferRAMR";
  attribute x_interface_parameter of URAM_addrb : signal is "XIL_INTERFACENAME DBufferRAMR, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of URAM_clkb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR CLK";
  attribute x_interface_info of URAM_doutb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT";
  attribute x_interface_mode of URAM_doutb : signal is "master";
  attribute x_interface_info of URAM_enb : signal is "xilinx.com:interface:bram:1.0 DBufferRAMR EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "DepthBuffer,Vivado 2025.2";
begin
end;
