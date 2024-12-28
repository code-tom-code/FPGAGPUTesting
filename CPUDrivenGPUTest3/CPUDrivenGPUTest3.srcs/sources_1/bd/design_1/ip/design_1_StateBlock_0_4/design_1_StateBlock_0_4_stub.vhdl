-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:58:55 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StateBlock_0_4/design_1_StateBlock_0_4_stub.vhdl
-- Design      : design_1_StateBlock_0_4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_StateBlock_0_4 is
  Port ( 
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

end design_1_StateBlock_0_4;

architecture stub of design_1_StateBlock_0_4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,CMD_SetNewState,CMD_EndFrameReset,CMD_NumFreeSlots[2:0],CMD_NewStateBits[191:0],CMD_NewStateDrawEventID[15:0],STAGE_StateBitsAtDrawID[191:0],STAGE_NextDrawID[15:0],STAGE_StateIsValid,STAGE_ConsumeStateSlot,DBG_SlotsValid[3:0],DBG_CurrentReadSlotIndex[1:0],DBG_CurrentWriteSlotIndex[1:0],DBG_Slot0[15:0],DBG_Slot1[15:0],DBG_Slot2[15:0],DBG_Slot3[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "StateBlock,Vivado 2018.1_AR73068";
begin
end;
