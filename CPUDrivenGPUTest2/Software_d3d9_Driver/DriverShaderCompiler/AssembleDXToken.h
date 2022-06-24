#pragma once

#include "..\Software_d3d9_Driver\ShaderBase.h"

// Assembles an instruction token:
const instructionToken AssembleInstructionToken(const struct ShaderInfo& inDXShaderInfo, const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode, const unsigned char numRelativeAddrTokens = 0);

// The full version that lets you customize the entire source token (separate swizzle version):
const srcParameterToken AssembleSourceParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, 
	const debuggableSwizzleChannel swizzleChannelR = sourceX, const debuggableSwizzleChannel swizzleChannelG = sourceY, const debuggableSwizzleChannel swizzleChannelB = sourceZ, const debuggableSwizzleChannel swizzleChannelA = sourceW, 
	const debuggableSourceModifierType srcMod = SM_None, const bool usesRelativeAddressing = false);

// The full version that lets you customize the entire source token (packed swizzle version):
const srcParameterToken AssembleSourceParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, 
	const debuggableFullSwizzle swizzle = _NoSwizzleRGBA, const debuggableSourceModifierType srcMod = SM_None, const bool usesRelativeAddressing = false);

// A simplified source token assembly function that expects a replicate swizzle (.rrrr, .gggg, .bbbb, or .aaaa):
const srcParameterToken AssembleSourceParameterTokenReplicateSwizzle(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, const debuggableSwizzleChannel replicateChannelIndex = sourceX,
	const debuggableSourceModifierType srcMod = SM_None, const bool usesRelativeAddressing = false);

// An even more simplified source token assembly function that uses the default identity swizzle (.rgba):
const srcParameterToken AssembleSourceParameterTokenNoSwizzle(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex,
	const debuggableSourceModifierType srcMod = SM_None, const bool usesRelativeAddressing = false);

// Assembles a destination token:
const dstParameterToken AssembleDestParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, const writeMaskType writeMask = WM_ALL, const resultModifierType destMod = RM_None, const signed char shiftScale = 0, const bool usesRelativeAddressing = false);