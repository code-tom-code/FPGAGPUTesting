-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:23:03 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClearBlock_0_0/design_1_ClearBlock_0_0_sim_netlist.vhdl
-- Design      : design_1_ClearBlock_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ClearBlock_0_0_ClearBlock is
  port (
    DBG_LastWrittenClearData : out STD_LOGIC_VECTOR ( 61 downto 0 );
    \DBG_ClearBlock_State[0]\ : out STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_wr_en : out STD_LOGIC;
    CMD_ClearBlockIsIdle : out STD_LOGIC;
    CMD_ClearColorRGBA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    CMD_ClearDRAMLineCount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_full : in STD_LOGIC;
    CMD_ClearBlockBeginSignal : in STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ClearBlock_0_0_ClearBlock : entity is "ClearBlock";
end design_1_ClearBlock_0_0_ClearBlock;

architecture STRUCTURE of design_1_ClearBlock_0_0_ClearBlock is
  signal \^cmd_clearblockisidle\ : STD_LOGIC;
  signal CMD_ClearBlockIsIdle_i_1_n_0 : STD_LOGIC;
  signal \^dbg_clearblock_state[0]\ : STD_LOGIC;
  signal \^dbg_lastwrittencleardata\ : STD_LOGIC_VECTOR ( 61 downto 0 );
  signal \^mem_clearblockwriterequestsfifo_wr_en\ : STD_LOGIC;
  signal \clearColorRGBA[31]_i_1_n_0\ : STD_LOGIC;
  signal clearState_i_1_n_0 : STD_LOGIC;
  signal memWriteEnable_i_1_n_0 : STD_LOGIC;
  signal \nextWriteAddr[0]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_2_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_3_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_4_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_5_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_6_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_7_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_8_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[11]_i_9_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_2_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_3_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_4_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_5_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_6_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_7_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_8_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[19]_i_9_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[1]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_2_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_3_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_4_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_5_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_6_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_7_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_8_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[27]_i_9_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[29]_i_3_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[29]_i_4_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[29]_i_5_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[29]_i_6_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[29]_i_7_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_10\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_11\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_12\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_13\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_14\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_15\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_8\ : STD_LOGIC;
  signal \nextWriteAddr_reg[11]_i_1_n_9\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_10\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_11\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_12\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_13\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_14\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_15\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_8\ : STD_LOGIC;
  signal \nextWriteAddr_reg[19]_i_1_n_9\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_10\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_11\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_12\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_13\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_14\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_15\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_5\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_6\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_7\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_8\ : STD_LOGIC;
  signal \nextWriteAddr_reg[27]_i_1_n_9\ : STD_LOGIC;
  signal \nextWriteAddr_reg[29]_i_2_n_14\ : STD_LOGIC;
  signal \nextWriteAddr_reg[29]_i_2_n_15\ : STD_LOGIC;
  signal \nextWriteAddr_reg[29]_i_2_n_7\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal remainingDRAMLines : STD_LOGIC;
  signal \remainingDRAMLines[10]_i_2_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines[13]_i_2_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines[15]_i_2_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines[15]_i_3_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines[6]_i_2_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines[7]_i_2_n_0\ : STD_LOGIC;
  signal \remainingDRAMLines_reg__0\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_nextWriteAddr_reg[11]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_nextWriteAddr_reg[19]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_nextWriteAddr_reg[27]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_nextWriteAddr_reg[29]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_nextWriteAddr_reg[29]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CMD_ClearBlockIsIdle_i_1 : label is "soft_lutpair5";
  attribute x_interface_info : string;
  attribute x_interface_info of \clearColorRGBA_reg[0]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[10]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[11]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[12]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[13]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[14]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[15]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[16]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[17]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[18]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[19]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[1]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[20]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[21]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[22]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[23]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[24]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[25]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[26]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[27]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[28]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[29]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[2]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[30]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[31]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[3]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[4]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[5]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[6]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[7]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[8]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \clearColorRGBA_reg[9]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute SOFT_HLUTNM of clearState_i_1 : label is "soft_lutpair5";
  attribute x_interface_info of memWriteEnable_reg : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN";
  attribute SOFT_HLUTNM of \nextWriteAddr[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \nextWriteAddr[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \nextWriteAddr[29]_i_6\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \nextWriteAddr[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \nextWriteAddr[3]_i_1\ : label is "soft_lutpair4";
  attribute x_interface_info of \nextWriteAddr_reg[0]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[10]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[11]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[12]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[13]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[14]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[15]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[16]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[17]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[18]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[19]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[1]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[20]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[21]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[22]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[23]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[24]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[25]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[26]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[27]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[28]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[29]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[2]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[3]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[4]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[5]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[6]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[7]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[8]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_info of \nextWriteAddr_reg[9]\ : label is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute SOFT_HLUTNM of \remainingDRAMLines[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \remainingDRAMLines[10]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \remainingDRAMLines[12]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \remainingDRAMLines[15]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \remainingDRAMLines[1]_i_1\ : label is "soft_lutpair2";
begin
  CMD_ClearBlockIsIdle <= \^cmd_clearblockisidle\;
  \DBG_ClearBlock_State[0]\ <= \^dbg_clearblock_state[0]\;
  DBG_LastWrittenClearData(61 downto 0) <= \^dbg_lastwrittencleardata\(61 downto 0);
  MEM_ClearBlockWriteRequestsFIFO_wr_en <= \^mem_clearblockwriterequestsfifo_wr_en\;
CMD_ClearBlockIsIdle_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \^cmd_clearblockisidle\,
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_ClearBlockBeginSignal,
      O => CMD_ClearBlockIsIdle_i_1_n_0
    );
CMD_ClearBlockIsIdle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => CMD_ClearBlockIsIdle_i_1_n_0,
      Q => \^cmd_clearblockisidle\,
      R => '0'
    );
\clearColorRGBA[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => CMD_ClearBlockBeginSignal,
      I1 => \^dbg_clearblock_state[0]\,
      O => \clearColorRGBA[31]_i_1_n_0\
    );
\clearColorRGBA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(0),
      Q => \^dbg_lastwrittencleardata\(0),
      R => '0'
    );
\clearColorRGBA_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(10),
      Q => \^dbg_lastwrittencleardata\(10),
      R => '0'
    );
\clearColorRGBA_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(11),
      Q => \^dbg_lastwrittencleardata\(11),
      R => '0'
    );
