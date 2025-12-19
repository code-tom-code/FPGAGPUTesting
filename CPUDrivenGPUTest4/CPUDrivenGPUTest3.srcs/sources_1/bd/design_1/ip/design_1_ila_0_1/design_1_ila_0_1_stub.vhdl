-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:29:36 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ila_0_1/design_1_ila_0_1_stub.vhdl
-- Design      : design_1_ila_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ila_0_1 is
  Port ( 
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

end design_1_ila_0_1;

architecture stub of design_1_ila_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[15:0],probe1[15:0],probe2[31:0],probe3[127:0],probe4[1:0],probe5[31:0],probe6[15:0],probe7[15:0],probe8[15:0],probe9[319:0],probe10[31:0],probe11[5:0],probe12[3:0],probe13[8:0],probe14[543:0],probe15[31:0],probe16[29:0],probe17[31:0],probe18[21:0],probe19[47:0],probe20[29:0],probe21[0:0],probe22[3:0],probe23[31:0],probe24[31:0],probe25[9:0],probe26[31:0],probe27[4:0],probe28[31:0],probe29[271:0],probe30[31:0],probe31[127:0],probe32[6:0],probe33[4:0],probe34[23:0],probe35[2:0],probe36[0:0],probe37[0:0],probe38[0:0],probe39[0:0],probe40[0:0],probe41[0:0],probe42[31:0],probe43[31:0],probe44[31:0],probe45[0:0],probe46[7:0],probe47[1:0],probe48[31:0],probe49[1:0],probe50[1:0],probe51[1:0],probe52[2:0],probe53[1:0],probe54[1:0],probe55[2:0],probe56[1:0],probe57[127:0],probe58[0:0],probe59[31:0],probe60[127:0],probe61[16:0],probe62[3:0],probe63[2:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2018.1_AR73068";
begin
end;
