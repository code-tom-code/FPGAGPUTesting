-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:ShaderCore:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ShaderCore_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    CMD_IsIdle : OUT STD_LOGIC;
    CMD_IsReadyForCommand : OUT STD_LOGIC;
    CMD_InCommand : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_LoadProgramAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
    CMD_LoadProgramLen : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    CMD_SetConstantIndex : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    CMD_SetConstantData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    CMD_SetNumVertexStreams : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_SetVertexStreamID : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_SetVertexStreamDWORDCount : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_SetVertexStreamIsD3DCOLOR : IN STD_LOGIC;
    CMD_SetVertexStreamShaderRegIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    CMD_SetVertexStreamDWORDStride : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    CMD_SetVertexStreamDWORDOffset : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    VBB_Done : IN STD_LOGIC;
    VERTBATCH_FIFO_empty : IN STD_LOGIC;
    VERTBATCH_FIFO_rd_data : IN STD_LOGIC_VECTOR(543 DOWNTO 0);
    VERTBATCH_FIFO_rd_en : OUT STD_LOGIC;
    VBO_Pushed : OUT STD_LOGIC;
    VBO_NumVertices : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    VBO_NumIndices : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    VBO_IsIndexedDrawCall : OUT STD_LOGIC;
    VBO_Ready : IN STD_LOGIC;
    VERTOUT_FIFO_full : IN STD_LOGIC;
    VERTOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(319 DOWNTO 0);
    VERTOUT_FIFO_wr_en : OUT STD_LOGIC;
    INDEXOUT_FIFO_full : IN STD_LOGIC;
    INDEXOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(271 DOWNTO 0);
    INDEXOUT_FIFO_wr_en : OUT STD_LOGIC;
    VSC_ReadEnable : OUT STD_LOGIC;
    VSC_ReadStreamIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    VSC_ReadDWORDAddr : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    VSC_ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    VSC_ReadReady : IN STD_LOGIC;
    VSC_SetStreamVBAddress : OUT STD_LOGIC;
    VSC_StreamIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    VSC_StreamVBAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
    VSC_InvalidateCache : OUT STD_LOGIC;
    ICache_Clk : OUT STD_LOGIC;
    ICache_Enable : OUT STD_LOGIC;
    ICache_WriteMode : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ICache_Address : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    ICache_WriteData : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    ICache_ReadData : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    CB_Enable : OUT STD_LOGIC;
    CB_WriteMode : OUT STD_LOGIC;
    CB_RegIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    CB_RegComponent : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    CB_ReadOutData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CB_WriteInData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    GPR0_ReadQuadIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_WriteQuadIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortA_en : OUT STD_LOGIC;
    GPR0_PortA_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortA_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    GPR0_PortA_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortA_readOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    GPR0_PortB_en : OUT STD_LOGIC;
    GPR0_PortB_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortB_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    GPR0_PortB_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortB_readOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    GPR0_PortW_en : OUT STD_LOGIC;
    GPR0_PortW_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortW_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    GPR0_PortW_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    GPR0_PortW_writeInData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    FPUALL_IN_MODE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    FPUALL_ISHFT_GO : OUT STD_LOGIC;
    FPUALL_IMUL_GO : OUT STD_LOGIC;
    FPUALL_IADD_GO : OUT STD_LOGIC;
    FPUALL_ICMP_GO : OUT STD_LOGIC;
    FPUALL_ICNV_GO : OUT STD_LOGIC;
    FPUALL_ISPEC_GO : OUT STD_LOGIC;
    FPUALL_IBIT_GO : OUT STD_LOGIC;
    FPU0_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU0_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU0_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU1_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU1_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU1_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU2_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU2_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU2_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU3_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU3_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    FPU3_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    UNORM8ToFloat_Enable : OUT STD_LOGIC;
    UNORM8ToFloat_ColorIn : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    UNORM8ToFloat_ConvertedX : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    UNORM8ToFloat_ConvertedY : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    UNORM8ToFloat_ConvertedZ : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    UNORM8ToFloat_ConvertedW : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesExecShaderCode : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_CurrentState : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_CurrentFetchWave : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_CurrentDWORD : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_CurrentStreamID : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_ActiveLanesBitmask : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    DBG_InstructionPointer : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    DBG_CurrentlyExecutingInstruction : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DBG_CyclesRemainingCurrentInstruction : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_ReadRegisterOutRequest : IN STD_LOGIC;
    DBG_ReadRegisterOutDataReady : OUT STD_LOGIC;
    DBG_ReadRegisterOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    DBG_PortW_MUX : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_OStall : OUT STD_LOGIC;
    DBG_IStall : OUT STD_LOGIC
  );
