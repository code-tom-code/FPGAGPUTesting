-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:33:51 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_GPRQuad2_0_0/design_1_GPRQuad2_0_0_sim_netlist.vhdl
-- Design      : design_1_GPRQuad2_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_GPRQuad2_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_GPRQuad2_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_GPRQuad2_0_0 : entity is "design_1_GPRQuad2_0_0,GPRQuad2,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_GPRQuad2_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_GPRQuad2_0_0 : entity is "GPRQuad2,Vivado 2018.1_AR73068";
end design_1_GPRQuad2_0_0;

architecture STRUCTURE of design_1_GPRQuad2_0_0 is
  signal \<const1>\ : STD_LOGIC;
  signal \^clk\ : STD_LOGIC;
  signal \^doutb_bram0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram1\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram2\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram3\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram4\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram5\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram6\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^doutb_bram7\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^porta_en\ : STD_LOGIC;
  signal \^porta_regchan\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^porta_regidx\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^porta_regtype\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^portb_en\ : STD_LOGIC;
  signal \^portb_regchan\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^portb_regidx\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^portb_regtype\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^portw_en\ : STD_LOGIC;
  signal \^portw_regchan\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^portw_regidx\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^portw_regtype\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^portw_writeindata\ : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal \^readquadindex\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^writequadindex\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  attribute x_interface_info of clka_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0W CLK";
  attribute x_interface_parameter of clka_bram0 : signal is "XIL_INTERFACENAME BRAM0W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1W CLK";
  attribute x_interface_parameter of clka_bram1 : signal is "XIL_INTERFACENAME BRAM1W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2W CLK";
  attribute x_interface_parameter of clka_bram2 : signal is "XIL_INTERFACENAME BRAM2W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3W CLK";
  attribute x_interface_parameter of clka_bram3 : signal is "XIL_INTERFACENAME BRAM3W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4W CLK";
  attribute x_interface_parameter of clka_bram4 : signal is "XIL_INTERFACENAME BRAM4W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5W CLK";
  attribute x_interface_parameter of clka_bram5 : signal is "XIL_INTERFACENAME BRAM5W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6W CLK";
  attribute x_interface_parameter of clka_bram6 : signal is "XIL_INTERFACENAME BRAM6W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clka_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7W CLK";
  attribute x_interface_parameter of clka_bram7 : signal is "XIL_INTERFACENAME BRAM7W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0R CLK";
  attribute x_interface_parameter of clkb_bram0 : signal is "XIL_INTERFACENAME BRAM0R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1R CLK";
  attribute x_interface_parameter of clkb_bram1 : signal is "XIL_INTERFACENAME BRAM1R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2R CLK";
  attribute x_interface_parameter of clkb_bram2 : signal is "XIL_INTERFACENAME BRAM2R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3R CLK";
  attribute x_interface_parameter of clkb_bram3 : signal is "XIL_INTERFACENAME BRAM3R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4R CLK";
  attribute x_interface_parameter of clkb_bram4 : signal is "XIL_INTERFACENAME BRAM4R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5R CLK";
  attribute x_interface_parameter of clkb_bram5 : signal is "XIL_INTERFACENAME BRAM5R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6R CLK";
  attribute x_interface_parameter of clkb_bram6 : signal is "XIL_INTERFACENAME BRAM6R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of clkb_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7R CLK";
  attribute x_interface_parameter of clkb_bram7 : signal is "XIL_INTERFACENAME BRAM7R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  attribute x_interface_info of ena_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0W EN";
  attribute x_interface_info of ena_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1W EN";
  attribute x_interface_info of ena_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2W EN";
  attribute x_interface_info of ena_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3W EN";
  attribute x_interface_info of ena_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4W EN";
  attribute x_interface_info of ena_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5W EN";
  attribute x_interface_info of ena_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6W EN";
  attribute x_interface_info of ena_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7W EN";
  attribute x_interface_info of enb_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0R EN";
  attribute x_interface_info of enb_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1R EN";
  attribute x_interface_info of enb_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2R EN";
  attribute x_interface_info of enb_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3R EN";
  attribute x_interface_info of enb_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4R EN";
  attribute x_interface_info of enb_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5R EN";
  attribute x_interface_info of enb_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6R EN";
  attribute x_interface_info of enb_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7R EN";
  attribute x_interface_info of addra_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0W ADDR";
  attribute x_interface_info of addra_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1W ADDR";
  attribute x_interface_info of addra_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2W ADDR";
  attribute x_interface_info of addra_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3W ADDR";
  attribute x_interface_info of addra_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4W ADDR";
  attribute x_interface_info of addra_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5W ADDR";
  attribute x_interface_info of addra_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6W ADDR";
  attribute x_interface_info of addra_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7W ADDR";
  attribute x_interface_info of addrb_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0R ADDR";
  attribute x_interface_info of addrb_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1R ADDR";
  attribute x_interface_info of addrb_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2R ADDR";
  attribute x_interface_info of addrb_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3R ADDR";
  attribute x_interface_info of addrb_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4R ADDR";
  attribute x_interface_info of addrb_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5R ADDR";
  attribute x_interface_info of addrb_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6R ADDR";
  attribute x_interface_info of addrb_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7R ADDR";
  attribute x_interface_info of dina_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0W DIN";
  attribute x_interface_info of dina_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1W DIN";
  attribute x_interface_info of dina_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2W DIN";
  attribute x_interface_info of dina_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3W DIN";
  attribute x_interface_info of dina_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4W DIN";
  attribute x_interface_info of dina_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5W DIN";
  attribute x_interface_info of dina_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6W DIN";
  attribute x_interface_info of dina_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7W DIN";
  attribute x_interface_info of doutb_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0R DOUT";
  attribute x_interface_info of doutb_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1R DOUT";
  attribute x_interface_info of doutb_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2R DOUT";
  attribute x_interface_info of doutb_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3R DOUT";
  attribute x_interface_info of doutb_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4R DOUT";
  attribute x_interface_info of doutb_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5R DOUT";
  attribute x_interface_info of doutb_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6R DOUT";
  attribute x_interface_info of doutb_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7R DOUT";
  attribute x_interface_info of wea_bram0 : signal is "xilinx.com:interface:bram:1.0 BRAM0W WE";
  attribute x_interface_info of wea_bram1 : signal is "xilinx.com:interface:bram:1.0 BRAM1W WE";
  attribute x_interface_info of wea_bram2 : signal is "xilinx.com:interface:bram:1.0 BRAM2W WE";
  attribute x_interface_info of wea_bram3 : signal is "xilinx.com:interface:bram:1.0 BRAM3W WE";
  attribute x_interface_info of wea_bram4 : signal is "xilinx.com:interface:bram:1.0 BRAM4W WE";
  attribute x_interface_info of wea_bram5 : signal is "xilinx.com:interface:bram:1.0 BRAM5W WE";
  attribute x_interface_info of wea_bram6 : signal is "xilinx.com:interface:bram:1.0 BRAM6W WE";
  attribute x_interface_info of wea_bram7 : signal is "xilinx.com:interface:bram:1.0 BRAM7W WE";
