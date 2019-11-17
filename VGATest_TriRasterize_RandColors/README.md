# VGATest_TriRasterize_RandColors

[![FPGA Triangle Rasterization Demo (Video)](http://img.youtube.com/vi/sc5wHCUzTl4/0.jpg)](https://youtu.be/sc5wHCUzTl4)

Click the image above to see this video in action!

This project is the first to use dynamic triangle rasterization, in this case sourced from a few XORShift PRNGs (which were very simple to implement on an FPGA) that generates one random triangle per frame. These triangles are then written into a BRAM framebuffer, which is then scanned out to the screen.
