# CPUDrivenGPUTest4 Hardware

### Network Protocol Packet Processor (NETPKT)

The network protocol packet processor is responsible for managing the custom reliable UDP network session protocol. It runs the session state machine and handles packet ACK's and resends, and unpacks packets from packet batches to be delivered to the FIFO of incoming commands for the [Command Processor](#Command-Processor-CMD) to consume.

### Ethernet Controller (ETH)

The Ethernet Controller handles the lower level layers of network packet processing. It automatically computes Ethernet CRC32's, IPv4 checksums, and UDP checksums and will also discard packets that are not addressed to the local MAC or IPv4 address. It will also drop UDP packets that do not begin with the proper magic header byte. It also automatically handles ARP announcements and handles ARP request replies.

### Command Processor (CMD)

The Command Processor is the brain of the GPU. It runs in one of two modes - either in "single packet" mode processing one packet at a time from the [Packet Processor](#Packet-Processor-PKT), or in "command list" mode executing a command list out of DRAM. The Command Processor is also responsible for managing every other GPU system through state-setting commands (via [State Blocks](#State-Blocks-STATE) ), draw commands, and barriers. The Command Processor additionally monitors the GPU systems for "idle" signals and can wait for one or more of these idle signals before proceeding.

### State Blocks (STATE)

State Blocks store a small, system-specific amount of GPU state that is versioned with a draw call ID so that the different parts of the GPU pipeline can all operate efficiently in parallel. The [Command Processor](#Command-Processor-CMD) is responsible for programming the State Block for each system that needs to have its GPU state change at runtime.

### Memory Controller (MEM)

The Memory Controller arbitrates read and write requests for the GPU's main DDR4 DRAM. It is connected to its consumer systems through request/response FIFO queues. The Memory Controller system runs at the DDR4 DRAM interface clock domain at 1333 / 4 = 333.25MHz (this is for DDR4-2666 DRAM).

### Vertex Batch Builder (VBB)

The Vertex Batch Builder reads in indices from the index buffer and constructs batches of up to 16 vertices (depending on the size of the draw call and the primitive topology) to send to the Shader Core for vertex processing.

### Shader Core (SHADER)

The Shader Core takes (up to 16) index batches from the Vertex Batch Builder and loads input vertex data based on the indices through a pretransformed vertex cache (using multiple vertex streams) from GPU DRAM and uses a loaded shader program to execute shader instructions to produce output processed vertices, which are then sent to the [Input Assembler](#Input-Assembler-IA) for primitive assembly. In the course of shading, the Shader Core uses four floating-point ALU ("FPU") units in a SIMD-fashion as well as a register file, constant buffer cache, and instruction cache. Currently the Shader Core only handles vertex shading - pixel processing is still the domain of the Texture Sampler, Attribute Interpolator, and ROP units all in fixed-function. More info on the custom shader instruction set can be found [here](ShaderISA.md).

### Input Assembler (IA)

The Input Assembler assembles primitives (currently Triangle Lists, Triangle Strips, and Triangle Fans are supported) from the transformed vertices and indices output by the vertex shader to pass the assembled primitives along to the [Triangle Setup](#Triangle-Setup-TRISETUP) unit. It can also cull degenerate triangles if all three triangle vertices have identical indices or identical vertex positions, as well as cull backfacing triangles according to the programmable backfacing modes (CULL_CW, CULL_CCW, or CULL_NONE).

### Clip Unit (CLIP)

The Clip Unit performs viewport plane culling as well as clipping (if necessary). Its job is to ensure that all triangles that pass it are well-formed and do not extend beyond the guard band limits. Depending on the triangles, the Clip Unit may output more or fewer triangles than it receives as input.

### Triangle Setup (TRISETUP)

Triangle Setup pre-computes per-triangle data given to it by the [Input Assembler](#Input-Assembler-IA). Triangle Setup also performs division-by-W and the Viewport Transform. It also performs culling of triangles that are less than 1 pixel in area, or backfacing triangles. Surviving triangles have their pre-computed data passed to the [Rasterizer](#Rasterizer-RAST).

### Rasterizer (RAST)

The Rasterizer rasterizes triangles into pixels. It also calculates per-pixel triangle barycentric coordinates to be sent to the [Depth Interpolator](#Depth-Interpolator-DINTERP) and [Attribute Interpolator](#Attribute-Interpolator-INTERP) that are needed for texture coordinate, vertex color, pixel Z depth, and pixel W-value interpolation.

### Depth Interpolator (DINTERP)

The Depth Interpolator computes pixel Z depth and also pixel W values interpolated across the triangle using barycentric coordinates from the [Rasterizer](#Rasterizer-RAST). If depth-stencil testing is enabled, then the interpolated pixel depth values are passed to the Depth Tester for depth testing. Otherwise, the depth test is assumed to pass, and the pixel W value is passed on to the [Attribute Interpolator](#Attribute-Interpolator-INTERP) unit.

### Depth/Stencil Tester (DEPTH)

The Depth/Stencil Tester unit owns and manages the depth/stencil buffer SRAM memory (currently hardcoded to 640x480 @ D24S8) and the depth/stencil buffer compression metadata. This unit also performs per-pixel depth+stencil testing (if depth/stencil testing are enabled) and also handles depth/stencil writing into the depth/stencil buffer. If the pixel fails the depth or stencil tests, then it is discarded and its data is not passed on to the next stage. This may result in various test-fail or test-pass stencil operations which update the stencil buffer.

### Attribute Interpolator (INTERP)

The Attribute Interpolator computes texture coordinate and vertex color values interpolated across the triangle using barycentric coordinates from the [Rasterizer](#Rasterizer-RAST). It also performs perspective-correction on the interpolated values using the given per-pixel W values. The interpolated texture coordinates are passed along to the [Texture Sampler](#Texture-Sampler-TEXSAMP) unit.

### Texture Sampler (TEXSAMP)

The Texture Sampler is in charge of reading texel data into the texture cache, as well as performing point-sampled or bilinear-filtered texture sampling using interpolated texture coordinates from the previous [Attribute Interpolator](#Attribute-Interpolator-INTERP) stage. The resulting sampled texel color values are then combined using a simple register combiner (one for color channels and another one for alpha channel) with the input interpolated vertex color to produce a simple shaded pixel. This shaded pixel is then passed to the [ROP](#ROP-ROP) unit.

### ROP (ROP)

The ROP is responsible for combining the incoming shaded pixel data from the [Texture Sampler](#Texture-Sampler-TEXSAMP) with the framebuffer color. It can perform any of the blend ops (ADD/SUB/RSUB/MIN/MAX) and any of the blend source modes supported by D3D9 (including SEPARATE_ALPHA_BLEND). Dual source color blending is not yet supported as we don't yet support MRT. The ROP unit caches recently-written pixels and makes sure to read and write them to memory in whole DRAM-lines (256 bits/32 bytes) in order to maximize DRAM bandwidth.

### Scanout (SCANOUT)

Scanout is meant to read pixel data from the framebuffer and send it out over VGA/DVI/HDMI to the attached monitor. It also generates the VSYNC and HSYNC signals and controls timing and HDMI framing. Currently only 640x480@60Hz@32bpp is supported. Due to interfacing with the external monitor hardware, the Scanout unit needs to run on its own clock domain (251.25MHz) that is separate from the main GPU core.

### Clear Block (CLEAR)

The Clear Block simply performs framebuffer clears to a solid color given to it by the [Command Processor](#Command-Processor-CMD). This is a separate block so that the [Command Processor](#Command-Processor-CMD) unit isn't waiting idle on memory writes to finish before it can begin reading and queuing up new packets.

### Stats (STAT)

The Stats block collects timing and counter statistics from all of the other blocks for performance monitoring by the driver. It can write the statistics data out to DRAM which can then later be read back by the driver from the CPU.
