#include "AssembleDXHelpers.h"
#include "AssembleDXToken.h"

// Memcpy helper for DWORD tokens
void MemcpyTokens(const instructionToken* const copySourceBaseStartingToken, const unsigned DWORDTokenCount, anyToken* const copyDestination)
{
	for (unsigned dword = 0; dword < DWORDTokenCount; ++dword)
	{
		copyDestination[dword] = ( (const anyToken* const)copySourceBaseStartingToken)[dword];
	}
}

// Rebases all of the instruction start pointers in the given vector to be offset from the newBasePtr
void RebaseInstructionStartPointers(std::vector<const instructionToken*>& outRebaseInstructionStartPtrs, const anyToken* const newBasePtr)
{
	const unsigned numStartsToRebase = (const unsigned)outRebaseInstructionStartPtrs.size();
	for (unsigned startIndex = 0; startIndex < numStartsToRebase; ++startIndex)
	{
		const instructionToken*& thisInstructionStart = outRebaseInstructionStartPtrs[startIndex];
		thisInstructionStart = (const instructionToken* const)( ( (const size_t)thisInstructionStart) + ( (const char* const)newBasePtr) );
	}
}

// "Unbases" the given pointer from being an absolute pointer offset from 0x0 to being a relative pointer offset from basePtr. Returns the unbased pointer.
const instructionToken* const GetUnbasedInstructionStartPointer(const anyToken* const instructionStartPtr, const anyToken* const basePtr)
{
#ifdef _DEBUG
	if ( (const char* const)instructionStartPtr < (const char* const)basePtr)
	{
		__debugbreak(); // Error: Cannot have an instruction start pointer that's before the base address!
	}
#endif
	const size_t bytesOffsetFromBase = (const char* const)instructionStartPtr - (const char* const)basePtr;
	return reinterpret_cast<const instructionToken* const>(bytesOffsetFromBase);
}

// Copies all of the tokens for an instruction (instruction token, dst token, src tokens, relative addressing tokens, etc.) from one token stream to another
void CopyInstructionToNewInstructionStream(std::vector<anyToken>& outCopyDestInstructionStream, std::vector<const instructionToken*>& outCopyDestUnbasedInstructionStartPtrs, const instructionToken* const inCopySrcInstruction, const ShaderInfo& inDXShaderInfo)
{
	const unsigned newInstructionStartDWORDIndex = (const unsigned)outCopyDestInstructionStream.size();
	const unsigned instructionDWORDCount = GetInstructionDWORDCount(inCopySrcInstruction, inDXShaderInfo);
	for (unsigned x = 0; x < instructionDWORDCount; ++x)
	{
		outCopyDestInstructionStream.push_back(anyToken() );
	}
	MemcpyTokens(inCopySrcInstruction, instructionDWORDCount, &(outCopyDestInstructionStream[newInstructionStartDWORDIndex]) );
	const instructionToken* const newUnbasedInstructionStart = GetUnbasedInstructionStartPointer(&(outCopyDestInstructionStream[newInstructionStartDWORDIndex]), &outCopyDestInstructionStream.front() );
	outCopyDestUnbasedInstructionStartPtrs.push_back(newUnbasedInstructionStart);
}

void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const instructionToken& inAppendToken)
{
	anyToken newToken;
	newToken.instruction = inAppendToken;
	outTokenStream.push_back(newToken);
}

void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const srcParameterToken& inAppendToken)
{
	anyToken newToken;
	newToken.src = inAppendToken;
	outTokenStream.push_back(newToken);
}

void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const dstParameterToken& inAppendToken)
{
	anyToken newToken;
	newToken.dst = inAppendToken;
	outTokenStream.push_back(newToken);
}

// Appends a new unbased instruction start pointer to the end of the outInstructionStartPtrs assuming that the new instruction will be inserted to the end of the tokenStream after calling this function
void AppendNewInstructionStartToTokenStartPtrs(std::vector<const instructionToken*>& outInstructionStartPtrs, const std::vector<anyToken>& tokenStream)
{
	const unsigned byteOffset = (const unsigned)tokenStream.size() * sizeof(anyToken);
	const unsigned char* const nullBaseOffsetPointer = NULL;
	const instructionToken* const unbasedNewInstructionPtr = reinterpret_cast<const instructionToken* const>(nullBaseOffsetPointer + byteOffset);
	outInstructionStartPtrs.push_back(unbasedNewInstructionPtr);
}