begin
  \^clk\ <= clk;
  \^doutb_bram0\(31 downto 0) <= doutb_bram0(31 downto 0);
  \^doutb_bram1\(31 downto 0) <= doutb_bram1(31 downto 0);
  \^doutb_bram2\(31 downto 0) <= doutb_bram2(31 downto 0);
  \^doutb_bram3\(31 downto 0) <= doutb_bram3(31 downto 0);
  \^doutb_bram4\(31 downto 0) <= doutb_bram4(31 downto 0);
  \^doutb_bram5\(31 downto 0) <= doutb_bram5(31 downto 0);
  \^doutb_bram6\(31 downto 0) <= doutb_bram6(31 downto 0);
  \^doutb_bram7\(31 downto 0) <= doutb_bram7(31 downto 0);
  \^porta_en\ <= portA_en;
  \^porta_regchan\(1 downto 0) <= portA_regChan(1 downto 0);
  \^porta_regidx\(2 downto 0) <= portA_regIdx(2 downto 0);
  \^porta_regtype\(1 downto 0) <= portA_regType(1 downto 0);
  \^portb_en\ <= portB_en;
  \^portb_regchan\(1 downto 0) <= portB_regChan(1 downto 0);
  \^portb_regidx\(2 downto 0) <= portB_regIdx(2 downto 0);
  \^portb_regtype\(1 downto 0) <= portB_regType(1 downto 0);
  \^portw_en\ <= portW_en;
  \^portw_regchan\(1 downto 0) <= portW_regChan(1 downto 0);
  \^portw_regidx\(2 downto 0) <= portW_regIdx(2 downto 0);
  \^portw_regtype\(1 downto 0) <= portW_regType(1 downto 0);
  \^portw_writeindata\(127 downto 0) <= portW_writeInData(127 downto 0);
  \^readquadindex\(1 downto 0) <= readQuadIndex(1 downto 0);
  \^writequadindex\(1 downto 0) <= writeQuadIndex(1 downto 0);
  addra_bram0(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram0(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram0(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram0(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram1(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram1(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram1(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram1(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram2(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram2(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram2(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram2(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram3(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram3(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram3(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram3(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram4(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram4(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram4(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram4(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram5(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram5(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram5(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram5(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram6(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram6(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram6(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram6(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addra_bram7(8 downto 7) <= \^writequadindex\(1 downto 0);
  addra_bram7(6 downto 5) <= \^portw_regtype\(1 downto 0);
  addra_bram7(4 downto 2) <= \^portw_regidx\(2 downto 0);
  addra_bram7(1 downto 0) <= \^portw_regchan\(1 downto 0);
  addrb_bram0(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram0(6 downto 5) <= \^porta_regtype\(1 downto 0);
  addrb_bram0(4 downto 2) <= \^porta_regidx\(2 downto 0);
  addrb_bram0(1 downto 0) <= \^porta_regchan\(1 downto 0);
  addrb_bram1(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram1(6 downto 5) <= \^portb_regtype\(1 downto 0);
  addrb_bram1(4 downto 2) <= \^portb_regidx\(2 downto 0);
  addrb_bram1(1 downto 0) <= \^portb_regchan\(1 downto 0);
  addrb_bram2(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram2(6 downto 5) <= \^porta_regtype\(1 downto 0);
  addrb_bram2(4 downto 2) <= \^porta_regidx\(2 downto 0);
  addrb_bram2(1 downto 0) <= \^porta_regchan\(1 downto 0);
  addrb_bram3(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram3(6 downto 5) <= \^portb_regtype\(1 downto 0);
  addrb_bram3(4 downto 2) <= \^portb_regidx\(2 downto 0);
  addrb_bram3(1 downto 0) <= \^portb_regchan\(1 downto 0);
  addrb_bram4(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram4(6 downto 5) <= \^porta_regtype\(1 downto 0);
  addrb_bram4(4 downto 2) <= \^porta_regidx\(2 downto 0);
  addrb_bram4(1 downto 0) <= \^porta_regchan\(1 downto 0);
  addrb_bram5(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram5(6 downto 5) <= \^portb_regtype\(1 downto 0);
  addrb_bram5(4 downto 2) <= \^portb_regidx\(2 downto 0);
  addrb_bram5(1 downto 0) <= \^portb_regchan\(1 downto 0);
  addrb_bram6(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram6(6 downto 5) <= \^porta_regtype\(1 downto 0);
  addrb_bram6(4 downto 2) <= \^porta_regidx\(2 downto 0);
  addrb_bram6(1 downto 0) <= \^porta_regchan\(1 downto 0);
  addrb_bram7(8 downto 7) <= \^readquadindex\(1 downto 0);
  addrb_bram7(6 downto 5) <= \^portb_regtype\(1 downto 0);
  addrb_bram7(4 downto 2) <= \^portb_regidx\(2 downto 0);
  addrb_bram7(1 downto 0) <= \^portb_regchan\(1 downto 0);
  clka_bram0 <= \^clk\;
  clka_bram1 <= \^clk\;
  clka_bram2 <= \^clk\;
  clka_bram3 <= \^clk\;
  clka_bram4 <= \^clk\;
  clka_bram5 <= \^clk\;
  clka_bram6 <= \^clk\;
  clka_bram7 <= \^clk\;
  clkb_bram0 <= \^clk\;
  clkb_bram1 <= \^clk\;
  clkb_bram2 <= \^clk\;
  clkb_bram3 <= \^clk\;
  clkb_bram4 <= \^clk\;
  clkb_bram5 <= \^clk\;
  clkb_bram6 <= \^clk\;
  clkb_bram7 <= \^clk\;
  dina_bram0(31 downto 0) <= \^portw_writeindata\(31 downto 0);
  dina_bram1(31 downto 0) <= \^portw_writeindata\(31 downto 0);
  dina_bram2(31 downto 0) <= \^portw_writeindata\(63 downto 32);
  dina_bram3(31 downto 0) <= \^portw_writeindata\(63 downto 32);
  dina_bram4(31 downto 0) <= \^portw_writeindata\(95 downto 64);
  dina_bram5(31 downto 0) <= \^portw_writeindata\(95 downto 64);
  dina_bram6(31 downto 0) <= \^portw_writeindata\(127 downto 96);
  dina_bram7(31 downto 0) <= \^portw_writeindata\(127 downto 96);
  ena_bram0 <= \^portw_en\;
  ena_bram1 <= \^portw_en\;
  ena_bram2 <= \^portw_en\;
  ena_bram3 <= \^portw_en\;
  ena_bram4 <= \^portw_en\;
  ena_bram5 <= \^portw_en\;
  ena_bram6 <= \^portw_en\;
  ena_bram7 <= \^portw_en\;
  enb_bram0 <= \^porta_en\;
  enb_bram1 <= \^portb_en\;
  enb_bram2 <= \^porta_en\;
  enb_bram3 <= \^portb_en\;
  enb_bram4 <= \^porta_en\;
  enb_bram5 <= \^portb_en\;
  enb_bram6 <= \^porta_en\;
  enb_bram7 <= \^portb_en\;
  portA_readOutData(127 downto 96) <= \^doutb_bram6\(31 downto 0);
  portA_readOutData(95 downto 64) <= \^doutb_bram4\(31 downto 0);
  portA_readOutData(63 downto 32) <= \^doutb_bram2\(31 downto 0);
  portA_readOutData(31 downto 0) <= \^doutb_bram0\(31 downto 0);
  portB_readOutData(127 downto 96) <= \^doutb_bram7\(31 downto 0);
  portB_readOutData(95 downto 64) <= \^doutb_bram5\(31 downto 0);
  portB_readOutData(63 downto 32) <= \^doutb_bram3\(31 downto 0);
  portB_readOutData(31 downto 0) <= \^doutb_bram1\(31 downto 0);
  wea_bram0(0) <= \<const1>\;
  wea_bram1(0) <= \<const1>\;
  wea_bram2(0) <= \<const1>\;
  wea_bram3(0) <= \<const1>\;
  wea_bram4(0) <= \<const1>\;
  wea_bram5(0) <= \<const1>\;
  wea_bram6(0) <= \<const1>\;
  wea_bram7(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;