--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
--Date        : Sun Oct 20 18:51:29 2024
--Host        : Dragon2 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GPRQuadSystem_imp_13ZJ6LX is
  port (
    clk_0 : in STD_LOGIC;
    portA_en_0 : in STD_LOGIC;
    portA_readOutData_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    portA_regChan_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portA_regIdx_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portA_regType_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portB_en_0 : in STD_LOGIC;
    portB_readOutData_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    portB_regChan_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portB_regIdx_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portB_regType_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portW_en_0 : in STD_LOGIC;
    portW_regChan_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portW_regIdx_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    portW_regType_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    portW_writeInData_0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    readQuadIndex_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    writeQuadIndex_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end GPRQuadSystem_imp_13ZJ6LX;

architecture STRUCTURE of GPRQuadSystem_imp_13ZJ6LX is
  component design_1_blk_mem_gen_0_9 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_9;
  component design_1_blk_mem_gen_0_10 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_10;
  component design_1_blk_mem_gen_0_11 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_11;
  component design_1_blk_mem_gen_1_1 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_1_1;
  component design_1_blk_mem_gen_0_12 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_12;
  component design_1_blk_mem_gen_1_2 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_1_2;
  component design_1_blk_mem_gen_2_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_2_0;
  component design_1_blk_mem_gen_3_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_3_0;
  component design_1_GPRQuad2_0_0 is
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
  end component design_1_GPRQuad2_0_0;
  signal GPRQuad2_0_BRAM0R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM0R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM0R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM0R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM0W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM0W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM0W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM0W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM0W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM1R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM1R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM1R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM1R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM1W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM1W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM1W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM1W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM1W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM2R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM2R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM2R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM2R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM2W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM2W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM2W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM2W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM2W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM3R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM3R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM3R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM3R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM3W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM3W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM3W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM3W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM3W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM4R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM4R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM4R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM4R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM4W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM4W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM4W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM4W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM4W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM5R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM5R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM5R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM5R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM5W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM5W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM5W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM5W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM5W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM6R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM6R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM6R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM6R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM6W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM6W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM6W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM6W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM6W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_BRAM7R_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM7R_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM7R_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM7R_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM7W_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal GPRQuad2_0_BRAM7W_CLK : STD_LOGIC;
  signal GPRQuad2_0_BRAM7W_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuad2_0_BRAM7W_EN : STD_LOGIC;
  signal GPRQuad2_0_BRAM7W_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPRQuad2_0_portA_readOutData : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal GPRQuad2_0_portB_readOutData : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal portA_en_0_1 : STD_LOGIC;
  signal portA_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portA_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portA_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portB_en_0_1 : STD_LOGIC;
  signal portB_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portB_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portB_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_en_0_1 : STD_LOGIC;
  signal portW_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portW_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_writeInData_0_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal readQuadIndex_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal writeQuadIndex_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  clk_0_1 <= clk_0;
  portA_en_0_1 <= portA_en_0;
  portA_readOutData_0(127 downto 0) <= GPRQuad2_0_portA_readOutData(127 downto 0);
  portA_regChan_0_1(1 downto 0) <= portA_regChan_0(1 downto 0);
  portA_regIdx_0_1(2 downto 0) <= portA_regIdx_0(2 downto 0);
  portA_regType_0_1(1 downto 0) <= portA_regType_0(1 downto 0);
  portB_en_0_1 <= portB_en_0;
  portB_readOutData_0(127 downto 0) <= GPRQuad2_0_portB_readOutData(127 downto 0);
  portB_regChan_0_1(1 downto 0) <= portB_regChan_0(1 downto 0);
  portB_regIdx_0_1(2 downto 0) <= portB_regIdx_0(2 downto 0);
  portB_regType_0_1(1 downto 0) <= portB_regType_0(1 downto 0);
  portW_en_0_1 <= portW_en_0;
  portW_regChan_0_1(1 downto 0) <= portW_regChan_0(1 downto 0);
  portW_regIdx_0_1(2 downto 0) <= portW_regIdx_0(2 downto 0);
  portW_regType_0_1(1 downto 0) <= portW_regType_0(1 downto 0);
  portW_writeInData_0_1(127 downto 0) <= portW_writeInData_0(127 downto 0);
  readQuadIndex_0_1(1 downto 0) <= readQuadIndex_0(1 downto 0);
  writeQuadIndex_0_1(1 downto 0) <= writeQuadIndex_0(1 downto 0);
GPRQuad2_0: component design_1_GPRQuad2_0_0
     port map (
      addra_bram0(8 downto 0) => GPRQuad2_0_BRAM0W_ADDR(8 downto 0),
      addra_bram1(8 downto 0) => GPRQuad2_0_BRAM1W_ADDR(8 downto 0),
      addra_bram2(8 downto 0) => GPRQuad2_0_BRAM2W_ADDR(8 downto 0),
      addra_bram3(8 downto 0) => GPRQuad2_0_BRAM3W_ADDR(8 downto 0),
      addra_bram4(8 downto 0) => GPRQuad2_0_BRAM4W_ADDR(8 downto 0),
      addra_bram5(8 downto 0) => GPRQuad2_0_BRAM5W_ADDR(8 downto 0),
      addra_bram6(8 downto 0) => GPRQuad2_0_BRAM6W_ADDR(8 downto 0),
      addra_bram7(8 downto 0) => GPRQuad2_0_BRAM7W_ADDR(8 downto 0),
      addrb_bram0(8 downto 0) => GPRQuad2_0_BRAM0R_ADDR(8 downto 0),
      addrb_bram1(8 downto 0) => GPRQuad2_0_BRAM1R_ADDR(8 downto 0),
      addrb_bram2(8 downto 0) => GPRQuad2_0_BRAM2R_ADDR(8 downto 0),
      addrb_bram3(8 downto 0) => GPRQuad2_0_BRAM3R_ADDR(8 downto 0),
      addrb_bram4(8 downto 0) => GPRQuad2_0_BRAM4R_ADDR(8 downto 0),
      addrb_bram5(8 downto 0) => GPRQuad2_0_BRAM5R_ADDR(8 downto 0),
      addrb_bram6(8 downto 0) => GPRQuad2_0_BRAM6R_ADDR(8 downto 0),
      addrb_bram7(8 downto 0) => GPRQuad2_0_BRAM7R_ADDR(8 downto 0),
      clk => clk_0_1,
      clka_bram0 => GPRQuad2_0_BRAM0W_CLK,
      clka_bram1 => GPRQuad2_0_BRAM1W_CLK,
      clka_bram2 => GPRQuad2_0_BRAM2W_CLK,
      clka_bram3 => GPRQuad2_0_BRAM3W_CLK,
      clka_bram4 => GPRQuad2_0_BRAM4W_CLK,
      clka_bram5 => GPRQuad2_0_BRAM5W_CLK,
      clka_bram6 => GPRQuad2_0_BRAM6W_CLK,
      clka_bram7 => GPRQuad2_0_BRAM7W_CLK,
      clkb_bram0 => GPRQuad2_0_BRAM0R_CLK,
      clkb_bram1 => GPRQuad2_0_BRAM1R_CLK,
      clkb_bram2 => GPRQuad2_0_BRAM2R_CLK,
      clkb_bram3 => GPRQuad2_0_BRAM3R_CLK,
      clkb_bram4 => GPRQuad2_0_BRAM4R_CLK,
      clkb_bram5 => GPRQuad2_0_BRAM5R_CLK,
      clkb_bram6 => GPRQuad2_0_BRAM6R_CLK,
      clkb_bram7 => GPRQuad2_0_BRAM7R_CLK,
      dina_bram0(31 downto 0) => GPRQuad2_0_BRAM0W_DIN(31 downto 0),
      dina_bram1(31 downto 0) => GPRQuad2_0_BRAM1W_DIN(31 downto 0),
      dina_bram2(31 downto 0) => GPRQuad2_0_BRAM2W_DIN(31 downto 0),
      dina_bram3(31 downto 0) => GPRQuad2_0_BRAM3W_DIN(31 downto 0),
      dina_bram4(31 downto 0) => GPRQuad2_0_BRAM4W_DIN(31 downto 0),
      dina_bram5(31 downto 0) => GPRQuad2_0_BRAM5W_DIN(31 downto 0),
      dina_bram6(31 downto 0) => GPRQuad2_0_BRAM6W_DIN(31 downto 0),
      dina_bram7(31 downto 0) => GPRQuad2_0_BRAM7W_DIN(31 downto 0),
      doutb_bram0(31 downto 0) => GPRQuad2_0_BRAM0R_DOUT(31 downto 0),
      doutb_bram1(31 downto 0) => GPRQuad2_0_BRAM1R_DOUT(31 downto 0),
      doutb_bram2(31 downto 0) => GPRQuad2_0_BRAM2R_DOUT(31 downto 0),
      doutb_bram3(31 downto 0) => GPRQuad2_0_BRAM3R_DOUT(31 downto 0),
      doutb_bram4(31 downto 0) => GPRQuad2_0_BRAM4R_DOUT(31 downto 0),
      doutb_bram5(31 downto 0) => GPRQuad2_0_BRAM5R_DOUT(31 downto 0),
      doutb_bram6(31 downto 0) => GPRQuad2_0_BRAM6R_DOUT(31 downto 0),
      doutb_bram7(31 downto 0) => GPRQuad2_0_BRAM7R_DOUT(31 downto 0),
      ena_bram0 => GPRQuad2_0_BRAM0W_EN,
      ena_bram1 => GPRQuad2_0_BRAM1W_EN,
      ena_bram2 => GPRQuad2_0_BRAM2W_EN,
      ena_bram3 => GPRQuad2_0_BRAM3W_EN,
      ena_bram4 => GPRQuad2_0_BRAM4W_EN,
      ena_bram5 => GPRQuad2_0_BRAM5W_EN,
      ena_bram6 => GPRQuad2_0_BRAM6W_EN,
      ena_bram7 => GPRQuad2_0_BRAM7W_EN,
      enb_bram0 => GPRQuad2_0_BRAM0R_EN,
      enb_bram1 => GPRQuad2_0_BRAM1R_EN,
      enb_bram2 => GPRQuad2_0_BRAM2R_EN,
      enb_bram3 => GPRQuad2_0_BRAM3R_EN,
      enb_bram4 => GPRQuad2_0_BRAM4R_EN,
      enb_bram5 => GPRQuad2_0_BRAM5R_EN,
      enb_bram6 => GPRQuad2_0_BRAM6R_EN,
      enb_bram7 => GPRQuad2_0_BRAM7R_EN,
      portA_en => portA_en_0_1,
      portA_readOutData(127 downto 0) => GPRQuad2_0_portA_readOutData(127 downto 0),
      portA_regChan(1 downto 0) => portA_regChan_0_1(1 downto 0),
      portA_regIdx(2 downto 0) => portA_regIdx_0_1(2 downto 0),
      portA_regType(1 downto 0) => portA_regType_0_1(1 downto 0),
      portB_en => portB_en_0_1,
      portB_readOutData(127 downto 0) => GPRQuad2_0_portB_readOutData(127 downto 0),
      portB_regChan(1 downto 0) => portB_regChan_0_1(1 downto 0),
      portB_regIdx(2 downto 0) => portB_regIdx_0_1(2 downto 0),
      portB_regType(1 downto 0) => portB_regType_0_1(1 downto 0),
      portW_en => portW_en_0_1,
      portW_regChan(1 downto 0) => portW_regChan_0_1(1 downto 0),
      portW_regIdx(2 downto 0) => portW_regIdx_0_1(2 downto 0),
      portW_regType(1 downto 0) => portW_regType_0_1(1 downto 0),
      portW_writeInData(127 downto 0) => portW_writeInData_0_1(127 downto 0),
      readQuadIndex(1 downto 0) => readQuadIndex_0_1(1 downto 0),
      wea_bram0(0) => GPRQuad2_0_BRAM0W_WE(0),
      wea_bram1(0) => GPRQuad2_0_BRAM1W_WE(0),
      wea_bram2(0) => GPRQuad2_0_BRAM2W_WE(0),
      wea_bram3(0) => GPRQuad2_0_BRAM3W_WE(0),
      wea_bram4(0) => GPRQuad2_0_BRAM4W_WE(0),
      wea_bram5(0) => GPRQuad2_0_BRAM5W_WE(0),
      wea_bram6(0) => GPRQuad2_0_BRAM6W_WE(0),
      wea_bram7(0) => GPRQuad2_0_BRAM7W_WE(0),
      writeQuadIndex(1 downto 0) => writeQuadIndex_0_1(1 downto 0)
    );
blk_mem_gen_0: component design_1_blk_mem_gen_0_9
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM0W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM0R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM0W_CLK,
      clkb => GPRQuad2_0_BRAM0R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM0W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM0R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM0W_EN,
      enb => GPRQuad2_0_BRAM0R_EN,
      wea(0) => GPRQuad2_0_BRAM0W_WE(0)
    );
blk_mem_gen_1: component design_1_blk_mem_gen_0_10
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM1W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM1R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM1W_CLK,
      clkb => GPRQuad2_0_BRAM1R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM1W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM1R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM1W_EN,
      enb => GPRQuad2_0_BRAM1R_EN,
      wea(0) => GPRQuad2_0_BRAM1W_WE(0)
    );
blk_mem_gen_2: component design_1_blk_mem_gen_0_11
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM2W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM2R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM2W_CLK,
      clkb => GPRQuad2_0_BRAM2R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM2W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM2R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM2W_EN,
      enb => GPRQuad2_0_BRAM2R_EN,
      wea(0) => GPRQuad2_0_BRAM2W_WE(0)
    );
blk_mem_gen_3: component design_1_blk_mem_gen_1_1
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM3W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM3R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM3W_CLK,
      clkb => GPRQuad2_0_BRAM3R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM3W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM3R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM3W_EN,
      enb => GPRQuad2_0_BRAM3R_EN,
      wea(0) => GPRQuad2_0_BRAM3W_WE(0)
    );
blk_mem_gen_4: component design_1_blk_mem_gen_0_12
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM4W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM4R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM4W_CLK,
      clkb => GPRQuad2_0_BRAM4R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM4W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM4R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM4W_EN,
      enb => GPRQuad2_0_BRAM4R_EN,
      wea(0) => GPRQuad2_0_BRAM4W_WE(0)
    );
blk_mem_gen_5: component design_1_blk_mem_gen_1_2
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM5W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM5R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM5W_CLK,
      clkb => GPRQuad2_0_BRAM5R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM5W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM5R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM5W_EN,
      enb => GPRQuad2_0_BRAM5R_EN,
      wea(0) => GPRQuad2_0_BRAM5W_WE(0)
    );
blk_mem_gen_6: component design_1_blk_mem_gen_2_0
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM6W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM6R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM6W_CLK,
      clkb => GPRQuad2_0_BRAM6R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM6W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM6R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM6W_EN,
      enb => GPRQuad2_0_BRAM6R_EN,
      wea(0) => GPRQuad2_0_BRAM6W_WE(0)
    );
blk_mem_gen_7: component design_1_blk_mem_gen_3_0
     port map (
      addra(8 downto 0) => GPRQuad2_0_BRAM7W_ADDR(8 downto 0),
      addrb(8 downto 0) => GPRQuad2_0_BRAM7R_ADDR(8 downto 0),
      clka => GPRQuad2_0_BRAM7W_CLK,
      clkb => GPRQuad2_0_BRAM7R_CLK,
      dina(31 downto 0) => GPRQuad2_0_BRAM7W_DIN(31 downto 0),
      doutb(31 downto 0) => GPRQuad2_0_BRAM7R_DOUT(31 downto 0),
      ena => GPRQuad2_0_BRAM7W_EN,
      enb => GPRQuad2_0_BRAM7R_EN,
      wea(0) => GPRQuad2_0_BRAM7W_WE(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MemorySystem_imp_FPNZVK is
  port (
    CMD_MemoryControllerIsIdle : out STD_LOGIC;
    ClearBlockWriteRequestsFIFO_full : out STD_LOGIC;
    ClearBlockWriteRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ClearBlockWriteRequestsFIFO_wr_en : in STD_LOGIC;
    CommandProcReadRequestsFIFO_full : out STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CommandProcReadRequestsFIFO_wr_en : in STD_LOGIC;
    CommandProcReadResponsesFIFO_empty : out STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    CommandProcReadResponsesFIFO_rd_en : in STD_LOGIC;
    CommandProcWriteRequestsFIFO_full : out STD_LOGIC;
    CommandProcWriteRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    CommandProcWriteRequestsFIFO_wr_en : in STD_LOGIC;
    DBG_LastReadAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastReadMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastWriteAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastWriteData : out STD_LOGIC_VECTOR ( 255 downto 0 );
    DBG_LastWriteDataDWORDEnables : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_LastWriteMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ReadControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ReadRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_ReadResponsesFullBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_ScanoutReadRequests_Empty : out STD_LOGIC;
    DBG_ScanoutReadRequests_rd_en : out STD_LOGIC;
    DBG_ScanoutReadResponses_Full : out STD_LOGIC;
    DBG_WriteControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_WriteRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 5 downto 0 );
    IBCacheReadRequestsFIFO_full : out STD_LOGIC;
    IBCacheReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCacheReadRequestsFIFO_wr_en : in STD_LOGIC;
    IBCacheReadResponsesFIFO_empty : out STD_LOGIC;
    IBCacheReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCacheReadResponsesFIFO_rd_en : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    ROPReadRequestsFIFO_full : out STD_LOGIC;
    ROPReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ROPReadRequestsFIFO_wr_en : in STD_LOGIC;
    ROPReadResponsesFIFO_empty : out STD_LOGIC;
    ROPReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ROPReadResponsesFIFO_rd_en : in STD_LOGIC;
    ROPWriteRequestsFIFO_full : out STD_LOGIC;
    ROPWriteRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ROPWriteRequestsFIFO_wr_en : in STD_LOGIC;
    STAT_MemReadCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ScanoutReadRequestsFIFO_full : out STD_LOGIC;
    ScanoutReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ScanoutReadRequestsFIFO_wr_en : in STD_LOGIC;
    ScanoutReadResponsesFIFO_empty : out STD_LOGIC;
    ScanoutReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ScanoutReadResponsesFIFO_rd_en : in STD_LOGIC;
    StatsWriteRequestsFIFO_full : out STD_LOGIC;
    StatsWriteRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    StatsWriteRequestsFIFO_wr_en : in STD_LOGIC;
    TexFetchReadRequestsFIFO_full : out STD_LOGIC;
    TexFetchReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    TexFetchReadRequestsFIFO_wr_en : in STD_LOGIC;
    TexFetchReadResponsesFIFO_empty : out STD_LOGIC;
    TexFetchReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    TexFetchReadResponsesFIFO_rd_en : in STD_LOGIC;
    VBCacheReadRequestsFIFO_full : out STD_LOGIC;
    VBCacheReadRequestsFIFO_wr_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBCacheReadRequestsFIFO_wr_en : in STD_LOGIC;
    VBCacheReadResponsesFIFO_empty : out STD_LOGIC;
    VBCacheReadResponsesFIFO_rd_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    VBCacheReadResponsesFIFO_rd_en : in STD_LOGIC;
    addn_ui_clkout1 : out STD_LOGIC;
    c0_ddr4_ui_clk : out STD_LOGIC;
    ddr4_sdram_c1_act_n : out STD_LOGIC;
    ddr4_sdram_c1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_c1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_c1_bg : out STD_LOGIC;
    ddr4_sdram_c1_ck_c : out STD_LOGIC;
    ddr4_sdram_c1_ck_t : out STD_LOGIC;
    ddr4_sdram_c1_cke : out STD_LOGIC;
    ddr4_sdram_c1_cs_n : out STD_LOGIC;
    ddr4_sdram_c1_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_c1_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_odt : out STD_LOGIC;
    ddr4_sdram_c1_reset_n : out STD_LOGIC;
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
end MemorySystem_imp_FPNZVK;

architecture STRUCTURE of MemorySystem_imp_FPNZVK is
  component design_1_fifo_generator_3_0 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_3_0;
  component design_1_fifo_generator_0_3 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_3;
  component design_1_fifo_generator_4_0 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_4_0;
  component design_1_fifo_generator_0_9 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_9;
  component design_1_fifo_generator_0_6 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_6;
  component design_1_fifo_generator_0_5 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_5;
  component design_1_fifo_generator_0_11 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_11;
  component design_1_fifo_generator_0_2 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_2;
  component design_1_fifo_generator_0_4 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_4;
  component design_1_fifo_generator_0_8 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_8;
  component design_1_fifo_generator_0_10 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_10;
  component design_1_fifo_generator_2_0 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_2_0;
  component design_1_fifo_generator_5_0 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_5_0;
  component design_1_fifo_generator_0_7 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_7;
  component design_1_fifo_generator_1_0 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_1_0;
  component design_1_fifo_generator_1_1 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_1_1;
  component design_1_rst_ddr4_0_333M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_ddr4_0_333M_0;
  component design_1_fifo_generator_0_13 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_13;
  component design_1_fifo_generator_0_15 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_15;
  component design_1_fifo_generator_0_16 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_16;
  component design_1_fifo_generator_0_17 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 29 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 29 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_17;
  component design_1_fifo_generator_0_18 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_18;
  component design_1_ddr4_0_1 is
  port (
    c0_init_calib_complete : out STD_LOGIC;
    dbg_clk : out STD_LOGIC;
    c0_sys_clk_p : in STD_LOGIC;
    c0_sys_clk_n : in STD_LOGIC;
    dbg_bus : out STD_LOGIC_VECTOR ( 511 downto 0 );
    c0_ddr4_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    c0_ddr4_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_dm_dbi_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    c0_ddr4_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_bg : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_reset_n : out STD_LOGIC;
    c0_ddr4_act_n : out STD_LOGIC;
    c0_ddr4_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_ui_clk : out STD_LOGIC;
    c0_ddr4_ui_clk_sync_rst : out STD_LOGIC;
    c0_ddr4_aresetn : in STD_LOGIC;
    c0_ddr4_s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awaddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    c0_ddr4_s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_awvalid : in STD_LOGIC;
    c0_ddr4_s_axi_awready : out STD_LOGIC;
    c0_ddr4_s_axi_wdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    c0_ddr4_s_axi_wstrb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    c0_ddr4_s_axi_wlast : in STD_LOGIC;
    c0_ddr4_s_axi_wvalid : in STD_LOGIC;
    c0_ddr4_s_axi_wready : out STD_LOGIC;
    c0_ddr4_s_axi_bready : in STD_LOGIC;
    c0_ddr4_s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_bvalid : out STD_LOGIC;
    c0_ddr4_s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_araddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    c0_ddr4_s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c0_ddr4_s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    c0_ddr4_s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    c0_ddr4_s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_arvalid : in STD_LOGIC;
    c0_ddr4_s_axi_arready : out STD_LOGIC;
    c0_ddr4_s_axi_rready : in STD_LOGIC;
    c0_ddr4_s_axi_rlast : out STD_LOGIC;
    c0_ddr4_s_axi_rvalid : out STD_LOGIC;
    c0_ddr4_s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    c0_ddr4_s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    c0_ddr4_s_axi_rdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    addn_ui_clkout1 : out STD_LOGIC;
    sys_rst : in STD_LOGIC
  );
  end component design_1_ddr4_0_1;
  component design_1_MemoryController_0_0 is
  port (
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 29 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 255 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    M_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_ARLOCK : out STD_LOGIC;
    M_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_AWLOCK : out STD_LOGIC;
    M_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARID : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWID : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_RID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_RLAST : in STD_LOGIC;
    M_AXI_WLAST : out STD_LOGIC;
    c0_init_calib_complete : in STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ScanoutReadRequestsFIFO_empty : in STD_LOGIC;
    ScanoutReadRequestsFIFO_rd_en : out STD_LOGIC;
    ScanoutReadResponsesFIFO_full : in STD_LOGIC;
    ScanoutReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ScanoutReadResponsesFIFO_wr_en : out STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ZStencilReadRequestsFIFO_empty : in STD_LOGIC;
    ZStencilReadRequestsFIFO_rd_en : out STD_LOGIC;
    ZStencilReadResponsesFIFO_full : in STD_LOGIC;
    ZStencilReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ZStencilReadResponsesFIFO_wr_en : out STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ZStencilWriteRequestsFIFO_empty : in STD_LOGIC;
    ZStencilWriteRequestsFIFO_rd_en : out STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CommandProcReadRequestsFIFO_empty : in STD_LOGIC;
    CommandProcReadRequestsFIFO_rd_en : out STD_LOGIC;
    CommandProcReadResponsesFIFO_full : in STD_LOGIC;
    CommandProcReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    CommandProcReadResponsesFIFO_wr_en : out STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    CommandProcWriteRequestsFIFO_empty : in STD_LOGIC;
    CommandProcWriteRequestsFIFO_rd_en : out STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBCacheReadRequestsFIFO_empty : in STD_LOGIC;
    VBCacheReadRequestsFIFO_rd_en : out STD_LOGIC;
    VBCacheReadResponsesFIFO_full : in STD_LOGIC;
    VBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    VBCacheReadResponsesFIFO_wr_en : out STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCacheReadRequestsFIFO_empty : in STD_LOGIC;
    IBCacheReadRequestsFIFO_rd_en : out STD_LOGIC;
    IBCacheReadResponsesFIFO_full : in STD_LOGIC;
    IBCacheReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCacheReadResponsesFIFO_wr_en : out STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    PacketDMAReadRequestsFIFO_empty : in STD_LOGIC;
    PacketDMAReadRequestsFIFO_rd_en : out STD_LOGIC;
    PacketDMAReadResponsesFIFO_full : in STD_LOGIC;
    PacketDMAReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    PacketDMAReadResponsesFIFO_wr_en : out STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    PacketDMAWriteRequestsFIFO_empty : in STD_LOGIC;
    PacketDMAWriteRequestsFIFO_rd_en : out STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    TexFetchReadRequestsFIFO_empty : in STD_LOGIC;
    TexFetchReadRequestsFIFO_rd_en : out STD_LOGIC;
    TexFetchReadResponsesFIFO_full : in STD_LOGIC;
    TexFetchReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    TexFetchReadResponsesFIFO_wr_en : out STD_LOGIC;
    ROPReadRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 29 downto 0 );
    ROPReadRequestsFIFO_empty : in STD_LOGIC;
    ROPReadRequestsFIFO_rd_en : out STD_LOGIC;
    ROPReadResponsesFIFO_full : in STD_LOGIC;
    ROPReadResponsesFIFO_wr_data : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ROPReadResponsesFIFO_wr_en : out STD_LOGIC;
    ROPWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ROPWriteRequestsFIFO_empty : in STD_LOGIC;
    ROPWriteRequestsFIFO_rd_en : out STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    ClearBlockWriteRequestsFIFO_empty : in STD_LOGIC;
    ClearBlockWriteRequestsFIFO_rd_en : out STD_LOGIC;
    StatsWriteRequestsFIFO_rd_data : in STD_LOGIC_VECTOR ( 293 downto 0 );
    StatsWriteRequestsFIFO_empty : in STD_LOGIC;
    StatsWriteRequestsFIFO_rd_en : out STD_LOGIC;
    CMD_MemoryControllerIsIdle : out STD_LOGIC;
    STAT_MemReadCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemReadCountNonScanoutTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountBytesTransferred : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_MemWriteCountTransactions : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ReadControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_WriteControlState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ScanoutReadRequests_Empty : out STD_LOGIC;
    DBG_ScanoutReadResponses_Full : out STD_LOGIC;
    DBG_ScanoutReadRequests_rd_en : out STD_LOGIC;
    DBG_LastWriteAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastWriteData : out STD_LOGIC_VECTOR ( 255 downto 0 );
    DBG_LastWriteDataDWORDEnables : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_LastWriteMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastReadAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_LastReadMemoryClientIndex : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ReadRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_WriteRequestsEmptyBitmask : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_ReadResponsesFullBitmask : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_MemoryController_0_0;
  component design_1_fifo_generator_0_22 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 293 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 293 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_22;
  signal Conn10_FULL : STD_LOGIC;
  signal Conn10_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal Conn10_WR_EN : STD_LOGIC;
  signal Conn11_FULL : STD_LOGIC;
  signal Conn11_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn11_WR_EN : STD_LOGIC;
  signal Conn12_EMPTY : STD_LOGIC;
  signal Conn12_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn12_RD_EN : STD_LOGIC;
  signal Conn13_FULL : STD_LOGIC;
  signal Conn13_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal Conn13_WR_EN : STD_LOGIC;
  signal Conn14_FULL : STD_LOGIC;
  signal Conn14_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal Conn14_WR_EN : STD_LOGIC;
  signal Conn15_FULL : STD_LOGIC;
  signal Conn15_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn15_WR_EN : STD_LOGIC;
  signal Conn16_EMPTY : STD_LOGIC;
  signal Conn16_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn16_RD_EN : STD_LOGIC;
  signal Conn1_FULL : STD_LOGIC;
  signal Conn1_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn1_WR_EN : STD_LOGIC;
  signal Conn2_EMPTY : STD_LOGIC;
  signal Conn2_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn2_RD_EN : STD_LOGIC;
  signal Conn3_FULL : STD_LOGIC;
  signal Conn3_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal Conn3_WR_EN : STD_LOGIC;
  signal Conn4_FULL : STD_LOGIC;
  signal Conn4_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn4_WR_EN : STD_LOGIC;
  signal Conn5_EMPTY : STD_LOGIC;
  signal Conn5_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn5_RD_EN : STD_LOGIC;
  signal Conn6_FULL : STD_LOGIC;
  signal Conn6_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn6_WR_EN : STD_LOGIC;
  signal Conn7_EMPTY : STD_LOGIC;
  signal Conn7_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn7_RD_EN : STD_LOGIC;
  signal Conn8_FULL : STD_LOGIC;
  signal Conn8_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn8_WR_EN : STD_LOGIC;
  signal Conn9_EMPTY : STD_LOGIC;
  signal Conn9_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn9_RD_EN : STD_LOGIC;
  signal MemoryController_0_CMD_MemoryControllerIsIdle : STD_LOGIC;
  signal MemoryController_0_ClearBlockWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ClearBlockWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_ClearBlockWriteRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_CommandProcReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_CommandProcReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_CommandProcReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_CommandProcReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_CommandProcReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_CommandProcReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_CommandProcWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_CommandProcWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_CommandProcWriteRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_DBG_LastReadAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_DBG_LastReadMemoryClientIndex : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_DBG_LastWriteAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_DBG_LastWriteData : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_DBG_LastWriteDataDWORDEnables : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemoryController_0_DBG_LastWriteMemoryClientIndex : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_DBG_ReadControlState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_DBG_ReadRequestsEmptyBitmask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemoryController_0_DBG_ReadResponsesFullBitmask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemoryController_0_DBG_ScanoutReadRequests_Empty : STD_LOGIC;
  signal MemoryController_0_DBG_ScanoutReadRequests_rd_en : STD_LOGIC;
  signal MemoryController_0_DBG_ScanoutReadResponses_Full : STD_LOGIC;
  signal MemoryController_0_DBG_WriteControlState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_DBG_WriteRequestsEmptyBitmask : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal MemoryController_0_IBCacheReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_IBCacheReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_IBCacheReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_IBCacheReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_IBCacheReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_IBCacheReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MemoryController_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_M_AXI_ARID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemoryController_0_M_AXI_ARLOCK : STD_LOGIC;
  signal MemoryController_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal MemoryController_0_M_AXI_ARREADY : STD_LOGIC;
  signal MemoryController_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal MemoryController_0_M_AXI_ARVALID : STD_LOGIC;
  signal MemoryController_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MemoryController_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_M_AXI_AWID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemoryController_0_M_AXI_AWLOCK : STD_LOGIC;
  signal MemoryController_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal MemoryController_0_M_AXI_AWREADY : STD_LOGIC;
  signal MemoryController_0_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal MemoryController_0_M_AXI_AWVALID : STD_LOGIC;
  signal MemoryController_0_M_AXI_BREADY : STD_LOGIC;
  signal MemoryController_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MemoryController_0_M_AXI_BVALID : STD_LOGIC;
  signal MemoryController_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_M_AXI_RID : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemoryController_0_M_AXI_RLAST : STD_LOGIC;
  signal MemoryController_0_M_AXI_RREADY : STD_LOGIC;
  signal MemoryController_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MemoryController_0_M_AXI_RVALID : STD_LOGIC;
  signal MemoryController_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_M_AXI_WLAST : STD_LOGIC;
  signal MemoryController_0_M_AXI_WREADY : STD_LOGIC;
  signal MemoryController_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_M_AXI_WVALID : STD_LOGIC;
  signal MemoryController_0_PacketDMAReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_PacketDMAReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_PacketDMAReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_PacketDMAReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_PacketDMAReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_PacketDMAReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_PacketDMAWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_PacketDMAWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_PacketDMAWriteRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_ROPReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ROPReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_ROPReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_ROPReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_ROPReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_ROPReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_ROPWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ROPWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_ROPWriteRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_STAT_MemReadCountBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemReadCountNonScanoutBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemReadCountNonScanoutTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemReadCountTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemReadCyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemReadCyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemWriteCountBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemWriteCountTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemWriteCyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_STAT_MemWriteCyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemoryController_0_ScanoutReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ScanoutReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_ScanoutReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_ScanoutReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_ScanoutReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_ScanoutReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_StatsWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_StatsWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_StatsWriteRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_TexFetchReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_TexFetchReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_TexFetchReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_TexFetchReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_TexFetchReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_TexFetchReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_VBCacheReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_VBCacheReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_VBCacheReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_VBCacheReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_VBCacheReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_VBCacheReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_ZStencilReadRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ZStencilReadRequests_RD_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemoryController_0_ZStencilReadRequests_RD_EN : STD_LOGIC;
  signal MemoryController_0_ZStencilReadResponses_FULL : STD_LOGIC;
  signal MemoryController_0_ZStencilReadResponses_WR_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemoryController_0_ZStencilReadResponses_WR_EN : STD_LOGIC;
  signal MemoryController_0_ZStencilWriteRequests_EMPTY : STD_LOGIC;
  signal MemoryController_0_ZStencilWriteRequests_RD_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal MemoryController_0_ZStencilWriteRequests_RD_EN : STD_LOGIC;
  signal ResetN_UntilClockLoc_0_resetn : STD_LOGIC;
  signal ddr4_0_C0_DDR4_ACT_N : STD_LOGIC;
  signal ddr4_0_C0_DDR4_ADR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ddr4_0_C0_DDR4_BA : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_0_C0_DDR4_BG : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_CKE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_CK_C : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_CK_T : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_CS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_DM_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ddr4_0_C0_DDR4_DQS_C : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_DQS_T : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_ODT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ddr4_0_C0_DDR4_RESET_N : STD_LOGIC;
  signal ddr4_0_addn_ui_clkout1 : STD_LOGIC;
  signal ddr4_0_c0_ddr4_ui_clk : STD_LOGIC;
  signal ddr4_0_c0_ddr4_ui_clk_sync_rst : STD_LOGIC;
  signal ddr4_0_c0_init_calib_complete : STD_LOGIC;
  signal default_sysclk1_300_1_CLK_N : STD_LOGIC;
  signal default_sysclk1_300_1_CLK_P : STD_LOGIC;
  signal rd_clk_1 : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal rst_ddr4_0_333M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ClearBlockWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ClearBlockWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_CommandProcWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_IBCacheReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_IBCacheReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_IBCacheReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_IBCacheReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadRequestsFIFO_full_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadResponsesFIFO_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAReadResponsesFIFO_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal NLW_PacketDMAWriteRequestsFIFO_full_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_PacketDMAWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ROPWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ScanoutReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ScanoutReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ScanoutReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ScanoutReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_StatsWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_StatsWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_TexFetchReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_TexFetchReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_TexFetchReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_TexFetchReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBCacheReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBCacheReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBCacheReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBCacheReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadRequestsFIFO_full_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadResponsesFIFO_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadResponsesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadResponsesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilReadResponsesFIFO_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal NLW_ZStencilWriteRequestsFIFO_full_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilWriteRequestsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ZStencilWriteRequestsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_0_dbg_clk_UNCONNECTED : STD_LOGIC;
  signal NLW_ddr4_0_c0_ddr4_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ddr4_0_dbg_bus_UNCONNECTED : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal NLW_rst_ddr4_0_333M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ddr4_0_333M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ddr4_0_333M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ddr4_0_333M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  CMD_MemoryControllerIsIdle <= MemoryController_0_CMD_MemoryControllerIsIdle;
  ClearBlockWriteRequestsFIFO_full <= Conn13_FULL;
  CommandProcReadRequestsFIFO_full <= Conn1_FULL;
  CommandProcReadResponsesFIFO_empty <= Conn2_EMPTY;
  CommandProcReadResponsesFIFO_rd_data(255 downto 0) <= Conn2_RD_DATA(255 downto 0);
  CommandProcWriteRequestsFIFO_full <= Conn3_FULL;
  Conn10_WR_DATA(293 downto 0) <= ROPWriteRequestsFIFO_wr_data(293 downto 0);
  Conn10_WR_EN <= ROPWriteRequestsFIFO_wr_en;
  Conn11_WR_DATA(29 downto 0) <= ScanoutReadRequestsFIFO_wr_data(29 downto 0);
  Conn11_WR_EN <= ScanoutReadRequestsFIFO_wr_en;
  Conn12_RD_EN <= ScanoutReadResponsesFIFO_rd_en;
  Conn13_WR_DATA(293 downto 0) <= ClearBlockWriteRequestsFIFO_wr_data(293 downto 0);
  Conn13_WR_EN <= ClearBlockWriteRequestsFIFO_wr_en;
  Conn14_WR_DATA(293 downto 0) <= StatsWriteRequestsFIFO_wr_data(293 downto 0);
  Conn14_WR_EN <= StatsWriteRequestsFIFO_wr_en;
  Conn15_WR_DATA(29 downto 0) <= IBCacheReadRequestsFIFO_wr_data(29 downto 0);
  Conn15_WR_EN <= IBCacheReadRequestsFIFO_wr_en;
  Conn16_RD_EN <= IBCacheReadResponsesFIFO_rd_en;
  Conn1_WR_DATA(29 downto 0) <= CommandProcReadRequestsFIFO_wr_data(29 downto 0);
  Conn1_WR_EN <= CommandProcReadRequestsFIFO_wr_en;
  Conn2_RD_EN <= CommandProcReadResponsesFIFO_rd_en;
  Conn3_WR_DATA(293 downto 0) <= CommandProcWriteRequestsFIFO_wr_data(293 downto 0);
  Conn3_WR_EN <= CommandProcWriteRequestsFIFO_wr_en;
  Conn4_WR_DATA(29 downto 0) <= VBCacheReadRequestsFIFO_wr_data(29 downto 0);
  Conn4_WR_EN <= VBCacheReadRequestsFIFO_wr_en;
  Conn5_RD_EN <= VBCacheReadResponsesFIFO_rd_en;
  Conn6_WR_DATA(29 downto 0) <= TexFetchReadRequestsFIFO_wr_data(29 downto 0);
  Conn6_WR_EN <= TexFetchReadRequestsFIFO_wr_en;
  Conn7_RD_EN <= TexFetchReadResponsesFIFO_rd_en;
  Conn8_WR_DATA(29 downto 0) <= ROPReadRequestsFIFO_wr_data(29 downto 0);
  Conn8_WR_EN <= ROPReadRequestsFIFO_wr_en;
  Conn9_RD_EN <= ROPReadResponsesFIFO_rd_en;
  DBG_LastReadAddress(29 downto 0) <= MemoryController_0_DBG_LastReadAddress(29 downto 0);
  DBG_LastReadMemoryClientIndex(3 downto 0) <= MemoryController_0_DBG_LastReadMemoryClientIndex(3 downto 0);
  DBG_LastWriteAddress(29 downto 0) <= MemoryController_0_DBG_LastWriteAddress(29 downto 0);
  DBG_LastWriteData(255 downto 0) <= MemoryController_0_DBG_LastWriteData(255 downto 0);
  DBG_LastWriteDataDWORDEnables(7 downto 0) <= MemoryController_0_DBG_LastWriteDataDWORDEnables(7 downto 0);
  DBG_LastWriteMemoryClientIndex(3 downto 0) <= MemoryController_0_DBG_LastWriteMemoryClientIndex(3 downto 0);
  DBG_ReadControlState(3 downto 0) <= MemoryController_0_DBG_ReadControlState(3 downto 0);
  DBG_ReadRequestsEmptyBitmask(7 downto 0) <= MemoryController_0_DBG_ReadRequestsEmptyBitmask(7 downto 0);
  DBG_ReadResponsesFullBitmask(7 downto 0) <= MemoryController_0_DBG_ReadResponsesFullBitmask(7 downto 0);
  DBG_ScanoutReadRequests_Empty <= MemoryController_0_DBG_ScanoutReadRequests_Empty;
  DBG_ScanoutReadRequests_rd_en <= MemoryController_0_DBG_ScanoutReadRequests_rd_en;
  DBG_ScanoutReadResponses_Full <= MemoryController_0_DBG_ScanoutReadResponses_Full;
  DBG_WriteControlState(3 downto 0) <= MemoryController_0_DBG_WriteControlState(3 downto 0);
  DBG_WriteRequestsEmptyBitmask(5 downto 0) <= MemoryController_0_DBG_WriteRequestsEmptyBitmask(5 downto 0);
  IBCacheReadRequestsFIFO_full <= Conn15_FULL;
  IBCacheReadResponsesFIFO_empty <= Conn16_EMPTY;
  IBCacheReadResponsesFIFO_rd_data(255 downto 0) <= Conn16_RD_DATA(255 downto 0);
  ROPReadRequestsFIFO_full <= Conn8_FULL;
  ROPReadResponsesFIFO_empty <= Conn9_EMPTY;
  ROPReadResponsesFIFO_rd_data(255 downto 0) <= Conn9_RD_DATA(255 downto 0);
  ROPWriteRequestsFIFO_full <= Conn10_FULL;
  ResetN_UntilClockLoc_0_resetn <= M_AXI_ARESETN;
  STAT_MemReadCountBytesTransferred(31 downto 0) <= MemoryController_0_STAT_MemReadCountBytesTransferred(31 downto 0);
  STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0) <= MemoryController_0_STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0);
  STAT_MemReadCountNonScanoutTransactions(31 downto 0) <= MemoryController_0_STAT_MemReadCountNonScanoutTransactions(31 downto 0);
  STAT_MemReadCountTransactions(31 downto 0) <= MemoryController_0_STAT_MemReadCountTransactions(31 downto 0);
  STAT_MemReadCyclesIdle(31 downto 0) <= MemoryController_0_STAT_MemReadCyclesIdle(31 downto 0);
  STAT_MemReadCyclesSpentWorking(31 downto 0) <= MemoryController_0_STAT_MemReadCyclesSpentWorking(31 downto 0);
  STAT_MemWriteCountBytesTransferred(31 downto 0) <= MemoryController_0_STAT_MemWriteCountBytesTransferred(31 downto 0);
  STAT_MemWriteCountTransactions(31 downto 0) <= MemoryController_0_STAT_MemWriteCountTransactions(31 downto 0);
  STAT_MemWriteCyclesIdle(31 downto 0) <= MemoryController_0_STAT_MemWriteCyclesIdle(31 downto 0);
  STAT_MemWriteCyclesSpentWorking(31 downto 0) <= MemoryController_0_STAT_MemWriteCyclesSpentWorking(31 downto 0);
  ScanoutReadRequestsFIFO_full <= Conn11_FULL;
  ScanoutReadResponsesFIFO_empty <= Conn12_EMPTY;
  ScanoutReadResponsesFIFO_rd_data(255 downto 0) <= Conn12_RD_DATA(255 downto 0);
  StatsWriteRequestsFIFO_full <= Conn14_FULL;
  TexFetchReadRequestsFIFO_full <= Conn6_FULL;
  TexFetchReadResponsesFIFO_empty <= Conn7_EMPTY;
  TexFetchReadResponsesFIFO_rd_data(255 downto 0) <= Conn7_RD_DATA(255 downto 0);
  VBCacheReadRequestsFIFO_full <= Conn4_FULL;
  VBCacheReadResponsesFIFO_empty <= Conn5_EMPTY;
  VBCacheReadResponsesFIFO_rd_data(255 downto 0) <= Conn5_RD_DATA(255 downto 0);
  addn_ui_clkout1 <= ddr4_0_addn_ui_clkout1;
  c0_ddr4_ui_clk <= ddr4_0_c0_ddr4_ui_clk;
  ddr4_sdram_c1_act_n <= ddr4_0_C0_DDR4_ACT_N;
  ddr4_sdram_c1_adr(16 downto 0) <= ddr4_0_C0_DDR4_ADR(16 downto 0);
  ddr4_sdram_c1_ba(1 downto 0) <= ddr4_0_C0_DDR4_BA(1 downto 0);
  ddr4_sdram_c1_bg <= ddr4_0_C0_DDR4_BG(0);
  ddr4_sdram_c1_ck_c <= ddr4_0_C0_DDR4_CK_C(0);
  ddr4_sdram_c1_ck_t <= ddr4_0_C0_DDR4_CK_T(0);
  ddr4_sdram_c1_cke <= ddr4_0_C0_DDR4_CKE(0);
  ddr4_sdram_c1_cs_n <= ddr4_0_C0_DDR4_CS_N(0);
  ddr4_sdram_c1_odt <= ddr4_0_C0_DDR4_ODT(0);
  ddr4_sdram_c1_reset_n <= ddr4_0_C0_DDR4_RESET_N;
  default_sysclk1_300_1_CLK_N <= default_sysclk1_300_clk_n;
  default_sysclk1_300_1_CLK_P <= default_sysclk1_300_clk_p;
  rd_clk_1 <= rd_clk;
  reset_1 <= reset;
ClearBlockWriteRequestsFIFO: component design_1_fifo_generator_5_0
     port map (
      din(293 downto 0) => Conn13_WR_DATA(293 downto 0),
      dout(293 downto 0) => MemoryController_0_ClearBlockWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_ClearBlockWriteRequests_EMPTY,
      full => Conn13_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ClearBlockWriteRequests_RD_EN,
      rd_rst_busy => NLW_ClearBlockWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn13_WR_EN,
      wr_rst_busy => NLW_ClearBlockWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
CommandProcReadRequestsFIFO: component design_1_fifo_generator_0_6
     port map (
      din(29 downto 0) => Conn1_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_CommandProcReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_CommandProcReadRequests_EMPTY,
      full => Conn1_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_CommandProcReadRequests_RD_EN,
      rd_rst_busy => NLW_CommandProcReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn1_WR_EN,
      wr_rst_busy => NLW_CommandProcReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
CommandProcReadResponsesFIFO: component design_1_fifo_generator_0_7
     port map (
      din(255 downto 0) => MemoryController_0_CommandProcReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn2_RD_DATA(255 downto 0),
      empty => Conn2_EMPTY,
      full => MemoryController_0_CommandProcReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => Conn2_RD_EN,
      rd_rst_busy => NLW_CommandProcReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_CommandProcReadResponses_WR_EN,
      wr_rst_busy => NLW_CommandProcReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
CommandProcWriteRequestsFIFO: component design_1_fifo_generator_0_8
     port map (
      din(293 downto 0) => Conn3_WR_DATA(293 downto 0),
      dout(293 downto 0) => MemoryController_0_CommandProcWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_CommandProcWriteRequests_EMPTY,
      full => Conn3_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_CommandProcWriteRequests_RD_EN,
      rd_rst_busy => NLW_CommandProcWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn3_WR_EN,
      wr_rst_busy => NLW_CommandProcWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
IBCacheReadRequestsFIFO: component design_1_fifo_generator_0_15
     port map (
      din(29 downto 0) => Conn15_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_IBCacheReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_IBCacheReadRequests_EMPTY,
      full => Conn15_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_IBCacheReadRequests_RD_EN,
      rd_rst_busy => NLW_IBCacheReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn15_WR_EN,
      wr_rst_busy => NLW_IBCacheReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
IBCacheReadResponsesFIFO: component design_1_fifo_generator_0_16
     port map (
      din(255 downto 0) => MemoryController_0_IBCacheReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn16_RD_DATA(255 downto 0),
      empty => Conn16_EMPTY,
      full => MemoryController_0_IBCacheReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => Conn16_RD_EN,
      rd_rst_busy => NLW_IBCacheReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_IBCacheReadResponses_WR_EN,
      wr_rst_busy => NLW_IBCacheReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
MemoryController_0: component design_1_MemoryController_0_0
     port map (
      CMD_MemoryControllerIsIdle => MemoryController_0_CMD_MemoryControllerIsIdle,
      ClearBlockWriteRequestsFIFO_empty => MemoryController_0_ClearBlockWriteRequests_EMPTY,
      ClearBlockWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_ClearBlockWriteRequests_RD_DATA(293 downto 0),
      ClearBlockWriteRequestsFIFO_rd_en => MemoryController_0_ClearBlockWriteRequests_RD_EN,
      CommandProcReadRequestsFIFO_empty => MemoryController_0_CommandProcReadRequests_EMPTY,
      CommandProcReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_CommandProcReadRequests_RD_DATA(29 downto 0),
      CommandProcReadRequestsFIFO_rd_en => MemoryController_0_CommandProcReadRequests_RD_EN,
      CommandProcReadResponsesFIFO_full => MemoryController_0_CommandProcReadResponses_FULL,
      CommandProcReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_CommandProcReadResponses_WR_DATA(255 downto 0),
      CommandProcReadResponsesFIFO_wr_en => MemoryController_0_CommandProcReadResponses_WR_EN,
      CommandProcWriteRequestsFIFO_empty => MemoryController_0_CommandProcWriteRequests_EMPTY,
      CommandProcWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_CommandProcWriteRequests_RD_DATA(293 downto 0),
      CommandProcWriteRequestsFIFO_rd_en => MemoryController_0_CommandProcWriteRequests_RD_EN,
      DBG_LastReadAddress(29 downto 0) => MemoryController_0_DBG_LastReadAddress(29 downto 0),
      DBG_LastReadMemoryClientIndex(3 downto 0) => MemoryController_0_DBG_LastReadMemoryClientIndex(3 downto 0),
      DBG_LastWriteAddress(29 downto 0) => MemoryController_0_DBG_LastWriteAddress(29 downto 0),
      DBG_LastWriteData(255 downto 0) => MemoryController_0_DBG_LastWriteData(255 downto 0),
      DBG_LastWriteDataDWORDEnables(7 downto 0) => MemoryController_0_DBG_LastWriteDataDWORDEnables(7 downto 0),
      DBG_LastWriteMemoryClientIndex(3 downto 0) => MemoryController_0_DBG_LastWriteMemoryClientIndex(3 downto 0),
      DBG_ReadControlState(3 downto 0) => MemoryController_0_DBG_ReadControlState(3 downto 0),
      DBG_ReadRequestsEmptyBitmask(7 downto 0) => MemoryController_0_DBG_ReadRequestsEmptyBitmask(7 downto 0),
      DBG_ReadResponsesFullBitmask(7 downto 0) => MemoryController_0_DBG_ReadResponsesFullBitmask(7 downto 0),
      DBG_ScanoutReadRequests_Empty => MemoryController_0_DBG_ScanoutReadRequests_Empty,
      DBG_ScanoutReadRequests_rd_en => MemoryController_0_DBG_ScanoutReadRequests_rd_en,
      DBG_ScanoutReadResponses_Full => MemoryController_0_DBG_ScanoutReadResponses_Full,
      DBG_WriteControlState(3 downto 0) => MemoryController_0_DBG_WriteControlState(3 downto 0),
      DBG_WriteRequestsEmptyBitmask(5 downto 0) => MemoryController_0_DBG_WriteRequestsEmptyBitmask(5 downto 0),
      IBCacheReadRequestsFIFO_empty => MemoryController_0_IBCacheReadRequests_EMPTY,
      IBCacheReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_IBCacheReadRequests_RD_DATA(29 downto 0),
      IBCacheReadRequestsFIFO_rd_en => MemoryController_0_IBCacheReadRequests_RD_EN,
      IBCacheReadResponsesFIFO_full => MemoryController_0_IBCacheReadResponses_FULL,
      IBCacheReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_IBCacheReadResponses_WR_DATA(255 downto 0),
      IBCacheReadResponsesFIFO_wr_en => MemoryController_0_IBCacheReadResponses_WR_EN,
      M_AXI_ACLK => ddr4_0_c0_ddr4_ui_clk,
      M_AXI_ARADDR(29 downto 0) => MemoryController_0_M_AXI_ARADDR(29 downto 0),
      M_AXI_ARBURST(1 downto 0) => MemoryController_0_M_AXI_ARBURST(1 downto 0),
      M_AXI_ARCACHE(3 downto 0) => MemoryController_0_M_AXI_ARCACHE(3 downto 0),
      M_AXI_ARESETN => ResetN_UntilClockLoc_0_resetn,
      M_AXI_ARID(3 downto 0) => MemoryController_0_M_AXI_ARID(3 downto 0),
      M_AXI_ARLEN(7 downto 0) => MemoryController_0_M_AXI_ARLEN(7 downto 0),
      M_AXI_ARLOCK => MemoryController_0_M_AXI_ARLOCK,
      M_AXI_ARPROT(2 downto 0) => MemoryController_0_M_AXI_ARPROT(2 downto 0),
      M_AXI_ARREADY => MemoryController_0_M_AXI_ARREADY,
      M_AXI_ARSIZE(2 downto 0) => MemoryController_0_M_AXI_ARSIZE(2 downto 0),
      M_AXI_ARVALID => MemoryController_0_M_AXI_ARVALID,
      M_AXI_AWADDR(29 downto 0) => MemoryController_0_M_AXI_AWADDR(29 downto 0),
      M_AXI_AWBURST(1 downto 0) => MemoryController_0_M_AXI_AWBURST(1 downto 0),
      M_AXI_AWCACHE(3 downto 0) => MemoryController_0_M_AXI_AWCACHE(3 downto 0),
      M_AXI_AWID(3 downto 0) => MemoryController_0_M_AXI_AWID(3 downto 0),
      M_AXI_AWLEN(7 downto 0) => MemoryController_0_M_AXI_AWLEN(7 downto 0),
      M_AXI_AWLOCK => MemoryController_0_M_AXI_AWLOCK,
      M_AXI_AWPROT(2 downto 0) => MemoryController_0_M_AXI_AWPROT(2 downto 0),
      M_AXI_AWREADY => MemoryController_0_M_AXI_AWREADY,
      M_AXI_AWSIZE(2 downto 0) => MemoryController_0_M_AXI_AWSIZE(2 downto 0),
      M_AXI_AWVALID => MemoryController_0_M_AXI_AWVALID,
      M_AXI_BREADY => MemoryController_0_M_AXI_BREADY,
      M_AXI_BRESP(1 downto 0) => MemoryController_0_M_AXI_BRESP(1 downto 0),
      M_AXI_BVALID => MemoryController_0_M_AXI_BVALID,
      M_AXI_RDATA(255 downto 0) => MemoryController_0_M_AXI_RDATA(255 downto 0),
      M_AXI_RID(3 downto 0) => MemoryController_0_M_AXI_RID(3 downto 0),
      M_AXI_RLAST => MemoryController_0_M_AXI_RLAST,
      M_AXI_RREADY => MemoryController_0_M_AXI_RREADY,
      M_AXI_RRESP(1 downto 0) => MemoryController_0_M_AXI_RRESP(1 downto 0),
      M_AXI_RVALID => MemoryController_0_M_AXI_RVALID,
      M_AXI_WDATA(255 downto 0) => MemoryController_0_M_AXI_WDATA(255 downto 0),
      M_AXI_WLAST => MemoryController_0_M_AXI_WLAST,
      M_AXI_WREADY => MemoryController_0_M_AXI_WREADY,
      M_AXI_WSTRB(31 downto 0) => MemoryController_0_M_AXI_WSTRB(31 downto 0),
      M_AXI_WVALID => MemoryController_0_M_AXI_WVALID,
      PacketDMAReadRequestsFIFO_empty => MemoryController_0_PacketDMAReadRequests_EMPTY,
      PacketDMAReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_PacketDMAReadRequests_RD_DATA(29 downto 0),
      PacketDMAReadRequestsFIFO_rd_en => MemoryController_0_PacketDMAReadRequests_RD_EN,
      PacketDMAReadResponsesFIFO_full => MemoryController_0_PacketDMAReadResponses_FULL,
      PacketDMAReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_PacketDMAReadResponses_WR_DATA(255 downto 0),
      PacketDMAReadResponsesFIFO_wr_en => MemoryController_0_PacketDMAReadResponses_WR_EN,
      PacketDMAWriteRequestsFIFO_empty => MemoryController_0_PacketDMAWriteRequests_EMPTY,
      PacketDMAWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_PacketDMAWriteRequests_RD_DATA(293 downto 0),
      PacketDMAWriteRequestsFIFO_rd_en => MemoryController_0_PacketDMAWriteRequests_RD_EN,
      ROPReadRequestsFIFO_empty => MemoryController_0_ROPReadRequests_EMPTY,
      ROPReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_ROPReadRequests_RD_DATA(29 downto 0),
      ROPReadRequestsFIFO_rd_en => MemoryController_0_ROPReadRequests_RD_EN,
      ROPReadResponsesFIFO_full => MemoryController_0_ROPReadResponses_FULL,
      ROPReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_ROPReadResponses_WR_DATA(255 downto 0),
      ROPReadResponsesFIFO_wr_en => MemoryController_0_ROPReadResponses_WR_EN,
      ROPWriteRequestsFIFO_empty => MemoryController_0_ROPWriteRequests_EMPTY,
      ROPWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_ROPWriteRequests_RD_DATA(293 downto 0),
      ROPWriteRequestsFIFO_rd_en => MemoryController_0_ROPWriteRequests_RD_EN,
      STAT_MemReadCountBytesTransferred(31 downto 0) => MemoryController_0_STAT_MemReadCountBytesTransferred(31 downto 0),
      STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0) => MemoryController_0_STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0),
      STAT_MemReadCountNonScanoutTransactions(31 downto 0) => MemoryController_0_STAT_MemReadCountNonScanoutTransactions(31 downto 0),
      STAT_MemReadCountTransactions(31 downto 0) => MemoryController_0_STAT_MemReadCountTransactions(31 downto 0),
      STAT_MemReadCyclesIdle(31 downto 0) => MemoryController_0_STAT_MemReadCyclesIdle(31 downto 0),
      STAT_MemReadCyclesSpentWorking(31 downto 0) => MemoryController_0_STAT_MemReadCyclesSpentWorking(31 downto 0),
      STAT_MemWriteCountBytesTransferred(31 downto 0) => MemoryController_0_STAT_MemWriteCountBytesTransferred(31 downto 0),
      STAT_MemWriteCountTransactions(31 downto 0) => MemoryController_0_STAT_MemWriteCountTransactions(31 downto 0),
      STAT_MemWriteCyclesIdle(31 downto 0) => MemoryController_0_STAT_MemWriteCyclesIdle(31 downto 0),
      STAT_MemWriteCyclesSpentWorking(31 downto 0) => MemoryController_0_STAT_MemWriteCyclesSpentWorking(31 downto 0),
      ScanoutReadRequestsFIFO_empty => MemoryController_0_ScanoutReadRequests_EMPTY,
      ScanoutReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_ScanoutReadRequests_RD_DATA(29 downto 0),
      ScanoutReadRequestsFIFO_rd_en => MemoryController_0_ScanoutReadRequests_RD_EN,
      ScanoutReadResponsesFIFO_full => MemoryController_0_ScanoutReadResponses_FULL,
      ScanoutReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_ScanoutReadResponses_WR_DATA(255 downto 0),
      ScanoutReadResponsesFIFO_wr_en => MemoryController_0_ScanoutReadResponses_WR_EN,
      StatsWriteRequestsFIFO_empty => MemoryController_0_StatsWriteRequests_EMPTY,
      StatsWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_StatsWriteRequests_RD_DATA(293 downto 0),
      StatsWriteRequestsFIFO_rd_en => MemoryController_0_StatsWriteRequests_RD_EN,
      TexFetchReadRequestsFIFO_empty => MemoryController_0_TexFetchReadRequests_EMPTY,
      TexFetchReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_TexFetchReadRequests_RD_DATA(29 downto 0),
      TexFetchReadRequestsFIFO_rd_en => MemoryController_0_TexFetchReadRequests_RD_EN,
      TexFetchReadResponsesFIFO_full => MemoryController_0_TexFetchReadResponses_FULL,
      TexFetchReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_TexFetchReadResponses_WR_DATA(255 downto 0),
      TexFetchReadResponsesFIFO_wr_en => MemoryController_0_TexFetchReadResponses_WR_EN,
      VBCacheReadRequestsFIFO_empty => MemoryController_0_VBCacheReadRequests_EMPTY,
      VBCacheReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_VBCacheReadRequests_RD_DATA(29 downto 0),
      VBCacheReadRequestsFIFO_rd_en => MemoryController_0_VBCacheReadRequests_RD_EN,
      VBCacheReadResponsesFIFO_full => MemoryController_0_VBCacheReadResponses_FULL,
      VBCacheReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_VBCacheReadResponses_WR_DATA(255 downto 0),
      VBCacheReadResponsesFIFO_wr_en => MemoryController_0_VBCacheReadResponses_WR_EN,
      ZStencilReadRequestsFIFO_empty => MemoryController_0_ZStencilReadRequests_EMPTY,
      ZStencilReadRequestsFIFO_rd_data(29 downto 0) => MemoryController_0_ZStencilReadRequests_RD_DATA(29 downto 0),
      ZStencilReadRequestsFIFO_rd_en => MemoryController_0_ZStencilReadRequests_RD_EN,
      ZStencilReadResponsesFIFO_full => MemoryController_0_ZStencilReadResponses_FULL,
      ZStencilReadResponsesFIFO_wr_data(255 downto 0) => MemoryController_0_ZStencilReadResponses_WR_DATA(255 downto 0),
      ZStencilReadResponsesFIFO_wr_en => MemoryController_0_ZStencilReadResponses_WR_EN,
      ZStencilWriteRequestsFIFO_empty => MemoryController_0_ZStencilWriteRequests_EMPTY,
      ZStencilWriteRequestsFIFO_rd_data(293 downto 0) => MemoryController_0_ZStencilWriteRequests_RD_DATA(293 downto 0),
      ZStencilWriteRequestsFIFO_rd_en => MemoryController_0_ZStencilWriteRequests_RD_EN,
      c0_init_calib_complete => ddr4_0_c0_init_calib_complete
    );
PacketDMAReadRequestsFIFO: component design_1_fifo_generator_0_17
     port map (
      din(29 downto 0) => B"000000000000000000000000000000",
      dout(29 downto 0) => MemoryController_0_PacketDMAReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_PacketDMAReadRequests_EMPTY,
      full => NLW_PacketDMAReadRequestsFIFO_full_UNCONNECTED,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_PacketDMAReadRequests_RD_EN,
      rd_rst_busy => NLW_PacketDMAReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => '0',
      wr_rst_busy => NLW_PacketDMAReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
PacketDMAReadResponsesFIFO: component design_1_fifo_generator_0_18
     port map (
      din(255 downto 0) => MemoryController_0_PacketDMAReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => NLW_PacketDMAReadResponsesFIFO_dout_UNCONNECTED(255 downto 0),
      empty => NLW_PacketDMAReadResponsesFIFO_empty_UNCONNECTED,
      full => MemoryController_0_PacketDMAReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => '0',
      rd_rst_busy => NLW_PacketDMAReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_PacketDMAReadResponses_WR_EN,
      wr_rst_busy => NLW_PacketDMAReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
PacketDMAWriteRequestsFIFO: component design_1_fifo_generator_0_22
     port map (
      din(293 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      dout(293 downto 0) => MemoryController_0_PacketDMAWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_PacketDMAWriteRequests_EMPTY,
      full => NLW_PacketDMAWriteRequestsFIFO_full_UNCONNECTED,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_PacketDMAWriteRequests_RD_EN,
      rd_rst_busy => NLW_PacketDMAWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => '0',
      wr_rst_busy => NLW_PacketDMAWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ROPReadRequestsFIFO: component design_1_fifo_generator_2_0
     port map (
      din(29 downto 0) => Conn8_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_ROPReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_ROPReadRequests_EMPTY,
      full => Conn8_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ROPReadRequests_RD_EN,
      rd_rst_busy => NLW_ROPReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn8_WR_EN,
      wr_rst_busy => NLW_ROPReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ROPReadResponsesFIFO: component design_1_fifo_generator_3_0
     port map (
      din(255 downto 0) => MemoryController_0_ROPReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn9_RD_DATA(255 downto 0),
      empty => Conn9_EMPTY,
      full => MemoryController_0_ROPReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => Conn9_RD_EN,
      rd_rst_busy => NLW_ROPReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_ROPReadResponses_WR_EN,
      wr_rst_busy => NLW_ROPReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
ROPWriteRequestsFIFO: component design_1_fifo_generator_4_0
     port map (
      din(293 downto 0) => Conn10_WR_DATA(293 downto 0),
      dout(293 downto 0) => MemoryController_0_ROPWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_ROPWriteRequests_EMPTY,
      full => Conn10_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ROPWriteRequests_RD_EN,
      rd_rst_busy => NLW_ROPWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn10_WR_EN,
      wr_rst_busy => NLW_ROPWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ScanoutReadRequestsFIFO: component design_1_fifo_generator_0_2
     port map (
      din(29 downto 0) => Conn11_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_ScanoutReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_ScanoutReadRequests_EMPTY,
      full => Conn11_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ScanoutReadRequests_RD_EN,
      rd_rst_busy => NLW_ScanoutReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => rd_clk_1,
      wr_en => Conn11_WR_EN,
      wr_rst_busy => NLW_ScanoutReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ScanoutReadResponsesFIFO: component design_1_fifo_generator_1_0
     port map (
      din(255 downto 0) => MemoryController_0_ScanoutReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn12_RD_DATA(255 downto 0),
      empty => Conn12_EMPTY,
      full => MemoryController_0_ScanoutReadResponses_FULL,
      rd_clk => rd_clk_1,
      rd_en => Conn12_RD_EN,
      rd_rst_busy => NLW_ScanoutReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_ScanoutReadResponses_WR_EN,
      wr_rst_busy => NLW_ScanoutReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
StatsWriteRequestsFIFO: component design_1_fifo_generator_0_13
     port map (
      din(293 downto 0) => Conn14_WR_DATA(293 downto 0),
      dout(293 downto 0) => MemoryController_0_StatsWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_StatsWriteRequests_EMPTY,
      full => Conn14_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_StatsWriteRequests_RD_EN,
      rd_rst_busy => NLW_StatsWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn14_WR_EN,
      wr_rst_busy => NLW_StatsWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
TexFetchReadRequestsFIFO: component design_1_fifo_generator_0_11
     port map (
      din(29 downto 0) => Conn6_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_TexFetchReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_TexFetchReadRequests_EMPTY,
      full => Conn6_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_TexFetchReadRequests_RD_EN,
      rd_rst_busy => NLW_TexFetchReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn6_WR_EN,
      wr_rst_busy => NLW_TexFetchReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
TexFetchReadResponsesFIFO: component design_1_fifo_generator_1_1
     port map (
      din(255 downto 0) => MemoryController_0_TexFetchReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn7_RD_DATA(255 downto 0),
      empty => Conn7_EMPTY,
      full => MemoryController_0_TexFetchReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => Conn7_RD_EN,
      rd_rst_busy => NLW_TexFetchReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_TexFetchReadResponses_WR_EN,
      wr_rst_busy => NLW_TexFetchReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
VBCacheReadRequestsFIFO: component design_1_fifo_generator_0_9
     port map (
      din(29 downto 0) => Conn4_WR_DATA(29 downto 0),
      dout(29 downto 0) => MemoryController_0_VBCacheReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_VBCacheReadRequests_EMPTY,
      full => Conn4_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_VBCacheReadRequests_RD_EN,
      rd_rst_busy => NLW_VBCacheReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => Conn4_WR_EN,
      wr_rst_busy => NLW_VBCacheReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
VBCacheReadResponsesFIFO: component design_1_fifo_generator_0_10
     port map (
      din(255 downto 0) => MemoryController_0_VBCacheReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => Conn5_RD_DATA(255 downto 0),
      empty => Conn5_EMPTY,
      full => MemoryController_0_VBCacheReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => Conn5_RD_EN,
      rd_rst_busy => NLW_VBCacheReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_VBCacheReadResponses_WR_EN,
      wr_rst_busy => NLW_VBCacheReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
ZStencilReadRequestsFIFO: component design_1_fifo_generator_0_3
     port map (
      din(29 downto 0) => B"000000000000000000000000000000",
      dout(29 downto 0) => MemoryController_0_ZStencilReadRequests_RD_DATA(29 downto 0),
      empty => MemoryController_0_ZStencilReadRequests_EMPTY,
      full => NLW_ZStencilReadRequestsFIFO_full_UNCONNECTED,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ZStencilReadRequests_RD_EN,
      rd_rst_busy => NLW_ZStencilReadRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => '0',
      wr_rst_busy => NLW_ZStencilReadRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ZStencilReadResponsesFIFO: component design_1_fifo_generator_0_4
     port map (
      din(255 downto 0) => MemoryController_0_ZStencilReadResponses_WR_DATA(255 downto 0),
      dout(255 downto 0) => NLW_ZStencilReadResponsesFIFO_dout_UNCONNECTED(255 downto 0),
      empty => NLW_ZStencilReadResponsesFIFO_empty_UNCONNECTED,
      full => MemoryController_0_ZStencilReadResponses_FULL,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => '0',
      rd_rst_busy => NLW_ZStencilReadResponsesFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => MemoryController_0_ZStencilReadResponses_WR_EN,
      wr_rst_busy => NLW_ZStencilReadResponsesFIFO_wr_rst_busy_UNCONNECTED
    );
ZStencilWriteRequestsFIFO: component design_1_fifo_generator_0_5
     port map (
      din(293 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      dout(293 downto 0) => MemoryController_0_ZStencilWriteRequests_RD_DATA(293 downto 0),
      empty => MemoryController_0_ZStencilWriteRequests_EMPTY,
      full => NLW_ZStencilWriteRequestsFIFO_full_UNCONNECTED,
      rd_clk => ddr4_0_c0_ddr4_ui_clk,
      rd_en => MemoryController_0_ZStencilWriteRequests_RD_EN,
      rd_rst_busy => NLW_ZStencilWriteRequestsFIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_clk => ddr4_0_c0_ddr4_ui_clk,
      wr_en => '0',
      wr_rst_busy => NLW_ZStencilWriteRequestsFIFO_wr_rst_busy_UNCONNECTED
    );
ddr4_0: component design_1_ddr4_0_1
     port map (
      addn_ui_clkout1 => ddr4_0_addn_ui_clkout1,
      c0_ddr4_act_n => ddr4_0_C0_DDR4_ACT_N,
      c0_ddr4_adr(16 downto 0) => ddr4_0_C0_DDR4_ADR(16 downto 0),
      c0_ddr4_aresetn => rst_ddr4_0_333M_peripheral_aresetn(0),
      c0_ddr4_ba(1 downto 0) => ddr4_0_C0_DDR4_BA(1 downto 0),
      c0_ddr4_bg(0) => ddr4_0_C0_DDR4_BG(0),
      c0_ddr4_ck_c(0) => ddr4_0_C0_DDR4_CK_C(0),
      c0_ddr4_ck_t(0) => ddr4_0_C0_DDR4_CK_T(0),
      c0_ddr4_cke(0) => ddr4_0_C0_DDR4_CKE(0),
      c0_ddr4_cs_n(0) => ddr4_0_C0_DDR4_CS_N(0),
      c0_ddr4_dm_dbi_n(3 downto 0) => ddr4_sdram_c1_dm_n(3 downto 0),
      c0_ddr4_dq(31 downto 0) => ddr4_sdram_c1_dq(31 downto 0),
      c0_ddr4_dqs_c(3 downto 0) => ddr4_sdram_c1_dqs_c(3 downto 0),
      c0_ddr4_dqs_t(3 downto 0) => ddr4_sdram_c1_dqs_t(3 downto 0),
      c0_ddr4_odt(0) => ddr4_0_C0_DDR4_ODT(0),
      c0_ddr4_reset_n => ddr4_0_C0_DDR4_RESET_N,
      c0_ddr4_s_axi_araddr(29 downto 0) => MemoryController_0_M_AXI_ARADDR(29 downto 0),
      c0_ddr4_s_axi_arburst(1 downto 0) => MemoryController_0_M_AXI_ARBURST(1 downto 0),
      c0_ddr4_s_axi_arcache(3 downto 0) => MemoryController_0_M_AXI_ARCACHE(3 downto 0),
      c0_ddr4_s_axi_arid(3 downto 0) => MemoryController_0_M_AXI_ARID(3 downto 0),
      c0_ddr4_s_axi_arlen(7 downto 0) => MemoryController_0_M_AXI_ARLEN(7 downto 0),
      c0_ddr4_s_axi_arlock(0) => MemoryController_0_M_AXI_ARLOCK,
      c0_ddr4_s_axi_arprot(2 downto 0) => MemoryController_0_M_AXI_ARPROT(2 downto 0),
      c0_ddr4_s_axi_arqos(3 downto 0) => B"0000",
      c0_ddr4_s_axi_arready => MemoryController_0_M_AXI_ARREADY,
      c0_ddr4_s_axi_arsize(2 downto 0) => MemoryController_0_M_AXI_ARSIZE(2 downto 0),
      c0_ddr4_s_axi_arvalid => MemoryController_0_M_AXI_ARVALID,
      c0_ddr4_s_axi_awaddr(29 downto 0) => MemoryController_0_M_AXI_AWADDR(29 downto 0),
      c0_ddr4_s_axi_awburst(1 downto 0) => MemoryController_0_M_AXI_AWBURST(1 downto 0),
      c0_ddr4_s_axi_awcache(3 downto 0) => MemoryController_0_M_AXI_AWCACHE(3 downto 0),
      c0_ddr4_s_axi_awid(3 downto 0) => MemoryController_0_M_AXI_AWID(3 downto 0),
      c0_ddr4_s_axi_awlen(7 downto 0) => MemoryController_0_M_AXI_AWLEN(7 downto 0),
      c0_ddr4_s_axi_awlock(0) => MemoryController_0_M_AXI_AWLOCK,
      c0_ddr4_s_axi_awprot(2 downto 0) => MemoryController_0_M_AXI_AWPROT(2 downto 0),
      c0_ddr4_s_axi_awqos(3 downto 0) => B"0000",
      c0_ddr4_s_axi_awready => MemoryController_0_M_AXI_AWREADY,
      c0_ddr4_s_axi_awsize(2 downto 0) => MemoryController_0_M_AXI_AWSIZE(2 downto 0),
      c0_ddr4_s_axi_awvalid => MemoryController_0_M_AXI_AWVALID,
      c0_ddr4_s_axi_bid(3 downto 0) => NLW_ddr4_0_c0_ddr4_s_axi_bid_UNCONNECTED(3 downto 0),
      c0_ddr4_s_axi_bready => MemoryController_0_M_AXI_BREADY,
      c0_ddr4_s_axi_bresp(1 downto 0) => MemoryController_0_M_AXI_BRESP(1 downto 0),
      c0_ddr4_s_axi_bvalid => MemoryController_0_M_AXI_BVALID,
      c0_ddr4_s_axi_rdata(255 downto 0) => MemoryController_0_M_AXI_RDATA(255 downto 0),
      c0_ddr4_s_axi_rid(3 downto 0) => MemoryController_0_M_AXI_RID(3 downto 0),
      c0_ddr4_s_axi_rlast => MemoryController_0_M_AXI_RLAST,
      c0_ddr4_s_axi_rready => MemoryController_0_M_AXI_RREADY,
      c0_ddr4_s_axi_rresp(1 downto 0) => MemoryController_0_M_AXI_RRESP(1 downto 0),
      c0_ddr4_s_axi_rvalid => MemoryController_0_M_AXI_RVALID,
      c0_ddr4_s_axi_wdata(255 downto 0) => MemoryController_0_M_AXI_WDATA(255 downto 0),
      c0_ddr4_s_axi_wlast => MemoryController_0_M_AXI_WLAST,
      c0_ddr4_s_axi_wready => MemoryController_0_M_AXI_WREADY,
      c0_ddr4_s_axi_wstrb(31 downto 0) => MemoryController_0_M_AXI_WSTRB(31 downto 0),
      c0_ddr4_s_axi_wvalid => MemoryController_0_M_AXI_WVALID,
      c0_ddr4_ui_clk => ddr4_0_c0_ddr4_ui_clk,
      c0_ddr4_ui_clk_sync_rst => ddr4_0_c0_ddr4_ui_clk_sync_rst,
      c0_init_calib_complete => ddr4_0_c0_init_calib_complete,
      c0_sys_clk_n => default_sysclk1_300_1_CLK_N,
      c0_sys_clk_p => default_sysclk1_300_1_CLK_P,
      dbg_bus(511 downto 0) => NLW_ddr4_0_dbg_bus_UNCONNECTED(511 downto 0),
      dbg_clk => NLW_ddr4_0_dbg_clk_UNCONNECTED,
      sys_rst => reset_1
    );
rst_ddr4_0_333M: component design_1_rst_ddr4_0_333M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ddr4_0_333M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => ddr4_0_c0_ddr4_ui_clk_sync_rst,
      interconnect_aresetn(0) => NLW_rst_ddr4_0_333M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ddr4_0_333M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_ddr4_0_333M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_ddr4_0_333M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => ddr4_0_c0_ddr4_ui_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity NetworkPacketSystem_imp_1I0FPOR is
  port (
    FIFO_READ_empty : out STD_LOGIC;
    FIFO_READ_rd_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    FIFO_READ_rd_en : in STD_LOGIC;
    FIFO_WRITE_full : out STD_LOGIC;
    FIFO_WRITE_wr_data : in STD_LOGIC_VECTOR ( 87 downto 0 );
    FIFO_WRITE_wr_en : in STD_LOGIC;
    clk333_250 : in STD_LOGIC;
    mdio_mdc_mdc : out STD_LOGIC;
    mdio_mdc_mdio_i : in STD_LOGIC;
    mdio_mdc_mdio_o : out STD_LOGIC;
    mdio_mdc_mdio_t : out STD_LOGIC;
    refclk625_in_0_clk_n : in STD_LOGIC;
    refclk625_in_0_clk_p : in STD_LOGIC;
    sgmii_lvds_rxn : in STD_LOGIC;
    sgmii_lvds_rxp : in STD_LOGIC;
    sgmii_lvds_txn : out STD_LOGIC;
    sgmii_lvds_txp : out STD_LOGIC
  );
end NetworkPacketSystem_imp_1I0FPOR;

architecture STRUCTURE of NetworkPacketSystem_imp_1I0FPOR is
  component design_1_blk_mem_gen_0_3 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_3;
  component design_1_gig_ethernet_pcs_pma_0_0 is
  port (
    sgmii_clk_r_0 : out STD_LOGIC;
    sgmii_clk_f_0 : out STD_LOGIC;
    sgmii_clk_en_0 : out STD_LOGIC;
    clk125_out : out STD_LOGIC;
    clk312_out : out STD_LOGIC;
    rst_125_out : out STD_LOGIC;
    refclk625_n : in STD_LOGIC;
    refclk625_p : in STD_LOGIC;
    speed_is_10_100_0 : in STD_LOGIC;
    speed_is_100_0 : in STD_LOGIC;
    reset : in STD_LOGIC;
    txn_0 : out STD_LOGIC;
    rxn_0 : in STD_LOGIC;
    gmii_txd_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rxd_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txp_0 : out STD_LOGIC;
    gmii_rx_dv_0 : out STD_LOGIC;
    gmii_rx_er_0 : out STD_LOGIC;
    gmii_isolate_0 : out STD_LOGIC;
    rxp_0 : in STD_LOGIC;
    signal_detect_0 : in STD_LOGIC;
    gmii_tx_en_0 : in STD_LOGIC;
    gmii_tx_er_0 : in STD_LOGIC;
    configuration_vector_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    status_vector_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    mdio_i_0 : in STD_LOGIC;
    mdio_o_0 : out STD_LOGIC;
    mdc_0 : in STD_LOGIC;
    configuration_valid_0 : in STD_LOGIC;
    mdio_t_0 : out STD_LOGIC;
    phyaddr_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ext_mdc_0 : out STD_LOGIC;
    ext_mdio_i_0 : in STD_LOGIC;
    ext_mdio_o_0 : out STD_LOGIC;
    ext_mdio_t_0 : out STD_LOGIC;
    mdio_t_in_0 : in STD_LOGIC;
    an_adv_config_val_0 : in STD_LOGIC;
    an_adv_config_vector_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_restart_config_0 : in STD_LOGIC;
    an_interrupt_0 : out STD_LOGIC;
    tx_dly_rdy_1 : in STD_LOGIC;
    rx_dly_rdy_1 : in STD_LOGIC;
    tx_vtc_rdy_1 : in STD_LOGIC;
    rx_vtc_rdy_1 : in STD_LOGIC;
    tx_dly_rdy_2 : in STD_LOGIC;
    rx_dly_rdy_2 : in STD_LOGIC;
    tx_vtc_rdy_2 : in STD_LOGIC;
    rx_vtc_rdy_2 : in STD_LOGIC;
    tx_dly_rdy_3 : in STD_LOGIC;
    rx_dly_rdy_3 : in STD_LOGIC;
    tx_vtc_rdy_3 : in STD_LOGIC;
    rx_vtc_rdy_3 : in STD_LOGIC;
    tx_logic_reset : out STD_LOGIC;
    rx_logic_reset : out STD_LOGIC;
    rx_locked : out STD_LOGIC;
    tx_locked : out STD_LOGIC;
    tx_bsc_rst_out : out STD_LOGIC;
    rx_bsc_rst_out : out STD_LOGIC;
    tx_bs_rst_out : out STD_LOGIC;
    rx_bs_rst_out : out STD_LOGIC;
    tx_rst_dly_out : out STD_LOGIC;
    rx_rst_dly_out : out STD_LOGIC;
    tx_bsc_en_vtc_out : out STD_LOGIC;
    rx_bsc_en_vtc_out : out STD_LOGIC;
    tx_bs_en_vtc_out : out STD_LOGIC;
    rx_bs_en_vtc_out : out STD_LOGIC;
    riu_clk_out : out STD_LOGIC;
    riu_wr_en_out : out STD_LOGIC;
    tx_pll_clk_out : out STD_LOGIC;
    rx_pll_clk_out : out STD_LOGIC;
    tx_rdclk_out : out STD_LOGIC;
    riu_addr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    riu_wr_data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_nibble_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rx_btval_1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_2 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rx_btval_3 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    riu_valid_3 : in STD_LOGIC;
    riu_valid_2 : in STD_LOGIC;
    riu_valid_1 : in STD_LOGIC;
    riu_prsnt_1 : in STD_LOGIC;
    riu_prsnt_2 : in STD_LOGIC;
    riu_prsnt_3 : in STD_LOGIC;
    riu_rddata_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_rddata_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_rddata_2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_gig_ethernet_pcs_pma_0_0;
  component design_1_EthernetMDIOControll_0_0 is
  port (
    clkin25 : in STD_LOGIC;
    mdio_clk : out STD_LOGIC;
    mdio_i : out STD_LOGIC;
    mdio_o : in STD_LOGIC;
    mdio_t : in STD_LOGIC;
    mdio_t_ctrl : out STD_LOGIC;
    registerReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : out STD_LOGIC;
    registerWriteComplete : out STD_LOGIC;
    newRequestPHYAddress : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : in STD_LOGIC;
    newRequestStart : in STD_LOGIC;
    DBG_BitsRemaining : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_InProgressRead : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_EthMDIO_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component design_1_EthernetMDIOControll_0_0;
  component design_1_SGMII_PHY_Bringup_MD_0_0 is
  port (
    clkin25 : in STD_LOGIC;
    dbgRst : in STD_LOGIC;
    registerReadData : in STD_LOGIC_VECTOR ( 15 downto 0 );
    registerReadReady : in STD_LOGIC;
    registerWriteComplete : in STD_LOGIC;
    newRequestPHYAddress : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestDevTypeRegister : out STD_LOGIC_VECTOR ( 4 downto 0 );
    newRequestRegister : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    newRequestIsWrite : out STD_LOGIC;
    newRequestStart : out STD_LOGIC;
    phyBringupComplete : out STD_LOGIC;
    DBG_RegReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_RegPCSPMAReadIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RegPCSPMAReadData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Bringup_State : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component design_1_SGMII_PHY_Bringup_MD_0_0;
  component design_1_xlconstant_0_5 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_0_5;
  component design_1_fifo_generator_0_27 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_27;
  component design_1_fifo_generator_0_28 is
  port (
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component design_1_fifo_generator_0_28;
  component design_1_fifo_generator_0_29 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_29;
  component design_1_fifo_generator_0_30 is
  port (
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component design_1_fifo_generator_0_30;
  component design_1_blk_mem_gen_0_4 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 8 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_4;
  component design_1_fifo_generator_0_31 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 87 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 87 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_31;
  component design_1_fifo_generator_1_3 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 87 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 87 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_1_3;
  component design_1_CDC_EthernetControll_0_0 is
  port (
    Out_clk333 : in STD_LOGIC;
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC
  );
  end component design_1_CDC_EthernetControll_0_0;
  component design_1_CDC_EthernetControll_1_0 is
  port (
    Out_clk333 : in STD_LOGIC;
    Out_Signal : out STD_LOGIC;
    In_clk125 : in STD_LOGIC;
    In_Signal : in STD_LOGIC
  );
  end component design_1_CDC_EthernetControll_1_0;
  component design_1_clk_wiz_0_1 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_1;
  component design_1_ClockDivider4_1_0_0 is
  port (
    clkin100 : in STD_LOGIC;
    clkout25 : out STD_LOGIC
  );
  end component design_1_ClockDivider4_1_0_0;
  component design_1_ila_0_5 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_ila_0_5;
  component design_1_EthernetController3_0_0 is
  port (
    clk125 : in STD_LOGIC;
    tx_en : out STD_LOGIC;
    tx_er : out STD_LOGIC;
    tx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_dv : in STD_LOGIC;
    rx_er : in STD_LOGIC;
    rx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mac_address : out STD_LOGIC_VECTOR ( 47 downto 0 );
    speed_override : out STD_LOGIC_VECTOR ( 1 downto 0 );
    recv_pkt_header_prog_full : in STD_LOGIC;
    recv_pkt_header_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_header_wr_en : out STD_LOGIC;
    recv_pkt_data_count : in STD_LOGIC_VECTOR ( 10 downto 0 );
    recv_pkt_data_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_data_wr_en : out STD_LOGIC;
    send_pkt_header_empty : in STD_LOGIC;
    send_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_header_rd_en : out STD_LOGIC;
    send_pkt_data_empty : in STD_LOGIC;
    send_pkt_data_rd_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    send_pkt_data_rd_en : out STD_LOGIC;
    recv_scratch_addra : out STD_LOGIC_VECTOR ( 10 downto 0 );
    recv_scratch_clka125 : out STD_LOGIC;
    recv_scratch_dina : out STD_LOGIC_VECTOR ( 7 downto 0 );
    recv_scratch_ena : out STD_LOGIC;
    recv_scratch_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    recv_scratch_addrb : out STD_LOGIC_VECTOR ( 8 downto 0 );
    recv_scratch_clkb125 : out STD_LOGIC;
    recv_scratch_doutb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_scratch_enb : out STD_LOGIC;
    signal_detect : out STD_LOGIC;
    gmii_isolate : in STD_LOGIC;
    speed_is_10_100 : out STD_LOGIC;
    speed_is_100 : out STD_LOGIC;
    pcs_rst_out : out STD_LOGIC;
    phyaddr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_vector : out STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : out STD_LOGIC;
    an_adv_config_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : out STD_LOGIC;
    an_restart_config : out STD_LOGIC;
    phyBringupComplete : in STD_LOGIC;
    status_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rx_locked : in STD_LOGIC;
    tx_locked : in STD_LOGIC;
    riu_valid_1 : out STD_LOGIC;
    riu_prsnt_1 : out STD_LOGIC;
    riu_rddata_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_2 : out STD_LOGIC;
    riu_prsnt_2 : out STD_LOGIC;
    riu_rddata_2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_3 : out STD_LOGIC;
    riu_prsnt_3 : out STD_LOGIC;
    riu_rddata_3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tx_dly_rdy_1 : out STD_LOGIC;
    rx_dly_rdy_1 : out STD_LOGIC;
    tx_vtc_rdy_1 : out STD_LOGIC;
    rx_vtc_rdy_1 : out STD_LOGIC;
    tx_dly_rdy_2 : out STD_LOGIC;
    rx_dly_rdy_2 : out STD_LOGIC;
    tx_vtc_rdy_2 : out STD_LOGIC;
    rx_vtc_rdy_2 : out STD_LOGIC;
    tx_dly_rdy_3 : out STD_LOGIC;
    rx_dly_rdy_3 : out STD_LOGIC;
    tx_vtc_rdy_3 : out STD_LOGIC;
    rx_vtc_rdy_3 : out STD_LOGIC;
    NETPKT_SendReady : out STD_LOGIC;
    NETPKT_RecvReady : out STD_LOGIC;
    STAT_CountSendUdpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountValidRecvUdpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountValidRecvArpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountInvalidRecvPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountDroppedRecvPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_EthConfig_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EthSend_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EthRecv_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvFifoPush_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvValid_MAC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_RecvValid_IPv4 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_RecvValid_UDP : out STD_LOGIC_VECTOR ( 0 to 0 );
    DBG_RecvValid_Payload : out STD_LOGIC_VECTOR ( 0 to 0 );
    DBG_RecvValid_ARP : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_ARPPacketTPA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_DeviceTPA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_SendType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_RecvPacketFCS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RecvComputedCRC32 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_Recv_pkt_header_prog_full : out STD_LOGIC;
    DBG_RecvPacketSizeDWORDs : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_RecvFIFOAvailableBytes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_RecvFIFOCount : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_RecvFIFOCurrentPushDWORD : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DBG_RecvFIFOPktLengthDWORDs : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_SendPacketRemainingFIFOPumpBytes : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_PacketSendPtr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_send_pkt_data_rd_en : out STD_LOGIC;
    DBG_SendPacketHeaderData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_SendPacketBodyData : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_SendUDPPacketCount : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_EthernetController3_0_0;
  component design_1_NetProtoPacketProces_0_0 is
  port (
    clk333_250 : in STD_LOGIC;
    recv_pkt_header_empty : in STD_LOGIC;
    recv_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_header_rd_en : out STD_LOGIC;
    recv_pkt_data_empty : in STD_LOGIC;
    recv_pkt_data_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_data_rd_en : out STD_LOGIC;
    send_pkt_header_prog_full : in STD_LOGIC;
    send_pkt_header_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_header_wr_en : out STD_LOGIC;
    send_pkt_data_count : in STD_LOGIC_VECTOR ( 10 downto 0 );
    send_pkt_data_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_data_wr_en : out STD_LOGIC;
    ETHCTRL_SendReady : in STD_LOGIC;
    ETHCTRL_RecvReady : in STD_LOGIC;
    validPacketsFIFO_wr_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    validPacketsFIFO_full : in STD_LOGIC;
    validPacketsFIFO_prog_full : in STD_LOGIC;
    validPacketsFIFO_wr_en : out STD_LOGIC;
    returnPacketsFIFO_empty : in STD_LOGIC;
    returnPacketsFIFO_rd_data : in STD_LOGIC_VECTOR ( 87 downto 0 );
    returnPacketsFIFO_rd_en : out STD_LOGIC;
    sendBRAM_addra : out STD_LOGIC_VECTOR ( 8 downto 0 );
    sendBRAM_clka : out STD_LOGIC;
    sendBRAM_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sendBRAM_ena : out STD_LOGIC;
    sendBRAM_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    sendBRAM_addrb : out STD_LOGIC_VECTOR ( 8 downto 0 );
    sendBRAM_clkb : out STD_LOGIC;
    sendBRAM_doutb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sendBRAM_enb : out STD_LOGIC;
    STAT_SendSessionPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsValid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsInvalid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsDropped : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_NetPkt_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_SendFIFOState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvFIFOState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvSessionParseState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_SendPacketState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_recvSendReplyPacket : out STD_LOGIC;
    DBG_sendReplyAck : out STD_LOGIC;
    DBG_sendHandlingReply : out STD_LOGIC;
    DBG_recvPacketData : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DBG_recvCurrentSubpacketOffset : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_recvCurrentSubpacket : out STD_LOGIC_VECTOR ( 71 downto 0 );
    DBG_recvValid_Session : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_recvHeaderChecksum : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_discardPacketReason : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_sendLastAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_recvLastSendAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_recvLastAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_sendCyclesBetweenAutoResends : out STD_LOGIC_VECTOR ( 27 downto 0 );
    DBG_recvCurrentSubpacketIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_recvCurrentPacketLength : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_returnPacketsFIFO_empty : out STD_LOGIC;
    DBG_returnPacketsFIFO_rd_en : out STD_LOGIC;
    DBG_returnPacketsFIFO_rd_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_sendHasUnackedSentPacket : out STD_LOGIC;
    DBG_send_pkt_header_prog_full : out STD_LOGIC
  );
  end component design_1_NetProtoPacketProces_0_0;
  signal CDC_EthernetControll_0_Out_Signal : STD_LOGIC;
  signal CDC_EthernetControll_1_Out_Signal : STD_LOGIC;
  signal ClockDivider4_1_0_clkout25 : STD_LOGIC;
  signal Conn1_MDC : STD_LOGIC;
  signal Conn1_MDIO_I : STD_LOGIC;
  signal Conn1_MDIO_O : STD_LOGIC;
  signal Conn1_MDIO_T : STD_LOGIC;
  signal Conn2_RXN : STD_LOGIC;
  signal Conn2_RXP : STD_LOGIC;
  signal Conn2_TXN : STD_LOGIC;
  signal Conn2_TXP : STD_LOGIC;
  signal Conn3_EMPTY : STD_LOGIC;
  signal Conn3_RD_DATA : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal Conn3_RD_EN : STD_LOGIC;
  signal Conn4_FULL : STD_LOGIC;
  signal Conn4_WR_DATA : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal Conn4_WR_EN : STD_LOGIC;
  signal EthernetController3_0_GMII_RXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EthernetController3_0_GMII_RX_DV : STD_LOGIC;
  signal EthernetController3_0_GMII_RX_ER : STD_LOGIC;
  signal EthernetController3_0_GMII_TXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EthernetController3_0_GMII_TX_EN : STD_LOGIC;
  signal EthernetController3_0_GMII_TX_ER : STD_LOGIC;
  signal EthernetController3_0_NETPKT_RecvReady : STD_LOGIC;
  signal EthernetController3_0_NETPKT_SendReady : STD_LOGIC;
  signal EthernetController3_0_RecvScratchRDB_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal EthernetController3_0_RecvScratchRDB_CLK : STD_LOGIC;
  signal EthernetController3_0_RecvScratchRDB_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_RecvScratchRDB_EN : STD_LOGIC;
  signal EthernetController3_0_RecvScratchWRA_ADDR : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal EthernetController3_0_RecvScratchWRA_CLK : STD_LOGIC;
  signal EthernetController3_0_RecvScratchWRA_DIN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EthernetController3_0_RecvScratchWRA_EN : STD_LOGIC;
  signal EthernetController3_0_RecvScratchWRA_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal EthernetController3_0_STAT_CountDroppedRecvPackets : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_STAT_CountInvalidRecvPackets : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_STAT_CountSendUdpPackets : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_STAT_CountValidRecvArpPackets : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_STAT_CountValidRecvUdpPackets : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_an_adv_config_val : STD_LOGIC;
  signal EthernetController3_0_an_adv_config_vector : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EthernetController3_0_an_restart_config : STD_LOGIC;
  signal EthernetController3_0_configuration_valid : STD_LOGIC;
  signal EthernetController3_0_configuration_vector : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal EthernetController3_0_pcs_rst_out : STD_LOGIC;
  signal EthernetController3_0_phyaddr : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal EthernetController3_0_recv_pkt_data_WR_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_recv_pkt_data_WR_EN : STD_LOGIC;
  signal EthernetController3_0_recv_pkt_header_WR_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_recv_pkt_header_WR_EN : STD_LOGIC;
  signal EthernetController3_0_riu_prsnt_1 : STD_LOGIC;
  signal EthernetController3_0_riu_prsnt_2 : STD_LOGIC;
  signal EthernetController3_0_riu_prsnt_3 : STD_LOGIC;
  signal EthernetController3_0_riu_rddata_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EthernetController3_0_riu_rddata_2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EthernetController3_0_riu_rddata_3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EthernetController3_0_riu_valid_1 : STD_LOGIC;
  signal EthernetController3_0_riu_valid_2 : STD_LOGIC;
  signal EthernetController3_0_riu_valid_3 : STD_LOGIC;
  signal EthernetController3_0_rx_dly_rdy_1 : STD_LOGIC;
  signal EthernetController3_0_rx_dly_rdy_2 : STD_LOGIC;
  signal EthernetController3_0_rx_dly_rdy_3 : STD_LOGIC;
  signal EthernetController3_0_rx_vtc_rdy_1 : STD_LOGIC;
  signal EthernetController3_0_rx_vtc_rdy_2 : STD_LOGIC;
  signal EthernetController3_0_rx_vtc_rdy_3 : STD_LOGIC;
  signal EthernetController3_0_send_pkt_data_EMPTY : STD_LOGIC;
  signal EthernetController3_0_send_pkt_data_RD_DATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal EthernetController3_0_send_pkt_data_RD_EN : STD_LOGIC;
  signal EthernetController3_0_send_pkt_header_EMPTY : STD_LOGIC;
  signal EthernetController3_0_send_pkt_header_RD_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal EthernetController3_0_send_pkt_header_RD_EN : STD_LOGIC;
  signal EthernetController3_0_signal_detect : STD_LOGIC;
  signal EthernetController3_0_speed_is_100 : STD_LOGIC;
  signal EthernetController3_0_speed_is_10_100 : STD_LOGIC;
  signal EthernetController3_0_tx_dly_rdy_1 : STD_LOGIC;
  signal EthernetController3_0_tx_dly_rdy_2 : STD_LOGIC;
  signal EthernetController3_0_tx_dly_rdy_3 : STD_LOGIC;
  signal EthernetController3_0_tx_vtc_rdy_1 : STD_LOGIC;
  signal EthernetController3_0_tx_vtc_rdy_2 : STD_LOGIC;
  signal EthernetController3_0_tx_vtc_rdy_3 : STD_LOGIC;
  signal EthernetMDIOControll_0_MDIO_MDC : STD_LOGIC;
  signal EthernetMDIOControll_0_MDIO_MDIO_I : STD_LOGIC;
  signal EthernetMDIOControll_0_MDIO_MDIO_O : STD_LOGIC;
  signal EthernetMDIOControll_0_MDIO_MDIO_T : STD_LOGIC;
  signal EthernetMDIOControll_0_mdio_t_ctrl : STD_LOGIC;
  signal EthernetMDIOControll_0_registerReadData : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal EthernetMDIOControll_0_registerReadReady : STD_LOGIC;
  signal EthernetMDIOControll_0_registerWriteComplete : STD_LOGIC;
  signal NetProtoPacketProces_0_SendPacketBRAMR_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NetProtoPacketProces_0_SendPacketBRAMR_CLK : STD_LOGIC;
  signal NetProtoPacketProces_0_SendPacketBRAMR_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_SendPacketBRAMR_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_SendPacketBRAMW_ADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NetProtoPacketProces_0_SendPacketBRAMW_CLK : STD_LOGIC;
  signal NetProtoPacketProces_0_SendPacketBRAMW_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_SendPacketBRAMW_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_SendPacketBRAMW_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NetProtoPacketProces_0_recv_pkt_data_EMPTY : STD_LOGIC;
  signal NetProtoPacketProces_0_recv_pkt_data_RD_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_recv_pkt_data_RD_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_recv_pkt_header_EMPTY : STD_LOGIC;
  signal NetProtoPacketProces_0_recv_pkt_header_RD_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_recv_pkt_header_RD_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_returnPacketsFIFO_EMPTY : STD_LOGIC;
  signal NetProtoPacketProces_0_returnPacketsFIFO_RD_DATA : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal NetProtoPacketProces_0_returnPacketsFIFO_RD_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_send_pkt_data_WR_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_send_pkt_data_WR_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_send_pkt_header_WR_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NetProtoPacketProces_0_send_pkt_header_WR_EN : STD_LOGIC;
  signal NetProtoPacketProces_0_validPacketsFIFO_wr_data : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal NetProtoPacketProces_0_validPacketsFIFO_wr_en : STD_LOGIC;
  signal SGMII_PHY_Bringup_MD_0_newRequestData : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal SGMII_PHY_Bringup_MD_0_newRequestDevTypeRegister : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal SGMII_PHY_Bringup_MD_0_newRequestIsWrite : STD_LOGIC;
  signal SGMII_PHY_Bringup_MD_0_newRequestPHYAddress : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal SGMII_PHY_Bringup_MD_0_newRequestRegister : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal SGMII_PHY_Bringup_MD_0_newRequestStart : STD_LOGIC;
  signal SGMII_PHY_Bringup_MD_0_phyBringupComplete : STD_LOGIC;
  signal clk333_250_1 : STD_LOGIC;
  signal clk_333_250_to_10_0_clk_out1 : STD_LOGIC;
  signal gig_ethernet_pcs_pma_0_clk125_out : STD_LOGIC;
  signal gig_ethernet_pcs_pma_0_gmii_isolate_0 : STD_LOGIC;
  signal gig_ethernet_pcs_pma_0_rx_locked : STD_LOGIC;
  signal gig_ethernet_pcs_pma_0_status_vector_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal gig_ethernet_pcs_pma_0_tx_locked : STD_LOGIC;
  signal recv_pkt_data_fifo_wr_data_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal recv_pkt_header_fifo_prog_full : STD_LOGIC;
  signal send_pkt_data_fifo_wr_data_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal send_pkt_header_fifo_prog_full : STD_LOGIC;
  signal sgmii_phyclk_1_CLK_N : STD_LOGIC;
  signal sgmii_phyclk_1_CLK_P : STD_LOGIC;
  signal validPacketsFIFO_full : STD_LOGIC;
  signal validPacketsFIFO_prog_full : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_EthernetController3_0_DBG_Recv_pkt_header_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_EthernetController3_0_DBG_send_pkt_data_rd_en_UNCONNECTED : STD_LOGIC;
  signal NLW_EthernetController3_0_DBG_ARPPacketTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_EthernetController3_0_DBG_DeviceTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_EthernetController3_0_DBG_EthConfig_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_EthernetController3_0_DBG_EthRecv_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_EthernetController3_0_DBG_EthSend_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_EthernetController3_0_DBG_PacketSendPtr_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvComputedCRC32_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvFIFOAvailableBytes_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvFIFOCount_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvFIFOCurrentPushDWORD_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvFIFOPktLengthDWORDs_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvFifoPush_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvPacketFCS_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvPacketSizeDWORDs_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvValid_ARP_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvValid_IPv4_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvValid_MAC_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_EthernetController3_0_DBG_RecvValid_Payload_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_EthernetController3_0_DBG_RecvValid_UDP_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_EthernetController3_0_DBG_SendPacketBodyData_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_EthernetController3_0_DBG_SendPacketHeaderData_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_EthernetController3_0_DBG_SendPacketRemainingFIFOPumpBytes_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_EthernetController3_0_DBG_SendType_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_EthernetController3_0_DBG_SendUDPPacketCount_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_EthernetController3_0_mac_address_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_EthernetController3_0_speed_override_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_EthernetMDIOControll_0_DBG_BitsRemaining_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_EthernetMDIOControll_0_DBG_EthMDIO_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_EthernetMDIOControll_0_DBG_InProgressRead_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvSendReplyPacket_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_rd_en_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_sendHandlingReply_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_sendHasUnackedSentPacket_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_sendReplyAck_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_send_pkt_header_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_NetProtoPacketProces_0_DBG_NetPkt_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_RecvFIFOState_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_RecvSessionParseState_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_SendFIFOState_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_SendPacketState_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_discardPacketReason_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvCurrentPacketLength_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacket_UNCONNECTED : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacketIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacketOffset_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvHeaderChecksum_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvLastAckedPacketID_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvLastSendAckedPacketID_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvPacketData_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_recvValid_Session_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_rd_data_UNCONNECTED : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_sendCyclesBetweenAutoResends_UNCONNECTED : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal NLW_NetProtoPacketProces_0_DBG_sendLastAckedPacketID_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsDropped_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsInvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_NetProtoPacketProces_0_STAT_SendSessionPackets_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_SGMII_PHY_Bringup_MD_0_DBG_Bringup_State_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadData_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_SGMII_PHY_Bringup_MD_0_DBG_RegReadData_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_SGMII_PHY_Bringup_MD_0_DBG_RegReadIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_an_interrupt_0_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_clk312_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_riu_clk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_riu_wr_en_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rst_125_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_bs_en_vtc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_bs_rst_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_bsc_en_vtc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_bsc_rst_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_logic_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_pll_clk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_rx_rst_dly_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_sgmii_clk_en_0_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_sgmii_clk_f_0_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_sgmii_clk_r_0_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_bs_en_vtc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_bs_rst_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_bsc_en_vtc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_bsc_rst_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_logic_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_pll_clk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_rdclk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_tx_rst_dly_out_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_riu_addr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_riu_nibble_sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_riu_wr_data_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_rx_btval_1_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_rx_btval_2_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_rx_btval_3_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_recv_pkt_data_fifo_full_UNCONNECTED : STD_LOGIC;
  signal NLW_recv_pkt_header_fifo_full_UNCONNECTED : STD_LOGIC;
  signal NLW_recv_pkt_header_fifo_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_recv_pkt_header_fifo_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_returnPacketsFIFO_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_returnPacketsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_returnPacketsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_send_pkt_data_fifo_full_UNCONNECTED : STD_LOGIC;
  signal NLW_send_pkt_header_fifo_full_UNCONNECTED : STD_LOGIC;
  signal NLW_send_pkt_header_fifo_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_send_pkt_header_fifo_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_validPacketsFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_validPacketsFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
begin
  Conn1_MDIO_I <= mdio_mdc_mdio_i;
  Conn2_RXN <= sgmii_lvds_rxn;
  Conn2_RXP <= sgmii_lvds_rxp;
  Conn3_RD_EN <= FIFO_READ_rd_en;
  Conn4_WR_DATA(87 downto 0) <= FIFO_WRITE_wr_data(87 downto 0);
  Conn4_WR_EN <= FIFO_WRITE_wr_en;
  FIFO_READ_empty <= Conn3_EMPTY;
  FIFO_READ_rd_data(87 downto 0) <= Conn3_RD_DATA(87 downto 0);
  FIFO_WRITE_full <= Conn4_FULL;
  clk333_250_1 <= clk333_250;
  mdio_mdc_mdc <= Conn1_MDC;
  mdio_mdc_mdio_o <= Conn1_MDIO_O;
  mdio_mdc_mdio_t <= Conn1_MDIO_T;
  sgmii_lvds_txn <= Conn2_TXN;
  sgmii_lvds_txp <= Conn2_TXP;
  sgmii_phyclk_1_CLK_N <= refclk625_in_0_clk_n;
  sgmii_phyclk_1_CLK_P <= refclk625_in_0_clk_p;
CDC_EthernetControll_0: component design_1_CDC_EthernetControll_0_0
     port map (
      In_Signal => EthernetController3_0_NETPKT_RecvReady,
      In_clk125 => gig_ethernet_pcs_pma_0_clk125_out,
      Out_Signal => CDC_EthernetControll_0_Out_Signal,
      Out_clk333 => clk333_250_1
    );
CDC_EthernetControll_1: component design_1_CDC_EthernetControll_1_0
     port map (
      In_Signal => EthernetController3_0_NETPKT_SendReady,
      In_clk125 => gig_ethernet_pcs_pma_0_clk125_out,
      Out_Signal => CDC_EthernetControll_1_Out_Signal,
      Out_clk333 => clk333_250_1
    );
ClockDivider4_1_0: component design_1_ClockDivider4_1_0_0
     port map (
      clkin100 => clk_333_250_to_10_0_clk_out1,
      clkout25 => ClockDivider4_1_0_clkout25
    );
EthernetController3_0: component design_1_EthernetController3_0_0
     port map (
      DBG_ARPPacketTPA(31 downto 0) => NLW_EthernetController3_0_DBG_ARPPacketTPA_UNCONNECTED(31 downto 0),
      DBG_DeviceTPA(31 downto 0) => NLW_EthernetController3_0_DBG_DeviceTPA_UNCONNECTED(31 downto 0),
      DBG_EthConfig_State(4 downto 0) => NLW_EthernetController3_0_DBG_EthConfig_State_UNCONNECTED(4 downto 0),
      DBG_EthRecv_State(4 downto 0) => NLW_EthernetController3_0_DBG_EthRecv_State_UNCONNECTED(4 downto 0),
      DBG_EthSend_State(4 downto 0) => NLW_EthernetController3_0_DBG_EthSend_State_UNCONNECTED(4 downto 0),
      DBG_PacketSendPtr(11 downto 0) => NLW_EthernetController3_0_DBG_PacketSendPtr_UNCONNECTED(11 downto 0),
      DBG_RecvComputedCRC32(31 downto 0) => NLW_EthernetController3_0_DBG_RecvComputedCRC32_UNCONNECTED(31 downto 0),
      DBG_RecvFIFOAvailableBytes(10 downto 0) => NLW_EthernetController3_0_DBG_RecvFIFOAvailableBytes_UNCONNECTED(10 downto 0),
      DBG_RecvFIFOCount(10 downto 0) => NLW_EthernetController3_0_DBG_RecvFIFOCount_UNCONNECTED(10 downto 0),
      DBG_RecvFIFOCurrentPushDWORD(8 downto 0) => NLW_EthernetController3_0_DBG_RecvFIFOCurrentPushDWORD_UNCONNECTED(8 downto 0),
      DBG_RecvFIFOPktLengthDWORDs(11 downto 0) => NLW_EthernetController3_0_DBG_RecvFIFOPktLengthDWORDs_UNCONNECTED(11 downto 0),
      DBG_RecvFifoPush_State(4 downto 0) => NLW_EthernetController3_0_DBG_RecvFifoPush_State_UNCONNECTED(4 downto 0),
      DBG_RecvPacketFCS(31 downto 0) => NLW_EthernetController3_0_DBG_RecvPacketFCS_UNCONNECTED(31 downto 0),
      DBG_RecvPacketSizeDWORDs(11 downto 0) => NLW_EthernetController3_0_DBG_RecvPacketSizeDWORDs_UNCONNECTED(11 downto 0),
      DBG_RecvValid_ARP(6 downto 0) => NLW_EthernetController3_0_DBG_RecvValid_ARP_UNCONNECTED(6 downto 0),
      DBG_RecvValid_IPv4(5 downto 0) => NLW_EthernetController3_0_DBG_RecvValid_IPv4_UNCONNECTED(5 downto 0),
      DBG_RecvValid_MAC(2 downto 0) => NLW_EthernetController3_0_DBG_RecvValid_MAC_UNCONNECTED(2 downto 0),
      DBG_RecvValid_Payload(0) => NLW_EthernetController3_0_DBG_RecvValid_Payload_UNCONNECTED(0),
      DBG_RecvValid_UDP(0) => NLW_EthernetController3_0_DBG_RecvValid_UDP_UNCONNECTED(0),
      DBG_Recv_pkt_header_prog_full => NLW_EthernetController3_0_DBG_Recv_pkt_header_prog_full_UNCONNECTED,
      DBG_SendPacketBodyData(7 downto 0) => NLW_EthernetController3_0_DBG_SendPacketBodyData_UNCONNECTED(7 downto 0),
      DBG_SendPacketHeaderData(31 downto 0) => NLW_EthernetController3_0_DBG_SendPacketHeaderData_UNCONNECTED(31 downto 0),
      DBG_SendPacketRemainingFIFOPumpBytes(1 downto 0) => NLW_EthernetController3_0_DBG_SendPacketRemainingFIFOPumpBytes_UNCONNECTED(1 downto 0),
      DBG_SendType(1 downto 0) => NLW_EthernetController3_0_DBG_SendType_UNCONNECTED(1 downto 0),
      DBG_SendUDPPacketCount(7 downto 0) => NLW_EthernetController3_0_DBG_SendUDPPacketCount_UNCONNECTED(7 downto 0),
      DBG_send_pkt_data_rd_en => NLW_EthernetController3_0_DBG_send_pkt_data_rd_en_UNCONNECTED,
      NETPKT_RecvReady => EthernetController3_0_NETPKT_RecvReady,
      NETPKT_SendReady => EthernetController3_0_NETPKT_SendReady,
      STAT_CountDroppedRecvPackets(31 downto 0) => EthernetController3_0_STAT_CountDroppedRecvPackets(31 downto 0),
      STAT_CountInvalidRecvPackets(31 downto 0) => EthernetController3_0_STAT_CountInvalidRecvPackets(31 downto 0),
      STAT_CountSendUdpPackets(31 downto 0) => EthernetController3_0_STAT_CountSendUdpPackets(31 downto 0),
      STAT_CountValidRecvArpPackets(31 downto 0) => EthernetController3_0_STAT_CountValidRecvArpPackets(31 downto 0),
      STAT_CountValidRecvUdpPackets(31 downto 0) => EthernetController3_0_STAT_CountValidRecvUdpPackets(31 downto 0),
      an_adv_config_val => EthernetController3_0_an_adv_config_val,
      an_adv_config_vector(15 downto 0) => EthernetController3_0_an_adv_config_vector(15 downto 0),
      an_restart_config => EthernetController3_0_an_restart_config,
      clk125 => gig_ethernet_pcs_pma_0_clk125_out,
      configuration_valid => EthernetController3_0_configuration_valid,
      configuration_vector(4 downto 0) => EthernetController3_0_configuration_vector(4 downto 0),
      gmii_isolate => gig_ethernet_pcs_pma_0_gmii_isolate_0,
      mac_address(47 downto 0) => NLW_EthernetController3_0_mac_address_UNCONNECTED(47 downto 0),
      pcs_rst_out => EthernetController3_0_pcs_rst_out,
      phyBringupComplete => SGMII_PHY_Bringup_MD_0_phyBringupComplete,
      phyaddr(4 downto 0) => EthernetController3_0_phyaddr(4 downto 0),
      recv_pkt_data_count(10 downto 0) => recv_pkt_data_fifo_wr_data_count(10 downto 0),
      recv_pkt_data_wr_data(31 downto 0) => EthernetController3_0_recv_pkt_data_WR_DATA(31 downto 0),
      recv_pkt_data_wr_en => EthernetController3_0_recv_pkt_data_WR_EN,
      recv_pkt_header_prog_full => recv_pkt_header_fifo_prog_full,
      recv_pkt_header_wr_data(31 downto 0) => EthernetController3_0_recv_pkt_header_WR_DATA(31 downto 0),
      recv_pkt_header_wr_en => EthernetController3_0_recv_pkt_header_WR_EN,
      recv_scratch_addra(10 downto 0) => EthernetController3_0_RecvScratchWRA_ADDR(10 downto 0),
      recv_scratch_addrb(8 downto 0) => EthernetController3_0_RecvScratchRDB_ADDR(8 downto 0),
      recv_scratch_clka125 => EthernetController3_0_RecvScratchWRA_CLK,
      recv_scratch_clkb125 => EthernetController3_0_RecvScratchRDB_CLK,
      recv_scratch_dina(7 downto 0) => EthernetController3_0_RecvScratchWRA_DIN(7 downto 0),
      recv_scratch_doutb(31 downto 0) => EthernetController3_0_RecvScratchRDB_DOUT(31 downto 0),
      recv_scratch_ena => EthernetController3_0_RecvScratchWRA_EN,
      recv_scratch_enb => EthernetController3_0_RecvScratchRDB_EN,
      recv_scratch_wea(0) => EthernetController3_0_RecvScratchWRA_WE(0),
      riu_prsnt_1 => EthernetController3_0_riu_prsnt_1,
      riu_prsnt_2 => EthernetController3_0_riu_prsnt_2,
      riu_prsnt_3 => EthernetController3_0_riu_prsnt_3,
      riu_rddata_1(15 downto 0) => EthernetController3_0_riu_rddata_1(15 downto 0),
      riu_rddata_2(15 downto 0) => EthernetController3_0_riu_rddata_2(15 downto 0),
      riu_rddata_3(15 downto 0) => EthernetController3_0_riu_rddata_3(15 downto 0),
      riu_valid_1 => EthernetController3_0_riu_valid_1,
      riu_valid_2 => EthernetController3_0_riu_valid_2,
      riu_valid_3 => EthernetController3_0_riu_valid_3,
      rx_data(7 downto 0) => EthernetController3_0_GMII_RXD(7 downto 0),
      rx_dly_rdy_1 => EthernetController3_0_rx_dly_rdy_1,
      rx_dly_rdy_2 => EthernetController3_0_rx_dly_rdy_2,
      rx_dly_rdy_3 => EthernetController3_0_rx_dly_rdy_3,
      rx_dv => EthernetController3_0_GMII_RX_DV,
      rx_er => EthernetController3_0_GMII_RX_ER,
      rx_locked => gig_ethernet_pcs_pma_0_rx_locked,
      rx_vtc_rdy_1 => EthernetController3_0_rx_vtc_rdy_1,
      rx_vtc_rdy_2 => EthernetController3_0_rx_vtc_rdy_2,
      rx_vtc_rdy_3 => EthernetController3_0_rx_vtc_rdy_3,
      send_pkt_data_empty => EthernetController3_0_send_pkt_data_EMPTY,
      send_pkt_data_rd_data(7 downto 0) => EthernetController3_0_send_pkt_data_RD_DATA(7 downto 0),
      send_pkt_data_rd_en => EthernetController3_0_send_pkt_data_RD_EN,
      send_pkt_header_empty => EthernetController3_0_send_pkt_header_EMPTY,
      send_pkt_header_rd_data(31 downto 0) => EthernetController3_0_send_pkt_header_RD_DATA(31 downto 0),
      send_pkt_header_rd_en => EthernetController3_0_send_pkt_header_RD_EN,
      signal_detect => EthernetController3_0_signal_detect,
      speed_is_100 => EthernetController3_0_speed_is_100,
      speed_is_10_100 => EthernetController3_0_speed_is_10_100,
      speed_override(1 downto 0) => NLW_EthernetController3_0_speed_override_UNCONNECTED(1 downto 0),
      status_vector(15 downto 0) => gig_ethernet_pcs_pma_0_status_vector_0(15 downto 0),
      tx_data(7 downto 0) => EthernetController3_0_GMII_TXD(7 downto 0),
      tx_dly_rdy_1 => EthernetController3_0_tx_dly_rdy_1,
      tx_dly_rdy_2 => EthernetController3_0_tx_dly_rdy_2,
      tx_dly_rdy_3 => EthernetController3_0_tx_dly_rdy_3,
      tx_en => EthernetController3_0_GMII_TX_EN,
      tx_er => EthernetController3_0_GMII_TX_ER,
      tx_locked => gig_ethernet_pcs_pma_0_tx_locked,
      tx_vtc_rdy_1 => EthernetController3_0_tx_vtc_rdy_1,
      tx_vtc_rdy_2 => EthernetController3_0_tx_vtc_rdy_2,
      tx_vtc_rdy_3 => EthernetController3_0_tx_vtc_rdy_3
    );
EthernetMDIOControll_0: component design_1_EthernetMDIOControll_0_0
     port map (
      DBG_BitsRemaining(5 downto 0) => NLW_EthernetMDIOControll_0_DBG_BitsRemaining_UNCONNECTED(5 downto 0),
      DBG_EthMDIO_State(4 downto 0) => NLW_EthernetMDIOControll_0_DBG_EthMDIO_State_UNCONNECTED(4 downto 0),
      DBG_InProgressRead(15 downto 0) => NLW_EthernetMDIOControll_0_DBG_InProgressRead_UNCONNECTED(15 downto 0),
      clkin25 => ClockDivider4_1_0_clkout25,
      mdio_clk => EthernetMDIOControll_0_MDIO_MDC,
      mdio_i => EthernetMDIOControll_0_MDIO_MDIO_I,
      mdio_o => EthernetMDIOControll_0_MDIO_MDIO_O,
      mdio_t => EthernetMDIOControll_0_MDIO_MDIO_T,
      mdio_t_ctrl => EthernetMDIOControll_0_mdio_t_ctrl,
      newRequestData(15 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestData(15 downto 0),
      newRequestDevTypeRegister(4 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestDevTypeRegister(4 downto 0),
      newRequestIsWrite => SGMII_PHY_Bringup_MD_0_newRequestIsWrite,
      newRequestPHYAddress(4 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestPHYAddress(4 downto 0),
      newRequestRegister(15 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestRegister(15 downto 0),
      newRequestStart => SGMII_PHY_Bringup_MD_0_newRequestStart,
      registerReadData(15 downto 0) => EthernetMDIOControll_0_registerReadData(15 downto 0),
      registerReadReady => EthernetMDIOControll_0_registerReadReady,
      registerWriteComplete => EthernetMDIOControll_0_registerWriteComplete
    );
NetProtoPacketProces_0: component design_1_NetProtoPacketProces_0_0
     port map (
      DBG_NetPkt_State(4 downto 0) => NLW_NetProtoPacketProces_0_DBG_NetPkt_State_UNCONNECTED(4 downto 0),
      DBG_RecvFIFOState(4 downto 0) => NLW_NetProtoPacketProces_0_DBG_RecvFIFOState_UNCONNECTED(4 downto 0),
      DBG_RecvSessionParseState(4 downto 0) => NLW_NetProtoPacketProces_0_DBG_RecvSessionParseState_UNCONNECTED(4 downto 0),
      DBG_SendFIFOState(4 downto 0) => NLW_NetProtoPacketProces_0_DBG_SendFIFOState_UNCONNECTED(4 downto 0),
      DBG_SendPacketState(4 downto 0) => NLW_NetProtoPacketProces_0_DBG_SendPacketState_UNCONNECTED(4 downto 0),
      DBG_discardPacketReason(3 downto 0) => NLW_NetProtoPacketProces_0_DBG_discardPacketReason_UNCONNECTED(3 downto 0),
      DBG_recvCurrentPacketLength(15 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvCurrentPacketLength_UNCONNECTED(15 downto 0),
      DBG_recvCurrentSubpacket(71 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacket_UNCONNECTED(71 downto 0),
      DBG_recvCurrentSubpacketIndex(7 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacketIndex_UNCONNECTED(7 downto 0),
      DBG_recvCurrentSubpacketOffset(3 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvCurrentSubpacketOffset_UNCONNECTED(3 downto 0),
      DBG_recvHeaderChecksum(7 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvHeaderChecksum_UNCONNECTED(7 downto 0),
      DBG_recvLastAckedPacketID(15 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvLastAckedPacketID_UNCONNECTED(15 downto 0),
      DBG_recvLastSendAckedPacketID(15 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvLastSendAckedPacketID_UNCONNECTED(15 downto 0),
      DBG_recvPacketData(63 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvPacketData_UNCONNECTED(63 downto 0),
      DBG_recvSendReplyPacket => NLW_NetProtoPacketProces_0_DBG_recvSendReplyPacket_UNCONNECTED,
      DBG_recvValid_Session(3 downto 0) => NLW_NetProtoPacketProces_0_DBG_recvValid_Session_UNCONNECTED(3 downto 0),
      DBG_returnPacketsFIFO_empty => NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_empty_UNCONNECTED,
      DBG_returnPacketsFIFO_rd_data(87 downto 0) => NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_rd_data_UNCONNECTED(87 downto 0),
      DBG_returnPacketsFIFO_rd_en => NLW_NetProtoPacketProces_0_DBG_returnPacketsFIFO_rd_en_UNCONNECTED,
      DBG_sendCyclesBetweenAutoResends(27 downto 0) => NLW_NetProtoPacketProces_0_DBG_sendCyclesBetweenAutoResends_UNCONNECTED(27 downto 0),
      DBG_sendHandlingReply => NLW_NetProtoPacketProces_0_DBG_sendHandlingReply_UNCONNECTED,
      DBG_sendHasUnackedSentPacket => NLW_NetProtoPacketProces_0_DBG_sendHasUnackedSentPacket_UNCONNECTED,
      DBG_sendLastAckedPacketID(15 downto 0) => NLW_NetProtoPacketProces_0_DBG_sendLastAckedPacketID_UNCONNECTED(15 downto 0),
      DBG_sendReplyAck => NLW_NetProtoPacketProces_0_DBG_sendReplyAck_UNCONNECTED,
      DBG_send_pkt_header_prog_full => NLW_NetProtoPacketProces_0_DBG_send_pkt_header_prog_full_UNCONNECTED,
      ETHCTRL_RecvReady => CDC_EthernetControll_0_Out_Signal,
      ETHCTRL_SendReady => CDC_EthernetControll_1_Out_Signal,
      STAT_RecvSessionPacketsDropped(31 downto 0) => NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsDropped_UNCONNECTED(31 downto 0),
      STAT_RecvSessionPacketsInvalid(31 downto 0) => NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsInvalid_UNCONNECTED(31 downto 0),
      STAT_RecvSessionPacketsValid(31 downto 0) => NLW_NetProtoPacketProces_0_STAT_RecvSessionPacketsValid_UNCONNECTED(31 downto 0),
      STAT_SendSessionPackets(31 downto 0) => NLW_NetProtoPacketProces_0_STAT_SendSessionPackets_UNCONNECTED(31 downto 0),
      clk333_250 => clk333_250_1,
      recv_pkt_data_empty => NetProtoPacketProces_0_recv_pkt_data_EMPTY,
      recv_pkt_data_rd_data(31 downto 0) => NetProtoPacketProces_0_recv_pkt_data_RD_DATA(31 downto 0),
      recv_pkt_data_rd_en => NetProtoPacketProces_0_recv_pkt_data_RD_EN,
      recv_pkt_header_empty => NetProtoPacketProces_0_recv_pkt_header_EMPTY,
      recv_pkt_header_rd_data(31 downto 0) => NetProtoPacketProces_0_recv_pkt_header_RD_DATA(31 downto 0),
      recv_pkt_header_rd_en => NetProtoPacketProces_0_recv_pkt_header_RD_EN,
      returnPacketsFIFO_empty => NetProtoPacketProces_0_returnPacketsFIFO_EMPTY,
      returnPacketsFIFO_rd_data(87 downto 0) => NetProtoPacketProces_0_returnPacketsFIFO_RD_DATA(87 downto 0),
      returnPacketsFIFO_rd_en => NetProtoPacketProces_0_returnPacketsFIFO_RD_EN,
      sendBRAM_addra(8 downto 0) => NetProtoPacketProces_0_SendPacketBRAMW_ADDR(8 downto 0),
      sendBRAM_addrb(8 downto 0) => NetProtoPacketProces_0_SendPacketBRAMR_ADDR(8 downto 0),
      sendBRAM_clka => NetProtoPacketProces_0_SendPacketBRAMW_CLK,
      sendBRAM_clkb => NetProtoPacketProces_0_SendPacketBRAMR_CLK,
      sendBRAM_dina(31 downto 0) => NetProtoPacketProces_0_SendPacketBRAMW_DIN(31 downto 0),
      sendBRAM_doutb(31 downto 0) => NetProtoPacketProces_0_SendPacketBRAMR_DOUT(31 downto 0),
      sendBRAM_ena => NetProtoPacketProces_0_SendPacketBRAMW_EN,
      sendBRAM_enb => NetProtoPacketProces_0_SendPacketBRAMR_EN,
      sendBRAM_wea(0) => NetProtoPacketProces_0_SendPacketBRAMW_WE(0),
      send_pkt_data_count(10 downto 0) => send_pkt_data_fifo_wr_data_count(10 downto 0),
      send_pkt_data_wr_data(31 downto 0) => NetProtoPacketProces_0_send_pkt_data_WR_DATA(31 downto 0),
      send_pkt_data_wr_en => NetProtoPacketProces_0_send_pkt_data_WR_EN,
      send_pkt_header_prog_full => send_pkt_header_fifo_prog_full,
      send_pkt_header_wr_data(31 downto 0) => NetProtoPacketProces_0_send_pkt_header_WR_DATA(31 downto 0),
      send_pkt_header_wr_en => NetProtoPacketProces_0_send_pkt_header_WR_EN,
      validPacketsFIFO_full => validPacketsFIFO_full,
      validPacketsFIFO_prog_full => validPacketsFIFO_prog_full,
      validPacketsFIFO_wr_data(87 downto 0) => NetProtoPacketProces_0_validPacketsFIFO_wr_data(87 downto 0),
      validPacketsFIFO_wr_en => NetProtoPacketProces_0_validPacketsFIFO_wr_en
    );
NetProtoSendRetransmitBRAM: component design_1_blk_mem_gen_0_4
     port map (
      addra(8 downto 0) => NetProtoPacketProces_0_SendPacketBRAMW_ADDR(8 downto 0),
      addrb(8 downto 0) => NetProtoPacketProces_0_SendPacketBRAMR_ADDR(8 downto 0),
      clka => NetProtoPacketProces_0_SendPacketBRAMW_CLK,
      clkb => NetProtoPacketProces_0_SendPacketBRAMR_CLK,
      dina(31 downto 0) => NetProtoPacketProces_0_SendPacketBRAMW_DIN(31 downto 0),
      doutb(31 downto 0) => NetProtoPacketProces_0_SendPacketBRAMR_DOUT(31 downto 0),
      ena => NetProtoPacketProces_0_SendPacketBRAMW_EN,
      enb => NetProtoPacketProces_0_SendPacketBRAMR_EN,
      wea(0) => NetProtoPacketProces_0_SendPacketBRAMW_WE(0)
    );
SGMII_PHY_Bringup_MD_0: component design_1_SGMII_PHY_Bringup_MD_0_0
     port map (
      DBG_Bringup_State(4 downto 0) => NLW_SGMII_PHY_Bringup_MD_0_DBG_Bringup_State_UNCONNECTED(4 downto 0),
      DBG_RegPCSPMAReadData(15 downto 0) => NLW_SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadData_UNCONNECTED(15 downto 0),
      DBG_RegPCSPMAReadIndex(4 downto 0) => NLW_SGMII_PHY_Bringup_MD_0_DBG_RegPCSPMAReadIndex_UNCONNECTED(4 downto 0),
      DBG_RegReadData(15 downto 0) => NLW_SGMII_PHY_Bringup_MD_0_DBG_RegReadData_UNCONNECTED(15 downto 0),
      DBG_RegReadIndex(4 downto 0) => NLW_SGMII_PHY_Bringup_MD_0_DBG_RegReadIndex_UNCONNECTED(4 downto 0),
      clkin25 => ClockDivider4_1_0_clkout25,
      dbgRst => xlconstant_0_dout(0),
      newRequestData(15 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestData(15 downto 0),
      newRequestDevTypeRegister(4 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestDevTypeRegister(4 downto 0),
      newRequestIsWrite => SGMII_PHY_Bringup_MD_0_newRequestIsWrite,
      newRequestPHYAddress(4 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestPHYAddress(4 downto 0),
      newRequestRegister(15 downto 0) => SGMII_PHY_Bringup_MD_0_newRequestRegister(15 downto 0),
      newRequestStart => SGMII_PHY_Bringup_MD_0_newRequestStart,
      phyBringupComplete => SGMII_PHY_Bringup_MD_0_phyBringupComplete,
      registerReadData(15 downto 0) => EthernetMDIOControll_0_registerReadData(15 downto 0),
      registerReadReady => EthernetMDIOControll_0_registerReadReady,
      registerWriteComplete => EthernetMDIOControll_0_registerWriteComplete
    );
clk_333_250_to_10_0: component design_1_clk_wiz_0_1
     port map (
      clk_in1 => clk333_250_1,
      clk_out1 => clk_333_250_to_10_0_clk_out1
    );
gig_ethernet_pcs_pma_0: component design_1_gig_ethernet_pcs_pma_0_0
     port map (
      an_adv_config_val_0 => EthernetController3_0_an_adv_config_val,
      an_adv_config_vector_0(15 downto 0) => EthernetController3_0_an_adv_config_vector(15 downto 0),
      an_interrupt_0 => NLW_gig_ethernet_pcs_pma_0_an_interrupt_0_UNCONNECTED,
      an_restart_config_0 => EthernetController3_0_an_restart_config,
      clk125_out => gig_ethernet_pcs_pma_0_clk125_out,
      clk312_out => NLW_gig_ethernet_pcs_pma_0_clk312_out_UNCONNECTED,
      configuration_valid_0 => EthernetController3_0_configuration_valid,
      configuration_vector_0(4 downto 0) => EthernetController3_0_configuration_vector(4 downto 0),
      ext_mdc_0 => Conn1_MDC,
      ext_mdio_i_0 => Conn1_MDIO_I,
      ext_mdio_o_0 => Conn1_MDIO_O,
      ext_mdio_t_0 => Conn1_MDIO_T,
      gmii_isolate_0 => gig_ethernet_pcs_pma_0_gmii_isolate_0,
      gmii_rx_dv_0 => EthernetController3_0_GMII_RX_DV,
      gmii_rx_er_0 => EthernetController3_0_GMII_RX_ER,
      gmii_rxd_0(7 downto 0) => EthernetController3_0_GMII_RXD(7 downto 0),
      gmii_tx_en_0 => EthernetController3_0_GMII_TX_EN,
      gmii_tx_er_0 => EthernetController3_0_GMII_TX_ER,
      gmii_txd_0(7 downto 0) => EthernetController3_0_GMII_TXD(7 downto 0),
      mdc_0 => EthernetMDIOControll_0_MDIO_MDC,
      mdio_i_0 => EthernetMDIOControll_0_MDIO_MDIO_I,
      mdio_o_0 => EthernetMDIOControll_0_MDIO_MDIO_O,
      mdio_t_0 => EthernetMDIOControll_0_MDIO_MDIO_T,
      mdio_t_in_0 => EthernetMDIOControll_0_mdio_t_ctrl,
      phyaddr_0(4 downto 0) => EthernetController3_0_phyaddr(4 downto 0),
      refclk625_n => sgmii_phyclk_1_CLK_N,
      refclk625_p => sgmii_phyclk_1_CLK_P,
      reset => EthernetController3_0_pcs_rst_out,
      riu_addr_out(5 downto 0) => NLW_gig_ethernet_pcs_pma_0_riu_addr_out_UNCONNECTED(5 downto 0),
      riu_clk_out => NLW_gig_ethernet_pcs_pma_0_riu_clk_out_UNCONNECTED,
      riu_nibble_sel_out(1 downto 0) => NLW_gig_ethernet_pcs_pma_0_riu_nibble_sel_out_UNCONNECTED(1 downto 0),
      riu_prsnt_1 => EthernetController3_0_riu_prsnt_1,
      riu_prsnt_2 => EthernetController3_0_riu_prsnt_2,
      riu_prsnt_3 => EthernetController3_0_riu_prsnt_3,
      riu_rddata_1(15 downto 0) => EthernetController3_0_riu_rddata_1(15 downto 0),
      riu_rddata_2(15 downto 0) => EthernetController3_0_riu_rddata_2(15 downto 0),
      riu_rddata_3(15 downto 0) => EthernetController3_0_riu_rddata_3(15 downto 0),
      riu_valid_1 => EthernetController3_0_riu_valid_1,
      riu_valid_2 => EthernetController3_0_riu_valid_2,
      riu_valid_3 => EthernetController3_0_riu_valid_3,
      riu_wr_data_out(15 downto 0) => NLW_gig_ethernet_pcs_pma_0_riu_wr_data_out_UNCONNECTED(15 downto 0),
      riu_wr_en_out => NLW_gig_ethernet_pcs_pma_0_riu_wr_en_out_UNCONNECTED,
      rst_125_out => NLW_gig_ethernet_pcs_pma_0_rst_125_out_UNCONNECTED,
      rx_bs_en_vtc_out => NLW_gig_ethernet_pcs_pma_0_rx_bs_en_vtc_out_UNCONNECTED,
      rx_bs_rst_out => NLW_gig_ethernet_pcs_pma_0_rx_bs_rst_out_UNCONNECTED,
      rx_bsc_en_vtc_out => NLW_gig_ethernet_pcs_pma_0_rx_bsc_en_vtc_out_UNCONNECTED,
      rx_bsc_rst_out => NLW_gig_ethernet_pcs_pma_0_rx_bsc_rst_out_UNCONNECTED,
      rx_btval_1(8 downto 0) => NLW_gig_ethernet_pcs_pma_0_rx_btval_1_UNCONNECTED(8 downto 0),
      rx_btval_2(8 downto 0) => NLW_gig_ethernet_pcs_pma_0_rx_btval_2_UNCONNECTED(8 downto 0),
      rx_btval_3(8 downto 0) => NLW_gig_ethernet_pcs_pma_0_rx_btval_3_UNCONNECTED(8 downto 0),
      rx_dly_rdy_1 => EthernetController3_0_rx_dly_rdy_1,
      rx_dly_rdy_2 => EthernetController3_0_rx_dly_rdy_2,
      rx_dly_rdy_3 => EthernetController3_0_rx_dly_rdy_3,
      rx_locked => gig_ethernet_pcs_pma_0_rx_locked,
      rx_logic_reset => NLW_gig_ethernet_pcs_pma_0_rx_logic_reset_UNCONNECTED,
      rx_pll_clk_out => NLW_gig_ethernet_pcs_pma_0_rx_pll_clk_out_UNCONNECTED,
      rx_rst_dly_out => NLW_gig_ethernet_pcs_pma_0_rx_rst_dly_out_UNCONNECTED,
      rx_vtc_rdy_1 => EthernetController3_0_rx_vtc_rdy_1,
      rx_vtc_rdy_2 => EthernetController3_0_rx_vtc_rdy_2,
      rx_vtc_rdy_3 => EthernetController3_0_rx_vtc_rdy_3,
      rxn_0 => Conn2_RXN,
      rxp_0 => Conn2_RXP,
      sgmii_clk_en_0 => NLW_gig_ethernet_pcs_pma_0_sgmii_clk_en_0_UNCONNECTED,
      sgmii_clk_f_0 => NLW_gig_ethernet_pcs_pma_0_sgmii_clk_f_0_UNCONNECTED,
      sgmii_clk_r_0 => NLW_gig_ethernet_pcs_pma_0_sgmii_clk_r_0_UNCONNECTED,
      signal_detect_0 => EthernetController3_0_signal_detect,
      speed_is_100_0 => EthernetController3_0_speed_is_100,
      speed_is_10_100_0 => EthernetController3_0_speed_is_10_100,
      status_vector_0(15 downto 0) => gig_ethernet_pcs_pma_0_status_vector_0(15 downto 0),
      tx_bs_en_vtc_out => NLW_gig_ethernet_pcs_pma_0_tx_bs_en_vtc_out_UNCONNECTED,
      tx_bs_rst_out => NLW_gig_ethernet_pcs_pma_0_tx_bs_rst_out_UNCONNECTED,
      tx_bsc_en_vtc_out => NLW_gig_ethernet_pcs_pma_0_tx_bsc_en_vtc_out_UNCONNECTED,
      tx_bsc_rst_out => NLW_gig_ethernet_pcs_pma_0_tx_bsc_rst_out_UNCONNECTED,
      tx_dly_rdy_1 => EthernetController3_0_tx_dly_rdy_1,
      tx_dly_rdy_2 => EthernetController3_0_tx_dly_rdy_2,
      tx_dly_rdy_3 => EthernetController3_0_tx_dly_rdy_3,
      tx_locked => gig_ethernet_pcs_pma_0_tx_locked,
      tx_logic_reset => NLW_gig_ethernet_pcs_pma_0_tx_logic_reset_UNCONNECTED,
      tx_pll_clk_out => NLW_gig_ethernet_pcs_pma_0_tx_pll_clk_out_UNCONNECTED,
      tx_rdclk_out => NLW_gig_ethernet_pcs_pma_0_tx_rdclk_out_UNCONNECTED,
      tx_rst_dly_out => NLW_gig_ethernet_pcs_pma_0_tx_rst_dly_out_UNCONNECTED,
      tx_vtc_rdy_1 => EthernetController3_0_tx_vtc_rdy_1,
      tx_vtc_rdy_2 => EthernetController3_0_tx_vtc_rdy_2,
      tx_vtc_rdy_3 => EthernetController3_0_tx_vtc_rdy_3,
      txn_0 => Conn2_TXN,
      txp_0 => Conn2_TXP
    );
ila_0: component design_1_ila_0_5
     port map (
      clk => gig_ethernet_pcs_pma_0_clk125_out,
      probe0(31 downto 0) => EthernetController3_0_STAT_CountSendUdpPackets(31 downto 0),
      probe1(31 downto 0) => EthernetController3_0_STAT_CountValidRecvUdpPackets(31 downto 0),
      probe2(31 downto 0) => EthernetController3_0_STAT_CountValidRecvArpPackets(31 downto 0),
      probe3(31 downto 0) => EthernetController3_0_STAT_CountInvalidRecvPackets(31 downto 0),
      probe4(31 downto 0) => EthernetController3_0_STAT_CountDroppedRecvPackets(31 downto 0)
    );
pkt_recv_scratch_mem: component design_1_blk_mem_gen_0_3
     port map (
      addra(10 downto 0) => EthernetController3_0_RecvScratchWRA_ADDR(10 downto 0),
      addrb(8 downto 0) => EthernetController3_0_RecvScratchRDB_ADDR(8 downto 0),
      clka => EthernetController3_0_RecvScratchWRA_CLK,
      clkb => EthernetController3_0_RecvScratchRDB_CLK,
      dina(7 downto 0) => EthernetController3_0_RecvScratchWRA_DIN(7 downto 0),
      doutb(31 downto 0) => EthernetController3_0_RecvScratchRDB_DOUT(31 downto 0),
      ena => EthernetController3_0_RecvScratchWRA_EN,
      enb => EthernetController3_0_RecvScratchRDB_EN,
      wea(0) => EthernetController3_0_RecvScratchWRA_WE(0)
    );
recv_pkt_data_fifo: component design_1_fifo_generator_0_28
     port map (
      din(31 downto 0) => EthernetController3_0_recv_pkt_data_WR_DATA(31 downto 0),
      dout(31 downto 0) => NetProtoPacketProces_0_recv_pkt_data_RD_DATA(31 downto 0),
      empty => NetProtoPacketProces_0_recv_pkt_data_EMPTY,
      full => NLW_recv_pkt_data_fifo_full_UNCONNECTED,
      rd_clk => clk333_250_1,
      rd_en => NetProtoPacketProces_0_recv_pkt_data_RD_EN,
      wr_clk => gig_ethernet_pcs_pma_0_clk125_out,
      wr_data_count(10 downto 0) => recv_pkt_data_fifo_wr_data_count(10 downto 0),
      wr_en => EthernetController3_0_recv_pkt_data_WR_EN
    );
recv_pkt_header_fifo: component design_1_fifo_generator_0_27
     port map (
      din(31 downto 0) => EthernetController3_0_recv_pkt_header_WR_DATA(31 downto 0),
      dout(31 downto 0) => NetProtoPacketProces_0_recv_pkt_header_RD_DATA(31 downto 0),
      empty => NetProtoPacketProces_0_recv_pkt_header_EMPTY,
      full => NLW_recv_pkt_header_fifo_full_UNCONNECTED,
      prog_full => recv_pkt_header_fifo_prog_full,
      rd_clk => clk333_250_1,
      rd_en => NetProtoPacketProces_0_recv_pkt_header_RD_EN,
      rd_rst_busy => NLW_recv_pkt_header_fifo_rd_rst_busy_UNCONNECTED,
      srst => xlconstant_0_dout(0),
      wr_clk => gig_ethernet_pcs_pma_0_clk125_out,
      wr_en => EthernetController3_0_recv_pkt_header_WR_EN,
      wr_rst_busy => NLW_recv_pkt_header_fifo_wr_rst_busy_UNCONNECTED
    );
returnPacketsFIFO: component design_1_fifo_generator_1_3
     port map (
      clk => clk333_250_1,
      din(87 downto 0) => Conn4_WR_DATA(87 downto 0),
      dout(87 downto 0) => NetProtoPacketProces_0_returnPacketsFIFO_RD_DATA(87 downto 0),
      empty => NetProtoPacketProces_0_returnPacketsFIFO_EMPTY,
      full => Conn4_FULL,
      prog_full => NLW_returnPacketsFIFO_prog_full_UNCONNECTED,
      rd_en => NetProtoPacketProces_0_returnPacketsFIFO_RD_EN,
      rd_rst_busy => NLW_returnPacketsFIFO_rd_rst_busy_UNCONNECTED,
      srst => xlconstant_0_dout(0),
      wr_en => Conn4_WR_EN,
      wr_rst_busy => NLW_returnPacketsFIFO_wr_rst_busy_UNCONNECTED
    );
send_pkt_data_fifo: component design_1_fifo_generator_0_30
     port map (
      din(31 downto 0) => NetProtoPacketProces_0_send_pkt_data_WR_DATA(31 downto 0),
      dout(7 downto 0) => EthernetController3_0_send_pkt_data_RD_DATA(7 downto 0),
      empty => EthernetController3_0_send_pkt_data_EMPTY,
      full => NLW_send_pkt_data_fifo_full_UNCONNECTED,
      rd_clk => gig_ethernet_pcs_pma_0_clk125_out,
      rd_en => EthernetController3_0_send_pkt_data_RD_EN,
      wr_clk => clk333_250_1,
      wr_data_count(10 downto 0) => send_pkt_data_fifo_wr_data_count(10 downto 0),
      wr_en => NetProtoPacketProces_0_send_pkt_data_WR_EN
    );
send_pkt_header_fifo: component design_1_fifo_generator_0_29
     port map (
      din(31 downto 0) => NetProtoPacketProces_0_send_pkt_header_WR_DATA(31 downto 0),
      dout(31 downto 0) => EthernetController3_0_send_pkt_header_RD_DATA(31 downto 0),
      empty => EthernetController3_0_send_pkt_header_EMPTY,
      full => NLW_send_pkt_header_fifo_full_UNCONNECTED,
      prog_full => send_pkt_header_fifo_prog_full,
      rd_clk => gig_ethernet_pcs_pma_0_clk125_out,
      rd_en => EthernetController3_0_send_pkt_header_RD_EN,
      rd_rst_busy => NLW_send_pkt_header_fifo_rd_rst_busy_UNCONNECTED,
      srst => xlconstant_0_dout(0),
      wr_clk => clk333_250_1,
      wr_en => NetProtoPacketProces_0_send_pkt_header_WR_EN,
      wr_rst_busy => NLW_send_pkt_header_fifo_wr_rst_busy_UNCONNECTED
    );
validPacketsFIFO: component design_1_fifo_generator_0_31
     port map (
      clk => clk333_250_1,
      din(87 downto 0) => NetProtoPacketProces_0_validPacketsFIFO_wr_data(87 downto 0),
      dout(87 downto 0) => Conn3_RD_DATA(87 downto 0),
      empty => Conn3_EMPTY,
      full => validPacketsFIFO_full,
      prog_full => validPacketsFIFO_prog_full,
      rd_en => Conn3_RD_EN,
      rd_rst_busy => NLW_validPacketsFIFO_rd_rst_busy_UNCONNECTED,
      srst => xlconstant_0_dout(0),
      wr_en => NetProtoPacketProces_0_validPacketsFIFO_wr_en,
      wr_rst_busy => NLW_validPacketsFIFO_wr_rst_busy_UNCONNECTED
    );
xlconstant_0: component design_1_xlconstant_0_5
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ScanoutSystem_imp_173H4WL is
  port (
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CMD_ScanoutEnable : in STD_LOGIC;
    CMD_VSync : out STD_LOGIC;
    ScanoutReadRequestsFIFO_full : in STD_LOGIC;
    ScanoutReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    ScanoutReadRequestsFIFO_wr_en : out STD_LOGIC;
    ScanoutReadResponses_empty : in STD_LOGIC;
    ScanoutReadResponses_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    ScanoutReadResponses_rd_en : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    cmd_clk : in STD_LOGIC;
    out_blue_n : out STD_LOGIC;
    out_blue_p : out STD_LOGIC;
    out_cl_n : out STD_LOGIC;
    out_cl_p : out STD_LOGIC;
    out_green_n : out STD_LOGIC;
    out_green_p : out STD_LOGIC;
    out_red_n : out STD_LOGIC;
    out_red_p : out STD_LOGIC
  );
end ScanoutSystem_imp_173H4WL;

architecture STRUCTURE of ScanoutSystem_imp_173H4WL is
  component design_1_clk_wiz_0_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_x10 : out STD_LOGIC;
    pixelclk_x1 : out STD_LOGIC;
    clk_x10n : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_obuf_outputs_0_0 is
  port (
    red_s : in STD_LOGIC;
    green_s : in STD_LOGIC;
    blue_s : in STD_LOGIC;
    cl_s : in STD_LOGIC;
    out_red_p : out STD_LOGIC;
    out_red_n : out STD_LOGIC;
    out_green_p : out STD_LOGIC;
    out_green_n : out STD_LOGIC;
    out_blue_p : out STD_LOGIC;
    out_blue_n : out STD_LOGIC;
    out_cl_p : out STD_LOGIC;
    out_cl_n : out STD_LOGIC
  );
  end component design_1_obuf_outputs_0_0;
  component design_1_CDC_Command_Scanout_0_0 is
  port (
    cmd_clk : in STD_LOGIC;
    CMD_VSync : out STD_LOGIC;
    CMD_RenderTargetBaseAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    scanout_clk : in STD_LOGIC;
    SCANOUT_VSync : in STD_LOGIC;
    SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SCANOUT_ScanEnable : out STD_LOGIC;
    SCANOUT_InvertOutputColor : out STD_LOGIC;
    SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  end component design_1_CDC_Command_Scanout_0_0;
  component design_1_ScanOut_0_0 is
  port (
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
  end component design_1_ScanOut_0_0;
  component design_1_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_0_2;
  component design_1_xlconstant_0_3 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_0_3;
  component design_1_dvid_0_0 is
  port (
    clk_x10 : in STD_LOGIC;
    clk_x10n : in STD_LOGIC;
    clk_pixel_x1 : in STD_LOGIC;
    scanout_en : in STD_LOGIC;
    red_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    green_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blue_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    blank : in STD_LOGIC;
    hsync : in STD_LOGIC;
    vsync : in STD_LOGIC;
    controlChannel0Blue : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel1Green : in STD_LOGIC_VECTOR ( 1 downto 0 );
    controlChannel2Red : in STD_LOGIC_VECTOR ( 1 downto 0 );
    guardBandEnable : in STD_LOGIC;
    guardBandType : in STD_LOGIC;
    isTERC4Region : in STD_LOGIC;
    TERC4Character0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    TERC4Character2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    red_s : out STD_LOGIC;
    green_s : out STD_LOGIC;
    blue_s : out STD_LOGIC;
    cl_s : out STD_LOGIC;
    EncodedB : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedG : out STD_LOGIC_VECTOR ( 9 downto 0 );
    EncodedR : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component design_1_dvid_0_0;
  signal CDC_Command_Scanout_0_CMD_VSync : STD_LOGIC;
  signal CDC_Command_Scanout_0_SCANOUT_InvertOutputColor : STD_LOGIC;
  signal CDC_Command_Scanout_0_SCANOUT_OutputColorChannels : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CDC_Command_Scanout_0_SCANOUT_RenderTargetBaseAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CDC_Command_Scanout_0_SCANOUT_ScanEnable : STD_LOGIC;
  signal CMD_InvertOutputColor_1 : STD_LOGIC;
  signal CMD_OutputColorChannels_1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CMD_ScanoutEnable_1 : STD_LOGIC;
  signal CommandProcessor_0_SCANOUT_RenderTargetBaseAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal HSyncPolarity0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ScanOut_0_ScanoutReadRequestsFIFO_FULL : STD_LOGIC;
  signal ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ScanOut_0_ScanoutReadRequestsFIFO_WR_EN : STD_LOGIC;
  signal ScanOut_0_ScanoutReadResponses_EMPTY : STD_LOGIC;
  signal ScanOut_0_ScanoutReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ScanOut_0_ScanoutReadResponses_RD_EN : STD_LOGIC;
  signal ScanOut_0_TERC4Character0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ScanOut_0_TERC4Character1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ScanOut_0_TERC4Character2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ScanOut_0_blank : STD_LOGIC;
  signal ScanOut_0_controlChannel0Blue : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ScanOut_0_controlChannel1Green : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ScanOut_0_controlChannel2Red : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ScanOut_0_guardBandEnable : STD_LOGIC;
  signal ScanOut_0_guardBandType : STD_LOGIC;
  signal ScanOut_0_hsync : STD_LOGIC;
  signal ScanOut_0_isTERC4Region : STD_LOGIC;
  signal ScanOut_0_outB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ScanOut_0_outG : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ScanOut_0_outR : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ScanOut_0_out_scanout_enable : STD_LOGIC;
  signal ScanOut_0_vsync : STD_LOGIC;
  signal VSyncPolarity0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal cmd_clk_1 : STD_LOGIC;
  signal ddr4_0_c0_ddr4_ui_clk : STD_LOGIC;
  signal dvid_0_blue_s : STD_LOGIC;
  signal dvid_0_cl_s : STD_LOGIC;
  signal dvid_0_green_s : STD_LOGIC;
  signal dvid_0_red_s : STD_LOGIC;
  signal obuf_outputs_0_out_blue_n : STD_LOGIC;
  signal obuf_outputs_0_out_blue_p : STD_LOGIC;
  signal obuf_outputs_0_out_cl_n : STD_LOGIC;
  signal obuf_outputs_0_out_cl_p : STD_LOGIC;
  signal obuf_outputs_0_out_green_n : STD_LOGIC;
  signal obuf_outputs_0_out_green_p : STD_LOGIC;
  signal obuf_outputs_0_out_red_n : STD_LOGIC;
  signal obuf_outputs_0_out_red_p : STD_LOGIC;
  signal scanout_clk_25_175_x10_clk_x10n : STD_LOGIC;
  signal scanout_clk_25_175_x10_pixelclk_x1 : STD_LOGIC;
  signal NLW_ScanOut_0_pixelClk_UNCONNECTED : STD_LOGIC;
  signal NLW_ScanOut_0_DBG_InternalScanX_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_ScanOut_0_DBG_InternalScanY_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_ScanOut_0_DBG_ScanoutLoadProcess_State_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ScanOut_0_outXCoord_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_ScanOut_0_outYCoord_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_dvid_0_EncodedB_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_dvid_0_EncodedG_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_dvid_0_EncodedR_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
begin
  CMD_InvertOutputColor_1 <= CMD_InvertOutputColor;
  CMD_OutputColorChannels_1(8 downto 0) <= CMD_OutputColorChannels(8 downto 0);
  CMD_ScanoutEnable_1 <= CMD_ScanoutEnable;
  CMD_VSync <= CDC_Command_Scanout_0_CMD_VSync;
  CommandProcessor_0_SCANOUT_RenderTargetBaseAddr(29 downto 0) <= CMD_BaseRenderTargetAddr(29 downto 0);
  ScanOut_0_ScanoutReadRequestsFIFO_FULL <= ScanoutReadRequestsFIFO_full;
  ScanOut_0_ScanoutReadResponses_EMPTY <= ScanoutReadResponses_empty;
  ScanOut_0_ScanoutReadResponses_RD_DATA(255 downto 0) <= ScanoutReadResponses_rd_data(255 downto 0);
  ScanoutReadRequestsFIFO_wr_data(29 downto 0) <= ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA(29 downto 0);
  ScanoutReadRequestsFIFO_wr_en <= ScanOut_0_ScanoutReadRequestsFIFO_WR_EN;
  ScanoutReadResponses_rd_en <= ScanOut_0_ScanoutReadResponses_RD_EN;
  clk_out1 <= clk_wiz_0_clk_out1;
  cmd_clk_1 <= cmd_clk;
  ddr4_0_c0_ddr4_ui_clk <= clk_in1;
  out_blue_n <= obuf_outputs_0_out_blue_n;
  out_blue_p <= obuf_outputs_0_out_blue_p;
  out_cl_n <= obuf_outputs_0_out_cl_n;
  out_cl_p <= obuf_outputs_0_out_cl_p;
  out_green_n <= obuf_outputs_0_out_green_n;
  out_green_p <= obuf_outputs_0_out_green_p;
  out_red_n <= obuf_outputs_0_out_red_n;
  out_red_p <= obuf_outputs_0_out_red_p;
CDC_Command_Scanout_0: component design_1_CDC_Command_Scanout_0_0
     port map (
      CMD_InvertOutputColor => CMD_InvertOutputColor_1,
      CMD_OutputColorChannels(8 downto 0) => CMD_OutputColorChannels_1(8 downto 0),
      CMD_RenderTargetBaseAddr(29 downto 0) => CommandProcessor_0_SCANOUT_RenderTargetBaseAddr(29 downto 0),
      CMD_ScanEnable => CMD_ScanoutEnable_1,
      CMD_VSync => CDC_Command_Scanout_0_CMD_VSync,
      SCANOUT_InvertOutputColor => CDC_Command_Scanout_0_SCANOUT_InvertOutputColor,
      SCANOUT_OutputColorChannels(8 downto 0) => CDC_Command_Scanout_0_SCANOUT_OutputColorChannels(8 downto 0),
      SCANOUT_RenderTargetBaseAddr(29 downto 0) => CDC_Command_Scanout_0_SCANOUT_RenderTargetBaseAddr(29 downto 0),
      SCANOUT_ScanEnable => CDC_Command_Scanout_0_SCANOUT_ScanEnable,
      SCANOUT_VSync => ScanOut_0_vsync,
      cmd_clk => cmd_clk_1,
      scanout_clk => clk_wiz_0_clk_out1
    );
HSyncPolarity0: component design_1_xlconstant_0_3
     port map (
      dout(0) => HSyncPolarity0_dout(0)
    );
ScanOut_0: component design_1_ScanOut_0_0
     port map (
      CMD_BaseRenderTargetAddr(29 downto 0) => CDC_Command_Scanout_0_SCANOUT_RenderTargetBaseAddr(29 downto 0),
      CMD_InvertOutputColor => CDC_Command_Scanout_0_SCANOUT_InvertOutputColor,
      CMD_OutputColorChannels(8 downto 0) => CDC_Command_Scanout_0_SCANOUT_OutputColorChannels(8 downto 0),
      CMD_ScanoutEnable => CDC_Command_Scanout_0_SCANOUT_ScanEnable,
      DBG_InternalScanX(9 downto 0) => NLW_ScanOut_0_DBG_InternalScanX_UNCONNECTED(9 downto 0),
      DBG_InternalScanY(9 downto 0) => NLW_ScanOut_0_DBG_InternalScanY_UNCONNECTED(9 downto 0),
      DBG_ScanoutLoadProcess_State(3 downto 0) => NLW_ScanOut_0_DBG_ScanoutLoadProcess_State_UNCONNECTED(3 downto 0),
      HSyncActivePolarity => HSyncPolarity0_dout(0),
      MEM_ScanoutReadRequestsFIFO_full => ScanOut_0_ScanoutReadRequestsFIFO_FULL,
      MEM_ScanoutReadRequestsFIFO_wr_data(29 downto 0) => ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA(29 downto 0),
      MEM_ScanoutReadRequestsFIFO_wr_en => ScanOut_0_ScanoutReadRequestsFIFO_WR_EN,
      MEM_ScanoutReadResponsesFIFO_empty => ScanOut_0_ScanoutReadResponses_EMPTY,
      MEM_ScanoutReadResponsesFIFO_rd_data(255 downto 0) => ScanOut_0_ScanoutReadResponses_RD_DATA(255 downto 0),
      MEM_ScanoutReadResponsesFIFO_rd_en => ScanOut_0_ScanoutReadResponses_RD_EN,
      TERC4Character0(3 downto 0) => ScanOut_0_TERC4Character0(3 downto 0),
      TERC4Character1(3 downto 0) => ScanOut_0_TERC4Character1(3 downto 0),
      TERC4Character2(3 downto 0) => ScanOut_0_TERC4Character2(3 downto 0),
      VSyncActivePolarity => VSyncPolarity0_dout(0),
      blank => ScanOut_0_blank,
      clk_x10 => clk_wiz_0_clk_out1,
      controlChannel0Blue(1 downto 0) => ScanOut_0_controlChannel0Blue(1 downto 0),
      controlChannel1Green(1 downto 0) => ScanOut_0_controlChannel1Green(1 downto 0),
      controlChannel2Red(1 downto 0) => ScanOut_0_controlChannel2Red(1 downto 0),
      guardBandEnable => ScanOut_0_guardBandEnable,
      guardBandType => ScanOut_0_guardBandType,
      hsync => ScanOut_0_hsync,
      isTERC4Region => ScanOut_0_isTERC4Region,
      outB(7 downto 0) => ScanOut_0_outB(7 downto 0),
      outG(7 downto 0) => ScanOut_0_outG(7 downto 0),
      outR(7 downto 0) => ScanOut_0_outR(7 downto 0),
      outXCoord(9 downto 0) => NLW_ScanOut_0_outXCoord_UNCONNECTED(9 downto 0),
      outYCoord(9 downto 0) => NLW_ScanOut_0_outYCoord_UNCONNECTED(9 downto 0),
      out_scanout_enable => ScanOut_0_out_scanout_enable,
      pixelClk => NLW_ScanOut_0_pixelClk_UNCONNECTED,
      vsync => ScanOut_0_vsync
    );
VSyncPolarity0: component design_1_xlconstant_0_2
     port map (
      dout(0) => VSyncPolarity0_dout(0)
    );
dvid_0: component design_1_dvid_0_0
     port map (
      EncodedB(9 downto 0) => NLW_dvid_0_EncodedB_UNCONNECTED(9 downto 0),
      EncodedG(9 downto 0) => NLW_dvid_0_EncodedG_UNCONNECTED(9 downto 0),
      EncodedR(9 downto 0) => NLW_dvid_0_EncodedR_UNCONNECTED(9 downto 0),
      TERC4Character0(3 downto 0) => ScanOut_0_TERC4Character0(3 downto 0),
      TERC4Character1(3 downto 0) => ScanOut_0_TERC4Character1(3 downto 0),
      TERC4Character2(3 downto 0) => ScanOut_0_TERC4Character2(3 downto 0),
      blank => ScanOut_0_blank,
      blue_p(7 downto 0) => ScanOut_0_outB(7 downto 0),
      blue_s => dvid_0_blue_s,
      cl_s => dvid_0_cl_s,
      clk_pixel_x1 => scanout_clk_25_175_x10_pixelclk_x1,
      clk_x10 => clk_wiz_0_clk_out1,
      clk_x10n => scanout_clk_25_175_x10_clk_x10n,
      controlChannel0Blue(1 downto 0) => ScanOut_0_controlChannel0Blue(1 downto 0),
      controlChannel1Green(1 downto 0) => ScanOut_0_controlChannel1Green(1 downto 0),
      controlChannel2Red(1 downto 0) => ScanOut_0_controlChannel2Red(1 downto 0),
      green_p(7 downto 0) => ScanOut_0_outG(7 downto 0),
      green_s => dvid_0_green_s,
      guardBandEnable => ScanOut_0_guardBandEnable,
      guardBandType => ScanOut_0_guardBandType,
      hsync => ScanOut_0_hsync,
      isTERC4Region => ScanOut_0_isTERC4Region,
      red_p(7 downto 0) => ScanOut_0_outR(7 downto 0),
      red_s => dvid_0_red_s,
      scanout_en => ScanOut_0_out_scanout_enable,
      vsync => ScanOut_0_vsync
    );
obuf_outputs_0: component design_1_obuf_outputs_0_0
     port map (
      blue_s => dvid_0_blue_s,
      cl_s => dvid_0_cl_s,
      green_s => dvid_0_green_s,
      out_blue_n => obuf_outputs_0_out_blue_n,
      out_blue_p => obuf_outputs_0_out_blue_p,
      out_cl_n => obuf_outputs_0_out_cl_n,
      out_cl_p => obuf_outputs_0_out_cl_p,
      out_green_n => obuf_outputs_0_out_green_n,
      out_green_p => obuf_outputs_0_out_green_p,
      out_red_n => obuf_outputs_0_out_red_n,
      out_red_p => obuf_outputs_0_out_red_p,
      red_s => dvid_0_red_s
    );
scanout_clk_25_175_x10: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => ddr4_0_c0_ddr4_ui_clk,
      clk_x10 => clk_wiz_0_clk_out1,
      clk_x10n => scanout_clk_25_175_x10_clk_x10n,
      pixelclk_x1 => scanout_clk_25_175_x10_pixelclk_x1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ShaderCoreSystem_imp_18IOXXF is
  port (
    CB_Enable : out STD_LOGIC;
    CB_RegComponent : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CB_RegIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CB_WriteInData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CB_WriteMode : out STD_LOGIC;
    CMD_InCommand_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_IsIdle : out STD_LOGIC;
    CMD_IsReadyForCommand_0 : out STD_LOGIC;
    CMD_LoadProgramAddr_0 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_LoadProgramLen_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_SetConstantData_0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CMD_SetConstantIndex_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CMD_SetNumVertexStreams_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamDWORDCount_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamDWORDOffset_0 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CMD_SetVertexStreamDWORDStride_0 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CMD_SetVertexStreamID_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamIsD3DCOLOR_0 : in STD_LOGIC;
    CMD_SetVertexStreamShaderRegIndex_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_ActiveLanesBitmask : out STD_LOGIC_VECTOR ( 16 downto 0 );
    DBG_CurrentDWORD : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_CurrentFetchWave : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_CurrentlyExecutingInstruction : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DBG_InstructionPointer : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DBG_PortW_MUX : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_ReadRegisterOutData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    DBG_ReadRegisterOutDataReady : out STD_LOGIC;
    DBG_ReadRegisterOutRequest : in STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FPU0_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU0_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU1_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU1_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU3_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU3_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPUALL_IADD_GO : out STD_LOGIC;
    FPUALL_ICMP_GO : out STD_LOGIC;
    FPUALL_ICNV_GO : out STD_LOGIC;
    FPUALL_IMUL_GO : out STD_LOGIC;
    FPUALL_IN_MODE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPUALL_ISHFT_GO : out STD_LOGIC;
    FPUALL_ISPEC_GO : out STD_LOGIC;
    GPR0_PortA_en : out STD_LOGIC;
    GPR0_PortA_regChan : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortA_regIdx : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GPR0_PortA_regType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortB_en : out STD_LOGIC;
    GPR0_PortB_regChan : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortB_regIdx : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GPR0_PortB_regType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortW_en : out STD_LOGIC;
    GPR0_PortW_writeInData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    GPR0_ReadQuadIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_WriteQuadIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INDEXOUT_FIFO_full : in STD_LOGIC;
    INDEXOUT_FIFO_wr_data : out STD_LOGIC_VECTOR ( 271 downto 0 );
    INDEXOUT_FIFO_wr_en : out STD_LOGIC;
    OUT_RESULT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    OUT_RESULT1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    OUT_RESULT2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_CyclesExecShaderCode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_Done_0 : in STD_LOGIC;
    VBCacheReadRequests_0_full : in STD_LOGIC;
    VBCacheReadRequests_0_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VBCacheReadRequests_0_wr_en : out STD_LOGIC;
    VBCacheReadResponses_0_empty : in STD_LOGIC;
    VBCacheReadResponses_0_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    VBCacheReadResponses_0_rd_en : out STD_LOGIC;
    VBO_IsIndexedDrawCall : out STD_LOGIC;
    VBO_NumIndices : out STD_LOGIC_VECTOR ( 6 downto 0 );
    VBO_NumVertices : out STD_LOGIC_VECTOR ( 4 downto 0 );
    VBO_Pushed_0 : out STD_LOGIC;
    VBO_Ready_0 : in STD_LOGIC;
    VERTBATCH_FIFO_0_rd_data : in STD_LOGIC_VECTOR ( 543 downto 0 );
    VERTBATCH_FIFO_empty : in STD_LOGIC;
    VERTBATCH_FIFO_rd_en : out STD_LOGIC;
    VERTOUT_FIFO_0_full : in STD_LOGIC;
    VERTOUT_FIFO_0_wr_data : out STD_LOGIC_VECTOR ( 319 downto 0 );
    VERTOUT_FIFO_0_wr_en : out STD_LOGIC;
    VSC_ReadDWORDAddr : out STD_LOGIC_VECTOR ( 21 downto 0 );
    VSC_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VSC_ReadReady : out STD_LOGIC;
    VSC_StreamVBAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VertexCache_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VertexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk_0 : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    portA_readOutData_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    portB_readOutData_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    readOutData : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end ShaderCoreSystem_imp_18IOXXF;

architecture STRUCTURE of ShaderCoreSystem_imp_18IOXXF is
  component design_1_blk_mem_gen_0_8 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_8;
  component design_1_blk_mem_gen_1_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component design_1_blk_mem_gen_1_0;
  component design_1_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_0;
  component design_1_UNORM8ToFloat_0_0 is
  port (
    clk : in STD_LOGIC;
    Enable : in STD_LOGIC;
    D3DColorIn : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatXOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatYOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatZOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FloatWOut : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_UNORM8ToFloat_0_0;
  component design_1_VertexStreamCache_0_0 is
  port (
    clk : in STD_LOGIC;
    VSC_ReadEnable : in STD_LOGIC;
    VSC_ReadStreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_ReadDWORDAddr : in STD_LOGIC_VECTOR ( 21 downto 0 );
    VSC_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VSC_ReadReady : out STD_LOGIC;
    VSC_SetStreamVBAddress : in STD_LOGIC;
    VSC_StreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_StreamVBAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VSC_InvalidateCache : in STD_LOGIC;
    VertexCache_clk : out STD_LOGIC;
    VertexCache_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VertexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_ena : out STD_LOGIC;
    VertexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    VSCReadRequestsFIFO_full : in STD_LOGIC;
    VSCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VSCReadRequestsFIFO_wr_en : out STD_LOGIC;
    VSCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    VSCReadResponsesFIFO_empty : in STD_LOGIC;
    VSCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CacheSetIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CacheElementIndex : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_VertexStreamCache_0_0;
  component design_1_ConstantBuffer_0_0 is
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
  end component design_1_ConstantBuffer_0_0;
  component design_1_FloatALU_0_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OUT_RESULT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISHFT_GO : in STD_LOGIC;
    IMUL_GO : in STD_LOGIC;
    IADD_GO : in STD_LOGIC;
    ICMP_GO : in STD_LOGIC;
    ICNV_GO : in STD_LOGIC;
    ISPEC_GO : in STD_LOGIC;
    IBIT_GO : in STD_LOGIC
  );
  end component design_1_FloatALU_0_0;
  component design_1_FloatALU_1_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OUT_RESULT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISHFT_GO : in STD_LOGIC;
    IMUL_GO : in STD_LOGIC;
    IADD_GO : in STD_LOGIC;
    ICMP_GO : in STD_LOGIC;
    ICNV_GO : in STD_LOGIC;
    ISPEC_GO : in STD_LOGIC;
    IBIT_GO : in STD_LOGIC
  );
  end component design_1_FloatALU_1_0;
  component design_1_FloatALU_2_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OUT_RESULT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISHFT_GO : in STD_LOGIC;
    IMUL_GO : in STD_LOGIC;
    IADD_GO : in STD_LOGIC;
    ICMP_GO : in STD_LOGIC;
    ICNV_GO : in STD_LOGIC;
    ISPEC_GO : in STD_LOGIC;
    IBIT_GO : in STD_LOGIC
  );
  end component design_1_FloatALU_2_0;
  component design_1_FloatALU_3_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OUT_RESULT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISHFT_GO : in STD_LOGIC;
    IMUL_GO : in STD_LOGIC;
    IADD_GO : in STD_LOGIC;
    ICMP_GO : in STD_LOGIC;
    ICNV_GO : in STD_LOGIC;
    ISPEC_GO : in STD_LOGIC;
    IBIT_GO : in STD_LOGIC
  );
  end component design_1_FloatALU_3_0;
  component design_1_ShaderCore_0_0 is
  port (
    clk : in STD_LOGIC;
    CMD_IsIdle : out STD_LOGIC;
    CMD_IsReadyForCommand : out STD_LOGIC;
    CMD_InCommand : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_LoadProgramAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_LoadProgramLen : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_SetConstantIndex : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CMD_SetConstantData : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CMD_SetNumVertexStreams : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamDWORDCount : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamIsD3DCOLOR : in STD_LOGIC;
    CMD_SetVertexStreamShaderRegIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_SetVertexStreamDWORDStride : in STD_LOGIC_VECTOR ( 5 downto 0 );
    CMD_SetVertexStreamDWORDOffset : in STD_LOGIC_VECTOR ( 5 downto 0 );
    VBB_Done : in STD_LOGIC;
    VERTBATCH_FIFO_empty : in STD_LOGIC;
    VERTBATCH_FIFO_rd_data : in STD_LOGIC_VECTOR ( 543 downto 0 );
    VERTBATCH_FIFO_rd_en : out STD_LOGIC;
    VBO_Pushed : out STD_LOGIC;
    VBO_NumVertices : out STD_LOGIC_VECTOR ( 4 downto 0 );
    VBO_NumIndices : out STD_LOGIC_VECTOR ( 6 downto 0 );
    VBO_IsIndexedDrawCall : out STD_LOGIC;
    VBO_Ready : in STD_LOGIC;
    VERTOUT_FIFO_full : in STD_LOGIC;
    VERTOUT_FIFO_wr_data : out STD_LOGIC_VECTOR ( 319 downto 0 );
    VERTOUT_FIFO_wr_en : out STD_LOGIC;
    INDEXOUT_FIFO_full : in STD_LOGIC;
    INDEXOUT_FIFO_wr_data : out STD_LOGIC_VECTOR ( 271 downto 0 );
    INDEXOUT_FIFO_wr_en : out STD_LOGIC;
    VSC_ReadEnable : out STD_LOGIC;
    VSC_ReadStreamIndex : out STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_ReadDWORDAddr : out STD_LOGIC_VECTOR ( 21 downto 0 );
    VSC_ReadData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSC_ReadReady : in STD_LOGIC;
    VSC_SetStreamVBAddress : out STD_LOGIC;
    VSC_StreamIndex : out STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_StreamVBAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VSC_InvalidateCache : out STD_LOGIC;
    ICache_Clk : out STD_LOGIC;
    ICache_Enable : out STD_LOGIC;
    ICache_WriteMode : out STD_LOGIC_VECTOR ( 0 to 0 );
    ICache_Address : out STD_LOGIC_VECTOR ( 8 downto 0 );
    ICache_WriteData : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ICache_ReadData : in STD_LOGIC_VECTOR ( 63 downto 0 );
    CB_Enable : out STD_LOGIC;
    CB_WriteMode : out STD_LOGIC;
    CB_RegIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CB_RegComponent : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CB_ReadOutData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CB_WriteInData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    GPR0_ReadQuadIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_WriteQuadIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortA_en : out STD_LOGIC;
    GPR0_PortA_regType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortA_regIdx : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GPR0_PortA_regChan : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortA_readOutData : in STD_LOGIC_VECTOR ( 127 downto 0 );
    GPR0_PortB_en : out STD_LOGIC;
    GPR0_PortB_regType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortB_regIdx : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GPR0_PortB_regChan : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortB_readOutData : in STD_LOGIC_VECTOR ( 127 downto 0 );
    GPR0_PortW_en : out STD_LOGIC;
    GPR0_PortW_regType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortW_regIdx : out STD_LOGIC_VECTOR ( 2 downto 0 );
    GPR0_PortW_regChan : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPR0_PortW_writeInData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    FPUALL_IN_MODE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPUALL_ISHFT_GO : out STD_LOGIC;
    FPUALL_IMUL_GO : out STD_LOGIC;
    FPUALL_IADD_GO : out STD_LOGIC;
    FPUALL_ICMP_GO : out STD_LOGIC;
    FPUALL_ICNV_GO : out STD_LOGIC;
    FPUALL_ISPEC_GO : out STD_LOGIC;
    FPUALL_IBIT_GO : out STD_LOGIC;
    FPU0_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU0_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU0_OUT_RESULT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU1_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU1_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU1_OUT_RESULT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU2_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU2_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU2_OUT_RESULT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU3_IN_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU3_IN_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU3_OUT_RESULT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UNORM8ToFloat_Enable : out STD_LOGIC;
    UNORM8ToFloat_ColorIn : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UNORM8ToFloat_ConvertedX : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UNORM8ToFloat_ConvertedY : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UNORM8ToFloat_ConvertedZ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UNORM8ToFloat_ConvertedW : in STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesExecShaderCode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_CurrentFetchWave : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentDWORD : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_CurrentStreamID : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_ActiveLanesBitmask : out STD_LOGIC_VECTOR ( 16 downto 0 );
    DBG_InstructionPointer : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DBG_CurrentlyExecutingInstruction : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DBG_CyclesRemainingCurrentInstruction : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_ReadRegisterOutRequest : in STD_LOGIC;
    DBG_ReadRegisterOutDataReady : out STD_LOGIC;
    DBG_ReadRegisterOutData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    DBG_PortW_MUX : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_OStall : out STD_LOGIC;
    DBG_IStall : out STD_LOGIC
  );
  end component design_1_ShaderCore_0_0;
  signal CMD_InCommand_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_LoadProgramAddr_0_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CMD_LoadProgramLen_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CMD_SetConstantData_0_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal CMD_SetConstantIndex_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal CMD_SetNumVertexStreams_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamDWORDCount_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamDWORDOffset_0_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal CMD_SetVertexStreamDWORDStride_0_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal CMD_SetVertexStreamID_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamIsD3DCOLOR_0_1 : STD_LOGIC;
  signal CMD_SetVertexStreamShaderRegIndex_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn1_RD_DATA : STD_LOGIC_VECTOR ( 543 downto 0 );
  signal Conn2_FULL : STD_LOGIC;
  signal Conn2_WR_DATA : STD_LOGIC_VECTOR ( 319 downto 0 );
  signal Conn2_WR_EN : STD_LOGIC;
  signal Conn3_FULL : STD_LOGIC;
  signal Conn3_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal Conn3_WR_EN : STD_LOGIC;
  signal Conn4_EMPTY : STD_LOGIC;
  signal Conn4_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal Conn4_RD_EN : STD_LOGIC;
  signal Conn5_FULL : STD_LOGIC;
  signal Conn5_WR_DATA : STD_LOGIC_VECTOR ( 271 downto 0 );
  signal Conn5_WR_EN : STD_LOGIC;
  signal ConstantBuffer_0_ConstBufferBRAM_ADDR : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal ConstantBuffer_0_ConstBufferBRAM_CLK : STD_LOGIC;
  signal ConstantBuffer_0_ConstBufferBRAM_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ConstantBuffer_0_ConstBufferBRAM_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ConstantBuffer_0_ConstBufferBRAM_EN : STD_LOGIC;
  signal ConstantBuffer_0_ConstBufferBRAM_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ConstantBuffer_0_readOutData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DBG_ReadRegisterOutRequest_1 : STD_LOGIC;
  signal FloatALU_0_OUT_RESULT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FloatALU_1_OUT_RESULT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FloatALU_2_OUT_RESULT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal FloatALU_3_OUT_RESULT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GPRQuadSystem_portA_readOutData_0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal GPRQuadSystem_portB_readOutData_0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCore_0_CB_Enable : STD_LOGIC;
  signal ShaderCore_0_CB_RegComponent : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCore_0_CB_RegIndex : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ShaderCore_0_CB_WriteInData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_CB_WriteMode : STD_LOGIC;
  signal ShaderCore_0_CMD_IsIdle : STD_LOGIC;
  signal ShaderCore_0_CMD_IsReadyForCommand : STD_LOGIC;
  signal ShaderCore_0_DBG_ActiveLanesBitmask : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ShaderCore_0_DBG_CurrentDWORD : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCore_0_DBG_CurrentFetchWave : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ShaderCore_0_DBG_CurrentState : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal ShaderCore_0_DBG_CurrentlyExecutingInstruction : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ShaderCore_0_DBG_InstructionPointer : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ShaderCore_0_DBG_PortW_MUX : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCore_0_DBG_ReadRegisterOutData : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCore_0_DBG_ReadRegisterOutDataReady : STD_LOGIC;
  signal ShaderCore_0_FPU0_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU0_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU1_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU1_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU2_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU2_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU3_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPU3_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_FPUALL_IADD_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_IBIT_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_ICMP_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_ICNV_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_IMUL_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_IN_MODE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCore_0_FPUALL_ISHFT_GO : STD_LOGIC;
  signal ShaderCore_0_FPUALL_ISPEC_GO : STD_LOGIC;
  signal ShaderCore_0_ICache_Address : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ShaderCore_0_ICache_Enable : STD_LOGIC;
  signal ShaderCore_0_ICache_WriteData : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ShaderCore_0_ICache_WriteMode : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ShaderCore_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ShaderCore_0_STAT_CyclesExecShaderCode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_UNORM8ToFloat_ColorIn : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCore_0_UNORM8ToFloat_Enable : STD_LOGIC;
  signal ShaderCore_0_VBO_IsIndexedDrawCall : STD_LOGIC;
  signal ShaderCore_0_VBO_NumIndices : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ShaderCore_0_VBO_NumVertices : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ShaderCore_0_VBO_Pushed : STD_LOGIC;
  signal ShaderCore_0_VERTBATCH_FIFO_rd_en : STD_LOGIC;
  signal ShaderCore_0_VSC_InvalidateCache : STD_LOGIC;
  signal ShaderCore_0_VSC_ReadDWORDAddr : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal ShaderCore_0_VSC_ReadEnable : STD_LOGIC;
  signal ShaderCore_0_VSC_ReadStreamIndex : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCore_0_VSC_SetStreamVBAddress : STD_LOGIC;
  signal ShaderCore_0_VSC_StreamIndex : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCore_0_VSC_StreamVBAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal UNORM8ToFloat_0_FloatWOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal UNORM8ToFloat_0_FloatXOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal UNORM8ToFloat_0_FloatYOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal UNORM8ToFloat_0_FloatZOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VBB_Done_0_1 : STD_LOGIC;
  signal VBO_Ready_0_1 : STD_LOGIC;
  signal VB_Cache_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VERTBATCH_FIFO_empty_1 : STD_LOGIC;
  signal VertexStreamCache_0_DBG_State : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VertexStreamCache_0_VBCache_CLK : STD_LOGIC;
  signal VertexStreamCache_0_VBCache_EN : STD_LOGIC;
  signal VertexStreamCache_0_VBCache_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VertexStreamCache_0_VSC_ReadData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VertexStreamCache_0_VSC_ReadReady : STD_LOGIC;
  signal VertexStreamCache_0_VertexCache_addra : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal VertexStreamCache_0_VertexCache_dina : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal blk_mem_gen_1_douta : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal portA_en_0_1 : STD_LOGIC;
  signal portA_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portA_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portA_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portB_en_0_1 : STD_LOGIC;
  signal portB_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portB_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portB_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_en_0_1 : STD_LOGIC;
  signal portW_regChan_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_regIdx_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal portW_regType_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal portW_writeInData_0_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal readQuadIndex_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal writeQuadIndex_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ShaderCore_0_DBG_IStall_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCore_0_DBG_OStall_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCore_0_ICache_Clk_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCore_0_DBG_CurrentStreamID_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_ShaderCore_0_DBG_CyclesRemainingCurrentInstruction_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_VertexStreamCache_0_DBG_CacheElementIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_VertexStreamCache_0_DBG_CacheSetIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
begin
  CB_Enable <= ShaderCore_0_CB_Enable;
  CB_RegComponent(1 downto 0) <= ShaderCore_0_CB_RegComponent(1 downto 0);
  CB_RegIndex(7 downto 0) <= ShaderCore_0_CB_RegIndex(7 downto 0);
  CB_WriteInData(31 downto 0) <= ShaderCore_0_CB_WriteInData(31 downto 0);
  CB_WriteMode <= ShaderCore_0_CB_WriteMode;
  CMD_InCommand_0_1(2 downto 0) <= CMD_InCommand_0(2 downto 0);
  CMD_IsIdle <= ShaderCore_0_CMD_IsIdle;
  CMD_IsReadyForCommand_0 <= ShaderCore_0_CMD_IsReadyForCommand;
  CMD_LoadProgramAddr_0_1(29 downto 0) <= CMD_LoadProgramAddr_0(29 downto 0);
  CMD_LoadProgramLen_0_1(15 downto 0) <= CMD_LoadProgramLen_0(15 downto 0);
  CMD_SetConstantData_0_1(127 downto 0) <= CMD_SetConstantData_0(127 downto 0);
  CMD_SetConstantIndex_0_1(7 downto 0) <= CMD_SetConstantIndex_0(7 downto 0);
  CMD_SetNumVertexStreams_0_1(2 downto 0) <= CMD_SetNumVertexStreams_0(2 downto 0);
  CMD_SetVertexStreamDWORDCount_0_1(2 downto 0) <= CMD_SetVertexStreamDWORDCount_0(2 downto 0);
  CMD_SetVertexStreamDWORDOffset_0_1(5 downto 0) <= CMD_SetVertexStreamDWORDOffset_0(5 downto 0);
  CMD_SetVertexStreamDWORDStride_0_1(5 downto 0) <= CMD_SetVertexStreamDWORDStride_0(5 downto 0);
  CMD_SetVertexStreamID_0_1(2 downto 0) <= CMD_SetVertexStreamID_0(2 downto 0);
  CMD_SetVertexStreamIsD3DCOLOR_0_1 <= CMD_SetVertexStreamIsD3DCOLOR_0;
  CMD_SetVertexStreamShaderRegIndex_0_1(2 downto 0) <= CMD_SetVertexStreamShaderRegIndex_0(2 downto 0);
  Conn1_RD_DATA(543 downto 0) <= VERTBATCH_FIFO_0_rd_data(543 downto 0);
  Conn2_FULL <= VERTOUT_FIFO_0_full;
  Conn3_FULL <= VBCacheReadRequests_0_full;
  Conn4_EMPTY <= VBCacheReadResponses_0_empty;
  Conn4_RD_DATA(255 downto 0) <= VBCacheReadResponses_0_rd_data(255 downto 0);
  Conn5_FULL <= INDEXOUT_FIFO_full;
  DBG_ActiveLanesBitmask(16 downto 0) <= ShaderCore_0_DBG_ActiveLanesBitmask(16 downto 0);
  DBG_CurrentDWORD(2 downto 0) <= ShaderCore_0_DBG_CurrentDWORD(2 downto 0);
  DBG_CurrentFetchWave(3 downto 0) <= ShaderCore_0_DBG_CurrentFetchWave(3 downto 0);
  DBG_CurrentState(5 downto 0) <= ShaderCore_0_DBG_CurrentState(5 downto 0);
  DBG_CurrentlyExecutingInstruction(63 downto 0) <= ShaderCore_0_DBG_CurrentlyExecutingInstruction(63 downto 0);
  DBG_InstructionPointer(8 downto 0) <= ShaderCore_0_DBG_InstructionPointer(8 downto 0);
  DBG_PortW_MUX(1 downto 0) <= ShaderCore_0_DBG_PortW_MUX(1 downto 0);
  DBG_ReadRegisterOutData(127 downto 0) <= ShaderCore_0_DBG_ReadRegisterOutData(127 downto 0);
  DBG_ReadRegisterOutDataReady <= ShaderCore_0_DBG_ReadRegisterOutDataReady;
  DBG_ReadRegisterOutRequest_1 <= DBG_ReadRegisterOutRequest;
  DBG_State(3 downto 0) <= VertexStreamCache_0_DBG_State(3 downto 0);
  FPU0_IN_A(31 downto 0) <= ShaderCore_0_FPU0_IN_A(31 downto 0);
  FPU0_IN_B(31 downto 0) <= ShaderCore_0_FPU0_IN_B(31 downto 0);
  FPU1_IN_A(31 downto 0) <= ShaderCore_0_FPU1_IN_A(31 downto 0);
  FPU1_IN_B(31 downto 0) <= ShaderCore_0_FPU1_IN_B(31 downto 0);
  FPU3_IN_A(31 downto 0) <= ShaderCore_0_FPU3_IN_A(31 downto 0);
  FPU3_IN_B(31 downto 0) <= ShaderCore_0_FPU3_IN_B(31 downto 0);
  FPUALL_IADD_GO <= ShaderCore_0_FPUALL_IADD_GO;
  FPUALL_ICMP_GO <= ShaderCore_0_FPUALL_ICMP_GO;
  FPUALL_ICNV_GO <= ShaderCore_0_FPUALL_ICNV_GO;
  FPUALL_IMUL_GO <= ShaderCore_0_FPUALL_IMUL_GO;
  FPUALL_IN_MODE(2 downto 0) <= ShaderCore_0_FPUALL_IN_MODE(2 downto 0);
  FPUALL_ISHFT_GO <= ShaderCore_0_FPUALL_ISHFT_GO;
  FPUALL_ISPEC_GO <= ShaderCore_0_FPUALL_ISPEC_GO;
  GPR0_PortA_en <= portA_en_0_1;
  GPR0_PortA_regChan(1 downto 0) <= portA_regChan_0_1(1 downto 0);
  GPR0_PortA_regIdx(2 downto 0) <= portA_regIdx_0_1(2 downto 0);
  GPR0_PortA_regType(1 downto 0) <= portA_regType_0_1(1 downto 0);
  GPR0_PortB_en <= portB_en_0_1;
  GPR0_PortB_regChan(1 downto 0) <= portB_regChan_0_1(1 downto 0);
  GPR0_PortB_regIdx(2 downto 0) <= portB_regIdx_0_1(2 downto 0);
  GPR0_PortB_regType(1 downto 0) <= portB_regType_0_1(1 downto 0);
  GPR0_PortW_en <= portW_en_0_1;
  GPR0_PortW_writeInData(127 downto 0) <= portW_writeInData_0_1(127 downto 0);
  GPR0_ReadQuadIndex(1 downto 0) <= readQuadIndex_0_1(1 downto 0);
  GPR0_WriteQuadIndex(1 downto 0) <= writeQuadIndex_0_1(1 downto 0);
  INDEXOUT_FIFO_wr_data(271 downto 0) <= Conn5_WR_DATA(271 downto 0);
  INDEXOUT_FIFO_wr_en <= Conn5_WR_EN;
  OUT_RESULT(31 downto 0) <= FloatALU_0_OUT_RESULT(31 downto 0);
  OUT_RESULT1(31 downto 0) <= FloatALU_1_OUT_RESULT(31 downto 0);
  OUT_RESULT2(31 downto 0) <= FloatALU_3_OUT_RESULT(31 downto 0);
  STAT_CurrentDrawEventID(15 downto 0) <= ShaderCore_0_STAT_CurrentDrawEventID(15 downto 0);
  STAT_CyclesExecShaderCode(31 downto 0) <= ShaderCore_0_STAT_CyclesExecShaderCode(31 downto 0);
  STAT_CyclesIdle(31 downto 0) <= ShaderCore_0_STAT_CyclesIdle(31 downto 0);
  STAT_CyclesSpentWorking(31 downto 0) <= ShaderCore_0_STAT_CyclesSpentWorking(31 downto 0);
  STAT_CyclesWaitingForOutput(31 downto 0) <= ShaderCore_0_STAT_CyclesWaitingForOutput(31 downto 0);
  VBB_Done_0_1 <= VBB_Done_0;
  VBCacheReadRequests_0_wr_data(29 downto 0) <= Conn3_WR_DATA(29 downto 0);
  VBCacheReadRequests_0_wr_en <= Conn3_WR_EN;
  VBCacheReadResponses_0_rd_en <= Conn4_RD_EN;
  VBO_IsIndexedDrawCall <= ShaderCore_0_VBO_IsIndexedDrawCall;
  VBO_NumIndices(6 downto 0) <= ShaderCore_0_VBO_NumIndices(6 downto 0);
  VBO_NumVertices(4 downto 0) <= ShaderCore_0_VBO_NumVertices(4 downto 0);
  VBO_Pushed_0 <= ShaderCore_0_VBO_Pushed;
  VBO_Ready_0_1 <= VBO_Ready_0;
  VERTBATCH_FIFO_empty_1 <= VERTBATCH_FIFO_empty;
  VERTBATCH_FIFO_rd_en <= ShaderCore_0_VERTBATCH_FIFO_rd_en;
  VERTOUT_FIFO_0_wr_data(319 downto 0) <= Conn2_WR_DATA(319 downto 0);
  VERTOUT_FIFO_0_wr_en <= Conn2_WR_EN;
  VSC_ReadDWORDAddr(21 downto 0) <= ShaderCore_0_VSC_ReadDWORDAddr(21 downto 0);
  VSC_ReadData(31 downto 0) <= VertexStreamCache_0_VSC_ReadData(31 downto 0);
  VSC_ReadReady <= VertexStreamCache_0_VSC_ReadReady;
  VSC_StreamVBAddress(29 downto 0) <= ShaderCore_0_VSC_StreamVBAddress(29 downto 0);
  VertexCache_addra(9 downto 0) <= VertexStreamCache_0_VertexCache_addra(9 downto 0);
  VertexCache_dina(31 downto 0) <= VertexStreamCache_0_VertexCache_dina(31 downto 0);
  clk_0_1 <= clk_0;
  douta(31 downto 0) <= VB_Cache_douta(31 downto 0);
  portA_readOutData_0(127 downto 0) <= GPRQuadSystem_portA_readOutData_0(127 downto 0);
  portB_readOutData_0(127 downto 0) <= GPRQuadSystem_portB_readOutData_0(127 downto 0);
  readOutData(31 downto 0) <= ConstantBuffer_0_readOutData(31 downto 0);
ConstantBuffer_0: component design_1_ConstantBuffer_0_0
     port map (
      ConstBufferBRAM_addra(9 downto 0) => ConstantBuffer_0_ConstBufferBRAM_ADDR(9 downto 0),
      ConstBufferBRAM_clka => ConstantBuffer_0_ConstBufferBRAM_CLK,
      ConstBufferBRAM_dina(31 downto 0) => ConstantBuffer_0_ConstBufferBRAM_DIN(31 downto 0),
      ConstBufferBRAM_douta(31 downto 0) => ConstantBuffer_0_ConstBufferBRAM_DOUT(31 downto 0),
      ConstBufferBRAM_ena => ConstantBuffer_0_ConstBufferBRAM_EN,
      ConstBufferBRAM_wea(0) => ConstantBuffer_0_ConstBufferBRAM_WE(0),
      clk => clk_0_1,
      enable => ShaderCore_0_CB_Enable,
      readOutData(31 downto 0) => ConstantBuffer_0_readOutData(31 downto 0),
      regComponent(1 downto 0) => ShaderCore_0_CB_RegComponent(1 downto 0),
      regIndex(7 downto 0) => ShaderCore_0_CB_RegIndex(7 downto 0),
      writeInData(31 downto 0) => ShaderCore_0_CB_WriteInData(31 downto 0),
      writeMode => ShaderCore_0_CB_WriteMode
    );
ConstantBuffer_BRAM: component design_1_blk_mem_gen_0_0
     port map (
      addra(9 downto 0) => ConstantBuffer_0_ConstBufferBRAM_ADDR(9 downto 0),
      clka => ConstantBuffer_0_ConstBufferBRAM_CLK,
      dina(31 downto 0) => ConstantBuffer_0_ConstBufferBRAM_DIN(31 downto 0),
      douta(31 downto 0) => ConstantBuffer_0_ConstBufferBRAM_DOUT(31 downto 0),
      ena => ConstantBuffer_0_ConstBufferBRAM_EN,
      wea(0) => ConstantBuffer_0_ConstBufferBRAM_WE(0)
    );
FloatALU_0: component design_1_FloatALU_0_0
     port map (
      IADD_GO => ShaderCore_0_FPUALL_IADD_GO,
      IBIT_GO => ShaderCore_0_FPUALL_IBIT_GO,
      ICMP_GO => ShaderCore_0_FPUALL_ICMP_GO,
      ICNV_GO => ShaderCore_0_FPUALL_ICNV_GO,
      IMUL_GO => ShaderCore_0_FPUALL_IMUL_GO,
      IN_A(31 downto 0) => ShaderCore_0_FPU0_IN_A(31 downto 0),
      IN_B(31 downto 0) => ShaderCore_0_FPU0_IN_B(31 downto 0),
      IN_MODE(2 downto 0) => ShaderCore_0_FPUALL_IN_MODE(2 downto 0),
      ISHFT_GO => ShaderCore_0_FPUALL_ISHFT_GO,
      ISPEC_GO => ShaderCore_0_FPUALL_ISPEC_GO,
      OUT_RESULT(31 downto 0) => FloatALU_0_OUT_RESULT(31 downto 0),
      clk => clk_0_1
    );
FloatALU_1: component design_1_FloatALU_1_0
     port map (
      IADD_GO => ShaderCore_0_FPUALL_IADD_GO,
      IBIT_GO => ShaderCore_0_FPUALL_IBIT_GO,
      ICMP_GO => ShaderCore_0_FPUALL_ICMP_GO,
      ICNV_GO => ShaderCore_0_FPUALL_ICNV_GO,
      IMUL_GO => ShaderCore_0_FPUALL_IMUL_GO,
      IN_A(31 downto 0) => ShaderCore_0_FPU1_IN_A(31 downto 0),
      IN_B(31 downto 0) => ShaderCore_0_FPU1_IN_B(31 downto 0),
      IN_MODE(2 downto 0) => ShaderCore_0_FPUALL_IN_MODE(2 downto 0),
      ISHFT_GO => ShaderCore_0_FPUALL_ISHFT_GO,
      ISPEC_GO => ShaderCore_0_FPUALL_ISPEC_GO,
      OUT_RESULT(31 downto 0) => FloatALU_1_OUT_RESULT(31 downto 0),
      clk => clk_0_1
    );
FloatALU_2: component design_1_FloatALU_2_0
     port map (
      IADD_GO => ShaderCore_0_FPUALL_IADD_GO,
      IBIT_GO => ShaderCore_0_FPUALL_IBIT_GO,
      ICMP_GO => ShaderCore_0_FPUALL_ICMP_GO,
      ICNV_GO => ShaderCore_0_FPUALL_ICNV_GO,
      IMUL_GO => ShaderCore_0_FPUALL_IMUL_GO,
      IN_A(31 downto 0) => ShaderCore_0_FPU2_IN_A(31 downto 0),
      IN_B(31 downto 0) => ShaderCore_0_FPU2_IN_B(31 downto 0),
      IN_MODE(2 downto 0) => ShaderCore_0_FPUALL_IN_MODE(2 downto 0),
      ISHFT_GO => ShaderCore_0_FPUALL_ISHFT_GO,
      ISPEC_GO => ShaderCore_0_FPUALL_ISPEC_GO,
      OUT_RESULT(31 downto 0) => FloatALU_2_OUT_RESULT(31 downto 0),
      clk => clk_0_1
    );
FloatALU_3: component design_1_FloatALU_3_0
     port map (
      IADD_GO => ShaderCore_0_FPUALL_IADD_GO,
      IBIT_GO => ShaderCore_0_FPUALL_IBIT_GO,
      ICMP_GO => ShaderCore_0_FPUALL_ICMP_GO,
      ICNV_GO => ShaderCore_0_FPUALL_ICNV_GO,
      IMUL_GO => ShaderCore_0_FPUALL_IMUL_GO,
      IN_A(31 downto 0) => ShaderCore_0_FPU3_IN_A(31 downto 0),
      IN_B(31 downto 0) => ShaderCore_0_FPU3_IN_B(31 downto 0),
      IN_MODE(2 downto 0) => ShaderCore_0_FPUALL_IN_MODE(2 downto 0),
      ISHFT_GO => ShaderCore_0_FPUALL_ISHFT_GO,
      ISPEC_GO => ShaderCore_0_FPUALL_ISPEC_GO,
      OUT_RESULT(31 downto 0) => FloatALU_3_OUT_RESULT(31 downto 0),
      clk => clk_0_1
    );
GPRQuadSystem: entity work.GPRQuadSystem_imp_13ZJ6LX
     port map (
      clk_0 => clk_0_1,
      portA_en_0 => portA_en_0_1,
      portA_readOutData_0(127 downto 0) => GPRQuadSystem_portA_readOutData_0(127 downto 0),
      portA_regChan_0(1 downto 0) => portA_regChan_0_1(1 downto 0),
      portA_regIdx_0(2 downto 0) => portA_regIdx_0_1(2 downto 0),
      portA_regType_0(1 downto 0) => portA_regType_0_1(1 downto 0),
      portB_en_0 => portB_en_0_1,
      portB_readOutData_0(127 downto 0) => GPRQuadSystem_portB_readOutData_0(127 downto 0),
      portB_regChan_0(1 downto 0) => portB_regChan_0_1(1 downto 0),
      portB_regIdx_0(2 downto 0) => portB_regIdx_0_1(2 downto 0),
      portB_regType_0(1 downto 0) => portB_regType_0_1(1 downto 0),
      portW_en_0 => portW_en_0_1,
      portW_regChan_0(1 downto 0) => portW_regChan_0_1(1 downto 0),
      portW_regIdx_0(2 downto 0) => portW_regIdx_0_1(2 downto 0),
      portW_regType_0(1 downto 0) => portW_regType_0_1(1 downto 0),
      portW_writeInData_0(127 downto 0) => portW_writeInData_0_1(127 downto 0),
      readQuadIndex_0(1 downto 0) => readQuadIndex_0_1(1 downto 0),
      writeQuadIndex_0(1 downto 0) => writeQuadIndex_0_1(1 downto 0)
    );
InstructionCache: component design_1_blk_mem_gen_1_0
     port map (
      addra(8 downto 0) => ShaderCore_0_ICache_Address(8 downto 0),
      clka => clk_0_1,
      dina(63 downto 0) => ShaderCore_0_ICache_WriteData(63 downto 0),
      douta(63 downto 0) => blk_mem_gen_1_douta(63 downto 0),
      ena => ShaderCore_0_ICache_Enable,
      wea(0) => ShaderCore_0_ICache_WriteMode(0)
    );
ShaderCore_0: component design_1_ShaderCore_0_0
     port map (
      CB_Enable => ShaderCore_0_CB_Enable,
      CB_ReadOutData(31 downto 0) => ConstantBuffer_0_readOutData(31 downto 0),
      CB_RegComponent(1 downto 0) => ShaderCore_0_CB_RegComponent(1 downto 0),
      CB_RegIndex(7 downto 0) => ShaderCore_0_CB_RegIndex(7 downto 0),
      CB_WriteInData(31 downto 0) => ShaderCore_0_CB_WriteInData(31 downto 0),
      CB_WriteMode => ShaderCore_0_CB_WriteMode,
      CMD_InCommand(2 downto 0) => CMD_InCommand_0_1(2 downto 0),
      CMD_IsIdle => ShaderCore_0_CMD_IsIdle,
      CMD_IsReadyForCommand => ShaderCore_0_CMD_IsReadyForCommand,
      CMD_LoadProgramAddr(29 downto 0) => CMD_LoadProgramAddr_0_1(29 downto 0),
      CMD_LoadProgramLen(15 downto 0) => CMD_LoadProgramLen_0_1(15 downto 0),
      CMD_SetConstantData(127 downto 0) => CMD_SetConstantData_0_1(127 downto 0),
      CMD_SetConstantIndex(7 downto 0) => CMD_SetConstantIndex_0_1(7 downto 0),
      CMD_SetNumVertexStreams(2 downto 0) => CMD_SetNumVertexStreams_0_1(2 downto 0),
      CMD_SetVertexStreamDWORDCount(2 downto 0) => CMD_SetVertexStreamDWORDCount_0_1(2 downto 0),
      CMD_SetVertexStreamDWORDOffset(5 downto 0) => CMD_SetVertexStreamDWORDOffset_0_1(5 downto 0),
      CMD_SetVertexStreamDWORDStride(5 downto 0) => CMD_SetVertexStreamDWORDStride_0_1(5 downto 0),
      CMD_SetVertexStreamID(2 downto 0) => CMD_SetVertexStreamID_0_1(2 downto 0),
      CMD_SetVertexStreamIsD3DCOLOR => CMD_SetVertexStreamIsD3DCOLOR_0_1,
      CMD_SetVertexStreamShaderRegIndex(2 downto 0) => CMD_SetVertexStreamShaderRegIndex_0_1(2 downto 0),
      DBG_ActiveLanesBitmask(16 downto 0) => ShaderCore_0_DBG_ActiveLanesBitmask(16 downto 0),
      DBG_CurrentDWORD(2 downto 0) => ShaderCore_0_DBG_CurrentDWORD(2 downto 0),
      DBG_CurrentFetchWave(3 downto 0) => ShaderCore_0_DBG_CurrentFetchWave(3 downto 0),
      DBG_CurrentState(5 downto 0) => ShaderCore_0_DBG_CurrentState(5 downto 0),
      DBG_CurrentStreamID(2 downto 0) => NLW_ShaderCore_0_DBG_CurrentStreamID_UNCONNECTED(2 downto 0),
      DBG_CurrentlyExecutingInstruction(63 downto 0) => ShaderCore_0_DBG_CurrentlyExecutingInstruction(63 downto 0),
      DBG_CyclesRemainingCurrentInstruction(4 downto 0) => NLW_ShaderCore_0_DBG_CyclesRemainingCurrentInstruction_UNCONNECTED(4 downto 0),
      DBG_IStall => NLW_ShaderCore_0_DBG_IStall_UNCONNECTED,
      DBG_InstructionPointer(8 downto 0) => ShaderCore_0_DBG_InstructionPointer(8 downto 0),
      DBG_OStall => NLW_ShaderCore_0_DBG_OStall_UNCONNECTED,
      DBG_PortW_MUX(1 downto 0) => ShaderCore_0_DBG_PortW_MUX(1 downto 0),
      DBG_ReadRegisterOutData(127 downto 0) => ShaderCore_0_DBG_ReadRegisterOutData(127 downto 0),
      DBG_ReadRegisterOutDataReady => ShaderCore_0_DBG_ReadRegisterOutDataReady,
      DBG_ReadRegisterOutRequest => DBG_ReadRegisterOutRequest_1,
      FPU0_IN_A(31 downto 0) => ShaderCore_0_FPU0_IN_A(31 downto 0),
      FPU0_IN_B(31 downto 0) => ShaderCore_0_FPU0_IN_B(31 downto 0),
      FPU0_OUT_RESULT(31 downto 0) => FloatALU_0_OUT_RESULT(31 downto 0),
      FPU1_IN_A(31 downto 0) => ShaderCore_0_FPU1_IN_A(31 downto 0),
      FPU1_IN_B(31 downto 0) => ShaderCore_0_FPU1_IN_B(31 downto 0),
      FPU1_OUT_RESULT(31 downto 0) => FloatALU_1_OUT_RESULT(31 downto 0),
      FPU2_IN_A(31 downto 0) => ShaderCore_0_FPU2_IN_A(31 downto 0),
      FPU2_IN_B(31 downto 0) => ShaderCore_0_FPU2_IN_B(31 downto 0),
      FPU2_OUT_RESULT(31 downto 0) => FloatALU_2_OUT_RESULT(31 downto 0),
      FPU3_IN_A(31 downto 0) => ShaderCore_0_FPU3_IN_A(31 downto 0),
      FPU3_IN_B(31 downto 0) => ShaderCore_0_FPU3_IN_B(31 downto 0),
      FPU3_OUT_RESULT(31 downto 0) => FloatALU_3_OUT_RESULT(31 downto 0),
      FPUALL_IADD_GO => ShaderCore_0_FPUALL_IADD_GO,
      FPUALL_IBIT_GO => ShaderCore_0_FPUALL_IBIT_GO,
      FPUALL_ICMP_GO => ShaderCore_0_FPUALL_ICMP_GO,
      FPUALL_ICNV_GO => ShaderCore_0_FPUALL_ICNV_GO,
      FPUALL_IMUL_GO => ShaderCore_0_FPUALL_IMUL_GO,
      FPUALL_IN_MODE(2 downto 0) => ShaderCore_0_FPUALL_IN_MODE(2 downto 0),
      FPUALL_ISHFT_GO => ShaderCore_0_FPUALL_ISHFT_GO,
      FPUALL_ISPEC_GO => ShaderCore_0_FPUALL_ISPEC_GO,
      GPR0_PortA_en => portA_en_0_1,
      GPR0_PortA_readOutData(127 downto 0) => GPRQuadSystem_portA_readOutData_0(127 downto 0),
      GPR0_PortA_regChan(1 downto 0) => portA_regChan_0_1(1 downto 0),
      GPR0_PortA_regIdx(2 downto 0) => portA_regIdx_0_1(2 downto 0),
      GPR0_PortA_regType(1 downto 0) => portA_regType_0_1(1 downto 0),
      GPR0_PortB_en => portB_en_0_1,
      GPR0_PortB_readOutData(127 downto 0) => GPRQuadSystem_portB_readOutData_0(127 downto 0),
      GPR0_PortB_regChan(1 downto 0) => portB_regChan_0_1(1 downto 0),
      GPR0_PortB_regIdx(2 downto 0) => portB_regIdx_0_1(2 downto 0),
      GPR0_PortB_regType(1 downto 0) => portB_regType_0_1(1 downto 0),
      GPR0_PortW_en => portW_en_0_1,
      GPR0_PortW_regChan(1 downto 0) => portW_regChan_0_1(1 downto 0),
      GPR0_PortW_regIdx(2 downto 0) => portW_regIdx_0_1(2 downto 0),
      GPR0_PortW_regType(1 downto 0) => portW_regType_0_1(1 downto 0),
      GPR0_PortW_writeInData(127 downto 0) => portW_writeInData_0_1(127 downto 0),
      GPR0_ReadQuadIndex(1 downto 0) => readQuadIndex_0_1(1 downto 0),
      GPR0_WriteQuadIndex(1 downto 0) => writeQuadIndex_0_1(1 downto 0),
      ICache_Address(8 downto 0) => ShaderCore_0_ICache_Address(8 downto 0),
      ICache_Clk => NLW_ShaderCore_0_ICache_Clk_UNCONNECTED,
      ICache_Enable => ShaderCore_0_ICache_Enable,
      ICache_ReadData(63 downto 0) => blk_mem_gen_1_douta(63 downto 0),
      ICache_WriteData(63 downto 0) => ShaderCore_0_ICache_WriteData(63 downto 0),
      ICache_WriteMode(0) => ShaderCore_0_ICache_WriteMode(0),
      INDEXOUT_FIFO_full => Conn5_FULL,
      INDEXOUT_FIFO_wr_data(271 downto 0) => Conn5_WR_DATA(271 downto 0),
      INDEXOUT_FIFO_wr_en => Conn5_WR_EN,
      STAT_CurrentDrawEventID(15 downto 0) => ShaderCore_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesExecShaderCode(31 downto 0) => ShaderCore_0_STAT_CyclesExecShaderCode(31 downto 0),
      STAT_CyclesIdle(31 downto 0) => ShaderCore_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => ShaderCore_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => ShaderCore_0_STAT_CyclesWaitingForOutput(31 downto 0),
      UNORM8ToFloat_ColorIn(31 downto 0) => ShaderCore_0_UNORM8ToFloat_ColorIn(31 downto 0),
      UNORM8ToFloat_ConvertedW(31 downto 0) => UNORM8ToFloat_0_FloatWOut(31 downto 0),
      UNORM8ToFloat_ConvertedX(31 downto 0) => UNORM8ToFloat_0_FloatXOut(31 downto 0),
      UNORM8ToFloat_ConvertedY(31 downto 0) => UNORM8ToFloat_0_FloatYOut(31 downto 0),
      UNORM8ToFloat_ConvertedZ(31 downto 0) => UNORM8ToFloat_0_FloatZOut(31 downto 0),
      UNORM8ToFloat_Enable => ShaderCore_0_UNORM8ToFloat_Enable,
      VBB_Done => VBB_Done_0_1,
      VBO_IsIndexedDrawCall => ShaderCore_0_VBO_IsIndexedDrawCall,
      VBO_NumIndices(6 downto 0) => ShaderCore_0_VBO_NumIndices(6 downto 0),
      VBO_NumVertices(4 downto 0) => ShaderCore_0_VBO_NumVertices(4 downto 0),
      VBO_Pushed => ShaderCore_0_VBO_Pushed,
      VBO_Ready => VBO_Ready_0_1,
      VERTBATCH_FIFO_empty => VERTBATCH_FIFO_empty_1,
      VERTBATCH_FIFO_rd_data(543 downto 0) => Conn1_RD_DATA(543 downto 0),
      VERTBATCH_FIFO_rd_en => ShaderCore_0_VERTBATCH_FIFO_rd_en,
      VERTOUT_FIFO_full => Conn2_FULL,
      VERTOUT_FIFO_wr_data(319 downto 0) => Conn2_WR_DATA(319 downto 0),
      VERTOUT_FIFO_wr_en => Conn2_WR_EN,
      VSC_InvalidateCache => ShaderCore_0_VSC_InvalidateCache,
      VSC_ReadDWORDAddr(21 downto 0) => ShaderCore_0_VSC_ReadDWORDAddr(21 downto 0),
      VSC_ReadData(31 downto 0) => VertexStreamCache_0_VSC_ReadData(31 downto 0),
      VSC_ReadEnable => ShaderCore_0_VSC_ReadEnable,
      VSC_ReadReady => VertexStreamCache_0_VSC_ReadReady,
      VSC_ReadStreamIndex(2 downto 0) => ShaderCore_0_VSC_ReadStreamIndex(2 downto 0),
      VSC_SetStreamVBAddress => ShaderCore_0_VSC_SetStreamVBAddress,
      VSC_StreamIndex(2 downto 0) => ShaderCore_0_VSC_StreamIndex(2 downto 0),
      VSC_StreamVBAddress(29 downto 0) => ShaderCore_0_VSC_StreamVBAddress(29 downto 0),
      clk => clk_0_1
    );
UNORM8ToFloat_0: component design_1_UNORM8ToFloat_0_0
     port map (
      D3DColorIn(31 downto 0) => ShaderCore_0_UNORM8ToFloat_ColorIn(31 downto 0),
      Enable => ShaderCore_0_UNORM8ToFloat_Enable,
      FloatWOut(31 downto 0) => UNORM8ToFloat_0_FloatWOut(31 downto 0),
      FloatXOut(31 downto 0) => UNORM8ToFloat_0_FloatXOut(31 downto 0),
      FloatYOut(31 downto 0) => UNORM8ToFloat_0_FloatYOut(31 downto 0),
      FloatZOut(31 downto 0) => UNORM8ToFloat_0_FloatZOut(31 downto 0),
      clk => clk_0_1
    );
VB_Cache: component design_1_blk_mem_gen_0_8
     port map (
      addra(9 downto 0) => VertexStreamCache_0_VertexCache_addra(9 downto 0),
      clka => VertexStreamCache_0_VBCache_CLK,
      dina(31 downto 0) => VertexStreamCache_0_VertexCache_dina(31 downto 0),
      douta(31 downto 0) => VB_Cache_douta(31 downto 0),
      ena => VertexStreamCache_0_VBCache_EN,
      wea(0) => VertexStreamCache_0_VBCache_WE(0)
    );
VertexStreamCache_0: component design_1_VertexStreamCache_0_0
     port map (
      DBG_CacheElementIndex(1 downto 0) => NLW_VertexStreamCache_0_DBG_CacheElementIndex_UNCONNECTED(1 downto 0),
      DBG_CacheSetIndex(4 downto 0) => NLW_VertexStreamCache_0_DBG_CacheSetIndex_UNCONNECTED(4 downto 0),
      DBG_State(3 downto 0) => VertexStreamCache_0_DBG_State(3 downto 0),
      VSCReadRequestsFIFO_full => Conn3_FULL,
      VSCReadRequestsFIFO_wr_data(29 downto 0) => Conn3_WR_DATA(29 downto 0),
      VSCReadRequestsFIFO_wr_en => Conn3_WR_EN,
      VSCReadResponsesFIFO_empty => Conn4_EMPTY,
      VSCReadResponsesFIFO_rd_data(255 downto 0) => Conn4_RD_DATA(255 downto 0),
      VSCReadResponsesFIFO_rd_en => Conn4_RD_EN,
      VSC_InvalidateCache => ShaderCore_0_VSC_InvalidateCache,
      VSC_ReadDWORDAddr(21 downto 0) => ShaderCore_0_VSC_ReadDWORDAddr(21 downto 0),
      VSC_ReadData(31 downto 0) => VertexStreamCache_0_VSC_ReadData(31 downto 0),
      VSC_ReadEnable => ShaderCore_0_VSC_ReadEnable,
      VSC_ReadReady => VertexStreamCache_0_VSC_ReadReady,
      VSC_ReadStreamIndex(2 downto 0) => ShaderCore_0_VSC_ReadStreamIndex(2 downto 0),
      VSC_SetStreamVBAddress => ShaderCore_0_VSC_SetStreamVBAddress,
      VSC_StreamIndex(2 downto 0) => ShaderCore_0_VSC_StreamIndex(2 downto 0),
      VSC_StreamVBAddress(29 downto 0) => ShaderCore_0_VSC_StreamVBAddress(29 downto 0),
      VertexCache_addra(9 downto 0) => VertexStreamCache_0_VertexCache_addra(9 downto 0),
      VertexCache_clk => VertexStreamCache_0_VBCache_CLK,
      VertexCache_dina(31 downto 0) => VertexStreamCache_0_VertexCache_dina(31 downto 0),
      VertexCache_douta(31 downto 0) => VB_Cache_douta(31 downto 0),
      VertexCache_ena => VertexStreamCache_0_VBCache_EN,
      VertexCache_wea(0) => VertexStreamCache_0_VBCache_WE(0),
      clk => clk_0_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    ddr4_sdram_c1_act_n : out STD_LOGIC;
    ddr4_sdram_c1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_sdram_c1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_sdram_c1_bg : out STD_LOGIC;
    ddr4_sdram_c1_ck_c : out STD_LOGIC;
    ddr4_sdram_c1_ck_t : out STD_LOGIC;
    ddr4_sdram_c1_cke : out STD_LOGIC;
    ddr4_sdram_c1_cs_n : out STD_LOGIC;
    ddr4_sdram_c1_dm_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    ddr4_sdram_c1_dqs_c : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_dqs_t : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    ddr4_sdram_c1_odt : out STD_LOGIC;
    ddr4_sdram_c1_reset_n : out STD_LOGIC;
    default_sysclk1_300_clk_n : in STD_LOGIC;
    default_sysclk1_300_clk_p : in STD_LOGIC;
    ext_mdio_pcs_pma_0_0_mdc : out STD_LOGIC;
    ext_mdio_pcs_pma_0_0_mdio_i : in STD_LOGIC;
    ext_mdio_pcs_pma_0_0_mdio_o : out STD_LOGIC;
    ext_mdio_pcs_pma_0_0_mdio_t : out STD_LOGIC;
    reset : in STD_LOGIC;
    sgmii_0_0_rxn : in STD_LOGIC;
    sgmii_0_0_rxp : in STD_LOGIC;
    sgmii_0_0_txn : out STD_LOGIC;
    sgmii_0_0_txp : out STD_LOGIC;
    sgmii_phyclk_clk_n : in STD_LOGIC;
    sgmii_phyclk_clk_p : in STD_LOGIC;
    tmds_blue_n : out STD_LOGIC;
    tmds_blue_p : out STD_LOGIC;
    tmds_cl_n : out STD_LOGIC;
    tmds_cl_p : out STD_LOGIC;
    tmds_green_n : out STD_LOGIC;
    tmds_green_p : out STD_LOGIC;
    tmds_red_n : out STD_LOGIC;
    tmds_red_p : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=143,numReposBlks=138,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=61,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=1,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 87 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 87 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe12 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe18 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe21 : in STD_LOGIC_VECTOR ( 293 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe23 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe37 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe38 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe39 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe40 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe41 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe42 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe46 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe49 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe50 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe51 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe52 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe53 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe54 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe55 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe56 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe57 : in STD_LOGIC_VECTOR ( 293 downto 0 )
  );
  end component design_1_ila_0_0;
  component design_1_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_0_0;
  component design_1_proc_sys_reset_0_1 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_proc_sys_reset_0_1;
  component design_1_xlconstant_0_4 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_0_4;
  component design_1_fifo_generator_0_12 is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 95 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 95 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_12;
  component design_1_blk_mem_gen_0_1 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_blk_mem_gen_0_1;
  component design_1_ResetN_UntilClockLoc_0_0 is
  port (
    reset : in STD_LOGIC;
    locked : in STD_LOGIC;
    resetn : out STD_LOGIC
  );
  end component design_1_ResetN_UntilClockLoc_0_0;
  component design_1_ila_0_1 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 319 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 543 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 21 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 47 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe22 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe23 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 271 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe37 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe38 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe39 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe40 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe41 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe42 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe46 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe49 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe50 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe51 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe52 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe53 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe54 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe55 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe56 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe57 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe58 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe59 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe60 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe61 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe62 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe63 : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component design_1_ila_0_1;
  component design_1_ila_0_2 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe23 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe30 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe37 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe38 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe39 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe40 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe41 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe42 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 319 downto 0 );
    probe46 : in STD_LOGIC_VECTOR ( 271 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe49 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe50 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    probe51 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    probe52 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    probe53 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe54 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe55 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe56 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe57 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe58 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe59 : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component design_1_ila_0_2;
  component design_1_ila_0_3 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 95 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe15 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_ila_0_3;
  component design_1_ila_0_4 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_ila_0_4;
  component design_1_fifo_generator_0_14 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 543 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 543 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_14;
  component design_1_fifo_generator_1_2 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 319 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 319 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_1_2;
  component design_1_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component design_1_xlconstant_0_1;
  component design_1_ClearBlock_0_0 is
  port (
    clk : in STD_LOGIC;
    CMD_ClearBlockIsIdle : out STD_LOGIC;
    CMD_ClearBlockBeginSignal : in STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ClearColorRGBA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearDRAMLineCount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_wr_en : out STD_LOGIC;
    DBG_ClearBlock_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastWrittenClearData : out STD_LOGIC_VECTOR ( 293 downto 0 )
  );
  end component design_1_ClearBlock_0_0;
  component design_1_fifo_generator_0_19 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 271 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 271 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_19;
  component design_1_xlconstant_2_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_xlconstant_2_0;
  component design_1_blk_mem_gen_0_2 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 63 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 17 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component design_1_blk_mem_gen_0_2;
  component design_1_xlconstant_3_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_3_0;
  component design_1_xlconstant_7_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_7_0;
  component design_1_fifo_generator_0_20 is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_20;
  component design_1_fifo_generator_0_21 is
  port (
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 95 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 95 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_21;
  component design_1_xlconstant_5_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_5_0;
  component design_1_xlconstant_6_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlconstant_6_0;
  component design_1_StateBlock_0_0 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 73 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 73 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_0;
  component design_1_StateBlock_1_0 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 6 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 6 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_1_0;
  component design_1_StateBlock_2_0 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 4 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_2_0;
  component design_1_IndexBufferCache_0_0 is
  port (
    clk : in STD_LOGIC;
    VBB_ReadEnable : in STD_LOGIC;
    VBB_ReadAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBB_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_ReadReady : out STD_LOGIC;
    VBB_InvalidateIndexCache : in STD_LOGIC;
    IBCReadRequestsFIFO_full : in STD_LOGIC;
    IBCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCReadRequestsFIFO_wr_en : out STD_LOGIC;
    IBCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCReadResponsesFIFO_empty : in STD_LOGIC;
    IBCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_IBCReadRequestsFIFO_full : out STD_LOGIC;
    DBG_IBCReadResponsesFIFO_empty : out STD_LOGIC
  );
  end component design_1_IndexBufferCache_0_0;
  component design_1_StateBlock_0_1 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 10 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 10 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_1;
  component design_1_StateBlock_0_2 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 100 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 100 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_2;
  component design_1_StateBlock_0_3 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 39 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 39 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_3;
  component design_1_StateBlock_0_4 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 191 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 191 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_4;
  component design_1_StateBlock_0_5 is
  port (
    clk : in STD_LOGIC;
    CMD_SetNewState : in STD_LOGIC;
    CMD_EndFrameReset : in STD_LOGIC;
    CMD_NumFreeSlots : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CMD_NewStateBits : in STD_LOGIC_VECTOR ( 34 downto 0 );
    CMD_NewStateDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateBitsAtDrawID : out STD_LOGIC_VECTOR ( 34 downto 0 );
    STAGE_NextDrawID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAGE_StateIsValid : out STD_LOGIC;
    STAGE_ConsumeStateSlot : in STD_LOGIC;
    DBG_SlotsValid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentReadSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_CurrentWriteSlotIndex : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_Slot0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Slot3 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_StateBlock_0_5;
  component design_1_xlconstant_1_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component design_1_xlconstant_1_1;
  component design_1_fifo_generator_0_23 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 127 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 127 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_23;
  component design_1_fifo_generator_0_24 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_24;
  component design_1_StatsCollector_0_0 is
  port (
    clk : in STD_LOGIC;
    CMD_PresentSignal : in STD_LOGIC;
    CMD_SetNewStatsConfig : in STD_LOGIC;
    CMD_WriteFrameStatsAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_EnableEventTimestamps : in STD_LOGIC;
    CMD_WriteEventTimestampsAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_WriteEventTimestampOrders : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_CountTimestampsMemoryWrites : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_CountTimestampsOrdersMemoryWrites : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_StatsSaveComplete : out STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_StatsWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_StatsWriteRequestsFIFO_wr_en : out STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_WriteOrderNibblesFIFO_full : in STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_wr_en : out STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_WriteOrderNibblesFIFO_empty : in STD_LOGIC;
    STAT_WriteOrderNibblesFIFO_rd_en : out STD_LOGIC;
    STAT_ResetWriteOrderNibblesFIFO : out STD_LOGIC;
    VBB_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    VSHADER_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesExecShaderCode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VSHADER_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    IA_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesLoadingDataToCache : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IA_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRISETUP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CyclesWaitingForTriWorkCache : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DINTERP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTERP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    TEXSAMP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CyclesWaitingCacheLoad : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TEXSAMP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ROP_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CyclesWaitingForMemoryRead : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CountCacheHits : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CountCacheMisses : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_CyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_CyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_ReadCyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_ReadCyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_WriteCyclesIdle : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_WriteCyclesSpentWorking : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountNonScanoutBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemReadCountNonScanoutTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemWriteCountBytesTransferred : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MEM_MemWriteCountTransactions : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EventsWriteIsReady : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_EventsWriteIsReadyAck : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_CurrentWriteOrderNibbles : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_CurrentWriteData : out STD_LOGIC_VECTOR ( 293 downto 0 );
    DBG_CurrentWriteEn : out STD_LOGIC
  );
  end component design_1_StatsCollector_0_0;
  component design_1_fifo_generator_0_25 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 223 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 223 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_25;
  component design_1_fifo_generator_0_26 is
  port (
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 575 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 575 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  end component design_1_fifo_generator_0_26;
  component design_1_TriWorkCache2_0_0 is
  port (
    clk : in STD_LOGIC;
    DINTERP_outBarycentricInverse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_PopTriangleSlot : in STD_LOGIC;
    INTERP_outT0X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT0Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT10X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT10Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT20X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT20Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outColorRGBA0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_outColorRGBA10 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_outColorRGBA20 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_PopTriangleSlot : in STD_LOGIC;
    RAST_inBarycentricInverse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT0X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT0Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT10X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT10Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT20X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT20Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inColorRGBA0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_inColorRGBA10 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_inColorRGBA20 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_PushNewTriData : in STD_LOGIC;
    RAST_IsFull : out STD_LOGIC;
    DINTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    DINTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC
  );
  end component design_1_TriWorkCache2_0_0;
  component design_1_VertexBatchBuilder_0_0 is
  port (
    clk : in STD_LOGIC;
    CMD_SendCommand : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CMD_CommandArg0 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CMD_CommandArg1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    CMD_CommandArg2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_NewDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_ReadyState : out STD_LOGIC;
    IBC_ReadEnable : out STD_LOGIC;
    IBC_ReadAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    IBC_ReadData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IBC_ReadReady : in STD_LOGIC;
    IBC_InvalidateIndexCache : out STD_LOGIC;
    SHADER_Done : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 34 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    VERTBATCH_FIFO_full : in STD_LOGIC;
    VERTBATCH_FIFO_wr_data : out STD_LOGIC_VECTOR ( 543 downto 0 );
    VERTBATCH_FIFO_wr_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_UseConstantOutput : in STD_LOGIC;
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentBatchLength : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CurrentIndexBatchLength : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_CurrentBatchRemainingPrims : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_QueueIsFull : out STD_LOGIC;
    DBG_QueueIsEmpty : out STD_LOGIC;
    DBG_DoneGeneratingIndices : out STD_LOGIC;
    DBG_IndexGeneratorRemainingPrims : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_LastPolygonIndices : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  end component design_1_VertexBatchBuilder_0_0;
  component design_1_TriSetup_0_0 is
  port (
    clk : in STD_LOGIC;
    CLIP_v0_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2_in_w : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t0_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t0_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t1_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t1_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t2_in_x : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_t2_in_y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v1_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v2_in_RGBA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_newTriBegin : in STD_LOGIC;
    CLIP_readyForNewTri : out STD_LOGIC;
    TEXCFG_nointerpolation : in STD_LOGIC;
    RAST_outBarycentricInverse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v10_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v20_out_Z : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v10_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v20_out_invW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t0_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t0_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t10_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t10_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t20_out_x : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_t20_out_y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_v0_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_v10_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_v20_out_colorRGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_outMinX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMaxX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMinY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outMaxY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outInitialBarycentricRowResetA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outInitialBarycentricRowResetB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outInitialBarycentricRowResetC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_outIsTopLeftEdgeA : out STD_LOGIC;
    RAST_outIsTopLeftEdgeB : out STD_LOGIC;
    RAST_outIsTopLeftEdgeC : out STD_LOGIC;
    RAST_outBarycentricXDeltaA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricXDeltaB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricXDeltaC : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaB : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_outBarycentricYDeltaC : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    RAST_readyForTriSetupData : in STD_LOGIC;
    RAST_triSetupDataIsValid : out STD_LOGIC;
    FPU_ADD_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_ADD_GO : out STD_LOGIC;
    FPU_MUL_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_MUL_GO : out STD_LOGIC;
    FPU_CNV_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV_Mode : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FPU_CNV_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_CNV_GO : out STD_LOGIC;
    FPU_SPEC_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_GO : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 191 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_TriSetupIsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TriSetup_State : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_MinX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxX : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MinY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MaxY : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_XProdSub0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdSub3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_XProdProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LeftProd2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RightProd2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TwiceTriArea : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_TriSetup_0_0;
  component design_1_Rasterizer_0_0 is
  port (
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
    DBG_MaxY : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_Rasterizer_0_0;
  component design_1_TexSample_0_0 is
  port (
    clk : in STD_LOGIC;
    INTERP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 95 downto 0 );
    INTERP_InFIFO_empty : in STD_LOGIC;
    INTERP_InFIFO_rd_en : out STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_TexSampReadRequestsFIFO_full : in STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_TexSampReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 73 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 );
    TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_ena : out STD_LOGIC;
    TexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    CMD_TexSampleIsIdle : out STD_LOGIC;
    ROP_OutFIFO_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ROP_OutFIFO_full : in STD_LOGIC;
    ROP_OutFIFO_wr_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingCacheLoad : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TexSample_State : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_TexCache_douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  end component design_1_TexSample_0_0;
  component design_1_InputAssembler2_0_0 is
  port (
    clk : in STD_LOGIC;
    CLIP_v0PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex0_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex0_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex1_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex1_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex2_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex2_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_vertColor0_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_vertColor1_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_vertColor2_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v0ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_v1ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_v2ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_AABBTriOverlapsViewport : out STD_LOGIC;
    CLIP_readyForNewTri : in STD_LOGIC;
    CLIP_newTriBegin : out STD_LOGIC;
    VBO_Pushed : in STD_LOGIC;
    VBO_NumVertices : in STD_LOGIC_VECTOR ( 4 downto 0 );
    VBO_NumIndices : in STD_LOGIC_VECTOR ( 6 downto 0 );
    VBO_IsIndexedDrawCall : in STD_LOGIC;
    VBO_Ready : out STD_LOGIC;
    VERTOUT_FIFO_empty : in STD_LOGIC;
    VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 319 downto 0 );
    VERTOUT_FIFO_rd_en : out STD_LOGIC;
    INDEXOUT_FIFO_empty : in STD_LOGIC;
    INDEXOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 271 downto 0 );
    INDEXOUT_FIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_IA_Idle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesLoadingDataToCache : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_IA_State : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_IA_VertexIDPerBatch : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_IA_CurrentTriIndices : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component design_1_InputAssembler2_0_0;
  component design_1_DepthInterpolator_0_1 is
  port (
    clk : in STD_LOGIC;
    TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inZ20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_inInvW20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TRICACHE_PopTriangleSlot : out STD_LOGIC;
    RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 95 downto 0 );
    RASTOUT_FIFO_empty : in STD_LOGIC;
    RASTOUT_FIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 39 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
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
    FPU_SPEC_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_OUT : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FPU_SPEC_GO : out STD_LOGIC;
    DEPTH_PixelReady : out STD_LOGIC;
    DEPTH_PosX : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DEPTH_PosY : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DEPTH_OutPixelDepth : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DEPTH_PixelPassedDepthTest : in STD_LOGIC;
    DEPTH_PixelFailedDepthTest : in STD_LOGIC;
    DEPTH_SetDepthParams : out STD_LOGIC;
    DEPTH_DepthWriteEnable : out STD_LOGIC;
    DEPTH_DepthFunction : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DEPTH_DepthIsIdle : in STD_LOGIC;
    ATTR_FIFO_wr_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    ATTR_FIFO_wr_en : out STD_LOGIC;
    ATTR_FIFO_full : in STD_LOGIC;
    ATTR_FIFO_almost_full : in STD_LOGIC;
    CMD_IsIdle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_DepthOnlyPixelsPassed : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_BarycentricConvertState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_BarycentricNormalizeState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_InterpolatorDriverState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_ShiftConvertZState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_DepthTestDriverZState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_RastBarycentricB : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RastBarycentricC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_InterpolatedDepthU24 : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_IdleVector : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DBG_BarycentricBCFIFO : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component design_1_DepthInterpolator_0_1;
  component design_1_ClipUnit_0_0 is
  port (
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
  end component design_1_ClipUnit_0_0;
  component design_1_StandaloneFloatALU_A_0_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_A_0_0;
  component design_1_StandaloneFloatALU_M_0_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_M_0_0;
  component design_1_StandaloneFloatALU_S_0_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OSPEC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISPEC_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_S_0_0;
  component design_1_StandaloneFloatALU_C_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OCNV : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ICNV_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_C_0_1;
  component design_1_StandaloneFloatALU_A_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_A_0_1;
  component design_1_StandaloneFloatALU_A_1_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_A_1_0;
  component design_1_StandaloneFloatALU_M_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_M_0_1;
  component design_1_StandaloneFloatALU_M_1_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_M_1_0;
  component design_1_StandaloneFloatALU_S_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OSPEC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISPEC_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_S_0_1;
  component design_1_StandaloneFloatALU_M_0_2 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_M_0_2;
  component design_1_StandaloneFloatALU_C_0_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OCNV : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ICNV_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_C_0_0;
  component design_1_StandaloneFloatALU_M_0_3 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_M_0_3;
  component design_1_StandaloneFloatALU_C_0_2 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OCNV : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ICNV_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_C_0_2;
  component design_1_StandaloneFloatALU_S_0_2 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OSPEC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISPEC_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_S_0_2;
  component design_1_StandaloneFloatALU_C_0_3 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OCNV : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ICNV_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_C_0_3;
  component design_1_StandaloneFloatALU_C_0_4 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_MODE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OCNV : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ICNV_GO : in STD_LOGIC
  );
  end component design_1_StandaloneFloatALU_C_0_4;
  component design_1_ROP_0_0 is
  port (
    clk : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_ROPReadRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_ROPReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_en : out STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ROPWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_en : out STD_LOGIC;
    CMD_SetClearColor : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearSignal : in STD_LOGIC;
    CMD_ClearSignalAck : out STD_LOGIC;
    CMD_FlushCacheSignal : in STD_LOGIC;
    CMD_FlushCacheAck : out STD_LOGIC;
    CMD_ROPIsIdle : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 100 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TEXSAMP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    TEXSAMP_InFIFO_empty : in STD_LOGIC;
    TEXSAMP_InFIFO_rd_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForMemoryRead : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheHits : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheMisses : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_CountPixelsPassed : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ROP_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CurrentPixelAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_CurrentBlendedColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_PreviousFramebufferColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentCacheLineDirtyFlags : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_TempSelectedOutputRGB : out STD_LOGIC_VECTOR ( 47 downto 0 );
    DBG_TempSelectedOutputA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TempBlendedOutputRGB : out STD_LOGIC_VECTOR ( 95 downto 0 );
    DBG_TempBlendedOutputA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ReadRequestFIFOFull : out STD_LOGIC
  );
  end component design_1_ROP_0_0;
  component design_1_DepthBuffer_0_0 is
  port (
    clk : in STD_LOGIC;
    RAST_PixelReady : in STD_LOGIC;
    RAST_PosX : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_PosY : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAST_InPixelDepth : in STD_LOGIC_VECTOR ( 23 downto 0 );
    RAST_SetDepthParams : in STD_LOGIC;
    RAST_DepthWriteEnable : in STD_LOGIC;
    RAST_DepthFunction : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RAST_DepthIsIdle : out STD_LOGIC;
    RAST_PixelPassedDepthTest : out STD_LOGIC;
    RAST_PixelFailedDepthTest : out STD_LOGIC;
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
    CMD_ClearDepthValue : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CMD_DepthIsIdle : out STD_LOGIC;
    STAT_PixelsPassedDepthTest : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_DepthBuffer_0_0;
  component design_1_AttrInterpolator_0_0 is
  port (
    clk : in STD_LOGIC;
    DINTERP_FIFO_rd_data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    DINTERP_FIFO_empty : in STD_LOGIC;
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
    DBG_CurrentDrawEvent : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_AttrInterpolator_0_0;
  component design_1_CommandProcessor_0_0 is
  port (
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    validPacketsFIFO_rd_data : in STD_LOGIC_VECTOR ( 87 downto 0 );
    validPacketsFIFO_empty : in STD_LOGIC;
    validPacketsFIFO_rd_en : out STD_LOGIC;
    returnPacketsFIFO_full : in STD_LOGIC;
    returnPacketsFIFO_wr_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    returnPacketsFIFO_wr_en : out STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    CommandProcReadRequestsFIFO_full : in STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_en : out STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    CommandProcReadResponsesFIFO_empty : in STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_en : out STD_LOGIC;
    CommandProcWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    CommandProcWriteRequestsFIFO_full : in STD_LOGIC;
    CommandProcWriteRequestsFIFO_wr_en : out STD_LOGIC;
    CMD_VS_Idle : in STD_LOGIC;
    CMD_IA_Idle : in STD_LOGIC;
    CMD_Clip_Idle : in STD_LOGIC;
    CMD_TriSetup_Idle : in STD_LOGIC;
    CMD_Rasterizer_Idle : in STD_LOGIC;
    CMD_DepthInterpolator_Idle : in STD_LOGIC;
    CMD_Depth_Idle : in STD_LOGIC;
    CMD_AttrInterpolator_Idle : in STD_LOGIC;
    CMD_TexSampler_Idle : in STD_LOGIC;
    CMD_ROP_Idle : in STD_LOGIC;
    CMD_ClearBlock_Idle : in STD_LOGIC;
    CMD_MemController_Idle : in STD_LOGIC;
    CMD_VSync : in STD_LOGIC;
    CMD_FIFO_EMPTY_VBB : in STD_LOGIC;
    CMD_FIFO_EMPTY_VS : in STD_LOGIC;
    CMD_FIFO_EMPTY_RASTOUT : in STD_LOGIC;
    CMD_FIFO_EMPTY_ATTR : in STD_LOGIC;
    CMD_FIFO_EMPTY_TEXSAMP : in STD_LOGIC;
    CMD_FIFO_EMPTY_ROP : in STD_LOGIC;
    SHADER_IsReadyForCommand : in STD_LOGIC;
    SHADER_InCommand : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SHADER_LoadProgramAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SHADER_LoadProgramLen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SHADER_SetConstantIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SHADER_SetConstantData : out STD_LOGIC_VECTOR ( 127 downto 0 );
    SHADER_SetNumVertexStreams : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SHADER_SetVertexStreamID : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SHADER_SetVertexStreamDWORDCount : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SHADER_SetVertexStreamIsD3DCOLOR : out STD_LOGIC;
    SHADER_SetVertexStreamShaderRegIndex : out STD_LOGIC_VECTOR ( 2 downto 0 );
    SHADER_SetVertexStreamDWORDStride : out STD_LOGIC_VECTOR ( 5 downto 0 );
    SHADER_SetVertexStreamDWORDOffset : out STD_LOGIC_VECTOR ( 5 downto 0 );
    SHADER_ReadRegisterOutRequest : out STD_LOGIC;
    SHADER_ReadRegisterOutDataReady : in STD_LOGIC;
    SHADER_ReadRegisterOutData : in STD_LOGIC_VECTOR ( 127 downto 0 );
    IA_SetNewState : out STD_LOGIC;
    IA_EndFrameReset : out STD_LOGIC;
    IA_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IA_NewStateBits : out STD_LOGIC_VECTOR ( 4 downto 0 );
    IA_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VBB_SendCommand : out STD_LOGIC_VECTOR ( 1 downto 0 );
    VBB_CommandArg0 : out STD_LOGIC_VECTOR ( 23 downto 0 );
    VBB_CommandArg1 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    VBB_CommandArg2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VBB_NewDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VBB_ReadyState : in STD_LOGIC;
    VBB_SetNewState : out STD_LOGIC;
    VBB_EndFrameReset : out STD_LOGIC;
    VBB_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VBB_NewStateBits : out STD_LOGIC_VECTOR ( 34 downto 0 );
    VBB_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_SetNewState : out STD_LOGIC;
    CLIP_EndFrameReset : out STD_LOGIC;
    CLIP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CLIP_NewStateBits : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    TRISETUP_SetNewState : out STD_LOGIC;
    TRISETUP_EndFrameReset : out STD_LOGIC;
    TRISETUP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TRISETUP_NewStateBits : out STD_LOGIC_VECTOR ( 191 downto 0 );
    TRISETUP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DINTERP_STAT_CountDepthOnlyPixelsPassed : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_SetNewState : out STD_LOGIC;
    DINTERP_EndFrameReset : out STD_LOGIC;
    DINTERP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    DINTERP_NewStateBits : out STD_LOGIC_VECTOR ( 39 downto 0 );
    DINTERP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DEPTH_ClearDepthBuffer : out STD_LOGIC;
    DEPTH_ClearDepthValue : out STD_LOGIC_VECTOR ( 23 downto 0 );
    INTERP_SetNewState : out STD_LOGIC;
    INTERP_EndFrameReset : out STD_LOGIC;
    INTERP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    INTERP_NewStateBits : out STD_LOGIC_VECTOR ( 6 downto 0 );
    INTERP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    TEXSAMP_SetNewState : out STD_LOGIC;
    TEXSAMP_EndFrameReset : out STD_LOGIC;
    TEXSAMP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TEXSAMP_NewStateBits : out STD_LOGIC_VECTOR ( 73 downto 0 );
    TEXSAMP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ROP_SetClearColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_ClearSignal : out STD_LOGIC;
    ROP_ClearSignalAck : in STD_LOGIC;
    ROP_FlushCacheSignal : out STD_LOGIC;
    ROP_FlushCacheAck : in STD_LOGIC;
    ROP_STAT_CountPixelsPassed : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ROP_STAT_CurrentDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ROP_SetNewState : out STD_LOGIC;
    ROP_EndFrameReset : out STD_LOGIC;
    ROP_NumFreeSlots : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ROP_NewStateBits : out STD_LOGIC_VECTOR ( 100 downto 0 );
    ROP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SCANOUT_ScanEnable : out STD_LOGIC;
    SCANOUT_InvertOutputColor : out STD_LOGIC;
    SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR ( 8 downto 0 );
    CLEAR_ClearBlockBeginSignal : out STD_LOGIC;
    CLEAR_BaseRenderTargetAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    CLEAR_ClearColorRGBA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLEAR_ClearDRAMLineCount : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_PresentSignal : out STD_LOGIC;
    STAT_SetNewStatsConfig : out STD_LOGIC;
    STAT_WriteFrameStatsAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    STAT_EnableEventTimestamps : out STD_LOGIC;
    STAT_WriteEventTimestampsAddress : out STD_LOGIC_VECTOR ( 29 downto 0 );
    STAT_WriteEventTimestampOrders : out STD_LOGIC_VECTOR ( 29 downto 0 );
    STAT_CountTimestampsMemoryWrites : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_CountTimestampsOrdersMemoryWrites : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_StatsSaveComplete : in STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CMDPACKETSTATE : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_LAST_IN_PACKET : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_LAST_OUT_PACKET : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_LAST_READ_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LAST_WRITE_ADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LAST_WRITE_DATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    DBG_IdleSignalsVector : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DBG_CurrentDrawGeneration : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_CommandProcessor_0_0;
  signal ATTR_FIFO_dout : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ATTR_FIFO_empty : STD_LOGIC;
  signal ATTR_FIFO_prog_full : STD_LOGIC;
  signal AttrInterp_FPU_CNV1_OCNV : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterp_FPU_CNV_OCNV : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_CMD_IsIdle : STD_LOGIC;
  signal AttrInterpolator_0_DBG_AttrInterpolator_State : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal AttrInterpolator_0_DBG_CurrentDrawEvent : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AttrInterpolator_0_DBG_RastBarycentricB : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_DBG_RastBarycentricC : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_DINTERP_FIFO_rd_en : STD_LOGIC;
  signal AttrInterpolator_0_FPU_CNV0_GO : STD_LOGIC;
  signal AttrInterpolator_0_FPU_CNV0_Mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal AttrInterpolator_0_FPU_CNV1_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_FPU_CNV1_GO : STD_LOGIC;
  signal AttrInterpolator_0_FPU_CNV1_Mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal AttrInterpolator_0_FPU_CNV_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_FPU_MUL_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_FPU_MUL_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_FPU_MUL_GO : STD_LOGIC;
  signal AttrInterpolator_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal AttrInterpolator_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AttrInterpolator_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AttrInterpolator_0_TEXSAMP_OUT_FIFO_FULL : STD_LOGIC;
  signal AttrInterpolator_0_TEXSAMP_OUT_FIFO_WR_EN : STD_LOGIC;
  signal AttrInterpolator_0_TEXSAMP_OutFIFO_wr_data : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal AttrInterpolator_0_TRICACHE_PopTriangleSlot : STD_LOGIC;
  signal CMD_InCommand_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_LoadProgramAddr_0_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CMD_LoadProgramLen_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CMD_SetConstantData_0_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal CMD_SetConstantIndex_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal CMD_SetNumVertexStreams_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamDWORDCount_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamDWORDOffset_0_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal CMD_SetVertexStreamDWORDStride_0_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal CMD_SetVertexStreamID_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal CMD_SetVertexStreamIsD3DCOLOR_0_1 : STD_LOGIC;
  signal CMD_SetVertexStreamShaderRegIndex_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ClearBlock_0_CMD_ClearBlockIsIdle : STD_LOGIC;
  signal ClearBlock_0_ClearBlockWriteRequestsFIFO_FULL : STD_LOGIC;
  signal ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_EN : STD_LOGIC;
  signal ClearBlock_0_DBG_ClearBlock_State : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ClearBlock_0_DBG_LastWrittenClearData : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal ClipUnit_0_CMD_IsIdle : STD_LOGIC;
  signal ClipUnit_0_DBG_AlreadyClippedPlanes : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal ClipUnit_0_DBG_ClipDistance0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_DBG_ClipDistance1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_DBG_ClipOutcodes0 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal ClipUnit_0_DBG_ClipOutcodes1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal ClipUnit_0_DBG_ClipOutcodes2 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal ClipUnit_0_DBG_CurrentClipBitmask : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ClipUnit_0_DBG_CurrentClipPlane : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ClipUnit_0_DBG_CurrentState : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ClipUnit_0_DBG_V0PosW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_DBG_V0PosX : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_DBG_V0PosY : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_DBG_V0PosZ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Add0_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Add0_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Add0_IADD_GO : STD_LOGIC;
  signal ClipUnit_0_FPU_Add1_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Add1_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Add1_IADD_GO : STD_LOGIC;
  signal ClipUnit_0_FPU_Mul0_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Mul0_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Mul0_IMUL_GO : STD_LOGIC;
  signal ClipUnit_0_FPU_Mul1_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Mul1_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Mul1_IMUL_GO : STD_LOGIC;
  signal ClipUnit_0_FPU_Rcp0_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_FPU_Rcp0_ISPEC_GO : STD_LOGIC;
  signal ClipUnit_0_IA_outPreviousStageIsReady : STD_LOGIC;
  signal ClipUnit_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal ClipUnit_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ClipUnit_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ClipUnit_0_TRISETUP_outNextStageIsValid : STD_LOGIC;
  signal ClipUnit_0_TRISETUP_outv0rgba : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0tx : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0ty : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0w : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv0z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1rgba : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1tx : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1ty : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1w : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv1z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2rgba : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2tx : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2ty : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2w : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ClipUnit_0_TRISETUP_outv2z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_CLEAR_BaseRenderTargetAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_CLEAR_ClearBlockBeginSignal : STD_LOGIC;
  signal CommandProcessor_0_CLEAR_ClearColorRGBA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_CLEAR_ClearDRAMLineCount : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_CLIP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_CLIP_NewStateBits : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal CommandProcessor_0_CLIP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_CLIP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_CommandProcReadRequestsFIFO_FULL : STD_LOGIC;
  signal CommandProcessor_0_CommandProcReadRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_CommandProcReadRequestsFIFO_WR_EN : STD_LOGIC;
  signal CommandProcessor_0_CommandProcReadResponses_EMPTY : STD_LOGIC;
  signal CommandProcessor_0_CommandProcReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal CommandProcessor_0_CommandProcReadResponses_RD_EN : STD_LOGIC;
  signal CommandProcessor_0_CommandProcWriteRequests_FULL : STD_LOGIC;
  signal CommandProcessor_0_CommandProcWriteRequests_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal CommandProcessor_0_CommandProcWriteRequests_WR_EN : STD_LOGIC;
  signal CommandProcessor_0_DBG_CurrentDrawGeneration : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_DBG_IdleSignalsVector : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal CommandProcessor_0_DBG_LAST_IN_PACKET : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal CommandProcessor_0_DBG_LAST_OUT_PACKET : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal CommandProcessor_0_DBG_LAST_READ_DATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_DBG_PACKETSTATE : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal CommandProcessor_0_DEPTH_ClearDepthBuffer : STD_LOGIC;
  signal CommandProcessor_0_DEPTH_ClearDepthValue : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal CommandProcessor_0_DINTERP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_DINTERP_NewStateBits : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal CommandProcessor_0_DINTERP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_DINTERP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_IA_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_IA_NewStateBits : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal CommandProcessor_0_IA_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_IA_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_INTERP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_INTERP_NewStateBits : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal CommandProcessor_0_INTERP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_INTERP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_ROP_ClearSignal : STD_LOGIC;
  signal CommandProcessor_0_ROP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_ROP_FlushCacheSignal : STD_LOGIC;
  signal CommandProcessor_0_ROP_NewStateBits : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal CommandProcessor_0_ROP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_ROP_SetClearColor : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_ROP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_SCANOUT_InvertOutputColor : STD_LOGIC;
  signal CommandProcessor_0_SCANOUT_OutputColorChannels : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CommandProcessor_0_SCANOUT_RenderTargetBaseAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_SCANOUT_ScanEnable : STD_LOGIC;
  signal CommandProcessor_0_SHADER_ReadRegisterOutRequest : STD_LOGIC;
  signal CommandProcessor_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CommandProcessor_0_STAT_EnableEventTimestamps : STD_LOGIC;
  signal CommandProcessor_0_STAT_PresentSignal : STD_LOGIC;
  signal CommandProcessor_0_STAT_SetNewStatsConfig : STD_LOGIC;
  signal CommandProcessor_0_STAT_WriteEventTimestampOrders : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_STAT_WriteEventTimestampsAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_STAT_WriteFrameStatsAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal CommandProcessor_0_TEXSAMP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_TEXSAMP_NewStateBits : STD_LOGIC_VECTOR ( 73 downto 0 );
  signal CommandProcessor_0_TEXSAMP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_TEXSAMP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_TRISETUP_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_TRISETUP_NewStateBits : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal CommandProcessor_0_TRISETUP_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_TRISETUP_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_VBB_CommandArg0 : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal CommandProcessor_0_VBB_CommandArg1 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal CommandProcessor_0_VBB_CommandArg2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_VBB_EndFrameReset : STD_LOGIC;
  signal CommandProcessor_0_VBB_NewDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_VBB_NewStateBits : STD_LOGIC_VECTOR ( 34 downto 0 );
  signal CommandProcessor_0_VBB_NewStateDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CommandProcessor_0_VBB_SendCommand : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CommandProcessor_0_VBB_SetNewState : STD_LOGIC;
  signal CommandProcessor_0_returnPacketsFIFO_FULL : STD_LOGIC;
  signal CommandProcessor_0_returnPacketsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal CommandProcessor_0_returnPacketsFIFO_WR_EN : STD_LOGIC;
  signal CommandProcessor_0_validPacketsFIFO_EMPTY : STD_LOGIC;
  signal CommandProcessor_0_validPacketsFIFO_RD_DATA : STD_LOGIC_VECTOR ( 87 downto 0 );
  signal CommandProcessor_0_validPacketsFIFO_RD_EN : STD_LOGIC;
  signal DINTERP_FPU_CNV1_OCNV : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DINTERP_FPU_CNV_OCNV : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthBuffer_0_CMD_DepthIsIdle : STD_LOGIC;
  signal DepthBuffer_0_DBufferRAMR_CLK : STD_LOGIC;
  signal DepthBuffer_0_DBufferRAMR_EN : STD_LOGIC;
  signal DepthBuffer_0_DBufferRAMW_CLK : STD_LOGIC;
  signal DepthBuffer_0_DBufferRAMW_EN : STD_LOGIC;
  signal DepthBuffer_0_RAST_DepthIsIdle : STD_LOGIC;
  signal DepthBuffer_0_RAST_PixelFailedDepthTest : STD_LOGIC;
  signal DepthBuffer_0_RAST_PixelPassedDepthTest : STD_LOGIC;
  signal DepthBuffer_0_URAM_addra : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal DepthBuffer_0_URAM_addrb : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal DepthBuffer_0_URAM_dina : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal DepthBuffer_0_URAM_wea : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal DepthInterpStateBlock_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal DepthInterpStateBlock_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DepthInterpStateBlock_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal DepthInterpStateBlock_STAGE_StateIsValid : STD_LOGIC;
  signal DepthInterpolator_0_ATTR_FIFO_FULL : STD_LOGIC;
  signal DepthInterpolator_0_ATTR_FIFO_WR_DATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal DepthInterpolator_0_ATTR_FIFO_WR_EN : STD_LOGIC;
  signal DepthInterpolator_0_CMD_IsIdle : STD_LOGIC;
  signal DepthInterpolator_0_DBG_DepthInterpolator_State : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal DepthInterpolator_0_DEPTH_DepthFunction : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal DepthInterpolator_0_DEPTH_DepthWriteEnable : STD_LOGIC;
  signal DepthInterpolator_0_DEPTH_OutPixelDepth : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal DepthInterpolator_0_DEPTH_PixelReady : STD_LOGIC;
  signal DepthInterpolator_0_DEPTH_PosX : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal DepthInterpolator_0_DEPTH_PosY : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal DepthInterpolator_0_DEPTH_SetDepthParams : STD_LOGIC;
  signal DepthInterpolator_0_FPU_CNV0_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_FPU_CNV0_GO : STD_LOGIC;
  signal DepthInterpolator_0_FPU_CNV0_Mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal DepthInterpolator_0_FPU_CNV1_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_FPU_CNV1_GO : STD_LOGIC;
  signal DepthInterpolator_0_FPU_CNV1_Mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal DepthInterpolator_0_FPU_MUL_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_FPU_MUL_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_FPU_MUL_GO : STD_LOGIC;
  signal DepthInterpolator_0_FPU_SPEC_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_FPU_SPEC_GO : STD_LOGIC;
  signal DepthInterpolator_0_RASTOUT_FIFO_rd_en : STD_LOGIC;
  signal DepthInterpolator_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal DepthInterpolator_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal DepthInterpolator_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_STAT_DepthOnlyPixelsPassed : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DepthInterpolator_0_TRICACHE_PopTriangleSlot : STD_LOGIC;
  signal IndexBufferCache_0_IBCacheReadRequests_FULL : STD_LOGIC;
  signal IndexBufferCache_0_IBCacheReadRequests_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal IndexBufferCache_0_IBCacheReadRequests_WR_EN : STD_LOGIC;
  signal IndexBufferCache_0_IBCacheReadResponses_EMPTY : STD_LOGIC;
  signal IndexBufferCache_0_IBCacheReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal IndexBufferCache_0_IBCacheReadResponses_RD_EN : STD_LOGIC;
  signal IndexBufferCache_0_VBB_ReadData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal IndexBufferCache_0_VBB_ReadReady : STD_LOGIC;
  signal InputAssembler2_0_CLIP_AABBTriOverlapsViewport : STD_LOGIC;
  signal InputAssembler2_0_CLIP_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InputAssembler2_0_CLIP_newTriBegin : STD_LOGIC;
  signal InputAssembler2_0_CLIP_tex0_X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_tex0_Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_tex1_X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_tex1_Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_tex2_X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_tex2_Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v0ClipCodes : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal InputAssembler2_0_CLIP_v0PosW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v0PosX : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v0PosY : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v0PosZ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v1ClipCodes : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal InputAssembler2_0_CLIP_v1PosW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v1PosX : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v1PosY : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v1PosZ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v2ClipCodes : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal InputAssembler2_0_CLIP_v2PosW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v2PosX : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v2PosY : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_v2PosZ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_CLIP_vertColor0_RGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal InputAssembler2_0_CLIP_vertColor1_RGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal InputAssembler2_0_CLIP_vertColor2_RGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal InputAssembler2_0_CMD_IA_Idle : STD_LOGIC;
  signal InputAssembler2_0_DBG_IA_CurrentTriIndices : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal InputAssembler2_0_DBG_IA_State : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal InputAssembler2_0_DBG_IA_VertexIDPerBatch : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal InputAssembler2_0_INDEXOUT_FIFO_EMPTY : STD_LOGIC;
  signal InputAssembler2_0_INDEXOUT_FIFO_RD_EN : STD_LOGIC;
  signal InputAssembler2_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal InputAssembler2_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InputAssembler2_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_STAT_CyclesLoadingDataToCache : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal InputAssembler2_0_VERTOUT_FIFO_rd_en : STD_LOGIC;
  signal InputAssemblerStateBlock_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal InputAssemblerStateBlock_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal InputAssemblerStateBlock_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal InputAssemblerStateBlock_STAGE_StateIsValid : STD_LOGIC;
  signal MemorySystem_CMD_MemoryControllerIsIdle : STD_LOGIC;
  signal MemorySystem_DBG_LastReadAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemorySystem_DBG_LastReadMemoryClientIndex : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemorySystem_DBG_LastWriteAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal MemorySystem_DBG_LastWriteData : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal MemorySystem_DBG_LastWriteDataDWORDEnables : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemorySystem_DBG_LastWriteMemoryClientIndex : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemorySystem_DBG_ReadControlState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemorySystem_DBG_ReadRequestsEmptyBitmask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemorySystem_DBG_ReadResponsesFullBitmask : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal MemorySystem_DBG_ScanoutReadRequests_Empty : STD_LOGIC;
  signal MemorySystem_DBG_ScanoutReadRequests_rd_en : STD_LOGIC;
  signal MemorySystem_DBG_ScanoutReadResponses_Full : STD_LOGIC;
  signal MemorySystem_DBG_WriteControlState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MemorySystem_DBG_WriteRequestsEmptyBitmask : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal MemorySystem_STAT_MemReadCountBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemReadCountNonScanoutBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemReadCountNonScanoutTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemReadCountTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemReadCyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemReadCyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemWriteCountBytesTransferred : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemWriteCountTransactions : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemWriteCyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MemorySystem_STAT_MemWriteCyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Net : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDC : STD_LOGIC;
  signal NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_I : STD_LOGIC;
  signal NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_O : STD_LOGIC;
  signal NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_T : STD_LOGIC;
  signal NetworkPacketSystem_sgmii_0_0_RXN : STD_LOGIC;
  signal NetworkPacketSystem_sgmii_0_0_RXP : STD_LOGIC;
  signal NetworkPacketSystem_sgmii_0_0_TXN : STD_LOGIC;
  signal NetworkPacketSystem_sgmii_0_0_TXP : STD_LOGIC;
  signal ROPStateBlock_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ROPStateBlock_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ROPStateBlock_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 100 downto 0 );
  signal ROPStateBlock_STAGE_StateIsValid : STD_LOGIC;
  signal ROP_0_CMD_ClearSignalAck : STD_LOGIC;
  signal ROP_0_CMD_FlushCacheAck : STD_LOGIC;
  signal ROP_0_CMD_ROPIsIdle : STD_LOGIC;
  signal ROP_0_DBG_CurrentPixelAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ROP_0_DBG_ROP_State : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ROP_0_DBG_ReadRequestFIFOFull : STD_LOGIC;
  signal ROP_0_ROPReadRequestsFIFO_FULL : STD_LOGIC;
  signal ROP_0_ROPReadRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ROP_0_ROPReadRequestsFIFO_WR_EN : STD_LOGIC;
  signal ROP_0_ROPReadResponses_EMPTY : STD_LOGIC;
  signal ROP_0_ROPReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ROP_0_ROPReadResponses_RD_EN : STD_LOGIC;
  signal ROP_0_ROPWriteRequestsFIFO_FULL : STD_LOGIC;
  signal ROP_0_ROPWriteRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal ROP_0_ROPWriteRequestsFIFO_WR_EN : STD_LOGIC;
  signal ROP_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal ROP_0_STAT_CountCacheHits : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CountCacheMisses : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CountPixelsPassed : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ROP_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CyclesWaitingForMemoryRead : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ROP_0_TEXSAMP_InFIFO_rd_en : STD_LOGIC;
  signal ROP_FIFO_dout : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ROP_FIFO_empty : STD_LOGIC;
  signal Rasterizer_0_CMD_Rasterizer_Idle : STD_LOGIC;
  signal Rasterizer_0_DBG_MaxX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_MaxY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_MinX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_MinY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_PixelXPos : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_PixelYPos : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_DBG_Rasterizer_State : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Rasterizer_0_RASTOUT_FIFO_ALMOST_FULL : STD_LOGIC;
  signal Rasterizer_0_RASTOUT_FIFO_FULL : STD_LOGIC;
  signal Rasterizer_0_RASTOUT_FIFO_WR_DATA : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal Rasterizer_0_RASTOUT_FIFO_WR_EN : STD_LOGIC;
  signal Rasterizer_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Rasterizer_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_STAT_CyclesWaitingForTriWorkCache : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_BarycentricInverse : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_InvW0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_InvW10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_InvW20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_PushNewTriData : STD_LOGIC;
  signal Rasterizer_0_TRICACHE_TX0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_TX10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_TX20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_TY0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_TY10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_TY20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_VertColor0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal Rasterizer_0_TRICACHE_VertColor10 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal Rasterizer_0_TRICACHE_VertColor20 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal Rasterizer_0_TRICACHE_Z0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_Z10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRICACHE_Z20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Rasterizer_0_TRISETUP_readyForNewTri : STD_LOGIC;
  signal ResetN_UntilClockLoc_0_resetn : STD_LOGIC;
  signal ScanOut_0_ScanoutReadRequestsFIFO_FULL : STD_LOGIC;
  signal ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ScanOut_0_ScanoutReadRequestsFIFO_WR_EN : STD_LOGIC;
  signal ScanOut_0_ScanoutReadResponses_EMPTY : STD_LOGIC;
  signal ScanOut_0_ScanoutReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ScanOut_0_ScanoutReadResponses_RD_EN : STD_LOGIC;
  signal ScanoutSystem_CMD_VSync : STD_LOGIC;
  signal ScanoutSystem_out_blue_n_0 : STD_LOGIC;
  signal ScanoutSystem_out_blue_p_0 : STD_LOGIC;
  signal ScanoutSystem_out_cl_n_0 : STD_LOGIC;
  signal ScanoutSystem_out_cl_p_0 : STD_LOGIC;
  signal ScanoutSystem_out_green_n_0 : STD_LOGIC;
  signal ScanoutSystem_out_green_p_0 : STD_LOGIC;
  signal ScanoutSystem_out_red_n_0 : STD_LOGIC;
  signal ScanoutSystem_out_red_p_0 : STD_LOGIC;
  signal ShaderCoreSystem_CB_Enable : STD_LOGIC;
  signal ShaderCoreSystem_CB_RegComponent : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_CB_RegIndex : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ShaderCoreSystem_CB_WriteInData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_CB_WriteMode : STD_LOGIC;
  signal ShaderCoreSystem_CMD_IsIdle : STD_LOGIC;
  signal ShaderCoreSystem_CMD_IsReadyForCommand_0 : STD_LOGIC;
  signal ShaderCoreSystem_DBG_ActiveLanesBitmask : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ShaderCoreSystem_DBG_CurrentDWORD : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCoreSystem_DBG_CurrentFetchWave : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ShaderCoreSystem_DBG_CurrentState : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal ShaderCoreSystem_DBG_InstructionPointer : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ShaderCoreSystem_DBG_PortW_MUX : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_DBG_ReadRegisterOutData : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCoreSystem_DBG_ReadRegisterOutDataReady : STD_LOGIC;
  signal ShaderCoreSystem_DBG_State : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ShaderCoreSystem_FPU0_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPU0_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPU1_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPU1_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPU3_IN_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPU3_IN_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_FPUALL_IADD_GO : STD_LOGIC;
  signal ShaderCoreSystem_FPUALL_ICMP_GO : STD_LOGIC;
  signal ShaderCoreSystem_FPUALL_ICNV_GO : STD_LOGIC;
  signal ShaderCoreSystem_FPUALL_IMUL_GO : STD_LOGIC;
  signal ShaderCoreSystem_FPUALL_IN_MODE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCoreSystem_FPUALL_ISHFT_GO : STD_LOGIC;
  signal ShaderCoreSystem_FPUALL_ISPEC_GO : STD_LOGIC;
  signal ShaderCoreSystem_GPR0_PortA_regChan : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_GPR0_PortA_regIdx : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCoreSystem_GPR0_PortA_regType : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_GPR0_PortB_regChan : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_GPR0_PortB_regIdx : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ShaderCoreSystem_GPR0_PortB_regType : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_GPR0_PortW_writeInData : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCoreSystem_GPR0_ReadQuadIndex : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_GPR0_WriteQuadIndex : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ShaderCoreSystem_INDEXOUT_FIFO_FULL : STD_LOGIC;
  signal ShaderCoreSystem_INDEXOUT_FIFO_WR_DATA : STD_LOGIC_VECTOR ( 271 downto 0 );
  signal ShaderCoreSystem_INDEXOUT_FIFO_WR_EN : STD_LOGIC;
  signal ShaderCoreSystem_OUT_RESULT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_OUT_RESULT1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_OUT_RESULT2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ShaderCoreSystem_STAT_CyclesExecShaderCode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_VBCacheReadRequests_0_FULL : STD_LOGIC;
  signal ShaderCoreSystem_VBCacheReadRequests_0_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ShaderCoreSystem_VBCacheReadRequests_0_WR_EN : STD_LOGIC;
  signal ShaderCoreSystem_VBCacheReadResponses_0_EMPTY : STD_LOGIC;
  signal ShaderCoreSystem_VBCacheReadResponses_0_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal ShaderCoreSystem_VBCacheReadResponses_0_RD_EN : STD_LOGIC;
  signal ShaderCoreSystem_VBO_IsIndexedDrawCall : STD_LOGIC;
  signal ShaderCoreSystem_VBO_NumIndices : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal ShaderCoreSystem_VBO_NumVertices : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ShaderCoreSystem_VBO_Pushed_0 : STD_LOGIC;
  signal ShaderCoreSystem_VERTBATCH_FIFO_rd_en : STD_LOGIC;
  signal ShaderCoreSystem_VERTOUT_FIFO_0_FULL : STD_LOGIC;
  signal ShaderCoreSystem_VERTOUT_FIFO_0_WR_DATA : STD_LOGIC_VECTOR ( 319 downto 0 );
  signal ShaderCoreSystem_VERTOUT_FIFO_0_WR_EN : STD_LOGIC;
  signal ShaderCoreSystem_VSC_ReadDWORDAddr : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal ShaderCoreSystem_VSC_ReadData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_VSC_ReadReady : STD_LOGIC;
  signal ShaderCoreSystem_VSC_StreamVBAddress : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal ShaderCoreSystem_VertexCache_addra : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal ShaderCoreSystem_VertexCache_dina : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_douta : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ShaderCoreSystem_portA_readOutData_0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCoreSystem_portB_readOutData_0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ShaderCoreSystem_readOutData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_A_0_OADD : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_A_0_OADD1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_A_1_OADD : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_C_0_OCNV : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_M_0_OMUL : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_M_0_OMUL1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_M_0_OMUL2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_M_0_OMUL3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_M_1_OMUL : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_S_0_OSPEC : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_S_0_OSPEC1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StandaloneFloatALU_S_0_OSPEC2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal StateBlock_0_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal StateBlock_0_CMD_NumFreeSlots1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal StateBlock_0_DBG_CurrentReadSlotIndex : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal StateBlock_0_DBG_CurrentWriteSlotIndex : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal StateBlock_0_DBG_Slot0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_DBG_Slot1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_DBG_Slot2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_DBG_Slot3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_DBG_SlotsValid : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal StateBlock_0_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_STAGE_NextDrawID1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_0_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 73 downto 0 );
  signal StateBlock_0_STAGE_StateBitsAtDrawID1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal StateBlock_0_STAGE_StateIsValid : STD_LOGIC;
  signal StateBlock_0_STAGE_StateIsValid1 : STD_LOGIC;
  signal StateBlock_1_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal StateBlock_1_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StateBlock_1_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal StateBlock_1_STAGE_StateIsValid : STD_LOGIC;
  signal StatsCollector_0_CMD_CountTimestampsMemoryWrites : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StatsCollector_0_CMD_CountTimestampsOrdersMemoryWrites : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StatsCollector_0_CMD_StatsSaveComplete : STD_LOGIC;
  signal StatsCollector_0_DBG_CurrentState : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal StatsCollector_0_DBG_CurrentWriteData : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal StatsCollector_0_DBG_CurrentWriteEn : STD_LOGIC;
  signal StatsCollector_0_DBG_CurrentWriteOrderNibbles : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StatsCollector_0_DBG_EventsWriteIsReady : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal StatsCollector_0_DBG_EventsWriteIsReadyAck : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal StatsCollector_0_STAT_ResetWriteOrderNibblesFIFO : STD_LOGIC;
  signal StatsCollector_0_STAT_WriteOrderNibblesFIFO_rd_en : STD_LOGIC;
  signal StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_en : STD_LOGIC;
  signal StatsCollector_0_StatsWriteRequestsFIFO_FULL : STD_LOGIC;
  signal StatsCollector_0_StatsWriteRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 293 downto 0 );
  signal StatsCollector_0_StatsWriteRequestsFIFO_WR_EN : STD_LOGIC;
  signal StatsWriteOrderNibblesFIFO_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StatsWriteOrderNibblesFIFO_empty : STD_LOGIC;
  signal StatsWriteOrderNibblesFIFO_full : STD_LOGIC;
  signal TEXSAMP_FIFO_dout : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal TEXSAMP_FIFO_empty : STD_LOGIC;
  signal TEXSAMP_FIFO_prog_full : STD_LOGIC;
  signal TexSample_0_CMD_TexSampleIsIdle : STD_LOGIC;
  signal TexSample_0_DBG_TexCache_addra : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal TexSample_0_DBG_TexCache_dina : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_DBG_TexSample_State : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal TexSample_0_INTERP_InFIFO_rd_en : STD_LOGIC;
  signal TexSample_0_ROP_OUT_FIFO_FULL : STD_LOGIC;
  signal TexSample_0_ROP_OUT_FIFO_WR_EN : STD_LOGIC;
  signal TexSample_0_ROP_OutFIFO_wr_data : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal TexSample_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal TexSample_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TexSample_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_STAT_CyclesWaitingCacheLoad : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_TexCache_ADDR : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal TexSample_0_TexCache_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_TexCache_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TexSample_0_TexCache_EN : STD_LOGIC;
  signal TexSample_0_TexCache_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TexSample_0_TexSampReadRequestsFIFO_FULL : STD_LOGIC;
  signal TexSample_0_TexSampReadRequestsFIFO_WR_DATA : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal TexSample_0_TexSampReadRequestsFIFO_WR_EN : STD_LOGIC;
  signal TexSample_0_TexSampReadResponses_EMPTY : STD_LOGIC;
  signal TexSample_0_TexSampReadResponses_RD_DATA : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal TexSample_0_TexSampReadResponses_RD_EN : STD_LOGIC;
  signal TriSetupStateBlock_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal TriSetupStateBlock_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetupStateBlock_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal TriSetupStateBlock_STAGE_StateIsValid : STD_LOGIC;
  signal TriSetup_0_CLIP_readyForNewTri : STD_LOGIC;
  signal TriSetup_0_CMD_TriSetupIsIdle : STD_LOGIC;
  signal TriSetup_0_DBG_MaxX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_DBG_MaxY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_DBG_MinX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_DBG_MinY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_DBG_TriSetup_State : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal TriSetup_0_DBG_TwiceTriArea : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdProd0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdProd1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdSub0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdSub1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdSub2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_DBG_XProdSub3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_ADD_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_ADD_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_ADD_GO : STD_LOGIC;
  signal TriSetup_0_FPU_CNV_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_CNV_GO : STD_LOGIC;
  signal TriSetup_0_FPU_CNV_Mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal TriSetup_0_FPU_MUL_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_MUL_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_MUL_GO : STD_LOGIC;
  signal TriSetup_0_FPU_SPEC_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_FPU_SPEC_GO : STD_LOGIC;
  signal TriSetup_0_RAST_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricInverse : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_outBarycentricXDeltaA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricXDeltaB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricXDeltaC : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricYDeltaA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricYDeltaB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outBarycentricYDeltaC : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outInitialBarycentricRowResetA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_outInitialBarycentricRowResetB : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_outInitialBarycentricRowResetC : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_outIsTopLeftEdgeA : STD_LOGIC;
  signal TriSetup_0_RAST_outIsTopLeftEdgeB : STD_LOGIC;
  signal TriSetup_0_RAST_outIsTopLeftEdgeC : STD_LOGIC;
  signal TriSetup_0_RAST_outMaxX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outMaxY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outMinX : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_outMinY : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_RAST_t0_out_x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_t0_out_y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_t10_out_x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_t10_out_y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_t20_out_x : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_t20_out_y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_triSetupDataIsValid : STD_LOGIC;
  signal TriSetup_0_RAST_v0_out_Z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_v0_out_colorRGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriSetup_0_RAST_v0_out_invW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_v10_out_Z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_v10_out_colorRGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriSetup_0_RAST_v10_out_invW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_v20_out_Z : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_RAST_v20_out_colorRGBA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriSetup_0_RAST_v20_out_invW : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal TriSetup_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal TriSetup_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriSetup_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_TRIDATA_RD_EMPTY : STD_LOGIC;
  signal TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_DATA : STD_LOGIC_VECTOR ( 223 downto 0 );
  signal TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_EN : STD_LOGIC;
  signal TriWorkCache2_0_DINTERP_TRIDATA_WR_FULL : STD_LOGIC;
  signal TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_DATA : STD_LOGIC_VECTOR ( 223 downto 0 );
  signal TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_EN : STD_LOGIC;
  signal TriWorkCache2_0_DINTERP_outBarycentricInverse : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outInvW0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outInvW10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outInvW20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outZ0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outZ10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_DINTERP_outZ20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_TRIDATA_RD_EMPTY : STD_LOGIC;
  signal TriWorkCache2_0_INTERP_TRIDATA_RD_RD_DATA : STD_LOGIC_VECTOR ( 575 downto 0 );
  signal TriWorkCache2_0_INTERP_TRIDATA_RD_RD_EN : STD_LOGIC;
  signal TriWorkCache2_0_INTERP_TRIDATA_WR_FULL : STD_LOGIC;
  signal TriWorkCache2_0_INTERP_TRIDATA_WR_WR_DATA : STD_LOGIC_VECTOR ( 575 downto 0 );
  signal TriWorkCache2_0_INTERP_TRIDATA_WR_WR_EN : STD_LOGIC;
  signal TriWorkCache2_0_INTERP_outColorRGBA0 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriWorkCache2_0_INTERP_outColorRGBA10 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriWorkCache2_0_INTERP_outColorRGBA20 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal TriWorkCache2_0_INTERP_outT0X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_outT0Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_outT10X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_outT10Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_outT20X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_INTERP_outT20Y : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TriWorkCache2_0_RAST_IsFull : STD_LOGIC;
  signal VBB_FIFO_empty : STD_LOGIC;
  signal VBB_StateBlock_CMD_NumFreeSlots : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VBB_StateBlock_STAGE_NextDrawID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VBB_StateBlock_STAGE_StateBitsAtDrawID : STD_LOGIC_VECTOR ( 34 downto 0 );
  signal VBB_StateBlock_STAGE_StateIsValid : STD_LOGIC;
  signal VBO_FIFO_dout : STD_LOGIC_VECTOR ( 319 downto 0 );
  signal VBO_FIFO_empty : STD_LOGIC;
  signal VBO_INDEX_FIFO_dout : STD_LOGIC_VECTOR ( 271 downto 0 );
  signal VBO_Ready_0_1 : STD_LOGIC;
  signal VertexBatchBuilder_0_CMD_ReadyState : STD_LOGIC;
  signal VertexBatchBuilder_0_DBG_CurrentBatchLength : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal VertexBatchBuilder_0_DBG_CurrentBatchRemainingPrims : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal VertexBatchBuilder_0_DBG_CurrentState : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VertexBatchBuilder_0_DBG_LastPolygonIndices : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal VertexBatchBuilder_0_IBC_InvalidateIndexCache : STD_LOGIC;
  signal VertexBatchBuilder_0_IBC_ReadAddr : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal VertexBatchBuilder_0_IBC_ReadEnable : STD_LOGIC;
  signal VertexBatchBuilder_0_SHADER_Done : STD_LOGIC;
  signal VertexBatchBuilder_0_STATE_ConsumeStateSlot : STD_LOGIC;
  signal VertexBatchBuilder_0_STAT_CurrentDrawEventID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VertexBatchBuilder_0_STAT_CyclesIdle : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VertexBatchBuilder_0_STAT_CyclesSpentWorking : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VertexBatchBuilder_0_STAT_CyclesWaitingForOutput : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VertexBatchBuilder_0_VertexBatchFIFO_FULL : STD_LOGIC;
  signal VertexBatchBuilder_0_VertexBatchFIFO_WR_DATA : STD_LOGIC_VECTOR ( 543 downto 0 );
  signal VertexBatchBuilder_0_VertexBatchFIFO_WR_EN : STD_LOGIC;
  signal ddr4_0_C0_DDR4_ACT_N : STD_LOGIC;
  signal ddr4_0_C0_DDR4_ADR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal ddr4_0_C0_DDR4_BA : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ddr4_0_C0_DDR4_BG : STD_LOGIC;
  signal ddr4_0_C0_DDR4_CKE : STD_LOGIC;
  signal ddr4_0_C0_DDR4_CK_C : STD_LOGIC;
  signal ddr4_0_C0_DDR4_CK_T : STD_LOGIC;
  signal ddr4_0_C0_DDR4_CS_N : STD_LOGIC;
  signal ddr4_0_C0_DDR4_DM_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ddr4_0_C0_DDR4_DQS_C : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_DQS_T : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ddr4_0_C0_DDR4_ODT : STD_LOGIC;
  signal ddr4_0_C0_DDR4_RESET_N : STD_LOGIC;
  signal ddr4_0_addn_ui_clkout1 : STD_LOGIC;
  signal ddr4_0_c0_ddr4_ui_clk : STD_LOGIC;
  signal default_sysclk1_300_1_CLK_N : STD_LOGIC;
  signal default_sysclk1_300_1_CLK_P : STD_LOGIC;
  signal fifo_generator_0_dout : STD_LOGIC_VECTOR ( 543 downto 0 );
  signal placeholder_texcfg_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rast_out_fifo_dout : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal rast_out_fifo_empty : STD_LOGIC;
  signal rd_clk_1 : STD_LOGIC;
  signal refclk625_in_0_1_CLK_N : STD_LOGIC;
  signal refclk625_in_0_1_CLK_P : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_5_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_6_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_7_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ATTRINTERP_TRIDATA_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ATTRINTERP_TRIDATA_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ATTR_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_ATTR_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_AttrInterpStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_AttrInterpStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_AttrInterpolator_0_DBG_ConverterDriver_State_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_AttrInterpolator_0_DBG_InterpolatorDriver_State_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_AttrInterpolator_0_DBG_MultiplierDriver_State_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_AttrInterpolator_0_DBG_OutputDriver_State_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_AttrInterpolator_0_DBG_PixelWFIFO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ClipUnitStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ClipUnit_0_DBG_TriangleIntersectsViewport_UNCONNECTED : STD_LOGIC;
  signal NLW_ClipUnit_0_DBG_ChildTriStackSize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_ClipUnit_0_DBG_V1PosW_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V1PosX_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V1PosY_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V1PosZ_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V2PosW_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V2PosX_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V2PosY_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ClipUnit_0_DBG_V2PosZ_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_CommandProcessor_0_DBG_LAST_WRITE_ADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_CommandProcessor_0_DBG_LAST_WRITE_DATA_UNCONNECTED : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal NLW_DINTERP_TRIDATA_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_DINTERP_TRIDATA_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_DepthBuffer_0_STAT_PixelsFailedDepthTest_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_DepthBuffer_0_STAT_PixelsPassedDepthTest_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_DepthInterpStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_BarycentricBCFIFO_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_BarycentricConvertState_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_BarycentricNormalizeState_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_DepthTestDriverZState_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_IdleVector_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_InterpolatedDepthU24_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_InterpolatorDriverState_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_RastBarycentricB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_RastBarycentricC_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_DepthInterpolator_0_DBG_ShiftConvertZState_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_IndexBufferCache_0_DBG_IBCReadRequestsFIFO_full_UNCONNECTED : STD_LOGIC;
  signal NLW_IndexBufferCache_0_DBG_IBCReadResponsesFIFO_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_IndexBufferCache_0_DBG_State_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_InputAssemblerStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ROPStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ROPStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_ROPStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ROPStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ROPStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ROPStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ROPStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_ROP_0_DBG_CurrentBlendedColor_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ROP_0_DBG_CurrentCacheLineDirtyFlags_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_ROP_0_DBG_PreviousFramebufferColor_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ROP_0_DBG_TempBlendedOutputA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ROP_0_DBG_TempBlendedOutputRGB_UNCONNECTED : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal NLW_ROP_0_DBG_TempSelectedOutputA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_ROP_0_DBG_TempSelectedOutputRGB_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_Rasterizer_0_DBG_BarycentricA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_Rasterizer_0_DBG_BarycentricB_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_Rasterizer_0_DBG_BarycentricC_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ShaderCoreSystem_GPR0_PortA_en_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCoreSystem_GPR0_PortB_en_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCoreSystem_GPR0_PortW_en_UNCONNECTED : STD_LOGIC;
  signal NLW_ShaderCoreSystem_DBG_CurrentlyExecutingInstruction_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_StatsWriteOrderNibblesFIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_StatsWriteOrderNibblesFIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_TexSample_0_DBG_TexCache_douta_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_TriSetupStateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_TriSetup_0_DBG_LeftProd0_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetup_0_DBG_LeftProd1_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetup_0_DBG_LeftProd2_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetup_0_DBG_RightProd0_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetup_0_DBG_RightProd1_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_TriSetup_0_DBG_RightProd2_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_VBB_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBB_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBB_StateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_VBB_StateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_VBB_StateBlock_DBG_Slot0_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_VBB_StateBlock_DBG_Slot1_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_VBB_StateBlock_DBG_Slot2_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_VBB_StateBlock_DBG_Slot3_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_VBB_StateBlock_DBG_SlotsValid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_VBO_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBO_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBO_INDEX_FIFO_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VBO_INDEX_FIFO_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_VertexBatchBuilder_0_DBG_DoneGeneratingIndices_UNCONNECTED : STD_LOGIC;
  signal NLW_VertexBatchBuilder_0_DBG_QueueIsEmpty_UNCONNECTED : STD_LOGIC;
  signal NLW_VertexBatchBuilder_0_DBG_QueueIsFull_UNCONNECTED : STD_LOGIC;
  signal NLW_VertexBatchBuilder_0_DBG_CurrentIndexBatchLength_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_VertexBatchBuilder_0_DBG_IndexGeneratorRemainingPrims_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_proc_sys_reset_0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_act_n : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 ACT_N";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ddr4_sdram_c1_act_n : signal is "XIL_INTERFACENAME ddr4_sdram_c1, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 18, CAS_WRITE_LATENCY 14, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 32, MEMORY_PART MT40A256M16GE-075E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 750";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_bg : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 BG";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_ck_c : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 CK_C";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_ck_t : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 CK_T";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_cke : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 CKE";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_cs_n : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 CS_N";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_odt : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 ODT";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_reset_n : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 RESET_N";
  attribute X_INTERFACE_INFO of default_sysclk1_300_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 default_sysclk1_300 CLK_N";
  attribute X_INTERFACE_PARAMETER of default_sysclk1_300_clk_n : signal is "XIL_INTERFACENAME default_sysclk1_300, CAN_DEBUG false, FREQ_HZ 300000000";
  attribute X_INTERFACE_INFO of default_sysclk1_300_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 default_sysclk1_300 CLK_P";
  attribute X_INTERFACE_INFO of ext_mdio_pcs_pma_0_0_mdc : signal is "xilinx.com:interface:mdio:1.0 ext_mdio_pcs_pma_0_0 MDC";
  attribute X_INTERFACE_PARAMETER of ext_mdio_pcs_pma_0_0_mdc : signal is "XIL_INTERFACENAME ext_mdio_pcs_pma_0_0, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of ext_mdio_pcs_pma_0_0_mdio_i : signal is "xilinx.com:interface:mdio:1.0 ext_mdio_pcs_pma_0_0 MDIO_I";
  attribute X_INTERFACE_INFO of ext_mdio_pcs_pma_0_0_mdio_o : signal is "xilinx.com:interface:mdio:1.0 ext_mdio_pcs_pma_0_0 MDIO_O";
  attribute X_INTERFACE_INFO of ext_mdio_pcs_pma_0_0_mdio_t : signal is "xilinx.com:interface:mdio:1.0 ext_mdio_pcs_pma_0_0 MDIO_T";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of sgmii_0_0_rxn : signal is "xilinx.com:interface:sgmii:1.0 sgmii_0_0 RXN";
  attribute X_INTERFACE_INFO of sgmii_0_0_rxp : signal is "xilinx.com:interface:sgmii:1.0 sgmii_0_0 RXP";
  attribute X_INTERFACE_INFO of sgmii_0_0_txn : signal is "xilinx.com:interface:sgmii:1.0 sgmii_0_0 TXN";
  attribute X_INTERFACE_INFO of sgmii_0_0_txp : signal is "xilinx.com:interface:sgmii:1.0 sgmii_0_0 TXP";
  attribute X_INTERFACE_INFO of sgmii_phyclk_clk_n : signal is "xilinx.com:interface:diff_clock:1.0 sgmii_phyclk CLK_N";
  attribute X_INTERFACE_PARAMETER of sgmii_phyclk_clk_n : signal is "XIL_INTERFACENAME sgmii_phyclk, CAN_DEBUG false, FREQ_HZ 625000000";
  attribute X_INTERFACE_INFO of sgmii_phyclk_clk_p : signal is "xilinx.com:interface:diff_clock:1.0 sgmii_phyclk CLK_P";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_adr : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 ADR";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_ba : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 BA";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_dm_n : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 DM_N";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_dq : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 DQ";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_dqs_c : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 DQS_C";
  attribute X_INTERFACE_INFO of ddr4_sdram_c1_dqs_t : signal is "xilinx.com:interface:ddr4:1.0 ddr4_sdram_c1 DQS_T";
begin
  NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_I <= ext_mdio_pcs_pma_0_0_mdio_i;
  NetworkPacketSystem_sgmii_0_0_RXN <= sgmii_0_0_rxn;
  NetworkPacketSystem_sgmii_0_0_RXP <= sgmii_0_0_rxp;
  ddr4_sdram_c1_act_n <= ddr4_0_C0_DDR4_ACT_N;
  ddr4_sdram_c1_adr(16 downto 0) <= ddr4_0_C0_DDR4_ADR(16 downto 0);
  ddr4_sdram_c1_ba(1 downto 0) <= ddr4_0_C0_DDR4_BA(1 downto 0);
  ddr4_sdram_c1_bg <= ddr4_0_C0_DDR4_BG;
  ddr4_sdram_c1_ck_c <= ddr4_0_C0_DDR4_CK_C;
  ddr4_sdram_c1_ck_t <= ddr4_0_C0_DDR4_CK_T;
  ddr4_sdram_c1_cke <= ddr4_0_C0_DDR4_CKE;
  ddr4_sdram_c1_cs_n <= ddr4_0_C0_DDR4_CS_N;
  ddr4_sdram_c1_odt <= ddr4_0_C0_DDR4_ODT;
  ddr4_sdram_c1_reset_n <= ddr4_0_C0_DDR4_RESET_N;
  default_sysclk1_300_1_CLK_N <= default_sysclk1_300_clk_n;
  default_sysclk1_300_1_CLK_P <= default_sysclk1_300_clk_p;
  ext_mdio_pcs_pma_0_0_mdc <= NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDC;
  ext_mdio_pcs_pma_0_0_mdio_o <= NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_O;
  ext_mdio_pcs_pma_0_0_mdio_t <= NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_T;
  refclk625_in_0_1_CLK_N <= sgmii_phyclk_clk_n;
  refclk625_in_0_1_CLK_P <= sgmii_phyclk_clk_p;
  reset_1 <= reset;
  sgmii_0_0_txn <= NetworkPacketSystem_sgmii_0_0_TXN;
  sgmii_0_0_txp <= NetworkPacketSystem_sgmii_0_0_TXP;
  tmds_blue_n <= ScanoutSystem_out_blue_n_0;
  tmds_blue_p <= ScanoutSystem_out_blue_p_0;
  tmds_cl_n <= ScanoutSystem_out_cl_n_0;
  tmds_cl_p <= ScanoutSystem_out_cl_p_0;
  tmds_green_n <= ScanoutSystem_out_green_n_0;
  tmds_green_p <= ScanoutSystem_out_green_p_0;
  tmds_red_n <= ScanoutSystem_out_red_n_0;
  tmds_red_p <= ScanoutSystem_out_red_p_0;
ATTRINTERP_TRIDATA_FIFO: component design_1_fifo_generator_0_26
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(575 downto 0) => TriWorkCache2_0_INTERP_TRIDATA_WR_WR_DATA(575 downto 0),
      dout(575 downto 0) => TriWorkCache2_0_INTERP_TRIDATA_RD_RD_DATA(575 downto 0),
      empty => TriWorkCache2_0_INTERP_TRIDATA_RD_EMPTY,
      full => TriWorkCache2_0_INTERP_TRIDATA_WR_FULL,
      rd_en => TriWorkCache2_0_INTERP_TRIDATA_RD_RD_EN,
      rd_rst_busy => NLW_ATTRINTERP_TRIDATA_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => TriWorkCache2_0_INTERP_TRIDATA_WR_WR_EN,
      wr_rst_busy => NLW_ATTRINTERP_TRIDATA_FIFO_wr_rst_busy_UNCONNECTED
    );
ATTR_FIFO: component design_1_fifo_generator_0_23
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(127 downto 0) => DepthInterpolator_0_ATTR_FIFO_WR_DATA(127 downto 0),
      dout(127 downto 0) => ATTR_FIFO_dout(127 downto 0),
      empty => ATTR_FIFO_empty,
      full => DepthInterpolator_0_ATTR_FIFO_FULL,
      prog_full => ATTR_FIFO_prog_full,
      rd_en => AttrInterpolator_0_DINTERP_FIFO_rd_en,
      rd_rst_busy => NLW_ATTR_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => DepthInterpolator_0_ATTR_FIFO_WR_EN,
      wr_rst_busy => NLW_ATTR_FIFO_wr_rst_busy_UNCONNECTED
    );
AttrInterpStateBlock: component design_1_StateBlock_1_0
     port map (
      CMD_EndFrameReset => CommandProcessor_0_INTERP_EndFrameReset,
      CMD_NewStateBits(6 downto 0) => CommandProcessor_0_INTERP_NewStateBits(6 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_INTERP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => StateBlock_1_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_INTERP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_AttrInterpStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_AttrInterpStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_AttrInterpStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_AttrInterpStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_AttrInterpStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_AttrInterpStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_AttrInterpStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => AttrInterpolator_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => StateBlock_1_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(6 downto 0) => StateBlock_1_STAGE_StateBitsAtDrawID(6 downto 0),
      STAGE_StateIsValid => StateBlock_1_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
AttrInterp_FPU_CNV0: component design_1_StandaloneFloatALU_C_0_0
     port map (
      ICNV_GO => AttrInterpolator_0_FPU_CNV0_GO,
      IN_A(31 downto 0) => AttrInterpolator_0_FPU_CNV_A(31 downto 0),
      IN_MODE(2 downto 0) => AttrInterpolator_0_FPU_CNV0_Mode(2 downto 0),
      OCNV(31 downto 0) => AttrInterp_FPU_CNV_OCNV(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
AttrInterp_FPU_CNV1: component design_1_StandaloneFloatALU_C_0_3
     port map (
      ICNV_GO => AttrInterpolator_0_FPU_CNV1_GO,
      IN_A(31 downto 0) => AttrInterpolator_0_FPU_CNV1_A(31 downto 0),
      IN_MODE(2 downto 0) => AttrInterpolator_0_FPU_CNV1_Mode(2 downto 0),
      OCNV(31 downto 0) => AttrInterp_FPU_CNV1_OCNV(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
AttrInterp_FPU_MUL: component design_1_StandaloneFloatALU_M_0_2
     port map (
      IMUL_GO => AttrInterpolator_0_FPU_MUL_GO,
      IN_A(31 downto 0) => AttrInterpolator_0_FPU_MUL_A(31 downto 0),
      IN_B(31 downto 0) => AttrInterpolator_0_FPU_MUL_B(31 downto 0),
      OMUL(31 downto 0) => StandaloneFloatALU_M_0_OMUL2(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
AttrInterpolator_0: component design_1_AttrInterpolator_0_0
     port map (
      CMD_IsIdle => AttrInterpolator_0_CMD_IsIdle,
      DBG_AttrInterpolator_State(2 downto 0) => AttrInterpolator_0_DBG_AttrInterpolator_State(2 downto 0),
      DBG_ConverterDriver_State(2 downto 0) => NLW_AttrInterpolator_0_DBG_ConverterDriver_State_UNCONNECTED(2 downto 0),
      DBG_CurrentDrawEvent(15 downto 0) => AttrInterpolator_0_DBG_CurrentDrawEvent(15 downto 0),
      DBG_InterpolatorDriver_State(2 downto 0) => NLW_AttrInterpolator_0_DBG_InterpolatorDriver_State_UNCONNECTED(2 downto 0),
      DBG_MultiplierDriver_State(2 downto 0) => NLW_AttrInterpolator_0_DBG_MultiplierDriver_State_UNCONNECTED(2 downto 0),
      DBG_OutputDriver_State(2 downto 0) => NLW_AttrInterpolator_0_DBG_OutputDriver_State_UNCONNECTED(2 downto 0),
      DBG_PixelWFIFO(31 downto 0) => NLW_AttrInterpolator_0_DBG_PixelWFIFO_UNCONNECTED(31 downto 0),
      DBG_RastBarycentricB(31 downto 0) => AttrInterpolator_0_DBG_RastBarycentricB(31 downto 0),
      DBG_RastBarycentricC(31 downto 0) => AttrInterpolator_0_DBG_RastBarycentricC(31 downto 0),
      DINTERP_FIFO_empty => ATTR_FIFO_empty,
      DINTERP_FIFO_rd_data(127 downto 0) => ATTR_FIFO_dout(127 downto 0),
      DINTERP_FIFO_rd_en => AttrInterpolator_0_DINTERP_FIFO_rd_en,
      FPU_CNV0_A(31 downto 0) => AttrInterpolator_0_FPU_CNV_A(31 downto 0),
      FPU_CNV0_GO => AttrInterpolator_0_FPU_CNV0_GO,
      FPU_CNV0_Mode(2 downto 0) => AttrInterpolator_0_FPU_CNV0_Mode(2 downto 0),
      FPU_CNV0_OUT(31 downto 0) => AttrInterp_FPU_CNV_OCNV(31 downto 0),
      FPU_CNV1_A(31 downto 0) => AttrInterpolator_0_FPU_CNV1_A(31 downto 0),
      FPU_CNV1_GO => AttrInterpolator_0_FPU_CNV1_GO,
      FPU_CNV1_Mode(2 downto 0) => AttrInterpolator_0_FPU_CNV1_Mode(2 downto 0),
      FPU_CNV1_OUT(31 downto 0) => AttrInterp_FPU_CNV1_OCNV(31 downto 0),
      FPU_MUL_A(31 downto 0) => AttrInterpolator_0_FPU_MUL_A(31 downto 0),
      FPU_MUL_B(31 downto 0) => AttrInterpolator_0_FPU_MUL_B(31 downto 0),
      FPU_MUL_GO => AttrInterpolator_0_FPU_MUL_GO,
      FPU_MUL_OUT(31 downto 0) => StandaloneFloatALU_M_0_OMUL2(31 downto 0),
      STATE_ConsumeStateSlot => AttrInterpolator_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => StateBlock_1_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(6 downto 0) => StateBlock_1_STAGE_StateBitsAtDrawID(6 downto 0),
      STATE_StateIsValid => StateBlock_1_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => AttrInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => AttrInterpolator_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => AttrInterpolator_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => AttrInterpolator_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TEXSAMP_OutFIFO_almost_full => TEXSAMP_FIFO_prog_full,
      TEXSAMP_OutFIFO_full => AttrInterpolator_0_TEXSAMP_OUT_FIFO_FULL,
      TEXSAMP_OutFIFO_wr_data(95 downto 0) => AttrInterpolator_0_TEXSAMP_OutFIFO_wr_data(95 downto 0),
      TEXSAMP_OutFIFO_wr_en => AttrInterpolator_0_TEXSAMP_OUT_FIFO_WR_EN,
      TRICACHE_PopTriangleSlot => AttrInterpolator_0_TRICACHE_PopTriangleSlot,
      TRICACHE_inColorRGBA0(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA0(127 downto 0),
      TRICACHE_inColorRGBA10(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA10(127 downto 0),
      TRICACHE_inColorRGBA20(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA20(127 downto 0),
      TRICACHE_inT0X(31 downto 0) => TriWorkCache2_0_INTERP_outT0X(31 downto 0),
      TRICACHE_inT0Y(31 downto 0) => TriWorkCache2_0_INTERP_outT0Y(31 downto 0),
      TRICACHE_inT10X(31 downto 0) => TriWorkCache2_0_INTERP_outT10X(31 downto 0),
      TRICACHE_inT10Y(31 downto 0) => TriWorkCache2_0_INTERP_outT10Y(31 downto 0),
      TRICACHE_inT20X(31 downto 0) => TriWorkCache2_0_INTERP_outT20X(31 downto 0),
      TRICACHE_inT20Y(31 downto 0) => TriWorkCache2_0_INTERP_outT20Y(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CLIP_FPU_ADD_0: component design_1_StandaloneFloatALU_A_0_1
     port map (
      IADD_GO => ClipUnit_0_FPU_Add0_IADD_GO,
      IN_A(31 downto 0) => ClipUnit_0_FPU_Add0_A(31 downto 0),
      IN_B(31 downto 0) => ClipUnit_0_FPU_Add0_B(31 downto 0),
      OADD(31 downto 0) => StandaloneFloatALU_A_0_OADD1(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CLIP_FPU_ADD_1: component design_1_StandaloneFloatALU_A_1_0
     port map (
      IADD_GO => ClipUnit_0_FPU_Add1_IADD_GO,
      IN_A(31 downto 0) => ClipUnit_0_FPU_Add1_A(31 downto 0),
      IN_B(31 downto 0) => ClipUnit_0_FPU_Add1_B(31 downto 0),
      OADD(31 downto 0) => StandaloneFloatALU_A_1_OADD(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CLIP_FPU_MUL_0: component design_1_StandaloneFloatALU_M_0_1
     port map (
      IMUL_GO => ClipUnit_0_FPU_Mul0_IMUL_GO,
      IN_A(31 downto 0) => ClipUnit_0_FPU_Mul0_A(31 downto 0),
      IN_B(31 downto 0) => ClipUnit_0_FPU_Mul0_B(31 downto 0),
      OMUL(31 downto 0) => StandaloneFloatALU_M_0_OMUL1(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CLIP_FPU_MUL_1: component design_1_StandaloneFloatALU_M_1_0
     port map (
      IMUL_GO => ClipUnit_0_FPU_Mul1_IMUL_GO,
      IN_A(31 downto 0) => ClipUnit_0_FPU_Mul1_A(31 downto 0),
      IN_B(31 downto 0) => ClipUnit_0_FPU_Mul1_B(31 downto 0),
      OMUL(31 downto 0) => StandaloneFloatALU_M_1_OMUL(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CLIP_FPU_SPEC_0: component design_1_StandaloneFloatALU_S_0_1
     port map (
      IN_A(31 downto 0) => ClipUnit_0_FPU_Rcp0_A(31 downto 0),
      ISPEC_GO => ClipUnit_0_FPU_Rcp0_ISPEC_GO,
      OSPEC(31 downto 0) => StandaloneFloatALU_S_0_OSPEC1(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ClearBlock_0: component design_1_ClearBlock_0_0
     port map (
      CMD_BaseRenderTargetAddr(29 downto 0) => CommandProcessor_0_CLEAR_BaseRenderTargetAddr(29 downto 0),
      CMD_ClearBlockBeginSignal => CommandProcessor_0_CLEAR_ClearBlockBeginSignal,
      CMD_ClearBlockIsIdle => ClearBlock_0_CMD_ClearBlockIsIdle,
      CMD_ClearColorRGBA(31 downto 0) => CommandProcessor_0_CLEAR_ClearColorRGBA(31 downto 0),
      CMD_ClearDRAMLineCount(15 downto 0) => CommandProcessor_0_CLEAR_ClearDRAMLineCount(15 downto 0),
      DBG_ClearBlock_State(3 downto 0) => ClearBlock_0_DBG_ClearBlock_State(3 downto 0),
      DBG_LastWrittenClearData(293 downto 0) => ClearBlock_0_DBG_LastWrittenClearData(293 downto 0),
      MEM_ClearBlockWriteRequestsFIFO_full => ClearBlock_0_ClearBlockWriteRequestsFIFO_FULL,
      MEM_ClearBlockWriteRequestsFIFO_wr_data(293 downto 0) => ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_DATA(293 downto 0),
      MEM_ClearBlockWriteRequestsFIFO_wr_en => ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_EN,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ClipUnitStateBlock: component design_1_StateBlock_0_1
     port map (
      CMD_EndFrameReset => CommandProcessor_0_CLIP_EndFrameReset,
      CMD_NewStateBits(10 downto 0) => CommandProcessor_0_CLIP_NewStateBits(10 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_CLIP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => StateBlock_0_CMD_NumFreeSlots1(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_CLIP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_ClipUnitStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_ClipUnitStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_ClipUnitStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_ClipUnitStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_ClipUnitStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_ClipUnitStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_ClipUnitStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => ClipUnit_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => StateBlock_0_STAGE_NextDrawID1(15 downto 0),
      STAGE_StateBitsAtDrawID(10 downto 0) => StateBlock_0_STAGE_StateBitsAtDrawID1(10 downto 0),
      STAGE_StateIsValid => StateBlock_0_STAGE_StateIsValid1,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ClipUnit_0: component design_1_ClipUnit_0_0
     port map (
      CMD_IsIdle => ClipUnit_0_CMD_IsIdle,
      DBG_AlreadyClippedPlanes(10 downto 0) => ClipUnit_0_DBG_AlreadyClippedPlanes(10 downto 0),
      DBG_ChildTriStackSize(2 downto 0) => NLW_ClipUnit_0_DBG_ChildTriStackSize_UNCONNECTED(2 downto 0),
      DBG_ClipDistance0(31 downto 0) => ClipUnit_0_DBG_ClipDistance0(31 downto 0),
      DBG_ClipDistance1(31 downto 0) => ClipUnit_0_DBG_ClipDistance1(31 downto 0),
      DBG_ClipOutcodes0(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes0(10 downto 0),
      DBG_ClipOutcodes1(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes1(10 downto 0),
      DBG_ClipOutcodes2(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes2(10 downto 0),
      DBG_CurrentClipBitmask(2 downto 0) => ClipUnit_0_DBG_CurrentClipBitmask(2 downto 0),
      DBG_CurrentClipPlane(3 downto 0) => ClipUnit_0_DBG_CurrentClipPlane(3 downto 0),
      DBG_CurrentState(7 downto 0) => ClipUnit_0_DBG_CurrentState(7 downto 0),
      DBG_TriangleIntersectsViewport => NLW_ClipUnit_0_DBG_TriangleIntersectsViewport_UNCONNECTED,
      DBG_V0PosW(31 downto 0) => ClipUnit_0_DBG_V0PosW(31 downto 0),
      DBG_V0PosX(31 downto 0) => ClipUnit_0_DBG_V0PosX(31 downto 0),
      DBG_V0PosY(31 downto 0) => ClipUnit_0_DBG_V0PosY(31 downto 0),
      DBG_V0PosZ(31 downto 0) => ClipUnit_0_DBG_V0PosZ(31 downto 0),
      DBG_V1PosW(31 downto 0) => NLW_ClipUnit_0_DBG_V1PosW_UNCONNECTED(31 downto 0),
      DBG_V1PosX(31 downto 0) => NLW_ClipUnit_0_DBG_V1PosX_UNCONNECTED(31 downto 0),
      DBG_V1PosY(31 downto 0) => NLW_ClipUnit_0_DBG_V1PosY_UNCONNECTED(31 downto 0),
      DBG_V1PosZ(31 downto 0) => NLW_ClipUnit_0_DBG_V1PosZ_UNCONNECTED(31 downto 0),
      DBG_V2PosW(31 downto 0) => NLW_ClipUnit_0_DBG_V2PosW_UNCONNECTED(31 downto 0),
      DBG_V2PosX(31 downto 0) => NLW_ClipUnit_0_DBG_V2PosX_UNCONNECTED(31 downto 0),
      DBG_V2PosY(31 downto 0) => NLW_ClipUnit_0_DBG_V2PosY_UNCONNECTED(31 downto 0),
      DBG_V2PosZ(31 downto 0) => NLW_ClipUnit_0_DBG_V2PosZ_UNCONNECTED(31 downto 0),
      FPU_Add0_A(31 downto 0) => ClipUnit_0_FPU_Add0_A(31 downto 0),
      FPU_Add0_B(31 downto 0) => ClipUnit_0_FPU_Add0_B(31 downto 0),
      FPU_Add0_IADD_GO => ClipUnit_0_FPU_Add0_IADD_GO,
      FPU_Add0_OUT(31 downto 0) => StandaloneFloatALU_A_0_OADD1(31 downto 0),
      FPU_Add1_A(31 downto 0) => ClipUnit_0_FPU_Add1_A(31 downto 0),
      FPU_Add1_B(31 downto 0) => ClipUnit_0_FPU_Add1_B(31 downto 0),
      FPU_Add1_IADD_GO => ClipUnit_0_FPU_Add1_IADD_GO,
      FPU_Add1_OUT(31 downto 0) => StandaloneFloatALU_A_1_OADD(31 downto 0),
      FPU_Mul0_A(31 downto 0) => ClipUnit_0_FPU_Mul0_A(31 downto 0),
      FPU_Mul0_B(31 downto 0) => ClipUnit_0_FPU_Mul0_B(31 downto 0),
      FPU_Mul0_IMUL_GO => ClipUnit_0_FPU_Mul0_IMUL_GO,
      FPU_Mul0_OUT(31 downto 0) => StandaloneFloatALU_M_0_OMUL1(31 downto 0),
      FPU_Mul1_A(31 downto 0) => ClipUnit_0_FPU_Mul1_A(31 downto 0),
      FPU_Mul1_B(31 downto 0) => ClipUnit_0_FPU_Mul1_B(31 downto 0),
      FPU_Mul1_IMUL_GO => ClipUnit_0_FPU_Mul1_IMUL_GO,
      FPU_Mul1_OUT(31 downto 0) => StandaloneFloatALU_M_1_OMUL(31 downto 0),
      FPU_Rcp0_A(31 downto 0) => ClipUnit_0_FPU_Rcp0_A(31 downto 0),
      FPU_Rcp0_ISPEC_GO => ClipUnit_0_FPU_Rcp0_ISPEC_GO,
      FPU_Rcp0_OUT(31 downto 0) => StandaloneFloatALU_S_0_OSPEC1(31 downto 0),
      IA_CurrentDrawEventID(15 downto 0) => InputAssembler2_0_CLIP_CurrentDrawEventID(15 downto 0),
      IA_inPreviousStageIsValid => InputAssembler2_0_CLIP_newTriBegin,
      IA_inWholeTriangleAABBIntersectsViewport => InputAssembler2_0_CLIP_AABBTriOverlapsViewport,
      IA_inv0ClipOutcodes(10 downto 0) => InputAssembler2_0_CLIP_v0ClipCodes(10 downto 0),
      IA_inv0rgba(127 downto 0) => InputAssembler2_0_CLIP_vertColor0_RGBA(127 downto 0),
      IA_inv0tx(31 downto 0) => InputAssembler2_0_CLIP_tex0_X(31 downto 0),
      IA_inv0ty(31 downto 0) => InputAssembler2_0_CLIP_tex0_Y(31 downto 0),
      IA_inv0w(31 downto 0) => InputAssembler2_0_CLIP_v0PosW(31 downto 0),
      IA_inv0x(31 downto 0) => InputAssembler2_0_CLIP_v0PosX(31 downto 0),
      IA_inv0y(31 downto 0) => InputAssembler2_0_CLIP_v0PosY(31 downto 0),
      IA_inv0z(31 downto 0) => InputAssembler2_0_CLIP_v0PosZ(31 downto 0),
      IA_inv1ClipOutcodes(10 downto 0) => InputAssembler2_0_CLIP_v1ClipCodes(10 downto 0),
      IA_inv1rgba(127 downto 0) => InputAssembler2_0_CLIP_vertColor1_RGBA(127 downto 0),
      IA_inv1tx(31 downto 0) => InputAssembler2_0_CLIP_tex1_X(31 downto 0),
      IA_inv1ty(31 downto 0) => InputAssembler2_0_CLIP_tex1_Y(31 downto 0),
      IA_inv1w(31 downto 0) => InputAssembler2_0_CLIP_v1PosW(31 downto 0),
      IA_inv1x(31 downto 0) => InputAssembler2_0_CLIP_v1PosX(31 downto 0),
      IA_inv1y(31 downto 0) => InputAssembler2_0_CLIP_v1PosY(31 downto 0),
      IA_inv1z(31 downto 0) => InputAssembler2_0_CLIP_v1PosZ(31 downto 0),
      IA_inv2ClipOutcodes(10 downto 0) => InputAssembler2_0_CLIP_v2ClipCodes(10 downto 0),
      IA_inv2rgba(127 downto 0) => InputAssembler2_0_CLIP_vertColor2_RGBA(127 downto 0),
      IA_inv2tx(31 downto 0) => InputAssembler2_0_CLIP_tex2_X(31 downto 0),
      IA_inv2ty(31 downto 0) => InputAssembler2_0_CLIP_tex2_Y(31 downto 0),
      IA_inv2w(31 downto 0) => InputAssembler2_0_CLIP_v2PosW(31 downto 0),
      IA_inv2x(31 downto 0) => InputAssembler2_0_CLIP_v2PosX(31 downto 0),
      IA_inv2y(31 downto 0) => InputAssembler2_0_CLIP_v2PosY(31 downto 0),
      IA_inv2z(31 downto 0) => InputAssembler2_0_CLIP_v2PosZ(31 downto 0),
      IA_outPreviousStageIsReady => ClipUnit_0_IA_outPreviousStageIsReady,
      STATE_ConsumeStateSlot => ClipUnit_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => StateBlock_0_STAGE_NextDrawID1(15 downto 0),
      STATE_StateBitsAtDrawID(10 downto 0) => StateBlock_0_STAGE_StateBitsAtDrawID1(10 downto 0),
      STATE_StateIsValid => StateBlock_0_STAGE_StateIsValid1,
      STAT_CurrentDrawEventID(15 downto 0) => ClipUnit_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => ClipUnit_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => ClipUnit_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => ClipUnit_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TRISETUP_CurrentDrawEventID(15 downto 0) => ClipUnit_0_TRISETUP_CurrentDrawEventID(15 downto 0),
      TRISETUP_inNextStageisReady => TriSetup_0_CLIP_readyForNewTri,
      TRISETUP_outNextStageIsValid => ClipUnit_0_TRISETUP_outNextStageIsValid,
      TRISETUP_outv0rgba(127 downto 0) => ClipUnit_0_TRISETUP_outv0rgba(127 downto 0),
      TRISETUP_outv0tx(31 downto 0) => ClipUnit_0_TRISETUP_outv0tx(31 downto 0),
      TRISETUP_outv0ty(31 downto 0) => ClipUnit_0_TRISETUP_outv0ty(31 downto 0),
      TRISETUP_outv0w(31 downto 0) => ClipUnit_0_TRISETUP_outv0w(31 downto 0),
      TRISETUP_outv0x(31 downto 0) => ClipUnit_0_TRISETUP_outv0x(31 downto 0),
      TRISETUP_outv0y(31 downto 0) => ClipUnit_0_TRISETUP_outv0y(31 downto 0),
      TRISETUP_outv0z(31 downto 0) => ClipUnit_0_TRISETUP_outv0z(31 downto 0),
      TRISETUP_outv1rgba(127 downto 0) => ClipUnit_0_TRISETUP_outv1rgba(127 downto 0),
      TRISETUP_outv1tx(31 downto 0) => ClipUnit_0_TRISETUP_outv1tx(31 downto 0),
      TRISETUP_outv1ty(31 downto 0) => ClipUnit_0_TRISETUP_outv1ty(31 downto 0),
      TRISETUP_outv1w(31 downto 0) => ClipUnit_0_TRISETUP_outv1w(31 downto 0),
      TRISETUP_outv1x(31 downto 0) => ClipUnit_0_TRISETUP_outv1x(31 downto 0),
      TRISETUP_outv1y(31 downto 0) => ClipUnit_0_TRISETUP_outv1y(31 downto 0),
      TRISETUP_outv1z(31 downto 0) => ClipUnit_0_TRISETUP_outv1z(31 downto 0),
      TRISETUP_outv2rgba(127 downto 0) => ClipUnit_0_TRISETUP_outv2rgba(127 downto 0),
      TRISETUP_outv2tx(31 downto 0) => ClipUnit_0_TRISETUP_outv2tx(31 downto 0),
      TRISETUP_outv2ty(31 downto 0) => ClipUnit_0_TRISETUP_outv2ty(31 downto 0),
      TRISETUP_outv2w(31 downto 0) => ClipUnit_0_TRISETUP_outv2w(31 downto 0),
      TRISETUP_outv2x(31 downto 0) => ClipUnit_0_TRISETUP_outv2x(31 downto 0),
      TRISETUP_outv2y(31 downto 0) => ClipUnit_0_TRISETUP_outv2y(31 downto 0),
      TRISETUP_outv2z(31 downto 0) => ClipUnit_0_TRISETUP_outv2z(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
CommandProcessor_0: component design_1_CommandProcessor_0_0
     port map (
      CLEAR_BaseRenderTargetAddr(29 downto 0) => CommandProcessor_0_CLEAR_BaseRenderTargetAddr(29 downto 0),
      CLEAR_ClearBlockBeginSignal => CommandProcessor_0_CLEAR_ClearBlockBeginSignal,
      CLEAR_ClearColorRGBA(31 downto 0) => CommandProcessor_0_CLEAR_ClearColorRGBA(31 downto 0),
      CLEAR_ClearDRAMLineCount(15 downto 0) => CommandProcessor_0_CLEAR_ClearDRAMLineCount(15 downto 0),
      CLIP_EndFrameReset => CommandProcessor_0_CLIP_EndFrameReset,
      CLIP_NewStateBits(10 downto 0) => CommandProcessor_0_CLIP_NewStateBits(10 downto 0),
      CLIP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_CLIP_NewStateDrawEventID(15 downto 0),
      CLIP_NumFreeSlots(2 downto 0) => StateBlock_0_CMD_NumFreeSlots1(2 downto 0),
      CLIP_SetNewState => CommandProcessor_0_CLIP_SetNewState,
      CMD_AttrInterpolator_Idle => AttrInterpolator_0_CMD_IsIdle,
      CMD_ClearBlock_Idle => ClearBlock_0_CMD_ClearBlockIsIdle,
      CMD_Clip_Idle => ClipUnit_0_CMD_IsIdle,
      CMD_DepthInterpolator_Idle => DepthInterpolator_0_CMD_IsIdle,
      CMD_Depth_Idle => DepthBuffer_0_CMD_DepthIsIdle,
      CMD_FIFO_EMPTY_ATTR => ATTR_FIFO_empty,
      CMD_FIFO_EMPTY_RASTOUT => rast_out_fifo_empty,
      CMD_FIFO_EMPTY_ROP => ROP_FIFO_empty,
      CMD_FIFO_EMPTY_TEXSAMP => TEXSAMP_FIFO_empty,
      CMD_FIFO_EMPTY_VBB => VBB_FIFO_empty,
      CMD_FIFO_EMPTY_VS => VBO_FIFO_empty,
      CMD_IA_Idle => InputAssembler2_0_CMD_IA_Idle,
      CMD_MemController_Idle => MemorySystem_CMD_MemoryControllerIsIdle,
      CMD_ROP_Idle => ROP_0_CMD_ROPIsIdle,
      CMD_Rasterizer_Idle => Rasterizer_0_CMD_Rasterizer_Idle,
      CMD_TexSampler_Idle => TexSample_0_CMD_TexSampleIsIdle,
      CMD_TriSetup_Idle => TriSetup_0_CMD_TriSetupIsIdle,
      CMD_VS_Idle => ShaderCoreSystem_CMD_IsIdle,
      CMD_VSync => ScanoutSystem_CMD_VSync,
      CommandProcReadRequestsFIFO_full => CommandProcessor_0_CommandProcReadRequestsFIFO_FULL,
      CommandProcReadRequestsFIFO_wr_data(29 downto 0) => CommandProcessor_0_CommandProcReadRequestsFIFO_WR_DATA(29 downto 0),
      CommandProcReadRequestsFIFO_wr_en => CommandProcessor_0_CommandProcReadRequestsFIFO_WR_EN,
      CommandProcReadResponsesFIFO_empty => CommandProcessor_0_CommandProcReadResponses_EMPTY,
      CommandProcReadResponsesFIFO_rd_data(255 downto 0) => CommandProcessor_0_CommandProcReadResponses_RD_DATA(255 downto 0),
      CommandProcReadResponsesFIFO_rd_en => CommandProcessor_0_CommandProcReadResponses_RD_EN,
      CommandProcWriteRequestsFIFO_full => CommandProcessor_0_CommandProcWriteRequests_FULL,
      CommandProcWriteRequestsFIFO_wr_data(293 downto 0) => CommandProcessor_0_CommandProcWriteRequests_WR_DATA(293 downto 0),
      CommandProcWriteRequestsFIFO_wr_en => CommandProcessor_0_CommandProcWriteRequests_WR_EN,
      DBG_CMDPACKETSTATE(7 downto 0) => CommandProcessor_0_DBG_PACKETSTATE(7 downto 0),
      DBG_CurrentDrawGeneration(15 downto 0) => CommandProcessor_0_DBG_CurrentDrawGeneration(15 downto 0),
      DBG_IdleSignalsVector(12 downto 0) => CommandProcessor_0_DBG_IdleSignalsVector(12 downto 0),
      DBG_LAST_IN_PACKET(87 downto 0) => CommandProcessor_0_DBG_LAST_IN_PACKET(87 downto 0),
      DBG_LAST_OUT_PACKET(87 downto 0) => CommandProcessor_0_DBG_LAST_OUT_PACKET(87 downto 0),
      DBG_LAST_READ_DATA(31 downto 0) => CommandProcessor_0_DBG_LAST_READ_DATA(31 downto 0),
      DBG_LAST_WRITE_ADDR(31 downto 0) => NLW_CommandProcessor_0_DBG_LAST_WRITE_ADDR_UNCONNECTED(31 downto 0),
      DBG_LAST_WRITE_DATA(255 downto 0) => NLW_CommandProcessor_0_DBG_LAST_WRITE_DATA_UNCONNECTED(255 downto 0),
      DEPTH_ClearDepthBuffer => CommandProcessor_0_DEPTH_ClearDepthBuffer,
      DEPTH_ClearDepthValue(23 downto 0) => CommandProcessor_0_DEPTH_ClearDepthValue(23 downto 0),
      DINTERP_EndFrameReset => CommandProcessor_0_DINTERP_EndFrameReset,
      DINTERP_NewStateBits(39 downto 0) => CommandProcessor_0_DINTERP_NewStateBits(39 downto 0),
      DINTERP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_DINTERP_NewStateDrawEventID(15 downto 0),
      DINTERP_NumFreeSlots(2 downto 0) => DepthInterpStateBlock_CMD_NumFreeSlots(2 downto 0),
      DINTERP_STAT_CountDepthOnlyPixelsPassed(31 downto 0) => DepthInterpolator_0_STAT_DepthOnlyPixelsPassed(31 downto 0),
      DINTERP_SetNewState => CommandProcessor_0_DINTERP_SetNewState,
      IA_EndFrameReset => CommandProcessor_0_IA_EndFrameReset,
      IA_NewStateBits(4 downto 0) => CommandProcessor_0_IA_NewStateBits(4 downto 0),
      IA_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_IA_NewStateDrawEventID(15 downto 0),
      IA_NumFreeSlots(2 downto 0) => InputAssemblerStateBlock_CMD_NumFreeSlots(2 downto 0),
      IA_SetNewState => CommandProcessor_0_IA_SetNewState,
      INTERP_EndFrameReset => CommandProcessor_0_INTERP_EndFrameReset,
      INTERP_NewStateBits(6 downto 0) => CommandProcessor_0_INTERP_NewStateBits(6 downto 0),
      INTERP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_INTERP_NewStateDrawEventID(15 downto 0),
      INTERP_NumFreeSlots(2 downto 0) => StateBlock_1_CMD_NumFreeSlots(2 downto 0),
      INTERP_SetNewState => CommandProcessor_0_INTERP_SetNewState,
      ROP_ClearSignal => CommandProcessor_0_ROP_ClearSignal,
      ROP_ClearSignalAck => ROP_0_CMD_ClearSignalAck,
      ROP_EndFrameReset => CommandProcessor_0_ROP_EndFrameReset,
      ROP_FlushCacheAck => ROP_0_CMD_FlushCacheAck,
      ROP_FlushCacheSignal => CommandProcessor_0_ROP_FlushCacheSignal,
      ROP_NewStateBits(100 downto 0) => CommandProcessor_0_ROP_NewStateBits(100 downto 0),
      ROP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_ROP_NewStateDrawEventID(15 downto 0),
      ROP_NumFreeSlots(2 downto 0) => ROPStateBlock_CMD_NumFreeSlots(2 downto 0),
      ROP_STAT_CountPixelsPassed(31 downto 0) => ROP_0_STAT_CountPixelsPassed(31 downto 0),
      ROP_STAT_CurrentDrawEventID(15 downto 0) => ROP_0_STAT_CurrentDrawEventID(15 downto 0),
      ROP_SetClearColor(31 downto 0) => CommandProcessor_0_ROP_SetClearColor(31 downto 0),
      ROP_SetNewState => CommandProcessor_0_ROP_SetNewState,
      SCANOUT_InvertOutputColor => CommandProcessor_0_SCANOUT_InvertOutputColor,
      SCANOUT_OutputColorChannels(8 downto 0) => CommandProcessor_0_SCANOUT_OutputColorChannels(8 downto 0),
      SCANOUT_RenderTargetBaseAddr(29 downto 0) => CommandProcessor_0_SCANOUT_RenderTargetBaseAddr(29 downto 0),
      SCANOUT_ScanEnable => CommandProcessor_0_SCANOUT_ScanEnable,
      SHADER_InCommand(2 downto 0) => CMD_InCommand_0_1(2 downto 0),
      SHADER_IsReadyForCommand => ShaderCoreSystem_CMD_IsReadyForCommand_0,
      SHADER_LoadProgramAddr(29 downto 0) => CMD_LoadProgramAddr_0_1(29 downto 0),
      SHADER_LoadProgramLen(15 downto 0) => CMD_LoadProgramLen_0_1(15 downto 0),
      SHADER_ReadRegisterOutData(127 downto 0) => ShaderCoreSystem_DBG_ReadRegisterOutData(127 downto 0),
      SHADER_ReadRegisterOutDataReady => ShaderCoreSystem_DBG_ReadRegisterOutDataReady,
      SHADER_ReadRegisterOutRequest => CommandProcessor_0_SHADER_ReadRegisterOutRequest,
      SHADER_SetConstantData(127 downto 0) => CMD_SetConstantData_0_1(127 downto 0),
      SHADER_SetConstantIndex(7 downto 0) => CMD_SetConstantIndex_0_1(7 downto 0),
      SHADER_SetNumVertexStreams(2 downto 0) => CMD_SetNumVertexStreams_0_1(2 downto 0),
      SHADER_SetVertexStreamDWORDCount(2 downto 0) => CMD_SetVertexStreamDWORDCount_0_1(2 downto 0),
      SHADER_SetVertexStreamDWORDOffset(5 downto 0) => CMD_SetVertexStreamDWORDOffset_0_1(5 downto 0),
      SHADER_SetVertexStreamDWORDStride(5 downto 0) => CMD_SetVertexStreamDWORDStride_0_1(5 downto 0),
      SHADER_SetVertexStreamID(2 downto 0) => CMD_SetVertexStreamID_0_1(2 downto 0),
      SHADER_SetVertexStreamIsD3DCOLOR => CMD_SetVertexStreamIsD3DCOLOR_0_1,
      SHADER_SetVertexStreamShaderRegIndex(2 downto 0) => CMD_SetVertexStreamShaderRegIndex_0_1(2 downto 0),
      STAT_CountTimestampsMemoryWrites(15 downto 0) => StatsCollector_0_CMD_CountTimestampsMemoryWrites(15 downto 0),
      STAT_CountTimestampsOrdersMemoryWrites(15 downto 0) => StatsCollector_0_CMD_CountTimestampsOrdersMemoryWrites(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => CommandProcessor_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => CommandProcessor_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_EnableEventTimestamps => CommandProcessor_0_STAT_EnableEventTimestamps,
      STAT_PresentSignal => CommandProcessor_0_STAT_PresentSignal,
      STAT_SetNewStatsConfig => CommandProcessor_0_STAT_SetNewStatsConfig,
      STAT_StatsSaveComplete => StatsCollector_0_CMD_StatsSaveComplete,
      STAT_WriteEventTimestampOrders(29 downto 0) => CommandProcessor_0_STAT_WriteEventTimestampOrders(29 downto 0),
      STAT_WriteEventTimestampsAddress(29 downto 0) => CommandProcessor_0_STAT_WriteEventTimestampsAddress(29 downto 0),
      STAT_WriteFrameStatsAddress(29 downto 0) => CommandProcessor_0_STAT_WriteFrameStatsAddress(29 downto 0),
      TEXSAMP_EndFrameReset => CommandProcessor_0_TEXSAMP_EndFrameReset,
      TEXSAMP_NewStateBits(73 downto 0) => CommandProcessor_0_TEXSAMP_NewStateBits(73 downto 0),
      TEXSAMP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_TEXSAMP_NewStateDrawEventID(15 downto 0),
      TEXSAMP_NumFreeSlots(2 downto 0) => StateBlock_0_CMD_NumFreeSlots(2 downto 0),
      TEXSAMP_SetNewState => CommandProcessor_0_TEXSAMP_SetNewState,
      TRISETUP_EndFrameReset => CommandProcessor_0_TRISETUP_EndFrameReset,
      TRISETUP_NewStateBits(191 downto 0) => CommandProcessor_0_TRISETUP_NewStateBits(191 downto 0),
      TRISETUP_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_TRISETUP_NewStateDrawEventID(15 downto 0),
      TRISETUP_NumFreeSlots(2 downto 0) => TriSetupStateBlock_CMD_NumFreeSlots(2 downto 0),
      TRISETUP_SetNewState => CommandProcessor_0_TRISETUP_SetNewState,
      VBB_CommandArg0(23 downto 0) => CommandProcessor_0_VBB_CommandArg0(23 downto 0),
      VBB_CommandArg1(19 downto 0) => CommandProcessor_0_VBB_CommandArg1(19 downto 0),
      VBB_CommandArg2(15 downto 0) => CommandProcessor_0_VBB_CommandArg2(15 downto 0),
      VBB_EndFrameReset => CommandProcessor_0_VBB_EndFrameReset,
      VBB_NewDrawEventID(15 downto 0) => CommandProcessor_0_VBB_NewDrawEventID(15 downto 0),
      VBB_NewStateBits(34 downto 0) => CommandProcessor_0_VBB_NewStateBits(34 downto 0),
      VBB_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_VBB_NewStateDrawEventID(15 downto 0),
      VBB_NumFreeSlots(2 downto 0) => VBB_StateBlock_CMD_NumFreeSlots(2 downto 0),
      VBB_ReadyState => VertexBatchBuilder_0_CMD_ReadyState,
      VBB_SendCommand(1 downto 0) => CommandProcessor_0_VBB_SendCommand(1 downto 0),
      VBB_SetNewState => CommandProcessor_0_VBB_SetNewState,
      clk => ddr4_0_c0_ddr4_ui_clk,
      resetn => ResetN_UntilClockLoc_0_resetn,
      returnPacketsFIFO_full => CommandProcessor_0_returnPacketsFIFO_FULL,
      returnPacketsFIFO_wr_data(87 downto 0) => CommandProcessor_0_returnPacketsFIFO_WR_DATA(87 downto 0),
      returnPacketsFIFO_wr_en => CommandProcessor_0_returnPacketsFIFO_WR_EN,
      validPacketsFIFO_empty => CommandProcessor_0_validPacketsFIFO_EMPTY,
      validPacketsFIFO_rd_data(87 downto 0) => CommandProcessor_0_validPacketsFIFO_RD_DATA(87 downto 0),
      validPacketsFIFO_rd_en => CommandProcessor_0_validPacketsFIFO_RD_EN
    );
DINTERP_FPU_CNV0: component design_1_StandaloneFloatALU_C_0_2
     port map (
      ICNV_GO => DepthInterpolator_0_FPU_CNV0_GO,
      IN_A(31 downto 0) => DepthInterpolator_0_FPU_CNV0_A(31 downto 0),
      IN_MODE(2 downto 0) => DepthInterpolator_0_FPU_CNV0_Mode(2 downto 0),
      OCNV(31 downto 0) => DINTERP_FPU_CNV_OCNV(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DINTERP_FPU_CNV1: component design_1_StandaloneFloatALU_C_0_4
     port map (
      ICNV_GO => DepthInterpolator_0_FPU_CNV1_GO,
      IN_A(31 downto 0) => DepthInterpolator_0_FPU_CNV1_A(31 downto 0),
      IN_MODE(2 downto 0) => DepthInterpolator_0_FPU_CNV1_Mode(2 downto 0),
      OCNV(31 downto 0) => DINTERP_FPU_CNV1_OCNV(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DINTERP_FPU_MUL: component design_1_StandaloneFloatALU_M_0_3
     port map (
      IMUL_GO => DepthInterpolator_0_FPU_MUL_GO,
      IN_A(31 downto 0) => DepthInterpolator_0_FPU_MUL_A(31 downto 0),
      IN_B(31 downto 0) => DepthInterpolator_0_FPU_MUL_B(31 downto 0),
      OMUL(31 downto 0) => StandaloneFloatALU_M_0_OMUL3(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DINTERP_FPU_SPEC: component design_1_StandaloneFloatALU_S_0_2
     port map (
      IN_A(31 downto 0) => DepthInterpolator_0_FPU_SPEC_A(31 downto 0),
      ISPEC_GO => DepthInterpolator_0_FPU_SPEC_GO,
      OSPEC(31 downto 0) => StandaloneFloatALU_S_0_OSPEC2(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DINTERP_TRIDATA_FIFO: component design_1_fifo_generator_0_25
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(223 downto 0) => TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_DATA(223 downto 0),
      dout(223 downto 0) => TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_DATA(223 downto 0),
      empty => TriWorkCache2_0_DINTERP_TRIDATA_RD_EMPTY,
      full => TriWorkCache2_0_DINTERP_TRIDATA_WR_FULL,
      rd_en => TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_EN,
      rd_rst_busy => NLW_DINTERP_TRIDATA_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_EN,
      wr_rst_busy => NLW_DINTERP_TRIDATA_FIFO_wr_rst_busy_UNCONNECTED
    );
DepthBuffer_0: component design_1_DepthBuffer_0_0
     port map (
      CMD_ClearDepthBuffer => CommandProcessor_0_DEPTH_ClearDepthBuffer,
      CMD_ClearDepthValue(23 downto 0) => CommandProcessor_0_DEPTH_ClearDepthValue(23 downto 0),
      CMD_DepthIsIdle => DepthBuffer_0_CMD_DepthIsIdle,
      RAST_DepthFunction(2 downto 0) => DepthInterpolator_0_DEPTH_DepthFunction(2 downto 0),
      RAST_DepthIsIdle => DepthBuffer_0_RAST_DepthIsIdle,
      RAST_DepthWriteEnable => DepthInterpolator_0_DEPTH_DepthWriteEnable,
      RAST_InPixelDepth(23 downto 0) => DepthInterpolator_0_DEPTH_OutPixelDepth(23 downto 0),
      RAST_PixelFailedDepthTest => DepthBuffer_0_RAST_PixelFailedDepthTest,
      RAST_PixelPassedDepthTest => DepthBuffer_0_RAST_PixelPassedDepthTest,
      RAST_PixelReady => DepthInterpolator_0_DEPTH_PixelReady,
      RAST_PosX(9 downto 0) => DepthInterpolator_0_DEPTH_PosX(9 downto 0),
      RAST_PosY(9 downto 0) => DepthInterpolator_0_DEPTH_PosY(9 downto 0),
      RAST_SetDepthParams => DepthInterpolator_0_DEPTH_SetDepthParams,
      STAT_PixelsFailedDepthTest(31 downto 0) => NLW_DepthBuffer_0_STAT_PixelsFailedDepthTest_UNCONNECTED(31 downto 0),
      STAT_PixelsPassedDepthTest(31 downto 0) => NLW_DepthBuffer_0_STAT_PixelsPassedDepthTest_UNCONNECTED(31 downto 0),
      URAM_addra(17 downto 0) => DepthBuffer_0_URAM_addra(17 downto 0),
      URAM_addrb(17 downto 0) => DepthBuffer_0_URAM_addrb(17 downto 0),
      URAM_clka => DepthBuffer_0_DBufferRAMW_CLK,
      URAM_clkb => DepthBuffer_0_DBufferRAMR_CLK,
      URAM_dina(63 downto 0) => DepthBuffer_0_URAM_dina(63 downto 0),
      URAM_doutb(63 downto 0) => Net(63 downto 0),
      URAM_ena => DepthBuffer_0_DBufferRAMW_EN,
      URAM_enb => DepthBuffer_0_DBufferRAMR_EN,
      URAM_wea(7 downto 0) => DepthBuffer_0_URAM_wea(7 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DepthBuffer_AlwaysEnable: component design_1_xlconstant_3_0
     port map (
      dout(0) => xlconstant_3_dout(0)
    );
DepthBuffer_URAM: component design_1_blk_mem_gen_0_2
     port map (
      addra(17 downto 0) => DepthBuffer_0_URAM_addra(17 downto 0),
      addrb(17 downto 0) => DepthBuffer_0_URAM_addrb(17 downto 0),
      clka => DepthBuffer_0_DBufferRAMW_CLK,
      clkb => DepthBuffer_0_DBufferRAMR_CLK,
      dina(63 downto 0) => DepthBuffer_0_URAM_dina(63 downto 0),
      doutb(63 downto 0) => Net(63 downto 0),
      ena => DepthBuffer_0_DBufferRAMW_EN,
      enb => DepthBuffer_0_DBufferRAMR_EN,
      regceb => xlconstant_3_dout(0),
      wea(7 downto 0) => DepthBuffer_0_URAM_wea(7 downto 0)
    );
DepthInterpStateBlock: component design_1_StateBlock_0_3
     port map (
      CMD_EndFrameReset => CommandProcessor_0_DINTERP_EndFrameReset,
      CMD_NewStateBits(39 downto 0) => CommandProcessor_0_DINTERP_NewStateBits(39 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_DINTERP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => DepthInterpStateBlock_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_DINTERP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_DepthInterpStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_DepthInterpStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_DepthInterpStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_DepthInterpStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_DepthInterpStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_DepthInterpStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_DepthInterpStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => DepthInterpolator_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => DepthInterpStateBlock_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(39 downto 0) => DepthInterpStateBlock_STAGE_StateBitsAtDrawID(39 downto 0),
      STAGE_StateIsValid => DepthInterpStateBlock_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
DepthInterpolator_0: component design_1_DepthInterpolator_0_1
     port map (
      ATTR_FIFO_almost_full => ATTR_FIFO_prog_full,
      ATTR_FIFO_full => DepthInterpolator_0_ATTR_FIFO_FULL,
      ATTR_FIFO_wr_data(127 downto 0) => DepthInterpolator_0_ATTR_FIFO_WR_DATA(127 downto 0),
      ATTR_FIFO_wr_en => DepthInterpolator_0_ATTR_FIFO_WR_EN,
      CMD_IsIdle => DepthInterpolator_0_CMD_IsIdle,
      DBG_BarycentricBCFIFO(63 downto 0) => NLW_DepthInterpolator_0_DBG_BarycentricBCFIFO_UNCONNECTED(63 downto 0),
      DBG_BarycentricConvertState(3 downto 0) => NLW_DepthInterpolator_0_DBG_BarycentricConvertState_UNCONNECTED(3 downto 0),
      DBG_BarycentricNormalizeState(3 downto 0) => NLW_DepthInterpolator_0_DBG_BarycentricNormalizeState_UNCONNECTED(3 downto 0),
      DBG_DepthInterpolator_State(6 downto 0) => DepthInterpolator_0_DBG_DepthInterpolator_State(6 downto 0),
      DBG_DepthTestDriverZState(3 downto 0) => NLW_DepthInterpolator_0_DBG_DepthTestDriverZState_UNCONNECTED(3 downto 0),
      DBG_IdleVector(9 downto 0) => NLW_DepthInterpolator_0_DBG_IdleVector_UNCONNECTED(9 downto 0),
      DBG_InterpolatedDepthU24(23 downto 0) => NLW_DepthInterpolator_0_DBG_InterpolatedDepthU24_UNCONNECTED(23 downto 0),
      DBG_InterpolatorDriverState(3 downto 0) => NLW_DepthInterpolator_0_DBG_InterpolatorDriverState_UNCONNECTED(3 downto 0),
      DBG_RastBarycentricB(31 downto 0) => NLW_DepthInterpolator_0_DBG_RastBarycentricB_UNCONNECTED(31 downto 0),
      DBG_RastBarycentricC(31 downto 0) => NLW_DepthInterpolator_0_DBG_RastBarycentricC_UNCONNECTED(31 downto 0),
      DBG_ShiftConvertZState(3 downto 0) => NLW_DepthInterpolator_0_DBG_ShiftConvertZState_UNCONNECTED(3 downto 0),
      DEPTH_DepthFunction(2 downto 0) => DepthInterpolator_0_DEPTH_DepthFunction(2 downto 0),
      DEPTH_DepthIsIdle => DepthBuffer_0_RAST_DepthIsIdle,
      DEPTH_DepthWriteEnable => DepthInterpolator_0_DEPTH_DepthWriteEnable,
      DEPTH_OutPixelDepth(23 downto 0) => DepthInterpolator_0_DEPTH_OutPixelDepth(23 downto 0),
      DEPTH_PixelFailedDepthTest => DepthBuffer_0_RAST_PixelFailedDepthTest,
      DEPTH_PixelPassedDepthTest => DepthBuffer_0_RAST_PixelPassedDepthTest,
      DEPTH_PixelReady => DepthInterpolator_0_DEPTH_PixelReady,
      DEPTH_PosX(9 downto 0) => DepthInterpolator_0_DEPTH_PosX(9 downto 0),
      DEPTH_PosY(9 downto 0) => DepthInterpolator_0_DEPTH_PosY(9 downto 0),
      DEPTH_SetDepthParams => DepthInterpolator_0_DEPTH_SetDepthParams,
      FPU_CNV0_A(31 downto 0) => DepthInterpolator_0_FPU_CNV0_A(31 downto 0),
      FPU_CNV0_GO => DepthInterpolator_0_FPU_CNV0_GO,
      FPU_CNV0_Mode(2 downto 0) => DepthInterpolator_0_FPU_CNV0_Mode(2 downto 0),
      FPU_CNV0_OUT(31 downto 0) => DINTERP_FPU_CNV_OCNV(31 downto 0),
      FPU_CNV1_A(31 downto 0) => DepthInterpolator_0_FPU_CNV1_A(31 downto 0),
      FPU_CNV1_GO => DepthInterpolator_0_FPU_CNV1_GO,
      FPU_CNV1_Mode(2 downto 0) => DepthInterpolator_0_FPU_CNV1_Mode(2 downto 0),
      FPU_CNV1_OUT(31 downto 0) => DINTERP_FPU_CNV1_OCNV(31 downto 0),
      FPU_MUL_A(31 downto 0) => DepthInterpolator_0_FPU_MUL_A(31 downto 0),
      FPU_MUL_B(31 downto 0) => DepthInterpolator_0_FPU_MUL_B(31 downto 0),
      FPU_MUL_GO => DepthInterpolator_0_FPU_MUL_GO,
      FPU_MUL_OUT(31 downto 0) => StandaloneFloatALU_M_0_OMUL3(31 downto 0),
      FPU_SPEC_A(31 downto 0) => DepthInterpolator_0_FPU_SPEC_A(31 downto 0),
      FPU_SPEC_GO => DepthInterpolator_0_FPU_SPEC_GO,
      FPU_SPEC_OUT(31 downto 0) => StandaloneFloatALU_S_0_OSPEC2(31 downto 0),
      RASTOUT_FIFO_empty => rast_out_fifo_empty,
      RASTOUT_FIFO_rd_data(95 downto 0) => rast_out_fifo_dout(95 downto 0),
      RASTOUT_FIFO_rd_en => DepthInterpolator_0_RASTOUT_FIFO_rd_en,
      STATE_ConsumeStateSlot => DepthInterpolator_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => DepthInterpStateBlock_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(39 downto 0) => DepthInterpStateBlock_STAGE_StateBitsAtDrawID(39 downto 0),
      STATE_StateIsValid => DepthInterpStateBlock_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => DepthInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => DepthInterpolator_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => DepthInterpolator_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => DepthInterpolator_0_STAT_CyclesWaitingForOutput(31 downto 0),
      STAT_DepthOnlyPixelsPassed(31 downto 0) => DepthInterpolator_0_STAT_DepthOnlyPixelsPassed(31 downto 0),
      TRICACHE_PopTriangleSlot => DepthInterpolator_0_TRICACHE_PopTriangleSlot,
      TRICACHE_inBarycentricInverse(31 downto 0) => TriWorkCache2_0_DINTERP_outBarycentricInverse(31 downto 0),
      TRICACHE_inInvW0(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW0(31 downto 0),
      TRICACHE_inInvW10(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW10(31 downto 0),
      TRICACHE_inInvW20(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW20(31 downto 0),
      TRICACHE_inZ0(31 downto 0) => TriWorkCache2_0_DINTERP_outZ0(31 downto 0),
      TRICACHE_inZ10(31 downto 0) => TriWorkCache2_0_DINTERP_outZ10(31 downto 0),
      TRICACHE_inZ20(31 downto 0) => TriWorkCache2_0_DINTERP_outZ20(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ILA_AttrInterpolator: component design_1_ila_0_3
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      probe0(95 downto 0) => AttrInterpolator_0_TEXSAMP_OutFIFO_wr_data(95 downto 0),
      probe1(23 downto 0) => DepthInterpolator_0_DEPTH_OutPixelDepth(23 downto 0),
      probe10(17 downto 0) => DepthBuffer_0_URAM_addrb(17 downto 0),
      probe11(17 downto 0) => DepthBuffer_0_URAM_addra(17 downto 0),
      probe12(6 downto 0) => DepthInterpolator_0_DBG_DepthInterpolator_State(6 downto 0),
      probe13(0) => DepthBuffer_0_CMD_DepthIsIdle,
      probe14(0) => DepthInterpolator_0_DEPTH_PixelReady,
      probe15(15 downto 0) => AttrInterpolator_0_DBG_CurrentDrawEvent(15 downto 0),
      probe2(2 downto 0) => AttrInterpolator_0_DBG_AttrInterpolator_State(2 downto 0),
      probe3(31 downto 0) => AttrInterpolator_0_DBG_RastBarycentricB(31 downto 0),
      probe4(31 downto 0) => AttrInterpolator_0_DBG_RastBarycentricC(31 downto 0),
      probe5(31 downto 0) => AttrInterpolator_0_FPU_MUL_A(31 downto 0),
      probe6(31 downto 0) => AttrInterpolator_0_FPU_CNV_A(31 downto 0),
      probe7(63 downto 0) => Net(63 downto 0),
      probe8(63 downto 0) => DepthBuffer_0_URAM_dina(63 downto 0),
      probe9(7 downto 0) => DepthBuffer_0_URAM_wea(7 downto 0)
    );
ILA_IA: component design_1_ila_0_1
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      probe0(15 downto 0) => xlconstant_2_dout(15 downto 0),
      probe1(15 downto 0) => xlconstant_2_dout(15 downto 0),
      probe10(31 downto 0) => ShaderCoreSystem_OUT_RESULT2(31 downto 0),
      probe11(5 downto 0) => ShaderCoreSystem_DBG_CurrentState(5 downto 0),
      probe12(3 downto 0) => VertexBatchBuilder_0_DBG_CurrentState(3 downto 0),
      probe13(8 downto 0) => ShaderCoreSystem_DBG_InstructionPointer(8 downto 0),
      probe14(543 downto 0) => fifo_generator_0_dout(543 downto 0),
      probe15(31 downto 0) => ShaderCoreSystem_VSC_ReadData(31 downto 0),
      probe16(29 downto 0) => VertexBatchBuilder_0_IBC_ReadAddr(29 downto 0),
      probe17(31 downto 0) => IndexBufferCache_0_VBB_ReadData(31 downto 0),
      probe18(21 downto 0) => ShaderCoreSystem_VSC_ReadDWORDAddr(21 downto 0),
      probe19(47 downto 0) => VertexBatchBuilder_0_DBG_LastPolygonIndices(47 downto 0),
      probe2(31 downto 0) => ShaderCoreSystem_FPU3_IN_A(31 downto 0),
      probe20(29 downto 0) => ShaderCoreSystem_VSC_StreamVBAddress(29 downto 0),
      probe21(0) => ShaderCoreSystem_VSC_ReadReady,
      probe22(3 downto 0) => ShaderCoreSystem_DBG_State(3 downto 0),
      probe23(31 downto 0) => ShaderCoreSystem_VertexCache_dina(31 downto 0),
      probe24(31 downto 0) => ShaderCoreSystem_douta(31 downto 0),
      probe25(9 downto 0) => ShaderCoreSystem_VertexCache_addra(9 downto 0),
      probe26(31 downto 0) => ShaderCoreSystem_FPU1_IN_A(31 downto 0),
      probe27(4 downto 0) => ShaderCoreSystem_VBO_NumVertices(4 downto 0),
      probe28(31 downto 0) => ShaderCoreSystem_FPU1_IN_B(31 downto 0),
      probe29(271 downto 0) => VBO_INDEX_FIFO_dout(271 downto 0),
      probe3(127 downto 0) => ShaderCoreSystem_GPR0_PortW_writeInData(127 downto 0),
      probe30(31 downto 0) => ShaderCoreSystem_OUT_RESULT1(31 downto 0),
      probe31(127 downto 0) => ShaderCoreSystem_portB_readOutData_0(127 downto 0),
      probe32(6 downto 0) => ShaderCoreSystem_VBO_NumIndices(6 downto 0),
      probe33(4 downto 0) => VertexBatchBuilder_0_DBG_CurrentBatchLength(4 downto 0),
      probe34(23 downto 0) => VertexBatchBuilder_0_DBG_CurrentBatchRemainingPrims(23 downto 0),
      probe35(2 downto 0) => ShaderCoreSystem_FPUALL_IN_MODE(2 downto 0),
      probe36(0) => ShaderCoreSystem_FPUALL_ISHFT_GO,
      probe37(0) => ShaderCoreSystem_FPUALL_IMUL_GO,
      probe38(0) => ShaderCoreSystem_FPUALL_IADD_GO,
      probe39(0) => ShaderCoreSystem_FPUALL_ICMP_GO,
      probe4(1 downto 0) => ShaderCoreSystem_DBG_PortW_MUX(1 downto 0),
      probe40(0) => ShaderCoreSystem_FPUALL_ICNV_GO,
      probe41(0) => ShaderCoreSystem_FPUALL_ISPEC_GO,
      probe42(31 downto 0) => ShaderCoreSystem_FPU0_IN_A(31 downto 0),
      probe43(31 downto 0) => ShaderCoreSystem_FPU0_IN_B(31 downto 0),
      probe44(31 downto 0) => ShaderCoreSystem_OUT_RESULT(31 downto 0),
      probe45(0) => ShaderCoreSystem_CB_Enable,
      probe46(7 downto 0) => ShaderCoreSystem_CB_RegIndex(7 downto 0),
      probe47(1 downto 0) => ShaderCoreSystem_CB_RegComponent(1 downto 0),
      probe48(31 downto 0) => ShaderCoreSystem_readOutData(31 downto 0),
      probe49(1 downto 0) => ShaderCoreSystem_GPR0_ReadQuadIndex(1 downto 0),
      probe5(31 downto 0) => ShaderCoreSystem_FPU3_IN_B(31 downto 0),
      probe50(1 downto 0) => ShaderCoreSystem_GPR0_WriteQuadIndex(1 downto 0),
      probe51(1 downto 0) => ShaderCoreSystem_GPR0_PortB_regType(1 downto 0),
      probe52(2 downto 0) => ShaderCoreSystem_GPR0_PortB_regIdx(2 downto 0),
      probe53(1 downto 0) => ShaderCoreSystem_GPR0_PortB_regChan(1 downto 0),
      probe54(1 downto 0) => ShaderCoreSystem_GPR0_PortA_regType(1 downto 0),
      probe55(2 downto 0) => ShaderCoreSystem_GPR0_PortA_regIdx(2 downto 0),
      probe56(1 downto 0) => ShaderCoreSystem_GPR0_PortA_regChan(1 downto 0),
      probe57(127 downto 0) => ShaderCoreSystem_portA_readOutData_0(127 downto 0),
      probe58(0) => ShaderCoreSystem_CB_WriteMode,
      probe59(31 downto 0) => ShaderCoreSystem_CB_WriteInData(31 downto 0),
      probe6(15 downto 0) => xlconstant_2_dout(15 downto 0),
      probe60(127 downto 0) => CMD_SetConstantData_0_1(127 downto 0),
      probe61(16 downto 0) => ShaderCoreSystem_DBG_ActiveLanesBitmask(16 downto 0),
      probe62(3 downto 0) => ShaderCoreSystem_DBG_CurrentFetchWave(3 downto 0),
      probe63(2 downto 0) => ShaderCoreSystem_DBG_CurrentDWORD(2 downto 0),
      probe7(15 downto 0) => xlconstant_2_dout(15 downto 0),
      probe8(15 downto 0) => xlconstant_2_dout(15 downto 0),
      probe9(319 downto 0) => VBO_FIFO_dout(319 downto 0)
    );
ILA_TexSampler: component design_1_ila_0_4
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      probe0(5 downto 0) => TexSample_0_DBG_TexSample_State(5 downto 0),
      probe1(63 downto 0) => TexSample_0_ROP_OutFIFO_wr_data(63 downto 0),
      probe10(15 downto 0) => StateBlock_0_DBG_Slot0(15 downto 0),
      probe11(15 downto 0) => StateBlock_0_DBG_Slot1(15 downto 0),
      probe12(15 downto 0) => StateBlock_0_DBG_Slot2(15 downto 0),
      probe13(15 downto 0) => StateBlock_0_DBG_Slot3(15 downto 0),
      probe14(15 downto 0) => ROP_0_STAT_CurrentDrawEventID(15 downto 0),
      probe15(15 downto 0) => AttrInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      probe16(15 downto 0) => DepthInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      probe17(15 downto 0) => Rasterizer_0_STAT_CurrentDrawEventID(15 downto 0),
      probe18(15 downto 0) => TriSetup_0_STAT_CurrentDrawEventID(15 downto 0),
      probe19(15 downto 0) => ClipUnit_0_STAT_CurrentDrawEventID(15 downto 0),
      probe2(31 downto 0) => TexSample_0_DBG_TexCache_dina(31 downto 0),
      probe20(15 downto 0) => InputAssembler2_0_STAT_CurrentDrawEventID(15 downto 0),
      probe21(15 downto 0) => ShaderCoreSystem_STAT_CurrentDrawEventID(15 downto 0),
      probe22(15 downto 0) => VertexBatchBuilder_0_STAT_CurrentDrawEventID(15 downto 0),
      probe3(13 downto 0) => TexSample_0_DBG_TexCache_addra(13 downto 0),
      probe4(15 downto 0) => TexSample_0_STAT_CurrentDrawEventID(15 downto 0),
      probe5(15 downto 0) => StateBlock_0_STAGE_NextDrawID(15 downto 0),
      probe6(0) => TexSample_0_STATE_ConsumeStateSlot,
      probe7(1 downto 0) => StateBlock_0_DBG_CurrentReadSlotIndex(1 downto 0),
      probe8(1 downto 0) => StateBlock_0_DBG_CurrentWriteSlotIndex(1 downto 0),
      probe9(3 downto 0) => StateBlock_0_DBG_SlotsValid(3 downto 0)
    );
ILA_TriSetup: component design_1_ila_0_2
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      probe0(31 downto 0) => TriSetup_0_RAST_outBarycentricInverse(31 downto 0),
      probe1(31 downto 0) => TriSetup_0_RAST_v0_out_Z(31 downto 0),
      probe10(127 downto 0) => TriSetup_0_RAST_v0_out_colorRGBA(127 downto 0),
      probe11(127 downto 0) => TriSetup_0_RAST_v10_out_colorRGBA(127 downto 0),
      probe12(127 downto 0) => TriSetup_0_RAST_v20_out_colorRGBA(127 downto 0),
      probe13(15 downto 0) => TriSetup_0_RAST_outMinX(15 downto 0),
      probe14(15 downto 0) => TriSetup_0_RAST_outMaxX(15 downto 0),
      probe15(15 downto 0) => TriSetup_0_RAST_outMinY(15 downto 0),
      probe16(15 downto 0) => TriSetup_0_RAST_outMaxY(15 downto 0),
      probe17(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetA(31 downto 0),
      probe18(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetB(31 downto 0),
      probe19(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetC(31 downto 0),
      probe2(31 downto 0) => TriSetup_0_RAST_v10_out_Z(31 downto 0),
      probe20(0) => TriSetup_0_RAST_outIsTopLeftEdgeA,
      probe21(0) => TriSetup_0_RAST_outIsTopLeftEdgeB,
      probe22(0) => TriSetup_0_RAST_outIsTopLeftEdgeC,
      probe23(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaA(15 downto 0),
      probe24(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaB(15 downto 0),
      probe25(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaC(15 downto 0),
      probe26(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaA(15 downto 0),
      probe27(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaB(15 downto 0),
      probe28(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaC(15 downto 0),
      probe29(0) => TriSetup_0_RAST_triSetupDataIsValid,
      probe3(31 downto 0) => TriSetup_0_RAST_v20_out_Z(31 downto 0),
      probe30(7 downto 0) => TriSetup_0_DBG_TriSetup_State(7 downto 0),
      probe31(15 downto 0) => TriSetup_0_DBG_MinX(15 downto 0),
      probe32(15 downto 0) => TriSetup_0_DBG_MaxX(15 downto 0),
      probe33(15 downto 0) => TriSetup_0_DBG_MinY(15 downto 0),
      probe34(15 downto 0) => TriSetup_0_DBG_MaxY(15 downto 0),
      probe35(31 downto 0) => TriSetup_0_DBG_XProdSub0(31 downto 0),
      probe36(31 downto 0) => TriSetup_0_DBG_XProdSub1(31 downto 0),
      probe37(31 downto 0) => TriSetup_0_DBG_XProdSub2(31 downto 0),
      probe38(31 downto 0) => TriSetup_0_DBG_XProdSub3(31 downto 0),
      probe39(31 downto 0) => TriSetup_0_DBG_XProdProd0(31 downto 0),
      probe4(31 downto 0) => TriSetup_0_RAST_t0_out_x(31 downto 0),
      probe40(31 downto 0) => TriSetup_0_DBG_XProdProd1(31 downto 0),
      probe41(31 downto 0) => TriSetup_0_DBG_TwiceTriArea(31 downto 0),
      probe42(5 downto 0) => InputAssembler2_0_DBG_IA_State(5 downto 0),
      probe43(3 downto 0) => InputAssembler2_0_DBG_IA_VertexIDPerBatch(3 downto 0),
      probe44(11 downto 0) => InputAssembler2_0_DBG_IA_CurrentTriIndices(11 downto 0),
      probe45(319 downto 0) => VBO_FIFO_dout(319 downto 0),
      probe46(271 downto 0) => VBO_INDEX_FIFO_dout(271 downto 0),
      probe47(7 downto 0) => ClipUnit_0_DBG_CurrentState(7 downto 0),
      probe48(3 downto 0) => ClipUnit_0_DBG_CurrentClipPlane(3 downto 0),
      probe49(2 downto 0) => ClipUnit_0_DBG_CurrentClipBitmask(2 downto 0),
      probe5(31 downto 0) => TriSetup_0_RAST_t0_out_y(31 downto 0),
      probe50(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes0(10 downto 0),
      probe51(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes1(10 downto 0),
      probe52(10 downto 0) => ClipUnit_0_DBG_ClipOutcodes2(10 downto 0),
      probe53(31 downto 0) => ClipUnit_0_DBG_V0PosX(31 downto 0),
      probe54(31 downto 0) => ClipUnit_0_DBG_V0PosY(31 downto 0),
      probe55(31 downto 0) => ClipUnit_0_DBG_V0PosZ(31 downto 0),
      probe56(31 downto 0) => ClipUnit_0_DBG_V0PosW(31 downto 0),
      probe57(31 downto 0) => ClipUnit_0_DBG_ClipDistance0(31 downto 0),
      probe58(31 downto 0) => ClipUnit_0_DBG_ClipDistance1(31 downto 0),
      probe59(10 downto 0) => ClipUnit_0_DBG_AlreadyClippedPlanes(10 downto 0),
      probe6(31 downto 0) => TriSetup_0_RAST_t10_out_x(31 downto 0),
      probe7(31 downto 0) => TriSetup_0_RAST_t10_out_y(31 downto 0),
      probe8(31 downto 0) => TriSetup_0_RAST_t20_out_x(31 downto 0),
      probe9(31 downto 0) => TriSetup_0_RAST_t20_out_y(31 downto 0)
    );
IndexBufferCache_0: component design_1_IndexBufferCache_0_0
     port map (
      DBG_IBCReadRequestsFIFO_full => NLW_IndexBufferCache_0_DBG_IBCReadRequestsFIFO_full_UNCONNECTED,
      DBG_IBCReadResponsesFIFO_empty => NLW_IndexBufferCache_0_DBG_IBCReadResponsesFIFO_empty_UNCONNECTED,
      DBG_State(1 downto 0) => NLW_IndexBufferCache_0_DBG_State_UNCONNECTED(1 downto 0),
      IBCReadRequestsFIFO_full => IndexBufferCache_0_IBCacheReadRequests_FULL,
      IBCReadRequestsFIFO_wr_data(29 downto 0) => IndexBufferCache_0_IBCacheReadRequests_WR_DATA(29 downto 0),
      IBCReadRequestsFIFO_wr_en => IndexBufferCache_0_IBCacheReadRequests_WR_EN,
      IBCReadResponsesFIFO_empty => IndexBufferCache_0_IBCacheReadResponses_EMPTY,
      IBCReadResponsesFIFO_rd_data(255 downto 0) => IndexBufferCache_0_IBCacheReadResponses_RD_DATA(255 downto 0),
      IBCReadResponsesFIFO_rd_en => IndexBufferCache_0_IBCacheReadResponses_RD_EN,
      VBB_InvalidateIndexCache => VertexBatchBuilder_0_IBC_InvalidateIndexCache,
      VBB_ReadAddr(29 downto 0) => VertexBatchBuilder_0_IBC_ReadAddr(29 downto 0),
      VBB_ReadData(31 downto 0) => IndexBufferCache_0_VBB_ReadData(31 downto 0),
      VBB_ReadEnable => VertexBatchBuilder_0_IBC_ReadEnable,
      VBB_ReadReady => IndexBufferCache_0_VBB_ReadReady,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
InputAssembler2_0: component design_1_InputAssembler2_0_0
     port map (
      CLIP_AABBTriOverlapsViewport => InputAssembler2_0_CLIP_AABBTriOverlapsViewport,
      CLIP_CurrentDrawEventID(15 downto 0) => InputAssembler2_0_CLIP_CurrentDrawEventID(15 downto 0),
      CLIP_newTriBegin => InputAssembler2_0_CLIP_newTriBegin,
      CLIP_readyForNewTri => ClipUnit_0_IA_outPreviousStageIsReady,
      CLIP_tex0_X(31 downto 0) => InputAssembler2_0_CLIP_tex0_X(31 downto 0),
      CLIP_tex0_Y(31 downto 0) => InputAssembler2_0_CLIP_tex0_Y(31 downto 0),
      CLIP_tex1_X(31 downto 0) => InputAssembler2_0_CLIP_tex1_X(31 downto 0),
      CLIP_tex1_Y(31 downto 0) => InputAssembler2_0_CLIP_tex1_Y(31 downto 0),
      CLIP_tex2_X(31 downto 0) => InputAssembler2_0_CLIP_tex2_X(31 downto 0),
      CLIP_tex2_Y(31 downto 0) => InputAssembler2_0_CLIP_tex2_Y(31 downto 0),
      CLIP_v0ClipCodes(10 downto 0) => InputAssembler2_0_CLIP_v0ClipCodes(10 downto 0),
      CLIP_v0PosW(31 downto 0) => InputAssembler2_0_CLIP_v0PosW(31 downto 0),
      CLIP_v0PosX(31 downto 0) => InputAssembler2_0_CLIP_v0PosX(31 downto 0),
      CLIP_v0PosY(31 downto 0) => InputAssembler2_0_CLIP_v0PosY(31 downto 0),
      CLIP_v0PosZ(31 downto 0) => InputAssembler2_0_CLIP_v0PosZ(31 downto 0),
      CLIP_v1ClipCodes(10 downto 0) => InputAssembler2_0_CLIP_v1ClipCodes(10 downto 0),
      CLIP_v1PosW(31 downto 0) => InputAssembler2_0_CLIP_v1PosW(31 downto 0),
      CLIP_v1PosX(31 downto 0) => InputAssembler2_0_CLIP_v1PosX(31 downto 0),
      CLIP_v1PosY(31 downto 0) => InputAssembler2_0_CLIP_v1PosY(31 downto 0),
      CLIP_v1PosZ(31 downto 0) => InputAssembler2_0_CLIP_v1PosZ(31 downto 0),
      CLIP_v2ClipCodes(10 downto 0) => InputAssembler2_0_CLIP_v2ClipCodes(10 downto 0),
      CLIP_v2PosW(31 downto 0) => InputAssembler2_0_CLIP_v2PosW(31 downto 0),
      CLIP_v2PosX(31 downto 0) => InputAssembler2_0_CLIP_v2PosX(31 downto 0),
      CLIP_v2PosY(31 downto 0) => InputAssembler2_0_CLIP_v2PosY(31 downto 0),
      CLIP_v2PosZ(31 downto 0) => InputAssembler2_0_CLIP_v2PosZ(31 downto 0),
      CLIP_vertColor0_RGBA(127 downto 0) => InputAssembler2_0_CLIP_vertColor0_RGBA(127 downto 0),
      CLIP_vertColor1_RGBA(127 downto 0) => InputAssembler2_0_CLIP_vertColor1_RGBA(127 downto 0),
      CLIP_vertColor2_RGBA(127 downto 0) => InputAssembler2_0_CLIP_vertColor2_RGBA(127 downto 0),
      CMD_IA_Idle => InputAssembler2_0_CMD_IA_Idle,
      DBG_IA_CurrentTriIndices(11 downto 0) => InputAssembler2_0_DBG_IA_CurrentTriIndices(11 downto 0),
      DBG_IA_State(5 downto 0) => InputAssembler2_0_DBG_IA_State(5 downto 0),
      DBG_IA_VertexIDPerBatch(3 downto 0) => InputAssembler2_0_DBG_IA_VertexIDPerBatch(3 downto 0),
      INDEXOUT_FIFO_empty => InputAssembler2_0_INDEXOUT_FIFO_EMPTY,
      INDEXOUT_FIFO_rd_data(271 downto 0) => VBO_INDEX_FIFO_dout(271 downto 0),
      INDEXOUT_FIFO_rd_en => InputAssembler2_0_INDEXOUT_FIFO_RD_EN,
      STATE_ConsumeStateSlot => InputAssembler2_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => InputAssemblerStateBlock_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(4 downto 0) => InputAssemblerStateBlock_STAGE_StateBitsAtDrawID(4 downto 0),
      STATE_StateIsValid => InputAssemblerStateBlock_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => InputAssembler2_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => InputAssembler2_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesLoadingDataToCache(31 downto 0) => InputAssembler2_0_STAT_CyclesLoadingDataToCache(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => InputAssembler2_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => InputAssembler2_0_STAT_CyclesWaitingForOutput(31 downto 0),
      VBO_IsIndexedDrawCall => ShaderCoreSystem_VBO_IsIndexedDrawCall,
      VBO_NumIndices(6 downto 0) => ShaderCoreSystem_VBO_NumIndices(6 downto 0),
      VBO_NumVertices(4 downto 0) => ShaderCoreSystem_VBO_NumVertices(4 downto 0),
      VBO_Pushed => ShaderCoreSystem_VBO_Pushed_0,
      VBO_Ready => VBO_Ready_0_1,
      VERTOUT_FIFO_empty => VBO_FIFO_empty,
      VERTOUT_FIFO_rd_data(319 downto 0) => VBO_FIFO_dout(319 downto 0),
      VERTOUT_FIFO_rd_en => InputAssembler2_0_VERTOUT_FIFO_rd_en,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
InputAssemblerStateBlock: component design_1_StateBlock_2_0
     port map (
      CMD_EndFrameReset => CommandProcessor_0_IA_EndFrameReset,
      CMD_NewStateBits(4 downto 0) => CommandProcessor_0_IA_NewStateBits(4 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_IA_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => InputAssemblerStateBlock_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_IA_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_InputAssemblerStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_InputAssemblerStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_InputAssemblerStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_InputAssemblerStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_InputAssemblerStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_InputAssemblerStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_InputAssemblerStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => InputAssembler2_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => InputAssemblerStateBlock_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(4 downto 0) => InputAssemblerStateBlock_STAGE_StateBitsAtDrawID(4 downto 0),
      STAGE_StateIsValid => InputAssemblerStateBlock_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
MemorySystem: entity work.MemorySystem_imp_FPNZVK
     port map (
      CMD_MemoryControllerIsIdle => MemorySystem_CMD_MemoryControllerIsIdle,
      ClearBlockWriteRequestsFIFO_full => ClearBlock_0_ClearBlockWriteRequestsFIFO_FULL,
      ClearBlockWriteRequestsFIFO_wr_data(293 downto 0) => ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_DATA(293 downto 0),
      ClearBlockWriteRequestsFIFO_wr_en => ClearBlock_0_ClearBlockWriteRequestsFIFO_WR_EN,
      CommandProcReadRequestsFIFO_full => CommandProcessor_0_CommandProcReadRequestsFIFO_FULL,
      CommandProcReadRequestsFIFO_wr_data(29 downto 0) => CommandProcessor_0_CommandProcReadRequestsFIFO_WR_DATA(29 downto 0),
      CommandProcReadRequestsFIFO_wr_en => CommandProcessor_0_CommandProcReadRequestsFIFO_WR_EN,
      CommandProcReadResponsesFIFO_empty => CommandProcessor_0_CommandProcReadResponses_EMPTY,
      CommandProcReadResponsesFIFO_rd_data(255 downto 0) => CommandProcessor_0_CommandProcReadResponses_RD_DATA(255 downto 0),
      CommandProcReadResponsesFIFO_rd_en => CommandProcessor_0_CommandProcReadResponses_RD_EN,
      CommandProcWriteRequestsFIFO_full => CommandProcessor_0_CommandProcWriteRequests_FULL,
      CommandProcWriteRequestsFIFO_wr_data(293 downto 0) => CommandProcessor_0_CommandProcWriteRequests_WR_DATA(293 downto 0),
      CommandProcWriteRequestsFIFO_wr_en => CommandProcessor_0_CommandProcWriteRequests_WR_EN,
      DBG_LastReadAddress(29 downto 0) => MemorySystem_DBG_LastReadAddress(29 downto 0),
      DBG_LastReadMemoryClientIndex(3 downto 0) => MemorySystem_DBG_LastReadMemoryClientIndex(3 downto 0),
      DBG_LastWriteAddress(29 downto 0) => MemorySystem_DBG_LastWriteAddress(29 downto 0),
      DBG_LastWriteData(255 downto 0) => MemorySystem_DBG_LastWriteData(255 downto 0),
      DBG_LastWriteDataDWORDEnables(7 downto 0) => MemorySystem_DBG_LastWriteDataDWORDEnables(7 downto 0),
      DBG_LastWriteMemoryClientIndex(3 downto 0) => MemorySystem_DBG_LastWriteMemoryClientIndex(3 downto 0),
      DBG_ReadControlState(3 downto 0) => MemorySystem_DBG_ReadControlState(3 downto 0),
      DBG_ReadRequestsEmptyBitmask(7 downto 0) => MemorySystem_DBG_ReadRequestsEmptyBitmask(7 downto 0),
      DBG_ReadResponsesFullBitmask(7 downto 0) => MemorySystem_DBG_ReadResponsesFullBitmask(7 downto 0),
      DBG_ScanoutReadRequests_Empty => MemorySystem_DBG_ScanoutReadRequests_Empty,
      DBG_ScanoutReadRequests_rd_en => MemorySystem_DBG_ScanoutReadRequests_rd_en,
      DBG_ScanoutReadResponses_Full => MemorySystem_DBG_ScanoutReadResponses_Full,
      DBG_WriteControlState(3 downto 0) => MemorySystem_DBG_WriteControlState(3 downto 0),
      DBG_WriteRequestsEmptyBitmask(5 downto 0) => MemorySystem_DBG_WriteRequestsEmptyBitmask(5 downto 0),
      IBCacheReadRequestsFIFO_full => IndexBufferCache_0_IBCacheReadRequests_FULL,
      IBCacheReadRequestsFIFO_wr_data(29 downto 0) => IndexBufferCache_0_IBCacheReadRequests_WR_DATA(29 downto 0),
      IBCacheReadRequestsFIFO_wr_en => IndexBufferCache_0_IBCacheReadRequests_WR_EN,
      IBCacheReadResponsesFIFO_empty => IndexBufferCache_0_IBCacheReadResponses_EMPTY,
      IBCacheReadResponsesFIFO_rd_data(255 downto 0) => IndexBufferCache_0_IBCacheReadResponses_RD_DATA(255 downto 0),
      IBCacheReadResponsesFIFO_rd_en => IndexBufferCache_0_IBCacheReadResponses_RD_EN,
      M_AXI_ARESETN => ResetN_UntilClockLoc_0_resetn,
      ROPReadRequestsFIFO_full => ROP_0_ROPReadRequestsFIFO_FULL,
      ROPReadRequestsFIFO_wr_data(29 downto 0) => ROP_0_ROPReadRequestsFIFO_WR_DATA(29 downto 0),
      ROPReadRequestsFIFO_wr_en => ROP_0_ROPReadRequestsFIFO_WR_EN,
      ROPReadResponsesFIFO_empty => ROP_0_ROPReadResponses_EMPTY,
      ROPReadResponsesFIFO_rd_data(255 downto 0) => ROP_0_ROPReadResponses_RD_DATA(255 downto 0),
      ROPReadResponsesFIFO_rd_en => ROP_0_ROPReadResponses_RD_EN,
      ROPWriteRequestsFIFO_full => ROP_0_ROPWriteRequestsFIFO_FULL,
      ROPWriteRequestsFIFO_wr_data(293 downto 0) => ROP_0_ROPWriteRequestsFIFO_WR_DATA(293 downto 0),
      ROPWriteRequestsFIFO_wr_en => ROP_0_ROPWriteRequestsFIFO_WR_EN,
      STAT_MemReadCountBytesTransferred(31 downto 0) => MemorySystem_STAT_MemReadCountBytesTransferred(31 downto 0),
      STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0) => MemorySystem_STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0),
      STAT_MemReadCountNonScanoutTransactions(31 downto 0) => MemorySystem_STAT_MemReadCountNonScanoutTransactions(31 downto 0),
      STAT_MemReadCountTransactions(31 downto 0) => MemorySystem_STAT_MemReadCountTransactions(31 downto 0),
      STAT_MemReadCyclesIdle(31 downto 0) => MemorySystem_STAT_MemReadCyclesIdle(31 downto 0),
      STAT_MemReadCyclesSpentWorking(31 downto 0) => MemorySystem_STAT_MemReadCyclesSpentWorking(31 downto 0),
      STAT_MemWriteCountBytesTransferred(31 downto 0) => MemorySystem_STAT_MemWriteCountBytesTransferred(31 downto 0),
      STAT_MemWriteCountTransactions(31 downto 0) => MemorySystem_STAT_MemWriteCountTransactions(31 downto 0),
      STAT_MemWriteCyclesIdle(31 downto 0) => MemorySystem_STAT_MemWriteCyclesIdle(31 downto 0),
      STAT_MemWriteCyclesSpentWorking(31 downto 0) => MemorySystem_STAT_MemWriteCyclesSpentWorking(31 downto 0),
      ScanoutReadRequestsFIFO_full => ScanOut_0_ScanoutReadRequestsFIFO_FULL,
      ScanoutReadRequestsFIFO_wr_data(29 downto 0) => ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA(29 downto 0),
      ScanoutReadRequestsFIFO_wr_en => ScanOut_0_ScanoutReadRequestsFIFO_WR_EN,
      ScanoutReadResponsesFIFO_empty => ScanOut_0_ScanoutReadResponses_EMPTY,
      ScanoutReadResponsesFIFO_rd_data(255 downto 0) => ScanOut_0_ScanoutReadResponses_RD_DATA(255 downto 0),
      ScanoutReadResponsesFIFO_rd_en => ScanOut_0_ScanoutReadResponses_RD_EN,
      StatsWriteRequestsFIFO_full => StatsCollector_0_StatsWriteRequestsFIFO_FULL,
      StatsWriteRequestsFIFO_wr_data(293 downto 0) => StatsCollector_0_StatsWriteRequestsFIFO_WR_DATA(293 downto 0),
      StatsWriteRequestsFIFO_wr_en => StatsCollector_0_StatsWriteRequestsFIFO_WR_EN,
      TexFetchReadRequestsFIFO_full => TexSample_0_TexSampReadRequestsFIFO_FULL,
      TexFetchReadRequestsFIFO_wr_data(29 downto 0) => TexSample_0_TexSampReadRequestsFIFO_WR_DATA(29 downto 0),
      TexFetchReadRequestsFIFO_wr_en => TexSample_0_TexSampReadRequestsFIFO_WR_EN,
      TexFetchReadResponsesFIFO_empty => TexSample_0_TexSampReadResponses_EMPTY,
      TexFetchReadResponsesFIFO_rd_data(255 downto 0) => TexSample_0_TexSampReadResponses_RD_DATA(255 downto 0),
      TexFetchReadResponsesFIFO_rd_en => TexSample_0_TexSampReadResponses_RD_EN,
      VBCacheReadRequestsFIFO_full => ShaderCoreSystem_VBCacheReadRequests_0_FULL,
      VBCacheReadRequestsFIFO_wr_data(29 downto 0) => ShaderCoreSystem_VBCacheReadRequests_0_WR_DATA(29 downto 0),
      VBCacheReadRequestsFIFO_wr_en => ShaderCoreSystem_VBCacheReadRequests_0_WR_EN,
      VBCacheReadResponsesFIFO_empty => ShaderCoreSystem_VBCacheReadResponses_0_EMPTY,
      VBCacheReadResponsesFIFO_rd_data(255 downto 0) => ShaderCoreSystem_VBCacheReadResponses_0_RD_DATA(255 downto 0),
      VBCacheReadResponsesFIFO_rd_en => ShaderCoreSystem_VBCacheReadResponses_0_RD_EN,
      addn_ui_clkout1 => ddr4_0_addn_ui_clkout1,
      c0_ddr4_ui_clk => ddr4_0_c0_ddr4_ui_clk,
      ddr4_sdram_c1_act_n => ddr4_0_C0_DDR4_ACT_N,
      ddr4_sdram_c1_adr(16 downto 0) => ddr4_0_C0_DDR4_ADR(16 downto 0),
      ddr4_sdram_c1_ba(1 downto 0) => ddr4_0_C0_DDR4_BA(1 downto 0),
      ddr4_sdram_c1_bg => ddr4_0_C0_DDR4_BG,
      ddr4_sdram_c1_ck_c => ddr4_0_C0_DDR4_CK_C,
      ddr4_sdram_c1_ck_t => ddr4_0_C0_DDR4_CK_T,
      ddr4_sdram_c1_cke => ddr4_0_C0_DDR4_CKE,
      ddr4_sdram_c1_cs_n => ddr4_0_C0_DDR4_CS_N,
      ddr4_sdram_c1_dm_n(3 downto 0) => ddr4_sdram_c1_dm_n(3 downto 0),
      ddr4_sdram_c1_dq(31 downto 0) => ddr4_sdram_c1_dq(31 downto 0),
      ddr4_sdram_c1_dqs_c(3 downto 0) => ddr4_sdram_c1_dqs_c(3 downto 0),
      ddr4_sdram_c1_dqs_t(3 downto 0) => ddr4_sdram_c1_dqs_t(3 downto 0),
      ddr4_sdram_c1_odt => ddr4_0_C0_DDR4_ODT,
      ddr4_sdram_c1_reset_n => ddr4_0_C0_DDR4_RESET_N,
      default_sysclk1_300_clk_n => default_sysclk1_300_1_CLK_N,
      default_sysclk1_300_clk_p => default_sysclk1_300_1_CLK_P,
      rd_clk => rd_clk_1,
      reset => reset_1
    );
NetworkPacketSystem: entity work.NetworkPacketSystem_imp_1I0FPOR
     port map (
      FIFO_READ_empty => CommandProcessor_0_validPacketsFIFO_EMPTY,
      FIFO_READ_rd_data(87 downto 0) => CommandProcessor_0_validPacketsFIFO_RD_DATA(87 downto 0),
      FIFO_READ_rd_en => CommandProcessor_0_validPacketsFIFO_RD_EN,
      FIFO_WRITE_full => CommandProcessor_0_returnPacketsFIFO_FULL,
      FIFO_WRITE_wr_data(87 downto 0) => CommandProcessor_0_returnPacketsFIFO_WR_DATA(87 downto 0),
      FIFO_WRITE_wr_en => CommandProcessor_0_returnPacketsFIFO_WR_EN,
      clk333_250 => ddr4_0_c0_ddr4_ui_clk,
      mdio_mdc_mdc => NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDC,
      mdio_mdc_mdio_i => NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_I,
      mdio_mdc_mdio_o => NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_O,
      mdio_mdc_mdio_t => NetworkPacketSystem_ext_mdio_pcs_pma_0_0_MDIO_T,
      refclk625_in_0_clk_n => refclk625_in_0_1_CLK_N,
      refclk625_in_0_clk_p => refclk625_in_0_1_CLK_P,
      sgmii_lvds_rxn => NetworkPacketSystem_sgmii_0_0_RXN,
      sgmii_lvds_rxp => NetworkPacketSystem_sgmii_0_0_RXP,
      sgmii_lvds_txn => NetworkPacketSystem_sgmii_0_0_TXN,
      sgmii_lvds_txp => NetworkPacketSystem_sgmii_0_0_TXP
    );
ROPStateBlock: component design_1_StateBlock_0_2
     port map (
      CMD_EndFrameReset => CommandProcessor_0_ROP_EndFrameReset,
      CMD_NewStateBits(100 downto 0) => CommandProcessor_0_ROP_NewStateBits(100 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_ROP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => ROPStateBlock_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_ROP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_ROPStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_ROPStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_ROPStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_ROPStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_ROPStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_ROPStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_ROPStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => ROP_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => ROPStateBlock_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(100 downto 0) => ROPStateBlock_STAGE_StateBitsAtDrawID(100 downto 0),
      STAGE_StateIsValid => ROPStateBlock_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ROP_0: component design_1_ROP_0_0
     port map (
      CMD_ClearSignal => CommandProcessor_0_ROP_ClearSignal,
      CMD_ClearSignalAck => ROP_0_CMD_ClearSignalAck,
      CMD_FlushCacheAck => ROP_0_CMD_FlushCacheAck,
      CMD_FlushCacheSignal => CommandProcessor_0_ROP_FlushCacheSignal,
      CMD_ROPIsIdle => ROP_0_CMD_ROPIsIdle,
      CMD_SetClearColor(31 downto 0) => CommandProcessor_0_ROP_SetClearColor(31 downto 0),
      DBG_CurrentBlendedColor(31 downto 0) => NLW_ROP_0_DBG_CurrentBlendedColor_UNCONNECTED(31 downto 0),
      DBG_CurrentCacheLineDirtyFlags(7 downto 0) => NLW_ROP_0_DBG_CurrentCacheLineDirtyFlags_UNCONNECTED(7 downto 0),
      DBG_CurrentPixelAddr(29 downto 0) => ROP_0_DBG_CurrentPixelAddr(29 downto 0),
      DBG_PreviousFramebufferColor(31 downto 0) => NLW_ROP_0_DBG_PreviousFramebufferColor_UNCONNECTED(31 downto 0),
      DBG_ROP_State(4 downto 0) => ROP_0_DBG_ROP_State(4 downto 0),
      DBG_ReadRequestFIFOFull => ROP_0_DBG_ReadRequestFIFOFull,
      DBG_TempBlendedOutputA(31 downto 0) => NLW_ROP_0_DBG_TempBlendedOutputA_UNCONNECTED(31 downto 0),
      DBG_TempBlendedOutputRGB(95 downto 0) => NLW_ROP_0_DBG_TempBlendedOutputRGB_UNCONNECTED(95 downto 0),
      DBG_TempSelectedOutputA(15 downto 0) => NLW_ROP_0_DBG_TempSelectedOutputA_UNCONNECTED(15 downto 0),
      DBG_TempSelectedOutputRGB(47 downto 0) => NLW_ROP_0_DBG_TempSelectedOutputRGB_UNCONNECTED(47 downto 0),
      MEM_ROPReadRequestsFIFO_full => ROP_0_ROPReadRequestsFIFO_FULL,
      MEM_ROPReadRequestsFIFO_wr_data(29 downto 0) => ROP_0_ROPReadRequestsFIFO_WR_DATA(29 downto 0),
      MEM_ROPReadRequestsFIFO_wr_en => ROP_0_ROPReadRequestsFIFO_WR_EN,
      MEM_ROPReadResponsesFIFO_empty => ROP_0_ROPReadResponses_EMPTY,
      MEM_ROPReadResponsesFIFO_rd_data(255 downto 0) => ROP_0_ROPReadResponses_RD_DATA(255 downto 0),
      MEM_ROPReadResponsesFIFO_rd_en => ROP_0_ROPReadResponses_RD_EN,
      MEM_ROPWriteRequestsFIFO_full => ROP_0_ROPWriteRequestsFIFO_FULL,
      MEM_ROPWriteRequestsFIFO_wr_data(293 downto 0) => ROP_0_ROPWriteRequestsFIFO_WR_DATA(293 downto 0),
      MEM_ROPWriteRequestsFIFO_wr_en => ROP_0_ROPWriteRequestsFIFO_WR_EN,
      STATE_ConsumeStateSlot => ROP_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => ROPStateBlock_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(100 downto 0) => ROPStateBlock_STAGE_StateBitsAtDrawID(100 downto 0),
      STATE_StateIsValid => ROPStateBlock_STAGE_StateIsValid,
      STAT_CountCacheHits(31 downto 0) => ROP_0_STAT_CountCacheHits(31 downto 0),
      STAT_CountCacheMisses(31 downto 0) => ROP_0_STAT_CountCacheMisses(31 downto 0),
      STAT_CountPixelsPassed(31 downto 0) => ROP_0_STAT_CountPixelsPassed(31 downto 0),
      STAT_CurrentDrawEventID(15 downto 0) => ROP_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => ROP_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => ROP_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForMemoryRead(31 downto 0) => ROP_0_STAT_CyclesWaitingForMemoryRead(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => ROP_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TEXSAMP_InFIFO_empty => ROP_FIFO_empty,
      TEXSAMP_InFIFO_rd_data(63 downto 0) => ROP_FIFO_dout(63 downto 0),
      TEXSAMP_InFIFO_rd_en => ROP_0_TEXSAMP_InFIFO_rd_en,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ROP_FIFO: component design_1_fifo_generator_0_20
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(63 downto 0) => TexSample_0_ROP_OutFIFO_wr_data(63 downto 0),
      dout(63 downto 0) => ROP_FIFO_dout(63 downto 0),
      empty => ROP_FIFO_empty,
      full => TexSample_0_ROP_OUT_FIFO_FULL,
      rd_en => ROP_0_TEXSAMP_InFIFO_rd_en,
      wr_en => TexSample_0_ROP_OUT_FIFO_WR_EN
    );
Rasterizer_0: component design_1_Rasterizer_0_0
     port map (
      CMD_Rasterizer_Idle => Rasterizer_0_CMD_Rasterizer_Idle,
      DBG_BarycentricA(31 downto 0) => NLW_Rasterizer_0_DBG_BarycentricA_UNCONNECTED(31 downto 0),
      DBG_BarycentricB(31 downto 0) => NLW_Rasterizer_0_DBG_BarycentricB_UNCONNECTED(31 downto 0),
      DBG_BarycentricC(31 downto 0) => NLW_Rasterizer_0_DBG_BarycentricC_UNCONNECTED(31 downto 0),
      DBG_MaxX(15 downto 0) => Rasterizer_0_DBG_MaxX(15 downto 0),
      DBG_MaxY(15 downto 0) => Rasterizer_0_DBG_MaxY(15 downto 0),
      DBG_MinX(15 downto 0) => Rasterizer_0_DBG_MinX(15 downto 0),
      DBG_MinY(15 downto 0) => Rasterizer_0_DBG_MinY(15 downto 0),
      DBG_PixelXPos(15 downto 0) => Rasterizer_0_DBG_PixelXPos(15 downto 0),
      DBG_PixelYPos(15 downto 0) => Rasterizer_0_DBG_PixelYPos(15 downto 0),
      DBG_Rasterizer_State(3 downto 0) => Rasterizer_0_DBG_Rasterizer_State(3 downto 0),
      RASTOUT_FIFO_almost_full => Rasterizer_0_RASTOUT_FIFO_ALMOST_FULL,
      RASTOUT_FIFO_full => Rasterizer_0_RASTOUT_FIFO_FULL,
      RASTOUT_FIFO_wr_data(95 downto 0) => Rasterizer_0_RASTOUT_FIFO_WR_DATA(95 downto 0),
      RASTOUT_FIFO_wr_en => Rasterizer_0_RASTOUT_FIFO_WR_EN,
      STAT_CurrentDrawEventID(15 downto 0) => Rasterizer_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => Rasterizer_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => Rasterizer_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => Rasterizer_0_STAT_CyclesWaitingForOutput(31 downto 0),
      STAT_CyclesWaitingForTriWorkCache(31 downto 0) => Rasterizer_0_STAT_CyclesWaitingForTriWorkCache(31 downto 0),
      TRICACHE_BarycentricInverse(31 downto 0) => Rasterizer_0_TRICACHE_BarycentricInverse(31 downto 0),
      TRICACHE_InvW0(31 downto 0) => Rasterizer_0_TRICACHE_InvW0(31 downto 0),
      TRICACHE_InvW10(31 downto 0) => Rasterizer_0_TRICACHE_InvW10(31 downto 0),
      TRICACHE_InvW20(31 downto 0) => Rasterizer_0_TRICACHE_InvW20(31 downto 0),
      TRICACHE_IsFull => TriWorkCache2_0_RAST_IsFull,
      TRICACHE_PushNewTriData => Rasterizer_0_TRICACHE_PushNewTriData,
      TRICACHE_TX0(31 downto 0) => Rasterizer_0_TRICACHE_TX0(31 downto 0),
      TRICACHE_TX10(31 downto 0) => Rasterizer_0_TRICACHE_TX10(31 downto 0),
      TRICACHE_TX20(31 downto 0) => Rasterizer_0_TRICACHE_TX20(31 downto 0),
      TRICACHE_TY0(31 downto 0) => Rasterizer_0_TRICACHE_TY0(31 downto 0),
      TRICACHE_TY10(31 downto 0) => Rasterizer_0_TRICACHE_TY10(31 downto 0),
      TRICACHE_TY20(31 downto 0) => Rasterizer_0_TRICACHE_TY20(31 downto 0),
      TRICACHE_VertColor0(127 downto 0) => Rasterizer_0_TRICACHE_VertColor0(127 downto 0),
      TRICACHE_VertColor10(127 downto 0) => Rasterizer_0_TRICACHE_VertColor10(127 downto 0),
      TRICACHE_VertColor20(127 downto 0) => Rasterizer_0_TRICACHE_VertColor20(127 downto 0),
      TRICACHE_Z0(31 downto 0) => Rasterizer_0_TRICACHE_Z0(31 downto 0),
      TRICACHE_Z10(31 downto 0) => Rasterizer_0_TRICACHE_Z10(31 downto 0),
      TRICACHE_Z20(31 downto 0) => Rasterizer_0_TRICACHE_Z20(31 downto 0),
      TRISETUP_CurrentDrawEventID(15 downto 0) => TriSetup_0_RAST_CurrentDrawEventID(15 downto 0),
      TRISETUP_inBarycentricInverse(31 downto 0) => TriSetup_0_RAST_outBarycentricInverse(31 downto 0),
      TRISETUP_inBarycentricXDeltaA(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaA(15 downto 0),
      TRISETUP_inBarycentricXDeltaB(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaB(15 downto 0),
      TRISETUP_inBarycentricXDeltaC(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaC(15 downto 0),
      TRISETUP_inBarycentricYDeltaA(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaA(15 downto 0),
      TRISETUP_inBarycentricYDeltaB(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaB(15 downto 0),
      TRISETUP_inBarycentricYDeltaC(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaC(15 downto 0),
      TRISETUP_inInitialBarycentricRowResetA(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetA(31 downto 0),
      TRISETUP_inInitialBarycentricRowResetB(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetB(31 downto 0),
      TRISETUP_inInitialBarycentricRowResetC(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetC(31 downto 0),
      TRISETUP_inInvW0(31 downto 0) => TriSetup_0_RAST_v0_out_invW(31 downto 0),
      TRISETUP_inInvW10(31 downto 0) => TriSetup_0_RAST_v10_out_invW(31 downto 0),
      TRISETUP_inInvW20(31 downto 0) => TriSetup_0_RAST_v20_out_invW(31 downto 0),
      TRISETUP_inIsTopLeftEdgeA => TriSetup_0_RAST_outIsTopLeftEdgeA,
      TRISETUP_inIsTopLeftEdgeB => TriSetup_0_RAST_outIsTopLeftEdgeB,
      TRISETUP_inIsTopLeftEdgeC => TriSetup_0_RAST_outIsTopLeftEdgeC,
      TRISETUP_inMaxX(15 downto 0) => TriSetup_0_RAST_outMaxX(15 downto 0),
      TRISETUP_inMaxY(15 downto 0) => TriSetup_0_RAST_outMaxY(15 downto 0),
      TRISETUP_inMinX(15 downto 0) => TriSetup_0_RAST_outMinX(15 downto 0),
      TRISETUP_inMinY(15 downto 0) => TriSetup_0_RAST_outMinY(15 downto 0),
      TRISETUP_inTX0(31 downto 0) => TriSetup_0_RAST_t0_out_x(31 downto 0),
      TRISETUP_inTX10(31 downto 0) => TriSetup_0_RAST_t10_out_x(31 downto 0),
      TRISETUP_inTX20(31 downto 0) => TriSetup_0_RAST_t20_out_x(31 downto 0),
      TRISETUP_inTY0(31 downto 0) => TriSetup_0_RAST_t0_out_y(31 downto 0),
      TRISETUP_inTY10(31 downto 0) => TriSetup_0_RAST_t10_out_y(31 downto 0),
      TRISETUP_inTY20(31 downto 0) => TriSetup_0_RAST_t20_out_y(31 downto 0),
      TRISETUP_inVertColor0(127 downto 0) => TriSetup_0_RAST_v0_out_colorRGBA(127 downto 0),
      TRISETUP_inVertColor10(127 downto 0) => TriSetup_0_RAST_v10_out_colorRGBA(127 downto 0),
      TRISETUP_inVertColor20(127 downto 0) => TriSetup_0_RAST_v20_out_colorRGBA(127 downto 0),
      TRISETUP_inZ0(31 downto 0) => TriSetup_0_RAST_v0_out_Z(31 downto 0),
      TRISETUP_inZ10(31 downto 0) => TriSetup_0_RAST_v10_out_Z(31 downto 0),
      TRISETUP_inZ20(31 downto 0) => TriSetup_0_RAST_v20_out_Z(31 downto 0),
      TRISETUP_newTriBegin => TriSetup_0_RAST_triSetupDataIsValid,
      TRISETUP_readyForNewTri => Rasterizer_0_TRISETUP_readyForNewTri,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
ResetN_UntilClockLoc_0: component design_1_ResetN_UntilClockLoc_0_0
     port map (
      locked => xlconstant_0_dout(0),
      reset => reset_1,
      resetn => ResetN_UntilClockLoc_0_resetn
    );
ScanoutSystem: entity work.ScanoutSystem_imp_173H4WL
     port map (
      CMD_BaseRenderTargetAddr(29 downto 0) => CommandProcessor_0_SCANOUT_RenderTargetBaseAddr(29 downto 0),
      CMD_InvertOutputColor => CommandProcessor_0_SCANOUT_InvertOutputColor,
      CMD_OutputColorChannels(8 downto 0) => CommandProcessor_0_SCANOUT_OutputColorChannels(8 downto 0),
      CMD_ScanoutEnable => CommandProcessor_0_SCANOUT_ScanEnable,
      CMD_VSync => ScanoutSystem_CMD_VSync,
      ScanoutReadRequestsFIFO_full => ScanOut_0_ScanoutReadRequestsFIFO_FULL,
      ScanoutReadRequestsFIFO_wr_data(29 downto 0) => ScanOut_0_ScanoutReadRequestsFIFO_WR_DATA(29 downto 0),
      ScanoutReadRequestsFIFO_wr_en => ScanOut_0_ScanoutReadRequestsFIFO_WR_EN,
      ScanoutReadResponses_empty => ScanOut_0_ScanoutReadResponses_EMPTY,
      ScanoutReadResponses_rd_data(255 downto 0) => ScanOut_0_ScanoutReadResponses_RD_DATA(255 downto 0),
      ScanoutReadResponses_rd_en => ScanOut_0_ScanoutReadResponses_RD_EN,
      clk_in1 => ddr4_0_addn_ui_clkout1,
      clk_out1 => rd_clk_1,
      cmd_clk => ddr4_0_c0_ddr4_ui_clk,
      out_blue_n => ScanoutSystem_out_blue_n_0,
      out_blue_p => ScanoutSystem_out_blue_p_0,
      out_cl_n => ScanoutSystem_out_cl_n_0,
      out_cl_p => ScanoutSystem_out_cl_p_0,
      out_green_n => ScanoutSystem_out_green_n_0,
      out_green_p => ScanoutSystem_out_green_p_0,
      out_red_n => ScanoutSystem_out_red_n_0,
      out_red_p => ScanoutSystem_out_red_p_0
    );
ShaderCoreSystem: entity work.ShaderCoreSystem_imp_18IOXXF
     port map (
      CB_Enable => ShaderCoreSystem_CB_Enable,
      CB_RegComponent(1 downto 0) => ShaderCoreSystem_CB_RegComponent(1 downto 0),
      CB_RegIndex(7 downto 0) => ShaderCoreSystem_CB_RegIndex(7 downto 0),
      CB_WriteInData(31 downto 0) => ShaderCoreSystem_CB_WriteInData(31 downto 0),
      CB_WriteMode => ShaderCoreSystem_CB_WriteMode,
      CMD_InCommand_0(2 downto 0) => CMD_InCommand_0_1(2 downto 0),
      CMD_IsIdle => ShaderCoreSystem_CMD_IsIdle,
      CMD_IsReadyForCommand_0 => ShaderCoreSystem_CMD_IsReadyForCommand_0,
      CMD_LoadProgramAddr_0(29 downto 0) => CMD_LoadProgramAddr_0_1(29 downto 0),
      CMD_LoadProgramLen_0(15 downto 0) => CMD_LoadProgramLen_0_1(15 downto 0),
      CMD_SetConstantData_0(127 downto 0) => CMD_SetConstantData_0_1(127 downto 0),
      CMD_SetConstantIndex_0(7 downto 0) => CMD_SetConstantIndex_0_1(7 downto 0),
      CMD_SetNumVertexStreams_0(2 downto 0) => CMD_SetNumVertexStreams_0_1(2 downto 0),
      CMD_SetVertexStreamDWORDCount_0(2 downto 0) => CMD_SetVertexStreamDWORDCount_0_1(2 downto 0),
      CMD_SetVertexStreamDWORDOffset_0(5 downto 0) => CMD_SetVertexStreamDWORDOffset_0_1(5 downto 0),
      CMD_SetVertexStreamDWORDStride_0(5 downto 0) => CMD_SetVertexStreamDWORDStride_0_1(5 downto 0),
      CMD_SetVertexStreamID_0(2 downto 0) => CMD_SetVertexStreamID_0_1(2 downto 0),
      CMD_SetVertexStreamIsD3DCOLOR_0 => CMD_SetVertexStreamIsD3DCOLOR_0_1,
      CMD_SetVertexStreamShaderRegIndex_0(2 downto 0) => CMD_SetVertexStreamShaderRegIndex_0_1(2 downto 0),
      DBG_ActiveLanesBitmask(16 downto 0) => ShaderCoreSystem_DBG_ActiveLanesBitmask(16 downto 0),
      DBG_CurrentDWORD(2 downto 0) => ShaderCoreSystem_DBG_CurrentDWORD(2 downto 0),
      DBG_CurrentFetchWave(3 downto 0) => ShaderCoreSystem_DBG_CurrentFetchWave(3 downto 0),
      DBG_CurrentState(5 downto 0) => ShaderCoreSystem_DBG_CurrentState(5 downto 0),
      DBG_CurrentlyExecutingInstruction(63 downto 0) => NLW_ShaderCoreSystem_DBG_CurrentlyExecutingInstruction_UNCONNECTED(63 downto 0),
      DBG_InstructionPointer(8 downto 0) => ShaderCoreSystem_DBG_InstructionPointer(8 downto 0),
      DBG_PortW_MUX(1 downto 0) => ShaderCoreSystem_DBG_PortW_MUX(1 downto 0),
      DBG_ReadRegisterOutData(127 downto 0) => ShaderCoreSystem_DBG_ReadRegisterOutData(127 downto 0),
      DBG_ReadRegisterOutDataReady => ShaderCoreSystem_DBG_ReadRegisterOutDataReady,
      DBG_ReadRegisterOutRequest => CommandProcessor_0_SHADER_ReadRegisterOutRequest,
      DBG_State(3 downto 0) => ShaderCoreSystem_DBG_State(3 downto 0),
      FPU0_IN_A(31 downto 0) => ShaderCoreSystem_FPU0_IN_A(31 downto 0),
      FPU0_IN_B(31 downto 0) => ShaderCoreSystem_FPU0_IN_B(31 downto 0),
      FPU1_IN_A(31 downto 0) => ShaderCoreSystem_FPU1_IN_A(31 downto 0),
      FPU1_IN_B(31 downto 0) => ShaderCoreSystem_FPU1_IN_B(31 downto 0),
      FPU3_IN_A(31 downto 0) => ShaderCoreSystem_FPU3_IN_A(31 downto 0),
      FPU3_IN_B(31 downto 0) => ShaderCoreSystem_FPU3_IN_B(31 downto 0),
      FPUALL_IADD_GO => ShaderCoreSystem_FPUALL_IADD_GO,
      FPUALL_ICMP_GO => ShaderCoreSystem_FPUALL_ICMP_GO,
      FPUALL_ICNV_GO => ShaderCoreSystem_FPUALL_ICNV_GO,
      FPUALL_IMUL_GO => ShaderCoreSystem_FPUALL_IMUL_GO,
      FPUALL_IN_MODE(2 downto 0) => ShaderCoreSystem_FPUALL_IN_MODE(2 downto 0),
      FPUALL_ISHFT_GO => ShaderCoreSystem_FPUALL_ISHFT_GO,
      FPUALL_ISPEC_GO => ShaderCoreSystem_FPUALL_ISPEC_GO,
      GPR0_PortA_en => NLW_ShaderCoreSystem_GPR0_PortA_en_UNCONNECTED,
      GPR0_PortA_regChan(1 downto 0) => ShaderCoreSystem_GPR0_PortA_regChan(1 downto 0),
      GPR0_PortA_regIdx(2 downto 0) => ShaderCoreSystem_GPR0_PortA_regIdx(2 downto 0),
      GPR0_PortA_regType(1 downto 0) => ShaderCoreSystem_GPR0_PortA_regType(1 downto 0),
      GPR0_PortB_en => NLW_ShaderCoreSystem_GPR0_PortB_en_UNCONNECTED,
      GPR0_PortB_regChan(1 downto 0) => ShaderCoreSystem_GPR0_PortB_regChan(1 downto 0),
      GPR0_PortB_regIdx(2 downto 0) => ShaderCoreSystem_GPR0_PortB_regIdx(2 downto 0),
      GPR0_PortB_regType(1 downto 0) => ShaderCoreSystem_GPR0_PortB_regType(1 downto 0),
      GPR0_PortW_en => NLW_ShaderCoreSystem_GPR0_PortW_en_UNCONNECTED,
      GPR0_PortW_writeInData(127 downto 0) => ShaderCoreSystem_GPR0_PortW_writeInData(127 downto 0),
      GPR0_ReadQuadIndex(1 downto 0) => ShaderCoreSystem_GPR0_ReadQuadIndex(1 downto 0),
      GPR0_WriteQuadIndex(1 downto 0) => ShaderCoreSystem_GPR0_WriteQuadIndex(1 downto 0),
      INDEXOUT_FIFO_full => ShaderCoreSystem_INDEXOUT_FIFO_FULL,
      INDEXOUT_FIFO_wr_data(271 downto 0) => ShaderCoreSystem_INDEXOUT_FIFO_WR_DATA(271 downto 0),
      INDEXOUT_FIFO_wr_en => ShaderCoreSystem_INDEXOUT_FIFO_WR_EN,
      OUT_RESULT(31 downto 0) => ShaderCoreSystem_OUT_RESULT(31 downto 0),
      OUT_RESULT1(31 downto 0) => ShaderCoreSystem_OUT_RESULT1(31 downto 0),
      OUT_RESULT2(31 downto 0) => ShaderCoreSystem_OUT_RESULT2(31 downto 0),
      STAT_CurrentDrawEventID(15 downto 0) => ShaderCoreSystem_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesExecShaderCode(31 downto 0) => ShaderCoreSystem_STAT_CyclesExecShaderCode(31 downto 0),
      STAT_CyclesIdle(31 downto 0) => ShaderCoreSystem_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => ShaderCoreSystem_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => ShaderCoreSystem_STAT_CyclesWaitingForOutput(31 downto 0),
      VBB_Done_0 => VertexBatchBuilder_0_SHADER_Done,
      VBCacheReadRequests_0_full => ShaderCoreSystem_VBCacheReadRequests_0_FULL,
      VBCacheReadRequests_0_wr_data(29 downto 0) => ShaderCoreSystem_VBCacheReadRequests_0_WR_DATA(29 downto 0),
      VBCacheReadRequests_0_wr_en => ShaderCoreSystem_VBCacheReadRequests_0_WR_EN,
      VBCacheReadResponses_0_empty => ShaderCoreSystem_VBCacheReadResponses_0_EMPTY,
      VBCacheReadResponses_0_rd_data(255 downto 0) => ShaderCoreSystem_VBCacheReadResponses_0_RD_DATA(255 downto 0),
      VBCacheReadResponses_0_rd_en => ShaderCoreSystem_VBCacheReadResponses_0_RD_EN,
      VBO_IsIndexedDrawCall => ShaderCoreSystem_VBO_IsIndexedDrawCall,
      VBO_NumIndices(6 downto 0) => ShaderCoreSystem_VBO_NumIndices(6 downto 0),
      VBO_NumVertices(4 downto 0) => ShaderCoreSystem_VBO_NumVertices(4 downto 0),
      VBO_Pushed_0 => ShaderCoreSystem_VBO_Pushed_0,
      VBO_Ready_0 => VBO_Ready_0_1,
      VERTBATCH_FIFO_0_rd_data(543 downto 0) => fifo_generator_0_dout(543 downto 0),
      VERTBATCH_FIFO_empty => VBB_FIFO_empty,
      VERTBATCH_FIFO_rd_en => ShaderCoreSystem_VERTBATCH_FIFO_rd_en,
      VERTOUT_FIFO_0_full => ShaderCoreSystem_VERTOUT_FIFO_0_FULL,
      VERTOUT_FIFO_0_wr_data(319 downto 0) => ShaderCoreSystem_VERTOUT_FIFO_0_WR_DATA(319 downto 0),
      VERTOUT_FIFO_0_wr_en => ShaderCoreSystem_VERTOUT_FIFO_0_WR_EN,
      VSC_ReadDWORDAddr(21 downto 0) => ShaderCoreSystem_VSC_ReadDWORDAddr(21 downto 0),
      VSC_ReadData(31 downto 0) => ShaderCoreSystem_VSC_ReadData(31 downto 0),
      VSC_ReadReady => ShaderCoreSystem_VSC_ReadReady,
      VSC_StreamVBAddress(29 downto 0) => ShaderCoreSystem_VSC_StreamVBAddress(29 downto 0),
      VertexCache_addra(9 downto 0) => ShaderCoreSystem_VertexCache_addra(9 downto 0),
      VertexCache_dina(31 downto 0) => ShaderCoreSystem_VertexCache_dina(31 downto 0),
      clk_0 => ddr4_0_c0_ddr4_ui_clk,
      douta(31 downto 0) => ShaderCoreSystem_douta(31 downto 0),
      portA_readOutData_0(127 downto 0) => ShaderCoreSystem_portA_readOutData_0(127 downto 0),
      portB_readOutData_0(127 downto 0) => ShaderCoreSystem_portB_readOutData_0(127 downto 0),
      readOutData(31 downto 0) => ShaderCoreSystem_readOutData(31 downto 0)
    );
StatsCollector_0: component design_1_StatsCollector_0_0
     port map (
      CLIP_CurrentDrawEventID(15 downto 0) => ClipUnit_0_STAT_CurrentDrawEventID(15 downto 0),
      CLIP_CyclesIdle(31 downto 0) => ClipUnit_0_STAT_CyclesIdle(31 downto 0),
      CLIP_CyclesSpentWorking(31 downto 0) => ClipUnit_0_STAT_CyclesSpentWorking(31 downto 0),
      CLIP_CyclesWaitingForOutput(31 downto 0) => ClipUnit_0_STAT_CyclesWaitingForOutput(31 downto 0),
      CMD_CountTimestampsMemoryWrites(15 downto 0) => StatsCollector_0_CMD_CountTimestampsMemoryWrites(15 downto 0),
      CMD_CountTimestampsOrdersMemoryWrites(15 downto 0) => StatsCollector_0_CMD_CountTimestampsOrdersMemoryWrites(15 downto 0),
      CMD_CyclesIdle(31 downto 0) => CommandProcessor_0_STAT_CyclesIdle(31 downto 0),
      CMD_CyclesSpentWorking(31 downto 0) => CommandProcessor_0_STAT_CyclesSpentWorking(31 downto 0),
      CMD_EnableEventTimestamps => CommandProcessor_0_STAT_EnableEventTimestamps,
      CMD_PresentSignal => CommandProcessor_0_STAT_PresentSignal,
      CMD_SetNewStatsConfig => CommandProcessor_0_STAT_SetNewStatsConfig,
      CMD_StatsSaveComplete => StatsCollector_0_CMD_StatsSaveComplete,
      CMD_WriteEventTimestampOrders(29 downto 0) => CommandProcessor_0_STAT_WriteEventTimestampOrders(29 downto 0),
      CMD_WriteEventTimestampsAddress(29 downto 0) => CommandProcessor_0_STAT_WriteEventTimestampsAddress(29 downto 0),
      CMD_WriteFrameStatsAddress(29 downto 0) => CommandProcessor_0_STAT_WriteFrameStatsAddress(29 downto 0),
      DBG_CurrentState(4 downto 0) => StatsCollector_0_DBG_CurrentState(4 downto 0),
      DBG_CurrentWriteData(293 downto 0) => StatsCollector_0_DBG_CurrentWriteData(293 downto 0),
      DBG_CurrentWriteEn => StatsCollector_0_DBG_CurrentWriteEn,
      DBG_CurrentWriteOrderNibbles(15 downto 0) => StatsCollector_0_DBG_CurrentWriteOrderNibbles(15 downto 0),
      DBG_EventsWriteIsReady(9 downto 0) => StatsCollector_0_DBG_EventsWriteIsReady(9 downto 0),
      DBG_EventsWriteIsReadyAck(9 downto 0) => StatsCollector_0_DBG_EventsWriteIsReadyAck(9 downto 0),
      DINTERP_CurrentDrawEventID(15 downto 0) => DepthInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      DINTERP_CyclesIdle(31 downto 0) => DepthInterpolator_0_STAT_CyclesIdle(31 downto 0),
      DINTERP_CyclesSpentWorking(31 downto 0) => DepthInterpolator_0_STAT_CyclesSpentWorking(31 downto 0),
      DINTERP_CyclesWaitingForOutput(31 downto 0) => DepthInterpolator_0_STAT_CyclesWaitingForOutput(31 downto 0),
      IA_CurrentDrawEventID(15 downto 0) => InputAssembler2_0_CLIP_CurrentDrawEventID(15 downto 0),
      IA_CyclesIdle(31 downto 0) => InputAssembler2_0_STAT_CyclesIdle(31 downto 0),
      IA_CyclesLoadingDataToCache(31 downto 0) => InputAssembler2_0_STAT_CyclesLoadingDataToCache(31 downto 0),
      IA_CyclesSpentWorking(31 downto 0) => InputAssembler2_0_STAT_CyclesSpentWorking(31 downto 0),
      IA_CyclesWaitingForOutput(31 downto 0) => InputAssembler2_0_STAT_CyclesWaitingForOutput(31 downto 0),
      INTERP_CurrentDrawEventID(15 downto 0) => AttrInterpolator_0_STAT_CurrentDrawEventID(15 downto 0),
      INTERP_CyclesIdle(31 downto 0) => AttrInterpolator_0_STAT_CyclesIdle(31 downto 0),
      INTERP_CyclesSpentWorking(31 downto 0) => AttrInterpolator_0_STAT_CyclesSpentWorking(31 downto 0),
      INTERP_CyclesWaitingForOutput(31 downto 0) => AttrInterpolator_0_STAT_CyclesWaitingForOutput(31 downto 0),
      MEM_MemReadCountBytesTransferred(31 downto 0) => MemorySystem_STAT_MemReadCountBytesTransferred(31 downto 0),
      MEM_MemReadCountNonScanoutBytesTransferred(31 downto 0) => MemorySystem_STAT_MemReadCountNonScanoutBytesTransferred(31 downto 0),
      MEM_MemReadCountNonScanoutTransactions(31 downto 0) => MemorySystem_STAT_MemReadCountNonScanoutTransactions(31 downto 0),
      MEM_MemReadCountTransactions(31 downto 0) => MemorySystem_STAT_MemReadCountTransactions(31 downto 0),
      MEM_MemWriteCountBytesTransferred(31 downto 0) => MemorySystem_STAT_MemWriteCountBytesTransferred(31 downto 0),
      MEM_MemWriteCountTransactions(31 downto 0) => MemorySystem_STAT_MemWriteCountTransactions(31 downto 0),
      MEM_ReadCyclesIdle(31 downto 0) => MemorySystem_STAT_MemReadCyclesIdle(31 downto 0),
      MEM_ReadCyclesSpentWorking(31 downto 0) => MemorySystem_STAT_MemReadCyclesSpentWorking(31 downto 0),
      MEM_StatsWriteRequestsFIFO_full => StatsCollector_0_StatsWriteRequestsFIFO_FULL,
      MEM_StatsWriteRequestsFIFO_wr_data(293 downto 0) => StatsCollector_0_StatsWriteRequestsFIFO_WR_DATA(293 downto 0),
      MEM_StatsWriteRequestsFIFO_wr_en => StatsCollector_0_StatsWriteRequestsFIFO_WR_EN,
      MEM_WriteCyclesIdle(31 downto 0) => MemorySystem_STAT_MemWriteCyclesIdle(31 downto 0),
      MEM_WriteCyclesSpentWorking(31 downto 0) => MemorySystem_STAT_MemWriteCyclesSpentWorking(31 downto 0),
      RAST_CurrentDrawEventID(15 downto 0) => Rasterizer_0_STAT_CurrentDrawEventID(15 downto 0),
      RAST_CyclesIdle(31 downto 0) => Rasterizer_0_STAT_CyclesIdle(31 downto 0),
      RAST_CyclesSpentWorking(31 downto 0) => Rasterizer_0_STAT_CyclesSpentWorking(31 downto 0),
      RAST_CyclesWaitingForOutput(31 downto 0) => Rasterizer_0_STAT_CyclesWaitingForOutput(31 downto 0),
      RAST_CyclesWaitingForTriWorkCache(31 downto 0) => Rasterizer_0_STAT_CyclesWaitingForTriWorkCache(31 downto 0),
      ROP_CountCacheHits(31 downto 0) => ROP_0_STAT_CountCacheHits(31 downto 0),
      ROP_CountCacheMisses(31 downto 0) => ROP_0_STAT_CountCacheMisses(31 downto 0),
      ROP_CurrentDrawEventID(15 downto 0) => ROP_0_STAT_CurrentDrawEventID(15 downto 0),
      ROP_CyclesIdle(31 downto 0) => ROP_0_STAT_CyclesIdle(31 downto 0),
      ROP_CyclesSpentWorking(31 downto 0) => ROP_0_STAT_CyclesSpentWorking(31 downto 0),
      ROP_CyclesWaitingForMemoryRead(31 downto 0) => ROP_0_STAT_CyclesWaitingForMemoryRead(31 downto 0),
      ROP_CyclesWaitingForOutput(31 downto 0) => ROP_0_STAT_CyclesWaitingForOutput(31 downto 0),
      STAT_ResetWriteOrderNibblesFIFO => StatsCollector_0_STAT_ResetWriteOrderNibblesFIFO,
      STAT_WriteOrderNibblesFIFO_empty => StatsWriteOrderNibblesFIFO_empty,
      STAT_WriteOrderNibblesFIFO_full => StatsWriteOrderNibblesFIFO_full,
      STAT_WriteOrderNibblesFIFO_rd_data(15 downto 0) => StatsWriteOrderNibblesFIFO_dout(15 downto 0),
      STAT_WriteOrderNibblesFIFO_rd_en => StatsCollector_0_STAT_WriteOrderNibblesFIFO_rd_en,
      STAT_WriteOrderNibblesFIFO_wr_data(15 downto 0) => StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_data(15 downto 0),
      STAT_WriteOrderNibblesFIFO_wr_en => StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_en,
      TEXSAMP_CurrentDrawEventID(15 downto 0) => TexSample_0_STAT_CurrentDrawEventID(15 downto 0),
      TEXSAMP_CyclesIdle(31 downto 0) => TexSample_0_STAT_CyclesIdle(31 downto 0),
      TEXSAMP_CyclesSpentWorking(31 downto 0) => TexSample_0_STAT_CyclesSpentWorking(31 downto 0),
      TEXSAMP_CyclesWaitingCacheLoad(31 downto 0) => TexSample_0_STAT_CyclesWaitingCacheLoad(31 downto 0),
      TEXSAMP_CyclesWaitingForOutput(31 downto 0) => TexSample_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TRISETUP_CurrentDrawEventID(15 downto 0) => TriSetup_0_STAT_CurrentDrawEventID(15 downto 0),
      TRISETUP_CyclesIdle(31 downto 0) => TriSetup_0_STAT_CyclesIdle(31 downto 0),
      TRISETUP_CyclesSpentWorking(31 downto 0) => TriSetup_0_STAT_CyclesSpentWorking(31 downto 0),
      TRISETUP_CyclesWaitingForOutput(31 downto 0) => TriSetup_0_STAT_CyclesWaitingForOutput(31 downto 0),
      VBB_CurrentDrawEventID(15 downto 0) => VertexBatchBuilder_0_STAT_CurrentDrawEventID(15 downto 0),
      VBB_CyclesIdle(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesIdle(31 downto 0),
      VBB_CyclesSpentWorking(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesSpentWorking(31 downto 0),
      VBB_CyclesWaitingForOutput(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesWaitingForOutput(31 downto 0),
      VSHADER_CurrentDrawEventID(15 downto 0) => ShaderCoreSystem_STAT_CurrentDrawEventID(15 downto 0),
      VSHADER_CyclesExecShaderCode(31 downto 0) => ShaderCoreSystem_STAT_CyclesExecShaderCode(31 downto 0),
      VSHADER_CyclesIdle(31 downto 0) => ShaderCoreSystem_STAT_CyclesIdle(31 downto 0),
      VSHADER_CyclesSpentWorking(31 downto 0) => ShaderCoreSystem_STAT_CyclesSpentWorking(31 downto 0),
      VSHADER_CyclesWaitingForOutput(31 downto 0) => ShaderCoreSystem_STAT_CyclesWaitingForOutput(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
StatsWriteOrderNibblesFIFO: component design_1_fifo_generator_0_24
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(15 downto 0) => StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_data(15 downto 0),
      dout(15 downto 0) => StatsWriteOrderNibblesFIFO_dout(15 downto 0),
      empty => StatsWriteOrderNibblesFIFO_empty,
      full => StatsWriteOrderNibblesFIFO_full,
      rd_en => StatsCollector_0_STAT_WriteOrderNibblesFIFO_rd_en,
      rd_rst_busy => NLW_StatsWriteOrderNibblesFIFO_rd_rst_busy_UNCONNECTED,
      srst => StatsCollector_0_STAT_ResetWriteOrderNibblesFIFO,
      wr_en => StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_en,
      wr_rst_busy => NLW_StatsWriteOrderNibblesFIFO_wr_rst_busy_UNCONNECTED
    );
TEXSAMP_FIFO: component design_1_fifo_generator_0_21
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(95 downto 0) => AttrInterpolator_0_TEXSAMP_OutFIFO_wr_data(95 downto 0),
      dout(95 downto 0) => TEXSAMP_FIFO_dout(95 downto 0),
      empty => TEXSAMP_FIFO_empty,
      full => AttrInterpolator_0_TEXSAMP_OUT_FIFO_FULL,
      prog_full => TEXSAMP_FIFO_prog_full,
      rd_en => TexSample_0_INTERP_InFIFO_rd_en,
      wr_en => AttrInterpolator_0_TEXSAMP_OUT_FIFO_WR_EN
    );
TRISETUP_FPU_ADD: component design_1_StandaloneFloatALU_A_0_0
     port map (
      IADD_GO => TriSetup_0_FPU_ADD_GO,
      IN_A(31 downto 0) => TriSetup_0_FPU_ADD_A(31 downto 0),
      IN_B(31 downto 0) => TriSetup_0_FPU_ADD_B(31 downto 0),
      OADD(31 downto 0) => StandaloneFloatALU_A_0_OADD(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TRISETUP_FPU_CNV: component design_1_StandaloneFloatALU_C_0_1
     port map (
      ICNV_GO => TriSetup_0_FPU_CNV_GO,
      IN_A(31 downto 0) => TriSetup_0_FPU_CNV_A(31 downto 0),
      IN_MODE(2 downto 0) => TriSetup_0_FPU_CNV_Mode(2 downto 0),
      OCNV(31 downto 0) => StandaloneFloatALU_C_0_OCNV(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TRISETUP_FPU_MUL: component design_1_StandaloneFloatALU_M_0_0
     port map (
      IMUL_GO => TriSetup_0_FPU_MUL_GO,
      IN_A(31 downto 0) => TriSetup_0_FPU_MUL_A(31 downto 0),
      IN_B(31 downto 0) => TriSetup_0_FPU_MUL_B(31 downto 0),
      OMUL(31 downto 0) => StandaloneFloatALU_M_0_OMUL(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TRISETUP_FPU_SPEC: component design_1_StandaloneFloatALU_S_0_0
     port map (
      IN_A(31 downto 0) => TriSetup_0_FPU_SPEC_A(31 downto 0),
      ISPEC_GO => TriSetup_0_FPU_SPEC_GO,
      OSPEC(31 downto 0) => StandaloneFloatALU_S_0_OSPEC(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TexSampleStateBlock: component design_1_StateBlock_0_0
     port map (
      CMD_EndFrameReset => CommandProcessor_0_TEXSAMP_EndFrameReset,
      CMD_NewStateBits(73 downto 0) => CommandProcessor_0_TEXSAMP_NewStateBits(73 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_TEXSAMP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => StateBlock_0_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_TEXSAMP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => StateBlock_0_DBG_CurrentReadSlotIndex(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => StateBlock_0_DBG_CurrentWriteSlotIndex(1 downto 0),
      DBG_Slot0(15 downto 0) => StateBlock_0_DBG_Slot0(15 downto 0),
      DBG_Slot1(15 downto 0) => StateBlock_0_DBG_Slot1(15 downto 0),
      DBG_Slot2(15 downto 0) => StateBlock_0_DBG_Slot2(15 downto 0),
      DBG_Slot3(15 downto 0) => StateBlock_0_DBG_Slot3(15 downto 0),
      DBG_SlotsValid(3 downto 0) => StateBlock_0_DBG_SlotsValid(3 downto 0),
      STAGE_ConsumeStateSlot => TexSample_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => StateBlock_0_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(73 downto 0) => StateBlock_0_STAGE_StateBitsAtDrawID(73 downto 0),
      STAGE_StateIsValid => StateBlock_0_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TexSample_0: component design_1_TexSample_0_0
     port map (
      CMD_TexSampleIsIdle => TexSample_0_CMD_TexSampleIsIdle,
      DBG_TexCache_addra(13 downto 0) => TexSample_0_DBG_TexCache_addra(13 downto 0),
      DBG_TexCache_dina(31 downto 0) => TexSample_0_DBG_TexCache_dina(31 downto 0),
      DBG_TexCache_douta(31 downto 0) => NLW_TexSample_0_DBG_TexCache_douta_UNCONNECTED(31 downto 0),
      DBG_TexSample_State(5 downto 0) => TexSample_0_DBG_TexSample_State(5 downto 0),
      INTERP_InFIFO_empty => TEXSAMP_FIFO_empty,
      INTERP_InFIFO_rd_data(95 downto 0) => TEXSAMP_FIFO_dout(95 downto 0),
      INTERP_InFIFO_rd_en => TexSample_0_INTERP_InFIFO_rd_en,
      MEM_TexSampReadRequestsFIFO_full => TexSample_0_TexSampReadRequestsFIFO_FULL,
      MEM_TexSampReadRequestsFIFO_wr_data(29 downto 0) => TexSample_0_TexSampReadRequestsFIFO_WR_DATA(29 downto 0),
      MEM_TexSampReadRequestsFIFO_wr_en => TexSample_0_TexSampReadRequestsFIFO_WR_EN,
      MEM_TexSampReadResponsesFIFO_empty => TexSample_0_TexSampReadResponses_EMPTY,
      MEM_TexSampReadResponsesFIFO_rd_data(255 downto 0) => TexSample_0_TexSampReadResponses_RD_DATA(255 downto 0),
      MEM_TexSampReadResponsesFIFO_rd_en => TexSample_0_TexSampReadResponses_RD_EN,
      ROP_OutFIFO_full => TexSample_0_ROP_OUT_FIFO_FULL,
      ROP_OutFIFO_wr_data(63 downto 0) => TexSample_0_ROP_OutFIFO_wr_data(63 downto 0),
      ROP_OutFIFO_wr_en => TexSample_0_ROP_OUT_FIFO_WR_EN,
      STATE_ConsumeStateSlot => TexSample_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => StateBlock_0_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(73 downto 0) => StateBlock_0_STAGE_StateBitsAtDrawID(73 downto 0),
      STATE_StateIsValid => StateBlock_0_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => TexSample_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => TexSample_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => TexSample_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingCacheLoad(31 downto 0) => TexSample_0_STAT_CyclesWaitingCacheLoad(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => TexSample_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TexCache_addra(13 downto 0) => TexSample_0_TexCache_ADDR(13 downto 0),
      TexCache_dina(31 downto 0) => TexSample_0_TexCache_DIN(31 downto 0),
      TexCache_douta(31 downto 0) => TexSample_0_TexCache_DOUT(31 downto 0),
      TexCache_ena => TexSample_0_TexCache_EN,
      TexCache_wea(0) => TexSample_0_TexCache_WE(0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TextureCache_128x128x32bits: component design_1_blk_mem_gen_0_1
     port map (
      addra(13 downto 0) => TexSample_0_TexCache_ADDR(13 downto 0),
      clka => ddr4_0_c0_ddr4_ui_clk,
      dina(31 downto 0) => TexSample_0_TexCache_DIN(31 downto 0),
      douta(31 downto 0) => TexSample_0_TexCache_DOUT(31 downto 0),
      ena => TexSample_0_TexCache_EN,
      regcea => xlconstant_7_dout(0),
      wea(0) => TexSample_0_TexCache_WE(0)
    );
TriSetupStateBlock: component design_1_StateBlock_0_4
     port map (
      CMD_EndFrameReset => CommandProcessor_0_TRISETUP_EndFrameReset,
      CMD_NewStateBits(191 downto 0) => CommandProcessor_0_TRISETUP_NewStateBits(191 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_TRISETUP_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => TriSetupStateBlock_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_TRISETUP_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_TriSetupStateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_TriSetupStateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_TriSetupStateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_TriSetupStateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_TriSetupStateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_TriSetupStateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_TriSetupStateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => TriSetup_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => TriSetupStateBlock_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(191 downto 0) => TriSetupStateBlock_STAGE_StateBitsAtDrawID(191 downto 0),
      STAGE_StateIsValid => TriSetupStateBlock_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TriSetup_0: component design_1_TriSetup_0_0
     port map (
      CLIP_CurrentDrawEventID(15 downto 0) => ClipUnit_0_TRISETUP_CurrentDrawEventID(15 downto 0),
      CLIP_newTriBegin => ClipUnit_0_TRISETUP_outNextStageIsValid,
      CLIP_readyForNewTri => TriSetup_0_CLIP_readyForNewTri,
      CLIP_t0_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv0tx(31 downto 0),
      CLIP_t0_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv0ty(31 downto 0),
      CLIP_t1_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv1tx(31 downto 0),
      CLIP_t1_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv1ty(31 downto 0),
      CLIP_t2_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv2tx(31 downto 0),
      CLIP_t2_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv2ty(31 downto 0),
      CLIP_v0_in_RGBA(127 downto 0) => ClipUnit_0_TRISETUP_outv0rgba(127 downto 0),
      CLIP_v0_in_w(31 downto 0) => ClipUnit_0_TRISETUP_outv0w(31 downto 0),
      CLIP_v0_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv0x(31 downto 0),
      CLIP_v0_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv0y(31 downto 0),
      CLIP_v0_in_z(31 downto 0) => ClipUnit_0_TRISETUP_outv0z(31 downto 0),
      CLIP_v1_in_RGBA(127 downto 0) => ClipUnit_0_TRISETUP_outv1rgba(127 downto 0),
      CLIP_v1_in_w(31 downto 0) => ClipUnit_0_TRISETUP_outv1w(31 downto 0),
      CLIP_v1_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv1x(31 downto 0),
      CLIP_v1_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv1y(31 downto 0),
      CLIP_v1_in_z(31 downto 0) => ClipUnit_0_TRISETUP_outv1z(31 downto 0),
      CLIP_v2_in_RGBA(127 downto 0) => ClipUnit_0_TRISETUP_outv2rgba(127 downto 0),
      CLIP_v2_in_w(31 downto 0) => ClipUnit_0_TRISETUP_outv2w(31 downto 0),
      CLIP_v2_in_x(31 downto 0) => ClipUnit_0_TRISETUP_outv2x(31 downto 0),
      CLIP_v2_in_y(31 downto 0) => ClipUnit_0_TRISETUP_outv2y(31 downto 0),
      CLIP_v2_in_z(31 downto 0) => ClipUnit_0_TRISETUP_outv2z(31 downto 0),
      CMD_TriSetupIsIdle => TriSetup_0_CMD_TriSetupIsIdle,
      DBG_LeftProd0(31 downto 0) => NLW_TriSetup_0_DBG_LeftProd0_UNCONNECTED(31 downto 0),
      DBG_LeftProd1(31 downto 0) => NLW_TriSetup_0_DBG_LeftProd1_UNCONNECTED(31 downto 0),
      DBG_LeftProd2(31 downto 0) => NLW_TriSetup_0_DBG_LeftProd2_UNCONNECTED(31 downto 0),
      DBG_MaxX(15 downto 0) => TriSetup_0_DBG_MaxX(15 downto 0),
      DBG_MaxY(15 downto 0) => TriSetup_0_DBG_MaxY(15 downto 0),
      DBG_MinX(15 downto 0) => TriSetup_0_DBG_MinX(15 downto 0),
      DBG_MinY(15 downto 0) => TriSetup_0_DBG_MinY(15 downto 0),
      DBG_RightProd0(31 downto 0) => NLW_TriSetup_0_DBG_RightProd0_UNCONNECTED(31 downto 0),
      DBG_RightProd1(31 downto 0) => NLW_TriSetup_0_DBG_RightProd1_UNCONNECTED(31 downto 0),
      DBG_RightProd2(31 downto 0) => NLW_TriSetup_0_DBG_RightProd2_UNCONNECTED(31 downto 0),
      DBG_TriSetup_State(7 downto 0) => TriSetup_0_DBG_TriSetup_State(7 downto 0),
      DBG_TwiceTriArea(31 downto 0) => TriSetup_0_DBG_TwiceTriArea(31 downto 0),
      DBG_XProdProd0(31 downto 0) => TriSetup_0_DBG_XProdProd0(31 downto 0),
      DBG_XProdProd1(31 downto 0) => TriSetup_0_DBG_XProdProd1(31 downto 0),
      DBG_XProdSub0(31 downto 0) => TriSetup_0_DBG_XProdSub0(31 downto 0),
      DBG_XProdSub1(31 downto 0) => TriSetup_0_DBG_XProdSub1(31 downto 0),
      DBG_XProdSub2(31 downto 0) => TriSetup_0_DBG_XProdSub2(31 downto 0),
      DBG_XProdSub3(31 downto 0) => TriSetup_0_DBG_XProdSub3(31 downto 0),
      FPU_ADD_A(31 downto 0) => TriSetup_0_FPU_ADD_A(31 downto 0),
      FPU_ADD_B(31 downto 0) => TriSetup_0_FPU_ADD_B(31 downto 0),
      FPU_ADD_GO => TriSetup_0_FPU_ADD_GO,
      FPU_ADD_OUT(31 downto 0) => StandaloneFloatALU_A_0_OADD(31 downto 0),
      FPU_CNV_A(31 downto 0) => TriSetup_0_FPU_CNV_A(31 downto 0),
      FPU_CNV_GO => TriSetup_0_FPU_CNV_GO,
      FPU_CNV_Mode(2 downto 0) => TriSetup_0_FPU_CNV_Mode(2 downto 0),
      FPU_CNV_OUT(31 downto 0) => StandaloneFloatALU_C_0_OCNV(31 downto 0),
      FPU_MUL_A(31 downto 0) => TriSetup_0_FPU_MUL_A(31 downto 0),
      FPU_MUL_B(31 downto 0) => TriSetup_0_FPU_MUL_B(31 downto 0),
      FPU_MUL_GO => TriSetup_0_FPU_MUL_GO,
      FPU_MUL_OUT(31 downto 0) => StandaloneFloatALU_M_0_OMUL(31 downto 0),
      FPU_SPEC_A(31 downto 0) => TriSetup_0_FPU_SPEC_A(31 downto 0),
      FPU_SPEC_GO => TriSetup_0_FPU_SPEC_GO,
      FPU_SPEC_OUT(31 downto 0) => StandaloneFloatALU_S_0_OSPEC(31 downto 0),
      RAST_CurrentDrawEventID(15 downto 0) => TriSetup_0_RAST_CurrentDrawEventID(15 downto 0),
      RAST_outBarycentricInverse(31 downto 0) => TriSetup_0_RAST_outBarycentricInverse(31 downto 0),
      RAST_outBarycentricXDeltaA(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaA(15 downto 0),
      RAST_outBarycentricXDeltaB(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaB(15 downto 0),
      RAST_outBarycentricXDeltaC(15 downto 0) => TriSetup_0_RAST_outBarycentricXDeltaC(15 downto 0),
      RAST_outBarycentricYDeltaA(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaA(15 downto 0),
      RAST_outBarycentricYDeltaB(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaB(15 downto 0),
      RAST_outBarycentricYDeltaC(15 downto 0) => TriSetup_0_RAST_outBarycentricYDeltaC(15 downto 0),
      RAST_outInitialBarycentricRowResetA(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetA(31 downto 0),
      RAST_outInitialBarycentricRowResetB(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetB(31 downto 0),
      RAST_outInitialBarycentricRowResetC(31 downto 0) => TriSetup_0_RAST_outInitialBarycentricRowResetC(31 downto 0),
      RAST_outIsTopLeftEdgeA => TriSetup_0_RAST_outIsTopLeftEdgeA,
      RAST_outIsTopLeftEdgeB => TriSetup_0_RAST_outIsTopLeftEdgeB,
      RAST_outIsTopLeftEdgeC => TriSetup_0_RAST_outIsTopLeftEdgeC,
      RAST_outMaxX(15 downto 0) => TriSetup_0_RAST_outMaxX(15 downto 0),
      RAST_outMaxY(15 downto 0) => TriSetup_0_RAST_outMaxY(15 downto 0),
      RAST_outMinX(15 downto 0) => TriSetup_0_RAST_outMinX(15 downto 0),
      RAST_outMinY(15 downto 0) => TriSetup_0_RAST_outMinY(15 downto 0),
      RAST_readyForTriSetupData => Rasterizer_0_TRISETUP_readyForNewTri,
      RAST_t0_out_x(31 downto 0) => TriSetup_0_RAST_t0_out_x(31 downto 0),
      RAST_t0_out_y(31 downto 0) => TriSetup_0_RAST_t0_out_y(31 downto 0),
      RAST_t10_out_x(31 downto 0) => TriSetup_0_RAST_t10_out_x(31 downto 0),
      RAST_t10_out_y(31 downto 0) => TriSetup_0_RAST_t10_out_y(31 downto 0),
      RAST_t20_out_x(31 downto 0) => TriSetup_0_RAST_t20_out_x(31 downto 0),
      RAST_t20_out_y(31 downto 0) => TriSetup_0_RAST_t20_out_y(31 downto 0),
      RAST_triSetupDataIsValid => TriSetup_0_RAST_triSetupDataIsValid,
      RAST_v0_out_Z(31 downto 0) => TriSetup_0_RAST_v0_out_Z(31 downto 0),
      RAST_v0_out_colorRGBA(127 downto 0) => TriSetup_0_RAST_v0_out_colorRGBA(127 downto 0),
      RAST_v0_out_invW(31 downto 0) => TriSetup_0_RAST_v0_out_invW(31 downto 0),
      RAST_v10_out_Z(31 downto 0) => TriSetup_0_RAST_v10_out_Z(31 downto 0),
      RAST_v10_out_colorRGBA(127 downto 0) => TriSetup_0_RAST_v10_out_colorRGBA(127 downto 0),
      RAST_v10_out_invW(31 downto 0) => TriSetup_0_RAST_v10_out_invW(31 downto 0),
      RAST_v20_out_Z(31 downto 0) => TriSetup_0_RAST_v20_out_Z(31 downto 0),
      RAST_v20_out_colorRGBA(127 downto 0) => TriSetup_0_RAST_v20_out_colorRGBA(127 downto 0),
      RAST_v20_out_invW(31 downto 0) => TriSetup_0_RAST_v20_out_invW(31 downto 0),
      STATE_ConsumeStateSlot => TriSetup_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => TriSetupStateBlock_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(191 downto 0) => TriSetupStateBlock_STAGE_StateBitsAtDrawID(191 downto 0),
      STATE_StateIsValid => TriSetupStateBlock_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => TriSetup_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => TriSetup_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => TriSetup_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => TriSetup_0_STAT_CyclesWaitingForOutput(31 downto 0),
      TEXCFG_nointerpolation => placeholder_texcfg_dout(0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
TriWorkCache2_0: component design_1_TriWorkCache2_0_0
     port map (
      DINTERP_PopTriangleSlot => DepthInterpolator_0_TRICACHE_PopTriangleSlot,
      DINTERP_TRIDATA_FIFO_empty => TriWorkCache2_0_DINTERP_TRIDATA_RD_EMPTY,
      DINTERP_TRIDATA_FIFO_full => TriWorkCache2_0_DINTERP_TRIDATA_WR_FULL,
      DINTERP_TRIDATA_FIFO_rd_data(223 downto 0) => TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_DATA(223 downto 0),
      DINTERP_TRIDATA_FIFO_rd_en => TriWorkCache2_0_DINTERP_TRIDATA_RD_RD_EN,
      DINTERP_TRIDATA_FIFO_wr_data(223 downto 0) => TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_DATA(223 downto 0),
      DINTERP_TRIDATA_FIFO_wr_en => TriWorkCache2_0_DINTERP_TRIDATA_WR_WR_EN,
      DINTERP_outBarycentricInverse(31 downto 0) => TriWorkCache2_0_DINTERP_outBarycentricInverse(31 downto 0),
      DINTERP_outInvW0(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW0(31 downto 0),
      DINTERP_outInvW10(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW10(31 downto 0),
      DINTERP_outInvW20(31 downto 0) => TriWorkCache2_0_DINTERP_outInvW20(31 downto 0),
      DINTERP_outZ0(31 downto 0) => TriWorkCache2_0_DINTERP_outZ0(31 downto 0),
      DINTERP_outZ10(31 downto 0) => TriWorkCache2_0_DINTERP_outZ10(31 downto 0),
      DINTERP_outZ20(31 downto 0) => TriWorkCache2_0_DINTERP_outZ20(31 downto 0),
      INTERP_PopTriangleSlot => AttrInterpolator_0_TRICACHE_PopTriangleSlot,
      INTERP_TRIDATA_FIFO_empty => TriWorkCache2_0_INTERP_TRIDATA_RD_EMPTY,
      INTERP_TRIDATA_FIFO_full => TriWorkCache2_0_INTERP_TRIDATA_WR_FULL,
      INTERP_TRIDATA_FIFO_rd_data(575 downto 0) => TriWorkCache2_0_INTERP_TRIDATA_RD_RD_DATA(575 downto 0),
      INTERP_TRIDATA_FIFO_rd_en => TriWorkCache2_0_INTERP_TRIDATA_RD_RD_EN,
      INTERP_TRIDATA_FIFO_wr_data(575 downto 0) => TriWorkCache2_0_INTERP_TRIDATA_WR_WR_DATA(575 downto 0),
      INTERP_TRIDATA_FIFO_wr_en => TriWorkCache2_0_INTERP_TRIDATA_WR_WR_EN,
      INTERP_outColorRGBA0(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA0(127 downto 0),
      INTERP_outColorRGBA10(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA10(127 downto 0),
      INTERP_outColorRGBA20(127 downto 0) => TriWorkCache2_0_INTERP_outColorRGBA20(127 downto 0),
      INTERP_outT0X(31 downto 0) => TriWorkCache2_0_INTERP_outT0X(31 downto 0),
      INTERP_outT0Y(31 downto 0) => TriWorkCache2_0_INTERP_outT0Y(31 downto 0),
      INTERP_outT10X(31 downto 0) => TriWorkCache2_0_INTERP_outT10X(31 downto 0),
      INTERP_outT10Y(31 downto 0) => TriWorkCache2_0_INTERP_outT10Y(31 downto 0),
      INTERP_outT20X(31 downto 0) => TriWorkCache2_0_INTERP_outT20X(31 downto 0),
      INTERP_outT20Y(31 downto 0) => TriWorkCache2_0_INTERP_outT20Y(31 downto 0),
      RAST_IsFull => TriWorkCache2_0_RAST_IsFull,
      RAST_PushNewTriData => Rasterizer_0_TRICACHE_PushNewTriData,
      RAST_inBarycentricInverse(31 downto 0) => Rasterizer_0_TRICACHE_BarycentricInverse(31 downto 0),
      RAST_inColorRGBA0(127 downto 0) => Rasterizer_0_TRICACHE_VertColor0(127 downto 0),
      RAST_inColorRGBA10(127 downto 0) => Rasterizer_0_TRICACHE_VertColor10(127 downto 0),
      RAST_inColorRGBA20(127 downto 0) => Rasterizer_0_TRICACHE_VertColor20(127 downto 0),
      RAST_inInvW0(31 downto 0) => Rasterizer_0_TRICACHE_InvW0(31 downto 0),
      RAST_inInvW10(31 downto 0) => Rasterizer_0_TRICACHE_InvW10(31 downto 0),
      RAST_inInvW20(31 downto 0) => Rasterizer_0_TRICACHE_InvW20(31 downto 0),
      RAST_inT0X(31 downto 0) => Rasterizer_0_TRICACHE_TX0(31 downto 0),
      RAST_inT0Y(31 downto 0) => Rasterizer_0_TRICACHE_TY0(31 downto 0),
      RAST_inT10X(31 downto 0) => Rasterizer_0_TRICACHE_TX10(31 downto 0),
      RAST_inT10Y(31 downto 0) => Rasterizer_0_TRICACHE_TY10(31 downto 0),
      RAST_inT20X(31 downto 0) => Rasterizer_0_TRICACHE_TX20(31 downto 0),
      RAST_inT20Y(31 downto 0) => Rasterizer_0_TRICACHE_TY20(31 downto 0),
      RAST_inZ0(31 downto 0) => Rasterizer_0_TRICACHE_Z0(31 downto 0),
      RAST_inZ10(31 downto 0) => Rasterizer_0_TRICACHE_Z10(31 downto 0),
      RAST_inZ20(31 downto 0) => Rasterizer_0_TRICACHE_Z20(31 downto 0),
      clk => ddr4_0_c0_ddr4_ui_clk
    );
VBB_FIFO: component design_1_fifo_generator_0_14
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(543 downto 0) => VertexBatchBuilder_0_VertexBatchFIFO_WR_DATA(543 downto 0),
      dout(543 downto 0) => fifo_generator_0_dout(543 downto 0),
      empty => VBB_FIFO_empty,
      full => VertexBatchBuilder_0_VertexBatchFIFO_FULL,
      rd_en => ShaderCoreSystem_VERTBATCH_FIFO_rd_en,
      rd_rst_busy => NLW_VBB_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => VertexBatchBuilder_0_VertexBatchFIFO_WR_EN,
      wr_rst_busy => NLW_VBB_FIFO_wr_rst_busy_UNCONNECTED
    );
VBB_StateBlock: component design_1_StateBlock_0_5
     port map (
      CMD_EndFrameReset => CommandProcessor_0_VBB_EndFrameReset,
      CMD_NewStateBits(34 downto 0) => CommandProcessor_0_VBB_NewStateBits(34 downto 0),
      CMD_NewStateDrawEventID(15 downto 0) => CommandProcessor_0_VBB_NewStateDrawEventID(15 downto 0),
      CMD_NumFreeSlots(2 downto 0) => VBB_StateBlock_CMD_NumFreeSlots(2 downto 0),
      CMD_SetNewState => CommandProcessor_0_VBB_SetNewState,
      DBG_CurrentReadSlotIndex(1 downto 0) => NLW_VBB_StateBlock_DBG_CurrentReadSlotIndex_UNCONNECTED(1 downto 0),
      DBG_CurrentWriteSlotIndex(1 downto 0) => NLW_VBB_StateBlock_DBG_CurrentWriteSlotIndex_UNCONNECTED(1 downto 0),
      DBG_Slot0(15 downto 0) => NLW_VBB_StateBlock_DBG_Slot0_UNCONNECTED(15 downto 0),
      DBG_Slot1(15 downto 0) => NLW_VBB_StateBlock_DBG_Slot1_UNCONNECTED(15 downto 0),
      DBG_Slot2(15 downto 0) => NLW_VBB_StateBlock_DBG_Slot2_UNCONNECTED(15 downto 0),
      DBG_Slot3(15 downto 0) => NLW_VBB_StateBlock_DBG_Slot3_UNCONNECTED(15 downto 0),
      DBG_SlotsValid(3 downto 0) => NLW_VBB_StateBlock_DBG_SlotsValid_UNCONNECTED(3 downto 0),
      STAGE_ConsumeStateSlot => VertexBatchBuilder_0_STATE_ConsumeStateSlot,
      STAGE_NextDrawID(15 downto 0) => VBB_StateBlock_STAGE_NextDrawID(15 downto 0),
      STAGE_StateBitsAtDrawID(34 downto 0) => VBB_StateBlock_STAGE_StateBitsAtDrawID(34 downto 0),
      STAGE_StateIsValid => VBB_StateBlock_STAGE_StateIsValid,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
VBO_FIFO: component design_1_fifo_generator_1_2
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(319 downto 0) => ShaderCoreSystem_VERTOUT_FIFO_0_WR_DATA(319 downto 0),
      dout(319 downto 0) => VBO_FIFO_dout(319 downto 0),
      empty => VBO_FIFO_empty,
      full => ShaderCoreSystem_VERTOUT_FIFO_0_FULL,
      rd_en => InputAssembler2_0_VERTOUT_FIFO_rd_en,
      rd_rst_busy => NLW_VBO_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => ShaderCoreSystem_VERTOUT_FIFO_0_WR_EN,
      wr_rst_busy => NLW_VBO_FIFO_wr_rst_busy_UNCONNECTED
    );
VBO_INDEX_FIFO: component design_1_fifo_generator_0_19
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(271 downto 0) => ShaderCoreSystem_INDEXOUT_FIFO_WR_DATA(271 downto 0),
      dout(271 downto 0) => VBO_INDEX_FIFO_dout(271 downto 0),
      empty => InputAssembler2_0_INDEXOUT_FIFO_EMPTY,
      full => ShaderCoreSystem_INDEXOUT_FIFO_FULL,
      rd_en => InputAssembler2_0_INDEXOUT_FIFO_RD_EN,
      rd_rst_busy => NLW_VBO_INDEX_FIFO_rd_rst_busy_UNCONNECTED,
      srst => '0',
      wr_en => ShaderCoreSystem_INDEXOUT_FIFO_WR_EN,
      wr_rst_busy => NLW_VBO_INDEX_FIFO_wr_rst_busy_UNCONNECTED
    );
VertexBatchBuilder_0: component design_1_VertexBatchBuilder_0_0
     port map (
      CMD_CommandArg0(23 downto 0) => CommandProcessor_0_VBB_CommandArg0(23 downto 0),
      CMD_CommandArg1(19 downto 0) => CommandProcessor_0_VBB_CommandArg1(19 downto 0),
      CMD_CommandArg2(15 downto 0) => CommandProcessor_0_VBB_CommandArg2(15 downto 0),
      CMD_NewDrawEventID(15 downto 0) => CommandProcessor_0_VBB_NewDrawEventID(15 downto 0),
      CMD_ReadyState => VertexBatchBuilder_0_CMD_ReadyState,
      CMD_SendCommand(1 downto 0) => CommandProcessor_0_VBB_SendCommand(1 downto 0),
      DBG_CurrentBatchLength(4 downto 0) => VertexBatchBuilder_0_DBG_CurrentBatchLength(4 downto 0),
      DBG_CurrentBatchRemainingPrims(23 downto 0) => VertexBatchBuilder_0_DBG_CurrentBatchRemainingPrims(23 downto 0),
      DBG_CurrentIndexBatchLength(6 downto 0) => NLW_VertexBatchBuilder_0_DBG_CurrentIndexBatchLength_UNCONNECTED(6 downto 0),
      DBG_CurrentState(3 downto 0) => VertexBatchBuilder_0_DBG_CurrentState(3 downto 0),
      DBG_DoneGeneratingIndices => NLW_VertexBatchBuilder_0_DBG_DoneGeneratingIndices_UNCONNECTED,
      DBG_IndexGeneratorRemainingPrims(23 downto 0) => NLW_VertexBatchBuilder_0_DBG_IndexGeneratorRemainingPrims_UNCONNECTED(23 downto 0),
      DBG_LastPolygonIndices(47 downto 0) => VertexBatchBuilder_0_DBG_LastPolygonIndices(47 downto 0),
      DBG_QueueIsEmpty => NLW_VertexBatchBuilder_0_DBG_QueueIsEmpty_UNCONNECTED,
      DBG_QueueIsFull => NLW_VertexBatchBuilder_0_DBG_QueueIsFull_UNCONNECTED,
      DBG_UseConstantOutput => xlconstant_6_dout(0),
      IBC_InvalidateIndexCache => VertexBatchBuilder_0_IBC_InvalidateIndexCache,
      IBC_ReadAddr(29 downto 0) => VertexBatchBuilder_0_IBC_ReadAddr(29 downto 0),
      IBC_ReadData(31 downto 0) => IndexBufferCache_0_VBB_ReadData(31 downto 0),
      IBC_ReadEnable => VertexBatchBuilder_0_IBC_ReadEnable,
      IBC_ReadReady => IndexBufferCache_0_VBB_ReadReady,
      SHADER_Done => VertexBatchBuilder_0_SHADER_Done,
      STATE_ConsumeStateSlot => VertexBatchBuilder_0_STATE_ConsumeStateSlot,
      STATE_NextDrawID(15 downto 0) => VBB_StateBlock_STAGE_NextDrawID(15 downto 0),
      STATE_StateBitsAtDrawID(34 downto 0) => VBB_StateBlock_STAGE_StateBitsAtDrawID(34 downto 0),
      STATE_StateIsValid => VBB_StateBlock_STAGE_StateIsValid,
      STAT_CurrentDrawEventID(15 downto 0) => VertexBatchBuilder_0_STAT_CurrentDrawEventID(15 downto 0),
      STAT_CyclesIdle(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesIdle(31 downto 0),
      STAT_CyclesSpentWorking(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesSpentWorking(31 downto 0),
      STAT_CyclesWaitingForOutput(31 downto 0) => VertexBatchBuilder_0_STAT_CyclesWaitingForOutput(31 downto 0),
      VERTBATCH_FIFO_full => VertexBatchBuilder_0_VertexBatchFIFO_FULL,
      VERTBATCH_FIFO_wr_data(543 downto 0) => VertexBatchBuilder_0_VertexBatchFIFO_WR_DATA(543 downto 0),
      VERTBATCH_FIFO_wr_en => VertexBatchBuilder_0_VertexBatchFIFO_WR_EN,
      clk => ddr4_0_c0_ddr4_ui_clk
    );
constant_always_locked: component design_1_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
ila_333_250: component design_1_ila_0_0
     port map (
      clk => ddr4_0_c0_ddr4_ui_clk,
      probe0(7 downto 0) => CommandProcessor_0_DBG_PACKETSTATE(7 downto 0),
      probe1(87 downto 0) => CommandProcessor_0_DBG_LAST_IN_PACKET(87 downto 0),
      probe10(3 downto 0) => ClearBlock_0_DBG_ClearBlock_State(3 downto 0),
      probe11(0) => xlconstant_5_dout(0),
      probe12(15 downto 0) => ROP_0_STAT_CurrentDrawEventID(15 downto 0),
      probe13(3 downto 0) => MemorySystem_DBG_ReadControlState(3 downto 0),
      probe14(3 downto 0) => MemorySystem_DBG_WriteControlState(3 downto 0),
      probe15(15 downto 0) => CommandProcessor_0_DBG_CurrentDrawGeneration(15 downto 0),
      probe16(2 downto 0) => StateBlock_0_CMD_NumFreeSlots(2 downto 0),
      probe17(0) => CommandProcessor_0_TEXSAMP_SetNewState,
      probe18(0) => MemorySystem_DBG_ScanoutReadRequests_Empty,
      probe19(0) => MemorySystem_DBG_ScanoutReadResponses_Full,
      probe2(87 downto 0) => CommandProcessor_0_DBG_LAST_OUT_PACKET(87 downto 0),
      probe20(0) => MemorySystem_DBG_ScanoutReadRequests_rd_en,
      probe21(293 downto 0) => ClearBlock_0_DBG_LastWrittenClearData(293 downto 0),
      probe22(29 downto 0) => MemorySystem_DBG_LastWriteAddress(29 downto 0),
      probe23(255 downto 0) => MemorySystem_DBG_LastWriteData(255 downto 0),
      probe24(7 downto 0) => MemorySystem_DBG_LastWriteDataDWORDEnables(7 downto 0),
      probe25(3 downto 0) => MemorySystem_DBG_LastWriteMemoryClientIndex(3 downto 0),
      probe26(29 downto 0) => MemorySystem_DBG_LastReadAddress(29 downto 0),
      probe27(3 downto 0) => MemorySystem_DBG_LastReadMemoryClientIndex(3 downto 0),
      probe28(12 downto 0) => CommandProcessor_0_DBG_IdleSignalsVector(12 downto 0),
      probe29(15 downto 0) => Rasterizer_0_DBG_PixelXPos(15 downto 0),
      probe3(31 downto 0) => CommandProcessor_0_DBG_LAST_READ_DATA(31 downto 0),
      probe30(15 downto 0) => Rasterizer_0_DBG_PixelYPos(15 downto 0),
      probe31(15 downto 0) => Rasterizer_0_DBG_MinX(15 downto 0),
      probe32(15 downto 0) => Rasterizer_0_DBG_MaxX(15 downto 0),
      probe33(15 downto 0) => Rasterizer_0_DBG_MinY(15 downto 0),
      probe34(15 downto 0) => Rasterizer_0_DBG_MaxY(15 downto 0),
      probe35(29 downto 0) => ROP_0_DBG_CurrentPixelAddr(29 downto 0),
      probe36(0) => ROP_0_DBG_ReadRequestFIFOFull,
      probe37(0) => xlconstant_5_dout(0),
      probe38(4 downto 0) => StatsCollector_0_DBG_CurrentState(4 downto 0),
      probe39(7 downto 0) => MemorySystem_DBG_ReadRequestsEmptyBitmask(7 downto 0),
      probe4(5 downto 0) => xlconstant_0_dout1(5 downto 0),
      probe40(5 downto 0) => MemorySystem_DBG_WriteRequestsEmptyBitmask(5 downto 0),
      probe41(7 downto 0) => MemorySystem_DBG_ReadResponsesFullBitmask(7 downto 0),
      probe42(2 downto 0) => xlconstant_1_dout(2 downto 0),
      probe43(23 downto 0) => CommandProcessor_0_VBB_CommandArg0(23 downto 0),
      probe44(19 downto 0) => CommandProcessor_0_VBB_CommandArg1(19 downto 0),
      probe45(15 downto 0) => CommandProcessor_0_VBB_CommandArg2(15 downto 0),
      probe46(9 downto 0) => StatsCollector_0_DBG_EventsWriteIsReady(9 downto 0),
      probe47(9 downto 0) => StatsCollector_0_DBG_EventsWriteIsReadyAck(9 downto 0),
      probe48(0) => StatsWriteOrderNibblesFIFO_empty,
      probe49(0) => StatsWriteOrderNibblesFIFO_full,
      probe5(7 downto 0) => TriSetup_0_DBG_TriSetup_State(7 downto 0),
      probe50(15 downto 0) => StatsWriteOrderNibblesFIFO_dout(15 downto 0),
      probe51(15 downto 0) => StatsCollector_0_STAT_WriteOrderNibblesFIFO_wr_data(15 downto 0),
      probe52(15 downto 0) => StatsCollector_0_DBG_CurrentWriteOrderNibbles(15 downto 0),
      probe53(15 downto 0) => StatsCollector_0_CMD_CountTimestampsMemoryWrites(15 downto 0),
      probe54(15 downto 0) => StatsCollector_0_CMD_CountTimestampsOrdersMemoryWrites(15 downto 0),
      probe55(0) => CommandProcessor_0_STAT_EnableEventTimestamps,
      probe56(0) => StatsCollector_0_DBG_CurrentWriteEn,
      probe57(293 downto 0) => StatsCollector_0_DBG_CurrentWriteData(293 downto 0),
      probe6(3 downto 0) => Rasterizer_0_DBG_Rasterizer_State(3 downto 0),
      probe7(2 downto 0) => AttrInterpolator_0_DBG_AttrInterpolator_State(2 downto 0),
      probe8(5 downto 0) => TexSample_0_DBG_TexSample_State(5 downto 0),
      probe9(4 downto 0) => ROP_0_DBG_ROP_State(4 downto 0)
    );
placeholder_texcfg: component design_1_xlconstant_0_4
     port map (
      dout(0) => placeholder_texcfg_dout(0)
    );
proc_sys_reset_0: component design_1_proc_sys_reset_0_1
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => reset_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => NLW_proc_sys_reset_0_peripheral_aresetn_UNCONNECTED(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => ddr4_0_addn_ui_clkout1
    );
rast_out_fifo: component design_1_fifo_generator_0_12
     port map (
      almost_full => Rasterizer_0_RASTOUT_FIFO_ALMOST_FULL,
      clk => ddr4_0_c0_ddr4_ui_clk,
      din(95 downto 0) => Rasterizer_0_RASTOUT_FIFO_WR_DATA(95 downto 0),
      dout(95 downto 0) => rast_out_fifo_dout(95 downto 0),
      empty => rast_out_fifo_empty,
      full => Rasterizer_0_RASTOUT_FIFO_FULL,
      rd_en => DepthInterpolator_0_RASTOUT_FIFO_rd_en,
      wr_en => Rasterizer_0_RASTOUT_FIFO_WR_EN
    );
xlconstant_0: component design_1_xlconstant_0_1
     port map (
      dout(5 downto 0) => xlconstant_0_dout1(5 downto 0)
    );
xlconstant_1: component design_1_xlconstant_1_1
     port map (
      dout(2 downto 0) => xlconstant_1_dout(2 downto 0)
    );
xlconstant_2: component design_1_xlconstant_2_0
     port map (
      dout(15 downto 0) => xlconstant_2_dout(15 downto 0)
    );
xlconstant_5: component design_1_xlconstant_5_0
     port map (
      dout(0) => xlconstant_5_dout(0)
    );
xlconstant_6: component design_1_xlconstant_6_0
     port map (
      dout(0) => xlconstant_6_dout(0)
    );
xlconstant_7: component design_1_xlconstant_7_0
     port map (
      dout(0) => xlconstant_7_dout(0)
    );
end STRUCTURE;
