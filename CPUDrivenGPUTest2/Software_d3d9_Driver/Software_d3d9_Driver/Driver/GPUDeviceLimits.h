#pragma once

/*
	The current GPU device has limits that are different than the usual D3D9 limits. Let's define those limits here in one place to keep things clean.
*/

// We only have 3 bits for vertex stream indices, so we can only have 8 of them in total
const constexpr unsigned GPU_MAX_NUM_VERTEX_STREAMS = 8;

// Our vertex offset addressing hardware operates with a 6-bit offset, so we can only offset up to 63 DWORD's. Same thing for vertex element strides.
const constexpr unsigned GPU_MAX_VERTEX_ELEMENT_OFFSET_DWORDS = (64 - 1);
const constexpr unsigned GPU_MAX_VERTEX_ELEMENT_STRIDE_DWORDS = (64 - 1);
const constexpr unsigned GPU_MAX_VERTEX_ELEMENT_OFFSET_BYTES = GPU_MAX_VERTEX_ELEMENT_OFFSET_DWORDS * sizeof(DWORD);
const constexpr unsigned GPU_MAX_VERTEX_ELEMENT_STRIDE_BYTES = GPU_MAX_VERTEX_ELEMENT_STRIDE_DWORDS * sizeof(DWORD);

// We currently only support 16-bit indices and so can only index up to 64k elements per vertex stream
const constexpr unsigned GPU_MAX_VERTEX_ELEMENTS_PER_VERTEX_STREAM = 0xFFFF;

const constexpr unsigned GPU_MAX_VERTEX_BUFFER_SIZE_BYTES = GPU_MAX_VERTEX_ELEMENT_STRIDE_BYTES * GPU_MAX_VERTEX_ELEMENTS_PER_VERTEX_STREAM;

// Vertex shader limits:
const constexpr unsigned GPU_SHADER_MAX_NUM_GPR_REG = 8; // The number of r# available to the shader
const constexpr unsigned GPU_SHADER_MAX_NUM_INPUT_REG = 8; // The number of v# available to the shader
const constexpr unsigned GPU_SHADER_MAX_NUM_OUTPUT_REG = 8; // The number of o# available to the shader
const constexpr unsigned GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG = 256; // The number of c# available to the shader
const constexpr unsigned GPU_SHADER_MAX_NUM_SPECIAL_REG = 8; // The number of x# available to the shader

const constexpr unsigned GPU_SHADER_MAX_NUM_INSTRUCTIONS = 512; // The longest shader we can load (including the END token) is this many instruction tokens