\clearColorRGBA_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(12),
      Q => \^dbg_lastwrittencleardata\(12),
      R => '0'
    );
\clearColorRGBA_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(13),
      Q => \^dbg_lastwrittencleardata\(13),
      R => '0'
    );
\clearColorRGBA_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(14),
      Q => \^dbg_lastwrittencleardata\(14),
      R => '0'
    );
\clearColorRGBA_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(15),
      Q => \^dbg_lastwrittencleardata\(15),
      R => '0'
    );
\clearColorRGBA_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(16),
      Q => \^dbg_lastwrittencleardata\(16),
      R => '0'
    );
\clearColorRGBA_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(17),
      Q => \^dbg_lastwrittencleardata\(17),
      R => '0'
    );
\clearColorRGBA_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(18),
      Q => \^dbg_lastwrittencleardata\(18),
      R => '0'
    );
\clearColorRGBA_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(19),
      Q => \^dbg_lastwrittencleardata\(19),
      R => '0'
    );
\clearColorRGBA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(1),
      Q => \^dbg_lastwrittencleardata\(1),
      R => '0'
    );
\clearColorRGBA_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(20),
      Q => \^dbg_lastwrittencleardata\(20),
      R => '0'
    );
\clearColorRGBA_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(21),
      Q => \^dbg_lastwrittencleardata\(21),
      R => '0'
    );
\clearColorRGBA_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(22),
      Q => \^dbg_lastwrittencleardata\(22),
      R => '0'
    );
\clearColorRGBA_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(23),
      Q => \^dbg_lastwrittencleardata\(23),
      R => '0'
    );
\clearColorRGBA_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(24),
      Q => \^dbg_lastwrittencleardata\(24),
      R => '0'
    );
\clearColorRGBA_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(25),
      Q => \^dbg_lastwrittencleardata\(25),
      R => '0'
    );
\clearColorRGBA_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(26),
      Q => \^dbg_lastwrittencleardata\(26),
      R => '0'
    );
\clearColorRGBA_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(27),
      Q => \^dbg_lastwrittencleardata\(27),
      R => '0'
    );
\clearColorRGBA_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(28),
      Q => \^dbg_lastwrittencleardata\(28),
      R => '0'
    );
\clearColorRGBA_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(29),
      Q => \^dbg_lastwrittencleardata\(29),
      R => '0'
    );
\clearColorRGBA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(2),
      Q => \^dbg_lastwrittencleardata\(2),
      R => '0'
    );
\clearColorRGBA_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(30),
      Q => \^dbg_lastwrittencleardata\(30),
      R => '0'
    );
\clearColorRGBA_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(31),
      Q => \^dbg_lastwrittencleardata\(31),
      R => '0'
    );
\clearColorRGBA_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(3),
      Q => \^dbg_lastwrittencleardata\(3),
      R => '0'
    );
\clearColorRGBA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(4),
      Q => \^dbg_lastwrittencleardata\(4),
      R => '0'
    );
\clearColorRGBA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(5),
      Q => \^dbg_lastwrittencleardata\(5),
      R => '0'
    );
\clearColorRGBA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(6),
      Q => \^dbg_lastwrittencleardata\(6),
      R => '0'
    );
\clearColorRGBA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(7),
      Q => \^dbg_lastwrittencleardata\(7),
      R => '0'
    );
\clearColorRGBA_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(8),
      Q => \^dbg_lastwrittencleardata\(8),
      R => '0'
    );
