/*
This file contains conversion functions from D3D9 enums and structs to our device-specific enums and structs.
*/

#pragma once
#include "DeviceShaderBytecode.h"
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"

// Starts with Nop=0, ends with End=(~0) (all bits set)
const InstructionOperation GetInstructionOperation(const instructionToken& d3dInstruction);

// Dest reg type is one of: r#/x#/o#/nulloutput
const InstructionDestRegType GetDestRegType(const dstParameterToken& d3dDestReg);

// Dest reg index is only 3 bits, so can only be between 0 to 7
const unsigned char GetDestRegIndex(const dstParameterToken& d3dDestReg);

// Dest reg modifier is either None or Saturate
const InstructionDestRegModifier GetDestRegModifier(const dstParameterToken& d3dDestReg);

// Dest reg component is X/Y/Z/W
const InstructionRegComponent GetDestRegComponent(const dstParameterToken& d3dDestReg);

// Source reg type is one of: r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
const InstructionSrcRegType GetSrcRegType(const srcParameterToken& d3dSrcReg);

// Source reg index is 8 bits, so can be from 0 to 255 (for constant registers) or between 0 to 7 (for GPR's)
const unsigned char GetSrcRegIndex(const srcParameterToken& d3dSrcReg);

// Source reg modifier is one of: None/Neg/Abs/AbsNeg
const InstructionSrcRegModifier GetSrcRegModifier(const srcParameterToken& d3dSrcReg);

// Source reg component is X/Y/Z/W
const InstructionRegComponent GetSrcRegComponent(const srcParameterToken& d3dSrcReg);
