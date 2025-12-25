-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:59:13 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ShaderCore_0_0/MainDesign_ShaderCore_0_0_stub.vhdl
-- Design      : MainDesign_ShaderCore_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ShaderCore_0_0 is
  Port ( 
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
    VERTBATCH_FIFO_almost_empty : in STD_LOGIC;
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ShaderCore_0_0 : entity is "MainDesign_ShaderCore_0_0,ShaderCore,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ShaderCore_0_0 : entity is "MainDesign_ShaderCore_0_0,ShaderCore,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ShaderCore,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ShaderCore_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ShaderCore_0_0 : entity is "module_ref";
end MainDesign_ShaderCore_0_0;

architecture stub of MainDesign_ShaderCore_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_IsIdle,CMD_IsReadyForCommand,CMD_InCommand[2:0],CMD_LoadProgramAddr[29:0],CMD_LoadProgramLen[15:0],CMD_SetConstantIndex[7:0],CMD_SetConstantData[127:0],CMD_SetNumVertexStreams[2:0],CMD_SetVertexStreamID[2:0],CMD_SetVertexStreamDWORDCount[2:0],CMD_SetVertexStreamIsD3DCOLOR,CMD_SetVertexStreamShaderRegIndex[2:0],CMD_SetVertexStreamDWORDStride[5:0],CMD_SetVertexStreamDWORDOffset[5:0],VBB_Done,VERTBATCH_FIFO_empty,VERTBATCH_FIFO_almost_empty,VERTBATCH_FIFO_rd_data[543:0],VERTBATCH_FIFO_rd_en,VBO_Pushed,VBO_NumVertices[4:0],VBO_NumIndices[6:0],VBO_IsIndexedDrawCall,VBO_Ready,VERTOUT_FIFO_full,VERTOUT_FIFO_wr_data[319:0],VERTOUT_FIFO_wr_en,INDEXOUT_FIFO_full,INDEXOUT_FIFO_wr_data[271:0],INDEXOUT_FIFO_wr_en,VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,ICache_Clk,ICache_Enable,ICache_WriteMode[0:0],ICache_Address[8:0],ICache_WriteData[63:0],ICache_ReadData[63:0],CB_Enable,CB_WriteMode,CB_RegIndex[7:0],CB_RegComponent[1:0],CB_ReadOutData[31:0],CB_WriteInData[31:0],GPR0_ReadQuadIndex[1:0],GPR0_WriteQuadIndex[1:0],GPR0_PortA_en,GPR0_PortA_regType[1:0],GPR0_PortA_regIdx[2:0],GPR0_PortA_regChan[1:0],GPR0_PortA_readOutData[127:0],GPR0_PortB_en,GPR0_PortB_regType[1:0],GPR0_PortB_regIdx[2:0],GPR0_PortB_regChan[1:0],GPR0_PortB_readOutData[127:0],GPR0_PortW_en,GPR0_PortW_regType[1:0],GPR0_PortW_regIdx[2:0],GPR0_PortW_regChan[1:0],GPR0_PortW_writeInData[127:0],FPUALL_IN_MODE[2:0],FPUALL_ISHFT_GO,FPUALL_IMUL_GO,FPUALL_IADD_GO,FPUALL_ICMP_GO,FPUALL_ICNV_GO,FPUALL_ISPEC_GO,FPUALL_IBIT_GO,FPU0_IN_A[31:0],FPU0_IN_B[31:0],FPU0_OUT_RESULT[31:0],FPU1_IN_A[31:0],FPU1_IN_B[31:0],FPU1_OUT_RESULT[31:0],FPU2_IN_A[31:0],FPU2_IN_B[31:0],FPU2_OUT_RESULT[31:0],FPU3_IN_A[31:0],FPU3_IN_B[31:0],FPU3_OUT_RESULT[31:0],UNORM8ToFloat_Enable,UNORM8ToFloat_ColorIn[31:0],UNORM8ToFloat_ConvertedX[31:0],UNORM8ToFloat_ConvertedY[31:0],UNORM8ToFloat_ConvertedZ[31:0],UNORM8ToFloat_ConvertedW[31:0],STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesExecShaderCode[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_CurrentState[5:0],DBG_CurrentFetchWave[3:0],DBG_CurrentDWORD[2:0],DBG_CurrentStreamID[2:0],DBG_ActiveLanesBitmask[16:0],DBG_InstructionPointer[8:0],DBG_CurrentlyExecutingInstruction[63:0],DBG_CyclesRemainingCurrentInstruction[4:0],DBG_ReadRegisterOutRequest,DBG_ReadRegisterOutDataReady,DBG_ReadRegisterOutData[127:0],DBG_PortW_MUX[1:0],DBG_OStall,DBG_IStall";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VERTBATCH_FIFO:VERTOUT_FIFO:INDEXOUT_FIFO:ICache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of VERTBATCH_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO EMPTY";
  attribute x_interface_mode of VERTBATCH_FIFO_empty : signal is "master VERTBATCH_FIFO";
  attribute x_interface_info of VERTBATCH_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO ALMOST_EMPTY";
  attribute x_interface_info of VERTBATCH_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_DATA";
  attribute x_interface_info of VERTBATCH_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_EN";
  attribute x_interface_info of VERTOUT_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO FULL";
  attribute x_interface_mode of VERTOUT_FIFO_full : signal is "master VERTOUT_FIFO";
  attribute x_interface_info of VERTOUT_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_DATA";
  attribute x_interface_info of VERTOUT_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_EN";
  attribute x_interface_info of INDEXOUT_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO FULL";
  attribute x_interface_mode of INDEXOUT_FIFO_full : signal is "master INDEXOUT_FIFO";
  attribute x_interface_info of INDEXOUT_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_DATA";
  attribute x_interface_info of INDEXOUT_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_EN";
  attribute x_interface_info of ICache_Clk : signal is "xilinx.com:interface:bram:1.0 ICache CLK";
  attribute x_interface_mode of ICache_Clk : signal is "master ICache";
  attribute x_interface_parameter of ICache_Clk : signal is "XIL_INTERFACENAME ICache, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of ICache_Enable : signal is "xilinx.com:interface:bram:1.0 ICache EN";
  attribute x_interface_info of ICache_WriteMode : signal is "xilinx.com:interface:bram:1.0 ICache WE";
  attribute x_interface_info of ICache_Address : signal is "xilinx.com:interface:bram:1.0 ICache ADDR";
  attribute x_interface_info of ICache_WriteData : signal is "xilinx.com:interface:bram:1.0 ICache DIN";
  attribute x_interface_info of ICache_ReadData : signal is "xilinx.com:interface:bram:1.0 ICache DOUT";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ShaderCore,Vivado 2025.2";
begin
end;