\clearColorRGBA_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \clearColorRGBA[31]_i_1_n_0\,
      D => CMD_ClearColorRGBA(9),
      Q => \^dbg_lastwrittencleardata\(9),
      R => '0'
    );
clearState_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \nextWriteAddr[29]_i_3_n_0\,
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_ClearBlockBeginSignal,
      O => clearState_i_1_n_0
    );
clearState_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => clearState_i_1_n_0,
      Q => \^dbg_clearblock_state[0]\,
      R => '0'
    );
memWriteEnable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \nextWriteAddr[29]_i_3_n_0\,
      I1 => MEM_ClearBlockWriteRequestsFIFO_full,
      I2 => \^dbg_clearblock_state[0]\,
      O => memWriteEnable_i_1_n_0
    );
memWriteEnable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => memWriteEnable_i_1_n_0,
      Q => \^mem_clearblockwriterequestsfifo_wr_en\,
      R => '0'
    );
\nextWriteAddr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(32),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(0),
      O => \nextWriteAddr[0]_i_1_n_0\
    );
\nextWriteAddr[11]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(43),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(11),
      O => \nextWriteAddr[11]_i_2_n_0\
    );
\nextWriteAddr[11]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(42),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(10),
      O => \nextWriteAddr[11]_i_3_n_0\
    );
\nextWriteAddr[11]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(41),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(9),
      O => \nextWriteAddr[11]_i_4_n_0\
    );
\nextWriteAddr[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(40),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(8),
      O => \nextWriteAddr[11]_i_5_n_0\
    );
\nextWriteAddr[11]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(39),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(7),
      O => \nextWriteAddr[11]_i_6_n_0\
    );
\nextWriteAddr[11]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(38),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(6),
      O => \nextWriteAddr[11]_i_7_n_0\
    );
\nextWriteAddr[11]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => CMD_BaseRenderTargetAddr(5),
      I1 => \^dbg_lastwrittencleardata\(37),
      I2 => \^dbg_clearblock_state[0]\,
      O => \nextWriteAddr[11]_i_8_n_0\
    );
\nextWriteAddr[11]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(36),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(4),
      O => \nextWriteAddr[11]_i_9_n_0\
    );
\nextWriteAddr[19]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(51),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(19),
      O => \nextWriteAddr[19]_i_2_n_0\
    );
\nextWriteAddr[19]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(50),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(18),
      O => \nextWriteAddr[19]_i_3_n_0\
    );
\nextWriteAddr[19]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(49),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(17),
      O => \nextWriteAddr[19]_i_4_n_0\
    );
\nextWriteAddr[19]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(48),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(16),
      O => \nextWriteAddr[19]_i_5_n_0\
    );
\nextWriteAddr[19]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(47),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(15),
      O => \nextWriteAddr[19]_i_6_n_0\
    );
\nextWriteAddr[19]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(46),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(14),
      O => \nextWriteAddr[19]_i_7_n_0\
    );
\nextWriteAddr[19]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(45),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(13),
      O => \nextWriteAddr[19]_i_8_n_0\
    );
\nextWriteAddr[19]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(44),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(12),
      O => \nextWriteAddr[19]_i_9_n_0\
    );
\nextWriteAddr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(33),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(1),
      O => \nextWriteAddr[1]_i_1_n_0\
    );
\nextWriteAddr[27]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(59),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(27),
      O => \nextWriteAddr[27]_i_2_n_0\
    );
\nextWriteAddr[27]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(58),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(26),
      O => \nextWriteAddr[27]_i_3_n_0\
    );
\nextWriteAddr[27]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(57),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(25),
      O => \nextWriteAddr[27]_i_4_n_0\
    );
\nextWriteAddr[27]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(56),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(24),
      O => \nextWriteAddr[27]_i_5_n_0\
    );
\nextWriteAddr[27]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(55),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(23),
      O => \nextWriteAddr[27]_i_6_n_0\
    );
\nextWriteAddr[27]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(54),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(22),
      O => \nextWriteAddr[27]_i_7_n_0\
    );
\nextWriteAddr[27]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(53),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(21),
      O => \nextWriteAddr[27]_i_8_n_0\
    );
\nextWriteAddr[27]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(52),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(20),
      O => \nextWriteAddr[27]_i_9_n_0\
    );
\nextWriteAddr[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04FF0400"
    )
        port map (
      I0 => \nextWriteAddr[29]_i_3_n_0\,
      I1 => \^mem_clearblockwriterequestsfifo_wr_en\,
      I2 => MEM_ClearBlockWriteRequestsFIFO_full,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearBlockBeginSignal,
      O => remainingDRAMLines
    );
\nextWriteAddr[29]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(8),
      I1 => \remainingDRAMLines_reg__0\(9),
      I2 => \remainingDRAMLines[6]_i_2_n_0\,
      I3 => \nextWriteAddr[29]_i_6_n_0\,
      I4 => \nextWriteAddr[29]_i_7_n_0\,
      O => \nextWriteAddr[29]_i_3_n_0\
    );
