#include "DeviceShaderBytecode.h"
#include <vector>

static const unsigned char ADD_CYCLES = 4u;
static const unsigned char MUL_CYCLES = 5u;
static const unsigned char CMP_CYCLES = 1u;
static const unsigned char CNV_CYCLES = 3u;
static const unsigned char SHFT_CYCLES = 1u;
static const unsigned char BIT_CYCLES = 1u;
static const unsigned char SPEC_CYCLES = 14u;

// The GPR register file's access latency is 3 cycles currently
static const unsigned char CycleLatency_GPRQuad = 3u;

const unsigned char GetPipeLatency(const InstructionExecutionPipe exePipe)
{
	switch (exePipe)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown execution pipe specified!
#endif
	case ExePipe_None: // Non-pipe instructions (NOP, END, etc.)
		return 1u; // NOP and END and things like that only consume one cycle directly
	case ExePipe_Add: // Addition pipe
		return ADD_CYCLES;
	case ExePipe_Mul: // Multiplication pipe
		return MUL_CYCLES;
	case ExePipe_Cmp: // Comparisons pipe
		return CMP_CYCLES;
	case ExePipe_Cnv: // Conversion pipe
		return CNV_CYCLES;
	case ExePipe_Shift: // Shifts pipe
		return SHFT_CYCLES;
	case ExePipe_Bit: // Bitwise ops pipe
		return BIT_CYCLES;
	case ExePipe_Spec: // Specials pipe
		return SPEC_CYCLES;
	}
}

const InstructionExecutionPipe GetPipeFromInstructionOp(const InstructionOperation opcode)
{
	switch (opcode)
	{
	case Op_ADD:
		return ExePipe_Add;
	case Op_MUL:
		return ExePipe_Mul;
	case Op_MIN:
	case Op_MAX:
	case Op_SLT:
	case Op_SGE:
	case Op_SGN:
	case Op_MOV:
		return ExePipe_Cmp;
	case Op_BSHFTL8:
	case Op_BSHFTL16:
	case Op_BSHFTL24:
	case Op_BSHFTR8:
	case Op_BSHFTR16:
	case Op_BSHFTR24:
	case Op_OR:
	case Op_AND:
		return ExePipe_Bit;
	case Op_SHFT:
		return ExePipe_Shift;
	case Op_RCP:
	case Op_EXPP:
	case Op_LOGP:
	case Op_RSQ:
		return ExePipe_Spec;
	case Op_FRC:
	case Op_RND_UINT24NE:
	case Op_RND_SINT16NE:
	case Op_CNV_UNORM16:
	case Op_CNV_UNORM8:
	case Op_CNV_F_TO_HALF:
	case Op_CNV_HALF_TO_F:
	case Op_CNV_U32_TO_F:
		return ExePipe_Cnv;
	default:
	case Op_Unused14: // Fallthrough
#ifdef _DEBUG
		__debugbreak(); // We should never be emitting shader bytecode with unused/unknown/invalid opcodes
#endif
	case Op_NOP:
	case Op_END:
		return ExePipe_None;
	}
}

static const unsigned char PipelineMaxSize = SPEC_CYCLES + 4 + CycleLatency_GPRQuad + 1 + 1;

struct PipelineOutputStageSim
{
	PipelineOutputStageSim()
	{
		wrEnable = false;
		gprQuad = 0;
		regType = DRTyp_X;
		regIndex = 7;
		regChan = Chan_X;
	}

	unsigned short wrEnable : 1;
	unsigned short regChan : 2;
	unsigned short regType : 2;
	unsigned short regIndex : 3;
	unsigned short gprQuad : 2;
};

void AdvancePipeline(PipelineOutputStageSim (&pipeStages)[PipelineMaxSize])
{
	for (unsigned char x = 0; x < PipelineMaxSize - 2; ++x)
	{
		pipeStages[x] = pipeStages[x + 1];
	}
	pipeStages[PipelineMaxSize-1] = PipelineOutputStageSim();
}

const bool ShouldStallOnReadWriteConflict(const unsigned char readChannel, const unsigned char readRegIndex, const unsigned char readRegType, const PipelineOutputStageSim& testStage)
{
	return testStage.regType == readRegType && 
		testStage.regIndex == readRegIndex && 
		testStage.regChan == readChannel && 
		testStage.gprQuad == 0;
}

const bool IsSourceRegisterFile(const InstructionSrcRegType srcRegType)
{
	switch (srcRegType)
	{
	case SRTyp_R: // R GPR registers
	case SRTyp_V: // V input registers (are part of the register file)
	case SRTyp_X: // X special registers (are also part of the register file)
		return true;
	default:
		return false;
	}
}

