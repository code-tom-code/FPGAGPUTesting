// This is the interface for a reverse shader compiler, which translates native GPU shader bytecode back into D3D9 shaders again.

#pragma once

LPD3DXBUFFER ReverseCompileShaderToD3D9Bytecode(const void* const shaderHeader, const void* const shaderTokensStart, const unsigned shaderTokensLength);