\nextWriteAddr[29]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(61),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(29),
      O => \nextWriteAddr[29]_i_4_n_0\
    );
\nextWriteAddr[29]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(60),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(28),
      O => \nextWriteAddr[29]_i_5_n_0\
    );
\nextWriteAddr[29]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(5),
      I1 => \remainingDRAMLines_reg__0\(4),
      I2 => \remainingDRAMLines_reg__0\(7),
      I3 => \remainingDRAMLines_reg__0\(6),
      O => \nextWriteAddr[29]_i_6_n_0\
    );
\nextWriteAddr[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(10),
      I1 => \remainingDRAMLines_reg__0\(15),
      I2 => \remainingDRAMLines_reg__0\(13),
      I3 => \remainingDRAMLines_reg__0\(14),
      I4 => \remainingDRAMLines_reg__0\(12),
      I5 => \remainingDRAMLines_reg__0\(11),
      O => \nextWriteAddr[29]_i_7_n_0\
    );
\nextWriteAddr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(34),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(2),
      O => \nextWriteAddr[2]_i_1_n_0\
    );
\nextWriteAddr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^dbg_lastwrittencleardata\(35),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_BaseRenderTargetAddr(3),
      O => \nextWriteAddr[3]_i_1_n_0\
    );
\nextWriteAddr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr[0]_i_1_n_0\,
      Q => \^dbg_lastwrittencleardata\(32),
      R => '0'
    );
\nextWriteAddr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_9\,
      Q => \^dbg_lastwrittencleardata\(42),
      R => '0'
    );
\nextWriteAddr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_8\,
      Q => \^dbg_lastwrittencleardata\(43),
      R => '0'
    );
\nextWriteAddr_reg[11]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \nextWriteAddr_reg[11]_i_1_n_0\,
      CO(6) => \nextWriteAddr_reg[11]_i_1_n_1\,
      CO(5) => \nextWriteAddr_reg[11]_i_1_n_2\,
      CO(4) => \nextWriteAddr_reg[11]_i_1_n_3\,
      CO(3) => \NLW_nextWriteAddr_reg[11]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \nextWriteAddr_reg[11]_i_1_n_5\,
      CO(1) => \nextWriteAddr_reg[11]_i_1_n_6\,
      CO(0) => \nextWriteAddr_reg[11]_i_1_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1) => \^dbg_clearblock_state[0]\,
      DI(0) => '0',
      O(7) => \nextWriteAddr_reg[11]_i_1_n_8\,
      O(6) => \nextWriteAddr_reg[11]_i_1_n_9\,
      O(5) => \nextWriteAddr_reg[11]_i_1_n_10\,
      O(4) => \nextWriteAddr_reg[11]_i_1_n_11\,
      O(3) => \nextWriteAddr_reg[11]_i_1_n_12\,
      O(2) => \nextWriteAddr_reg[11]_i_1_n_13\,
      O(1) => \nextWriteAddr_reg[11]_i_1_n_14\,
      O(0) => \nextWriteAddr_reg[11]_i_1_n_15\,
      S(7) => \nextWriteAddr[11]_i_2_n_0\,
      S(6) => \nextWriteAddr[11]_i_3_n_0\,
      S(5) => \nextWriteAddr[11]_i_4_n_0\,
      S(4) => \nextWriteAddr[11]_i_5_n_0\,
      S(3) => \nextWriteAddr[11]_i_6_n_0\,
      S(2) => \nextWriteAddr[11]_i_7_n_0\,
      S(1) => \nextWriteAddr[11]_i_8_n_0\,
      S(0) => \nextWriteAddr[11]_i_9_n_0\
    );
\nextWriteAddr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_15\,
      Q => \^dbg_lastwrittencleardata\(44),
      R => '0'
    );
\nextWriteAddr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_14\,
      Q => \^dbg_lastwrittencleardata\(45),
      R => '0'
    );
\nextWriteAddr_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_13\,
      Q => \^dbg_lastwrittencleardata\(46),
      R => '0'
    );
\nextWriteAddr_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_12\,
      Q => \^dbg_lastwrittencleardata\(47),
      R => '0'
    );
\nextWriteAddr_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_11\,
      Q => \^dbg_lastwrittencleardata\(48),
      R => '0'
    );
\nextWriteAddr_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_10\,
      Q => \^dbg_lastwrittencleardata\(49),
      R => '0'
    );
\nextWriteAddr_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_9\,
      Q => \^dbg_lastwrittencleardata\(50),
      R => '0'
    );
\nextWriteAddr_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[19]_i_1_n_8\,
      Q => \^dbg_lastwrittencleardata\(51),
      R => '0'
    );
