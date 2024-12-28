-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:33:51 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_GPRQuad2_0_0/design_1_GPRQuad2_0_0_stub.vhdl
-- Design      : design_1_GPRQuad2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_GPRQuad2_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    readQuadIndex : in STD_LOGIC_VECTOR ( 1 downto 0 );
    writeQuadIndex : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portA_en : in STD_LOGIC;
    portA_regType : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portA_regIdx : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portA_regChan : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portA_readOutData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    portB_en : in STD_LOGIC;
    portB_regType : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portB_regIdx : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portB_regChan : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portB_readOutData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    portW_en : in STD_LOGIC;
    portW_regType : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portW_regIdx : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portW_regChan : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portW_writeInData : in STD_LOGIC_VECTOR ( 127 downto 0 );
    clka_bram0 : out STD_LOGIC;
    addra_bram0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram0 : out STD_LOGIC;
    wea_bram0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram0 : out STD_LOGIC;
    addrb_bram0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram0 : out STD_LOGIC;
    doutb_bram0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram1 : out STD_LOGIC;
    addra_bram1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram1 : out STD_LOGIC;
    wea_bram1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram1 : out STD_LOGIC;
    addrb_bram1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram1 : out STD_LOGIC;
    doutb_bram1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram2 : out STD_LOGIC;
    addra_bram2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram2 : out STD_LOGIC;
    wea_bram2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram2 : out STD_LOGIC;
    addrb_bram2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram2 : out STD_LOGIC;
    doutb_bram2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram3 : out STD_LOGIC;
    addra_bram3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram3 : out STD_LOGIC;
    wea_bram3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram3 : out STD_LOGIC;
    addrb_bram3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram3 : out STD_LOGIC;
    doutb_bram3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram4 : out STD_LOGIC;
    addra_bram4 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram4 : out STD_LOGIC;
    wea_bram4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram4 : out STD_LOGIC;
    addrb_bram4 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram4 : out STD_LOGIC;
    doutb_bram4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram5 : out STD_LOGIC;
    addra_bram5 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram5 : out STD_LOGIC;
    wea_bram5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram5 : out STD_LOGIC;
    addrb_bram5 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram5 : out STD_LOGIC;
    doutb_bram5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram6 : out STD_LOGIC;
    addra_bram6 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram6 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram6 : out STD_LOGIC;
    wea_bram6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram6 : out STD_LOGIC;
    addrb_bram6 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram6 : out STD_LOGIC;
    doutb_bram6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clka_bram7 : out STD_LOGIC;
    addra_bram7 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    dina_bram7 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ena_bram7 : out STD_LOGIC;
    wea_bram7 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb_bram7 : out STD_LOGIC;
    addrb_bram7 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    enb_bram7 : out STD_LOGIC;
    doutb_bram7 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_GPRQuad2_0_0;

architecture stub of design_1_GPRQuad2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,readQuadIndex[1:0],writeQuadIndex[1:0],portA_en,portA_regType[1:0],portA_regIdx[2:0],portA_regChan[1:0],portA_readOutData[127:0],portB_en,portB_regType[1:0],portB_regIdx[2:0],portB_regChan[1:0],portB_readOutData[127:0],portW_en,portW_regType[1:0],portW_regIdx[2:0],portW_regChan[1:0],portW_writeInData[127:0],clka_bram0,addra_bram0[8:0],dina_bram0[31:0],ena_bram0,wea_bram0[0:0],clkb_bram0,addrb_bram0[8:0],enb_bram0,doutb_bram0[31:0],clka_bram1,addra_bram1[8:0],dina_bram1[31:0],ena_bram1,wea_bram1[0:0],clkb_bram1,addrb_bram1[8:0],enb_bram1,doutb_bram1[31:0],clka_bram2,addra_bram2[8:0],dina_bram2[31:0],ena_bram2,wea_bram2[0:0],clkb_bram2,addrb_bram2[8:0],enb_bram2,doutb_bram2[31:0],clka_bram3,addra_bram3[8:0],dina_bram3[31:0],ena_bram3,wea_bram3[0:0],clkb_bram3,addrb_bram3[8:0],enb_bram3,doutb_bram3[31:0],clka_bram4,addra_bram4[8:0],dina_bram4[31:0],ena_bram4,wea_bram4[0:0],clkb_bram4,addrb_bram4[8:0],enb_bram4,doutb_bram4[31:0],clka_bram5,addra_bram5[8:0],dina_bram5[31:0],ena_bram5,wea_bram5[0:0],clkb_bram5,addrb_bram5[8:0],enb_bram5,doutb_bram5[31:0],clka_bram6,addra_bram6[8:0],dina_bram6[31:0],ena_bram6,wea_bram6[0:0],clkb_bram6,addrb_bram6[8:0],enb_bram6,doutb_bram6[31:0],clka_bram7,addra_bram7[8:0],dina_bram7[31:0],ena_bram7,wea_bram7[0:0],clkb_bram7,addrb_bram7[8:0],enb_bram7,doutb_bram7[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "GPRQuad2,Vivado 2018.1_AR73068";
begin
end;
