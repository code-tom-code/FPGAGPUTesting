library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eShaderCMDPacket enum type defined in there
library work;
use work.PacketType.all;

entity ShaderCore is
    Port (clk : in STD_LOGIC;
		
		-- Command processor signals:
		CMD_IsReadyForCommand : out STD_LOGIC := '0';
		CMD_InCommand : in STD_LOGIC_VECTOR(2 downto 0); -- 000 = do nothing; 010 = LoadProgram; 001 = SetConstant; 011 = SetVertexStream; 100 = BeginShading
		CMD_LoadProgramAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_LoadProgramLen : in STD_LOGIC_VECTOR(15 downto 0); -- The length of the instruction stream for this shader, in instruction tokens (QWORD's in this case)
		CMD_SetConstantIndex : in STD_LOGIC_VECTOR(7 downto 0);
		CMD_SetConstantData : in STD_LOGIC_VECTOR(127 downto 0);
		CMD_SetNumVertexStreams : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_SetVertexStreamID : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_SetVertexStreamDWORDCount : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_SetVertexStreamIsD3DCOLOR : in STD_LOGIC;
		CMD_SetVertexStreamShaderRegIndex : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_SetVertexStreamDWORDStride : in STD_LOGIC_VECTOR(5 downto 0); -- Number of DWORD's between consecutive vertex stream elements (may be 0)
		CMD_SetVertexStreamDWORDOffset : in STD_LOGIC_VECTOR(5 downto 0); -- Number of DWORD's offset from the start of the vertex to this element

		-- Vertex Batch Builder (VBB) signals:
		VBB_Done : in STD_LOGIC; -- Set to 1 when there's no more pending work to push into the FIFO. Shading is complete when this is 1 and VERTBATCH_FIFO_empty is 1 at the same time.
		VERTBATCH_FIFO_empty : in STD_LOGIC;
		VERTBATCH_FIFO_rd_data : in STD_LOGIC_VECTOR(18*16-1 downto 0);
		VERTBATCH_FIFO_rd_en : out STD_LOGIC := '0';

		-- Vertex Batch Output (VBO) signals:
		VBO_Pushed : out STD_LOGIC := '0'; -- Set to 1 when we've completed pushing our next fully shaded batch of output verts
		VBO_BatchStartingIndex : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBO_BatchEndingIndex : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBO_Ready : in STD_LOGIC;
		VERTOUT_FIFO_full : in STD_LOGIC;
		VERTOUT_FIFO_wr_data : out STD_LOGIC_VECTOR(127 downto 0);
		VERTOUT_FIFO_wr_en : out STD_LOGIC := '0';

		-- Vertex Stream Cache (VSC) signals:
		VSC_ReadEnable : out STD_LOGIC := '0';
		VSC_ReadStreamIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		VSC_ReadDWORDAddr : out STD_LOGIC_VECTOR(21 downto 0) := (others => '0');
		VSC_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		VSC_ReadReady : in STD_LOGIC;
		VSC_SetStreamVBAddress : out STD_LOGIC := '0';
		VSC_StreamIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		VSC_StreamVBAddress : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		VSC_InvalidateCache : out STD_LOGIC := '0';

		-- Instruction Cache (IC) signals:
		ICache_Clk : out STD_LOGIC := '0';
		ICache_Enable : out STD_LOGIC := '0';
		ICache_WriteMode : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		ICache_Address : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0'); -- There are 512 instruction slots in our SDP BRAM36k with a 64 bit width
		ICache_WriteData : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
		ICache_ReadData : in STD_LOGIC_VECTOR(63 downto 0);

		-- Constant Buffer (CB) signals:
		CB_Enable : out STD_LOGIC := '0';
		CB_WriteMode : out STD_LOGIC := '0'; -- 0 for read, 1 for write
		CB_RegIndex : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- 8 bit uint to address 256 constant registers
		CB_RegComponent : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		CB_ReadOutData : in STD_LOGIC_VECTOR(31 downto 0);
		CB_WriteInData : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- GPRQuad0 signals:
		GPR0_ReadQuadIndex : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		GPR0_WriteQuadIndex : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		GPR0_PortA_en : out STD_LOGIC := '0';
		GPR0_PortA_regType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		GPR0_PortA_regIdx : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- Register index (unsigned int from 0 to 7)
		GPR0_PortA_regChan : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		GPR0_PortA_readOutData : in STD_LOGIC_VECTOR(127 downto 0);
		GPR0_PortB_en : out STD_LOGIC := '0';
		GPR0_PortB_regType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		GPR0_PortB_regIdx : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- Register index (unsigned int from 0 to 7)
		GPR0_PortB_regChan : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		GPR0_PortB_readOutData : in STD_LOGIC_VECTOR(127 downto 0);
		GPR0_PortW_en : out STD_LOGIC := '0';
		GPR0_PortW_regType : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		GPR0_PortW_regIdx : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- Register index (unsigned int from 0 to 7)
		GPR0_PortW_regChan : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0'); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		GPR0_PortW_writeInData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		-- FPU Shared Signals:
		FPUALL_IN_MODE : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPUALL_ISHFT_GO : out STD_LOGIC := '0'; -- SHFT pipe operates in 1 clock cycle
		FPUALL_IMUL_GO : out STD_LOGIC := '0'; -- MUL pipe operates in 5 clock cycles
		FPUALL_IADD_GO : out STD_LOGIC := '0'; -- ADD pipe operates in 3 clock cycles
		FPUALL_ICMP_GO : out STD_LOGIC := '0'; -- CMP pipe operates in 1 clock cycle
		FPUALL_ICNV_GO : out STD_LOGIC := '0'; -- CNV pipe operates in 2 clock cycles
		FPUALL_ISPEC_GO : out STD_LOGIC := '0'; -- SPEC pipe operates in 13 clock cycles

		-- FPU0 signals:
		FPU0_IN_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU0_IN_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU0_OUT_RESULT : in STD_LOGIC_VECTOR(31 downto 0);

		-- FPU1 signals:
		FPU1_IN_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU1_IN_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU1_OUT_RESULT : in STD_LOGIC_VECTOR(31 downto 0);

		-- FPU2 signals:
		FPU2_IN_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU2_IN_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU2_OUT_RESULT : in STD_LOGIC_VECTOR(31 downto 0);

		-- FPU3 signals:
		FPU3_IN_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU3_IN_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU3_OUT_RESULT : in STD_LOGIC_VECTOR(31 downto 0);

		-- UNORM8ToFloat signals:
		UNORM8ToFloat_Enable : out STD_LOGIC := '0';
		UNORM8ToFloat_ColorIn : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		UNORM8ToFloat_ConvertedX : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedY : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedZ : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedW : in STD_LOGIC_VECTOR(31 downto 0);

		-- Debugging signals:
		DBG_CurrentState : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_CurrentFetchWave : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentDWORD : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_CurrentStreamID : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_ActiveLanesBitmask : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_InstructionPointer : out STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
		DBG_CurrentlyExecutingInstruction : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
		DBG_CyclesRemainingCurrentInstruction : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		--DBG_PortA_MUX : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		--DBG_PortB_MUX : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		--DBG_PortW_MUX : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		DBG_OStall : out STD_LOGIC := '0';
		DBG_IStall : out STD_LOGIC := '0'
		);
end ShaderCore;

architecture Behavioral of ShaderCore is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTBATCH_FIFO EMPTY";

ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VERTOUT_FIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of ICache_Clk: SIGNAL is "xilinx.com:interface:bram:1.0 ICache CLK";
ATTRIBUTE X_INTERFACE_INFO of ICache_Enable: SIGNAL is "xilinx.com:interface:bram:1.0 ICache EN";
ATTRIBUTE X_INTERFACE_INFO of ICache_WriteData: SIGNAL is "xilinx.com:interface:bram:1.0 ICache DIN";
ATTRIBUTE X_INTERFACE_INFO of ICache_ReadData: SIGNAL is "xilinx.com:interface:bram:1.0 ICache DOUT";
ATTRIBUTE X_INTERFACE_INFO of ICache_WriteMode: SIGNAL is "xilinx.com:interface:bram:1.0 ICache WE";
ATTRIBUTE X_INTERFACE_INFO of ICache_Address: SIGNAL is "xilinx.com:interface:bram:1.0 ICache ADDR";

type eShaderCoreState is
(
	initState, -- 0

	readyState, -- 1

	loadProgramState, -- 2
	loadProgramStateLoopLow, -- 3
	loadProgramStateLoopLowWaitForData, -- 4
	loadProgramStateLoopHigh, -- 5
	loadProgramStateLoopHighWaitForData, -- 6
	loadProgramStateCleanup, -- 7

	setShaderConstantY, -- 8
	setShaderConstantZ, -- 9
	setShaderConstantW, -- 10

	getVertexBatch, -- 11

	fetchVertexStreamData0, -- 12
	fetchVertexStreamData1, -- 13
	fetchVertexStreamDataWaitForData, -- 14
	writeVertexDataToGPR, -- 15

	unpackColorData_Lane0, -- 16
	unpackColorData_Lane1, -- 17
	unpackColorData_Lane2, -- 18
	unpackColorData_Lane3, -- 19
	unpackColorData_WriteX, -- 20
	unpackColorData_WriteY, -- 21
	unpackColorData_WriteZ, -- 22
	unpackColorData_WriteW, -- 23

	setupRunShader, -- 24
	runShader, -- 25
	waitForWritesToComplete, -- 26

	collectShaderResults, -- 27
	submitShaderResults -- 28
);

type eCmpType is
(
	-- Min and Max are typical float min(a, b) and float max(a, b) functions
	CmpMin, -- 0
	CmpMax, -- 1

	-- SLT(a, b) computes a < b; SGE(a, b) computes a >= b (the exact opposite of SLT)
	CmpSlt, -- 2
	CmpSge, -- 3

	-- SGN(a) computes component-wise the sign of a (-1 for negative, 0 for zero, or 1 for positive)
	CmpSgn, -- 4

	-- MOV bitwise moves A to OUT (no conversions)
	CmpMov -- 5

	-- Removing 3-input compares for now
	-- CMP(a, b, c) computes component-wise (a >= 0 ? b : c). CND(a, b, c) computes component-wise (a > 0.5 ? b : c).
	--CmpCmp, -- 6
	--CmpCnd -- 7
);

type eConvertMode is
(
	F_to_I24_Trunc, -- 0
	F_to_I23_RoundNearestEven, -- 1
	F_to_I16_RoundNearestEven, -- 2
	F_to_UNORM16, -- 3
	F_to_UNORM8 -- 4
	-- F_to_Half -- 5
);

type InstructionOperation is (
	Op_NOP, -- 0
	Op_MOV, -- 1
	Op_ADD, -- 2
	Op_MUL, -- 3
	Op_MIN, -- 4
	Op_MAX, -- 5
	Op_RCP, -- 6
	Op_FRC, -- 7
	Op_EXPP, -- 8
	Op_LOGP, -- 9
	Op_RSQ, -- 10
	Op_SLT, -- 11
	Op_SGE, -- 12
	Op_SGN, -- 13
	Op_RND_SINT24Z, -- 14
	Op_RND_SINT23NE, -- 15
	Op_RND_SINT16NE, -- 16
	Op_CNV_UNORM16, -- 17
	Op_CNV_UNORM8, -- 18
	Op_SHFT, -- 19

	-- These instructions are currently unused!
	Op_UNUSED20, -- 20
	Op_UNUSED21, -- 21
	Op_UNUSED22, -- 22
	Op_UNUSED23, -- 23
	Op_UNUSED24, -- 24
	Op_UNUSED25, -- 25
	Op_UNUSED26, -- 26
	Op_UNUSED27, -- 27
	Op_UNUSED28, -- 28
	Op_UNUSED29, -- 29
	Op_UNUSED30, -- 30

	Op_END -- 31
);

type MUXSource is (
	MUXSrc_RegFile, -- 0
	MUXSrc_ConstBuffer, -- 1
	MUXSrc_ZeroReg, -- 2
	MUXSrc_OneReg, -- 3
	MUXSrc_NegOneReg -- 4
);

type MUXDest is (
	MUXDest_ZeroReg, -- 0 (used for NULL outputs)
	MUXDest_ALUResult, -- 1 (used for ALU ops)
	MUXDest_Special -- 2 (used for vertex stream loads to v# input registers)
);

type SourceMod is (
	SrcMod_None, -- 0
	SrcMod_Neg, -- 1
	SrcMod_Abs, -- 2
	SrcMod_AbsNeg -- 3
);

type DestMod is (
	DestMod_None, -- 0
	DestMod_Saturate -- 1
);

type RegisterComponent is (
	Comp_X, -- 0
	Comp_Y, -- 1
	Comp_Z, -- 2
	Comp_W -- 3
);

type InstructionSourceRegType is (
	SRTyp_R, -- 0
	SRTyp_V, -- 1
	SRTyp_C, -- 2
	SRTyp_X, -- 3
	SRTyp_O, -- 4
	SRTyp_0, -- 5
	SRTyp_1, -- 6
	SRTyp_N1 -- 7
);

type InstructionDestRegType is (
	DRTyp_R, -- 0
	DRTyp_X, -- 1
	DRTyp_O, -- 2
	DRTyp_NULL -- 3
);

type RegisterFileRegType is (
	RFType_VInput, -- 0 v#
	RFType_OOutput, -- 1 o#
	RFType_RGPR, -- 2 r#
	RFType_XSpecial -- 3 x#
);

type OutputDestBytesType is (
	ODB_Write32A, -- 0 -- result = sourceA;
	ODB_Write16B_16A, -- 1 -- result = (sourceB << 16) | (sourceA & 0xFFFF);
	ODB_Write8B_8A_Low, -- 2 -- result = (sourceB << 8) | (sourceA & 0xFF);
	ODB_Write8B_8A_High -- 3 -- result = (sourceB << 24) | (sourceA << 16) | (result & 0xFFFF);
);

constant InstructionSlot_OpcodeBitOffset : integer := 0;
constant InstructionSlot_OpcodeBitLength : integer := 5;
constant InstructionSlot_OpcodeBitHigh : integer := InstructionSlot_OpcodeBitOffset + InstructionSlot_OpcodeBitLength - 1;

constant InstructionSlot_DestModifierBitOffset : integer := InstructionSlot_OpcodeBitOffset + InstructionSlot_OpcodeBitLength;
constant InstructionSlot_DestModifierBitLength : integer := 1;
constant InstructionSlot_DestModifierBitHigh : integer := InstructionSlot_DestModifierBitOffset + InstructionSlot_DestModifierBitLength - 1;

constant InstructionSlot_DestRegTypeBitOffset : integer := InstructionSlot_DestModifierBitOffset + InstructionSlot_DestModifierBitLength;
constant InstructionSlot_DestRegTypeBitLength : integer := 2;
constant InstructionSlot_DestRegTypeBitHigh : integer := InstructionSlot_DestRegTypeBitOffset + InstructionSlot_DestRegTypeBitLength - 1;

constant InstructionSlot_DestRegIndexBitOffset : integer := InstructionSlot_DestRegTypeBitOffset + InstructionSlot_DestRegTypeBitLength;
constant InstructionSlot_DestRegIndexBitLength : integer := 3;
constant InstructionSlot_DestRegIndexBitHigh : integer := InstructionSlot_DestRegIndexBitOffset + InstructionSlot_DestRegIndexBitLength - 1;

constant InstructionSlot_DestRegComponentBitOffset : integer := InstructionSlot_DestRegIndexBitOffset + InstructionSlot_DestRegIndexBitLength;
constant InstructionSlot_DestRegComponentBitLength : integer := 2;
constant InstructionSlot_DestRegComponentBitHigh : integer := InstructionSlot_DestRegComponentBitOffset + InstructionSlot_DestRegComponentBitLength - 1;

constant InstructionSlot_SrcAModifierBitOffset : integer := InstructionSlot_DestRegComponentBitOffset + InstructionSlot_DestRegComponentBitLength;
constant InstructionSlot_SrcAModifierBitLength : integer := 2;
constant InstructionSlot_SrcAModifierBitHigh : integer := InstructionSlot_SrcAModifierBitOffset + InstructionSlot_SrcAModifierBitLength - 1;

constant InstructionSlot_SrcARegTypeBitOffset : integer := InstructionSlot_SrcAModifierBitOffset + InstructionSlot_SrcAModifierBitLength;
constant InstructionSlot_SrcARegTypeBitLength : integer := 3;
constant InstructionSlot_SrcARegTypeBitHigh : integer := InstructionSlot_SrcARegTypeBitOffset + InstructionSlot_SrcARegTypeBitLength - 1;

constant InstructionSlot_SrcARegIndexBitOffset : integer := InstructionSlot_SrcARegTypeBitOffset + InstructionSlot_SrcARegTypeBitLength;
constant InstructionSlot_SrcARegIndexBitLength : integer := 8;
constant InstructionSlot_SrcARegIndexBitHigh : integer := InstructionSlot_SrcARegIndexBitOffset + InstructionSlot_SrcARegIndexBitLength - 1;

constant InstructionSlot_SrcARegComponentBitOffset : integer := InstructionSlot_SrcARegIndexBitOffset + InstructionSlot_SrcARegIndexBitLength;
constant InstructionSlot_SrcARegComponentBitLength : integer := 2;
constant InstructionSlot_SrcARegComponentBitHigh : integer := InstructionSlot_SrcARegComponentBitOffset + InstructionSlot_SrcARegComponentBitLength - 1;

constant InstructionSlot_SrcBModifierBitOffset : integer := InstructionSlot_SrcARegComponentBitOffset + InstructionSlot_SrcARegComponentBitLength;
constant InstructionSlot_SrcBModifierBitLength : integer := 2;
constant InstructionSlot_SrcBModifierBitHigh : integer := InstructionSlot_SrcBModifierBitOffset + InstructionSlot_SrcBModifierBitLength - 1;

constant InstructionSlot_SrcBRegTypeBitOffset : integer := InstructionSlot_SrcBModifierBitOffset + InstructionSlot_SrcBModifierBitLength;
constant InstructionSlot_SrcBRegTypeBitLength : integer := 3;
constant InstructionSlot_SrcBRegTypeBitHigh : integer := InstructionSlot_SrcBRegTypeBitOffset + InstructionSlot_SrcBRegTypeBitLength - 1;

constant InstructionSlot_SrcBRegIndexBitOffset : integer := InstructionSlot_SrcBRegTypeBitOffset + InstructionSlot_SrcBRegTypeBitLength;
constant InstructionSlot_SrcBRegIndexBitLength : integer := 8;
constant InstructionSlot_SrcBRegIndexBitHigh : integer := InstructionSlot_SrcBRegIndexBitOffset + InstructionSlot_SrcBRegIndexBitLength - 1;

constant InstructionSlot_SrcBRegComponentBitOffset : integer := InstructionSlot_SrcBRegIndexBitOffset + InstructionSlot_SrcBRegIndexBitLength;
constant InstructionSlot_SrcBRegComponentBitLength : integer := 2;
constant InstructionSlot_SrcBRegComponentBitHigh : integer := InstructionSlot_SrcBRegComponentBitOffset + InstructionSlot_SrcBRegComponentBitLength - 1;

type PipelineFPUState is record
	Pipe_IN_MODE : unsigned(2 downto 0);
	Pipe_IADD_GO : std_logic;
	Pipe_ICMP_GO : std_logic;
	Pipe_IMUL_GO : std_logic;
	Pipe_ISHFT_GO : std_logic;
	Pipe_ISPEC_GO : std_logic;
	Pipe_ICNV_GO : std_logic;

	-- These are for loading Port A and Port B of the FPU
	Pipe_PortA_MUX : MUXSource;
	Pipe_PortA_SrcMod : SourceMod;
	Pipe_PortB_MUX : MUXSource;
	Pipe_PortB_SrcMod : SourceMod;
end record PipelineFPUState;

type PipelineCBState is record
	Pipe_CB_Enable : std_logic;
	Pipe_CB_RegIndex : unsigned(7 downto 0);
	Pipe_CB_RegComponent : unsigned(1 downto 0);
end record PipelineCBState;

type PipelineOutputState is record
	Pipe_PortWrite_GPRQuad : unsigned(1 downto 0); -- Which GPR quad to write to

	Pipe_PortW_wrEnable : std_logic;
	Pipe_PortW_regType : RegisterFileRegType; -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
	Pipe_PortW_regIdx : unsigned(2 downto 0); -- Register index (unsigned int from 0 to 7)
	Pipe_PortW_regChan : RegisterComponent; -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel

	Pipe_PortW_MUX : MUXDest;
	Pipe_PortW_DestMod : DestMod;
end record PipelineOutputState;

type PipelineGPRPortInputState is record
	Pipe_Port_En : std_logic;
	Pipe_Port_regType : RegisterFileRegType;
	Pipe_Port_regIdx : unsigned(2 downto 0);
	Pipe_Port_regChan : RegisterComponent;
end record PipelineGPRPortInputState;

type PipelineInputState is record
	Pipe_PortRead_GPRQuad : unsigned(1 downto 0); -- Which GPR quad to read from

	Pipe_PortA : PipelineGPRPortInputState;
	Pipe_PortB : PipelineGPRPortInputState;
end record PipelineInputState;
	
type GPR_PortW_PipelineData is record
	Pipe_OutputState : PipelineOutputState;

	Pipe_FPUState : PipelineFPUState;

	Pipe_InputState : PipelineInputState;

	Pipe_CBState : PipelineCBState;

	Pipe_CurrentOperation : InstructionOperation;
end record GPR_PortW_PipelineData;

type PortW_PipelineArrayType is array(13 + 4 + 1 downto 0) of GPR_PortW_PipelineData;

type VertexStreamData is record
	dwordCount : unsigned(2 downto 0);
	isD3DCOLOR : std_logic;
	shaderRegIndex : unsigned(2 downto 0);
	dwordStreamStride : unsigned(5 downto 0);
	dwordStreamOffset : unsigned(5 downto 0);
end record VertexStreamData;

-- TODO: Make this more flexible and fleshed out
type OutputInstruction is record
	resultDWORDIdx : unsigned(1 downto 0);
	destBytes : OutputDestBytesType;
	readRegIdx : unsigned(2 downto 0); -- There is only one readRegIdx here because it is assumed that both portA and portB will be reading from the same register index (just different components)
	-- There is no srcRegType here because it is assumed we are always reading from the O# Output RegType registers
	regComponent_PortA : RegisterComponent;
	regComponent_PortB : RegisterComponent;
end record OutputInstruction;

type OutputInstructionArray is array(4 downto 0) of OutputInstruction;
type OutputRegistersArray is array(3 downto 0) of unsigned(31 downto 0);

constant SafeNOPInstruction : unsigned(63 downto 0) := "0000000000000000000000000000000001010000000000001010000000110000"; -- NOP NULL.x, 0.x, 0.x
constant DefaultPipeOutputState : PipelineOutputState := (Pipe_PortWrite_GPRQuad => (others => '0'),
														Pipe_PortW_wrEnable => '0',
														Pipe_PortW_regType => RFType_XSpecial,
														Pipe_PortW_regIdx => (others => '1'),
														Pipe_PortW_regChan => Comp_X,
														Pipe_PortW_MUX => MUXDest_ZeroReg,
														Pipe_PortW_DestMod => DestMod_None);
constant DefaultPipeCBState : PipelineCBState := (Pipe_CB_Enable => '0',
													Pipe_CB_RegIndex => (others => '0'),
													Pipe_CB_RegComponent => (others => '0') );
constant DefaultPipeFPUState : PipelineFPUState := (Pipe_IN_MODE => (others => '0'),
													Pipe_IADD_GO => '0',
													Pipe_ICMP_GO => '0',
													Pipe_IMUL_GO => '0',
													Pipe_ISHFT_GO => '0',
													Pipe_ISPEC_GO => '0',
													Pipe_ICNV_GO => '0',
													Pipe_PortA_MUX => MUXSrc_ZeroReg,
													Pipe_PortA_SrcMod => SrcMod_None,
													Pipe_PortB_MUX => MUXSrc_ZeroReg,
													Pipe_PortB_SrcMod => SrcMod_None);
constant DefaultPipeGPRPortInputState : PipelineGPRPortInputState := (Pipe_Port_En => '0',
																	Pipe_Port_regType => RFType_XSpecial,
																	Pipe_Port_regIdx => (others => '1'),
																	Pipe_Port_regChan => Comp_X);
constant DefaultPipeInputState : PipelineInputState := (Pipe_PortRead_GPRQuad => (others => '0'),
														Pipe_PortA => DefaultPipeGPRPortInputState,
														Pipe_PortB => DefaultPipeGPRPortInputState);

-- Hardcode our output instruction stream for now. TODO: Make this programmable and more flexible for supporting different vertex shader output compressions and vertex-to-pixel-shader layouts
constant DefaultOutputInstructionStream : OutputInstructionArray := ( 
	0 => ( resultDWORDIdx => to_unsigned(0, 2), destBytes => ODB_Write16B_16A, readRegIdx => to_unsigned(0, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[0] = (o0.y<<16)|o0.x;
	1 => ( resultDWORDIdx => to_unsigned(1, 2), destBytes => ODB_Write32A, readRegIdx => to_unsigned(0, 3), regComponent_PortA => Comp_Z, regComponent_PortB => Comp_Z ), -- res[1] = o0.z;
	2 => ( resultDWORDIdx => to_unsigned(2, 2), destBytes => ODB_Write16B_16A, readRegIdx => to_unsigned(2, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[2] = (o2.y<<16)|o2.x;
	3 => ( resultDWORDIdx => to_unsigned(3, 2), destBytes => ODB_Write8B_8A_Low, readRegIdx => to_unsigned(1, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[3] = (o1.y<<8)|o1.x;
	4 => ( resultDWORDIdx => to_unsigned(3, 2), destBytes => ODB_Write8B_8A_High, readRegIdx => to_unsigned(1, 3), regComponent_PortA => Comp_Z, regComponent_PortB => Comp_W ) -- res[3] = (o1.w<<24)|(o1.z<<16)|res[3];
);


type VertexStreamsArray is array (7 downto 0) of VertexStreamData;

type VertexIndicesArray is array (15 downto 0) of unsigned(15 downto 0);

pure function InstructionGetOperation(instructionData : unsigned(63 downto 0) ) return InstructionOperation is
begin
	return InstructionOperation'val(to_integer(instructionData(InstructionSlot_OpcodeBitHigh downto InstructionSlot_OpcodeBitOffset) ) );
end function;

pure function InstructionGetCycleLatency(instructionOp : InstructionOperation) return unsigned is
begin
	case instructionOp is
		when Op_RCP => -- 13 cycle operation latency for RCP pipe
			return to_unsigned(13, 4);
		when Op_MUL => -- 5 cycle operation latency for MUL pipe
			return to_unsigned(5, 4);
		when Op_ADD => -- 4 cycle operation latency for ADD pipe
			return to_unsigned(4, 4);
		when Op_CNV_UNORM16 | Op_CNV_UNORM8 | Op_RND_SINT16NE | Op_RND_SINT23NE | Op_RND_SINT24Z => -- 3 cycle operation latency for CNV pipe
			return to_unsigned(3, 4);
		when others => -- Assuming that the other instructions are all 1-cycle instructions (like CMP, SHFT, MOV, etc.)
			return to_unsigned(1, 4);
	end case;
end function;

pure function InstructionGetRegTypeFromSourceType(regSourceType : InstructionSourceRegType) return RegisterFileRegType is
begin
	case regSourceType is
		when SRTyp_R =>
			return RFType_RGPR;
		when SRTyp_V =>
			return RFType_VInput;
		when SRTyp_O =>
			return RFType_OOutput;
		when others =>
			return RFType_XSpecial;
	end case;
end function;

pure function InstructionGetRegTypeFromDestType(regDestType : InstructionDestRegType) return RegisterFileRegType is
begin
	case regDestType is
		when DRTyp_R =>
			return RFType_RGPR;
		when DRTyp_O =>
			return RFType_OOutput;
		when others =>
			return RFType_XSpecial;
	end case;
end function;

pure function InstructionGetSrcRegAType(instructionData : unsigned(63 downto 0) ) return InstructionSourceRegType is
begin
	return InstructionSourceRegType'val(to_integer(instructionData(InstructionSlot_SrcARegTypeBitHigh downto InstructionSlot_SrcARegTypeBitOffset) ) );
end function;

pure function InstructionGetSrcRegBType(instructionData : unsigned(63 downto 0) ) return InstructionSourceRegType is
begin
	return InstructionSourceRegType'val(to_integer(instructionData(InstructionSlot_SrcBRegTypeBitHigh downto InstructionSlot_SrcBRegTypeBitOffset) ) );
end function;

pure function InstructionGetDestRegType(instructionData : unsigned(63 downto 0) ) return InstructionDestRegType is
begin
	return InstructionDestRegType'val(to_integer(instructionData(InstructionSlot_DestRegTypeBitHigh downto InstructionSlot_DestRegTypeBitOffset) ) );
end function;

-- Don't call this function unless you already know that source A is going to be reading from the register file.
pure function InstructionGetRegFileTypeSrcA(instructionData : unsigned(63 downto 0) ) return RegisterFileRegType is
begin
	return InstructionGetRegTypeFromSourceType(InstructionGetSrcRegAType(instructionData) );
end function;

-- Don't call this function unless you already know that source B is going to be reading from the register file.
pure function InstructionGetRegFileTypeSrcB(instructionData : unsigned(63 downto 0) ) return RegisterFileRegType is
begin
	return InstructionGetRegTypeFromSourceType(InstructionGetSrcRegBType(instructionData) );
end function;

pure function InstructionGetRegFileTypeDestW(instructionData : unsigned(63 downto 0) ) return RegisterFileRegType is
begin
	return InstructionGetRegTypeFromDestType(InstructionGetDestRegType(instructionData) );
end function;

pure function InstructionGetPortSource(sourceRegType : InstructionSourceRegType) return MUXSource is
begin
	case sourceRegType is
		when SRTyp_C =>
			return MUXSrc_ConstBuffer;
		when SRTyp_0 =>
			return MUXSrc_ZeroReg;
		when SRTyp_1 =>
			return MUXSrc_OneReg;
		when SRTyp_N1 =>
			return MUXSrc_NegOneReg;
		when others =>
			return MUXSrc_RegFile;
	end case;
end function;

pure function InstructionGetPortAMUXSource(instructionData : unsigned(63 downto 0) ) return MUXSource is
begin
	return InstructionGetPortSource(InstructionGetSrcRegAType(instructionData) );
end function;

pure function InstructionGetPortBMUXSource(instructionData : unsigned(63 downto 0) ) return MUXSource is
begin
	return InstructionGetPortSource(InstructionGetSrcRegBType(instructionData) );
end function;

pure function InstructionGetPortWMUXDest(instructionData : unsigned(63 downto 0) ) return MUXDest is
begin
	case InstructionGetDestRegType(instructionData) is
		when DRTyp_NULL =>
			return MUXDest_ZeroReg;
		when others =>
			return MUXDest_ALUResult;
	end case;
end function;

pure function InstructionGetPortSrcMod(portSourceMod : unsigned(1 downto 0) ) return SourceMod is
begin
	return SourceMod'val(to_integer(portSourceMod) );
end function;

pure function InstructionGetPortASrcMod(instructionData : unsigned(63 downto 0) ) return SourceMod is
begin
	return InstructionGetPortSrcMod(instructionData(InstructionSlot_SrcAModifierBitHigh downto InstructionSlot_SrcAModifierBitOffset) );
end function;

pure function InstructionGetPortBSrcMod(instructionData : unsigned(63 downto 0) ) return SourceMod is
begin
	return InstructionGetPortSrcMod(instructionData(InstructionSlot_SrcBModifierBitHigh downto InstructionSlot_SrcBModifierBitOffset) );
end function;

pure function InstructionGetPortWDestMod(instructionData : unsigned(63 downto 0) ) return DestMod is
begin
	if (instructionData(InstructionSlot_DestModifierBitOffset) = '1') then
		return DestMod_Saturate;
	else
		return DestMod_None;
	end if;
end function;

pure function InstructionUsesConstBuffer(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	if (InstructionGetSrcRegAType(instructionData) = SRTyp_C) then
		return '1';
	elsif (InstructionGetSrcRegBType(instructionData) = SRTyp_C) then
		return '1';
	else
		return '0';
	end if;
end function;

pure function InstructionGetDestRegWIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_DestRegIndexBitHigh downto InstructionSlot_DestRegIndexBitOffset);
end function;

pure function InstructionGetSrcRegAChannel(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcARegComponentBitHigh downto InstructionSlot_SrcARegComponentBitOffset);
end function;

pure function InstructionGetSrcRegBChannel(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcBRegComponentBitHigh downto InstructionSlot_SrcBRegComponentBitOffset);
end function;

pure function InstructionGetDestRegWChannel(instructionData : unsigned(63 downto 0) ) return RegisterComponent is
begin
	return RegisterComponent'val(to_integer(instructionData(InstructionSlot_DestRegComponentBitHigh downto InstructionSlot_DestRegComponentBitOffset) ) );
end function;

-- Returns an 8-bit source register index (may be 0-255 because it can include constant buffer registers)
pure function InstructionGetSrcRegAIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcARegIndexBitHigh downto InstructionSlot_SrcARegIndexBitOffset);
end function;

-- Returns a 3-bit source register index (may be 0-7 because this is only register file registers)
pure function InstructionGetSrcRegFileAIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcARegIndexBitOffset+3-1 downto InstructionSlot_SrcARegIndexBitOffset);
end function;

-- Returns an 8-bit source register index (may be 0-255 because it can include constant buffer registers)
pure function InstructionGetSrcRegBIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcBRegIndexBitHigh downto InstructionSlot_SrcBRegIndexBitOffset);
end function;

-- Returns a 3-bit source register index (may be 0-7 because this is only register file registers)
pure function InstructionGetSrcRegFileBIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	return instructionData(InstructionSlot_SrcBRegIndexBitOffset+3-1 downto InstructionSlot_SrcBRegIndexBitOffset);
end function;

-- Returns '1' if the shader core should stall (not issue this instruction yet), or '0' if it is free to issue the instruction
pure function ShouldStallOnOutputCollision(targetWritePipeStage : PipelineOutputState) return std_logic is
begin
	return targetWritePipeStage.Pipe_PortW_wrEnable; -- We need to stall if the target pipe stage is already writing to Port W!
end function;

-- Returns '1' if the input and output collide (using the same register file register at the same time), or '0' if they don't
pure function InputOutputCollisionCheck(inputRegFileChannel : unsigned(1 downto 0); inputRegFileType : RegisterFileRegType; inputRegFileIdx : unsigned(2 downto 0);
											targetWritePipeStage : PipelineOutputState) return std_logic is
begin
	if ( (RegisterComponent'val(to_integer(inputRegFileChannel) ) = targetWritePipeStage.Pipe_PortW_regChan) and 
		(inputRegFileType = targetWritePipeStage.Pipe_PortW_regType) and
		(inputRegFileIdx = targetWritePipeStage.Pipe_PortW_regIdx) and 
		(targetWritePipeStage.Pipe_PortWrite_GPRQuad = 0) ) then
		return '1';
	else
		return '0';
	end if;
end function;

-- Returns '1' if the shader core should stall (not issue this instruction yet), or '0' if it is free to issue the instruction
pure function ShouldStallOnWaitForInputReady(upcomingPipeStages : PortW_PipelineArrayType; instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	for i in 0 to 4 loop
		if (InstructionGetPortAMUXSource(instructionData) = MUXSrc_RegFile) then
			if (InputOutputCollisionCheck(InstructionGetSrcRegAChannel(instructionData), InstructionGetRegFileTypeSrcA(instructionData), InstructionGetSrcRegFileAIndex(instructionData), upcomingPipeStages(i).Pipe_OutputState) = '1') then
				return '1';
			end if;
		end if;
		if (InstructionGetPortBMUXSource(instructionData) = MUXSrc_RegFile) then
			if (InputOutputCollisionCheck(InstructionGetSrcRegBChannel(instructionData), InstructionGetRegFileTypeSrcB(instructionData), InstructionGetSrcRegFileBIndex(instructionData), upcomingPipeStages(i).Pipe_OutputState) = '1') then
				return '1';
			end if;
		end if;
	end loop;
	return '0';
end function;

-- Only call this function if the instruction is already known to read from a constant buffer
pure function InstructionGetConstantRegisterIndex(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	if (InstructionGetSrcRegAType(instructionData) = SRTyp_C) then
		return InstructionGetSrcRegAIndex(instructionData);
	else
		return InstructionGetSrcRegBIndex(instructionData);
	end if;
end function;

-- Only call this function if the instruction is already known to read from a constant buffer
pure function InstructionGetConstantRegisterChannel(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	if (InstructionGetSrcRegAType(instructionData) = SRTyp_C) then
		return InstructionGetSrcRegAChannel(instructionData);
	else
		return InstructionGetSrcRegBChannel(instructionData);
	end if;
end function;

pure function InstructionGetFPUMode(instructionData : unsigned(63 downto 0) ) return unsigned is
begin
	case InstructionGetOperation(instructionData) is
		when Op_MIN =>
			return to_unsigned(eCmpType'pos(CmpMin), 3);
		when Op_MAX =>
			return to_unsigned(eCmpType'pos(CmpMax), 3);
		when Op_SLT =>
			return to_unsigned(eCmpType'pos(CmpSlt), 3);
		when Op_SGE =>
			return to_unsigned(eCmpType'pos(CmpSge), 3);
		when Op_SGN =>
			return to_unsigned(eCmpType'pos(CmpSgn), 3);
		when Op_MOV =>
			return to_unsigned(eCmpType'pos(CmpMov), 3);
		when Op_RND_SINT24Z =>
			return to_unsigned(eConvertMode'pos(F_to_I24_Trunc), 3);
		when Op_RND_SINT23NE =>
			return to_unsigned(eConvertMode'pos(F_to_I23_RoundNearestEven), 3);
		when Op_RND_SINT16NE =>
			return to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3);
		when Op_CNV_UNORM16 =>
			return to_unsigned(eConvertMode'pos(F_to_UNORM16), 3);
		when Op_CNV_UNORM8 =>
			return to_unsigned(eConvertMode'pos(F_to_UNORM8), 3);
		when others =>
			return to_unsigned(0, 3);
	end case;
end function;

pure function InstructionIsFPUAdd(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_ADD =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function InstructionIsFPUMul(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_MUL =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function InstructionIsFPUCmp(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_MIN | Op_MAX | Op_SLT | Op_SGE | Op_SGN | Op_MOV =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function InstructionIsFPUShft(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_SHFT =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function InstructionIsFPUSpec(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_RCP | Op_FRC | Op_EXPP | Op_LOGP | Op_RSQ =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function InstructionIsFPUCnv(instructionData : unsigned(63 downto 0) ) return std_logic is
begin
	case InstructionGetOperation(instructionData) is
		when Op_RND_SINT24Z | Op_RND_SINT23NE | Op_RND_SINT16NE | Op_CNV_UNORM16 | Op_CNV_UNORM8 =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function GetSignBit(portSource : MUXSource; portSrcMod : SourceMod; regFileSignBit : std_logic; constBufferSignBit : std_logic) return std_logic is
begin
	case portSrcMod is
		when SrcMod_None =>
			case portSource is
				when MUXSrc_RegFile =>
					return regFileSignBit;
				when MUXSrc_ConstBuffer =>
					return constBufferSignBit;
				when MUXSrc_NegOneReg =>
					return '1';
				when others =>
					return '0';
			end case;
		when SrcMod_Neg =>
			case portSource is
				when MUXSrc_RegFile =>
					return not regFileSignBit;
				when MUXSrc_ConstBuffer =>
					return not constBufferSignBit;
				when MUXSrc_NegOneReg =>
					return '0';
				when others =>
					return '1';
			end case;
		when SrcMod_Abs =>
			return '0';
		when SrcMod_AbsNeg =>
			return '1';
	end case;
end function;

pure function GetFPUInputMUXDataSource(portSource : MUXSource; regFileData : unsigned(30 downto 0); constBufferData : unsigned(30 downto 0) ) return unsigned is
begin
	case portSource is
		when MUXSrc_RegFile =>
			return regFileData;
		when MUXSrc_ConstBuffer =>
			return constBufferData;
		when MUXSrc_NegOneReg =>
			return to_unsigned(16#3F800000#, 31); -- return the bit representation of 1.0f
		when others =>
			return to_unsigned(0, 31);
	end case;
end function;

pure function GetFPUInputMUX(portSource : MUXSource; portSrcMod : SourceMod; regFileData : unsigned(31 downto 0); constBufferData : unsigned(31 downto 0) ) return unsigned is
begin
	return GetSignBit(portSource, portSrcMod, regFileData(31), constBufferData(31) ) & GetFPUInputMUXDataSource(portSource, regFileData(30 downto 0), constBufferData(30 downto 0) );
end function;

pure function GetStoreOutputValue(PortW_MUX : MUXDest; PortW_DestMod : DestMod; FPU_OUT_RESULT : unsigned(31 downto 0); currentFetchRegisters : unsigned(31 downto 0) ) return unsigned is
begin
	case PortW_DestMod is
		when DestMod_Saturate =>
			case PortW_MUX is
				when MUXDest_ALUResult =>
					if (signed(FPU_OUT_RESULT) < to_signed(0, 32) ) then
						return to_unsigned(0, 32);
					elsif (signed(FPU_OUT_RESULT) > to_signed(16#3F800000#, 32) ) then
						return to_unsigned(16#3F800000#, 32);
					else
						return FPU_OUT_RESULT;
					end if;
				when MUXDest_Special =>
					if (signed(currentFetchRegisters) < to_signed(0, 32) ) then
						return to_unsigned(0, 32);
					elsif (signed(currentFetchRegisters) > to_signed(16#3F800000#, 32) ) then
						return to_unsigned(16#3F800000#, 32);
					else
						return currentFetchRegisters;
					end if;
				when others =>
					return to_unsigned(0, 32);
			end case;
		when others =>
			case PortW_MUX is
				when MUXDest_ALUResult =>
					return FPU_OUT_RESULT;
				when MUXDest_Special =>
					return currentFetchRegisters;
				when others =>
					return to_unsigned(0, 32);
			end case;
	end case;
end function;

pure function ComputeActiveLanesBitmask(ib16indices : unsigned(255 downto 0) ) return unsigned is
	variable retBitmask : unsigned(15 downto 0);
begin
	for i in 0 to 15 loop
		if (ib16indices( (i + 1) * 16 - 1 downto i * 16) = X"FFFF") then
			retBitmask(i) := '0';
		else
			retBitmask(i) := '1';
		end if;
	end loop;
	return retBitmask;
end function;

pure function ComputeActiveLanesCount(activeLanesBitmask : unsigned(15 downto 0) ) return unsigned is
begin
	-- For vertex shaders that always fill all bits from 0 up to the wave size, we can just find the
	-- topmost set bit and use that for the count. However, for pixel/compute shaders we need to actually
	-- sum up the bits because there might be gaps in the middle of the bitmask.


	-- Just assume vertex shaders only for now and find the topmost bit:
	if (activeLanesBitmask(15) = '1') then
		return to_unsigned(16, 5);
	elsif (activeLanesBitmask(14) = '1') then
		return to_unsigned(15, 5);
	elsif (activeLanesBitmask(13) = '1') then
		return to_unsigned(14, 5);
	elsif (activeLanesBitmask(12) = '1') then
		return to_unsigned(13, 5);
	elsif (activeLanesBitmask(11) = '1') then
		return to_unsigned(12, 5);
	elsif (activeLanesBitmask(10) = '1') then
		return to_unsigned(11, 5);
	elsif (activeLanesBitmask(9) = '1') then
		return to_unsigned(10, 5);
	elsif (activeLanesBitmask(8) = '1') then
		return to_unsigned(9, 5);
	elsif (activeLanesBitmask(7) = '1') then
		return to_unsigned(8, 5);
	elsif (activeLanesBitmask(6) = '1') then
		return to_unsigned(7, 5);
	elsif (activeLanesBitmask(5) = '1') then
		return to_unsigned(6, 5);
	elsif (activeLanesBitmask(4) = '1') then
		return to_unsigned(5, 5);
	elsif (activeLanesBitmask(3) = '1') then
		return to_unsigned(4, 5);
	elsif (activeLanesBitmask(2) = '1') then
		return to_unsigned(3, 5);
	elsif (activeLanesBitmask(1) = '1') then
		return to_unsigned(2, 5);
	elsif (activeLanesBitmask(0) = '1') then
		return to_unsigned(1, 5);
	else
		return to_unsigned(0, 5);
	end if;
end function;

-- Returns '1' if any writes are still pending in future pipeline states, or '0' otherwise.
pure function AnyWritesPending(pipelineArray : PortW_PipelineArrayType) return std_logic is
begin
	for i in 0 to PortW_PipelineArrayType'length - 1 loop
		if (pipelineArray(i).Pipe_OutputState.Pipe_PortW_wrEnable = '1') then
			return '1';
		end if;
	end loop;
	return '0';
end function;

pure function MaxFunc(aVal : unsigned(3 downto 0); bVal : unsigned(3 downto 0) ) return unsigned is
begin
	if (aVal > bVal) then
		return aVal;
	else
		return bVal;
	end if;
end function;

pure function ComputeOutputValue(laneIndex : unsigned(1 downto 0); currentOutputInst : OutputInstruction; srcData_PortA : unsigned(127 downto 0); srcData_PortB : unsigned(127 downto 0); destData : unsigned(31 downto 0) ) return unsigned is
	variable srcDataA : unsigned(31 downto 0);
	variable srcDataB : unsigned(31 downto 0);
begin
	case laneIndex is
		when "00" =>
			srcDataA := srcData_PortA(31 downto 0);
			srcDataB := srcData_PortB(31 downto 0);
		when "01" =>
			srcDataA := srcData_PortA(63 downto 32);
			srcDataB := srcData_PortB(63 downto 32);
		when "10" =>
			srcDataA := srcData_PortA(95 downto 64);
			srcDataB := srcData_PortB(95 downto 64);
		when others =>
			srcDataA := srcData_PortA(127 downto 96);
			srcDataB := srcData_PortB(127 downto 96);
	end case;

	case currentOutputInst.destBytes is
		when ODB_Write16B_16A => -- 1 -- result = (sourceB << 16) | (sourceA & 0xFFFF);
			return srcDataB(15 downto 0) & srcDataA(15 downto 0);
		when ODB_Write8B_8A_Low => -- 2 -- result = (sourceB << 8) | (sourceA & 0xFF);
			return X"0000" & srcDataB(7 downto 0) & srcDataA(7 downto 0);
		when ODB_Write8B_8A_High => -- 3 -- result = (sourceB << 24) | (sourceA << 16) | (result & 0xFFFF);
			return srcDataB(7 downto 0) & srcDataA(7 downto 0) & destData(15 downto 0);
		when others => -- 0 -- result = sourceA;
			return srcDataA;
	end case;
end function;

-- The current state of the shader core
signal currentState : eShaderCoreState := initState;

-- This bitmask determines which lanes are currently active (1) and which are inactive (0)
signal activeWaveLanesBitmask : unsigned(15 downto 0) := (others => '0');

-- Counter of how many active lanes there are in this wave (1-16). If this reaches zero then
-- our whole wave is done.
signal numActiveWaveLanesCount : unsigned(4 downto 0) := (others => '0');

-- LoadProgram signals
signal loadProgramAddr : unsigned(29 downto 0) := (others => '0');
signal loadProgramLen : unsigned(15 downto 0) := (others => '0');
signal loadProgramDWORDLow : unsigned(31 downto 0) := (others => '0');
signal loadProgramCurrentDWORD : unsigned(21 downto 0) := (others => '0');
signal setConstantData : unsigned(127 downto 0) := (others => '0');

-- Vertex stream signals
signal numVertexStreams : unsigned(2 downto 0) := (others => '0'); -- How many vertex streams does this shader use?
signal vertexStreams : VertexStreamsArray; -- Our array of vertex stream data
signal vertexScaleProduct : unsigned(21 downto 0) := (others => '0');
signal thisDwordOffset : unsigned(5 downto 0) := (others => '0');

-- FetchVertexStreamData signals
signal currentFetchWave : unsigned(3 downto 0) := (others => '0');
signal currentStreamID : unsigned(2 downto 0) := (others => '0');
signal currentDWORDID : unsigned(2 downto 0) := (others => '0');
signal currentFetchRegisters : unsigned(127 downto 0) := (others => '0');
signal currentColorConvertRegisters0 : unsigned(127 downto 0) := (others => '0');
signal currentColorConvertRegisters1 : unsigned(127 downto 0) := (others => '0');
signal currentColorConvertRegisters2 : unsigned(127 downto 0) := (others => '0');
signal readyToRunShader : std_logic := '0';

-- Shader Execution signals
signal instructionPointer : unsigned(8 downto 0) := (others => '0');
signal currentInstruction : unsigned(63 downto 0) := (others => '0');
signal cyclesRemainingCurrentInstruction : unsigned(3 downto 0) := (others => '0');
signal PortA_MUX : MUXSource := MUXSrc_ZeroReg;
signal PortA_SrcMod : SourceMod := SrcMod_None;
signal PortB_MUX : MUXSource := MUXSrc_ZeroReg;
signal PortB_SrcMod : SourceMod := SrcMod_None;
signal PortW_MUX : MUXDest := MUXDest_ZeroReg;
signal PortW_DestMod : DestMod := DestMod_None;

-- Vertex output signals
signal currentBitOutput : unsigned(3 downto 0) := (others => '0');
signal currentOutputInstructionPointer : unsigned(2 downto 0) := (others => '0');
signal currentOutputDWORDs : OutputRegistersArray := (others => (others => '0') );

-- PortW Pipeline data:
signal Pipe_Data : PortW_PipelineArrayType;

-- Contains our 16 16-bit index values
signal vertexBatchData : VertexIndicesArray;
signal vertexBatchStartingIndex : unsigned(15 downto 0) := (others => '0');
signal vertexBatchEndingIndex : unsigned(15 downto 0) := (others => '0');

begin

ICache_Clk <= clk;

CMD_IsReadyForCommand <= '1' when (currentState = readyState) else '0';
DBG_CurrentState <= std_logic_vector(to_unsigned(eShaderCoreState'pos(currentState), 5) );
DBG_CurrentFetchWave <= std_logic_vector(currentFetchWave);
DBG_CurrentDWORD <= std_logic_vector(currentDWORDID);
DBG_CurrentStreamID <= std_logic_vector(currentStreamID);
DBG_ActiveLanesBitmask <= std_logic_vector(activeWaveLanesBitmask);
ICache_Address <= std_logic_vector(instructionPointer);
DBG_InstructionPointer <= std_logic_vector(instructionPointer);
DBG_CurrentlyExecutingInstruction <= std_logic_vector(currentInstruction);
DBG_CyclesRemainingCurrentInstruction <= std_logic_vector(cyclesRemainingCurrentInstruction);
--DBG_PortA_MUX <= std_logic_vector(to_unsigned(MUXSource'pos(PortA_MUX), 3) );
--DBG_PortB_MUX <= std_logic_vector(to_unsigned(MUXSource'pos(PortB_MUX), 3) );
--DBG_PortW_MUX <= std_logic_vector(to_unsigned(MUXDest'pos(PortW_MUX), 2) );

-- Lane 0, FPU Port A MUX
FPU0_IN_A <= std_logic_vector(GetFPUInputMUX(PortA_MUX, PortA_SrcMod, unsigned(GPR0_PortA_readOutData(31 downto 0) ), unsigned(CB_ReadOutData) ) );

-- Lane 0, FPU Port B MUX
FPU0_IN_B <= std_logic_vector(GetFPUInputMUX(PortB_MUX, PortB_SrcMod, unsigned(GPR0_PortB_readOutData(31 downto 0) ), unsigned(CB_ReadOutData) ) );

-- Lane 0 GPR Port W MUX
GPR0_PortW_writeInData(31 downto 0) <= std_logic_vector(GetStoreOutputValue(PortW_MUX, PortW_DestMod, unsigned(FPU0_OUT_RESULT), currentFetchRegisters(31 downto 0) ) );

-- Lane 1, FPU Port A MUX
FPU1_IN_A <= std_logic_vector(GetFPUInputMUX(PortA_MUX, PortA_SrcMod, unsigned(GPR0_PortA_readOutData(63 downto 32) ), unsigned(CB_ReadOutData) ) );

-- Lane 1, FPU Port B MUX
FPU1_IN_B <= std_logic_vector(GetFPUInputMUX(PortB_MUX, PortB_SrcMod, unsigned(GPR0_PortB_readOutData(63 downto 32) ), unsigned(CB_ReadOutData) ) );

-- Lane 1 GPR Port W MUX
GPR0_PortW_writeInData(63 downto 32) <= std_logic_vector(GetStoreOutputValue(PortW_MUX, PortW_DestMod, unsigned(FPU1_OUT_RESULT), currentFetchRegisters(63 downto 32) ) );

-- Lane 2, FPU Port A MUX
FPU2_IN_A <= std_logic_vector(GetFPUInputMUX(PortA_MUX, PortA_SrcMod, unsigned(GPR0_PortA_readOutData(95 downto 64) ), unsigned(CB_ReadOutData) ) );

-- Lane 2, FPU Port B MUX
FPU2_IN_B <= std_logic_vector(GetFPUInputMUX(PortB_MUX, PortB_SrcMod, unsigned(GPR0_PortB_readOutData(95 downto 64) ), unsigned(CB_ReadOutData) ) );

-- Lane 2 GPR Port W MUX
GPR0_PortW_writeInData(95 downto 64) <= std_logic_vector(GetStoreOutputValue(PortW_MUX, PortW_DestMod, unsigned(FPU2_OUT_RESULT), currentFetchRegisters(95 downto 64) ) );

-- Lane 3, FPU Port A MUX
FPU3_IN_A <= std_logic_vector(GetFPUInputMUX(PortA_MUX, PortA_SrcMod, unsigned(GPR0_PortA_readOutData(127 downto 96) ), unsigned(CB_ReadOutData) ) );

-- Lane 3, FPU Port B MUX
FPU3_IN_B <= std_logic_vector(GetFPUInputMUX(PortB_MUX, PortB_SrcMod, unsigned(GPR0_PortB_readOutData(127 downto 96) ), unsigned(CB_ReadOutData) ) );

-- Lane 3 GPR Port W MUX
GPR0_PortW_writeInData(127 downto 96) <= std_logic_vector(GetStoreOutputValue(PortW_MUX, PortW_DestMod, unsigned(FPU3_OUT_RESULT), currentFetchRegisters(127 downto 96) ) );

process(clk)
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				currentState <= readyState;

			when readyState =>
				CB_Enable <= '0';
				CB_WriteMode <= '0';
				VSC_SetStreamVBAddress <= '0';
				case eShaderCMDPacket'val(to_integer(unsigned(CMD_InCommand) ) ) is
					when SetShaderConstantFCommand =>
						CB_WriteMode <= '1';
						CB_RegIndex <= CMD_SetConstantIndex;
						setConstantData <= unsigned(CMD_SetConstantData);
						CB_RegComponent <= "00";
						CB_WriteInData <= CMD_SetConstantData(31 downto 0);
						CB_Enable <= '1';
						currentState <= setShaderConstantY;

					when LoadProgramCommand =>
						loadProgramAddr <= unsigned(CMD_LoadProgramAddr);
						loadProgramLen <= unsigned(CMD_LoadProgramLen);
						VSC_InvalidateCache <= '1';
						VSC_ReadEnable <= '0';
						currentState <= loadProgramState;

					when IASetVertexStreamCommand =>
						VSC_SetStreamVBAddress <= '1';
						VSC_StreamIndex <= CMD_SetVertexStreamID;
						VSC_StreamVBAddress <= CMD_LoadProgramAddr;
						numVertexStreams <= unsigned(CMD_SetNumVertexStreams);
						vertexStreams(to_integer(unsigned(CMD_SetVertexStreamID) ) ).dwordCount <= unsigned(CMD_SetVertexStreamDWORDCount);
						vertexStreams(to_integer(unsigned(CMD_SetVertexStreamID) ) ).isD3DCOLOR <= CMD_SetVertexStreamIsD3DCOLOR;
						vertexStreams(to_integer(unsigned(CMD_SetVertexStreamID) ) ).shaderRegIndex <= unsigned(CMD_SetVertexStreamShaderRegIndex);
						vertexStreams(to_integer(unsigned(CMD_SetVertexStreamID) ) ).dwordStreamStride <= unsigned(CMD_SetVertexStreamDWORDStride);
						vertexStreams(to_integer(unsigned(CMD_SetVertexStreamID) ) ).dwordStreamOffset <= unsigned(CMD_SetVertexStreamDWORDOffset);
						currentState <= readyState;

					when StartShadingWorkCommand =>
						currentFetchWave <= (others => '0');
						currentStreamID <= (others => '0');
						currentDWORDID <= (others => '0');
						PortW_MUX <= MUXDest_Special; -- Set PortW on the register file MUX to input from the currentFetchRegisters
						currentState <= getVertexBatch;

					when others =>
						-- Do nothing
				end case;
				
			when loadProgramState =>
				VSC_InvalidateCache <= '0';
				VSC_SetStreamVBAddress <= '1';
				VSC_StreamIndex <= (others => '0');
				VSC_StreamVBAddress <= std_logic_vector(loadProgramAddr);
				currentState <= loadProgramStateLoopLow;				

			when loadProgramStateLoopLow =>
				VSC_SetStreamVBAddress <= '0';
				if (loadProgramLen = 0) then
					currentState <= loadProgramStateCleanup;
				else
					VSC_ReadEnable <= '1';
					VSC_ReadStreamIndex <= (others => '0');
					VSC_ReadDWORDAddr <= std_logic_vector(loadProgramCurrentDWORD);
					currentState <= loadProgramStateLoopLowWaitForData;
				end if;

			when loadProgramStateLoopLowWaitForData =>
				VSC_ReadEnable <= '0';
				if (VSC_ReadReady = '1') then
					loadProgramDWORDLow <= unsigned(VSC_ReadData);
					loadProgramCurrentDWORD <= loadProgramCurrentDWORD + 1;
					currentState <= loadProgramStateLoopHigh;
				end if;

			when loadProgramStateLoopHigh =>
				VSC_ReadEnable <= '1';
				VSC_ReadStreamIndex <= (others => '0');
				VSC_ReadDWORDAddr <= std_logic_vector(loadProgramCurrentDWORD);
				currentState <= loadProgramStateLoopHighWaitForData;

			when loadProgramStateLoopHighWaitForData =>
				VSC_ReadEnable <= '0';
				if (VSC_ReadReady = '1') then
					ICache_Enable <= '1';
					ICache_WriteMode <= "1";
					instructionPointer <= loadProgramCurrentDWORD(9 downto 1);
					ICache_WriteData <= VSC_ReadData & std_logic_vector(loadProgramDWORDLow); -- Concat low and high DWORD's together
					loadProgramCurrentDWORD <= loadProgramCurrentDWORD + 1;
					loadProgramLen <= loadProgramLen - 1;
					currentState <= loadProgramStateLoopLow;
				end if;

			when loadProgramStateCleanup =>
				VSC_ReadEnable <= '0';
				ICache_Enable <= '0';
				ICache_WriteMode <= "0";
				currentState <= readyState;

			when setShaderConstantY =>
				CB_RegComponent <= "01";
				CB_WriteInData <= std_logic_vector(setConstantData(63 downto 32) );
				currentState <= setShaderConstantZ;
				
			when setShaderConstantZ =>
				CB_RegComponent <= "10";
				CB_WriteInData <= std_logic_vector(setConstantData(95 downto 64) );
				currentState <= setShaderConstantW;

			when setShaderConstantW =>
				CB_RegComponent <= "11";
				CB_WriteInData <= std_logic_vector(setConstantData(127 downto 96) );
				currentState <= readyState;

			when getVertexBatch =>
				VBO_Pushed <= '0';
				VBO_BatchStartingIndex <= (others => '0');
				VBO_BatchEndingIndex <= (others => '0');
				if (VBB_Done = '1' and VERTBATCH_FIFO_empty = '1') then
					currentState <= readyState; -- All done shading!
				elsif (VERTBATCH_FIFO_empty = '0') then
					for i in 0 to 15 loop
						vertexBatchData(i) <= unsigned(VERTBATCH_FIFO_rd_data(16 * (i + 1) - 1 downto 16 * i) );
					end loop;
					vertexBatchStartingIndex <= unsigned(VERTBATCH_FIFO_rd_data(16 * 17 - 1 downto 16 * 16) );
					vertexBatchEndingIndex <= unsigned(VERTBATCH_FIFO_rd_data(16 * 18 - 1 downto 16 * 17) );
					VERTBATCH_FIFO_rd_en <= '1';
					readyToRunShader <= '0';
					activeWaveLanesBitmask <= ComputeActiveLanesBitmask(unsigned(VERTBATCH_FIFO_rd_data(255 downto 0) ) );
					currentFetchWave <= (others => '0'); -- Reset all of our counters to 0 for the start fetching a new vertex batch
					currentStreamID <= (others => '0');
					currentDWORDID <= (others => '0');
					GPR0_PortW_en <= '0';
					GPR0_PortW_regType <= (others => '0'); -- Set our regtype to "V#"
					GPR0_PortW_regIdx <= (others => '0'); -- Set our regindex to 0
					GPR0_PortW_regChan <= (others => '0'); -- Set our regChan to "X"
					currentState <= fetchVertexStreamData0;
				end if;

			when fetchVertexStreamData0 =>
				VERTBATCH_FIFO_rd_en <= '0';
				GPR0_PortW_en <= '0';
				PortW_MUX <= MUXDest_Special;
				numActiveWaveLanesCount <= ComputeActiveLanesCount(activeWaveLanesBitmask);
				VSC_ReadStreamIndex <= std_logic_vector(currentStreamID);
				vertexScaleProduct <= vertexBatchData(to_integer(currentFetchWave) ) * vertexStreams(to_integer(currentStreamID) ).dwordStreamStride;
				thisDwordOffset <= vertexStreams(to_integer(currentStreamID) ).dwordStreamOffset;

			when fetchVertexStreamData1 =>
				VSC_ReadDWORDAddr <= std_logic_vector(vertexScaleProduct + thisDwordOffset + currentDWORDID);
				VSC_ReadEnable <= '1';
				currentState <= fetchVertexStreamDataWaitForData;

			when fetchVertexStreamDataWaitForData =>
				VSC_ReadEnable <= '0';
				GPR0_PortW_en <= '0';
				if (VSC_ReadReady = '1') then
					currentState <= fetchVertexStreamData0;
					case currentFetchWave(1 downto 0) is
						when "00" =>
							currentFetchRegisters(31 downto 0) <= unsigned(VSC_ReadData);
						when "01" =>
							currentFetchRegisters(63 downto 32) <= unsigned(VSC_ReadData);
						when "10" =>
							currentFetchRegisters(95 downto 64) <= unsigned(VSC_ReadData);
						when others =>
							currentFetchRegisters(127 downto 96) <= unsigned(VSC_ReadData);
					end case;

					GPR0_ReadQuadIndex <= std_logic_vector(currentFetchWave(3 downto 2) );
					GPR0_WriteQuadIndex <= std_logic_vector(currentFetchWave(3 downto 2) );
					GPR0_PortW_regChan <= std_logic_vector(currentDWORDID(1 downto 0) );
					GPR0_PortW_regIdx <= std_logic_vector(vertexStreams(to_integer(currentStreamID) ).shaderRegIndex);

					if (currentFetchWave = 15 or activeWaveLanesBitmask(to_integer(currentFetchWave + 1) ) = '0') then
						currentFetchWave <= (others => '0');
						if (vertexStreams(to_integer(currentStreamID) ).isD3DCOLOR = '1') then
							currentState <= unpackColorData_Lane0;
						else
							currentState <= writeVertexDataToGPR;
						end if;
						if ( (currentDWORDID + 1) = vertexStreams(to_integer(currentStreamID) ).dwordCount) then
							currentDWORDID <= (others => '0');
							if ( (currentStreamID + 1) = numVertexStreams) then
								currentStreamID <= (others => '0');
								readyToRunShader <= '1';
							else
								currentStreamID <= currentStreamID + 1;
							end if;
						else
							currentDWORDID <= currentDWORDID + 1;
						end if;
					else
						if (currentFetchWave(1 downto 0) = "11") then
							if (vertexStreams(to_integer(currentStreamID) ).isD3DCOLOR = '1') then
								currentState <= unpackColorData_Lane0;
							else
								currentState <= writeVertexDataToGPR;
							end if;
						end if;

						currentFetchWave <= currentFetchWave + 1;
					end if;
				end if;

			when writeVertexDataToGPR =>
				GPR0_PortW_en <= '1';
				--GPR0_PortW_writeInData <= std_logic_vector(currentFetchRegisters);
				if (readyToRunShader = '1') then
					currentState <= setupRunShader;
				else
					currentState <= fetchVertexStreamData0;
				end if;

			when unpackColorData_Lane0 =>
				UNORM8ToFloat_Enable <= '1';
				UNORM8ToFloat_ColorIn <= std_logic_vector(currentFetchRegisters(31 downto 0) );
				currentState <= unpackColorData_Lane1;

			when unpackColorData_Lane1 =>
				currentColorConvertRegisters0(31 downto 0) <= unsigned(UNORM8ToFloat_ConvertedX);
				currentColorConvertRegisters0(63 downto 32) <= unsigned(UNORM8ToFloat_ConvertedY);
				currentColorConvertRegisters0(95 downto 64) <= unsigned(UNORM8ToFloat_ConvertedZ);
				currentColorConvertRegisters0(127 downto 96) <= unsigned(UNORM8ToFloat_ConvertedW);
				UNORM8ToFloat_ColorIn <= std_logic_vector(currentFetchRegisters(63 downto 32) );
				currentState <= unpackColorData_Lane2;

			when unpackColorData_Lane2 =>
				currentColorConvertRegisters1(31 downto 0) <= unsigned(UNORM8ToFloat_ConvertedX);
				currentColorConvertRegisters1(63 downto 32) <= unsigned(UNORM8ToFloat_ConvertedY);
				currentColorConvertRegisters1(95 downto 64) <= unsigned(UNORM8ToFloat_ConvertedZ);
				currentColorConvertRegisters1(127 downto 96) <= unsigned(UNORM8ToFloat_ConvertedW);
				UNORM8ToFloat_ColorIn <= std_logic_vector(currentFetchRegisters(95 downto 64) );
				currentState <= unpackColorData_Lane3;

			when unpackColorData_Lane3 =>
				currentColorConvertRegisters2(31 downto 0) <= unsigned(UNORM8ToFloat_ConvertedX);
				currentColorConvertRegisters2(63 downto 32) <= unsigned(UNORM8ToFloat_ConvertedY);
				currentColorConvertRegisters2(95 downto 64) <= unsigned(UNORM8ToFloat_ConvertedZ);
				currentColorConvertRegisters2(127 downto 96) <= unsigned(UNORM8ToFloat_ConvertedW);
				UNORM8ToFloat_ColorIn <= std_logic_vector(currentFetchRegisters(127 downto 96) );
				currentState <= unpackColorData_WriteX;

			when unpackColorData_WriteX =>
				UNORM8ToFloat_Enable <= '0';
				GPR0_PortW_en <= '1';
				currentFetchRegisters <= unsigned(UNORM8ToFloat_ConvertedX) & currentColorConvertRegisters2(31 downto 0) & currentColorConvertRegisters1(31 downto 0) & currentColorConvertRegisters0(31 downto 0);
				GPR0_PortW_regChan <= "00"; -- Set our register channel to X
				currentState <= unpackColorData_WriteY;

			when unpackColorData_WriteY =>
				currentFetchRegisters <= unsigned(UNORM8ToFloat_ConvertedY) & currentColorConvertRegisters2(63 downto 32) & currentColorConvertRegisters1(63 downto 32) & currentColorConvertRegisters0(63 downto 32);
				GPR0_PortW_regChan <= "01"; -- Set our register channel to Y
				currentState <= unpackColorData_WriteZ;

			when unpackColorData_WriteZ =>
				currentFetchRegisters <= unsigned(UNORM8ToFloat_ConvertedZ) & currentColorConvertRegisters2(95 downto 64) & currentColorConvertRegisters1(95 downto 64) & currentColorConvertRegisters0(95 downto 64);
				GPR0_PortW_regChan <= "10"; -- Set our register channel to Z
				currentState <= unpackColorData_WriteW;

			when unpackColorData_WriteW =>
				currentFetchRegisters <= unsigned(UNORM8ToFloat_ConvertedW) & currentColorConvertRegisters2(127 downto 96) & currentColorConvertRegisters1(127 downto 96) & currentColorConvertRegisters0(127 downto 96);
				GPR0_PortW_regChan <= "11"; -- Set our register channel to W
				if (readyToRunShader = '1') then
					currentState <= setupRunShader;
				else
					currentState <= fetchVertexStreamData0;
				end if;

			when setupRunShader =>
				ICache_Enable <= '1';
				ICache_WriteMode <= "0"; -- Set our instruction cache to read-only mode
				CB_WriteMode <= '0'; -- Set the constant buffer to read-only mode
				instructionPointer <= (others => '0'); -- Reset our IP to address 0
				cyclesRemainingCurrentInstruction <= (others => '0'); -- Tell the shader core that it's time to fetch a new instruction
				currentInstruction <= SafeNOPInstruction; -- Set our current instruction to something safe that won't have any side effects or dependencies
				GPR0_PortA_en <= '0';
				GPR0_PortB_en <= '0';
				GPR0_PortW_en <= '0';
				GPR0_PortA_regType <= (others => '0');
				GPR0_PortB_regType <= (others => '0');
				GPR0_PortW_regType <= (others => '0');
				GPR0_PortA_regIdx <= (others => '0');
				GPR0_PortB_regIdx <= (others => '0');
				GPR0_PortW_regIdx <= (others => '0');
				GPR0_PortA_regChan <= (others => '0');
				GPR0_PortB_regChan <= (others => '0');
				GPR0_PortW_regChan <= (others => '0');
				PortA_MUX <= MUXSrc_ZeroReg;
				PortA_SrcMod <= SrcMod_None;
				PortB_MUX <= MUXSrc_ZeroReg;
				PortB_SrcMod <= SrcMod_None;
				PortW_MUX <= MUXDest_ZeroReg;
				PortW_DestMod <= DestMod_None;
				FPUALL_IN_MODE <= (others => '0');
				FPUALL_IADD_GO <= '0';
				FPUALL_ICMP_GO <= '0';
				FPUALL_IMUL_GO <= '0';
				FPUALL_ISHFT_GO <= '0';
				FPUALL_ISPEC_GO <= '0';
				FPUALL_ICNV_GO <= '0';

				-- Initialize the incoming pipeline states with default "do nothing" data
				for i in 0 to PortW_PipelineArrayType'length - 1 loop
					Pipe_Data(i).Pipe_OutputState <= DefaultPipeOutputState;
					Pipe_Data(i).Pipe_FPUState <= DefaultPipeFPUState;
					Pipe_Data(i).Pipe_InputState <= DefaultPipeInputState;
					Pipe_Data(i).Pipe_CBState <= DefaultPipeCBState;
					Pipe_Data(i).Pipe_CurrentOperation <= Op_NOP;
				end loop;

				currentState <= runShader;

			when runShader =>

				-- Move the pipe stages for each of the write port data
				for i in 0 to PortW_PipelineArrayType'length - 2 loop
					Pipe_Data(i) <= Pipe_Data(i + 1);
				end loop;

				-- Initialize the incoming pipe registers with default "do nothing" data
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_OutputState <= DefaultPipeOutputState;
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_FPUState <= DefaultPipeFPUState;
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_InputState <= DefaultPipeInputState;
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_CBState <= DefaultPipeCBState;
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_CurrentOperation <= Op_NOP;

				-- Route the current pipe stage data to our output ports:
				GPR0_PortA_en <= Pipe_Data(0).Pipe_InputState.Pipe_PortA.Pipe_Port_En;
				GPR0_PortA_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(Pipe_Data(0).Pipe_InputState.Pipe_PortA.Pipe_Port_regChan), 2) );
				GPR0_PortA_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(Pipe_Data(0).Pipe_InputState.Pipe_PortA.Pipe_Port_regType), 2) );
				GPR0_PortA_regIdx <= std_logic_vector(Pipe_Data(0).Pipe_InputState.Pipe_PortA.Pipe_Port_regIdx);
				GPR0_PortB_en <= Pipe_Data(0).Pipe_InputState.Pipe_PortB.Pipe_Port_En;
				GPR0_PortB_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(Pipe_Data(0).Pipe_InputState.Pipe_PortB.Pipe_Port_regChan), 2) );
				GPR0_PortB_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(Pipe_Data(0).Pipe_InputState.Pipe_PortB.Pipe_Port_regType), 2) );
				GPR0_PortB_regIdx <= std_logic_vector(Pipe_Data(0).Pipe_InputState.Pipe_PortB.Pipe_Port_regIdx);
				GPR0_PortW_en <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_wrEnable;
				GPR0_PortW_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regChan), 2) );
				GPR0_PortW_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regType), 2) );
				GPR0_PortW_regIdx <= std_logic_vector(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regIdx);
				PortA_MUX <= Pipe_Data(0).Pipe_FPUState.Pipe_PortA_MUX;
				PortA_SrcMod <= Pipe_Data(0).Pipe_FPUState.Pipe_PortA_SrcMod;
				PortB_MUX <= Pipe_Data(0).Pipe_FPUState.Pipe_PortB_MUX;
				PortB_SrcMod <= Pipe_Data(0).Pipe_FPUState.Pipe_PortB_SrcMod;
				PortW_MUX <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_MUX;
				PortW_DestMod <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_DestMod;
				GPR0_WriteQuadIndex <= std_logic_vector(Pipe_Data(0).Pipe_OutputState.Pipe_PortWrite_GPRQuad);
				GPR0_ReadQuadIndex <= std_logic_vector(Pipe_Data(0).Pipe_InputState.Pipe_PortRead_GPRQuad);
				FPUALL_IN_MODE <= std_logic_vector(Pipe_Data(0).Pipe_FPUState.Pipe_IN_MODE);
				FPUALL_IADD_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_IADD_GO;
				FPUALL_ICMP_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_ICMP_GO;
				FPUALL_IMUL_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_IMUL_GO;
				FPUALL_ISHFT_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_ISHFT_GO;
				FPUALL_ISPEC_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_ISPEC_GO;
				FPUALL_ICNV_GO <= Pipe_Data(0).Pipe_FPUState.Pipe_ICNV_GO;
				CB_Enable <= Pipe_Data(0).Pipe_CBState.Pipe_CB_Enable;
				CB_RegIndex <= std_logic_vector(Pipe_Data(0).Pipe_CBState.Pipe_CB_RegIndex);
				CB_RegComponent <= std_logic_vector(Pipe_Data(0).Pipe_CBState.Pipe_CB_RegComponent);
				DBG_OStall <= '0'; -- This may get overridden in case of a stall
				DBG_IStall <= '0'; -- This may get overridden in case of a stall

				if (cyclesRemainingCurrentInstruction = 1) then
					ICache_Enable <= '1';
				else
					ICache_Enable <= '0';
				end if;

				if (cyclesRemainingCurrentInstruction = 0) then -- If we're done executing the previous instruction, then start working on the next one
					if (ShouldStallOnOutputCollision(Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(1, 4) ) ).Pipe_OutputState) = '1' or
						ShouldStallOnOutputCollision(Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(2, 4) ) ).Pipe_OutputState) = '1' or
						ShouldStallOnOutputCollision(Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(3, 4) ) ).Pipe_OutputState) = '1' or
						ShouldStallOnOutputCollision(Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(4, 4) ) ).Pipe_OutputState) = '1') then

						DBG_OStall <= '1';
						cyclesRemainingCurrentInstruction <= cyclesRemainingCurrentInstruction; -- Do not advance the cycles remaining until we are un-stalled!

					elsif (ShouldStallOnWaitForInputReady(Pipe_Data, unsigned(ICache_ReadData) ) = '1') then

						DBG_IStall <= '1';
						cyclesRemainingCurrentInstruction <= cyclesRemainingCurrentInstruction; -- Do not advance the cycles remaining until we are un-stalled!

					else -- if no stalls, issue our new instruction!

						currentInstruction <= unsigned(ICache_ReadData);
						instructionPointer <= instructionPointer + 1; -- Don't forget to increment our instruction pointer just once per instruction!

						for i in 0 to 4 loop
							Pipe_Data(i).Pipe_CurrentOperation <= InstructionGetOperation(unsigned(ICache_ReadData) );
						end loop;

						if (InstructionUsesConstBuffer(unsigned(ICache_ReadData) ) = '1') then
							Pipe_Data(0).Pipe_CBState.Pipe_CB_Enable <= '1';
							Pipe_Data(0).Pipe_CBState.Pipe_CB_RegIndex <= InstructionGetConstantRegisterIndex(unsigned(ICache_ReadData) );
							Pipe_Data(0).Pipe_CBState.Pipe_CB_RegComponent <= InstructionGetConstantRegisterChannel(unsigned(ICache_ReadData) );
						else
							Pipe_Data(0).Pipe_CBState <= DefaultPipeCBState;
						end if;

						for i in 1 to 4 loop
							Pipe_Data(i).Pipe_FPUState.Pipe_IN_MODE <= InstructionGetFPUMode(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_IADD_GO <= InstructionIsFPUAdd(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_ICMP_GO <= InstructionIsFPUCmp(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_IMUL_GO <= InstructionIsFPUMul(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_ISHFT_GO <= InstructionIsFPUShft(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_ISPEC_GO <= InstructionIsFPUSpec(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_ICNV_GO <= InstructionIsFPUCnv(unsigned(ICache_ReadData) );	
							Pipe_Data(i).Pipe_FPUState.Pipe_PortA_MUX <= InstructionGetPortAMUXSource(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_PortA_SrcMod <= InstructionGetPortASrcMod(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_PortB_MUX <= InstructionGetPortBMUXSource(unsigned(ICache_ReadData) );
							Pipe_Data(i).Pipe_FPUState.Pipe_PortB_SrcMod <= InstructionGetPortBSrcMod(unsigned(ICache_ReadData) );
						end loop;

						if (InstructionGetPortAMUXSource(unsigned(ICache_ReadData) ) = MUXSrc_RegFile) then
							for i in 0 to 3 loop
								Pipe_Data(i).Pipe_InputState.Pipe_PortA.Pipe_Port_En <= '1';
								Pipe_Data(i).Pipe_InputState.Pipe_PortA.Pipe_Port_regIdx <= InstructionGetSrcRegFileAIndex(unsigned(ICache_ReadData) );
								Pipe_Data(i).Pipe_InputState.Pipe_PortA.Pipe_Port_regChan <= RegisterComponent'val(to_integer(InstructionGetSrcRegAChannel(unsigned(ICache_ReadData) ) ) );
								Pipe_Data(i).Pipe_InputState.Pipe_PortA.Pipe_Port_regType <= InstructionGetRegFileTypeSrcA(unsigned(ICache_ReadData) );
							end loop;
						else
							for i in 0 to 3 loop
								Pipe_Data(i).Pipe_InputState.Pipe_PortA <= DefaultPipeGPRPortInputState;
							end loop;
						end if;
						if (InstructionGetPortBMUXSource(unsigned(ICache_ReadData) ) = MUXSrc_RegFile) then
							for i in 0 to 3 loop
								Pipe_Data(i).Pipe_InputState.Pipe_PortB.Pipe_Port_En <= '1';
								Pipe_Data(i).Pipe_InputState.Pipe_PortB.Pipe_Port_regIdx <= InstructionGetSrcRegFileBIndex(unsigned(ICache_ReadData) );
								Pipe_Data(i).Pipe_InputState.Pipe_PortB.Pipe_Port_regChan <= RegisterComponent'val(to_integer(InstructionGetSrcRegBChannel(unsigned(ICache_ReadData) ) ) );
								Pipe_Data(i).Pipe_InputState.Pipe_PortB.Pipe_Port_regType <= InstructionGetRegFileTypeSrcB(unsigned(ICache_ReadData) );
							end loop;
						else
							for i in 0 to 3 loop
								Pipe_Data(i).Pipe_InputState.Pipe_PortB <= DefaultPipeGPRPortInputState;
							end loop;
						end if;

						if (InstructionGetDestRegType(unsigned(ICache_ReadData) ) /= DRTyp_NULL) then
							for i in 1 to 4 loop
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_wrEnable <= '1';
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_regChan <= InstructionGetDestRegWChannel(unsigned(ICache_ReadData) );
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_regIdx <= InstructionGetDestRegWIndex(unsigned(ICache_ReadData) );
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_regType <= InstructionGetRegFileTypeDestW(unsigned(ICache_ReadData) );
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortWrite_GPRQuad <= to_unsigned(i - 1, 2);
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_MUX <= InstructionGetPortWMUXDest(unsigned(ICache_ReadData) );
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState.Pipe_PortW_DestMod <= InstructionGetPortWDestMod(unsigned(ICache_ReadData) );
							end loop;
						else
							for i in 1 to 4 loop
								Pipe_Data(to_integer(InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) + to_unsigned(i, 4) ) ).Pipe_OutputState <= DefaultPipeOutputState;
							end loop;
						end if;

						-- Min of 4 cycles because we need to run through four GPR Quads per instruction in order to write them all
						cyclesRemainingCurrentInstruction <= MaxFunc(to_unsigned(4, 4), InstructionGetCycleLatency(InstructionGetOperation(unsigned(ICache_ReadData) ) ) );

						for i in 0 to 3 loop
							Pipe_Data(i).Pipe_InputState.Pipe_PortRead_GPRQuad <= to_unsigned(i, 2);
						end loop;

						if (InstructionGetOperation(unsigned(ICache_ReadData) ) = Op_END) then
							currentState <= waitForWritesToComplete;
						end if;
					end if;
				else -- if (cyclesRemainingCurrentInstruction = 0)
					cyclesRemainingCurrentInstruction <= cyclesRemainingCurrentInstruction - 1;
				end if;

			when waitForWritesToComplete =>
				GPR0_PortA_en <= '0';
				GPR0_PortB_en <= '0';
				FPUALL_IADD_GO <= '0';
				FPUALL_ICMP_GO <= '0';
				FPUALL_IMUL_GO <= '0';
				FPUALL_ISHFT_GO <= '0';
				FPUALL_ISPEC_GO <= '0';
				FPUALL_ICNV_GO <= '0';

				-- Move the pipe stages for each of the write port data
				for i in 0 to PortW_PipelineArrayType'length - 2 loop
					Pipe_Data(i) <= Pipe_Data(i + 1);
				end loop;
				Pipe_Data(PortW_PipelineArrayType'length - 1).Pipe_OutputState.Pipe_PortW_wrEnable <= '0';

				GPR0_PortW_en <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_wrEnable;
				GPR0_PortW_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regChan), 2) );
				GPR0_PortW_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regType), 2) );
				GPR0_PortW_regIdx <= std_logic_vector(Pipe_Data(0).Pipe_OutputState.Pipe_PortW_regIdx);
				PortW_MUX <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_MUX;
				PortW_DestMod <= Pipe_Data(0).Pipe_OutputState.Pipe_PortW_DestMod;
				GPR0_WriteQuadIndex <= std_logic_vector(Pipe_Data(0).Pipe_OutputState.Pipe_PortWrite_GPRQuad);
				if (AnyWritesPending(Pipe_Data) = '0') then
					currentBitOutput <= (others => '0');
					currentOutputInstructionPointer <= (others => '0');
					currentState <= collectShaderResults;
				end if;

			when collectShaderResults =>
				GPR0_PortA_en <= '0';
				GPR0_PortB_en <= '0';
				GPR0_PortW_en <= '0';
				FPUALL_IADD_GO <= '0';
				FPUALL_ICMP_GO <= '0';
				FPUALL_IMUL_GO <= '0';
				FPUALL_ISHFT_GO <= '0';
				FPUALL_ISPEC_GO <= '0';
				FPUALL_ICNV_GO <= '0';
				VERTOUT_FIFO_wr_en <= '0';
				VBO_Pushed <= '0';
				VBO_BatchStartingIndex <= (others => '0');
				VBO_BatchEndingIndex <= (others => '0');

				if (activeWaveLanesBitmask(to_integer(currentBitOutput) ) = '0' and VBO_Ready = '1') then
					currentBitOutput <= (others => '0');
					VBO_Pushed <= '1';
					VBO_BatchStartingIndex <= std_logic_vector(vertexBatchStartingIndex);
					VBO_BatchEndingIndex <= std_logic_vector(vertexBatchEndingIndex);
					currentState <= getVertexBatch;
				else
					if (currentOutputInstructionPointer < DefaultOutputInstructionStream'length) then
						GPR0_ReadQuadIndex <= std_logic_vector(currentBitOutput(3 downto 2) );
						GPR0_PortA_en <= '1';
						GPR0_PortB_en <= '1';
						GPR0_PortA_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(RFType_OOutput), 2) );
						GPR0_PortB_regType <= std_logic_vector(to_unsigned(RegisterFileRegType'pos(RFType_OOutput), 2) );
						GPR0_PortA_regIdx <= std_logic_vector(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer) ).readRegIdx);
						GPR0_PortB_regIdx <= std_logic_vector(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer) ).readRegIdx);
						GPR0_PortA_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer) ).regComponent_PortA), 2) );
						GPR0_PortB_regChan <= std_logic_vector(to_unsigned(RegisterComponent'pos(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer) ).regComponent_PortB), 2) );
					else
						GPR0_PortA_en <= '0';
						GPR0_PortB_en <= '0';
					end if;

					if (currentOutputInstructionPointer > 0) then
						currentOutputDWORDs(to_integer(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer - 1) ).resultDWORDIdx) ) <= 
							ComputeOutputValue(currentBitOutput(1 downto 0), DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer - 1) ), unsigned(GPR0_PortA_readOutData), unsigned(GPR0_PortB_readOutData),
								currentOutputDWORDs(to_integer(DefaultOutputInstructionStream(to_integer(currentOutputInstructionPointer - 1) ).resultDWORDIdx) ) );
					end if;

					if (currentOutputInstructionPointer = DefaultOutputInstructionStream'length) then
						currentState <= submitShaderResults;
						currentBitOutput <= currentBitOutput + 1;
						currentOutputInstructionPointer <= (others => '0');
					else
						currentOutputInstructionPointer <= currentOutputInstructionPointer + 1;
					end if;
				end if;

			when submitShaderResults =>
				if (VERTOUT_FIFO_full = '0' and VBO_Ready = '1') then
					VERTOUT_FIFO_wr_data(31 downto 0) <= std_logic_vector(currentOutputDWORDs(0) );
					VERTOUT_FIFO_wr_data(63 downto 32) <= std_logic_vector(currentOutputDWORDs(1) );
					VERTOUT_FIFO_wr_data(95 downto 64) <= std_logic_vector(currentOutputDWORDs(2) );
					VERTOUT_FIFO_wr_data(127 downto 96) <= std_logic_vector(currentOutputDWORDs(3) );
					VERTOUT_FIFO_wr_en <= '1';
					currentState <= collectShaderResults;
				end if;

			when others =>
		end case;
	end if;
end process;

end Behavioral;