\nextWriteAddr_reg[19]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \nextWriteAddr_reg[11]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \nextWriteAddr_reg[19]_i_1_n_0\,
      CO(6) => \nextWriteAddr_reg[19]_i_1_n_1\,
      CO(5) => \nextWriteAddr_reg[19]_i_1_n_2\,
      CO(4) => \nextWriteAddr_reg[19]_i_1_n_3\,
      CO(3) => \NLW_nextWriteAddr_reg[19]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \nextWriteAddr_reg[19]_i_1_n_5\,
      CO(1) => \nextWriteAddr_reg[19]_i_1_n_6\,
      CO(0) => \nextWriteAddr_reg[19]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \nextWriteAddr_reg[19]_i_1_n_8\,
      O(6) => \nextWriteAddr_reg[19]_i_1_n_9\,
      O(5) => \nextWriteAddr_reg[19]_i_1_n_10\,
      O(4) => \nextWriteAddr_reg[19]_i_1_n_11\,
      O(3) => \nextWriteAddr_reg[19]_i_1_n_12\,
      O(2) => \nextWriteAddr_reg[19]_i_1_n_13\,
      O(1) => \nextWriteAddr_reg[19]_i_1_n_14\,
      O(0) => \nextWriteAddr_reg[19]_i_1_n_15\,
      S(7) => \nextWriteAddr[19]_i_2_n_0\,
      S(6) => \nextWriteAddr[19]_i_3_n_0\,
      S(5) => \nextWriteAddr[19]_i_4_n_0\,
      S(4) => \nextWriteAddr[19]_i_5_n_0\,
      S(3) => \nextWriteAddr[19]_i_6_n_0\,
      S(2) => \nextWriteAddr[19]_i_7_n_0\,
      S(1) => \nextWriteAddr[19]_i_8_n_0\,
      S(0) => \nextWriteAddr[19]_i_9_n_0\
    );
\nextWriteAddr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr[1]_i_1_n_0\,
      Q => \^dbg_lastwrittencleardata\(33),
      R => '0'
    );
\nextWriteAddr_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_15\,
      Q => \^dbg_lastwrittencleardata\(52),
      R => '0'
    );
\nextWriteAddr_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_14\,
      Q => \^dbg_lastwrittencleardata\(53),
      R => '0'
    );
\nextWriteAddr_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_13\,
      Q => \^dbg_lastwrittencleardata\(54),
      R => '0'
    );
\nextWriteAddr_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_12\,
      Q => \^dbg_lastwrittencleardata\(55),
      R => '0'
    );
\nextWriteAddr_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_11\,
      Q => \^dbg_lastwrittencleardata\(56),
      R => '0'
    );
\nextWriteAddr_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_10\,
      Q => \^dbg_lastwrittencleardata\(57),
      R => '0'
    );
\nextWriteAddr_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_9\,
      Q => \^dbg_lastwrittencleardata\(58),
      R => '0'
    );
\nextWriteAddr_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[27]_i_1_n_8\,
      Q => \^dbg_lastwrittencleardata\(59),
      R => '0'
    );
\nextWriteAddr_reg[27]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \nextWriteAddr_reg[19]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \nextWriteAddr_reg[27]_i_1_n_0\,
      CO(6) => \nextWriteAddr_reg[27]_i_1_n_1\,
      CO(5) => \nextWriteAddr_reg[27]_i_1_n_2\,
      CO(4) => \nextWriteAddr_reg[27]_i_1_n_3\,
      CO(3) => \NLW_nextWriteAddr_reg[27]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \nextWriteAddr_reg[27]_i_1_n_5\,
      CO(1) => \nextWriteAddr_reg[27]_i_1_n_6\,
      CO(0) => \nextWriteAddr_reg[27]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \nextWriteAddr_reg[27]_i_1_n_8\,
      O(6) => \nextWriteAddr_reg[27]_i_1_n_9\,
      O(5) => \nextWriteAddr_reg[27]_i_1_n_10\,
      O(4) => \nextWriteAddr_reg[27]_i_1_n_11\,
      O(3) => \nextWriteAddr_reg[27]_i_1_n_12\,
      O(2) => \nextWriteAddr_reg[27]_i_1_n_13\,
      O(1) => \nextWriteAddr_reg[27]_i_1_n_14\,
      O(0) => \nextWriteAddr_reg[27]_i_1_n_15\,
      S(7) => \nextWriteAddr[27]_i_2_n_0\,
      S(6) => \nextWriteAddr[27]_i_3_n_0\,
      S(5) => \nextWriteAddr[27]_i_4_n_0\,
      S(4) => \nextWriteAddr[27]_i_5_n_0\,
      S(3) => \nextWriteAddr[27]_i_6_n_0\,
      S(2) => \nextWriteAddr[27]_i_7_n_0\,
      S(1) => \nextWriteAddr[27]_i_8_n_0\,
      S(0) => \nextWriteAddr[27]_i_9_n_0\
    );