const instructionToken CopyExistingInstructionToken(const ShaderInfo& inDXShaderInfo, const instructionToken existingInstructionToken)
{
#ifdef _DEBUG
	const instructionToken assembledDebugToken = AssembleInstructionToken(inDXShaderInfo, existingInstructionToken.opcode);
	if (*reinterpret_cast<const DWORD* const>(&assembledDebugToken) != *reinterpret_cast<const DWORD* const>(&existingInstructionToken) )
	{
		__debugbreak(); // Error: These two should match exactly! There may be a bug in assembly logic!
	}
#endif
	return existingInstructionToken;
}

const dstParameterToken CopyExistingDestParameterToken(const ShaderInfo& inDXShaderInfo, const dstParameterToken existingDestToken)
{
#ifdef _DEBUG
	// Run validation in debug builds to make sure that it's legal to use this existing token in the context of this shader model and source/dest register:
	const dstParameterToken assembledDebugToken = AssembleDestParameterToken(inDXShaderInfo, existingDestToken.GetRegisterType(), existingDestToken.GetRegisterIndex(), (const writeMaskType)existingDestToken.GetWriteMask(), (const resultModifierType)existingDestToken.GetResultModifier(), (const signed char)existingDestToken.GetResultShiftScale() );
	if (assembledDebugToken.internalRawToken != existingDestToken.internalRawToken)
	{
		__debugbreak(); // Error: These two should match exactly! There may be a bug in assembly logic!
	}
#endif
	return existingDestToken;
}

const srcParameterToken CopyExistingSourceParameterToken(const ShaderInfo& inDXShaderInfo, const srcParameterToken existingSrcToken)
{
#ifdef _DEBUG
	// Run validation in debug builds to make sure that it's legal to use this existing token in the context of this shader model and source/dest register:
	const srcParameterToken assembledDebugToken = AssembleSourceParameterToken(inDXShaderInfo, existingSrcToken.GetRegisterType(), existingSrcToken.GetRegisterIndex(), (const debuggableFullSwizzle)existingSrcToken.GetSwizzle(), existingSrcToken.srcParameter.sourceModifier);
	if (assembledDebugToken.internalRawToken != existingSrcToken.internalRawToken)
	{
		__debugbreak(); // Error: These two should match exactly! There may be a bug in assembly logic!
	}
#endif
	return existingSrcToken;
}

// Returns true if the dst and src register are the same (same register type and same register index)
const bool RegistersAreSame(const dstParameterToken destReg, const srcParameterToken srcReg)
{
	return (destReg.GetRegisterType() == srcReg.GetRegisterType() ) &&
		(destReg.GetRegisterIndex() == srcReg.GetRegisterIndex() );
}

// Gets the index of the first set write channel in the writemask
const unsigned char GetFirstWriteChannelIndex(const dstParameterToken destReg)
{
	const unsigned char writeMask = destReg.GetWriteMask();
#ifdef _DEBUG
	if (writeMask == 0)
	{
		__debugbreak(); // Should never be here!
	}
	if (writeMask > 0xF)
	{
		__debugbreak(); // Should never be here!
	}
#endif
	for (unsigned char x = 0; x < 4; ++x)
	{
		const unsigned char thisChannelMask = 1 << x;
		if (writeMask & thisChannelMask)
			return x;
	}
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
	return 0;
}

// Helper function to extract one specific channel's source swizzle given a full source swizzle:
const debuggableSwizzleChannel GetSourceSwizzleChannelHelper(const debuggableFullSwizzle fullSourceSwizzle, const unsigned char channelIndex)
{
#ifdef _DEBUG
	if (channelIndex > sourceW)
	{
		__debugbreak(); // Error: Out of range channel index!
	}
#endif
	return (const debuggableSwizzleChannel)( (fullSourceSwizzle >> (channelIndex * 2) ) & 0x3);
}

