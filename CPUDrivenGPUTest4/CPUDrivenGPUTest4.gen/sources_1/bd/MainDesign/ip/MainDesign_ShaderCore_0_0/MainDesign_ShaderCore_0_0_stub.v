// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:35 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ShaderCore_0_0/MainDesign_ShaderCore_0_0_stub.v
// Design      : MainDesign_ShaderCore_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ShaderCore_0_0,ShaderCore,{}" *) (* core_generation_info = "MainDesign_ShaderCore_0_0,ShaderCore,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ShaderCore,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ShaderCore,Vivado 2025.2" *) 
module MainDesign_ShaderCore_0_0(clk, CMD_IsIdle, CMD_IsReadyForCommand, 
  CMD_InCommand, CMD_LoadProgramAddr, CMD_LoadProgramLen, CMD_SetConstantIndex, 
  CMD_SetConstantData, CMD_SetNumVertexStreams, CMD_SetVertexStreamID, 
  CMD_SetVertexStreamDWORDCount, CMD_SetVertexStreamIsD3DCOLOR, 
  CMD_SetVertexStreamShaderRegIndex, CMD_SetVertexStreamDWORDStride, 
  CMD_SetVertexStreamDWORDOffset, VBB_Done, VERTBATCH_FIFO_empty, 
  VERTBATCH_FIFO_almost_empty, VERTBATCH_FIFO_rd_data, VERTBATCH_FIFO_rd_en, VBO_Pushed, 
  VBO_NumVertices, VBO_NumIndices, VBO_IsIndexedDrawCall, VBO_Ready, VERTOUT_FIFO_full, 
  VERTOUT_FIFO_wr_data, VERTOUT_FIFO_wr_en, INDEXOUT_FIFO_full, INDEXOUT_FIFO_wr_data, 
  INDEXOUT_FIFO_wr_en, VSC_ReadEnable, VSC_ReadStreamIndex, VSC_ReadDWORDAddr, 
  VSC_ReadData, VSC_ReadReady, VSC_SetStreamVBAddress, VSC_StreamIndex, 
  VSC_StreamVBAddress, VSC_InvalidateCache, ICache_Clk, ICache_Enable, ICache_WriteMode, 
  ICache_Address, ICache_WriteData, ICache_ReadData, CB_Enable, CB_WriteMode, CB_RegIndex, 
  CB_RegComponent, CB_ReadOutData, CB_WriteInData, GPR0_ReadQuadIndex, GPR0_WriteQuadIndex, 
  GPR0_PortA_en, GPR0_PortA_regType, GPR0_PortA_regIdx, GPR0_PortA_regChan, 
  GPR0_PortA_readOutData, GPR0_PortB_en, GPR0_PortB_regType, GPR0_PortB_regIdx, 
  GPR0_PortB_regChan, GPR0_PortB_readOutData, GPR0_PortW_en, GPR0_PortW_regType, 
  GPR0_PortW_regIdx, GPR0_PortW_regChan, GPR0_PortW_writeInData, FPUALL_IN_MODE, 
  FPUALL_ISHFT_GO, FPUALL_IMUL_GO, FPUALL_IADD_GO, FPUALL_ICMP_GO, FPUALL_ICNV_GO, 
  FPUALL_ISPEC_GO, FPUALL_IBIT_GO, FPU0_IN_A, FPU0_IN_B, FPU0_OUT_RESULT, FPU1_IN_A, FPU1_IN_B, 
  FPU1_OUT_RESULT, FPU2_IN_A, FPU2_IN_B, FPU2_OUT_RESULT, FPU3_IN_A, FPU3_IN_B, 
  FPU3_OUT_RESULT, UNORM8ToFloat_Enable, UNORM8ToFloat_ColorIn, UNORM8ToFloat_ConvertedX, 
  UNORM8ToFloat_ConvertedY, UNORM8ToFloat_ConvertedZ, UNORM8ToFloat_ConvertedW, 
  STAT_CyclesIdle, STAT_CyclesSpentWorking, STAT_CyclesExecShaderCode, 
  STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, DBG_CurrentState, 
  DBG_CurrentFetchWave, DBG_CurrentDWORD, DBG_CurrentStreamID, DBG_ActiveLanesBitmask, 
  DBG_InstructionPointer, DBG_CurrentlyExecutingInstruction, 
  DBG_CyclesRemainingCurrentInstruction, DBG_ReadRegisterOutRequest, 
  DBG_ReadRegisterOutDataReady, DBG_ReadRegisterOutData, DBG_PortW_MUX, DBG_OStall, 
  DBG_IStall)
