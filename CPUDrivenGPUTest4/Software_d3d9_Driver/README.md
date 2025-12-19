# Software_D3D9_Driver

Wraps the D3D9 API and performs the functions of a usermode GPU driver. Vertex shading is now performed on the GPU, which drastically reduces CPU-GPU bandwidth compared to the prior SWTnL implementation. This driver is heavily based on the existing Software_D3D9 codebase for a functional software-rasterized D3D9 renderer. Much more documentation can be found [there](https://github.com/code-tom-code/Software_D3D9).

## Authors

* **Tom Lopes** - *Initial work* - [code-tom-code](https://github.com/code-tom-code)
