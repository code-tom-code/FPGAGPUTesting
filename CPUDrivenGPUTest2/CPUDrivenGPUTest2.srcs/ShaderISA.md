# Shader ISA

## Device ISA Overview

The ShaderCore in each device executes a custom instruction set. Each instruction may read from 0 to 2 arguments and writes to 1 argument.
ShaderCore executes in waves of 16 lanes arranged in a 4x4 pattern with four quads (each quad comprised of four lanes). Each ShaderCore also has four SIMD units which can each process one ALU operation per cycle per pipe.
ALU ops are submitted for one of each of the four lane quads on each cycle. In this way, every four cycles one instruction will be submitted for all 16 lanes in the wave.

|                      |                      |
|:--------------------:|:--------------------:|
| Quad 0 / Cycle N     | Quad 1 / Cycle N + 1 |
| Quad 2 / Cycle N + 2 | Quad 3 / Cycle N + 3 |

## Instruction Set Supported By ShaderCore

| Index | Opcode        | Latency | Pipe | Source Args | Dest Args | Description |
|:-----:|:-------------:|:-------:|:----:|:-----------:|:---------:|:-----------:|
| 0     | NOP           | 1       | NONE | 0           | 0         | NOP does nothing. |
| 1     | MOV           | 1       | CMP  | 1           | 1         | MOV moves between two registers. |
| 2     | ADD           | 4       | ADD  | 2           | 1         | ADD adds two float32's together. |
| 3     | MUL           | 5       | MUL  | 2           | 1         | MUL multiplies two float32's together. |
| 4     | MIN           | 1       | CMP  | 2           | 1         | MIN finds the lesser of two float32's. |
| 5     | MAX           | 1       | CMP  | 2           | 1         | MAX finds the greater of two float32's. |
| 6     | RCP           | 14      | SPEC | 1           | 1         | RCP calculates 1.0f / x for a float32. |
| 7     | FRC           | 3       | CNV  | 1           | 1         | FRC calculates the fractional part of a float32. |
| 8     | EXP           | NotImpl | SPEC | 1           | 1         | EXP calculates 2.0f ^ x for a float32. |
| 9     | LOG           | NotImpl | SPEC | 1           | 1         | LOG calculates log2(x) for a float32. |
| 10    | RSQ           | NotImpl | SPEC | 1           | 1         | RSQ calculates 1.0f / sqrt(x) for a float32. |
| 11    | SLT           | 1       | CMP  | 2           | 1         | SLT computes if the first arg is less than the second arg. |
| 12    | SGE           | 1       | CMP  | 2           | 1         | SGE computes if the first arg is greater or equal to the second arg. |
| 13    | SGN           | 1       | CMP  | 1           | 1         | SGN returns the sign of the float32 arg (or 0 for a zero value). |
| 14    | Unused        | NotImpl | NONE | 0           | 0         | Unused. |
| 15    | RND_SINT23NE  | 3       | CNV  | 1           | 1         | RND_SINT23NE rounds the given float32 to a signed 23-bit integer (using round-to-nearest) placed into the low 23 bits of the result register. |
| 16    | RND_SINT16NE  | 3       | CNV  | 1           | 1         | RND_SINT16NE rounds the given float32 to a signed 16-bit integer (using round-to-nearest) placed into the low 16 bits of the result register. |
| 17    | CNV_UNORM16   | 3       | CNV  | 1           | 1         | CNV_UNORM16 saturates, and then converts the given float32 to a UNORM16 placed into the low 16 bits of the result register. |
| 18    | CNV_UNORM8    | 3       | CNV  | 1           | 1         | CNV_UNORM8 saturates, and then converts the given float32 to a UNORM8 placed into the low 8 bits of the result register. |
| 19    | SHFT          | 1       | SHFT | 1           | 1         | SHFT performs quick (one-cycle) multiplies or divides by 2x, 4x, 8x, or 16x. |
| 20    | BSHFTL8       | 1       | BIT  | 1           | 1         | BSHFTL8 computes the bit-shift (x << 8) as an int32/uint32. |
| 21    | BSHFTL16      | 1       | BIT  | 1           | 1         | BSHFTL16 computes the bit-shift (x << 16) as an int32/uint32. |
| 22    | BSHFTL24      | 1       | BIT  | 1           | 1         | BSHFTL24 computes the bit-shift (x << 24) as an int32/uint32. |
| 23    | BSHFTR8       | 1       | BIT  | 1           | 1         | BSHFTR8 computes the bit-shift (x >> 8) as an int32/uint32. |
| 24    | BSHFTR16      | 1       | BIT  | 1           | 1         | BSHFTR16 computes the bit-shift (x >> 16) as an int32/uint32. |
| 25    | BSHFTR24      | 1       | BIT  | 1           | 1         | BSHFTR24 computes the bit-shift (x >> 24) as an int32/uint32. |
| 26    | OR            | 1       | BIT  | 2           | 1         | OR computes the bitwise-OR of the two arguments (arg1 | arg2). |
| 27    | AND           | 1       | BIT  | 2           | 1         | AND computes the bitwise-AND of the two arguments (arg1 & arg2). |
| 28    | CNV_F_TO_HALF | 3       | CNV  | 1           | 1         | CNV_F_TO_HALF converts a float32 to a float16, placed into the lower 16 bits of the result register. |
| 29    | CNV_HALF_TO_F | 3       | CNV  | 1           | 1         | CNV_HALF_TO_F converts a float16 (assumed to be in the low 16 bits of the source register) to a float32. |
| 30    | CNV_U32_TO_F  | 3       | CNV  | 1           | 1         | CNV_U32_TO_F converts a uint32 to a float32. |
| 31    | END           | 1       | NONE | 0           | 0         | END finishes a shader program and waits for all writes to flush. This must always be the last instruction. |