/* synthesis syn_black_box black_box_pad_pin="CMD_IsIdle,CMD_IsReadyForCommand,CMD_InCommand[2:0],CMD_LoadProgramAddr[29:0],CMD_LoadProgramLen[15:0],CMD_SetConstantIndex[7:0],CMD_SetConstantData[127:0],CMD_SetNumVertexStreams[2:0],CMD_SetVertexStreamID[2:0],CMD_SetVertexStreamDWORDCount[2:0],CMD_SetVertexStreamIsD3DCOLOR,CMD_SetVertexStreamShaderRegIndex[2:0],CMD_SetVertexStreamDWORDStride[5:0],CMD_SetVertexStreamDWORDOffset[5:0],VBB_Done,VERTBATCH_FIFO_empty,VERTBATCH_FIFO_almost_empty,VERTBATCH_FIFO_rd_data[543:0],VERTBATCH_FIFO_rd_en,VBO_Pushed,VBO_NumVertices[4:0],VBO_NumIndices[6:0],VBO_IsIndexedDrawCall,VBO_Ready,VERTOUT_FIFO_full,VERTOUT_FIFO_wr_data[319:0],VERTOUT_FIFO_wr_en,INDEXOUT_FIFO_full,INDEXOUT_FIFO_wr_data[271:0],INDEXOUT_FIFO_wr_en,VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,ICache_Enable,ICache_WriteMode[0:0],ICache_Address[8:0],ICache_WriteData[63:0],ICache_ReadData[63:0],CB_Enable,CB_WriteMode,CB_RegIndex[7:0],CB_RegComponent[1:0],CB_ReadOutData[31:0],CB_WriteInData[31:0],GPR0_ReadQuadIndex[1:0],GPR0_WriteQuadIndex[1:0],GPR0_PortA_en,GPR0_PortA_regType[1:0],GPR0_PortA_regIdx[2:0],GPR0_PortA_regChan[1:0],GPR0_PortA_readOutData[127:0],GPR0_PortB_en,GPR0_PortB_regType[1:0],GPR0_PortB_regIdx[2:0],GPR0_PortB_regChan[1:0],GPR0_PortB_readOutData[127:0],GPR0_PortW_en,GPR0_PortW_regType[1:0],GPR0_PortW_regIdx[2:0],GPR0_PortW_regChan[1:0],GPR0_PortW_writeInData[127:0],FPUALL_IN_MODE[2:0],FPUALL_ISHFT_GO,FPUALL_IMUL_GO,FPUALL_IADD_GO,FPUALL_ICMP_GO,FPUALL_ICNV_GO,FPUALL_ISPEC_GO,FPUALL_IBIT_GO,FPU0_IN_A[31:0],FPU0_IN_B[31:0],FPU0_OUT_RESULT[31:0],FPU1_IN_A[31:0],FPU1_IN_B[31:0],FPU1_OUT_RESULT[31:0],FPU2_IN_A[31:0],FPU2_IN_B[31:0],FPU2_OUT_RESULT[31:0],FPU3_IN_A[31:0],FPU3_IN_B[31:0],FPU3_OUT_RESULT[31:0],UNORM8ToFloat_Enable,UNORM8ToFloat_ColorIn[31:0],UNORM8ToFloat_ConvertedX[31:0],UNORM8ToFloat_ConvertedY[31:0],UNORM8ToFloat_ConvertedZ[31:0],UNORM8ToFloat_ConvertedW[31:0],STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesExecShaderCode[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_CurrentState[5:0],DBG_CurrentFetchWave[3:0],DBG_CurrentDWORD[2:0],DBG_CurrentStreamID[2:0],DBG_ActiveLanesBitmask[16:0],DBG_InstructionPointer[8:0],DBG_CurrentlyExecutingInstruction[63:0],DBG_CyclesRemainingCurrentInstruction[4:0],DBG_ReadRegisterOutRequest,DBG_ReadRegisterOutDataReady,DBG_ReadRegisterOutData[127:0],DBG_PortW_MUX[1:0],DBG_OStall,DBG_IStall" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="ICache_Clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VERTBATCH_FIFO:VERTOUT_FIFO:INDEXOUT_FIFO:ICache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  output CMD_IsIdle;
  output CMD_IsReadyForCommand;
  input [2:0]CMD_InCommand;
  input [29:0]CMD_LoadProgramAddr;
  input [15:0]CMD_LoadProgramLen;
  input [7:0]CMD_SetConstantIndex;
  input [127:0]CMD_SetConstantData;
  input [2:0]CMD_SetNumVertexStreams;
  input [2:0]CMD_SetVertexStreamID;
  input [2:0]CMD_SetVertexStreamDWORDCount;
  input CMD_SetVertexStreamIsD3DCOLOR;
  input [2:0]CMD_SetVertexStreamShaderRegIndex;
  input [5:0]CMD_SetVertexStreamDWORDStride;
  input [5:0]CMD_SetVertexStreamDWORDOffset;
  input VBB_Done;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO EMPTY" *) (* x_interface_mode = "master VERTBATCH_FIFO" *) input VERTBATCH_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO ALMOST_EMPTY" *) input VERTBATCH_FIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_DATA" *) input [543:0]VERTBATCH_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_EN" *) output VERTBATCH_FIFO_rd_en;
  output VBO_Pushed;
  output [4:0]VBO_NumVertices;
  output [6:0]VBO_NumIndices;
  output VBO_IsIndexedDrawCall;
  input VBO_Ready;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO FULL" *) (* x_interface_mode = "master VERTOUT_FIFO" *) input VERTOUT_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_DATA" *) output [319:0]VERTOUT_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_EN" *) output VERTOUT_FIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO FULL" *) (* x_interface_mode = "master INDEXOUT_FIFO" *) input INDEXOUT_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_DATA" *) output [271:0]INDEXOUT_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_EN" *) output INDEXOUT_FIFO_wr_en;
  output VSC_ReadEnable;
  output [2:0]VSC_ReadStreamIndex;
  output [21:0]VSC_ReadDWORDAddr;
  input [31:0]VSC_ReadData;
  input VSC_ReadReady;
  output VSC_SetStreamVBAddress;
  output [2:0]VSC_StreamIndex;
  output [29:0]VSC_StreamVBAddress;
  output VSC_InvalidateCache;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache CLK" *) (* x_interface_mode = "master ICache" *) (* x_interface_parameter = "XIL_INTERFACENAME ICache, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output ICache_Clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache EN" *) output ICache_Enable;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache WE" *) output [0:0]ICache_WriteMode;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache ADDR" *) output [8:0]ICache_Address;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache DIN" *) output [63:0]ICache_WriteData;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ICache DOUT" *) input [63:0]ICache_ReadData;
  output CB_Enable;
  output CB_WriteMode;
  output [7:0]CB_RegIndex;
  output [1:0]CB_RegComponent;
  input [31:0]CB_ReadOutData;
  output [31:0]CB_WriteInData;
  output [1:0]GPR0_ReadQuadIndex;
  output [1:0]GPR0_WriteQuadIndex;
  output GPR0_PortA_en;
  output [1:0]GPR0_PortA_regType;
  output [2:0]GPR0_PortA_regIdx;
  output [1:0]GPR0_PortA_regChan;
  input [127:0]GPR0_PortA_readOutData;
  output GPR0_PortB_en;
  output [1:0]GPR0_PortB_regType;
  output [2:0]GPR0_PortB_regIdx;
  output [1:0]GPR0_PortB_regChan;
  input [127:0]GPR0_PortB_readOutData;
  output GPR0_PortW_en;
  output [1:0]GPR0_PortW_regType;
  output [2:0]GPR0_PortW_regIdx;
  output [1:0]GPR0_PortW_regChan;
  output [127:0]GPR0_PortW_writeInData;
  output [2:0]FPUALL_IN_MODE;
  output FPUALL_ISHFT_GO;
  output FPUALL_IMUL_GO;
  output FPUALL_IADD_GO;
  output FPUALL_ICMP_GO;
  output FPUALL_ICNV_GO;
  output FPUALL_ISPEC_GO;
  output FPUALL_IBIT_GO;
  output [31:0]FPU0_IN_A;
  output [31:0]FPU0_IN_B;
  input [31:0]FPU0_OUT_RESULT;
  output [31:0]FPU1_IN_A;
  output [31:0]FPU1_IN_B;
  input [31:0]FPU1_OUT_RESULT;
  output [31:0]FPU2_IN_A;
  output [31:0]FPU2_IN_B;
  input [31:0]FPU2_OUT_RESULT;
  output [31:0]FPU3_IN_A;
  output [31:0]FPU3_IN_B;
  input [31:0]FPU3_OUT_RESULT;
  output UNORM8ToFloat_Enable;
  output [31:0]UNORM8ToFloat_ColorIn;
  input [31:0]UNORM8ToFloat_ConvertedX;
  input [31:0]UNORM8ToFloat_ConvertedY;
  input [31:0]UNORM8ToFloat_ConvertedZ;
  input [31:0]UNORM8ToFloat_ConvertedW;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesExecShaderCode;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [5:0]DBG_CurrentState;
  output [3:0]DBG_CurrentFetchWave;
  output [2:0]DBG_CurrentDWORD;
  output [2:0]DBG_CurrentStreamID;
  output [16:0]DBG_ActiveLanesBitmask;
  output [8:0]DBG_InstructionPointer;
  output [63:0]DBG_CurrentlyExecutingInstruction;
  output [4:0]DBG_CyclesRemainingCurrentInstruction;
  input DBG_ReadRegisterOutRequest;
  output DBG_ReadRegisterOutDataReady;
  output [127:0]DBG_ReadRegisterOutData;
  output [1:0]DBG_PortW_MUX;
  output DBG_OStall;
  output DBG_IStall;
endmodule