// Returns false if there are no conflicts and we can issue the next instruction
// Returns true if there is a read/write conflict and we need to stall
const bool CheckReadWriteConflicts(const PipelineOutputStageSim (&pipeStages)[PipelineMaxSize], const instructionSlot nextInstruction)
{
	for (unsigned char x = 0; x < PipelineMaxSize - 1; ++x)
	{
		const PipelineOutputStageSim& thisStage = pipeStages[x];
		if (IsSourceRegisterFile(nextInstruction.instructionStruct.srcRegA_regType) )
		{
			if (ShouldStallOnReadWriteConflict(nextInstruction.instructionStruct.srcRegA_component, nextInstruction.instructionStruct.srcRegA_regIndex, nextInstruction.instructionStruct.srcRegA_regType, thisStage) )
			{
				return true;
			}
		}
		if (IsSourceRegisterFile(nextInstruction.instructionStruct.srcRegB_regType) )
		{
			if (ShouldStallOnReadWriteConflict(nextInstruction.instructionStruct.srcRegB_component, nextInstruction.instructionStruct.srcRegB_regIndex, nextInstruction.instructionStruct.srcRegB_regType, thisStage) )
			{
				return true;
			}
		}
	}
	return false;
}

// Simulates the pipeline of the compiled shader to determine how many cycles executing this shader will take and how many cycles will be wasted due to waits/stalls
const unsigned short SimulateShaderCycles(const std::vector<instructionSlot>& inFinalDeviceInstructionStream, unsigned short& outCyclesWastedToWaits)
{
	PipelineOutputStageSim pipeStages[PipelineMaxSize];
	unsigned char cyclesRemainingCurrentInstruction = 0u;

	unsigned short shaderCycles = 0u;
	unsigned short outputStallCycles = 0u;
	unsigned short dependentReadStallCycles = 0u;
	const unsigned numShaderInstructions = (const unsigned)(inFinalDeviceInstructionStream.size() );
	for (unsigned nextInstructionIndex = 0; nextInstructionIndex < numShaderInstructions;)
	{
		const instructionSlot nextInstruction = inFinalDeviceInstructionStream[nextInstructionIndex];

		const InstructionExecutionPipe exePipe = GetPipeFromInstructionOp(nextInstruction.instructionStruct.operation);
		unsigned short instructionBaseLatency = 0u;
		if (exePipe == ExePipe_None)
		{
			instructionBaseLatency = 1u;
		}
		else
		{
			instructionBaseLatency = GetPipeLatency(exePipe);
		}

		AdvancePipeline(pipeStages);
		++shaderCycles;
		if (cyclesRemainingCurrentInstruction == 0)
		{
			// Check for an output collision (we can't write while the previous instruction is still finishing its writes)
			if (pipeStages[instructionBaseLatency + CycleLatency_GPRQuad + 1u].wrEnable ||
				pipeStages[instructionBaseLatency + CycleLatency_GPRQuad + 2u].wrEnable ||
				pipeStages[instructionBaseLatency + CycleLatency_GPRQuad + 3u].wrEnable ||
				pipeStages[instructionBaseLatency + CycleLatency_GPRQuad + 4u].wrEnable)
			{
				// Stall due to output collision
				++outputStallCycles;
			}
			else if (CheckReadWriteConflicts(pipeStages, nextInstruction) )
			{
				// Stall due to read/write collision (can't issue a read until dependent writes have completed first)
				++dependentReadStallCycles;
			}
			else
			{
				// No stalls! We can issue the next instruction after all :)
				++nextInstructionIndex;
				if (nextInstruction.instructionStruct.destReg_regType != DRTyp_NULL) // If this next instruction writes to an output register...
				{
					for (unsigned stageID = CycleLatency_GPRQuad + 1; stageID <= CycleLatency_GPRQuad + 4; ++stageID)
					{
						PipelineOutputStageSim& futurePipelineStage = pipeStages[instructionBaseLatency + stageID];
						futurePipelineStage.wrEnable = true;
						futurePipelineStage.gprQuad = stageID - CycleLatency_GPRQuad - 1;
						futurePipelineStage.regChan = nextInstruction.instructionStruct.destReg_component;
						futurePipelineStage.regIndex = nextInstruction.instructionStruct.destReg_regIndex;
						futurePipelineStage.regType = nextInstruction.instructionStruct.destReg_regType;
					}
				}
				else
				{
					for (unsigned stageID = CycleLatency_GPRQuad + 1; stageID <= CycleLatency_GPRQuad + 4; ++stageID)
					{
						pipeStages[instructionBaseLatency + stageID] = PipelineOutputStageSim();
					}
				}

				// Break out when we find the final instruction in the instruction stream (END doesn't actually get executed):
				if (nextInstruction.instructionStruct.operation == Op_END)
				{
					break;
				}

				// Instructions that take less than 7 cycles to execute will be scheduled for a minimumm of 7 cycles to allow for 3-cycle read latency and 4 write cycles
				cyclesRemainingCurrentInstruction = instructionBaseLatency < 7 ? 7 : instructionBaseLatency;
			}
		}
		else
		{
			--cyclesRemainingCurrentInstruction;
		}
	}

	outCyclesWastedToWaits = outputStallCycles + dependentReadStallCycles;
	return shaderCycles;
}
