-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:03:36 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CommandProcessor_0_0/MainDesign_CommandProcessor_0_0_stub.vhdl
-- Design      : MainDesign_CommandProcessor_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_CommandProcessor_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    validPacketsFIFO_rd_data : in STD_LOGIC_VECTOR ( 87 downto 0 );
    validPacketsFIFO_empty : in STD_LOGIC;
    validPacketsFIFO_almost_empty : in STD_LOGIC;
    validPacketsFIFO_rd_en : out STD_LOGIC;
    returnPacketsFIFO_full : in STD_LOGIC;
    returnPacketsFIFO_wr_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    returnPacketsFIFO_wr_en : out STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    CommandProcReadRequestsFIFO_full : in STD_LOGIC;
    CommandProcReadRequestsFIFO_wr_en : out STD_LOGIC;
    CommandProcReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    CommandProcReadResponsesFIFO_empty : in STD_LOGIC;
    CommandProcReadResponsesFIFO_almost_empty : in STD_LOGIC;
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
    DINTERP_NewStateBits : out STD_LOGIC_VECTOR ( 76 downto 0 );
    DINTERP_NewStateDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DEPTH_ClearDepthBuffer : out STD_LOGIC;
    DEPTH_ClearDepthValue : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DEPTH_ClearStencilBuffer : out STD_LOGIC;
    DEPTH_ClearStencilValue : out STD_LOGIC_VECTOR ( 7 downto 0 );
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
    STAT_CurrentCommandIndex : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CMDPACKETSTATE : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_LAST_IN_PACKET : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_LAST_OUT_PACKET : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_LAST_READ_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LAST_WRITE_ADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_LAST_WRITE_DATA : out STD_LOGIC_VECTOR ( 255 downto 0 );
    DBG_IdleSignalsVector : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DBG_CurrentDrawGeneration : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_CommandProcessor_0_0 : entity is "MainDesign_CommandProcessor_0_0,CommandProcessor,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_CommandProcessor_0_0 : entity is "MainDesign_CommandProcessor_0_0,CommandProcessor,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CommandProcessor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,ADDR_WIDTH_BITS=30,DATA_WIDTH_BITS=256}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_CommandProcessor_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_CommandProcessor_0_0 : entity is "module_ref";
end MainDesign_CommandProcessor_0_0;

