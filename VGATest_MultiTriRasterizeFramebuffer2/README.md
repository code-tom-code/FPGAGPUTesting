# VGATest_MultiTriRasterizeFramebuffer2

[![FPGA Video Card Demo (Video)](http://img.youtube.com/vi/SlVchI4Mr8E/0.jpg)](https://youtu.be/SlVchI4Mr8E)

Click the image above to see this video in action!

This project aimed to implement many parts of a SWTNL video card. It rasterizes a mesh of triangles (from a vertex buffer and index buffer) into a framebuffer in BRAM, performs perspective-corrected texcoord interpolation, and even performs bilinear texture sampling from a texture in ROM. It also has two different triangle pipelines running in parallel, a hardware block for clearing rectangles on the framebuffer to a given color, scrolling texture coordinates, multiple FIFO queues so that different parts could run at different rates, and read and write arbiters that control access to the single-ported framebuffer (yielding priority from the renderer to the scan-out unit).