## Instruction Modifiers (Supported on all instructions)

### Source Modifiers

| Source Modifier | Symbol | Description |
|:---------------:|:------:|:-----------:|
| (None)          |        | Normal read |
| Negate          |    -   | Inverts the sign of the read value (assumes float32) |
| Abs             |   abs  | Takes the absolute value of the read value (assumes float32) |
| NegAbs          |  -abs  | Forces the read value to be negative (assumes float32) |

### Dest Modifiers

| Dest Modifier   | Symbol | Description  |
|:---------------:|:------:|:------------:|
| (None)          |        | Normal write |
| Saturate        |   sat  | Clamps the value before writing between 0.0f and 1.0f (assumes float32) |

## ShaderCore Registers

| Register Type   | RegID  | Count   |Readable?  | Writeable? | Description  |
|:---------------:|:------:|:-------:|:---------:|:----------:|:------------:|
| Temp. GPR       | r#     |  8      | Yes       | Yes        | Temporary GPR registers can be used for any purpose. |
| Input Reg       | v#     |  8      | Yes       | No         | Input registers contain data rom the vertex buffers that is assembled from the vertex streams according to the vertex declaration. |
| Const Reg       | c#     |  256    | Yes       | No         | Const registers are constants set from the command processor. They cannot be modified by the shader. |
| Special Reg     | x#     |  8      | Yes       | Yes        | Special registers that may be used for special purposes. They may also be used as extra temp. GPR's. |
| Output Reg      | o#     |  8      | Yes       | Yes        | These registers are the only ones that get exported to the Triangle Setup stage from the vertex shader. |
| Zero (0) Reg    | 0      |  1      | Yes       | No         | This read-only register just contains zero (0.0f or 0x00000000). |
| One (1) Reg     | 1      |  1      | Yes       | No         | This read-only register just contains one (1.0f or 0x3F800000). |
| NegOne (-1) Reg | -1     |  1      | Yes       | No         | This read-only register just contains negative one (-1.0f or 0xCF800000). |
| NULL Reg        | NULL   |  1      | No        | Yes        | This write-only register discards writes (writes do nothing). |

## Table of Supported/Unsupported D3D Shader Instructions

