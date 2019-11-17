# VGATest5

<img src="https://github.com/code-tom-code/FPGAGPUTesting/blob/master/VGATest5/IMG_2780.JPG"></img>

This project was my first attempt at making a barycentric-test triangle rasterizer. I succeeded in porting over the core of the rasterization logic from the [Software_D3D9](../../../Software_D3D9) project's triangle rasterizer and was able to draw one static triangle for this project, as well as visualize the plane conditions in different colors. It is worth noting that all of the rasterizer constants for this project were completely hard-coded and precomputed on a PC (not computed dynamically on the FPGA) so this triangle rasterizer design could only ever draw this one triangle.