\nextWriteAddr_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[29]_i_2_n_15\,
      Q => \^dbg_lastwrittencleardata\(60),
      R => '0'
    );
\nextWriteAddr_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[29]_i_2_n_14\,
      Q => \^dbg_lastwrittencleardata\(61),
      R => '0'
    );
\nextWriteAddr_reg[29]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \nextWriteAddr_reg[27]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_nextWriteAddr_reg[29]_i_2_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \nextWriteAddr_reg[29]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_nextWriteAddr_reg[29]_i_2_O_UNCONNECTED\(7 downto 2),
      O(1) => \nextWriteAddr_reg[29]_i_2_n_14\,
      O(0) => \nextWriteAddr_reg[29]_i_2_n_15\,
      S(7 downto 2) => B"000000",
      S(1) => \nextWriteAddr[29]_i_4_n_0\,
      S(0) => \nextWriteAddr[29]_i_5_n_0\
    );
\nextWriteAddr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr[2]_i_1_n_0\,
      Q => \^dbg_lastwrittencleardata\(34),
      R => '0'
    );
\nextWriteAddr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr[3]_i_1_n_0\,
      Q => \^dbg_lastwrittencleardata\(35),
      R => '0'
    );
\nextWriteAddr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_15\,
      Q => \^dbg_lastwrittencleardata\(36),
      R => '0'
    );
\nextWriteAddr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_14\,
      Q => \^dbg_lastwrittencleardata\(37),
      R => '0'
    );
\nextWriteAddr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_13\,
      Q => \^dbg_lastwrittencleardata\(38),
      R => '0'
    );
\nextWriteAddr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_12\,
      Q => \^dbg_lastwrittencleardata\(39),
      R => '0'
    );
\nextWriteAddr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_11\,
      Q => \^dbg_lastwrittencleardata\(40),
      R => '0'
    );
\nextWriteAddr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => \nextWriteAddr_reg[11]_i_1_n_10\,
      Q => \^dbg_lastwrittencleardata\(41),
      R => '0'
    );
\remainingDRAMLines[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(0),
      I1 => \^dbg_clearblock_state[0]\,
      I2 => CMD_ClearDRAMLineCount(0),
      O => p_0_in(0)
    );
\remainingDRAMLines[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAFFFFA9AA0000"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(10),
      I1 => \remainingDRAMLines_reg__0\(8),
      I2 => \remainingDRAMLines_reg__0\(9),
      I3 => \remainingDRAMLines[10]_i_2_n_0\,
      I4 => \^dbg_clearblock_state[0]\,
      I5 => CMD_ClearDRAMLineCount(10),
      O => p_0_in(10)
    );
\remainingDRAMLines[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \remainingDRAMLines[6]_i_2_n_0\,
      I1 => \remainingDRAMLines_reg__0\(6),
      I2 => \remainingDRAMLines_reg__0\(7),
      I3 => \remainingDRAMLines_reg__0\(4),
      I4 => \remainingDRAMLines_reg__0\(5),
      O => \remainingDRAMLines[10]_i_2_n_0\
    );
\remainingDRAMLines[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(11),
      I1 => \remainingDRAMLines[13]_i_2_n_0\,
      I2 => \^dbg_clearblock_state[0]\,
      I3 => CMD_ClearDRAMLineCount(11),
      O => p_0_in(11)
    );
\remainingDRAMLines[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AFF9A00"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(12),
      I1 => \remainingDRAMLines_reg__0\(11),
      I2 => \remainingDRAMLines[13]_i_2_n_0\,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(12),
      O => p_0_in(12)
    );
\remainingDRAMLines[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAFFFFA9AA0000"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(13),
      I1 => \remainingDRAMLines_reg__0\(11),
      I2 => \remainingDRAMLines_reg__0\(12),
      I3 => \remainingDRAMLines[13]_i_2_n_0\,
      I4 => \^dbg_clearblock_state[0]\,
      I5 => CMD_ClearDRAMLineCount(13),
      O => p_0_in(13)
    );
\remainingDRAMLines[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(8),
      I1 => \remainingDRAMLines_reg__0\(9),
      I2 => \remainingDRAMLines[6]_i_2_n_0\,
      I3 => \nextWriteAddr[29]_i_6_n_0\,
      I4 => \remainingDRAMLines_reg__0\(10),
      O => \remainingDRAMLines[13]_i_2_n_0\
    );
\remainingDRAMLines[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AFF9A00"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(14),
      I1 => \remainingDRAMLines_reg__0\(13),
      I2 => \remainingDRAMLines[15]_i_2_n_0\,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(14),
      O => p_0_in(14)
    );
\remainingDRAMLines[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9AAFFFFA9AA0000"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(15),
      I1 => \remainingDRAMLines_reg__0\(13),
      I2 => \remainingDRAMLines_reg__0\(14),
      I3 => \remainingDRAMLines[15]_i_2_n_0\,
      I4 => \^dbg_clearblock_state[0]\,
      I5 => CMD_ClearDRAMLineCount(15),
      O => p_0_in(15)
    );
