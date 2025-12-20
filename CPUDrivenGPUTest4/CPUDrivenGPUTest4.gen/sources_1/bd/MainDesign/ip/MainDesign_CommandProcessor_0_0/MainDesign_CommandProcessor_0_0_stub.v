// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:37 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CommandProcessor_0_0/MainDesign_CommandProcessor_0_0_stub.v
// Design      : MainDesign_CommandProcessor_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_CommandProcessor_0_0,CommandProcessor,{}" *) (* core_generation_info = "MainDesign_CommandProcessor_0_0,CommandProcessor,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CommandProcessor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,ADDR_WIDTH_BITS=30,DATA_WIDTH_BITS=256}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "CommandProcessor,Vivado 2025.2" *) 
module MainDesign_CommandProcessor_0_0(clk, resetn, validPacketsFIFO_rd_data, 
  validPacketsFIFO_empty, validPacketsFIFO_almost_empty, validPacketsFIFO_rd_en, 
  returnPacketsFIFO_full, returnPacketsFIFO_wr_data, returnPacketsFIFO_wr_en, 
  CommandProcReadRequestsFIFO_wr_data, CommandProcReadRequestsFIFO_full, 
  CommandProcReadRequestsFIFO_wr_en, CommandProcReadResponsesFIFO_rd_data, 
  CommandProcReadResponsesFIFO_empty, CommandProcReadResponsesFIFO_almost_empty, 
  CommandProcReadResponsesFIFO_rd_en, CommandProcWriteRequestsFIFO_wr_data, 
  CommandProcWriteRequestsFIFO_full, CommandProcWriteRequestsFIFO_wr_en, CMD_VS_Idle, 
  CMD_IA_Idle, CMD_Clip_Idle, CMD_TriSetup_Idle, CMD_Rasterizer_Idle, 
  CMD_DepthInterpolator_Idle, CMD_Depth_Idle, CMD_AttrInterpolator_Idle, 
  CMD_TexSampler_Idle, CMD_ROP_Idle, CMD_ClearBlock_Idle, CMD_MemController_Idle, 
  CMD_VSync, CMD_FIFO_EMPTY_VBB, CMD_FIFO_EMPTY_VS, CMD_FIFO_EMPTY_RASTOUT, 
  CMD_FIFO_EMPTY_ATTR, CMD_FIFO_EMPTY_TEXSAMP, CMD_FIFO_EMPTY_ROP, 
  SHADER_IsReadyForCommand, SHADER_InCommand, SHADER_LoadProgramAddr, 
  SHADER_LoadProgramLen, SHADER_SetConstantIndex, SHADER_SetConstantData, 
  SHADER_SetNumVertexStreams, SHADER_SetVertexStreamID, 
  SHADER_SetVertexStreamDWORDCount, SHADER_SetVertexStreamIsD3DCOLOR, 
  SHADER_SetVertexStreamShaderRegIndex, SHADER_SetVertexStreamDWORDStride, 
  SHADER_SetVertexStreamDWORDOffset, SHADER_ReadRegisterOutRequest, 
  SHADER_ReadRegisterOutDataReady, SHADER_ReadRegisterOutData, IA_SetNewState, 
  IA_EndFrameReset, IA_NumFreeSlots, IA_NewStateBits, IA_NewStateDrawEventID, 
  VBB_SendCommand, VBB_CommandArg0, VBB_CommandArg1, VBB_CommandArg2, VBB_NewDrawEventID, 
  VBB_ReadyState, VBB_SetNewState, VBB_EndFrameReset, VBB_NumFreeSlots, VBB_NewStateBits, 
  VBB_NewStateDrawEventID, CLIP_SetNewState, CLIP_EndFrameReset, CLIP_NumFreeSlots, 
  CLIP_NewStateBits, CLIP_NewStateDrawEventID, TRISETUP_SetNewState, 
  TRISETUP_EndFrameReset, TRISETUP_NumFreeSlots, TRISETUP_NewStateBits, 
  TRISETUP_NewStateDrawEventID, DINTERP_STAT_CountDepthOnlyPixelsPassed, 
  DINTERP_SetNewState, DINTERP_EndFrameReset, DINTERP_NumFreeSlots, DINTERP_NewStateBits, 
  DINTERP_NewStateDrawEventID, DEPTH_ClearDepthBuffer, DEPTH_ClearDepthValue, 
  DEPTH_ClearStencilBuffer, DEPTH_ClearStencilValue, INTERP_SetNewState, 
  INTERP_EndFrameReset, INTERP_NumFreeSlots, INTERP_NewStateBits, 
  INTERP_NewStateDrawEventID, TEXSAMP_SetNewState, TEXSAMP_EndFrameReset, 
  TEXSAMP_NumFreeSlots, TEXSAMP_NewStateBits, TEXSAMP_NewStateDrawEventID, 
  ROP_SetClearColor, ROP_ClearSignal, ROP_ClearSignalAck, ROP_FlushCacheSignal, 
  ROP_FlushCacheAck, ROP_STAT_CountPixelsPassed, ROP_STAT_CurrentDrawEventID, 
  ROP_SetNewState, ROP_EndFrameReset, ROP_NumFreeSlots, ROP_NewStateBits, 
  ROP_NewStateDrawEventID, SCANOUT_RenderTargetBaseAddr, SCANOUT_ScanEnable, 
  SCANOUT_InvertOutputColor, SCANOUT_OutputColorChannels, CLEAR_ClearBlockBeginSignal, 
  CLEAR_BaseRenderTargetAddr, CLEAR_ClearColorRGBA, CLEAR_ClearDRAMLineCount, 
  STAT_PresentSignal, STAT_SetNewStatsConfig, STAT_WriteFrameStatsAddress, 
  STAT_EnableEventTimestamps, STAT_WriteEventTimestampsAddress, 
  STAT_WriteEventTimestampOrders, STAT_CountTimestampsMemoryWrites, 
  STAT_CountTimestampsOrdersMemoryWrites, STAT_StatsSaveComplete, STAT_CyclesIdle, 
  STAT_CyclesSpentWorking, STAT_CurrentCommandIndex, DBG_CMDPACKETSTATE, 
  DBG_LAST_IN_PACKET, DBG_LAST_OUT_PACKET, DBG_LAST_READ_DATA, DBG_LAST_WRITE_ADDR, 
  DBG_LAST_WRITE_DATA, DBG_IdleSignalsVector, DBG_CurrentDrawGeneration)