// Returns how many DWORD's this instruction consumes, *including* the instructionToken itself. So this function can never return 0, it can only return numbers 1 and up.
// For regular (non-custom) instructions, this can realistically only return values between 1 and 11. However for D3DSIO_COMMENT this can return arbitrarily large DWORD counts up to 2^15 DWORD's.
const unsigned GetInstructionDWORDCount(const instructionToken* const baseToken, const ShaderInfo& inDXShaderInfo)
{
	const srcParameterToken* sourceTokens[4] = {0};
	const dstParameterToken* destToken = NULL;

	opcodeDisplayType currentOpcodeType = GetOpcodeDisplayType( (const D3DSHADER_INSTRUCTION_OPCODE_TYPE)baseToken->opcode);
	switch (baseToken->opcode)
	{
	case _D3DSIO_LABEL:
		currentOpcodeType = srcOnly;
		break;
	case _D3DSIO_DCL:
		currentOpcodeType = srcDst; // Technically this is dstDst, but it's okay, we're only using this to figure out the instruction size anyway
		break;
	case _D3DSIO_SINCOS:
		if (inDXShaderInfo.shaderMajorVersion < 3)
			currentOpcodeType = srcSrcSrcDst;
		else
			currentOpcodeType = srcDst;
		break;
	case _D3DSIO_DEFB:
		currentOpcodeType = srcDst;
		break;
	case _D3DSIO_DEFI:
		currentOpcodeType = srcSrcSrcSrcDst;
		break;
	case _D3DSIO_DEF:
		currentOpcodeType = srcSrcSrcSrcDst;
		break;
	case _D3DSIO_TEX:
		if (inDXShaderInfo.shaderMajorVersion < 2)
		{
			if (inDXShaderInfo.shaderMinorVersion < 4)
			{
				currentOpcodeType = dstOnly; // ps1.1, ps1.2, ps1.3
			}
			else
			{
				currentOpcodeType = srcDst; // ps1.4
			}
		}
		else
		{
			// SM2.0+:
			currentOpcodeType = srcSrcDst;
		}
		break;
	case _D3DSIO_PHASE:
		currentOpcodeType = justOpcode;
		break;
	case _D3DSIO_END:
		currentOpcodeType = justOpcode;
		break;
	}

	unsigned relativeTokens = 0;
	switch (currentOpcodeType)
	{
default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown opcode! Maybe corrupted D3D9 shader bytecode?
#endif
	case justOpcode:
		break;
	case srcOnly:
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 1);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case srcSrcOnly:
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 1);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[1] = (const srcParameterToken* const)(baseToken + 2 + relativeTokens);
		if (sourceTokens[1]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case dstOnly:
		destToken = (const dstParameterToken* const)(baseToken + 1);
		if (destToken->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case srcDst:
		destToken = (const dstParameterToken* const)(baseToken + 1);
		if (destToken->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 2 + relativeTokens);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case srcSrcDst:
		destToken = (const dstParameterToken* const)(baseToken + 1);
		if (destToken->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 2 + relativeTokens);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[1] = (const srcParameterToken* const)(baseToken + 3 + relativeTokens);
		if (sourceTokens[1]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case srcSrcSrcDst:
		destToken = (const dstParameterToken* const)(baseToken + 1);
		if (destToken->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 2 + relativeTokens);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[1] = (const srcParameterToken* const)(baseToken + 3 + relativeTokens);
		if (sourceTokens[1]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[2] = (const srcParameterToken* const)(baseToken + 4 + relativeTokens);
		if (sourceTokens[2]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
		destToken = (const dstParameterToken* const)(baseToken + 1);
		if (destToken->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[0] = (const srcParameterToken* const)(baseToken + 2 + relativeTokens);
		if (sourceTokens[0]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[1] = (const srcParameterToken* const)(baseToken + 3 + relativeTokens);
		if (sourceTokens[1]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[2] = (const srcParameterToken* const)(baseToken + 4 + relativeTokens);
		if (sourceTokens[2]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		sourceTokens[3] = (const srcParameterToken* const)(baseToken + 5 + relativeTokens);
		if (sourceTokens[3]->GetRelativeAddressingType() & D3DSHADER_ADDRMODE_RELATIVE)
			++relativeTokens;
		break;
	case customOpcode:
		break;
	}

	// These special instructions are not allowed to have any relative tokens:
	switch (baseToken->opcode)
	{
	case _D3DSIO_LABEL:
	case _D3DSIO_DCL:
	case _D3DSIO_DEFB:
	case _D3DSIO_DEFI:
	case _D3DSIO_DEF:
		relativeTokens = 0;
		break;
	}

	switch (currentOpcodeType)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown opcode type! Maybe corrupted D3D9 shader bytecode?
#endif
	case justOpcode:
		return 1; // Opcode
	case srcOnly:
		return 2 + relativeTokens;
	case srcSrcOnly:
		return 3 + relativeTokens;
	case dstOnly:
		return 2 + relativeTokens;
	case srcDst:
		return 3 + relativeTokens;
	case srcSrcDst:
		return 4 + relativeTokens;
	case srcSrcSrcDst:
		return 5 + relativeTokens;
	case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
		return 6 + relativeTokens;
	case customOpcode:
		if (baseToken->opcode == _D3DSIO_COMMENT)
		{
			const DWORD commentToken = *(const DWORD* const)baseToken;
			const unsigned numTokensToSkip = (commentToken & D3DSI_COMMENTSIZE_MASK) >> D3DSI_COMMENTSIZE_SHIFT;
			return 1 + numTokensToSkip;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Unknown custom opcode!
#endif
			return 1;
		}
	}
}
