-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 16:49:30 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StateBlock_0_7/MainDesign_StateBlock_0_7_stub.vhdl
-- Design      : MainDesign_StateBlock_0_7
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_StateBlock_0_7 is
  Port ( 
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StateBlock_0_7 : entity is "MainDesign_StateBlock_0_7,StateBlock,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_StateBlock_0_7 : entity is "MainDesign_StateBlock_0_7,StateBlock,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StateBlock,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,StateBitsCount=101}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StateBlock_0_7 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StateBlock_0_7 : entity is "module_ref";
end MainDesign_StateBlock_0_7;

architecture stub of MainDesign_StateBlock_0_7 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_SetNewState,CMD_EndFrameReset,CMD_NumFreeSlots[2:0],CMD_NewStateBits[100:0],CMD_NewStateDrawEventID[15:0],STAGE_StateBitsAtDrawID[100:0],STAGE_NextDrawID[15:0],STAGE_StateIsValid,STAGE_ConsumeStateSlot,DBG_SlotsValid[3:0],DBG_CurrentReadSlotIndex[1:0],DBG_CurrentWriteSlotIndex[1:0],DBG_Slot0[15:0],DBG_Slot1[15:0],DBG_Slot2[15:0],DBG_Slot3[15:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "StateBlock,Vivado 2025.2";
begin
end;