\remainingDRAMLines[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(10),
      I1 => \nextWriteAddr[29]_i_6_n_0\,
      I2 => \remainingDRAMLines[6]_i_2_n_0\,
      I3 => \remainingDRAMLines_reg__0\(9),
      I4 => \remainingDRAMLines_reg__0\(8),
      I5 => \remainingDRAMLines[15]_i_3_n_0\,
      O => \remainingDRAMLines[15]_i_2_n_0\
    );
\remainingDRAMLines[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(11),
      I1 => \remainingDRAMLines_reg__0\(12),
      O => \remainingDRAMLines[15]_i_3_n_0\
    );
\remainingDRAMLines[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(0),
      I1 => \remainingDRAMLines_reg__0\(1),
      I2 => \^dbg_clearblock_state[0]\,
      I3 => CMD_ClearDRAMLineCount(1),
      O => p_0_in(1)
    );
\remainingDRAMLines[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E1FFE100"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(0),
      I1 => \remainingDRAMLines_reg__0\(1),
      I2 => \remainingDRAMLines_reg__0\(2),
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(2),
      O => p_0_in(2)
    );
\remainingDRAMLines[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE01FFFFFE010000"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(2),
      I1 => \remainingDRAMLines_reg__0\(1),
      I2 => \remainingDRAMLines_reg__0\(0),
      I3 => \remainingDRAMLines_reg__0\(3),
      I4 => \^dbg_clearblock_state[0]\,
      I5 => CMD_ClearDRAMLineCount(3),
      O => p_0_in(3)
    );
\remainingDRAMLines[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(4),
      I1 => \remainingDRAMLines[6]_i_2_n_0\,
      I2 => \^dbg_clearblock_state[0]\,
      I3 => CMD_ClearDRAMLineCount(4),
      O => p_0_in(4)
    );
\remainingDRAMLines[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AFF9A00"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(5),
      I1 => \remainingDRAMLines_reg__0\(4),
      I2 => \remainingDRAMLines[6]_i_2_n_0\,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(5),
      O => p_0_in(5)
    );
\remainingDRAMLines[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA9AFFFFAA9A0000"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(6),
      I1 => \remainingDRAMLines_reg__0\(5),
      I2 => \remainingDRAMLines[6]_i_2_n_0\,
      I3 => \remainingDRAMLines_reg__0\(4),
      I4 => \^dbg_clearblock_state[0]\,
      I5 => CMD_ClearDRAMLineCount(6),
      O => p_0_in(6)
    );
\remainingDRAMLines[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(1),
      I1 => \remainingDRAMLines_reg__0\(0),
      I2 => \remainingDRAMLines_reg__0\(3),
      I3 => \remainingDRAMLines_reg__0\(2),
      O => \remainingDRAMLines[6]_i_2_n_0\
    );
\remainingDRAMLines[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AFF9A00"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(7),
      I1 => \remainingDRAMLines_reg__0\(6),
      I2 => \remainingDRAMLines[7]_i_2_n_0\,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(7),
      O => p_0_in(7)
    );
\remainingDRAMLines[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(4),
      I1 => \remainingDRAMLines_reg__0\(1),
      I2 => \remainingDRAMLines_reg__0\(0),
      I3 => \remainingDRAMLines_reg__0\(3),
      I4 => \remainingDRAMLines_reg__0\(2),
      I5 => \remainingDRAMLines_reg__0\(5),
      O => \remainingDRAMLines[7]_i_2_n_0\
    );
\remainingDRAMLines[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(8),
      I1 => \remainingDRAMLines[10]_i_2_n_0\,
      I2 => \^dbg_clearblock_state[0]\,
      I3 => CMD_ClearDRAMLineCount(8),
      O => p_0_in(8)
    );
\remainingDRAMLines[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AFF9A00"
    )
        port map (
      I0 => \remainingDRAMLines_reg__0\(9),
      I1 => \remainingDRAMLines_reg__0\(8),
      I2 => \remainingDRAMLines[10]_i_2_n_0\,
      I3 => \^dbg_clearblock_state[0]\,
      I4 => CMD_ClearDRAMLineCount(9),
      O => p_0_in(9)
    );
\remainingDRAMLines_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(0),
      Q => \remainingDRAMLines_reg__0\(0),
      R => '0'
    );
\remainingDRAMLines_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(10),
      Q => \remainingDRAMLines_reg__0\(10),
      R => '0'
    );
\remainingDRAMLines_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(11),
      Q => \remainingDRAMLines_reg__0\(11),
      R => '0'
    );
\remainingDRAMLines_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(12),
      Q => \remainingDRAMLines_reg__0\(12),
      R => '0'
    );
\remainingDRAMLines_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(13),
      Q => \remainingDRAMLines_reg__0\(13),
      R => '0'
    );