END design_1_ShaderCore_0_0;

ARCHITECTURE design_1_ShaderCore_0_0_arch OF design_1_ShaderCore_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_ShaderCore_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ShaderCore IS
    PORT (
      clk : IN STD_LOGIC;
      CMD_IsIdle : OUT STD_LOGIC;
      CMD_IsReadyForCommand : OUT STD_LOGIC;
      CMD_InCommand : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_LoadProgramAddr : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
      CMD_LoadProgramLen : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CMD_SetConstantIndex : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      CMD_SetConstantData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      CMD_SetNumVertexStreams : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_SetVertexStreamID : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_SetVertexStreamDWORDCount : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_SetVertexStreamIsD3DCOLOR : IN STD_LOGIC;
      CMD_SetVertexStreamShaderRegIndex : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      CMD_SetVertexStreamDWORDStride : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      CMD_SetVertexStreamDWORDOffset : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      VBB_Done : IN STD_LOGIC;
      VERTBATCH_FIFO_empty : IN STD_LOGIC;
      VERTBATCH_FIFO_rd_data : IN STD_LOGIC_VECTOR(543 DOWNTO 0);
      VERTBATCH_FIFO_rd_en : OUT STD_LOGIC;
      VBO_Pushed : OUT STD_LOGIC;
      VBO_NumVertices : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      VBO_NumIndices : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      VBO_IsIndexedDrawCall : OUT STD_LOGIC;
      VBO_Ready : IN STD_LOGIC;
      VERTOUT_FIFO_full : IN STD_LOGIC;
      VERTOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(319 DOWNTO 0);
      VERTOUT_FIFO_wr_en : OUT STD_LOGIC;
      INDEXOUT_FIFO_full : IN STD_LOGIC;
      INDEXOUT_FIFO_wr_data : OUT STD_LOGIC_VECTOR(271 DOWNTO 0);
      INDEXOUT_FIFO_wr_en : OUT STD_LOGIC;
      VSC_ReadEnable : OUT STD_LOGIC;
      VSC_ReadStreamIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      VSC_ReadDWORDAddr : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      VSC_ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      VSC_ReadReady : IN STD_LOGIC;
      VSC_SetStreamVBAddress : OUT STD_LOGIC;
      VSC_StreamIndex : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      VSC_StreamVBAddress : OUT STD_LOGIC_VECTOR(29 DOWNTO 0);
      VSC_InvalidateCache : OUT STD_LOGIC;
      ICache_Clk : OUT STD_LOGIC;
      ICache_Enable : OUT STD_LOGIC;
      ICache_WriteMode : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      ICache_Address : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      ICache_WriteData : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      ICache_ReadData : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      CB_Enable : OUT STD_LOGIC;
      CB_WriteMode : OUT STD_LOGIC;
      CB_RegIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      CB_RegComponent : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      CB_ReadOutData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      CB_WriteInData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      GPR0_ReadQuadIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_WriteQuadIndex : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortA_en : OUT STD_LOGIC;
      GPR0_PortA_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortA_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      GPR0_PortA_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortA_readOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      GPR0_PortB_en : OUT STD_LOGIC;
      GPR0_PortB_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortB_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      GPR0_PortB_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortB_readOutData : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      GPR0_PortW_en : OUT STD_LOGIC;
      GPR0_PortW_regType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortW_regIdx : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      GPR0_PortW_regChan : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      GPR0_PortW_writeInData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      FPUALL_IN_MODE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      FPUALL_ISHFT_GO : OUT STD_LOGIC;
      FPUALL_IMUL_GO : OUT STD_LOGIC;
      FPUALL_IADD_GO : OUT STD_LOGIC;
      FPUALL_ICMP_GO : OUT STD_LOGIC;
      FPUALL_ICNV_GO : OUT STD_LOGIC;
      FPUALL_ISPEC_GO : OUT STD_LOGIC;
      FPUALL_IBIT_GO : OUT STD_LOGIC;
      FPU0_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU0_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU0_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU1_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU1_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU1_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU2_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU2_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU2_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU3_IN_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU3_IN_B : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      FPU3_OUT_RESULT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      UNORM8ToFloat_Enable : OUT STD_LOGIC;
      UNORM8ToFloat_ColorIn : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      UNORM8ToFloat_ConvertedX : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      UNORM8ToFloat_ConvertedY : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      UNORM8ToFloat_ConvertedZ : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      UNORM8ToFloat_ConvertedW : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesIdle : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesSpentWorking : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesExecShaderCode : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CyclesWaitingForOutput : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CurrentDrawEventID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_CurrentState : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_CurrentFetchWave : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_CurrentDWORD : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_CurrentStreamID : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_ActiveLanesBitmask : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
      DBG_InstructionPointer : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      DBG_CurrentlyExecutingInstruction : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      DBG_CyclesRemainingCurrentInstruction : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_ReadRegisterOutRequest : IN STD_LOGIC;
      DBG_ReadRegisterOutDataReady : OUT STD_LOGIC;
      DBG_ReadRegisterOutData : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      DBG_PortW_MUX : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_OStall : OUT STD_LOGIC;
      DBG_IStall : OUT STD_LOGIC
    );
  END COMPONENT ShaderCore;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ICache_ReadData: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF ICache_WriteData: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache DIN";
  ATTRIBUTE X_INTERFACE_INFO OF ICache_Address: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF ICache_WriteMode: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache WE";
  ATTRIBUTE X_INTERFACE_INFO OF ICache_Enable: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache EN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ICache_Clk: SIGNAL IS "XIL_INTERFACENAME ICache, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF ICache_Clk: SIGNAL IS "xilinx.com:interface:bram:1.0 ICache CLK";
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF INDEXOUT_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 INDEXOUT_FIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VERTOUT_FIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF VERTBATCH_FIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO EMPTY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : ShaderCore
    PORT MAP (
      clk => clk,
      CMD_IsIdle => CMD_IsIdle,
      CMD_IsReadyForCommand => CMD_IsReadyForCommand,
      CMD_InCommand => CMD_InCommand,
      CMD_LoadProgramAddr => CMD_LoadProgramAddr,
      CMD_LoadProgramLen => CMD_LoadProgramLen,
      CMD_SetConstantIndex => CMD_SetConstantIndex,
      CMD_SetConstantData => CMD_SetConstantData,
      CMD_SetNumVertexStreams => CMD_SetNumVertexStreams,
      CMD_SetVertexStreamID => CMD_SetVertexStreamID,
      CMD_SetVertexStreamDWORDCount => CMD_SetVertexStreamDWORDCount,
      CMD_SetVertexStreamIsD3DCOLOR => CMD_SetVertexStreamIsD3DCOLOR,
      CMD_SetVertexStreamShaderRegIndex => CMD_SetVertexStreamShaderRegIndex,
      CMD_SetVertexStreamDWORDStride => CMD_SetVertexStreamDWORDStride,
      CMD_SetVertexStreamDWORDOffset => CMD_SetVertexStreamDWORDOffset,
      VBB_Done => VBB_Done,
      VERTBATCH_FIFO_empty => VERTBATCH_FIFO_empty,
      VERTBATCH_FIFO_rd_data => VERTBATCH_FIFO_rd_data,
      VERTBATCH_FIFO_rd_en => VERTBATCH_FIFO_rd_en,
      VBO_Pushed => VBO_Pushed,
      VBO_NumVertices => VBO_NumVertices,
      VBO_NumIndices => VBO_NumIndices,
      VBO_IsIndexedDrawCall => VBO_IsIndexedDrawCall,
      VBO_Ready => VBO_Ready,
      VERTOUT_FIFO_full => VERTOUT_FIFO_full,
      VERTOUT_FIFO_wr_data => VERTOUT_FIFO_wr_data,
      VERTOUT_FIFO_wr_en => VERTOUT_FIFO_wr_en,
      INDEXOUT_FIFO_full => INDEXOUT_FIFO_full,
      INDEXOUT_FIFO_wr_data => INDEXOUT_FIFO_wr_data,
      INDEXOUT_FIFO_wr_en => INDEXOUT_FIFO_wr_en,
      VSC_ReadEnable => VSC_ReadEnable,
      VSC_ReadStreamIndex => VSC_ReadStreamIndex,
      VSC_ReadDWORDAddr => VSC_ReadDWORDAddr,
      VSC_ReadData => VSC_ReadData,
      VSC_ReadReady => VSC_ReadReady,
      VSC_SetStreamVBAddress => VSC_SetStreamVBAddress,
      VSC_StreamIndex => VSC_StreamIndex,
      VSC_StreamVBAddress => VSC_StreamVBAddress,
      VSC_InvalidateCache => VSC_InvalidateCache,
      ICache_Clk => ICache_Clk,
      ICache_Enable => ICache_Enable,
      ICache_WriteMode => ICache_WriteMode,
      ICache_Address => ICache_Address,
      ICache_WriteData => ICache_WriteData,
      ICache_ReadData => ICache_ReadData,
      CB_Enable => CB_Enable,
      CB_WriteMode => CB_WriteMode,
      CB_RegIndex => CB_RegIndex,
      CB_RegComponent => CB_RegComponent,
      CB_ReadOutData => CB_ReadOutData,
      CB_WriteInData => CB_WriteInData,
      GPR0_ReadQuadIndex => GPR0_ReadQuadIndex,
      GPR0_WriteQuadIndex => GPR0_WriteQuadIndex,
      GPR0_PortA_en => GPR0_PortA_en,
      GPR0_PortA_regType => GPR0_PortA_regType,
      GPR0_PortA_regIdx => GPR0_PortA_regIdx,
      GPR0_PortA_regChan => GPR0_PortA_regChan,
      GPR0_PortA_readOutData => GPR0_PortA_readOutData,
      GPR0_PortB_en => GPR0_PortB_en,
      GPR0_PortB_regType => GPR0_PortB_regType,
      GPR0_PortB_regIdx => GPR0_PortB_regIdx,
      GPR0_PortB_regChan => GPR0_PortB_regChan,
      GPR0_PortB_readOutData => GPR0_PortB_readOutData,
      GPR0_PortW_en => GPR0_PortW_en,
      GPR0_PortW_regType => GPR0_PortW_regType,
      GPR0_PortW_regIdx => GPR0_PortW_regIdx,
      GPR0_PortW_regChan => GPR0_PortW_regChan,
      GPR0_PortW_writeInData => GPR0_PortW_writeInData,
      FPUALL_IN_MODE => FPUALL_IN_MODE,
      FPUALL_ISHFT_GO => FPUALL_ISHFT_GO,
      FPUALL_IMUL_GO => FPUALL_IMUL_GO,
      FPUALL_IADD_GO => FPUALL_IADD_GO,
      FPUALL_ICMP_GO => FPUALL_ICMP_GO,
      FPUALL_ICNV_GO => FPUALL_ICNV_GO,
      FPUALL_ISPEC_GO => FPUALL_ISPEC_GO,
      FPUALL_IBIT_GO => FPUALL_IBIT_GO,
      FPU0_IN_A => FPU0_IN_A,
      FPU0_IN_B => FPU0_IN_B,
      FPU0_OUT_RESULT => FPU0_OUT_RESULT,
      FPU1_IN_A => FPU1_IN_A,
      FPU1_IN_B => FPU1_IN_B,
      FPU1_OUT_RESULT => FPU1_OUT_RESULT,
      FPU2_IN_A => FPU2_IN_A,
      FPU2_IN_B => FPU2_IN_B,
      FPU2_OUT_RESULT => FPU2_OUT_RESULT,
      FPU3_IN_A => FPU3_IN_A,
      FPU3_IN_B => FPU3_IN_B,
      FPU3_OUT_RESULT => FPU3_OUT_RESULT,
      UNORM8ToFloat_Enable => UNORM8ToFloat_Enable,
      UNORM8ToFloat_ColorIn => UNORM8ToFloat_ColorIn,
      UNORM8ToFloat_ConvertedX => UNORM8ToFloat_ConvertedX,
      UNORM8ToFloat_ConvertedY => UNORM8ToFloat_ConvertedY,
      UNORM8ToFloat_ConvertedZ => UNORM8ToFloat_ConvertedZ,
      UNORM8ToFloat_ConvertedW => UNORM8ToFloat_ConvertedW,
      STAT_CyclesIdle => STAT_CyclesIdle,
      STAT_CyclesSpentWorking => STAT_CyclesSpentWorking,
      STAT_CyclesExecShaderCode => STAT_CyclesExecShaderCode,
      STAT_CyclesWaitingForOutput => STAT_CyclesWaitingForOutput,
      STAT_CurrentDrawEventID => STAT_CurrentDrawEventID,
      DBG_CurrentState => DBG_CurrentState,
      DBG_CurrentFetchWave => DBG_CurrentFetchWave,
      DBG_CurrentDWORD => DBG_CurrentDWORD,
      DBG_CurrentStreamID => DBG_CurrentStreamID,
      DBG_ActiveLanesBitmask => DBG_ActiveLanesBitmask,
      DBG_InstructionPointer => DBG_InstructionPointer,
      DBG_CurrentlyExecutingInstruction => DBG_CurrentlyExecutingInstruction,
      DBG_CyclesRemainingCurrentInstruction => DBG_CyclesRemainingCurrentInstruction,
      DBG_ReadRegisterOutRequest => DBG_ReadRegisterOutRequest,
      DBG_ReadRegisterOutDataReady => DBG_ReadRegisterOutDataReady,
      DBG_ReadRegisterOutData => DBG_ReadRegisterOutData,
      DBG_PortW_MUX => DBG_PortW_MUX,
      DBG_OStall => DBG_OStall,
      DBG_IStall => DBG_IStall
    );
END design_1_ShaderCore_0_0_arch;
