#pragma once

#include "..\Software_d3d9_Driver\ShaderAnalysis.h"

// Big note for now - these structs *do not* take into account relative addressing tokens!
// Currently, relative addressing isn't supported by the hardware, so that's somewhat okay to not handle that.
// But in the future we'll want something even more flexible to handle relative addressing.
union aliasedInstructionTokens
{
	struct _justOpcode
	{
		instructionToken instruction;
	} justOpcode;

	struct _srcOnly
	{
		instructionToken instruction;
		srcParameterToken src0;
	} srcOnly;

	struct _srcSrcOnly
	{
		instructionToken instruction;
		srcParameterToken src0;
		srcParameterToken src1;
	} srcSrcOnly;

	struct _dstOnly
	{
		instructionToken instruction;
		dstParameterToken dst;
	} dstOnly;

	struct _srcDst
	{
		instructionToken instruction;
		dstParameterToken dst;
		srcParameterToken src0;
	} srcDst;

	struct _srcSrcDst
	{
		instructionToken instruction;
		dstParameterToken dst;
		srcParameterToken src0;
		srcParameterToken src1;
	} srcSrcDst;

	struct _srcSrcSrcDst
	{
		instructionToken instruction;
		dstParameterToken dst;
		srcParameterToken src0;
		srcParameterToken src1;
		srcParameterToken src2;
	} srcSrcSrcDst;

	struct _srcSrcSrcSrcDst
	{
		instructionToken instruction;
		dstParameterToken dst;
		srcParameterToken src0;
		srcParameterToken src1;
		srcParameterToken src2;
		srcParameterToken src3;
	} srcSrcSrcSrcDst;
};

// Memcpy helper for DWORD tokens
void MemcpyTokens(const instructionToken* const copySourceBaseStartingToken, const unsigned DWORDTokenCount, anyToken* const copyDestination);

// Rebases all of the instruction start pointers in the given vector to be offset from the newBasePtr
void RebaseInstructionStartPointers(std::vector<const instructionToken*>& outRebaseInstructionStartPtrs, const anyToken* const newBasePtr);

// "Unbases" the given pointer from being an absolute pointer offset from 0x0 to being a relative pointer offset from basePtr. Returns the unbased pointer.
const instructionToken* const GetUnbasedInstructionStartPointer(const anyToken* const instructionStartPtr, const anyToken* const basePtr);

// Copies all of the tokens for an instruction (instruction token, dst token, src tokens, relative addressing tokens, etc.) from one token stream to another
void CopyInstructionToNewInstructionStream(std::vector<anyToken>& outCopyDestInstructionStream, std::vector<const instructionToken*>& outCopyDestUnbasedInstructionStartPtrs, const instructionToken* const inCopySrcInstruction, const ShaderInfo& inDXShaderInfo);

// Helper functions for appending an instruction/srcParameter/dstParameter token to a token stream:
void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const instructionToken& inAppendToken);
void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const srcParameterToken& inAppendToken);
void AppendNewTokenToTokenStream(std::vector<anyToken>& outTokenStream, const dstParameterToken& inAppendToken);

// Appends a new unbased instruction start pointer to the end of the outInstructionStartPtrs assuming that the new instruction will be inserted to the end of the tokenStream after calling this function
void AppendNewInstructionStartToTokenStartPtrs(std::vector<const instructionToken*>& outInstructionStartPtrs, const std::vector<anyToken>& tokenStream);

// Helper functions for copying an existing instruction/srcParameter/dstParameter token to a token stream:
const instructionToken CopyExistingInstructionToken(const ShaderInfo& inDXShaderInfo, const instructionToken existingInstructionToken);
const dstParameterToken CopyExistingDestParameterToken(const ShaderInfo& inDXShaderInfo, const dstParameterToken existingDestToken);
const srcParameterToken CopyExistingSourceParameterToken(const ShaderInfo& inDXShaderInfo, const srcParameterToken existingSrcToken);

// Returns true if the dst and src register are the same (same register type and same register index)
const bool RegistersAreSame(const dstParameterToken destReg, const srcParameterToken srcReg);

// Gets the index of the first set write channel in the writemask
const unsigned char GetFirstWriteChannelIndex(const dstParameterToken destReg);

// Helper function to extract one specific channel's source swizzle given a full source swizzle:
const debuggableSwizzleChannel GetSourceSwizzleChannelHelper(const debuggableFullSwizzle fullSourceSwizzle, const unsigned char channelIndex);

// Returns how many DWORD's this instruction consumes, *including* the instructionToken itself. So this function can never return 0, it can only return numbers 1 and up.
// For regular (non-custom) instructions, this can realistically only return values between 1 and 11. However for D3DSIO_COMMENT this can return arbitrarily large DWORD counts up to 2^15 DWORD's.
const unsigned GetInstructionDWORDCount(const instructionToken* const baseToken, const ShaderInfo& inDXShaderInfo);
