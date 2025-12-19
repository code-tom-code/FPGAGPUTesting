-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Fri Apr 25 20:02:54 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthBuffer_0_0/design_1_DepthBuffer_0_0_stub.vhdl
-- Design      : design_1_DepthBuffer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_DepthBuffer_0_0 is
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

end design_1_DepthBuffer_0_0;

architecture stub of design_1_DepthBuffer_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,RAST_PixelReady,RAST_PosX[9:0],RAST_PosY[9:0],RAST_InPixelDepth[23:0],RAST_SetDepthParams,RAST_DepthWriteEnable,RAST_DepthFunction[2:0],RAST_DepthIsIdle,RAST_StencilWriteEnable,RAST_StencilRefVal[7:0],RAST_StencilReadMask[7:0],RAST_StencilWriteMask[7:0],RAST_StencilCmpFunc[2:0],RAST_StencilFailOp[2:0],RAST_StencilZFailOp[2:0],RAST_StencilPassOp[2:0],RAST_PixelPassedDepthStencilTest,RAST_PixelFailedDepthTest,RAST_PixelFailedStencilTest,URAM_addra[17:0],URAM_clka,URAM_dina[63:0],URAM_ena,URAM_wea[7:0],URAM_addrb[17:0],URAM_clkb,URAM_doutb[63:0],URAM_enb,CMD_ClearDepthBuffer,CMD_ClearStencilBuffer,CMD_ClearDepthValue[23:0],CMD_ClearStencilValue[7:0],CMD_DepthIsIdle,STAT_PixelsPassedDepthStencilTest[31:0],STAT_PixelsFailedDepthTest[31:0],STAT_PixelsFailedStencilTest[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "DepthBuffer,Vivado 2018.1_AR73068";
begin
end;