architecture stub of MainDesign_CommandProcessor_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,resetn,validPacketsFIFO_rd_data[87:0],validPacketsFIFO_empty,validPacketsFIFO_almost_empty,validPacketsFIFO_rd_en,returnPacketsFIFO_full,returnPacketsFIFO_wr_data[87:0],returnPacketsFIFO_wr_en,CommandProcReadRequestsFIFO_wr_data[29:0],CommandProcReadRequestsFIFO_full,CommandProcReadRequestsFIFO_wr_en,CommandProcReadResponsesFIFO_rd_data[255:0],CommandProcReadResponsesFIFO_empty,CommandProcReadResponsesFIFO_almost_empty,CommandProcReadResponsesFIFO_rd_en,CommandProcWriteRequestsFIFO_wr_data[293:0],CommandProcWriteRequestsFIFO_full,CommandProcWriteRequestsFIFO_wr_en,CMD_VS_Idle,CMD_IA_Idle,CMD_Clip_Idle,CMD_TriSetup_Idle,CMD_Rasterizer_Idle,CMD_DepthInterpolator_Idle,CMD_Depth_Idle,CMD_AttrInterpolator_Idle,CMD_TexSampler_Idle,CMD_ROP_Idle,CMD_ClearBlock_Idle,CMD_MemController_Idle,CMD_VSync,CMD_FIFO_EMPTY_VBB,CMD_FIFO_EMPTY_VS,CMD_FIFO_EMPTY_RASTOUT,CMD_FIFO_EMPTY_ATTR,CMD_FIFO_EMPTY_TEXSAMP,CMD_FIFO_EMPTY_ROP,SHADER_IsReadyForCommand,SHADER_InCommand[2:0],SHADER_LoadProgramAddr[29:0],SHADER_LoadProgramLen[15:0],SHADER_SetConstantIndex[7:0],SHADER_SetConstantData[127:0],SHADER_SetNumVertexStreams[2:0],SHADER_SetVertexStreamID[2:0],SHADER_SetVertexStreamDWORDCount[2:0],SHADER_SetVertexStreamIsD3DCOLOR,SHADER_SetVertexStreamShaderRegIndex[2:0],SHADER_SetVertexStreamDWORDStride[5:0],SHADER_SetVertexStreamDWORDOffset[5:0],SHADER_ReadRegisterOutRequest,SHADER_ReadRegisterOutDataReady,SHADER_ReadRegisterOutData[127:0],IA_SetNewState,IA_EndFrameReset,IA_NumFreeSlots[2:0],IA_NewStateBits[4:0],IA_NewStateDrawEventID[15:0],VBB_SendCommand[1:0],VBB_CommandArg0[23:0],VBB_CommandArg1[19:0],VBB_CommandArg2[15:0],VBB_NewDrawEventID[15:0],VBB_ReadyState,VBB_SetNewState,VBB_EndFrameReset,VBB_NumFreeSlots[2:0],VBB_NewStateBits[34:0],VBB_NewStateDrawEventID[15:0],CLIP_SetNewState,CLIP_EndFrameReset,CLIP_NumFreeSlots[2:0],CLIP_NewStateBits[10:0],CLIP_NewStateDrawEventID[15:0],TRISETUP_SetNewState,TRISETUP_EndFrameReset,TRISETUP_NumFreeSlots[2:0],TRISETUP_NewStateBits[191:0],TRISETUP_NewStateDrawEventID[15:0],DINTERP_STAT_CountDepthOnlyPixelsPassed[31:0],DINTERP_SetNewState,DINTERP_EndFrameReset,DINTERP_NumFreeSlots[2:0],DINTERP_NewStateBits[76:0],DINTERP_NewStateDrawEventID[15:0],DEPTH_ClearDepthBuffer,DEPTH_ClearDepthValue[23:0],DEPTH_ClearStencilBuffer,DEPTH_ClearStencilValue[7:0],INTERP_SetNewState,INTERP_EndFrameReset,INTERP_NumFreeSlots[2:0],INTERP_NewStateBits[6:0],INTERP_NewStateDrawEventID[15:0],TEXSAMP_SetNewState,TEXSAMP_EndFrameReset,TEXSAMP_NumFreeSlots[2:0],TEXSAMP_NewStateBits[73:0],TEXSAMP_NewStateDrawEventID[15:0],ROP_SetClearColor[31:0],ROP_ClearSignal,ROP_ClearSignalAck,ROP_FlushCacheSignal,ROP_FlushCacheAck,ROP_STAT_CountPixelsPassed[31:0],ROP_STAT_CurrentDrawEventID[15:0],ROP_SetNewState,ROP_EndFrameReset,ROP_NumFreeSlots[2:0],ROP_NewStateBits[100:0],ROP_NewStateDrawEventID[15:0],SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0],CLEAR_ClearBlockBeginSignal,CLEAR_BaseRenderTargetAddr[29:0],CLEAR_ClearColorRGBA[31:0],CLEAR_ClearDRAMLineCount[15:0],STAT_PresentSignal,STAT_SetNewStatsConfig,STAT_WriteFrameStatsAddress[29:0],STAT_EnableEventTimestamps,STAT_WriteEventTimestampsAddress[29:0],STAT_WriteEventTimestampOrders[29:0],STAT_CountTimestampsMemoryWrites[15:0],STAT_CountTimestampsOrdersMemoryWrites[15:0],STAT_StatsSaveComplete,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CurrentCommandIndex[31:0],DBG_CMDPACKETSTATE[7:0],DBG_LAST_IN_PACKET[87:0],DBG_LAST_OUT_PACKET[87:0],DBG_LAST_READ_DATA[31:0],DBG_LAST_WRITE_ADDR[31:0],DBG_LAST_WRITE_DATA[255:0],DBG_IdleSignalsVector[12:0],DBG_CurrentDrawGeneration[15:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 333250000, ASSOCIATED_BUSIF CommandProcReadRequestsFIFO:CommandProcReadResponses:CommandProcWriteRequests:validPacketsFIFO:returnPacketsFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute x_interface_mode of resetn : signal is "slave resetn";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of validPacketsFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_DATA";
  attribute x_interface_mode of validPacketsFIFO_rd_data : signal is "master validPacketsFIFO";
  attribute x_interface_info of validPacketsFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO EMPTY";
  attribute x_interface_info of validPacketsFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO ALMOST_EMPTY";
  attribute x_interface_info of validPacketsFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_EN";
  attribute x_interface_info of returnPacketsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO FULL";
  attribute x_interface_mode of returnPacketsFIFO_full : signal is "master returnPacketsFIFO";
  attribute x_interface_info of returnPacketsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_DATA";
  attribute x_interface_info of returnPacketsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_EN";
  attribute x_interface_info of CommandProcReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_DATA";
  attribute x_interface_mode of CommandProcReadRequestsFIFO_wr_data : signal is "master CommandProcReadRequestsFIFO";
  attribute x_interface_info of CommandProcReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO FULL";
  attribute x_interface_info of CommandProcReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_EN";
  attribute x_interface_info of CommandProcReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_DATA";
  attribute x_interface_mode of CommandProcReadResponsesFIFO_rd_data : signal is "master CommandProcReadResponses";
  attribute x_interface_info of CommandProcReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses EMPTY";
  attribute x_interface_info of CommandProcReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses ALMOST_EMPTY";
  attribute x_interface_info of CommandProcReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_EN";
  attribute x_interface_info of CommandProcWriteRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_DATA";
  attribute x_interface_mode of CommandProcWriteRequestsFIFO_wr_data : signal is "master CommandProcWriteRequests";
  attribute x_interface_info of CommandProcWriteRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests FULL";
  attribute x_interface_info of CommandProcWriteRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "CommandProcessor,Vivado 2025.2";
begin
end;