/* synthesis syn_black_box black_box_pad_pin="resetn,validPacketsFIFO_rd_data[87:0],validPacketsFIFO_empty,validPacketsFIFO_almost_empty,validPacketsFIFO_rd_en,returnPacketsFIFO_full,returnPacketsFIFO_wr_data[87:0],returnPacketsFIFO_wr_en,CommandProcReadRequestsFIFO_wr_data[29:0],CommandProcReadRequestsFIFO_full,CommandProcReadRequestsFIFO_wr_en,CommandProcReadResponsesFIFO_rd_data[255:0],CommandProcReadResponsesFIFO_empty,CommandProcReadResponsesFIFO_almost_empty,CommandProcReadResponsesFIFO_rd_en,CommandProcWriteRequestsFIFO_wr_data[293:0],CommandProcWriteRequestsFIFO_full,CommandProcWriteRequestsFIFO_wr_en,CMD_VS_Idle,CMD_IA_Idle,CMD_Clip_Idle,CMD_TriSetup_Idle,CMD_Rasterizer_Idle,CMD_DepthInterpolator_Idle,CMD_Depth_Idle,CMD_AttrInterpolator_Idle,CMD_TexSampler_Idle,CMD_ROP_Idle,CMD_ClearBlock_Idle,CMD_MemController_Idle,CMD_VSync,CMD_FIFO_EMPTY_VBB,CMD_FIFO_EMPTY_VS,CMD_FIFO_EMPTY_RASTOUT,CMD_FIFO_EMPTY_ATTR,CMD_FIFO_EMPTY_TEXSAMP,CMD_FIFO_EMPTY_ROP,SHADER_IsReadyForCommand,SHADER_InCommand[2:0],SHADER_LoadProgramAddr[29:0],SHADER_LoadProgramLen[15:0],SHADER_SetConstantIndex[7:0],SHADER_SetConstantData[127:0],SHADER_SetNumVertexStreams[2:0],SHADER_SetVertexStreamID[2:0],SHADER_SetVertexStreamDWORDCount[2:0],SHADER_SetVertexStreamIsD3DCOLOR,SHADER_SetVertexStreamShaderRegIndex[2:0],SHADER_SetVertexStreamDWORDStride[5:0],SHADER_SetVertexStreamDWORDOffset[5:0],SHADER_ReadRegisterOutRequest,SHADER_ReadRegisterOutDataReady,SHADER_ReadRegisterOutData[127:0],IA_SetNewState,IA_EndFrameReset,IA_NumFreeSlots[2:0],IA_NewStateBits[4:0],IA_NewStateDrawEventID[15:0],VBB_SendCommand[1:0],VBB_CommandArg0[23:0],VBB_CommandArg1[19:0],VBB_CommandArg2[15:0],VBB_NewDrawEventID[15:0],VBB_ReadyState,VBB_SetNewState,VBB_EndFrameReset,VBB_NumFreeSlots[2:0],VBB_NewStateBits[34:0],VBB_NewStateDrawEventID[15:0],CLIP_SetNewState,CLIP_EndFrameReset,CLIP_NumFreeSlots[2:0],CLIP_NewStateBits[10:0],CLIP_NewStateDrawEventID[15:0],TRISETUP_SetNewState,TRISETUP_EndFrameReset,TRISETUP_NumFreeSlots[2:0],TRISETUP_NewStateBits[191:0],TRISETUP_NewStateDrawEventID[15:0],DINTERP_STAT_CountDepthOnlyPixelsPassed[31:0],DINTERP_SetNewState,DINTERP_EndFrameReset,DINTERP_NumFreeSlots[2:0],DINTERP_NewStateBits[76:0],DINTERP_NewStateDrawEventID[15:0],DEPTH_ClearDepthBuffer,DEPTH_ClearDepthValue[23:0],DEPTH_ClearStencilBuffer,DEPTH_ClearStencilValue[7:0],INTERP_SetNewState,INTERP_EndFrameReset,INTERP_NumFreeSlots[2:0],INTERP_NewStateBits[6:0],INTERP_NewStateDrawEventID[15:0],TEXSAMP_SetNewState,TEXSAMP_EndFrameReset,TEXSAMP_NumFreeSlots[2:0],TEXSAMP_NewStateBits[73:0],TEXSAMP_NewStateDrawEventID[15:0],ROP_SetClearColor[31:0],ROP_ClearSignal,ROP_ClearSignalAck,ROP_FlushCacheSignal,ROP_FlushCacheAck,ROP_STAT_CountPixelsPassed[31:0],ROP_STAT_CurrentDrawEventID[15:0],ROP_SetNewState,ROP_EndFrameReset,ROP_NumFreeSlots[2:0],ROP_NewStateBits[100:0],ROP_NewStateDrawEventID[15:0],SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0],CLEAR_ClearBlockBeginSignal,CLEAR_BaseRenderTargetAddr[29:0],CLEAR_ClearColorRGBA[31:0],CLEAR_ClearDRAMLineCount[15:0],STAT_PresentSignal,STAT_SetNewStatsConfig,STAT_WriteFrameStatsAddress[29:0],STAT_EnableEventTimestamps,STAT_WriteEventTimestampsAddress[29:0],STAT_WriteEventTimestampOrders[29:0],STAT_CountTimestampsMemoryWrites[15:0],STAT_CountTimestampsOrdersMemoryWrites[15:0],STAT_StatsSaveComplete,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CurrentCommandIndex[31:0],DBG_CMDPACKETSTATE[7:0],DBG_LAST_IN_PACKET[87:0],DBG_LAST_OUT_PACKET[87:0],DBG_LAST_READ_DATA[31:0],DBG_LAST_WRITE_ADDR[31:0],DBG_LAST_WRITE_DATA[255:0],DBG_IdleSignalsVector[12:0],DBG_CurrentDrawGeneration[15:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET resetn, FREQ_HZ 333250000, ASSOCIATED_BUSIF CommandProcReadRequestsFIFO:CommandProcReadResponses:CommandProcWriteRequests:validPacketsFIFO:returnPacketsFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 resetn RST" *) (* x_interface_mode = "slave resetn" *) (* x_interface_parameter = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_DATA" *) (* x_interface_mode = "master validPacketsFIFO" *) input [87:0]validPacketsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO EMPTY" *) input validPacketsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO ALMOST_EMPTY" *) input validPacketsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 validPacketsFIFO RD_EN" *) output validPacketsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO FULL" *) (* x_interface_mode = "master returnPacketsFIFO" *) input returnPacketsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_DATA" *) output [87:0]returnPacketsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 returnPacketsFIFO WR_EN" *) output returnPacketsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_DATA" *) (* x_interface_mode = "master CommandProcReadRequestsFIFO" *) output [29:0]CommandProcReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO FULL" *) input CommandProcReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcReadRequestsFIFO WR_EN" *) output CommandProcReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_DATA" *) (* x_interface_mode = "master CommandProcReadResponses" *) input [255:0]CommandProcReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses EMPTY" *) input CommandProcReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses ALMOST_EMPTY" *) input CommandProcReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 CommandProcReadResponses RD_EN" *) output CommandProcReadResponsesFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_DATA" *) (* x_interface_mode = "master CommandProcWriteRequests" *) output [293:0]CommandProcWriteRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests FULL" *) input CommandProcWriteRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 CommandProcWriteRequests WR_EN" *) output CommandProcWriteRequestsFIFO_wr_en;
  input CMD_VS_Idle;
  input CMD_IA_Idle;
  input CMD_Clip_Idle;
  input CMD_TriSetup_Idle;
  input CMD_Rasterizer_Idle;
  input CMD_DepthInterpolator_Idle;
  input CMD_Depth_Idle;
  input CMD_AttrInterpolator_Idle;
  input CMD_TexSampler_Idle;
  input CMD_ROP_Idle;
  input CMD_ClearBlock_Idle;
  input CMD_MemController_Idle;
  input CMD_VSync;
  input CMD_FIFO_EMPTY_VBB;
  input CMD_FIFO_EMPTY_VS;
  input CMD_FIFO_EMPTY_RASTOUT;
  input CMD_FIFO_EMPTY_ATTR;
  input CMD_FIFO_EMPTY_TEXSAMP;
  input CMD_FIFO_EMPTY_ROP;
  input SHADER_IsReadyForCommand;
  output [2:0]SHADER_InCommand;
  output [29:0]SHADER_LoadProgramAddr;
  output [15:0]SHADER_LoadProgramLen;
  output [7:0]SHADER_SetConstantIndex;
  output [127:0]SHADER_SetConstantData;
  output [2:0]SHADER_SetNumVertexStreams;
  output [2:0]SHADER_SetVertexStreamID;
  output [2:0]SHADER_SetVertexStreamDWORDCount;
  output SHADER_SetVertexStreamIsD3DCOLOR;
  output [2:0]SHADER_SetVertexStreamShaderRegIndex;
  output [5:0]SHADER_SetVertexStreamDWORDStride;
  output [5:0]SHADER_SetVertexStreamDWORDOffset;
  output SHADER_ReadRegisterOutRequest;
  input SHADER_ReadRegisterOutDataReady;
  input [127:0]SHADER_ReadRegisterOutData;
  output IA_SetNewState;
  output IA_EndFrameReset;
  input [2:0]IA_NumFreeSlots;
  output [4:0]IA_NewStateBits;
  output [15:0]IA_NewStateDrawEventID;
  output [1:0]VBB_SendCommand;
  output [23:0]VBB_CommandArg0;
  output [19:0]VBB_CommandArg1;
  output [15:0]VBB_CommandArg2;
  output [15:0]VBB_NewDrawEventID;
  input VBB_ReadyState;
  output VBB_SetNewState;
  output VBB_EndFrameReset;
  input [2:0]VBB_NumFreeSlots;
  output [34:0]VBB_NewStateBits;
  output [15:0]VBB_NewStateDrawEventID;
  output CLIP_SetNewState;
  output CLIP_EndFrameReset;
  input [2:0]CLIP_NumFreeSlots;
  output [10:0]CLIP_NewStateBits;
  output [15:0]CLIP_NewStateDrawEventID;
  output TRISETUP_SetNewState;
  output TRISETUP_EndFrameReset;
  input [2:0]TRISETUP_NumFreeSlots;
  output [191:0]TRISETUP_NewStateBits;
  output [15:0]TRISETUP_NewStateDrawEventID;
  input [31:0]DINTERP_STAT_CountDepthOnlyPixelsPassed;
  output DINTERP_SetNewState;
  output DINTERP_EndFrameReset;
  input [2:0]DINTERP_NumFreeSlots;
  output [76:0]DINTERP_NewStateBits;
  output [15:0]DINTERP_NewStateDrawEventID;
  output DEPTH_ClearDepthBuffer;
  output [23:0]DEPTH_ClearDepthValue;
  output DEPTH_ClearStencilBuffer;
  output [7:0]DEPTH_ClearStencilValue;
  output INTERP_SetNewState;
  output INTERP_EndFrameReset;
  input [2:0]INTERP_NumFreeSlots;
  output [6:0]INTERP_NewStateBits;
  output [15:0]INTERP_NewStateDrawEventID;
  output TEXSAMP_SetNewState;
  output TEXSAMP_EndFrameReset;
  input [2:0]TEXSAMP_NumFreeSlots;
  output [73:0]TEXSAMP_NewStateBits;
  output [15:0]TEXSAMP_NewStateDrawEventID;
  output [31:0]ROP_SetClearColor;
  output ROP_ClearSignal;
  input ROP_ClearSignalAck;
  output ROP_FlushCacheSignal;
  input ROP_FlushCacheAck;
  input [31:0]ROP_STAT_CountPixelsPassed;
  input [15:0]ROP_STAT_CurrentDrawEventID;
  output ROP_SetNewState;
  output ROP_EndFrameReset;
  input [2:0]ROP_NumFreeSlots;
  output [100:0]ROP_NewStateBits;
  output [15:0]ROP_NewStateDrawEventID;
  output [29:0]SCANOUT_RenderTargetBaseAddr;
  output SCANOUT_ScanEnable;
  output SCANOUT_InvertOutputColor;
  output [8:0]SCANOUT_OutputColorChannels;
  output CLEAR_ClearBlockBeginSignal;
  output [29:0]CLEAR_BaseRenderTargetAddr;
  output [31:0]CLEAR_ClearColorRGBA;
  output [15:0]CLEAR_ClearDRAMLineCount;
  output STAT_PresentSignal;
  output STAT_SetNewStatsConfig;
  output [29:0]STAT_WriteFrameStatsAddress;
  output STAT_EnableEventTimestamps;
  output [29:0]STAT_WriteEventTimestampsAddress;
  output [29:0]STAT_WriteEventTimestampOrders;
  input [15:0]STAT_CountTimestampsMemoryWrites;
  input [15:0]STAT_CountTimestampsOrdersMemoryWrites;
  input STAT_StatsSaveComplete;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CurrentCommandIndex;
  output [7:0]DBG_CMDPACKETSTATE;
  output [87:0]DBG_LAST_IN_PACKET;
  output [87:0]DBG_LAST_OUT_PACKET;
  output [31:0]DBG_LAST_READ_DATA;
  output [31:0]DBG_LAST_WRITE_ADDR;
  output [255:0]DBG_LAST_WRITE_DATA;
  output [12:0]DBG_IdleSignalsVector;
  output [15:0]DBG_CurrentDrawGeneration;
endmodule
