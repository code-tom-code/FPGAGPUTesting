-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:04:05 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ConstantBuffer_0_0/MainDesign_ConstantBuffer_0_0_stub.vhdl
-- Design      : MainDesign_ConstantBuffer_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ConstantBuffer_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    writeMode : in STD_LOGIC;
    regIndex : in STD_LOGIC_VECTOR ( 7 downto 0 );
    regComponent : in STD_LOGIC_VECTOR ( 1 downto 0 );
    readOutData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    writeInData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ConstBufferBRAM_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    ConstBufferBRAM_clka : out STD_LOGIC;
    ConstBufferBRAM_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ConstBufferBRAM_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ConstBufferBRAM_ena : out STD_LOGIC;
    ConstBufferBRAM_wea : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ConstantBuffer_0_0 : entity is "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ConstantBuffer_0_0 : entity is "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ConstantBuffer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ConstantBuffer_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ConstantBuffer_0_0 : entity is "module_ref";
end MainDesign_ConstantBuffer_0_0;

architecture stub of MainDesign_ConstantBuffer_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,enable,writeMode,regIndex[7:0],regComponent[1:0],readOutData[31:0],writeInData[31:0],ConstBufferBRAM_addra[9:0],ConstBufferBRAM_clka,ConstBufferBRAM_dina[31:0],ConstBufferBRAM_douta[31:0],ConstBufferBRAM_ena,ConstBufferBRAM_wea[0:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ConstBufferBRAM, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of ConstBufferBRAM_addra : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR";
  attribute x_interface_mode of ConstBufferBRAM_addra : signal is "master ConstBufferBRAM";
  attribute x_interface_parameter of ConstBufferBRAM_addra : signal is "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of ConstBufferBRAM_clka : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK";
  attribute x_interface_info of ConstBufferBRAM_dina : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN";
  attribute x_interface_info of ConstBufferBRAM_douta : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT";
  attribute x_interface_info of ConstBufferBRAM_ena : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN";
  attribute x_interface_info of ConstBufferBRAM_wea : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ConstantBuffer,Vivado 2025.2";
begin
end;