| D3D Shader Instruction                                                                     | Release Version | VS | PS | Supported By Shader Compiler | Converted ISA |
|:------------------------------------------------------------------------------------------:|:---------------:|:--:|:--:|:----------------------------:|:-------------:|
| [abs](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/abs---vs)               | vs_2_0/ps_2_0   | Y  | Y  | Yes                          | MOV dest, src0_abs |
| [add](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/add---vs)               | vs_1_0/ps_1_0   | Y  | Y  | Yes                          | ADD dest, src0, src1 |
| [break](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/break---vs)           | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [break_comp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/break-comp---vs) | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [breakp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/breakp---vs)         | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [call](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/call---vs)             | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [callnz](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/callnz-bool---vs)    | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [callnzp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/callnz-pred---vs)   | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [cmp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/cmp---ps)               | ps_1_2          | N  | Y  | No                           | Unsupported (PS only) |
| [crs](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/crs---vs)               | vs_2_0/ps_2_0   | Y  | Y  | Yes                          | MUL, MUL, ADD, MUL, ADD, MUL, ADD |
| [dp2add](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dp2add---ps)         | ps_2_0          | N  | Y  | Yes                          | MUL, ADD, ADD |
| [dp3](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dp3---vs)               | vs_1_1/ps_1_1   | Y  | Y  | Yes                          | MUL, ADD, ADD |
| [dp4](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dp4---vs)               | vs_1_1/ps_1_2   | Y  | Y  | Yes                          | MUL, ADD, ADD |
| [dst](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dst---vs)               | vs_1_1          | Y  | N  | Yes                          | MOV, MUL, MOV, MOV |
| [dsx](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dsx---ps)               | ps_2_x          | N  | Y  | No                           | Unsupported (PS only) |
| [dsy](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dsy---ps)               | ps_2_x          | N  | Y  | No                           | Unsupported (PS only) |
| [else](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/else---vs)             | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [endif](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/endif---vs)           | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [endloop](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/endloop---vs)       | vs_2_0/ps_3_0   | Y  | Y  | No                           | Unsupported (flow control) |
| [endrep](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/endrep---vs)         | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [exp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/exp---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | EXP dest, src0 |
| [expp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/expp---vs)             | vs_1_1          | Y  | N  | Yes                          | EXP dest, src0 |
| [frc](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/frc---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | FRC dest, src0 |
| [if](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/if-bool---vs)            | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [ifc](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/if-comp---vs)           | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [ifp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/if-pred---vs)           | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [lit](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/lit---vs)               | vs_1_1          | Y  | N  | Yes                          | SLT, MUL, MUL, LOG, MUL, EXP, MUL, MOV |
| [log](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/log---vs)               | vs_1_1/ps_2_x   | Y  | Y  | Yes                          | LOG dest, src0 |
| [logp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/logp---vs)             | vs_1_1          | Y  | N  | Yes                          | LOG dest, src0 |
| [loop](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/loop---vs)             | vs_2_0/ps_3_0   | Y  | Y  | No                           | Unsupported (flow control) |
| [lrp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/lrp---vs)               | vs_2_0/ps_1_1   | Y  | Y  | Yes                          | ADD, MUL, ADD |
| [m3x2](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/m3x2---vs)             | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, MUL, ADD, ADD |
| [m3x3](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/m3x3---vs)             | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, MUL, ADD, ADD, MUL, ADD, ADD |
| [m3x4](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/m3x4---vs)             | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, MUL, ADD, ADD, MUL, ADD, ADD, MUL, ADD, ADD |
| [m4x3](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/m4x3---vs)             | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, ADD, MUL, ADD, ADD, ADD, MUL, ADD, ADD, ADD |
| [m4x4](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/m4x4---vs)             | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, ADD, MUL, ADD, ADD, ADD, MUL, ADD, ADD, ADD, MUL, ADD, ADD, ADD |
| [mad](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/mad---vs)               | vs_1_1/ps_1_1   | Y  | Y  | Yes                          | MUL, ADD |
| [max](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/max---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MAX dest, src0, src1 |
| [min](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/min---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | MIN dest, src0, src1 |
| [mov](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/mov---vs)               | vs_1_0/ps_1_0   | Y  | Y  | Yes                          | MOV dest, src0 |
| [mova](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/mova---vs)             | vs_2_0          | Y  | N  | Yes                          | RND_SINT23NE dest, src0 |
| [mul](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/mul---vs)               | vs_1_0/ps_1_0   | Y  | Y  | Yes                          | MUL dest, src0, src1 |
| [nop](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/nop---vs)               | vs_1_0/ps_1_0   | Y  | Y  | Yes                          | NOP |
| [nrm](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/nrm---vs)               | vs_2_0/ps_2_0   | Y  | Y  | Yes                          | MUL, ADD, ADD, RSQ, MUL, MUL |
| [pow](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/pow---vs)               | vs_2_0/ps_2_0   | Y  | Y  | Yes                          | LOG, MUL, EXP, MOV |
| [rcp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/rcp---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | RCP dest, src0 |
| [rep](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/rep---vs)               | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [ret](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/ret---vs)               | vs_2_0/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [rsq](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/rsq---vs)               | vs_1_1/ps_2_0   | Y  | Y  | Yes                          | RSQ dest, src0 |
| [setp_comp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/setp-comp---vs)   | vs_2_x/ps_2_x   | Y  | Y  | No                           | Unsupported (flow control) |
| [sge](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sge---vs)               | vs_1_1          | Y  | N  | Yes                          | SGE dest, src0, src1 |
| [sgn](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sgn---vs)               | vs_2_0          | Y  | N  | Yes                          | SGN dest, src0 |
| [sincos](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sincos---vs)         | vs_2_0/ps_2_0   | Y  | Y  | No                           | Unsupported. Would be: MUL, MUL, MUL, MUL, ADD, MUL, MUL, ADD, ADD, MUL, ADD, ADD |
| [slt](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/slt---vs)               | vs_1_1          | Y  | N  | Yes                          | SLT dest, src0, src1 |
| [sub](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/sub---vs)               | vs_1_1/ps_1_1   | Y  | Y  | Yes                          | ADD dest, src0, -src1 |
| [texkill](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texkill---ps)       | ps_1_1          | N  | Y  | No                           | Unsupported (PS only) |
| [tex/texld](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texld---ps-2-0)   | ps_1_1          | N  | Y  | No                           | Unsupported (PS only) |
| [texldb](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texldb---ps)         | ps_2_0          | N  | Y  | No                           | Unsupported (PS only) |
| [texldd](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texldd---ps)         | ps_2_x          | N  | Y  | No                           | Unsupported (PS only) |
| [texldl](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texldl---ps)         | vs_3_0/ps_3_0   | Y  | Y  | No                           | Unsupported (PS only) |
| [texldp](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/texldp---ps)         | ps_2_0          | N  | Y  | No                           | Unsupported (PS only) |
