-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:21:04 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ConstantBuffer_0_0/MainDesign_ConstantBuffer_0_0_sim_netlist.vhdl
-- Design      : MainDesign_ConstantBuffer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_ConstantBuffer_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_ConstantBuffer_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ConstantBuffer_0_0 : entity is "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ConstantBuffer_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ConstantBuffer_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_ConstantBuffer_0_0 : entity is "ConstantBuffer,Vivado 2025.2";
end MainDesign_ConstantBuffer_0_0;

architecture STRUCTURE of MainDesign_ConstantBuffer_0_0 is
  signal \^constbufferbram_douta\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^clk\ : STD_LOGIC;
  signal \^enable\ : STD_LOGIC;
  signal \^regcomponent\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^regindex\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^writeindata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^writemode\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of ConstBufferBRAM_clka : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK";
  attribute x_interface_info of ConstBufferBRAM_ena : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ConstBufferBRAM, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of ConstBufferBRAM_addra : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR";
  attribute x_interface_mode of ConstBufferBRAM_addra : signal is "master ConstBufferBRAM";
  attribute x_interface_parameter of ConstBufferBRAM_addra : signal is "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of ConstBufferBRAM_dina : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN";
  attribute x_interface_info of ConstBufferBRAM_douta : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT";
  attribute x_interface_info of ConstBufferBRAM_wea : signal is "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE";
begin
  ConstBufferBRAM_addra(9 downto 2) <= \^regindex\(7 downto 0);
  ConstBufferBRAM_addra(1 downto 0) <= \^regcomponent\(1 downto 0);
  ConstBufferBRAM_clka <= \^clk\;
  ConstBufferBRAM_dina(31 downto 0) <= \^writeindata\(31 downto 0);
  ConstBufferBRAM_ena <= \^enable\;
  ConstBufferBRAM_wea(0) <= \^writemode\;
  \^clk\ <= clk;
  \^constbufferbram_douta\(31 downto 0) <= ConstBufferBRAM_douta(31 downto 0);
  \^enable\ <= enable;
  \^regcomponent\(1 downto 0) <= regComponent(1 downto 0);
  \^regindex\(7 downto 0) <= regIndex(7 downto 0);
  \^writeindata\(31 downto 0) <= writeInData(31 downto 0);
  \^writemode\ <= writeMode;
  readOutData(31 downto 0) <= \^constbufferbram_douta\(31 downto 0);
end STRUCTURE;