\remainingDRAMLines_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(14),
      Q => \remainingDRAMLines_reg__0\(14),
      R => '0'
    );
\remainingDRAMLines_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(15),
      Q => \remainingDRAMLines_reg__0\(15),
      R => '0'
    );
\remainingDRAMLines_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(1),
      Q => \remainingDRAMLines_reg__0\(1),
      R => '0'
    );
\remainingDRAMLines_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(2),
      Q => \remainingDRAMLines_reg__0\(2),
      R => '0'
    );
\remainingDRAMLines_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(3),
      Q => \remainingDRAMLines_reg__0\(3),
      R => '0'
    );
\remainingDRAMLines_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(4),
      Q => \remainingDRAMLines_reg__0\(4),
      R => '0'
    );
\remainingDRAMLines_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(5),
      Q => \remainingDRAMLines_reg__0\(5),
      R => '0'
    );
\remainingDRAMLines_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(6),
      Q => \remainingDRAMLines_reg__0\(6),
      R => '0'
    );
\remainingDRAMLines_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(7),
      Q => \remainingDRAMLines_reg__0\(7),
      R => '0'
    );
\remainingDRAMLines_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(8),
      Q => \remainingDRAMLines_reg__0\(8),
      R => '0'
    );
\remainingDRAMLines_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => remainingDRAMLines,
      D => p_0_in(9),
      Q => \remainingDRAMLines_reg__0\(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ClearBlock_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ClearBlock_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ClearBlock_0_0 : entity is "design_1_ClearBlock_0_0,ClearBlock,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_ClearBlock_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_ClearBlock_0_0 : entity is "ClearBlock,Vivado 2018.1_AR73068";
end design_1_ClearBlock_0_0;

architecture STRUCTURE of design_1_ClearBlock_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^dbg_clearblock_state\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^dbg_lastwrittencleardata\ : STD_LOGIC_VECTOR ( 293 downto 8 );
  attribute x_interface_info : string;
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
begin
  DBG_ClearBlock_State(3) <= \<const0>\;
  DBG_ClearBlock_State(2) <= \<const0>\;
  DBG_ClearBlock_State(1) <= \<const0>\;
  DBG_ClearBlock_State(0) <= \^dbg_clearblock_state\(0);
  DBG_LastWrittenClearData(293 downto 264) <= \^dbg_lastwrittencleardata\(293 downto 264);
  DBG_LastWrittenClearData(263 downto 232) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(231 downto 200) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(199 downto 168) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(167 downto 136) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(135 downto 104) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(103 downto 72) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(71 downto 40) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(39 downto 8) <= \^dbg_lastwrittencleardata\(39 downto 8);
  DBG_LastWrittenClearData(7) <= \<const1>\;
  DBG_LastWrittenClearData(6) <= \<const1>\;
  DBG_LastWrittenClearData(5) <= \<const1>\;
  DBG_LastWrittenClearData(4) <= \<const1>\;
  DBG_LastWrittenClearData(3) <= \<const1>\;
  DBG_LastWrittenClearData(2) <= \<const1>\;
  DBG_LastWrittenClearData(1) <= \<const1>\;
  DBG_LastWrittenClearData(0) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(293 downto 264) <= \^dbg_lastwrittencleardata\(293 downto 264);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(263 downto 232) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(231 downto 200) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(199 downto 168) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(167 downto 136) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(135 downto 104) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(103 downto 72) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(71 downto 40) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(39 downto 8) <= \^dbg_lastwrittencleardata\(39 downto 8);
  MEM_ClearBlockWriteRequestsFIFO_wr_data(7) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(6) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(5) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(4) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(3) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(2) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(1) <= \<const1>\;
  MEM_ClearBlockWriteRequestsFIFO_wr_data(0) <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_ClearBlock_0_0_ClearBlock
     port map (
      CMD_BaseRenderTargetAddr(29 downto 0) => CMD_BaseRenderTargetAddr(29 downto 0),
      CMD_ClearBlockBeginSignal => CMD_ClearBlockBeginSignal,
      CMD_ClearBlockIsIdle => CMD_ClearBlockIsIdle,
      CMD_ClearColorRGBA(31 downto 0) => CMD_ClearColorRGBA(31 downto 0),
      CMD_ClearDRAMLineCount(15 downto 0) => CMD_ClearDRAMLineCount(15 downto 0),
      \DBG_ClearBlock_State[0]\ => \^dbg_clearblock_state\(0),
      DBG_LastWrittenClearData(61 downto 32) => \^dbg_lastwrittencleardata\(293 downto 264),
      DBG_LastWrittenClearData(31 downto 0) => \^dbg_lastwrittencleardata\(39 downto 8),
      MEM_ClearBlockWriteRequestsFIFO_full => MEM_ClearBlockWriteRequestsFIFO_full,
      MEM_ClearBlockWriteRequestsFIFO_wr_en => MEM_ClearBlockWriteRequestsFIFO_wr_en,
      clk => clk
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
